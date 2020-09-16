Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF9D26BB81
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 06:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF466E979;
	Wed, 16 Sep 2020 04:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0189C6E979
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 04:28:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id e23so8361849eja.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 21:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ig8ZHYie0JwgEJ8BKaC/vopU266glaXRzF+TPFSf2vU=;
 b=kJHJ6tTuxRL4KTrpv9uId2tyQwfnhru+ovvs13O3YloQpTzc6EpKVBQriQ0Q3pW0/U
 Q7PYYxZmEWILKEmafjEhttnLmKeHtp/xSbWKe6VEBGqBqZuT491emYe9YRQFRAMR8kft
 mdMP9Z2JOr2Rae4XH1qSMy+P+l9zyaMVaA/1li8O31pLlsZycN36rh2WCsgv7aZgCl6c
 LyaC5R6y2QjDuvbK1ZQJqHdYXyWjPrLNzUuji4h4pcYAD3t3Ma0M4QMgPzFTQhkgQxQR
 FzjhpiO+mTYl6HaUpaM14PN8Q1NpmQVpoIl5xDfGwH9OFFqxVm1j3Vi15iQBLlBV6IK1
 qjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ig8ZHYie0JwgEJ8BKaC/vopU266glaXRzF+TPFSf2vU=;
 b=WRfLkNoULx7c3FCfBieYeBuoY62/YMXVWInVdaZvZJxxWa6sehI5AMG2mOwa2+jSm8
 guKNAgBdomAOAHhEcUQ3f4CJxjhRBhQq5CTzvnrzOOGUKbu82wlWXcOXs2xeddGW+Prz
 FPCPmlf1Qw7I8X+zVzef46/OsQhlGoRuq8X0s9eEFx8VGjUqyQ8HRlNVJPMaXlEH6wS/
 yprPNd8XDT8IE2PcdMZM5c+lmGV90ZxExVOfLmv8EAy1JANTx+fxE93lSlADr0Ov/FXd
 QWlXp5Y3TxYbNAF+3IJYdUXO1mKja3YCE4xZEcFuYXhjxb/o1ZM4L5oCdobTohJIIr8L
 W6xA==
X-Gm-Message-State: AOAM533k5/pTgTRtJFb35X9pVWeDLriX29dCc5eZNySRKoJXOjxORoc1
 8llLCfOvts3NdQSdhV43bMLqOb4/t6RYNuJD9ZY=
X-Google-Smtp-Source: ABdhPJwNV/X7SCkL6FgK49JYqtsBQDAeL+IexwtfNWKfHqUsr/QCReJz08Oyr0l9N3mxUDchMRjTDf7krQCSdxGxI5Y=
X-Received: by 2002:a17:906:813:: with SMTP id
 e19mr23066052ejd.101.1600230497604; 
 Tue, 15 Sep 2020 21:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txcrHC77Quj6ufUHn0FD1-7b4YKO2MWFZGwJy8Tmj1i7g@mail.gmail.com>
 <6b59373e-c4e0-76b5-ffa7-d4bb954a1ffb@gmail.com>
 <CAPM=9tzXsGqnbkUH30vUHd7zyenCNj=ikVjx6P1qWq9dx0jiEg@mail.gmail.com>
In-Reply-To: <CAPM=9tzXsGqnbkUH30vUHd7zyenCNj=ikVjx6P1qWq9dx0jiEg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 16 Sep 2020 14:28:05 +1000
Message-ID: <CAPM=9tySxEnV+1q=hyu4c5tSX35ZJr6TBKwfnUkQZbuw=XkrLA@mail.gmail.com>
Subject: Re: some half-baked ttm ideas
To: "Koenig, Christian" <christian.koenig@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNiBTZXAgMjAyMCBhdCAxNDoxOSwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwu
Y29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMTYgU2VwIDIwMjAgYXQgMDA6MTIsIENocmlzdGlhbiBL
w7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IEhpIERhdmUsCj4gPgo+ID4gSSB0aGluayB3ZSBzaG91bGQganVzdCBjb21wbGV0ZWx5IG51a2Ug
dHRtX3R0X2JpbmQoKSBhbmQgdHRtX3R0X3VuYmluZCgpCj4gPiBhbmQgYWxsIG9mIHRoYXQuCj4g
Pgo+ID4gRHJpdmVycyBjYW4gdG8gdGhpcyBmcm9tIHRoZWlyIG1vdmVfbm90aWZ5KCkgY2FsbGJh
Y2sgbm93IGluc3RlYWQuCj4KPiBHb29kIHBsYW4sIEkndmUgcHV0IGEgYnVuY2ggb2YgcmV3b3Jr
IGludG8gdGhlIHNhbWUgYnJhbmNoLAo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL2FpcmxpZWQvbGlu
dXgvY29tbWl0cy90dG0taGFsZi1iYWtlZC1pZGVhcwo+Cj4gYnV0IEkndmUgZnJpZWQgbXkgYnJh
aW4gYSBiaXQsIEknbSBoYXZpbmcgdHJvdWJsZSByZWNvbmNpbGluZyBtb3ZlCj4gbm90aWZ5IGFu
ZCB1bmJpbmRpbmcgaW4gdGhlIHJpZ2h0IHBsYWNlcywgSSBmZWVsIGxpa2UgSSdtIGNpcmNsaW5n
Cj4gYXJvdW5kIHRoZSBhbnN3ZXIgYnV0IGhhdmVuJ3QgaGl0IGl0IHlldC4KCmRybS90dG06IGFk
ZCB1bmJpbmQgdG8gbW92ZSBub3RpZnkgcGF0aHMuCgpJbiB0aGF0IHRyZWUgaXMgaW5jb3JyZWN0
IGFuZCBJIHRoaW5rIHdoZXJlIHRoaW5ncyBmYWxsIGFwYXJ0LCBzaW5jZQppZiB3ZSBhcmUgbW92
aW5nIFRUTSB0byBWUkFNIHRoYXQgd2lsbCB1bmJpbmQgdGhlIFRUTSBvYmplY3QgZnJvbSB0aGUK
R1RUIGF0IG1vdmUgbm90aWZ5IHRpbWUgYmVmb3JlIHRoZSBtb3ZlIGhhcyBleGVjdXRlZC4KCkkn
bSBmZWVsaW5nIGEgbW92ZV9jb21wbGV0ZV9ub3RpZnkgbWlnaHQgYmUgYW4gaWRlYSwgYnV0IEkn
bSB3b25kZXJpbmcKaWYgaXQncyBhIGJhZCBpZGVhLgoKRGF2ZS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
