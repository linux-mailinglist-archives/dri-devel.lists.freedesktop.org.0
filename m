Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D313146F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 16:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222066E479;
	Mon,  6 Jan 2020 15:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F6A6E479
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 15:07:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p17so15613413wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 07:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L4T6vAQjxiZ/aPBz48/7uQcrgS1Hqb7dcTR0eAasEHc=;
 b=17hBjJ4vG7ooH/85TGBU+P2sOYmUXK50vXAGGrr7fJ9VptH2H+FcnpaoIl8ZaX20X3
 PM48GXJ1LNP32DUooOee5dWIAbicdgtEhXddQ5CP5L3IkKsD0vH2uwXVV02wqhpRk1Dj
 3h+g5h3WbEYrsI2jhGgxZsPursi3UW8lwX9fFtrNWO/FeCYYPPIz3j6o4tIZLUWDOl/Y
 p6syHCM82kN4+9A3Xj8fqn0elft9FcDHmQaK9Ni7cl3kSdbenuobBQfCNz0XIL9NxuoD
 zN5NOO2OEAfIBsNTqqsrInr8RBVcsAEr/qshSTwq9qgMcryUSk+oaZUkmmoYC6hni8u2
 a8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=L4T6vAQjxiZ/aPBz48/7uQcrgS1Hqb7dcTR0eAasEHc=;
 b=RVm+KTiEB081BNRRbpZPrG3Xdat/IIBvQuoAoYTRplMhkBNsA1OIJ8Uqxcp6pITzJH
 /KAZX0wqEJWCouKlgJONopMsZP3wnZQJHrJMe3ujfMiPGjeaQIvsK4f9+H5xYRR2Y9k2
 oJbpNbrzr7HMaeLQDORzOg6+5cckYJjkIvaJdXM78g0N+gjRlPpBD7iGOAmlUpw1O5in
 Ip4a7fCDJECw68oqgk710bohpEUMwx5yHSukNTL1uM5TvSUjcYNET/cE+VIgmtoRKygo
 O1f5fcOXG+02KFrGdWs8O/cV87UmSaDzEWWVAMPi2W6Hp4e2BgeHX7T0pLxD+CaUJoQD
 Se3Q==
X-Gm-Message-State: APjAAAXOBEpAp5LEuDDMDnrMzqdFQL48EavQAnmSld91KXaPGeIpjcAW
 BxiI7Lhxw4yPJhfdaPaZ3WwR6g==
X-Google-Smtp-Source: APXvYqxPDd7/sJKEfL9Pi+3QGpH1YVY3p+GCBO2Ve193RJ0ZneVTvaANCAX/YfTEY7FqIvIsl/EfFg==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr34463861wmj.75.1578323273722; 
 Mon, 06 Jan 2020 07:07:53 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a1sm72107368wrr.80.2020.01.06.07.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 07:07:53 -0800 (PST)
Subject: Re: [PATCH] drm/bridge: cdns: remove set but not used variable 'bpp'
To: yu kuai <yukuai3@huawei.com>, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net,
 airlied@linux.ie, daniel@ffwll.ch
References: <20191226121207.2099-1-yukuai3@huawei.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <e623257b-362b-cdd4-a47c-84c7f756f7af@baylibre.com>
Date: Mon, 6 Jan 2020 16:07:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191226121207.2099-1-yukuai3@huawei.com>
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
Cc: zhengbin13@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yi.zhang@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMTIvMjAxOSAxMzoxMiwgeXUga3VhaSB3cm90ZToKPiBGaXhlcyBnY2MgJy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9j
ZG5zLWRzaS5jOiBJbiBmdW5jdGlvbgo+IOKAmGNkbnNfZHNpX2JyaWRnZV9lbmFibGXigJk6Cj4g
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jOjc4ODo2OiB3YXJuaW5nOiB2YXJpYWJs
ZSDigJhicHDigJkKPiBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
XQo+IAo+IEl0IGlzIG5ldmVyIHVzZWQsIGFuZCBzbyBjYW4gYmUgcmVtb3ZlZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvY2Rucy1kc2kuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9jZG5zLWRzaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5j
Cj4gaW5kZXggYTZhYjJkMjgxYTliLi5iN2M5N2YwNjAyNDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9jZG5zLWRzaS5jCj4gQEAgLTc4NCwxMyArNzg0LDEyIEBAIHN0YXRpYyB2b2lkIGNkbnNfZHNp
X2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgCXVuc2lnbmVkIGxv
bmcgdHhfYnl0ZV9wZXJpb2Q7Cj4gIAlzdHJ1Y3QgY2Ruc19kc2lfY2ZnIGRzaV9jZmc7Cj4gIAl1
MzIgdG1wLCByZWdfd2FrZXVwLCBkaXY7Cj4gLQlpbnQgYnBwLCBubGFuZXM7Cj4gKwlpbnQgbmxh
bmVzOwo+ICAKPiAgCWlmIChXQVJOX09OKHBtX3J1bnRpbWVfZ2V0X3N5bmMoZHNpLT5iYXNlLmRl
dikgPCAwKSkKPiAgCQlyZXR1cm47Cj4gIAo+ICAJbW9kZSA9ICZicmlkZ2UtPmVuY29kZXItPmNy
dGMtPnN0YXRlLT5hZGp1c3RlZF9tb2RlOwo+IC0JYnBwID0gbWlwaV9kc2lfcGl4ZWxfZm9ybWF0
X3RvX2JwcChvdXRwdXQtPmRldi0+Zm9ybWF0KTsKPiAgCW5sYW5lcyA9IG91dHB1dC0+ZGV2LT5s
YW5lczsKPiAgCj4gIAlXQVJOX09OX09OQ0UoY2Ruc19kc2lfY2hlY2tfY29uZihkc2ksIG1vZGUs
ICZkc2lfY2ZnLCBmYWxzZSkpOwo+IAoKClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+CgphbmQgYXBwbHlpbmcgdG8gZHJtLW1pc2MtbmV4dApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
