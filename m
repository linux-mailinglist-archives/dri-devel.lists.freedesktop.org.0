Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D88111F84C
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 16:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A5489C97;
	Sun, 15 Dec 2019 15:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D4989C97
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 15:14:46 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id i15so5551803oto.7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 07:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SK0gdcZMu8HMgbeQqaR4tH/36w1UO9njq9E8e3YGlgE=;
 b=hZhMeHAL9HPbigSj7QfO2KL/wDP8g8ytWtYEUjeAzpvcxG3Tcm2aw/Haw23UUt1dWp
 KTj4p3S34kyrrUDWEYiTts+O7JQmNIXqwkKk9yicqeSwRvaqc6/r5TL/v0QQNIl3RmOb
 YF1HR7uRPEAtO/0oGy7FLIrLsI3Rzgvh1iS5/+qbGScmYmemUF3UYHpxVmgjCbTnBG9A
 NARE88bicgvL/p9I53eZNhC8SItEfuPAVurzLTtcdkyGO0l6NZmCfqZf2IOSedFxo3Yn
 t7Bmo9bAkzsjMSnOK64U7s55a6VZ5CJ61nksos0x7UNxfjiN4LR2TPLrW1ysvI5I62Kw
 dgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SK0gdcZMu8HMgbeQqaR4tH/36w1UO9njq9E8e3YGlgE=;
 b=WDYO0WrD/yCm5O62S2tvZgfj/dRDl0d2zFcS7iwEbA1lPN/9SWnfw7KH14ZBpH6NDu
 hi4DV3KR3mK1DEvBve5n5pxBZj+qtZYYh7vHcY1KRKbn8+wdq/8/Wx8Th5fLiq9mG01j
 4s7XYAIdV4GHFqmCWYfx/TEZ2HBTlwjR+zBmE1DasKZzSpa+EJHmRaSPrh1leumAKe7O
 zE1LIm2kJGJIGz6hsgxFX7SPxQDiPNu1HEl46nnYnPaOC7rt0JnYxTgiNKLk9POfjwUe
 mAHRcqOZuBwMKyjBmthALEej8OzXqCR+svRubJDncDGqpdEYTozJEq6ADxh8tNPV7Yhq
 jF1w==
X-Gm-Message-State: APjAAAVlP+uDZ1gI4hfNbs89bsENZZvtMWzvWwpWJIJXVqY2/mSgtwZ3
 g89+vlBEmk2MULpLPl60sHCM43QQkCAII10RO9M/9Q==
X-Google-Smtp-Source: APXvYqznhqitmiH/adb7x6SIW81uB77rWUXzkhvIgsii2GOZQbGfpc3yn+XTCNg0tm1JQW5+iPmoh+tMZKFVx1vCgoE=
X-Received: by 2002:a9d:65cf:: with SMTP id z15mr27750646oth.238.1576422885049; 
 Sun, 15 Dec 2019 07:14:45 -0800 (PST)
MIME-Version: 1.0
From: Andy Ng <andreas2025@gmail.com>
Date: Sun, 15 Dec 2019 15:14:34 +0000
Message-ID: <CAAVaN8y8UBGx-GDwVwry9oUAzZPD0b7E5NE3HknUBng7PL0dyw@mail.gmail.com>
Subject: dri and screen casting.
To: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello List,

I am using 4.9 kernel on an embedded system with an imx6 processor.
For GPU driver I am using etnaviv and fb emulation. The application I
am using is based on Qt 5.6.

Two cards are created card0 and card1 where card0 is the VGA and card1
the GPU. A /dev/fb0 is created to emulate the fbdev.

I would like to use VNC server library and get the QT UI over the
network. The fb0 device is not updated by the Qt as needed. I think
newer versions have plunging to work with kms and fb0.

If I use x11vnc it does not have any support for dir and kms. but it
may be able to read from memory areas.

I have tried evdi.ko libevdi but it is not working - very poor implementation.

Is there any idea how to do a basic vnc using dri - I don't have any
x11 or wayland on the target. the application is quite minimal, full
root access.

I was thinking to dump the fb from the dri to fb0 manually every
20msec. But I am not sure about efficiency. My  screen size is 800x480
8bbp.


Any advice would be appreciated,
Kind regards
Andreas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
