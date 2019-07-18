Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BACB76E184
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972896E59C;
	Fri, 19 Jul 2019 07:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F64B6E3E1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 14:38:38 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 207so25860341wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 07:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=/FZ15t+WnPZa0gqLj99soWhjHmZeMIuri/+6gFcjVD8=;
 b=nf6Xy2VNptGVa924Beed2srILlFrdWOJ2Q4cGSbJi8IPzrB7Mdi1Wa9eGxImzSjDib
 1xZl/wHu9WmJAIYk1wSwxHZoauGr2gBDTgC/PjmxVLEFwPAy07nQToWNJp1y4qe7tM7m
 4nLOhrGCGnl+t9c71J0R57BBBZ7OndXDF/CeTeUq79kMG44B5Our9EgUvrGevuxkXPXu
 /xfRtrrvgB2XaaoogW/aAFwnPxAhTHYaroscVlwX8Ji7x89hyaaPF5R8TW6er4Mj74an
 HL30QouCmpF1+BgUW6h02Q1z/gyZ1geGMCb7g+SvoTdALqLnXgMhzt95Zwx3Hx6p2KA6
 Ov3A==
X-Gm-Message-State: APjAAAWY2srW2ntrDSizbDTCBX5i/1NmWlVLGPipcdS2JbZ8YQ8LraKk
 Y25Fr8pzKEI5lhOI84o+klY=
X-Google-Smtp-Source: APXvYqzzmmbk/r7bk6XhrLTrKiF/VP7Ew0agihKzr3lPpI1G1FOV5YTWt2hMsYJxLw+rcA6n652YJg==
X-Received: by 2002:a1c:407:: with SMTP id 7mr45270644wme.113.1563460717156;
 Thu, 18 Jul 2019 07:38:37 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id o24sm33285394wmh.2.2019.07.18.07.38.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 07:38:36 -0700 (PDT)
Message-ID: <172a41d97d383a8989ebd213bb4230a2df4d636d.camel@gmail.com>
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Jul 2019 16:38:35 +0200
In-Reply-To: <CADnq5_Ndi9P9R6nyRkmYi0xjBAtCqUUxjTRP-MzSMU6OuqOXsA@mail.gmail.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
 <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
 <4ee5439cb01e355436d618f5d6f2e109410dc35e.camel@gmail.com>
 <eee4eea0-ad27-9d05-192d-c1207da5d0bc@daenzer.net>
 <CADnq5_PHyGcjeOygwnuXgR_DpS4_c2G=KgykRaBHj6PZcEmP7g@mail.gmail.com>
 <1061c44a462961e3d67b075b81a14eb6155a12fd.camel@gmail.com>
 <CADnq5_Ndi9P9R6nyRkmYi0xjBAtCqUUxjTRP-MzSMU6OuqOXsA@mail.gmail.com>
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Jul 2019 07:16:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=/FZ15t+WnPZa0gqLj99soWhjHmZeMIuri/+6gFcjVD8=;
 b=PVpI8WyWRopmeXsyl9Di2gY4/fWbotvpbrOG+PMg5Ho5xWIf0WbQYZfboLMH5UGrS5
 6y6fCSmtiLO6QKVK66zp+F8odsVQXRc+AEvqfsiX/HMAnoWtDit0XAxtCaJdTAvatexF
 R7Tf3rX3Ab/aM3gwayfyi3hf3rJ4HCiBL745I2nSIPe/o5cPdja7xhOX8c0kce08LbN7
 hxFSHEcfYFPjh+hLNx6KU8Cnt9M5mUWZLIomCCEt1ArBcuE8v+6bsAYZ6IUBurzhFBhv
 UYUSN23ug1AWtsRtEh+sw1bSlHnO2qgXAfHC2bOCsyAm5XDAuBk7woWlHEXFTpRpmzgk
 /faA==
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
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gPiAKPiA+IEkgdG9vayBhIGxvb2sgYXQgYW1kZ3B1X2RldmljZV9nZXRfcGNpZV9pbmZvKCkg
YW5kIGZvdW5kIHRoYXQgaXQKPiA+IHVzZXMKPiA+IHBjaWVfYmFuZHdpZHRoX2F2YWlsYWJsZSB0
byBkZXRlcm1pbmUgdGhlIGNhcGFiaWxpdGllcyBvZiB0aGUgUENJZQo+ID4gcG9ydC4gSG93ZXZl
ciwgcGNpZV9iYW5kd2lkdGhfYXZhaWxhYmxlIGdpdmVzIHlvdSBvbmx5IHRoZSBjdXJyZW50Cj4g
PiBiYW5kd2lkdGggYXMgc2V0IGJ5IHRoZSBQQ0llIGxpbmsgc3RhdHVzIHJlZ2lzdGVyLCBub3Qg
dGhlIG1heGltdW0KPiA+IGNhcGFiaWxpdHkuCj4gPiAKPiA+IEkgdGhpbmsgc29tZXRoaW5nIGFs
b25nIHRoZXNlIGxpbmVzIHdvdWxkIGZpeCBpdDoKPiA+IGh0dHBzOi8vcGFzdGViaW4uY29tL0xz
Y0VNS01jCj4gPiAKPiA+IEl0IHNlZW1zIHRvIG1lIHRoYXQgdGhlIFBDSWUgY2FwYWJpbGl0aWVz
IGFyZSBvbmx5IHVzZWQgaW4gYSBmZXcKPiA+IHBsYWNlcwo+ID4gaW4gdGhlIGNvZGUsIHNvIHRo
aXMgcGF0Y2ggZml4ZXMgcHBfZHBtX3BjaWUuIEhvd2V2ZXIgaXQgZG9lc24ndAo+ID4gYWZmZWN0
Cj4gPiB0aGUgYWN0dWFsIHBlcmZvcm1hbmNlLgo+ID4gCj4gPiBXaGF0IGRvIHlvdSB0aGluaz8K
PiAKPiBJIHRoaW5rIHdlIHdhbnQgdGhlIGN1cnJlbnQgYmFuZHdpZHRoLiAgVGhlIEdQVSBjYW4g
b25seSBjb250cm9sIHRoZQo+IHNwZWVkIG9mIGl0cyBsb2NhbCBsaW5rLiAgSWYgdGhlcmUgYXJl
IHVwc3RyZWFtIGxpbmtzIHRoYXQgYXJlIHNsb3dlcgo+IHRoYW4gaXRzIGxvY2FsIGxpbmssIGl0
IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBydW4gdGhlIGxvY2FsIGxpbmsgYXQKPiBmYXN0ZXIgc3Bl
ZWRzIGJlY2F1c2UgaXQgd2lsbCBidXJuIGV4dHJhIHBvd2VyIGl0IHdpbGwganVzdCBydW4gaW50
bwo+IGEKPiBib3R0bGVuZWNrIGF0IHRoZSBuZXh0IGxpbmsuICBJbiBnZW5lcmFsLCBtb3N0IHN5
c3RlbXMgbmVnb3RpYXRlIHRoZQo+IGZhc3Rlc3QgbGluayBzcGVlZCBzdXBwb3J0ZWQgYnkgYm90
aCBlbmRzIGF0IHBvd2VyIHVwLgo+IAo+IEFsZXgKCkN1cnJlbnRseSwgaWYgdGhlIEdQVSBjb25u
ZWN0ZWQgdG8gYSBUQjMgcG9ydCwgdGhlIGRyaXZlciB0aGlua3MgdGhhdAoyLjUgR1QvcyBpcyB0
aGUgYmVzdCBzcGVlZCB0aGF0IGl0IGNhbiB1c2UsIGV2ZW4gdGhvdWdoIHRoZSBoYXJkd2FyZQpp
dHNlbGYgdXNlcyA4IEdUL3MuIFNvIHdoYXQgdGhlIGRyaXZlciB0aGlua3MgaXMgaW5jb25zaXN0
ZW50IHdpdGggd2hhdAp0aGUgaGFyZHdhcmUgZG9lcy4gVGhpcyBtZXNzZXMgdXAgcHBfZHBtX3Bj
aWUuCgpBcyBmYXIgYXMgSSB1bmRlcnN0YW5kLCBQQ0llIGJyaWRnZSBkZXZpY2VzIGNhbiBjaGFu
Z2UgdGhlaXIgbGluayBzcGVlZAppbiBydW50aW1lIGJhc2VkIG9uIGhvdyB0aGV5IGFyZSB1c2Vk
IG9yIHdoYXQgcG93ZXIgc3RhdGUgdGhleSBhcmUgaW4sCnNvIGl0IG1ha2VzIHNlbnNlIGhlcmUg
dG8gcmVxdWVzdCB0aGUgYmVzdCBzcGVlZCB0aGV5IGFyZSBjYXBhYmxlIG9mLiBJCm1pZ2h0IGJl
IHdyb25nIGFib3V0IHRoYXQuCgpJZiB5b3UgdGhpbmsgdGhpcyBjaGFuZ2UgaXMgdW5kZXNpcmVh
YmxlLCB0aGVuIG1heWJlIGl0IHdvdWxkIGJlIHdvcnRoCnRvIGZvbGxvdyBNaWthJ3Mgc3VnZ2Vz
dGlvbiBhbmQgYWRkIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2YKZGV2LT5pc190aHVuZGVy
Ym9sdCBzbyB0aGF0IHRoZSBjb3JyZWN0IGF2YWlsYWJsZSBiYW5kd2lkdGggY291bGQgc3RpbGwK
YmUgZGV0ZXJtaW5lZC4KClRpbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
