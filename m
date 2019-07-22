Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56B70542
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1898B89D49;
	Mon, 22 Jul 2019 16:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009BB89D49
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:18:30 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE7E12190D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:18:30 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id m14so3334603qka.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 09:18:30 -0700 (PDT)
X-Gm-Message-State: APjAAAW7zBqQzEfsBRIr7SeDjxWY6WUtIFHfc1ERF+bu+yGsVWGuR/U0
 dNgB2yq490XNxncYi7GaLHEZexW5uPn1Lc+jJA==
X-Google-Smtp-Source: APXvYqyMoxSYUhr0XCqyLPYo1IocuJpnOGnFCi7tfdm+kj7NqIiAJ3YSiAQYO2rL83OTP/XpUOvBgck6SGVEPoXVUvQ=
X-Received: by 2002:a37:a010:: with SMTP id j16mr48343494qke.152.1563812309954; 
 Mon, 22 Jul 2019 09:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190717183352.22519-1-robh@kernel.org>
 <20190717183352.22519-3-robh@kernel.org>
 <ecde43d2-45cc-d00a-9635-cb56a67263d4@arm.com>
 <CAL_JsqLfnMwibCMU8_PqqYj0C895wuW9DNPirFo-LRChxJA-fA@mail.gmail.com>
 <896cada5-580a-7637-2884-f0c616314ea4@arm.com>
 <CAL_Jsq+ygY64WP6GP2LB4WRt2_BCXMMWxQSyhazY=jWfCyOkLg@mail.gmail.com>
 <4b7fc0b4-aa5b-06ba-ad4a-5b959e265e67@arm.com>
 <d52430aa-972e-f730-ee5a-44137f87e066@arm.com>
 <0bf616f7-023a-e1e3-dbf6-9a98155f6bf9@arm.com>
 <07a47ad9-cda9-b8dc-8bab-e9f065ae7229@arm.com>
 <76670d13-0292-1fa1-9e20-f193c01c14c6@arm.com>
In-Reply-To: <76670d13-0292-1fa1-9e20-f193c01c14c6@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 22 Jul 2019 10:18:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK0KtyAdm9gVPoY8O9+5P5kAq-Cf2UwNGFqwdOddFRKyg@mail.gmail.com>
Message-ID: <CAL_JsqK0KtyAdm9gVPoY8O9+5P5kAq-Cf2UwNGFqwdOddFRKyg@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panfrost: Add a no execute flag for BO allocations
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563812310;
 bh=77xtMEqwcpBjB3RWmXFpdTe6RodXAzcrOfuGMmpdxrQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0Oo/FoGqZWw2p+sKBJXQeu+WlmsPLNww7yq8RxWiFSEPE8WD11a1W0UPgbMula9I0
 /YS+qTa/6Eov1V9Js2IHSgSlIoeiwzgmEn6s+Asi1l1Iz6LE+SZ7KNcErEbyAwmsu+
 OLDj9ipJEjlzX/cyZbgydNcXHpsuTC+yQ+JQDSfk=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgNzoyNSBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDIyLzA3LzIwMTkgMTM6MTksIFN0ZXZlbiBQcmljZSB3
cm90ZToKPiBbLi4uXQo+ID4gSW5kZWVkLCB0aGF0IGNhc2Ugd2FzIGp1c3Qgb2NjdXJyaW5nIHRv
IG1lIHRvbyEgSG93IGFib3V0Ogo+ID4KPiA+ICAgICAgIHU2NCBuZXh0X3NlZyA9IEFMSUdOKCpz
dGFydCwgUEZOXzRHKTsKPiA+Cj4gPiAgICAgICBpZiAobmV4dF9zZWcgLSAqc3RhcnQgPD0gUEZO
XzE2TSkKPiA+ICAgICAgICAgICAgICAgKnN0YXJ0ID0gbmV4dF9zZWcgKyAxOwoKVGhpcyBjb3Vs
ZCBtYWtlIHN0YXJ0ID4gZW5kLi4uCgpJdCBhbHNvIGRvZXNuJ3QgaGFuZGxlIG5vdCBzdGFydGlu
ZyBvbiBhIDRHIGJvdW5kYXJ5IChvciB3YXMgdGhhdApjb25kaXRpb24gY2hlY2sgc3VwcG9zZWQg
dG8gYmUgaW5jbHVkZWQgc3RpbGwpLgoKPiA+Cj4gPiAgICAgICAqZW5kID0gbWluKCplbmQsIEFM
SUdOKCpzdGFydCwgUEZOXzRHKSAtIDEpOwo+ID4KPiA+IFNvIGFsd2F5cyBhbGxvY2F0ZSBhdCB0
aGUgYmVnaW5uaW5nLCBidXQgc2tpcCBwYXN0IHRoZSBuZXh0IDRHQiBib3VuZGFyeQo+ID4gaWYg
dGhlcmUncyBsZXNzIHRoYW4gMTZNQiBsZWZ0IChvciBlcXVhbCB0byBhdm9pZCB0aGUgNEdCIGJv
dW5kYXJ5KS4KPgo+IEFoLCB0aGVyZSBpdCBpcyEgSSB0aGluayBpdCBnZW5lcmFsaXNlcyBldmVu
IGZ1cnRoZXIgYnkganVzdCBjaGFuZ2luZwo+IHRoZSBjb25kaXRpb24gdG8gImlmIChuZXh0X3Nl
ZyAtICpzdGFydCA8ICplbmQgLSBuZXh0X3NlZykiLCBhbHRob3VnaAo+IHdlJ2QgbmVlZCB0byBl
bnN1cmUgYSBzaWduZWQgY29tcGFyaXNvbiB0byBjb3ZlciB0aGUgY2FzZSB3aGVyZSBzdGFydAo+
IGFuZCBlbmQgYXJlIGFscmVhZHkgaW4gdGhlIHNhbWUgc2VnbWVudC4KCklNTywgcmVseWluZyBv
biBzaWduZWQgY29tcGFyc2lvbiBkb2Vzbid0IHJlYWxseSBpbXByb3ZlIHRoZSByZWFkYWJpbGl0
eS4uLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
