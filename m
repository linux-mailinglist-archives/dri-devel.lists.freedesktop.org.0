Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DCD2249B8
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 09:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AF06E0F2;
	Sat, 18 Jul 2020 07:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9986E0F2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 07:51:29 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id q15so6017003vso.9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ol96rwAngE4odLPyEbjU3p7Hh5rHnjhWvgnwYPrfaKg=;
 b=R2bxpYEASe+r+QUccmnUqsT4ZFONV06Mac3r446kgV3guYqtT8JwYMC8ZgmansU+4P
 uSeSHC3CPrNbAPFXSWLAczbLYUeceLYp6YqiJJxx5QpXI0DxR4CE7EUmbqqmCIHqEa6R
 pOvA0kDCXPgtyBrSLMrZCHNS7cMXCAc3IVSEiP6V0g0EfCQimj9m9bG3GeGcGkHUcszV
 2rlbd6Oy6VrLBYhQVyM1R4JU9mgAsHtUX1ihs2tmm4HTUaDFTNKHkw8hGWqsjw43Wboh
 r7smH3EcRON4u916lSVojY+AySZ7o8r9Ui2ZwkD/InI+sx9W1z9jiaJSK20eKGXutdzL
 FPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ol96rwAngE4odLPyEbjU3p7Hh5rHnjhWvgnwYPrfaKg=;
 b=TrBWNR3h/ThxhEOpvn6Itl53LO/FTOum8CUb/UEohejQpi0dlB1v9yPGPvbP210985
 XDp7SD1dmTn9mXb+/uSP6VhzxcrNk9hVjLO0p13ciwKejjAbBdlBK/yiNKSCzEcLa7JU
 KP0JnVkW6N4JtIKJQM5U+jjg7LrS10pH9brIgmwP9le3wlEwhjL/wNPquvYEMhyQdqvQ
 VUjJDu5WXXsoFylBUUH6N3ZbZ/JBpd+MjtXFoY/ysFYSfJpHL4fbkzTz3jhPFPQRWQ0t
 UzV8xDqbXss+cZcLr/Yig43NVp//r2Xu4swQn1UTOhDRIr83wMzhhBo8CRyK2yaL5Aav
 cp3A==
X-Gm-Message-State: AOAM530gcxYopS2vFQjyb3yl/ANZ7q5BaC2tMVBGLED6nYuKLFQfh8ki
 i537aBKcdK5SMweff2JnzowrhO91e4MiY/kk8mNdP4i3
X-Google-Smtp-Source: ABdhPJyHBlq9VHrkjeomyJ2XehTZtpubhTwBPp29BwNjm+nkFi6LYdkPG8DOhMF+8q91Rq/7LeaZUalCim/RTlWouJY=
X-Received: by 2002:a05:6102:3039:: with SMTP id
 v25mr9671895vsa.48.1595058688345; 
 Sat, 18 Jul 2020 00:51:28 -0700 (PDT)
MIME-Version: 1.0
From: suyash singh <suyashsingh234@gmail.com>
Date: Sat, 18 Jul 2020 13:20:51 +0530
Message-ID: <CAMD8gkHCp0DL2KnTmVesGvkNYGpWwwcJY0y=s4Erj_LW11Oiuw@mail.gmail.com>
Subject: Introduction and queries
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
Content-Type: multipart/mixed; boundary="===============2012512197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2012512197==
Content-Type: multipart/alternative; boundary="00000000000083c89305aab28a83"

--00000000000083c89305aab28a83
Content-Type: text/plain; charset="UTF-8"

I think my first email got blocked if I understand the archives correctly.

Hello everyone, I am Suyash Singh from India. I am a second year
undergraduate computer science student. I want to participate in Xorg EVOC.

As I see on https://www.x.org/wiki/SummerOfCodeIdeas/
most of the projects are done with C/C++ both of which have been a major
part of my curriculum for the last 4 years (school + college).

1) Which ones are the preferred/important projects?
2) How do I begin understanding the project?
3) What do I need to learn?

My resume:
https://drive.google.com/drive/u/0/folders/1j28k6LAlGMrMO5NkQ9KspW3lo8DOUY8C

--00000000000083c89305aab28a83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think my first email got blocked if I understand the arc=
hives correctly.<div><br></div><div>Hello everyone, I am Suyash Singh from =
India. I am a second year undergraduate computer science student. I want to=
 participate in Xorg EVOC.=C2=A0<div><br></div><div>As I see on=C2=A0<a hre=
f=3D"https://www.x.org/wiki/SummerOfCodeIdeas/" target=3D"_blank">https://w=
ww.x.org/wiki/SummerOfCodeIdeas/</a></div><div>most of the projects are don=
e with C/C++ both of which have been a major part of my curriculum for the =
last 4 years (school + college).</div><div><br></div><div>1) Which ones are=
 the preferred/important projects?</div><div>2) How do I begin understandin=
g the project?</div><div>3) What do I need to learn?</div></div><div><br></=
div><div>My resume:=C2=A0<a href=3D"https://drive.google.com/drive/u/0/fold=
ers/1j28k6LAlGMrMO5NkQ9KspW3lo8DOUY8C">https://drive.google.com/drive/u/0/f=
olders/1j28k6LAlGMrMO5NkQ9KspW3lo8DOUY8C</a></div></div>

--00000000000083c89305aab28a83--

--===============2012512197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2012512197==--
