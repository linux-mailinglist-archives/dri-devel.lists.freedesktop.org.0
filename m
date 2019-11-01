Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A2EC915
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 20:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C5E6E2CF;
	Fri,  1 Nov 2019 19:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD936E2CF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 19:32:05 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 77so4842344oti.12
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 12:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xga0s6dMP01gptMlxj5T3WD/q3JgkmmpoSrSoRKCVTo=;
 b=Qtkz0f9JHz81xBcxLLa5fDC9TDRyJ2G7kPVn0EBweKMyLk+QralGWRI20gkamKHRZb
 5lGQyHnpz4y0mEIjgNdjOAn8IRQzbxMhmVlG7CC1qOLJxD+heznwQbd5VEZI8CUEdEyw
 v99iwXUL07URz1AdYiC3aZTastmI9XTK26qpqqDaXAeCgTqPcih+EETTi1j2D612TbFd
 l1YfHzjgnGEDCcu6SK7XC0O42+ieOo6Vsr4MuIQRV/G1S/Z7OwBe9cCFjrOseVqD9PPw
 fL8VgoyecIuwMMewEyXbs7DaGCIlWsR7D4wBWaV4O4OIYjFQs+NO8mxHEDe0otn1gir9
 GjwA==
X-Gm-Message-State: APjAAAU5GG1N/TGGIINZCMAq7o2v/2qZOUsPhvu+JDoxVZe1cWevclhh
 JIB/yXYsthtgsziTwoZIESHX2yG3BV9/QRmIe9RN6Q==
X-Google-Smtp-Source: APXvYqwcZFGOOUlvfBAU9/xpQJ5SSF84qCl7+6EAszgXMaxKapGh7e27oRBCUBYwmnaVXSNAvFFMJtauaQj68ndvTds=
X-Received: by 2002:a05:6830:ca:: with SMTP id
 x10mr9263008oto.221.1572636724497; 
 Fri, 01 Nov 2019 12:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191031110736.GD26612@mwanda>
In-Reply-To: <20191031110736.GD26612@mwanda>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 1 Nov 2019 12:31:53 -0700
Message-ID: <CALAqxLUtnZsw0q_5JFtyVjbnxeMUTND=Vt8XgS44iQ_n391XFQ@mail.gmail.com>
Subject: Re: [bug report] dma-buf: heaps: Add heap helpers
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Xga0s6dMP01gptMlxj5T3WD/q3JgkmmpoSrSoRKCVTo=;
 b=DS7c53x72NR/jkcxNJ7bewZE4UtF+rm1X5nCAAJ4uw5Im95tKPXiH2PB8fmBRXj3TW
 kOR9EJKDu5061SKuYxPZ4m5qYqE3+Me48Do9D/q1EaXbrHFkww5M8ixLmmOV2wiovebf
 vb/GYCZMPHXj7aDzhN+joVSOcUt0Ymk8Cw+cfWrVku5IaGKdZjCA3Zrtl/fDFIFl905I
 DHdhJ72aSDEEztruENzkw6qbv3IyjgqjDlyIW99SfzcAi8AZXiRgMC2pSN9T0y9UvmYK
 Y4GfTTQMywt/9hinuQhdKdqhQ3zNGLY66QZeIK9Vshd0Tl/APtmonGqHdjEZ4hXg48r1
 kkXA==
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgNDowNyBBTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+IFRoZSBwYXRjaCA3Yjg3ZWE3MDRmZDk6ICJkbWEtYnVm
OiBoZWFwczogQWRkIGhlYXAgaGVscGVycyIgZnJvbSBPY3QKPiAyMSwgMjAxOSwgbGVhZHMgdG8g
dGhlIGZvbGxvd2luZyBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOgo+Cj4gICAgICAgICBkcml2ZXJz
L2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmM6MTY1IGRtYV9oZWFwX3ZtX2ZhdWx0KCkKPiAg
ICAgICAgIHdhcm46IHVuY2FwcGVkIHVzZXIgaW5kZXggJ2J1ZmZlci0+cGFnZXNbdm1mLT5wZ29m
Zl0nCj4KPiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKPiAgICAxNjAgIHN0
YXRpYyB2bV9mYXVsdF90IGRtYV9oZWFwX3ZtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+
ICAgIDE2MSAgewo+ICAgIDE2MiAgICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9
IHZtZi0+dm1hOwo+ICAgIDE2MyAgICAgICAgICBzdHJ1Y3QgaGVhcF9oZWxwZXJfYnVmZmVyICpi
dWZmZXIgPSB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKPiAgICAxNjQKPiAgICAxNjUgICAgICAgICAg
dm1mLT5wYWdlID0gYnVmZmVyLT5wYWdlc1t2bWYtPnBnb2ZmXTsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eCj4gU21hdGNoIGZvciBzb21lIHJl
YXNvbiB0aGlua3MgdGhpcyBuZWVkcyB0byBiZSBjaGVja2VkLiAgU21hdGNoIGFsc28KPiBnZXRz
IGNvbmZ1c2VkIGJ5IHRoZXNlIGZhdWx0IGhhbmRsZXJzIGFuZCB0aGlua3MgdGhlcmUgaXMgc29t
ZSByZWN1cnNpb24KPiBpbnZvbHZlZC4uLgoKSHJtLCBJJ20gbm90IHRvdGFsbHkgc3VyZSBJIGdy
b2sgd2hhdCBpdCdzIGxvb2tpbmcgZm9yLCBidXQgSSdtCmd1ZXNzaW5nIGl0J3Mgc3VnZ2VzdGlu
ZyB3ZSBjaGVjayB0aGF0IHBnb2ZmIGlzbid0IGxhcmdlciB0aGVuIHRoZQpwYWdlY291bnQ/Ckkn
bGwgYWRkIHRoYXQgY2hlY2sgaW4sIGJ1dCBsZXQgbWUga25vdyBpZiBJJ3ZlIG1pc3VuZGVyc3Rv
b2QuCgpUaGFua3MgZm9yIHRoZSByZXBvcnQhCi1qb2huCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
