//
//  ViewController.swift
//  Challenge2
//
//  Created by Marko Zivanovic on 13.3.21..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    
    var score = 0
    var correctAnswer = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 0.5
        button2.layer.borderWidth = 0.5
        button3.layer.borderWidth = 0.5
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Guess \(countries[correctAnswer].uppercased()) flag Score: \(score)"
        // TASK 1. Try showing the player’s score in the navigation bar, alongside the flag to guess.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct answer"
        } else {
            score -= 1
            title = "Wrong! That is the flag of \(countries[sender.tag].uppercased())"
            //TASK 3. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}

