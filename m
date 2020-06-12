Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DBE1F82C2
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B428C6E47B;
	Sat, 13 Jun 2020 10:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7787B6E169
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 18:47:49 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id c8so11339545iob.6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LZDy9XcI4N1lUd1gGa7ISl9lwNSdZf1QWRf62wPMnVw=;
 b=S2x9dGEHkOnJf+7GpQkXBNyZgMb+NG5lpVqGB+F8ObbicBblcPnt1Zj0z2T2BJN1ak
 BE5tyB3SXO/vcPpoE1SV0kY1Hyiuhx8BaCvyI4y2wl5zVlTziIxk6WAAGlfkyrGWK2Ab
 ZJmk91KRA2HRL5FDYwjDYXfdoxwSeDYU2+fZ5Z8Mkt+x8+aREd4LyXa1focAkMeBM167
 RGDhyMr0dOAIZK/jg79jEb+znkyhK/DuF8F1TzcM7Ak+2abPElSzvfEwgLwHRZ/tiXLT
 XcVd6vAWGmnp9IO5dm4LC11qH4Ycso5wykJuil7n4kQNX5Uq5tVU5q/eYugeOmAWp9i4
 NGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LZDy9XcI4N1lUd1gGa7ISl9lwNSdZf1QWRf62wPMnVw=;
 b=XcsFIH1eNemDfi7ZtlEHfSFL7AdMYRAWl1yd2rmJuiqPzO/MhqkQf37fuGKplPZWGv
 sNPNIFdqBBwXuQVZXJafx1lNdQL3GDSUxFouAJSco80UQP5sI+RI0w2edvtG/gsWc6jN
 EwZ+/UuE98UovaOmJYtyMtTuKpxVrJCDcGrmq3X/yZ/w8Zq7axie0o2ChxLldWGUPYCn
 Pl+QPUaFNMYPGETcoxAAnOZhSe/P3Gqrz3ZE89fuZ4fqwfIF0oi5XKpFcvGVsOxsEglg
 tA89S4KmPH88peySxKO2KNlx3ATNsvRa8EXrXmNa2ILXvCqLijDwNjy8j8vRDLu9a7zM
 XAWg==
X-Gm-Message-State: AOAM532GmUcZdOj6rXLkuwnT1xrZ4M0sPHtb/zVMAyt5tbsSioGBW4U3
 qg1aMK4I4tseWz5GZ0DF9sWYRBnC6EAmFeBd5QI=
X-Google-Smtp-Source: ABdhPJzfRaFPvLx+fMxGrt+I4C3SRFJHleONaqg7i4IvAGQ6aQvoRRGtLFcMRTSg9k7ZAk6Yl7tZSKL1xoRRRuVrgIQ=
X-Received: by 2002:a05:6602:1601:: with SMTP id
 x1mr15442631iow.129.1591987668271; 
 Fri, 12 Jun 2020 11:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200605170720.2478262-1-noltari@gmail.com>
In-Reply-To: <20200605170720.2478262-1-noltari@gmail.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Fri, 12 Jun 2020 14:47:37 -0400
Message-ID: <CAC=U0a3xa9k76mxsiVKDyXsuvboZAyMkXT-S3-6oVZKjnWkeHA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: force raw OOB writes
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: "R, Vignesh" <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gNSwgMjAyMCBhdCAxOjA3IFBNIMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8
bm9sdGFyaUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gTVREX09QU19BVVRPX09PQiBpcyB3cml0dGlu
ZyBPT0Igd2l0aCBFQ0MgZW5hYmxlZCwgd2hpY2ggY2hhbmdlcyBhbGwgRUNDIGJ5dGVzCj4gZnJv
bSBhbiBlcmFzZWQgcGFnZSB0byAweDAwIHdoZW4gSkZGUzIgY2xlYW5tYXJrZXJzIGFyZSBhZGRl
ZCB3aXRoIG10ZC11dGlscy4KPiAgICAgICAgICB8IEJCSSB8ICAgSkZGUzIgICB8ICAgRUNDICAg
fCAgIEpGRlMyICAgfCBTcGFyZSAgfAo+IDAwMDAwODAwICBmZiBmZiAxOSA4NSAyMCAwMyAwMCAw
MCAgMDAgMDAgMDAgMDAgMDggZmYgZmYgZmYKPgo+IEhvd2V2ZXIsIGlmIE9PQiBpcyB3cml0dGVu
IHdpdGggRUNDIGRpc2FibGVkLCB0aGUgSkZGUzIgY2xlYW5tYXJrZXJzIGFyZQo+IGNvcnJlY3Rs
eSB3cml0dGVuIHdpdGhvdXQgY2hhbmdpbmcgdGhlIEVDQyBieXRlczoKPiAgICAgICAgICB8IEJC
SSB8ICAgSkZGUzIgICB8ICAgRUNDICAgfCAgIEpGRlMyICAgfCBTcGFyZSAgfAo+IDAwMDAwODAw
ICBmZiBmZiAxOSA4NSAyMCAwMyBmZiBmZiAgZmYgMDAgMDAgMDAgMDggZmYgZmYgZmYKCkJvdGgg
YnJjbWFuZF93cml0ZV9vb2JfcmF3KCkgYW5kIGJyY21uYW5kX3dyaXRlX29vYigpIHVzZQpicmNt
bmFuZF93cml0ZSgpIHRoYXQgdXNlcyBQUk9HUkFNX1BBR0UgY21kLCBtZWFucyBhbHNvIHByb2dy
YW1zIGRhdGEKYXJlYXMgYW5kIEVDQyB3aGVuIGVuYWJsZWQgIGlzIGFsd2F5cyBjYWxjdWxhdGVk
IG9uIERBVEErT09CLiAgc2luY2UKaW4gYm90aCBjYXNlcyB3ZSBvbmx5IHdhbnQgdG8gbW9kaWZ5
IE9PQiwgZGF0YSBpcyBhbHdheXMgYXNzdW1lZCB0byBiZQoweGZmcyAobWVhbnMgZXJhc2VkIHN0
YXRlKS4gU28gYXMgZmFyIGFzIHRoaXMgYXBpIGFsd2F5cyBpcyB1c2VkIG9uCnRoZSBlcmFzZWQg
cGFnZSBpdCBzaG91bGQgYmUgZ29vZC4gQXJlIHRoZSBzdWItcGFnZXMvb29iIGFyZWFzIHJlYWQg
YnkKamZmczIgIGFsc28gcmVhZCB3aXRob3V0IGVjYyBlbmFibGVkPy4gSnVzdCB3YW50IHRvIGJl
IHN1cmUgdGhhdCBpdApkb2VzIG5vdCBicmVhayBhbnkgb3RoZXIgdXRpbGl0aWVzIGxpa2UgbmFu
ZHdyaXRlLgoKPgo+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9s
dGFyaUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMgfCA5ICstLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5k
LmMKPiBpbmRleCA4ZjlmZmI0NmEwOWYuLjU2NjI4MTc3MDg0MSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IEBAIC0yMjc5LDEzICsyMjc5LDYgQEAgc3Rh
dGljIGludCBicmNtbmFuZF93cml0ZV9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBj
b25zdCB1aW50OF90ICpidWYsCj4gICAgICAgICByZXR1cm4gbmFuZF9wcm9nX3BhZ2VfZW5kX29w
KGNoaXApOwo+ICB9Cj4KPiAtc3RhdGljIGludCBicmNtbmFuZF93cml0ZV9vb2Ioc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwgaW50IHBhZ2UpCj4gLXsKPiAtICAgICAgIHJldHVybiBicmNtbmFuZF93
cml0ZShuYW5kX3RvX210ZChjaGlwKSwgY2hpcCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAodTY0KXBhZ2UgPDwgY2hpcC0+cGFnZV9zaGlmdCwgTlVMTCwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjaGlwLT5vb2JfcG9pKTsKPiAtfQo+IC0KPiAgc3RhdGljIGludCBi
cmNtbmFuZF93cml0ZV9vb2JfcmF3KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBwYWdlKQo+
ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+
IEBAIC0yNjQyLDcgKzI2MzUsNyBAQCBzdGF0aWMgaW50IGJyY21uYW5kX2luaXRfY3Moc3RydWN0
IGJyY21uYW5kX2hvc3QgKmhvc3QsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZG4pCj4gICAgICAgICBj
aGlwLT5lY2Mud3JpdGVfb29iX3JhdyA9IGJyY21uYW5kX3dyaXRlX29vYl9yYXc7Cj4gICAgICAg
ICBjaGlwLT5lY2MucmVhZF9vb2JfcmF3ID0gYnJjbW5hbmRfcmVhZF9vb2JfcmF3Owo+ICAgICAg
ICAgY2hpcC0+ZWNjLnJlYWRfb29iID0gYnJjbW5hbmRfcmVhZF9vb2I7Cj4gLSAgICAgICBjaGlw
LT5lY2Mud3JpdGVfb29iID0gYnJjbW5hbmRfd3JpdGVfb29iOwo+ICsgICAgICAgY2hpcC0+ZWNj
LndyaXRlX29vYiA9IGJyY21uYW5kX3dyaXRlX29vYl9yYXc7Cj4KPiAgICAgICAgIGNoaXAtPmNv
bnRyb2xsZXIgPSAmY3RybC0+Y29udHJvbGxlcjsKPgo+IC0tCj4gMi4yNi4yCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
