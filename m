Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F88561C93
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 11:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570BE89C1A;
	Mon,  8 Jul 2019 09:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C06A89AB5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 09:50:40 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v15so4682361wml.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 02:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RCS74G4sWvvy+46uSGZJ6oJZbabt972OuIz8Sp1gZEE=;
 b=Ay6UOEB/g3wUVGPIt18WdBC5eX/PbzjR7KWNTfW2PBjPIACSqLrQmSs+XPOLUjDSMR
 82GyGH3At13MTynatFqeaW3yyi12GKG0n4RvLbRIb2N+NJ+TUvHzPDZM/RSeOD6qFUWC
 UoZ6oJmnXxIWFjdLSjT1R4Lzndd6f2++09QgL1j+RHzBRtKV3JaeU+gW85zATDmMxjLl
 06wp2GzmIlpyrFHU293PtVjfsyLNLFUpiomBtji2Emf1SWwyf2yuqMMTkufJ4nkVfPMS
 xHxVp4uLGAV4dYNlkvixrdP3yMklUfspqqgp0uwJuEI3h0mXtsqceYxyjCvX9s4hMwXA
 pfXA==
X-Gm-Message-State: APjAAAXUEp1X1Hzx6bAGFQIgA5EoNSjlGnvVtX81h3qZ6sZ31yvFN7ik
 5u8xAg3KMmXHIdiaajw5c7vf6ngcje0=
X-Google-Smtp-Source: APXvYqwhXZRuKJa+zFhVDKStT/vnzm0nb/53O8HbFn8m1WjIdRJ5yF8NLGLBbEhiE85Tse2BR0wVbA==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr16715792wmc.62.1562579438647; 
 Mon, 08 Jul 2019 02:50:38 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id l13sm12030264wrt.16.2019.07.08.02.50.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 02:50:38 -0700 (PDT)
Date: Mon, 8 Jul 2019 09:49:50 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@freedesktop.org
Subject: Re: [Bug 111082] Severe stutter in CS:GO surf servers, despite ~300fps
Message-ID: <20190708094950.GA375@freedom>
References: <bug-111082-502@http.bugs.freedesktop.org/>
 <bug-111082-502-KUJpDXlUH9@http.bugs.freedesktop.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-111082-502-KUJpDXlUH9@http.bugs.freedesktop.org/>
User-Agent: Mutt/ (2018-04-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RCS74G4sWvvy+46uSGZJ6oJZbabt972OuIz8Sp1gZEE=;
 b=t23TUC9YUaIzpD/fRHZpp8P3WSfkyb71NcjDIoHekkaoKvYMWJtvdRP8WMRno7E1Ms
 LG+eyLRwGoSF5FKBbm6Pj9xtyF+1qvKQUYr3dnI7TfsH73czYDxIFSs/ActFWNTNvOWx
 yVNG8bfpVVB+rLNJeFoKLTm6KiyM50ZUKDYI9OU+7fm00KWpUEw9kBJP601yjBU7v+Xg
 l5PeHdZGgh7V3hf1w7FASwKvaLq1IfndvXy3QdsBhylfPHV6ppIpT88g99r3B/6NSMhq
 4hQC2jOAwhJll1vERAgxR1txmzd/YV0CBNRc0di2IAwKoXjEKRNPvlaxM4jYNfOYQyfM
 OeTg==
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

T24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMDM6MjA6NDRBTSArMDAwMCwgYnVnemlsbGEtZGFlbW9u
QGZyZWVkZXNrdG9wLm9yZyB3cm90ZToKPiBIb3cgaXMgdGhpcyBub3QgYSBncmFwaGljcyBkcml2
ZXIgYnVnPwoKSGUgbWVhbnQgaXQgY291bGQgYmUgYSBnYW1lIGVuZ2luZSBidWcgKG5ldHdvcmsg
b3IgM0QsIHZlcnkgcHJvYmFibHkpLgoKWW91IGFyZSBib3RoIHJpZ2h0LgoKQ1NHTyAzRCBlbmdp
bmUgb24gYmFzZWQgbGludXggT1NlcyBpcyByZWFsbHkgYmFkIGlmIHlvdSB1c2UgbWFwcyB3aGlj
aCBhcmUgbm90CmluIHRoZSBjb21wZXRpdGl2ZSBzZXQuCgpGb3IgaW5zdGFuY2UsIGRhbmdlciB6
b25lIG9wZW4gbWFwcywgb24gbXkgc3lzdGVtLCBoYXZlIGRpc2FzdHJvdXMKcGVyZm9ybWFuY2Uu
Li4gYW5kIGl0IGlzIENQVSByZWxhdGVkLCBub3QgR1BVLCBldmVuIHRob3VnaCBJIGhhdmUgOCBj
b3JlIGF0CjQuN0doeiAoc29tZXRoaW5nIGlzIHJlYWxseSB3cm9uZyBvciBsaXR0ZXJhbHkgQ1BV
IGNhcHBlZCBzb21ld2hlcmUpLgoKLS0gClN5bHZhaW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
