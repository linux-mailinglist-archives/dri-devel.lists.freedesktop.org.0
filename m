Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B32B4DAE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850D26E9F4;
	Mon, 16 Nov 2020 17:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E896E9ED
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h21so44051wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e/knA7px3ItuZjnu7kmhshhnJxUB7qJyEjkrpKqZtiA=;
 b=k6Jv+7mHwhLKPJA/QCG06ugtxDKWpQTKy+20nzwFKSS58MARf4S8W8ACDDJb9At+kN
 Zj7BRm0cL5pJuZG03JgKNEOyxkFzKQDZEoeq6JKwur3GNW3waj1+cD/cATWqphXb/N3E
 Hwel7NdYgPQ30GBKTzLyGySsqlcZlYoScXIJf5HNpiV7Q9NiuYvKyh5I1UrBg1kr6UbV
 iCLuVTvJ0zQs9VHfs2J9H/qqPEg7slFJP5MGKs7bVItDI9ChEjoM5eM4spQGw5YLHt1S
 zBTagqyBF4NDMKbJ0sdlBYLtRa1aopP+KNyfSJbABRD/2iFY3eTiXtqFZBU8xFpxWZ8o
 d/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e/knA7px3ItuZjnu7kmhshhnJxUB7qJyEjkrpKqZtiA=;
 b=giynKuwiYrE1k+WYogb58wu+W/6vHVxVnzkGMt5lhOvEzEiA+se9vwWlPTgPyn/WdD
 p77+Oj3eXenMUYe6cEScbiUNj9W0dvqlkiGXe0fuL7fISmjkNAYbPBjPCf3MmoZx+ugw
 Fw1juLxADLzmqBwHNr9Cz7YEKCiP1ternpMgZ/mTlG3YboMk35tMzZjzQGI8z+7Ur2c6
 ibwq3W7xQr9CWpRITF7awwpn1/9+h1+PXylTNiSP4VGIOyx07jLtCP+vxyWRMYqD7UuM
 F8MlRCBhR/l/aS3xxMr8iw/Ip43OlGz5HKRtpfMz1IlbOQ1PzRDKiYNqOa8GtMu7g1Cy
 xDgg==
X-Gm-Message-State: AOAM533pFrKIbGUu4JZ4vqDu0lkBzPejlfEM0ei6BLZ97IwF1H0xboYS
 Vhe1Rr3IduQIkMnB4UqFlwigFw==
X-Google-Smtp-Source: ABdhPJzqHnsBJooc4S8laQMeNPmpnnuKV6rHd3UhDvssbsZxsM79tG8D8ZiF2nH5S1+VMw/gXxelZg==
X-Received: by 2002:a1c:5f83:: with SMTP id t125mr30364wmb.82.1605548495973;
 Mon, 16 Nov 2020 09:41:35 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/42] drm/mediatek/mtk_drm_drv: Staticise local function
 invoked by reference
Date: Mon, 16 Nov 2020 17:40:42 +0000
Message-Id: <20201116174112.1833368-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmM6MzE2OjI0OiB3YXJuaW5nOiBubyBwcmV2
aW91cyBwcm90b3R5cGUgZm9yIOKAmG10a19kcm1fZ2VtX3ByaW1lX2ltcG9ydOKAmSBbLVdtaXNz
aW5nLXByb3RvdHlwZXNdCgpDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KQ2M6IFN1
bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IFlUIFNIRU4gPHl0LnNoZW5AbWVkaWF0
ZWsuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1z
aWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKaW5kZXggMmU4MDY1YjFlMmJiYy4u
NDAxMzExNDUzZTdkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKQEAg
LTMxMyw4ICszMTMsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBtdGtf
ZHJtX2ZvcHMgPSB7CiAgKiBXZSBuZWVkIHRvIG92ZXJyaWRlIHRoaXMgYmVjYXVzZSB0aGUgZGV2
aWNlIHVzZWQgdG8gaW1wb3J0IHRoZSBtZW1vcnkgaXMKICAqIG5vdCBkZXYtPmRldiwgYXMgZHJt
X2dlbV9wcmltZV9pbXBvcnQoKSBleHBlY3RzLgogICovCi1zdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km10a19kcm1fZ2VtX3ByaW1lX2ltcG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAotCQkJCQkJ
c3RydWN0IGRtYV9idWYgKmRtYV9idWYpCitzdGF0aWMgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpt
dGtfZHJtX2dlbV9wcmltZV9pbXBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKKwkJCQkJCSAg
ICAgICBzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZikKIHsKIAlzdHJ1Y3QgbXRrX2RybV9wcml2YXRl
ICpwcml2YXRlID0gZGV2LT5kZXZfcHJpdmF0ZTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
