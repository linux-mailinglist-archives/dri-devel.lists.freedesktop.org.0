Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFFD6BF69
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 18:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507516E0DB;
	Wed, 17 Jul 2019 16:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0976E0DB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 16:02:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id f9so25394799wre.12
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 09:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=an0nA6kIwMbJnlH8rLyesrrNXdXbhHr83FXFZgy9a30=;
 b=U4wmYaDajpfJ7q5qzlm22IDkLToR0qaT1cwi0W44B1MsovspLvKoyUAdybmJ+ZB/qh
 rw2z+bYJxKZF0vg+2q7/C3a1Cjsry591M1INIAcnGxeDVR3A2bLs8ujr4kneN11siU6n
 TiamxfPRsLGTmaSVZ2xX/otNOS4FnLb1JX5jqwYHok4ceyh0EILdAA3YoXzHCQmWwoeR
 6PzRYo1QApgjO4p0f9WAK8ZtGfYT2NMbTnM+2myfy8urLf4xtVSQVhFCCAgLfoaLrlju
 z+CFHWbA6quOeCslQux6ry3rGgYxuMuanZ2fH80Dp7xD6dSaVE70evqebqrEj4agqeW3
 fY0w==
X-Gm-Message-State: APjAAAUcebrHhEUNfVCRgNAyRL8OcH/U33E99Z6W85bEnD8wHJvP83Zn
 DkiDtsBn/jLmz+a9Zzsocq6ZrM+bbic=
X-Google-Smtp-Source: APXvYqz68gnd2ZPomzF2D6HUcn6sS2BkK50wjI3LCRmLh46bQdXVezUgC8ipQykmUXHFYB02Fnilew==
X-Received: by 2002:adf:80e1:: with SMTP id 88mr42729251wrl.127.1563379348903; 
 Wed, 17 Jul 2019 09:02:28 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id b5sm20674954wru.69.2019.07.17.09.02.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 09:02:28 -0700 (PDT)
Date: Wed, 17 Jul 2019 16:02:22 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Message-ID: <20190717160222.GA474@freedom>
References: <bug-109955-502@http.bugs.freedesktop.org/>
 <bug-109955-502-9DPWq7HQjD@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-109955-502-9DPWq7HQjD@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=an0nA6kIwMbJnlH8rLyesrrNXdXbhHr83FXFZgy9a30=;
 b=azx9umVRfMpCarldCfHDkhM2D/aHWSXlq5b4P4BSFlbzoKLGX64PatH1/+7evWJSf5
 9x5irRGU90I++e587IkGSQx61aSrQ13spantDI0jACEZDk9xz3eF/WdY8zDBiliOXxBh
 +oLPX98CuZA/QGPrhmstbdzpiazbk9ViFXGKxribc1OHOFuU9FtsqXsFMMgfO0kMQLeK
 8GHFD90kiEh7uIwZND3cNmDvfZzB1vBawBPBTIbUZtfr5gLo8kNDMmhgliouS2mQm0b5
 n/EJ2wzEAi/KAwF/aHA+/082j5TR77PaBnEcoXbeV9kIFdf2vRsiZwx3QqrzZjk7SD9P
 7zdg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cG93ZXIgbWFuYWdlbWVudCByZWxhdGVkIGNvZGUgaXMgaW4gYW1kZ3B1LCB0aGVuIHRoZSByaWdo
dCBwbGFjZSBpcyBoZXJlLCB0aGUgImRyaSIgYW5kCiJhbWRnZngiIG1haWxpbmcgbGlzdHMgKGFr
YSBsaW51eCBncHUgZHJpdmVyIG1haWxpbmcgbGlzdHMpLgoKQXMgZmFyIGFzIEkgYW0gY29uY2Vy
bmVkLCB3aGVuIEkgcGxheSBkb3RhMiwgSSBhbHdheXMgc3dpdGNoIHRoZSBHUFUgZHBtIHRvCmhp
Z2ggYW5kIHRoZSBDUFUgZnJlcSBnb3Zlcm5vciB0byBwZXJmIChiZWNhdXNlLCBhbGwgdGhvc2Ug
dGhpbmdzIHN0ZWFsIGEKc2lnbmlmaWNhbnQgYW1vdW50IG9mIGZwcy4uLiBhY3R1YWxseSwgSSBk
byBzd2l0Y2ggbXkgR1BVIGRwbSB0byBoaWdoIGp1c3QgaW4KY2FzZSBpdCB3b3VsZCBiZSBuYXN0
eSBsaWtlIHRoZSBjcHUgZ292ZXJub3IpLgoKLS0gClN5bHZhaW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
