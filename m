Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A13E1678B0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 09:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C866EEB9;
	Fri, 21 Feb 2020 08:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A566EEB9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 08:50:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e8so1022773wrm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 00:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3ZvOc7ocFb3/N/zcs37FUSVqupJckC2W5CKP5yICAX4=;
 b=WpW9w1KmlwXxNnWal+Xyz+yfKRS+NEY/7b3pwmtC+kushRAX7D/galI882oswTucgE
 AUyPhnylKvCVscxFZmMex/1OIvqqyoUJSxv4N4v11FEIKk0Yo3y690dVF2C2iZt1ehln
 wXzKX7epcUA0cCNIiorvd7pHNemSi8/wnlWNsbEqiqCI0ipzJ/KAtIGVkNjejbA4vEAx
 IRR/Y+r10dltl45eaVNU5JD55wBmnSmX/NJJw6qbh2Yu+bX+z3oL97nN9O/44rG1nYv5
 PCWr60qLQFdPizS4Eay9w95YI5vjYueuwal/krPXPFucy8DWdSOzrxIWeLG0A0KmRxgd
 ktkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3ZvOc7ocFb3/N/zcs37FUSVqupJckC2W5CKP5yICAX4=;
 b=PMP8VsHa+RUhxFnUYQ3iQoYaFB339N76UexzD4WPjz5CazqZbEClWSTOxpTO14Rcgk
 616yK0+wBl4r7Z0Ktof+9nniLNdcQe+EtjdFqr/RpSwu3UJlq4I0mepXz3EIp/qGYjrb
 0qORL2xl72Js/NQEu/M7JWQ1b7B7qbJHkMBxtUuH1sXxwo8HAVcO6v00PtxYXs8xoXVu
 g9pCrDHyUUAeuCra8NS6t/GHgvZP5l7wtpYvMb82dw9HsKdNF5ogXSTAVf3Wv6WDoG6Q
 H7v3ToScivxkZP0UO+vpDUnU2t3c8GS+0BaVcxcJdSdOfVrLbEPXga5xH8KD0ICe2njX
 yx/w==
X-Gm-Message-State: APjAAAWlfca6NUM4uHBR97zNiQsflAOS5Jlc0HPwDAyxtTxVJYm4/Q6C
 FrAC4qOgTuqc32nQZdA3Ym7VRg==
X-Google-Smtp-Source: APXvYqyGMRN+npNdJ8bEh9KjkvsevsMYDjFjCNwH1QE6rNEcnAsoYDRtmMbvTjAiWzMOZoo/4uRwtA==
X-Received: by 2002:adf:f182:: with SMTP id h2mr46637034wro.364.1582275019595; 
 Fri, 21 Feb 2020 00:50:19 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858?
 ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
 by smtp.gmail.com with ESMTPSA id g19sm2821121wmh.36.2020.02.21.00.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 00:50:19 -0800 (PST)
Subject: Re: [PATCH v4 02/11] drm/bridge: dw-hdmi: add max bpc connector
 property
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 boris.brezillon@collabora.com
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-3-narmstrong@baylibre.com>
 <11463907.O9o76ZdvQC@jernej-laptop>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <09d315b8-22f3-a25a-1aea-9c5d50c634d6@baylibre.com>
Date: Fri, 21 Feb 2020 09:50:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <11463907.O9o76ZdvQC@jernej-laptop>
Content-Language: en-US
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVybmVqLAoKT24gMTcvMDIvMjAyMCAwNzozOCwgSmVybmVqIMWga3JhYmVjIHdyb3RlOgo+
IEhpIQo+IAo+IERuZSDEjWV0cnRlaywgMDYuIGZlYnJ1YXIgMjAyMCBvYiAyMDoxODoyNSBDRVQg
amUgTmVpbCBBcm1zdHJvbmcgbmFwaXNhbChhKToKPj4gRnJvbTogSm9uYXMgS2FybG1hbiA8am9u
YXNAa3dpYm9vLnNlPgo+Pgo+PiBBZGQgdGhlIG1heF9icGMgcHJvcGVydHkgdG8gdGhlIGR3LWhk
bWkgY29ubmVjdG9yIHRvIHByZXBhcmUgc3VwcG9ydAo+PiBmb3IgMTAsIDEyICYgMTZiaXQgb3V0
cHV0IHN1cHBvcnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3
aWJvby5zZT4KPj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5
bGlicmUuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jIHwgNCArKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+
PiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGluZGV4Cj4+IDll
MDkyN2QyMmRiNi4uMDUxMDAxZjc3ZGQ0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYwo+PiBAQCAtMjQwNiw2ICsyNDA2LDEwIEBAIHN0YXRpYyBpbnQg
ZHdfaGRtaV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlCj4+ICpicmlkZ2UpIERSTV9N
T0RFX0NPTk5FQ1RPUl9IRE1JQSwKPj4gIAkJCQkgICAgaGRtaS0+ZGRjKTsKPj4KPj4gKwlkcm1f
YXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQoY29ubmVjdG9yKTsKPiAKPiBXaHkgaXMgdGhp
cyByZXNldCBuZWVkZWQ/CgpJIGFzc3VtZSBpdCdzIHRvIGFsbG9jYXRlIGEgbmV3IGNvbm5lY3Rv
ciBzdGF0ZSB0byBhdHRhY2ggYSB0aGUgYnBjIHByb3BlcnkuCgpCdXQgaW5kZWVkLCB0aGlzIGhl
bHBlciBpcyBuZXZlciB1c2VkIGhlcmUsIGJ1dCBvbmx5IGFzIGNhbGxiYWNrIHRvIHRoZSBkcm1f
Y29ubmVjdG9yX2Z1bmNzLT5yZXNldC4KCkJ1dCwgYW1kZ3B1IGNhbGxzIDoKCS8qCgkgKiBTb21l
IG9mIHRoZSBwcm9wZXJ0aWVzIGJlbG93IHJlcXVpcmUgYWNjZXNzIHRvIHN0YXRlLCBsaWtlIGJw
Yy4KCSAqIEFsbG9jYXRlIHNvbWUgZGVmYXVsdCBpbml0aWFsIGNvbm5lY3RvciBzdGF0ZSB3aXRo
IG91ciByZXNldCBoZWxwZXIuCgkgKi8KCWlmIChhY29ubmVjdG9yLT5iYXNlLmZ1bmNzLT5yZXNl
dCkKCQlhY29ubmVjdG9yLT5iYXNlLmZ1bmNzLT5yZXNldCgmYWNvbm5lY3Rvci0+YmFzZSk7Cgp3
aGljaCBpcyB0aGUgc2FtZS4KCk5laWwKCj4gCj4gQmVzdCByZWdhcmRzLAo+IEplcm5lago+IAo+
PiArCj4+ICsJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfbWF4X2JwY19wcm9wZXJ0eShjb25uZWN0b3Is
IDgsIDE2KTsKPj4gKwo+PiAgCWlmIChoZG1pLT52ZXJzaW9uID49IDB4MjAwYSAmJiBoZG1pLT5w
bGF0X2RhdGEtPnVzZV9kcm1faW5mb2ZyYW1lKQo+PiAgCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9w
ZXJ0eSgmY29ubmVjdG9yLT5iYXNlLAo+PiAgCQkJY29ubmVjdG9yLT5kZXYtCj4+IG1vZGVfY29u
ZmlnLmhkcl9vdXRwdXRfbWV0YWRhdGFfcHJvcGVydHksIDApOwo+IAo+IAo+IAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
