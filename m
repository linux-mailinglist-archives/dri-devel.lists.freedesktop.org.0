Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5A34D19C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D9D6E446;
	Mon, 29 Mar 2021 13:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0D76E446
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 13:47:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id n138so18551535lfa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/ZN6EMo52SbaQUsmKOCXmommiFRM5AB/xm3XewoiYhs=;
 b=Oeqyc89nK7UnF76eztri1XWlbwhf1LqxwgbhcM9yI/hhu1u6x6zmnZ4pTQEh4Qu2QJ
 VNe4qmDHvddpFurC0edRtdwKXXnwyISy/lF1QI7mFWAy/E37nYjRYOPWuiPKV+RAHjs9
 wpTNLXkRf1R/HBh4B9dzflVKia/LBF9qvfntHXLyz7z0WG4fkYZA3xYtavUP0DlbuN0j
 Sud0yBuNt5IzQyVcmvG8eKp8BBZqfJBWM+IGLDkp6rYJJAaCSum1c5CRx401QsOrYyaZ
 JTkWUShzmUjF1/Kdpb3yn1B906vNJ1Az8ghhJ3J8tlifMW+DDmFlIOzNEEptZQdFLI8l
 vZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/ZN6EMo52SbaQUsmKOCXmommiFRM5AB/xm3XewoiYhs=;
 b=Js4RwVFwrmrow0rC0CiaDSoq/Ic9XrUM6e0qJT5pF1o3F/gfgrx7L1npStYrbjO570
 /IW9GfI3xH3+mO0bKMAF2L2WP3xhS6e6Ttp61V0ajEq2pAn54Xa3adOmtabNKnE+AXj6
 bwGSDLb51TdCzFQz017SmjHSmihvIfLhr55G+4xK9jUqktpM8jNPIoKV+UyluTAX1xKm
 tCPUt8XApjBaF3oK8S+mRdqo+60pw9EC2mYFpfIyAHCK4zxpj6x8qdj6rh85p/++I/xT
 RslORQlTC45MPgCZSCK9SvD6mgSGPWJT4CP6vzb+8Xw3flnyUmRNch49vBSqDjzffJXS
 dFGQ==
X-Gm-Message-State: AOAM53340fHdj7X8q6fjmI8B3zyUddpWIHI1ZAf2kilZt27TfuC0u4P8
 vMR1RUG4Zx80NmKgYArqznIHjAmm9x+pDzS3QTQ=
X-Google-Smtp-Source: ABdhPJwlTFxxxoL8t/ryBWeJEvoDMU/sXt5+NYDNZCURvjifVPNLUJdBS/C8njMLX/RRBW8oiED2xNB9qFYS5yRZUdo=
X-Received: by 2002:a05:6512:1192:: with SMTP id
 g18mr15585545lfr.408.1617025620636; 
 Mon, 29 Mar 2021 06:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
 <1616945059-8718-4-git-send-email-u0084500@gmail.com>
 <20210329102631.sh5ttefjvfsfg6tk@maple.lan>
In-Reply-To: <20210329102631.sh5ttefjvfsfg6tk@maple.lan>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 29 Mar 2021 21:46:48 +0800
Message-ID: <CADiBU3-2LvLzUZA08EKvzZ7qG8xKPbzbbFzTE3H-Z_8DMP=5OA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] backlight: rt4831: Adds support for Richtek RT4831
 backlight
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhbmllbDoKCkRhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+
IOaWvCAyMDIx5bm0M+aciDI55pelIOmAseS4gCDkuIvljYg2OjI25a+r6YGT77yaCj4KPiBPbiBT
dW4sIE1hciAyOCwgMjAyMSBhdCAxMToyNDoxOVBNICswODAwLCBjeV9odWFuZyB3cm90ZToKPiA+
IEZyb206IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+ID4KPiA+IEFkZHMg
c3VwcG9ydCBmb3IgUmljaHRlayBSVDQ4MzEgYmFja2xpZ2h0Lgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+ID4gLS0tCj4gPiBzaW5j
ZSB2Ngo+ID4gLSBGaXggS2NvbmZpZyB0eXBvLgo+ID4gLSBSZW1vdmUgaW50ZXJuYWwgbXV0ZXgg
bG9jay4KPiA+IC0gQWRkIHRoZSBwcmVmaXggZm9yIG1heCBicmlnaHRuZXNzLgo+ID4gLSByZW5h
bWUgaW5pdF9kZXZpY2VfcHJvcGVydGllcyB0byBwYXJzZV9iYWNrbGlnaHRfcHJvcGVydGllcy4K
PiA+IC0gUmVtb3ZlIHNvbWUgd2FybmluZyBtZXNzYWdlIGlmIGRlZmF1bHQgdmFsdWUgaXMgYWRv
cHRlZC4KPiA+IC0gQWRkIGJhY2tsaWdodCBwcm9wZXJ0eSBzY2FsZSB0byBMSU5FQVIgbWFwcGlu
Zy4KPiA+IC0gRml4IHJlZ21hcCBnZXQgdG8gY2hlY2sgTlVMTCBub3QgSVNfRVJSLgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZyAgICAgICAgICAgIHwgICA4ICsr
Cj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsK
PiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ydDQ4MzEtYmFja2xpZ2h0LmMgfCAyMDMgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDIxMiBpbnNl
cnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L3J0NDgzMS1iYWNrbGlnaHQuYwo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9LY29uZmlnIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZwo+ID4gaW5k
ZXggZDgzYzg3Yi4uZGU5NjQ0MSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcKPiA+
IEBAIC0yODksNiArMjg5LDE0IEBAIGNvbmZpZyBCQUNLTElHSFRfUUNPTV9XTEVECj4gPiAgICAg
ICAgIElmIHlvdSBoYXZlIHRoZSBRdWFsY29tbSBQTUlDLCBzYXkgWSB0byBlbmFibGUgYSBkcml2
ZXIgZm9yIHRoZQo+ID4gICAgICAgICBXTEVEIGJsb2NrLiBDdXJyZW50bHkgaXQgc3VwcG9ydHMg
UE04OTQxIGFuZCBQTUk4OTk4Lgo+ID4KPiA+ICtjb25maWcgQkFDS0xJR0hUX1JUNDgzMQo+ID4g
KyAgICAgdHJpc3RhdGUgIlJpY2h0ZWsgUlQ0ODMxIEJhY2tsaWdodCBEcml2ZXIiCj4gPiArICAg
ICBkZXBlbmRzIG9uIE1GRF9SVDQ4MzEKPiA+ICsgICAgIGhlbHAKPiA+ICsgICAgICAgVGhpcyBl
bmFibGVzIHN1cHBvcnQgZm9yIFJpY2h0ZWsgUlQ0ODMxIEJhY2tsaWdodCBkcml2ZXIuCj4gPiAr
ICAgICAgIEl0J3MgY29tbW9uIHVzZWQgdG8gZHJpdmUgdGhlIGRpc3BsYXkgV0xFRC4gVGhlcmUn
cmUgZm91ciBjaGFubmVscwo+Cj4gTml0cGlja2luZyBidXQgSSB3YXMgZXhwZWN0aW5nIHRoZSBv
cmlnaW5hbCB0eXBvIGJlIGNvbnZlcnRlZCB0bwo+ICJjb21tb25seSIuCj4KT0ssIEknbGwgY29y
cmVjdCB0aGlzIHR5cG8gaW4gdjcgbmV4dC4KQW5kIHdpbGwgbWVyZ2UgdGhlIHJldmlld2VkLWJ5
IGxpbmUuClRoeC4KPgo+IFdpdGggdGhhdCBhZGRyZXNzZWQ6Cj4gUmV2aWV3ZWQtYnk6IERhbmll
bCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4KPgo+IERhbmllbC4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
