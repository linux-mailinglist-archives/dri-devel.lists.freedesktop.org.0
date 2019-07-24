Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527A77376D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 21:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE0E6E62E;
	Wed, 24 Jul 2019 19:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B950D6E62E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:08:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so42560081wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mYrGkDQOnSU5Lp9avRqB0jc65jAYh0UF93+Huamd7FY=;
 b=qOorFoGcdmeLWiLCi5c1jLsCueAA+YGLQmgnm5oYObn0wVpDgDG3TvmUMUNP8zpkga
 vO5yyMoKwXXt2L9R94D2ZtppRwdCy/CiMJzlXyjhvm8v8LPj5lm3FxzWnfKOuwej9z20
 H9cuhyI8y3sYiDW/8lOR6J2hwVT/zjNfV4l1s4dvhnPrLTj0x0qAAqpZu8VBnCZXlP3e
 HXk6WGCfroKJ0C5dxXrWR20Gpucabibdly5xG55xt+aJzE4Bs9VIiUh/AsgXYM7NxNSC
 ULf2smXZc2+P18+u8e3OWz7PFD4ljM8QhJ8XrtAbd7xfrgbd19ygiE7ZtYKgoQq7R0Ig
 0XRA==
X-Gm-Message-State: APjAAAUhROApej3gnSLmbjoXops3pKwA+V5Y+sF1dDl3ZW3fh6GxEABP
 dJLSEP3o00Lqk6+qhLbYNV0+7vdD
X-Google-Smtp-Source: APXvYqzdk6u7Pk10r48MB52INPrCA0J17QNFIsWrGOO+ZuC0i9JWvgiRp9UAxl5CifpHBiYGbc8sOw==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr76037481wmk.79.1563995334246; 
 Wed, 24 Jul 2019 12:08:54 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
 by smtp.googlemail.com with ESMTPSA id y1sm35475550wma.32.2019.07.24.12.08.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 12:08:53 -0700 (PDT)
Date: Wed, 24 Jul 2019 21:08:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Subject: Re: [RFC PATCH 02/11] devfreq: exynos-bus: Extract
 exynos_bus_profile_init_passive()
Message-ID: <20190724190851.GE14346@kozik-lap>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122023eucas1p2ff56c00b60a676ed85d9fe159a1839f2@eucas1p2.samsung.com>
 <20190723122016.30279-3-a.swigon@partner.samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723122016.30279-3-a.swigon@partner.samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MjA6MDdQTSArMDIwMCwgQXJ0dXIgxZp3aWdvxYQg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IHN0YXRpYyBmdW5jdGlvbiwgZXh5bm9zX2J1
c19wcm9maWxlX2luaXRfcGFzc2l2ZSgpLAo+IGV4dHJhY3RlZCBmcm9tIGV4eW5vc19idXNfcHJv
YmUoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5zd2lnb25AcGFydG5l
ci5zYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYyB8IDcw
ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NDIgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZGV2ZnJlcS9leHlub3MtYnVzLmMgYi9kcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jCj4g
aW5kZXggZDhmMWVmYWYyZDQ5Li5jZjZmNmNiZDBmNTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9k
ZXZmcmVxL2V4eW5vcy1idXMuYwo+ICsrKyBiL2RyaXZlcnMvZGV2ZnJlcS9leHlub3MtYnVzLmMK
PiBAQCAtNDMwLDEzICs0MzAsNTEgQEAgc3RhdGljIGludCBleHlub3NfYnVzX3Byb2ZpbGVfaW5p
dChzdHJ1Y3QgZXh5bm9zX2J1cyAqYnVzLAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiArc3Rh
dGljIGludCBleHlub3NfYnVzX3Byb2ZpbGVfaW5pdF9wYXNzaXZlKHN0cnVjdCBleHlub3NfYnVz
ICpidXMsCj4gKwkJCQkJICAgc3RydWN0IGRldmZyZXFfZGV2X3Byb2ZpbGUgKnByb2ZpbGUpCj4g
K3sKPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IGJ1cy0+ZGV2Owo+ICsJc3RydWN0IGRldmZyZXEg
KnBhcmVudF9kZXZmcmVxOwo+ICsJc3RydWN0IGRldmZyZXFfcGFzc2l2ZV9kYXRhICpwYXNzaXZl
X2RhdGE7Cj4gKwlpbnQgcmV0ID0gMDsKPiArCj4gKwkvKiBJbml0aWFsaXplIHRoZSBzdHJ1Y3Qg
cHJvZmlsZSBhbmQgZ292ZXJub3IgZGF0YSBmb3IgcGFzc2l2ZSBkZXZpY2UgKi8KPiArCXByb2Zp
bGUtPnRhcmdldCA9IGV4eW5vc19idXNfcGFzc2l2ZV90YXJnZXQ7Cj4gKwlwcm9maWxlLT5leGl0
ID0gZXh5bm9zX2J1c19wYXNzaXZlX2V4aXQ7Cj4gKwo+ICsJLyogR2V0IHRoZSBpbnN0YW5jZSBv
ZiBwYXJlbnQgZGV2ZnJlcSBkZXZpY2UgKi8KPiArCXBhcmVudF9kZXZmcmVxID0gZGV2ZnJlcV9n
ZXRfZGV2ZnJlcV9ieV9waGFuZGxlKGRldiwgMCk7Cj4gKwlpZiAoSVNfRVJSKHBhcmVudF9kZXZm
cmVxKSkgewo+ICsJCXJldCA9IC1FUFJPQkVfREVGRVI7Cj4gKwkJZ290byBlcnI7CgpTYW1lIGFz
IGluIHByZXZpb3VzIHBhdGNoIC0gbm8gbmVlZCBmb3IgZXJyb3IgZ290by4KCkJlc3QgcmVnYXJk
cywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
