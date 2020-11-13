Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8A2B1C31
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C203F6E52A;
	Fri, 13 Nov 2020 13:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BE26E530
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:49:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h62so8558676wme.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e/knA7px3ItuZjnu7kmhshhnJxUB7qJyEjkrpKqZtiA=;
 b=Yv+njuEXEnBreJ8gLTiSi7E/xj85s7S1U0w/6zQmiPZ1aSp7ZCFuVeOXtQ700dVUZY
 9cYICnqGX8VqTm9uswhkeCOG1WtAgHPlSd0c5esIEBrxnfKNGIGJ7N8p3mHPOWhQfTc1
 nC3wfYKKdObN0Tc9WdhW5lnWd2XE2C8FVH/YwzSsMK/FEI4Sr8lWCjkLc40a3q/X6SyT
 UgKx9M745DJvAIjlEINmUn1V9VoRLqlMR+Mzj+ZgD/IZxefVR1P/a0fFZ2ta9U0SnQuq
 SE8cIQ/hFaUu8KdY84nozKy8eDIdoFOTixMUC5F5T/SUqdfdqRWs1tIjHdgcknmYQkwG
 RpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e/knA7px3ItuZjnu7kmhshhnJxUB7qJyEjkrpKqZtiA=;
 b=to0ozNtPcWhJHgZybyZDRL9JATtbp1ssIrhHsfRW8axG/ErWhiS/rxw4VwQb99m2GY
 nkaXD9U9IgCpCX6lS8bhzLnj80o1PsV/Aa3edm3HLLKCChpfZbI4I8OkdMy81MoP0q0W
 FynHMHzyuALcDOn7MiMXWtTy5p6w3Ipggae/u4w/qJzax8c0ALVS5WkzfyifNV+jfJQy
 UqjzR5EituA/2czFBn48WBJL/7pPus9YHoKZ55rzi5sqodsLVbzPRV/E5gvoAl/I921y
 2ic+HaxrrETMrsljlnH2+3x4YplTupFoIdqLZ5mQDEa5Syukh0Yk1Tg5Z+B+K5iUWnUw
 NHEg==
X-Gm-Message-State: AOAM532vsL5yLgERDiL36knk63LtszrYsnpFRuZ/n6klfPY6NB8APoY7
 kExMOjnBToQZGHOUSv97hvHB8w==
X-Google-Smtp-Source: ABdhPJwR/sJKpEHbFTNMAquVWfrvJqacpk5fI57RXqCKzBoxehBUK0EZ5Dy/sI0mHknNbdzfm98Okg==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr2624009wme.171.1605275394497; 
 Fri, 13 Nov 2020 05:49:54 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/40] drm/mediatek/mtk_drm_drv: Staticise local function
 invoked by reference
Date: Fri, 13 Nov 2020 13:49:08 +0000
Message-Id: <20201113134938.4004947-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
