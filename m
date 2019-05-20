Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C7B23E45
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 19:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A8389227;
	Mon, 20 May 2019 17:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC45489227;
 Mon, 20 May 2019 17:18:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r4so15469378wro.10;
 Mon, 20 May 2019 10:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQbDIy8UjviDfDxju8ALldRPMrrWAP6vGdw+VPh2bvA=;
 b=eP+ZHKr/TwrnoQFMQndoZb3qUz6kiD9Yx4L931KZQP7u2vWX6hIbiBOTkc/lt3uvLi
 gR/dwEDfeOT0Sj3dZMiPfVQlKg53ftnd5EZBTOTITWOX/cm1qzF3LgmMxdWzUTFljsZL
 pePPdtNdcpkp7r81wJJ+7QkF9m5SHkRhuiiYSnJrj1cAcahQA28T6BjCFMe2AdyZsvcq
 3qjp2yLHWnR0ksd/gMeL8Y8Cxg+kI36cy47mGMpcn8nqwiSUT9g4vcYk+6Bhr3jLdoeP
 23lxBEIUtS/8AoAd4BY2QSwKnGur9L3t3qahWse0iIolIbEfntq+254+LYZoXlgr7Fee
 7uFQ==
X-Gm-Message-State: APjAAAW15bVVYmItWZ7OPHYRC0PC1to0KiWXm042OJ1ObBBFW91ijM/O
 iQDaHsIgmZhRYd/oW00LKiNJLnQ5XkV4CATWYmY=
X-Google-Smtp-Source: APXvYqxI7bGtQgHqVry3QKsocdaEEQXUxiplX99tuHTRPLmGsC32Ze8R94RVDLoM2a9g1r5b+ZnniOJSSxPynslqqGE=
X-Received: by 2002:adf:cd11:: with SMTP id w17mr13496033wrm.83.1558372733581; 
 Mon, 20 May 2019 10:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190518134141.23214-1-houweitaoo@gmail.com>
In-Reply-To: <20190518134141.23214-1-houweitaoo@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 May 2019 13:18:40 -0400
Message-ID: <CADnq5_OURX-qSsendCS9qOfi1CoWUK9BV9HJgTkFzB87bgjMmA@mail.gmail.com>
Subject: Re: [PATCH] gpu: fix typos in code comments
To: Weitao Hou <houweitaoo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QQbDIy8UjviDfDxju8ALldRPMrrWAP6vGdw+VPh2bvA=;
 b=s8SLxhFvvdMKyTPB9YXA6VjEISJQIeQ2sbCPiw41ijsXFpBkkeO1Iy6BLIWvRCh+Uq
 R9KL1585aPQpNYdH3/vXFkkT19vEhBU+3z8dTobrQuqNnbtNw5SrKgPOQv1ZOzdQmchG
 edkrSf+d0iyAl3LmhWVIyG92wtFW9Yugs67YqDSsBj6IdqfRpbXdt+rAFLzq/RPmqV0a
 6Kr7byYJW9OruxPq6yqQmEV0XkQZtNSVtrDO9YtatlDEZK4Sl4ndqbR7YO3FzVv0UUaH
 9k/SyZtIYUFkP9bDhFxPpcnhQj9HpeM6+agMKMwGHIUaSzEUYgJ16hfKpHDEfXS38759
 +ixA==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Daenzer,
 Michel" <michel.daenzer@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Ken Chalmers <ken.chalmers@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTowNCBQTSBXZWl0YW8gSG91IDxob3V3ZWl0YW9vQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBmaXggZXJvciB0byBlcnJvcgo+Cj4gU2lnbmVkLW9mZi1ieTog
V2VpdGFvIEhvdSA8aG91d2VpdGFvb0BnbWFpbC5jb20+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxl
eAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfY2xvY2tf
c291cmNlLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9jbG9ja19zb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2Nsb2NrX3NvdXJjZS5jCj4gaW5kZXggZjcwNDM3YWFlOGUwLi5kZjQyMjQ0MDg0
NWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
Y2xvY2tfc291cmNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
L2RjZV9jbG9ja19zb3VyY2UuYwo+IEBAIC0xODMsOCArMTgzLDggQEAgc3RhdGljIGJvb2wgY2Fs
Y3VsYXRlX2ZiX2FuZF9mcmFjdGlvbmFsX2ZiX2RpdmlkZXIoCj4gICpSRVRVUk5TOgo+ICAqIEl0
IGZpbGxzIHRoZSBQTExTZXR0aW5ncyBzdHJ1Y3R1cmUgd2l0aCBQTEwgRGl2aWRlcnMgdmFsdWVz
Cj4gICogaWYgY2FsY3VsYXRlZCB2YWx1ZXMgYXJlIHdpdGhpbiByZXF1aXJlZCB0b2xlcmFuY2UK
PiAtKiBJdCByZXR1cm5zICAgLSB0cnVlIGlmIGVyb3IgaXMgd2l0aGluIHRvbGVyYW5jZQo+IC0q
ICAgICAgICAgICAgICAtIGZhbHNlIGlmIGVyb3IgaXMgbm90IHdpdGhpbiB0b2xlcmFuY2UKPiAr
KiBJdCByZXR1cm5zICAgLSB0cnVlIGlmIGVycm9yIGlzIHdpdGhpbiB0b2xlcmFuY2UKPiArKiAg
ICAgICAgICAgICAgLSBmYWxzZSBpZiBlcnJvciBpcyBub3Qgd2l0aGluIHRvbGVyYW5jZQo+ICAq
Lwo+ICBzdGF0aWMgYm9vbCBjYWxjX2ZiX2RpdmlkZXJfY2hlY2tpbmdfdG9sZXJhbmNlKAo+ICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgY2FsY19wbGxfY2xvY2tfc291cmNlICpjYWxjX3BsbF9jcywK
PiAtLQo+IDIuMTguMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
