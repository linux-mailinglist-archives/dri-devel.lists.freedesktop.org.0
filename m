Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60A281603
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBAE89FC8;
	Mon,  5 Aug 2019 09:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FC889FC8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:56:25 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AC352183F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:56:25 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id m8so45168947lji.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 02:56:25 -0700 (PDT)
X-Gm-Message-State: APjAAAUOKldd5z3SheJq+SdS1VGdz5l+1qbjjZlUnd80muuI2rgbkZxF
 UB1aFgWGYvPtNDjw7KYIuP6+UtK9e6fxH2FLCp4=
X-Google-Smtp-Source: APXvYqxzVKAd5TMLzlif6yoBQ/7YS/sKvvkA9uKhcxY/lMn1ISB5YMDZXNJeRxIeHY+6zPufLi4WkrEALvt2npvWd0M=
X-Received: by 2002:a2e:8155:: with SMTP id t21mr21170060ljg.80.1564998983563; 
 Mon, 05 Aug 2019 02:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122022eucas1p1266d90873d564894bd852c20140f8474@eucas1p1.samsung.com>
 <20190723122016.30279-2-a.swigon@partner.samsung.com>
 <20190724190741.GD14346@kozik-lap>
 <bda10bcc66aae96355e74c4739229d72bcc95b0d.camel@partner.samsung.com>
In-Reply-To: <bda10bcc66aae96355e74c4739229d72bcc95b0d.camel@partner.samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 5 Aug 2019 11:56:12 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdAhyAE96LmzV7TB1YTyNcN7Eh65Xb9caanXA-52Gskvg@mail.gmail.com>
Message-ID: <CAJKOXPdAhyAE96LmzV7TB1YTyNcN7Eh65Xb9caanXA-52Gskvg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init()
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564998985;
 bh=c/eJMd7h8iMY7g3oBcO09Ax6tNi/85j/LkvMdm+2LJ0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kCUfwhYAxdatWJQsoVRP5kF25HVcRa1aMqKUgUJMss9brgbECYUQmepSWt2tGm/RQ
 umRuOgvoPUKkt+A7Papljrijh6QQVCW0gkYfOsbJ6bM3ez1Rp3W8VOVzCufeKWykP2
 SI9yu/NkrsRLYzfI5dB6G+qzLhW/6hIfeGIf620k=
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
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-pm@vger.kernel.org,
 =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
 <b.zolnierkie@samsung.com>, Seung Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzMSBKdWwgMjAxOSBhdCAxNTowMCwgQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBh
cnRuZXIuc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBXZWQsIDIwMTktMDctMjQg
YXQgMjE6MDcgKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1
bCAyMywgMjAxOSBhdCAwMjoyMDowNlBNICswMjAwLCBBcnR1ciDFmndpZ2/FhCB3cm90ZToKPiA+
ID4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IHN0YXRpYyBmdW5jdGlvbiwgZXh5bm9zX2J1c19wcm9m
aWxlX2luaXQoKSwgZXh0cmFjdGVkCj4gPiA+IGZyb20gZXh5bm9zX2J1c19wcm9iZSgpLgo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5zd2lnb25AcGFydG5lci5z
YW1zdW5nLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5j
IHwgMTA2ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgNDYgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jIGIvZHJpdmVycy9kZXZmcmVx
L2V4eW5vcy1idXMuYwo+ID4gPiBpbmRleCBkOWYzNzc5MTJjMTAuLmQ4ZjFlZmFmMmQ0OSAxMDA2
NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYwo+ID4gPiArKysgYi9k
cml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jCj4gPiA+IEBAIC0zNzIsMTIgKzM3Miw2OSBAQCBz
dGF0aWMgaW50IGV4eW5vc19idXNfcGFyc2Vfb2Yoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiA+
ID4gICAgIHJldHVybiByZXQ7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgaW50IGV4eW5v
c19idXNfcHJvZmlsZV9pbml0KHN0cnVjdCBleHlub3NfYnVzICpidXMsCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2ZnJlcV9kZXZfcHJvZmlsZSAqcHJvZmls
ZSkKPiA+ID4gK3sKPiA+ID4gKyAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IGJ1cy0+ZGV2Owo+ID4g
PiArICAgc3RydWN0IGRldmZyZXFfc2ltcGxlX29uZGVtYW5kX2RhdGEgKm9uZGVtYW5kX2RhdGE7
Cj4gPiA+ICsgICBpbnQgcmV0Owo+ID4gPiArCj4gPiA+ICsgICAvKiBJbml0aWFsaXplIHRoZSBz
dHJ1Y3QgcHJvZmlsZSBhbmQgZ292ZXJub3IgZGF0YSBmb3IgcGFyZW50IGRldmljZSAqLwo+ID4g
PiArICAgcHJvZmlsZS0+cG9sbGluZ19tcyA9IDUwOwo+ID4gPiArICAgcHJvZmlsZS0+dGFyZ2V0
ID0gZXh5bm9zX2J1c190YXJnZXQ7Cj4gPiA+ICsgICBwcm9maWxlLT5nZXRfZGV2X3N0YXR1cyA9
IGV4eW5vc19idXNfZ2V0X2Rldl9zdGF0dXM7Cj4gPiA+ICsgICBwcm9maWxlLT5leGl0ID0gZXh5
bm9zX2J1c19leGl0Owo+ID4gPiArCj4gPiA+ICsgICBvbmRlbWFuZF9kYXRhID0gZGV2bV9remFs
bG9jKGRldiwgc2l6ZW9mKCpvbmRlbWFuZF9kYXRhKSwgR0ZQX0tFUk5FTCk7Cj4gPiA+ICsgICBp
ZiAoIW9uZGVtYW5kX2RhdGEpIHsKPiA+ID4gKyAgICAgICAgICAgcmV0ID0gLUVOT01FTTsKPiA+
ID4gKyAgICAgICAgICAgZ290byBlcnI7Cj4gPgo+ID4gSnVzdCByZXR1cm4gcHJvcGVyIGVycm9y
IGNvZGUuIExlc3MgbGluZXMsIG9idmlvdXMgY29kZSBzaW5jZSB5b3UgZG8gbm90Cj4gPiBoYXZl
IGFueSBjbGVhbnVwIGluIGVycm9yIHBhdGguCj4KPiBJIHdhcyBhZHZpc2VkIHRvIGF2b2lkIG1v
ZGlmeWluZyBjb2RlIGJlaW5nIG1vdmVkIChpbiBvbmUgcGF0Y2gpLiBJIGRvIG1ha2UKPiBjaGFu
Z2VzIGluIHRoZXNlIHBsYWNlcyBpbiBwYXRjaCAwNC8xMSwgaS5lLiBjaGFuZ2UgdGhlIG9yaWdp
bmFsIGxhYmVsICdlcnInIHRvCj4gJ291dCcuIFdoYXQncyB5b3VyIG9waW5pb24gb24gbWFraW5n
IHRoZSBwcm9wb3NlZCBjaGFuZ2VzIHRvIHBhdGNoZXMgMDEgYW5kIDAyCj4gKHMvZ290byBlcnIv
cmV0dXJuIHJldC8pIGluIHBhdGNoIDA0IGluc3RlYWQ/CgpZZXMsIHlvdSdyZSByaWdodC4gSSBh
bHNvIHByZWZlciBub3QgdG8gdG91Y2ggbW92ZWQgY29kZS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6
dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
