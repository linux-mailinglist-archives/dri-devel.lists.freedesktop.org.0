Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7601D1A9549
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7441E6E8FD;
	Wed, 15 Apr 2020 07:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BFB6E8A9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:56:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h2so16207163wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pSd8qbiYbAtfmst7OijulRMd3WJ5z01ypkQKLIZqZok=;
 b=yK6dX17+cvwnbEKilDfvRJgPysqPQaOhqOcDFnUWTwNTUcNlmft+jOZNDi292ntJ2l
 kj8MhwLARdLFZQKHh3vGVp8pk4X5eSRG7mpvhl9Gb1ncGcdh5wPScau0bBXWJRcizTkW
 YioEbcc+FfUtG7ehev32FVJAwfe17MnWO6TJgD4LRwjj0ThJPgtxI9iHU5CcXmobSssd
 j71TTX//G1saATx+Znj6E1Q5og5FR/Y6P6VELlqA1x8O4FO9kJlnZefTggiQsrpsNs6J
 ZMoViK/0WPcIZDWIQLZRE+70NvkJdbfBxXS+4zXAvJu+2FUMgCrIeRK28CnH0BoFyirJ
 kEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pSd8qbiYbAtfmst7OijulRMd3WJ5z01ypkQKLIZqZok=;
 b=YWgVGq1CR7zmWU3BogkITEtVog3cKn2j8nA45EyI6dIVAegyYaTaCJCMz8R9bRPn+h
 mJGPSk6Sx1dfH+kEfSQxsb/9pgeuMkB742yqz5gAho5etorR4W3vmnakN52CUxSTKfer
 yzPt88Wp51Wqh17XO+rE7IPrm2/vz9DBmp2jFjlVXifsfaC6K3JbK+2dcAEoBnPl6mda
 Kj4GpgZJvaBuWFe0t40BEO6x0D4NjyDF9sNcDXq074miAZCjsD1JE0xtyhRdvExXZqr/
 4NRjaoCVmHdHDWZbpy9sJzIHkrz54h82lKzD0VmSxCi11nrqEqHVW9Fs5u2h3oEMh5og
 Udlw==
X-Gm-Message-State: AGi0PubwDSGuYep1DEOZMSQ53H/Xcszu+M5jjrpsbGS4zjh371u2W2dA
 Obn61O3kVyg9/Cb5N5Vz1eS7oA==
X-Google-Smtp-Source: APiQypJKOCIwnWh8GtFBc++8oLUPehct2YypJMuYQcUh6XPplOHdyOE52LPU3ioZ9kxnxcghDzsaVg==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr1910534wmj.130.1586937401352; 
 Wed, 15 Apr 2020 00:56:41 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56?
 ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id k14sm22764484wrp.53.2020.04.15.00.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 00:56:40 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: Delete an error message in meson_dw_hdmi_bind()
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>
References: <76f24122-4d3f-7670-9f06-edb4731a0661@web.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <54e0b6e4-4a39-c567-7355-2b2330a95294@baylibre.com>
Date: Wed, 15 Apr 2020 09:56:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <76f24122-4d3f-7670-9f06-edb4731a0661@web.de>
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwNS8wNC8yMDIwIDEzOjIzLCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPiBGcm9tOiBN
YXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gRGF0ZTogU3Vu
LCA1IEFwciAyMDIwIDEzOjEzOjAzICswMjAwCj4gCj4gVGhlIGZ1bmN0aW9uIOKAnHBsYXRmb3Jt
X2dldF9pcnHigJ0gY2FuIGxvZyBhbiBlcnJvciBhbHJlYWR5Lgo+IFRodXMgb21pdCBhIHJlZHVu
ZGFudCBtZXNzYWdlIGZvciB0aGUgZXhjZXB0aW9uIGhhbmRsaW5nIGluIHRoZQo+IGNhbGxpbmcg
ZnVuY3Rpb24uCj4gCj4gVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcgdGhlIENvY2Np
bmVsbGUgc29mdHdhcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJp
bmdAdXNlcnMuc291cmNlZm9yZ2UubmV0Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24v
bWVzb25fZHdfaGRtaS5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMK
PiBpbmRleCBlOGM5NDkxNWE0ZmMuLjY0Y2I2YmE0YmM0MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX2R3X2hkbWkuYwo+IEBAIC0xMDM0LDEwICsxMDM0LDggQEAgc3RhdGljIGludCBt
ZXNvbl9kd19oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0
ZXIsCj4gIAkJcmV0dXJuIFBUUl9FUlIoZHdfcGxhdF9kYXRhLT5yZWdtKTsKPiAKPiAgCWlycSA9
IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gLQlpZiAoaXJxIDwgMCkgewo+IC0JCWRldl9l
cnIoZGV2LCAiRmFpbGVkIHRvIGdldCBoZG1pIHRvcCBpcnFcbiIpOwo+ICsJaWYgKGlycSA8IDAp
Cj4gIAkJcmV0dXJuIGlycTsKPiAtCX0KPiAKPiAgCXJldCA9IGRldm1fcmVxdWVzdF90aHJlYWRl
ZF9pcnEoZGV2LCBpcnEsIGR3X2hkbWlfdG9wX2lycSwKPiAgCQkJCQlkd19oZG1pX3RvcF90aHJl
YWRfaXJxLCBJUlFGX1NIQVJFRCwKPiAtLQo+IDIuMjYuMAo+IAoKTWlzc2luZyBGaXhlcyB0YWcs
IGJ1dCBJJ2xsIGFwcGx5IG5ldmVydGhlbGVzczoKRml4ZXM6IDNmNjhiZTdkOGU5NiAoImRybS9t
ZXNvbjogQWRkIHN1cHBvcnQgZm9yIEhETUkgZW5jb2RlciBhbmQgRFctSERNSSBicmlkZ2UgKyBQ
SFkiKQoKTmVpbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
