//
//  AppExtensions.swift
//  Eat_Time
//
//  Created by Simin Liu on 9/8/15.
//  Copyright (c) 2015 Simin Liu. All rights reserved.
//

import Foundation
import CoreFoundation
import UIKit

extension Int{
    var isEven:Bool     {return (self % 2 == 0)}
    var isOdd:Bool      {return (self % 2 != 0)}
    var isPositive:Bool {return (self >= 0)}
    var isNegative:Bool {return (self < 0)}
    var toDouble:Double {return Double(self)}
    var toFloat:Float   {return Float(self)}
    
    var digits:Int {//this only works in bound of LONG_MAX 2147483647, the maximum value of int
        if(self == 0)
        {
            return 1
        }
        else if(Int(fabs(Double(self))) <= LONG_MAX)
        {
            return Int(log10(fabs(Double(self)))) + 1
        }
        else
        {
            return -1; //out of bound
        }
    }
}

extension String{
    var length:Int {return count(self)}
    
    func containsString(s:String) -> Bool
    {
        if(self.rangeOfString(s) != nil)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func containsString(s:String, compareOption: NSStringCompareOptions) -> Bool
    {
        if((self.rangeOfString(s, options: compareOption)) != nil)
        {
            return true
        }
        else
        {
            return false
        }
    }
}

//UIView
extension UIView{
    var width:      CGFloat { return self.frame.size.width }
    var height:     CGFloat { return self.frame.size.height }
    var size:       CGSize  { return self.frame.size}
    
    var origin:     CGPoint { return self.frame.origin }
    var x:          CGFloat { return self.frame.origin.x }
    var y:          CGFloat { return self.frame.origin.y }
    var centerX:    CGFloat { return self.center.x }
    var centerY:    CGFloat { return self.center.y }
    
    var left:       CGFloat { return self.frame.origin.x }
    var right:      CGFloat { return self.frame.origin.x + self.frame.size.width }
    var top:        CGFloat { return self.frame.origin.y }
    var bottom:     CGFloat { return self.frame.origin.y + self.frame.size.height }
    
    func setWidth(width:CGFloat)
    {
        self.frame.size.width = width
    }
    
    func setHeight(height:CGFloat)
    {
        self.frame.size.height = height
    }
    
    func setSize(size:CGSize)
    {
        self.frame.size = size
    }
    
    func setOrigin(point:CGPoint)
    {
        self.frame.origin = point
    }
    
    func setX(x:CGFloat) //only change the origin x
    {
        self.frame.origin = CGPointMake(x, self.frame.origin.y)
    }
    
    func setY(y:CGFloat) //only change the origin x
    {
        self.frame.origin = CGPointMake(self.frame.origin.x, y)
    }
    
    func setCenterX(x:CGFloat) //only change the origin x
    {
        self.center = CGPointMake(x, self.center.y)
    }
    
    func setCenterY(y:CGFloat) //only change the origin x
    {
        self.center = CGPointMake(self.center.x, y)
    }
    
    func roundCorner(radius:CGFloat)
    {
        self.layer.cornerRadius = radius
    }
    
    func setTop(top:CGFloat)
    {
        self.frame.origin.y = top
    }
    
    func setLeft(left:CGFloat)
    {
        self.frame.origin.x = left
    }
    
    func setRight(right:CGFloat)
    {
        self.frame.origin.x = right - self.frame.size.width
    }
    
    func setBottom(bottom:CGFloat)
    {
        self.frame.origin.y = bottom - self.frame.size.height
    }
    
    func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}

extension NSDate{
    func daysInBetweenDate(date: NSDate) -> Double
    {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/86400)
        return diff
    }
    
    func hoursInBetweenDate(date: NSDate) -> Double
    {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/3600)
        return diff
    }
    
    func minutesInBetweenDate(date: NSDate) -> Double
    {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/60)
        return diff
    }
    
    func secondsInBetweenDate(date: NSDate) -> Double
    {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }
}

extension UIImageView{
    func roundImage()
    {
        //height and width should be the same
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2;
    }
}

extension UIImage{
    func croppedImage(bound : CGRect) -> UIImage
    {
        var scaledBounds : CGRect = CGRectMake(bound.origin.x * self.scale, bound.origin.y * self.scale, bound.size.width * self.scale, bound.size.height * self.scale)
        var imageRef = CGImageCreateWithImageInRect(self.CGImage, scaledBounds)
        var croppedImage : UIImage = UIImage(CGImage: imageRef, scale: self.scale, orientation: UIImageOrientation.Up)!
        return croppedImage;
    }
}