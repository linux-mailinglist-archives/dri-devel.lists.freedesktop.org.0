Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841508D010
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 11:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC9A6E48E;
	Wed, 14 Aug 2019 09:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEA26E48E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 09:50:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 31so110512278wrm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 02:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tL4/UuF4+63m9CQYYLn+PG0A1RH5ZO8b6mYLJjgGmNQ=;
 b=kvxh+yPs27IrMbYOO9Ad8LVQiv5XOYp121Vyr5EZJnyz5SiKKbOSzSMc9BkxRfK7xU
 4AmX0RX2bEq8xKNkmisdunH07V17yX2V7QzaqN2DntueF2fVuEAZ6wwfsiSCmOlRaH7C
 9xhV1KHvnmXc1Tgo4TGbL5p61QyXXu8Vw9ACcDBKGX/AOPssdCgBhG7FZGF6jyWwbVu7
 PIzvGNzviPF/sHHwHb4f029WHNAFoA9GC2P6aWRoU3w1KUAVqiZHGttxfWuuEAvgO2Wr
 S6TkXB1Ypi1iap5qaSn9PX3OwKkGZaavZC4tqUI2ecEOM9dj5R+CbrvQQ+nbye3WkGcr
 9XKg==
X-Gm-Message-State: APjAAAVsHaDAnm8lSHDzSk/OlxBloEdbSyF5RkQw8EyDR/P9TGJnZqFc
 ikMObnLHViZ5h6HM37Xb6utdttp2pOv/FA==
X-Google-Smtp-Source: APXvYqyaxKGf6TR7FpBS5QiA9sOkje2LVQRO5mZ5RlpIfV8hcTlkwkthf5WdfavD3KyNm2MI+28ByQ==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr4172513wrw.304.1565776254088; 
 Wed, 14 Aug 2019 02:50:54 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t14sm17119632wrv.12.2019.08.14.02.50.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 02:50:53 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: ti-tfp410: Update
 drm_connector_init_with_ddc() error message
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190814092357.13198-1-geert+renesas@glider.be>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <2226b176-a3f7-57aa-d6d0-99a465bae4f5@baylibre.com>
Date: Wed, 14 Aug 2019 11:50:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814092357.13198-1-geert+renesas@glider.be>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tL4/UuF4+63m9CQYYLn+PG0A1RH5ZO8b6mYLJjgGmNQ=;
 b=gay/8jQ/mdkmy2bj8n5DBTZ5h4LE/kRUrkYchi+uyz30cxE7vc/kjyMQWfw9gJabM+
 PwTaYtHnHqVaVT1x12t+a2TF5h7UbjaH5qPlHKdoW9yYLPTBKVRMO9NpmFqZjYFcTrRa
 MHeZ2p/M3G0mcG7oL9UOvaevv6xz/S6QdfgjvdU6jAn9eD5wsIOiaJLfwmkEQS0NJWqS
 1x3c78KEpRrY77uMiA7E7V3/7SWwr3ejyW7xY7v8gkAGtLrhkl9f6fakFR4hWghgvaMy
 YS7kL8NmPf2lVNNiB8VtNKEA/vTv3JMJVevWmtCEB76QiwWfJmIxMQK9h2bZMjf977Ki
 o9DQ==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDgvMjAxOSAxMToyMywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IFRoZSBjb2Rl
IHdhcyBjaGFuZ2VkIHRvIGNhbGwgZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKCkgaW5zdGVh
ZCBvZgo+IGRybV9jb25uZWN0b3JfaW5pdCgpLCBidXQgdGhlIGNvcnJlc3BvbmRpbmcgZXJyb3Ig
bWVzc2FnZSB3YXMgbm90Cj4gdXBkYXRlZC4KPiAKPiBGaXhlczogY2ZiNDQ0NTUyOTI2OTg5ZiAo
ImRybS9icmlkZ2U6IHRpLXRmcDQxMDogUHJvdmlkZSBkZGMgc3ltbGluayBpbiBjb25uZWN0b3Ig
c3lzZnMgZGlyZWN0b3J5IikKPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXRmcDQxMC5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRm
cDQxMC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+IGluZGV4IDYxY2My
MzU0ZWYxYmZlN2UuLmJlNmM5OWNhYzQxOTUzZTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
dGZwNDEwLmMKPiBAQCAtMTM5LDcgKzEzOSw4IEBAIHN0YXRpYyBpbnQgdGZwNDEwX2F0dGFjaChz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICAJCQkJCSAgZHZpLT5jb25uZWN0b3JfdHlwZSwK
PiAgCQkJCQkgIGR2aS0+ZGRjKTsKPiAgCWlmIChyZXQpIHsKPiAtCQlkZXZfZXJyKGR2aS0+ZGV2
LCAiZHJtX2Nvbm5lY3Rvcl9pbml0KCkgZmFpbGVkOiAlZFxuIiwgcmV0KTsKPiArCQlkZXZfZXJy
KGR2aS0+ZGV2LCAiZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKCkgZmFpbGVkOiAlZFxuIiwK
PiArCQkJcmV0KTsKPiAgCQlyZXR1cm4gcmV0Owo+ICAJfQo+ICAKPiAKClJldmlld2VkLWJ5OiBO
ZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
