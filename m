Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B2312F19
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 15:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F30C6E793;
	Fri,  3 May 2019 13:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C18F6E793
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 13:29:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h11so6754977wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 06:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UiiURwV+csCsGFRj/M2EvTMLMlk1L513hkjExJHkVEs=;
 b=QL6fR2A7ejNnK+N+kin+k9VJcHMb4Xm+mwdwLpR/6PThMK5E6nkSCD0C+D0DOLu6Ys
 Nv8ygu+5oP1yBEybQ3MbyoSsHKXcTgqHXNF8NcNdZ+Lw9LPACG1C4GI6gJdtfei7Qx8w
 qlQIrGOrxo8Nuym7fHusXjqdNIUFHQr8TJpSvQH7ZlkZEyYJF0PR63qr0HHaaulTAtwf
 qAXQP7e0i7lSDenbDMmvn2w/KV5aeRc3ZOSi/h7jKWRPnUlIHcbTe76v6AbqBri9lTD3
 CT4eDMosIVhGd0SPUFgj+EvlG9REAZQtlky/sjZJDgusZzgh1fuKK0VWwd8/dwdfPMbX
 rG5A==
X-Gm-Message-State: APjAAAUi4Yc4Jqiu7YfGK133dNN6ekKfJhfDQ9lLZQjvkYNmP2uwWFvS
 1S7uzYT0fdutROIsIWP878jpWw==
X-Google-Smtp-Source: APXvYqzA0vhwJpj92WdDars413IpWNcg1yQiVM9kEifAW+RTVzyZeKAKG9EQBfSsSikTgk3bWBMNUA==
X-Received: by 2002:a1c:7610:: with SMTP id r16mr6360976wmc.15.1556890175153; 
 Fri, 03 May 2019 06:29:35 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id o6sm2901085wre.60.2019.05.03.06.29.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 May 2019 06:29:34 -0700 (PDT)
Date: Fri, 3 May 2019 14:29:32 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] backlight: rave-sp: don't touch initial state and
 register with correct device
Message-ID: <20190503132932.2e3vrvlykofpexkf@holly.lan>
References: <20190429152919.27277-1-l.stach@pengutronix.de>
 <c23ecabd-c2ee-8c23-9ee3-13290bc4da35@linaro.org>
 <1556798505.2590.7.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556798505.2590.7.camel@pengutronix.de>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=UiiURwV+csCsGFRj/M2EvTMLMlk1L513hkjExJHkVEs=;
 b=e0kosvW7YUPpY4q0WS+jyio53RdExQS62XQnEHyBmCxIHKCBWazHrqKfLNh+eOEieV
 I2bVKlwVGg0oI3yJoOLsDsrD91dTw7V5D5/cEs/eOR9DZ5OmnPiBEuDApU4xkcXfxe2X
 o7bJMLvk5gP59Q3seFovLewo/ILLvmgMz7b2xyr2qU5SV4kP+psmWOztcoXQQ3tSpolP
 nOchj/xqxMmUd3yhD8nAlE0amuKDxMyFNej4nv2y5YZZt5GvQDyTzGZB5qPUQ/DBX0Qp
 q/d/Hd3vvz6aIqXSzBmBxlFg0JULwwQfQ6rfbhB9NDIqzT/ZqfdUzhADnIqaqWQdbLeB
 hkmg==
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDI6MDE6NDVQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gSGkgRGFuaWVsLAo+IAo+IEFtIERvbm5lcnN0YWcsIGRlbiAwMi4wNS4yMDE5LCAxMToz
MyArMDEwMCBzY2hyaWViIERhbmllbCBUaG9tcHNvbjoKPiA+IE9uIDI5LzA0LzIwMTkgMTY6Mjks
IEx1Y2FzIFN0YWNoIHdyb3RlOgo+ID4gPiBUaGlzIHdheSB0aGUgYmFja2xpZ2h0IGNhbiBiZSBy
ZWZlcmVuY2VkIHRocm91Z2ggaXRzIGRldmljZSBub2RlIGFuZAo+ID4gPiBlbmFibGluZy9kaXNh
YmxpbmcgY2FuIGJlIG1hbmFnZWQgdGhyb3VnaCB0aGUgcGFuZWwgZHJpdmVyLgo+ID4gCj4gPiBJ
cyBpdCBwb3NzaWJsZSB0byBpbXBsZW1lbnQgc29tZXRoaW5nIHNpbWlsYXIgdG/CoAo+ID4gcHdt
X2JhY2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKCkgdG8gaGFuZGxlIHRoaXM/Cj4gCj4gSSdt
IG5vdCBhd2FyZSBvZiBhbnkgcHJvdG9jb2wgdG8gdGhlIFJBVkUtU1AgdGhhdCB3b3VsZCBhbGxv
dyB0byByZWFkCj4gYmFjayB0aGUgYmFja2xpZ2h0IHN0YXRlLiBBRkFJQ1MgdGhlIGJhY2tsaWdo
dCBpcyBpbXBsZW1lbnRlZCBhcyBhCj4gdW5pZGlyZWN0aW9uYWwgcHJvdG9jb2wuCgpUaGF0IGZ1
bmN0aW9uIGRvZXMgdHdvIHRoaW5ncy4uLiBvbmUgaXMgcmVhZCB0aGUgY3VycmVudCBwb3dlciBz
dGF0ZSB0bwplbnN1cmUgbWV0YS1kYXRhIGlzIGNvcnJlY3RseSB1cCB0byBkYXRlIHdoaWNoIGNh
bm5vdCBiZSByZXBsaWNhdGVkLgpUaGUgb3RoZXIgaXMgdG8gY2hvb3NlIGRpZmZlcmVudCBiZWhh
dmlvdXIgZGVwZW5kaW5nIG9uIHdoZXRoZXIgdGhlCmJhY2tsaWdodCBpcyBzdGFuZGFsb25lIG9y
IGhhcyBhIHBoYW5kbGUgbGluayB0byBhbm90aGVyIGRldmljZS4KCkRvZXMgdGhlIHNlY29uZCBw
YXJ0IGFwcGx5IHRvIHRoZSByYXZlLXNwPwoKCkRhbmllbC4KCgoKPiA+IGJhY2tsaWdodCBkcml2
ZXJzIGFscmVhZHkgc3VmZmVyIGZyb20gdG9vIG11Y2ggZGl2ZXJzaXR5IHNvIEkgcHJlZmVywqAK
PiA+IHRoaW5ncyBsaWtlIHRoaXMgdG8gYWxpZ24gYmVoYXZpb3VyIHdpdGggdGhlIChmYWlybHkg
aGVhdmlseWx5IHVzZWQpIFBXTcKgCj4gPiBkcml2ZXIgaWYgcG9zc2libGUuCj4gPiAKPiA+IAo+
ID4gRGFuaWVsLgo+ID4gCj4gPiAKPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNo
IDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+ID4gPiAtLS0KPiA+ID4gwqAgZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvcmF2ZS1zcC1iYWNrbGlnaHQuYyB8IDQgKy0tLQo+ID4gPiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcmF2ZS1zcC1iYWNrbGlnaHQuYyBiL2Ry
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3JhdmUtc3AtYmFja2xpZ2h0LmMKPiA+ID4gaW5kZXggNDYy
ZjE0YTFiMTlkLi5kMjk2YmZjZjQzOTYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L3JhdmUtc3AtYmFja2xpZ2h0LmMKPiA+ID4gKysrIGIvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcmF2ZS1zcC1iYWNrbGlnaHQuYwo+ID4gPiBAQCAtNDgsMTUgKzQ4LDEzIEBAIHN0
YXRpYyBpbnQgcmF2ZV9zcF9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiA+ID4gPiA+IMKgwqAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+
ID4gPiA+IMKgwqAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJkOwo+ID4gPiDCoMKgCj4gPiA+
ID4gPiAtCWJkID0gZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3JlZ2lzdGVyKGRldiwgcGRldi0+bmFt
ZSwgZGV2LT5wYXJlbnQsCj4gPiA+ID4gPiArCWJkID0gZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3Jl
Z2lzdGVyKGRldiwgcGRldi0+bmFtZSwgZGV2LAo+ID4gPiA+ID4gwqDCoAkJCQkJwqDCoMKgwqBk
ZXZfZ2V0X2RydmRhdGEoZGV2LT5wYXJlbnQpLAo+ID4gPiA+ID4gwqDCoAkJCQkJwqDCoMKgwqAm
cmF2ZV9zcF9iYWNrbGlnaHRfb3BzLAo+ID4gPiA+ID4gwqDCoAkJCQkJwqDCoMKgwqAmcmF2ZV9z
cF9iYWNrbGlnaHRfcHJvcHMpOwo+ID4gPiA+ID4gwqDCoAlpZiAoSVNfRVJSKGJkKSkKPiA+ID4g
PiA+IMKgwqAJCXJldHVybiBQVFJfRVJSKGJkKTsKPiA+ID4gwqDCoAo+ID4gPiA+ID4gLQliYWNr
bGlnaHRfdXBkYXRlX3N0YXR1cyhiZCk7Cj4gPiA+IC0KPiA+ID4gPiA+IMKgwqAJcmV0dXJuIDA7
Cj4gPiA+IMKgIH0KPiA+ID4gwqDCoAo+ID4gPiAKPiA+IAo+ID4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
