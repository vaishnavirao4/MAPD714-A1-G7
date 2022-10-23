/**App Name: Calculator
Version: 2.0
Created on: 08-10-2022
 
 
Created by:
 
 
Krishna Patel 301268911
Vaishnavi Santhapuri 301307031
Kowndinya Varanasi 301210621
 


Description:
This is a Calculator App that will be used to calculate the basic
arithmetic operations such as addition, subtraction, multiplication, division and percentages.  */

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "NULL"
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLbl: UILabel!
    
    var currentNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Loads the view onto the screen
        resultLbl.text = "0"
    }
    
    // This is the function for the numbered button
    @IBAction func NumberBtnPressed(_ sender: UIButton) {
        if currentNumber.count <= 9
        {
            currentNumber += "\(sender.tag)"
            resultLbl.text = currentNumber
        }
    }
    
    // This is the function for backspace button
    @IBAction func BackSpaceBtnPessed(_ sender: UIButton) {
            if (!resultLbl.text!.isEmpty)
            {
                if (resultLbl.text!.count == 1)
                {
                    resultLbl.text = "0"
                }
                else
                {
                    resultLbl.text?.removeLast()
                }
            }
        }
    
        // This is the function for clear button
    @IBAction func ClearBtnPressed(_ sender: UIButton) {
        currentNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        resultLbl.text = "0"
    }
    
        // This is the function for decimal button
    @IBAction func DotBtnPressed(_ sender: UIButton) {
        if currentNumber.count <= 7
        {
            currentNumber += "."
            resultLbl.text = currentNumber
        }
    }
    
    // This is the function for equal button
    @IBAction func EqualBtnPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    
    // This is the function for addition button
    @IBAction func AddBtnPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    // This is the function for subtraction button
    @IBAction func SubtractBtnPressed(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    
    // This is the function for multiplication button
    @IBAction func MultiplyBtnPressed(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
    // This is the function for division button
    @IBAction func DivideBtnPressed(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    // This is the function for percentage button
    @IBAction func PercentageBtnPressed(_ sender: UIButton) {
        currentNumber = "\(Double(currentNumber)! / 100 )"
        result = currentNumber
        resultLbl.text = result
    }
    
    // This is the function for toggling between the negative and positive value
    @IBAction func PlusMinusBtnPressed(_ sender: UIButton) {
            currentNumber = "\(Int(currentNumber)! * -1)"
            result = currentNumber
            resultLbl.text = result
        
    }
    
    @IBAction func RandomBtnPressed(_ sender: UIButton) {
        let randomNumber = Double.random(in:0...0.99)
        currentNumber = "\(randomNumber)"
        resultLbl.text = "\(randomNumber)"
    }
    
    @IBAction func SqrBtnPressed(_ sender: UIButton) {
        result = "\(pow(Double(currentNumber)!, 2))"
        resultLbl.text = result
    }
    
    @IBAction func SqrootBtnPressed(_ sender: UIButton) {
        result = "\(sqrt(Double(currentNumber)!))"
        resultLbl.text = result
    }
    
    @IBAction func PiBtnPressed(_ sender: UIButton) {
        currentNumber = "\(Double.pi)"
        resultLbl.text = "\(Double.pi)"
    }
    
    @IBAction func SinBtnPressed(_ sender: UIButton) {
        result = "\(sin(Double(currentNumber)! * Double.pi / 180))"
        resultLbl.text = result
    }
    
    @IBAction func CosBtnPressed(_ sender: UIButton) {
        result = "\(cos(Double(currentNumber)! * Double.pi / 180))"
        resultLbl.text = result
    }
    
    @IBAction func TanBtnPressed(_ sender: UIButton) {
        result = "\(tan(Double(currentNumber)! * Double.pi / 180))"
        resultLbl.text = result
    }
    
    
    // This is the function when we make a selection of arithmetic operators
    func operation(operation: Operation) {
        if currentOperation != .NULL
        {
            if currentNumber != ""
            {
                rightValue = currentNumber
                currentNumber = ""
                
                if currentOperation == .Add
                {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }
                else if currentOperation == .Subtract
                {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }
                else if currentOperation == .Multiply
                {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }
                else if currentOperation == .Divide
                {
                    result = String(format:"%.8f",((Double(leftValue)! / Double(rightValue)!)))
                }
              
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0)
                {
                    result = "\(Int(Double(result)!))"
                }
                resultLbl.text = result
            }
            currentOperation = operation
        }
        else
        {
            leftValue = currentNumber
            currentNumber = ""
            currentOperation = operation
        }
    }
    
}
