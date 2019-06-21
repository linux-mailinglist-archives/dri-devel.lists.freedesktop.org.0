Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754974ED83
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 18:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934EA6E8FD;
	Fri, 21 Jun 2019 16:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1323D6E8FD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 16:58:29 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id i21so6593549ljj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqgwigxeGvjK7xvfQe9Dvq5Cf0ZDiG37Tc57yFWJcMQ=;
 b=RWtCI3TYCE+4fo4nLjB1kivCFUje4mKYR9N01uObHjkQOfuVk0Pc3hSTtaypEY9qTU
 4aYQu0XtS2kZLugHssw3yyhk0qpNDOX4y1bWJNyJixGKG+aAkU9Os+vQx30l6O17sCqx
 EpCwcAUNqVSv/b6H0/g/TI6kNlpKn/j9TmnAckf454v7pP66+TWlT0YhovsKVV5rovvx
 HcY433YrXP+YxV9HT55YPbwlZgqleoCgp7P1Ardci3H4eiKkd8QMe0DIXfLB9E8Ve9Ws
 kcNS+HXGYSjDgM1tLDYPPFsW882ufiDp2v9GsWZcqEcJ0QXvIXPcwDbFI2bX9hUAePf5
 gg1w==
X-Gm-Message-State: APjAAAWexuIS3eVWnhTENPKpZRXLDu0DO5OT9VNaO/DiI1cOkMdMg5nj
 H0+3C9oAhjA5S2aHPSzNTowpiGUCJjE=
X-Google-Smtp-Source: APXvYqxz8f2t9Ly5HS2Lm5ooZdunZieAOvTSHG8a/FNsZ/uEPfjPCGVadM6+xsOBpiUC2IfDXKLTOg==
X-Received: by 2002:a2e:6313:: with SMTP id x19mr65373927ljb.25.1561136307180; 
 Fri, 21 Jun 2019 09:58:27 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id q22sm475606lje.75.2019.06.21.09.58.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 09:58:26 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id b11so5586144lfa.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 09:58:26 -0700 (PDT)
X-Received: by 2002:a19:f808:: with SMTP id a8mr5270618lff.29.1561136306025;
 Fri, 21 Jun 2019 09:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyM7BRfAwruJ4QsY_gMCGVHxS=ag7cNA1H304zcnAFK+A@mail.gmail.com>
In-Reply-To: <CAPM=9tyM7BRfAwruJ4QsY_gMCGVHxS=ag7cNA1H304zcnAFK+A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Jun 2019 09:58:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wifNAnkd+bXfoNWXO1K5NQ8Tr+Hc13SgaBXU3RoQB7Pwg@mail.gmail.com>
Message-ID: <CAHk-=wifNAnkd+bXfoNWXO1K5NQ8Tr+Hc13SgaBXU3RoQB7Pwg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.2-rc6
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qqgwigxeGvjK7xvfQe9Dvq5Cf0ZDiG37Tc57yFWJcMQ=;
 b=HLPSctb6nl32d222OwEgCE8oXMwKKjmA5QJ5svDz1qmhQDBKuR4ch/qK2amWcD9BAr
 nwk3pIDezfn/h8eg4B6mI5VTRVMWDjnPVhM5AN5msZa2mEd0pBEChghfh/EjDx6RAgZM
 MFQltZWhYR0PlHn4Nr0+9mdGGZV+iUXEPTUNM=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgOToyMSBQTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gSnVzdCBjYXRjaGluZyB1cCBvbiB0aGUgd2VlayBzaW5jZSBiYWNr
IGZyb20gaG9saWRheXMsIGV2ZXJ5dGhpbmcKPiBzZWVtcyBxdWl0ZSBzYW5lLgoKLi4gd2VsbCwg
ZXhjZXB0IGZvciBhbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZyBpdHNlbGYsIHdoaWNoIHNlZW1zIHZl
cnkKc2ljayBpbmRlZWQuCgpEb2VzIGl0IHdvcmsgZm9yIHlvdT8gSSdtIGdldHRpbmcgYSBjb25u
ZWN0aW9uIHJlc2V0LCBubyBkYXRhLgoKICAgICAgICAgICAgICAgTGludXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
