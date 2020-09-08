Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75748260BB5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBAA6E4F1;
	Tue,  8 Sep 2020 07:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEF06E4F1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 07:18:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id k18so920885wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 00:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BnZLlR/MqannyWzL/NE/WCFqx90iIATvWssNkndAyuw=;
 b=O0Fz0vqVen5yD+ixiiv6Iil1A9arYyZHXu45/ldMkIihqHbX6OTNifTm1rtv3DDvOW
 WyAFYIb5x77WHNfLxod0m48U/xo74yrRuiwojICLINLDChoNBl0jPeScM/mx4yEFUTrU
 bg/veOxJBJKVRO/i15Ev9WzsjplgPRjNY7yMQxJJT/gufQ5WKbo7qdYGwc8dtIme62VQ
 3pPQDEtexpP1n1MZXPOQgBFDjTkxlPHHwpbhpAokREfd8TqVd2tpY+HkQPxD4Kn58KW2
 TEhIWKbyAiUmfpbCT+kaCuunbLRett5rXNZ19Sk1dyaJCHwQInhoRQiXsFu2zNATHtDR
 Y8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BnZLlR/MqannyWzL/NE/WCFqx90iIATvWssNkndAyuw=;
 b=RlSXTFbVxo2SWeHGCb8guyBcYObyWWApVjciTPN1cG/ZU1IuvOU+xttn0d7XeHue36
 1gZtW4MWC1pWAQAhwQJMiOLQN3+1vQc2AdOhZuyXx/0t9ZoxaCygFrgbDJqPT9O9YMd6
 jUEqFaxT9uurK/2kLeBtadOL9zaKwAVZSQU8Hv73fRo2pAqq4Ok+y/dgxGQfzKAZeuay
 m2Zm1pICiyhJqhV1+ussUttvheeeJn1Zqjl5epwgXQqcZKySyICJM7QqKMD+dMvdB1gE
 Prxol3Uil+HcyxHafyBVewFz16CIbo1JWRc0uvgib54p61W7hpcRu+iFA9Gbw4ozOU/w
 THwg==
X-Gm-Message-State: AOAM530UaBV0u7ZQJwmlgXgNOWhXS0GjBqfjUyH4WoVqCQ9arKUuUMK0
 +9P0oAYbuflG+llXJhi4I0GEbg==
X-Google-Smtp-Source: ABdhPJzj1ecX+gU9LYQBG52HZN4YgLlObJ5QS6k25m00eZqK7euxQxVeZuSFQQDbipQ15acvDmqz+A==
X-Received: by 2002:a1c:1fcc:: with SMTP id f195mr2744223wmf.127.1599549492849; 
 Tue, 08 Sep 2020 00:18:12 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac?
 ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id k8sm32317392wma.16.2020.09.08.00.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 00:18:12 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIHYyIDYvNl0gZHJtL3BhbmVsOiBBZGQg?=
 =?UTF-8?Q?Ilitek_ILI9341_DBI_panel_driver?=
To: Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>
References: <20200822163250.63664-1-paul@crapouillou.net>
 <20200822163250.63664-7-paul@crapouillou.net>
 <edf38d68214247f486db3cc1f81ec404@shmbx04.spreadtrum.com>
 <COYVFQ.2IA7KFB6BF4C3@crapouillou.net>
 <20200830191133.GB6043@pendragon.ideasonboard.com>
 <20200830202822.GA950472@ravnborg.org> <5BHAGQ.KGFJ0K3OLEAO3@crapouillou.net>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <cf46c61b-1517-3009-cb92-a86e970dccc0@baylibre.com>
Date: Tue, 8 Sep 2020 09:18:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5BHAGQ.KGFJ0K3OLEAO3@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, =?UTF-8?B?5L2V5bCP6b6Z?= <Leon.He@unisoc.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDkvMjAyMCAxNDo1NywgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiAKPiAKPiBMZSBkaW0u
IDMwIGFvw7t0IDIwMjAgw6AgMjI6MjgsIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4g
YSDDqWNyaXQgOgo+PiBIaSBMYXVyZW50Lgo+Pgo+Pj4gwqA+Cj4+PiDCoD4gUGxlYXNlIHJlYWQg
dGhlIGNvdmVyIGxldHRlciwgaXQgZXhwbGFpbnMgd2h5IGl0J3MgZG9uZSB0aGlzIHdheS4gVGhl
Cj4+PiDCoD4gd2hvbGUgcG9pbnQgb2YgdGhpcyBwYXRjaHNldCBpcyB0byBtZXJnZSBEU0kgYW5k
IERCSSBmcmFtZXdvcmtzIGluIGEKPj4+IMKgPiB3YXkgdGhhdCBjYW4gYmUgbWFpbnRhaW5lZC4K
Pj4+Cj4+PiDCoEkgdGhpbmsgdGhpcyBwcm92ZXMgdGhlIHBvaW50IHRoYXQgdGhlIHByb3Bvc2Vk
IG5hbWluZyBpcyBjb25mdXNpbmcuIEF0Cj4+PiDCoGxlYXN0IGEgcmVuYW1lIHdvdWxkIGJlIHJl
cXVpcmVkLgo+Pgo+PiBEbyB5b3UgaGF2ZSBhbnkgaW5wdXRzIG9uIHRoZSBhbW91bnQgb2YgcmVu
YW1lIHdlIGFyZSBsb29raW5nIGludG8uCj4+IElzIHRoaXMgYSBzaW1wbGUgcy9zdHJ1Y3QgbWlw
aV9kc2lfZGV2aWNlL3N0cnVjdCBtaXBpX2R4aV9kZXZpY2UvCj4+IG9yIHNvbWV0aGluZyBtb3Jl
Pwo+Pgo+PiBXZSBzaG91bGQgc2NyaXB0IHRoZSByZW5hbWUgYXMgaXQgd2lsbCB0b2N1aCBhIGxv
dCBvZiBmaWxlcywKPj4gYW5kIHdpdGhvdXQgYSBzY3JpcHQgd2Ugd291bGQgY2hhc2UgdGhpcy4g
QnV0IG9uY2UgaXQgaXMgc2NyaXB0ZWQKPj4gaXQgd291bGQgYmUgdHJpdmlhbCB0byBwZXJmb3Jt
Lgo+Pgo+PiBJIGRpZCBub3QgbG9vayBhdCB0aGlzIGVub3VnaCwgYnV0IEkgaGFkIGFuIGlkZWEg
dGhhdCB3ZQo+PiB3b3VsZCBoYXZlIGRvIHRvIGEgcy9kc2kvZHhpLyBpbiBhIGxvdCBvZiBwbGFj
ZXMuCj4+Cj4+IChkeGkgaXMgbXkgYmVzdCBwcm9wb3NhbCBhdCB0aGUgbW9tZW50IGZvciBzb21l
dGhpbmcgY292ZXJpbmcgYm90aCBkc2kKPj4gYW5kIGRiaSkuCj4gCj4gZGNzPwo+IAo+IFNpbmNl
IERCSSBhbmQgRFNJIHBhbmVscyBnZW5lcmFsbHkgYWxsIHVzZSBEQ1MgY29tbWFuZHMuCgptaXBp
X2Rpc3AgLyBtaXBpX2Rpc3BsYXkgPyBzaW5jZSBpdCdzIGFsbCBhYm91dCBtaXBpIGRpc3BsYXkg
aW50ZXJmYWNlcwp3aXRoIGRpZmZlcmVudCB0cmFuc3BvcnQgcHJvdG9jb2xzLgoKTmVpbAoKPiAK
PiAtUGF1bAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
