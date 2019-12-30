Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8320C12D18F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2019 16:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257F389E26;
	Mon, 30 Dec 2019 15:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F82B89E26
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 15:44:10 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l8so32935850edw.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 07:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BqjpB17I4FAVcCVel4kRRM5u2ZSN97epJBsAntRnbvo=;
 b=t2N1aafHPhZehbu0Qf8p9usTBuSVYSChcnebj/atFOiQMgQ34bWnXjhOsYSLB16YyL
 oH1Tou1+TCORwasnQGtPGzX60Ia3WeEWQMVlg+Dy4yX/BDtXMsUbjpZ8VhN2Ad183PDG
 HX6RoGeTNQk1yPhFLyvFBaHT65U5UpF74MjLZ16SXwE5tc9xEOP5z9M8HVHgiA+dwqc8
 iaQ0GXtmHJMNK3xjhgqLsfAYCYHVShMjVRdLyfunlJSgUZysLTf7rcphchbn7AQPmaCG
 mPpAT6HArkrh1dxsi+Jc3K82y15bEe8REL7PRZBGLKS8jsWPpWfoYiF1ZannpmFCFqWE
 xrGA==
X-Gm-Message-State: APjAAAV0jLNfAltnlNf74OMGSsi7Zh1G5oS4pdQPT91tapSaNXt/whlr
 lrFMwk7EAh26G675q7ihXcg=
X-Google-Smtp-Source: APXvYqxzo56maTlSxQsNU5A2SyQb7P5FV8UkAKWQclUCoOB2bQNqmZBjZSuWqej4dQDiaLucch6EvA==
X-Received: by 2002:a17:906:2649:: with SMTP id
 i9mr71611722ejc.120.1577720649214; 
 Mon, 30 Dec 2019 07:44:09 -0800 (PST)
Received: from pi3 ([194.230.155.138])
 by smtp.googlemail.com with ESMTPSA id t1sm5651917ejg.32.2019.12.30.07.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 07:44:08 -0800 (PST)
Date: Mon, 30 Dec 2019 16:44:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>
Subject: Re: [RFC PATCH v3 4/7] arm: dts: exynos: Add interconnect bindings
 for Exynos4412
Message-ID: <20191230154405.GC4918@pi3>
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120144eucas1p119ececf161a6d45a6a194e432bbbd1f9@eucas1p1.samsung.com>
 <20191220115653.6487-5-a.swigon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220115653.6487-5-a.swigon@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMTI6NTY6NTBQTSArMDEwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyB0byB0aGUg
RXh5bm9zNDQxMiBEVDoKPiAgIC0gZXh5bm9zLGludGVyY29ubmVjdC1wYXJlbnQtbm9kZTogdG8g
ZGVjbGFyZSBjb25uZWN0aW9ucyBiZXR3ZWVuCj4gICAgIG5vZGVzIGluIG9yZGVyIHRvIGd1YXJh
bnRlZSBQTSBRb1MgcmVxdWlyZW1lbnRzIGJldHdlZW4gbm9kZXM7Cj4gICAtICNpbnRlcmNvbm5l
Y3QtY2VsbHM6IHJlcXVpcmVkIGJ5IHRoZSBpbnRlcmNvbm5lY3QgZnJhbWV3b3JrLgo+IAo+IE5v
dGUgdGhhdCAjaW50ZXJjb25uZWN0LWNlbGxzIGlzIGFsd2F5cyB6ZXJvIGFuZCBub2RlIElEcyBh
cmUgbm90Cj4gaGFyZGNvZGVkIGFueXdoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFydHVyIMWa
d2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMv
ZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKClRoZSBvcmRlciBvZiBwYXRjaGVzIGlzIGNvbmZ1c2luZy4gUGF0
Y2hlcyA0IGFuZCA2IGFyZSBzcGxpdCAtIGRvIHRoZQpkZXBlbmQgb24gNT8gSSBkb3VidCBidXQu
Li4KCkFkanVzdCB0aGUgdGl0bGUgdG8gbWF0Y2ggdGhlIGNvbnRlbnRzIC0geW91IGFyZSBub3Qg
YWRkaW5nIGJpbmRpbmdzIGJ1dApwcm9wZXJ0aWVzIHRvIGJ1cyBub2Rlcy4gQWxzbyB0aGUgcHJl
Zml4IGlzIEFSTTogKGxvb2sgYXQgcmVjZW50CmNvbW1pdHMpLgoKPiAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kgYi9hcmNoL2Fy
bS9ib290L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaQo+IGluZGV4IDRjZTNkNzdh
NjcwNC4uZDlkNzBlYWNmY2FmIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5v
czQ0MTItb2Ryb2lkLWNvbW1vbi5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9z
NDQxMi1vZHJvaWQtY29tbW9uLmR0c2kKPiBAQCAtOTAsNiArOTAsNyBAQAo+ICAmYnVzX2RtYyB7
Cj4gIAlleHlub3MscHBtdS1kZXZpY2UgPSA8JnBwbXVfZG1jMF8zPiwgPCZwcG11X2RtYzFfMz47
Cj4gIAl2ZGQtc3VwcGx5ID0gPCZidWNrMV9yZWc+Owo+ICsJI2ludGVyY29ubmVjdC1jZWxscyA9
IDwwPjsKClRoaXMgZG9lcyBub3QgbG9vayBsaWtlIHByb3BlcnR5IG9mIE9kcm9pZCBidXQgRXh5
bm9zNDQxMiBvciBFeHlub3M0LgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
