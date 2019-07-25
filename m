Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E474375
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 04:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C046E44F;
	Thu, 25 Jul 2019 02:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89886E4BB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 02:52:40 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id t8so35380591qkt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TYbaU/RcXXoDnrZeMQ94CuW6JxA4bBgoJMHBj+E8c3U=;
 b=YqSiFxML7GImERFppSPQftrEDK9m8xiAAZU+nMuSj6URUSbfOTFj93qBXaVtx5RBLf
 Hw2cSSOD5UMbPuOu1+cDJ886ILDOcAjFgGYUVfVPeg1HbIBAvK/boc1mFV/Z0DVjI8l5
 uBAIzr4uI1poZvaClxX3jym5mmvLgN6y4jjfgfUFvIYyNNlSHXMIoCjHPZ1zFXnIqa2c
 +8b0cjYZCVVm+xGITHDNsSXhQae8saKDmWgFCHPJxaIZij0HPrq7iGsEwelS+hpTcTyt
 w6EqXOr3OkFQQr6z7xtICKTvamTHSVtO6aHbhV35pVPGw+4c6zi45f5qW3Ch3BJaqCsI
 rNWg==
X-Gm-Message-State: APjAAAV7n6cPLn1fU4sMV0dSX/W8u7wZO/GQ2LoiXeFhQEn1hNiibiXR
 jbe6y7wAAbUn1KIf7agp2asvY5zG2RNMBJyhx5KS8A==
X-Google-Smtp-Source: APXvYqyM3sqW/iwNxySOMbv+KfAtuOilJ1tOA6mmxNVc4AhyblxyzikTIraPFFcFyT9J6TSPJ9ksANxa4ctyvg2uzs8=
X-Received: by 2002:a37:a1d6:: with SMTP id
 k205mr56474155qke.171.1564023159729; 
 Wed, 24 Jul 2019 19:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562734889.git.joe@perches.com>
 <cddd7ad7e9f81dec1e86c106f04229d21fc21920.1562734889.git.joe@perches.com>
 <2a0c5ef5c7e20b190156908991e4c964a501d80a.camel@perches.com>
 <4f6709f8-381f-415c-8569-798b074b66c5@www.fastmail.com>
 <4e5bc8d61436024a30a8fb6a1516e29e23a75ede.camel@perches.com>
In-Reply-To: <4e5bc8d61436024a30a8fb6a1516e29e23a75ede.camel@perches.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 25 Jul 2019 02:52:27 +0000
Message-ID: <CACPK8Xd3+iwkuw-Ofwf+Hy1Ez5-1pBvnk_G4xT72ZQdOVd7Sag@mail.gmail.com>
Subject: Re: [PATCH 03/12] drm: aspeed_gfx: Fix misuse of GENMASK macro
To: Joe Perches <joe@perches.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TYbaU/RcXXoDnrZeMQ94CuW6JxA4bBgoJMHBj+E8c3U=;
 b=VWLm7pb1QP2B0tihwP9USNElFOTjEp6/v4Hd70rru6K+fpcBLvsEDPhud9KTe7tp1C
 gOYRrkbY5+tRQ2nBFGxx4CHJMbUfjVlQcbyTAYX2Zp31qb6KjaBAMSvULqFBUzF8Kb53
 /HA80hSPJspYIH/79t0OEPIUrlEg+sessZKds=
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNSBKdWwgMjAxOSBhdCAwMToxOCwgSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNv
bT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIwMTktMDctMjUgYXQgMTA6NDAgKzA5MzAsIEFuZHJldyBK
ZWZmZXJ5IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgMjUgSnVsIDIwMTksIGF0IDAyOjQ2LCBKb2Ug
UGVyY2hlcyB3cm90ZToKPiA+ID4gT24gVHVlLCAyMDE5LTA3LTA5IGF0IDIyOjA0IC0wNzAwLCBK
b2UgUGVyY2hlcyB3cm90ZToKPiA+ID4gPiBBcmd1bWVudHMgYXJlIHN1cHBvc2VkIHRvIGJlIG9y
ZGVyZWQgaGlnaCB0aGVuIGxvdy4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvZSBQ
ZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9hc3BlZWQvYXNwZWVkX2dmeC5oIHwgMiArLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnguaCBiL2RyaXZlcnMvZ3B1L2RybS9h
c3BlZWQvYXNwZWVkX2dmeC5oCj4gPiA+ID4gaW5kZXggYTEwMzU4YmI2MWVjLi4wOTVlYTAzZTU4
MzMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4
LmgKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnguaAo+ID4g
PiA+IEBAIC03NCw3ICs3NCw3IEBAIGludCBhc3BlZWRfZ2Z4X2NyZWF0ZV9vdXRwdXQoc3RydWN0
IGRybV9kZXZpY2UgKmRybSk7Cj4gPiA+ID4gIC8qIENUUkwyICovCj4gPiA+ID4gICNkZWZpbmUg
Q1JUX0NUUkxfREFDX0VOICAgICAgICAgICAgICAgICAgQklUKDApCj4gPiA+ID4gICNkZWZpbmUg
Q1JUX0NUUkxfVkJMQU5LX0xJTkUoeCkgICAgICAgICAgKCgoeCkgPDwgMjApICYgQ1JUX0NUUkxf
VkJMQU5LX0xJTkVfTUFTSykKPiA+ID4gPiAtI2RlZmluZSBDUlRfQ1RSTF9WQkxBTktfTElORV9N
QVNLICAgICAgICBHRU5NQVNLKDIwLCAzMSkKPiA+ID4gPiArI2RlZmluZSBDUlRfQ1RSTF9WQkxB
TktfTElORV9NQVNLICAgICAgICBHRU5NQVNLKDMxLCAyMCkKPiA+Cj4gPiBSZXZpZXdlZC1ieTog
QW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4KPgo+IFRoaXMgaGFyZGx5IG5lZWRzIGEg
cmV2aWV3LCBpdCBuZWVkcyB0byBiZSBhcHBsaWVkLgo+IFRoZXJlJ3MgYSBub21pbmFsIGdpdCB0
cmVlIGZvciBhc3BlZWQgaGVyZToKPgo+IFQ6ICAgICAgZ2l0IGdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qb2VsL2FzcGVlZC5naXQKPgo+IEJ1dCB3aG8ncyBn
b2luZyB0byBkbyBhcHBseSB0aGlzPwoKVGhpcyBpcyBhIERSTSBwYXRjaCwgc28gaXQgZ29lcyB0
aHJvdWdoIHRoZSBEUk0gdHJlZS4gSSBhbSBhCmNvLW1haW50YWluZXIgdGhlcmUgYW5kIGNhbiBh
cHBseSBpdCBvbmNlIEkgcmVtZW1iZXIgaG93IHRvIGRyaXZlIHRoZQp0b29scy4KCihGWUksIHRo
aXMgbWFjcm8gaXMgbm90IHVzZWQgYnkgdGhlIGN1cnJlbnQgZHJpdmVyKS4KCkNoZWVycywKCkpv
ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
