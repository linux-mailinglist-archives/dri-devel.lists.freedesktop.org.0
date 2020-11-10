Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C112ADF80
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60F589C60;
	Tue, 10 Nov 2020 19:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBE789C17
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h62so4313096wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Me2C0KZPH8VVua1aycMKe0StyKdd9QKRuKEwSNFVjFo=;
 b=nTwoPrX6vuGNHl6Q2QFUtIJJUETL3YT/ibQEqi03DwoHI3Jb3qNL1+rC6N6F227qfA
 AAjLx6l1Unylhegw/zO6dKNCg0g0VQkyLmpzD2Drmbd+dduOPXgbpr4SsNuK1Dpymnf0
 6IXOaaFnLvzELYzrQbne5S8feaaezD9OPBaqp+zu8+sgm+4IukuAolD4bzogzTTLEoR1
 UIfUZz0B1u4LtaE1KJXWJI94I24wSVt+Q4R2+wR/UMFmogW99umXOz48/L4DNiZbCs3x
 BQl9hGwGCFY1JlJA4SqjSk3nvN16aKcNZfCNUd/bX1e/f2LnFDZPXKIGyDMJTv7oLT7H
 dM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Me2C0KZPH8VVua1aycMKe0StyKdd9QKRuKEwSNFVjFo=;
 b=Uz3/zJ3mQKiP56a6yDbiko4uLYjSzmrisSD4ZunxqKkgeKrZhkXHmlb3ihF0ZytYRb
 ivU6gjKjU+zlim8TQVcK2NyqXshJ1H516jCsfil3d5cMNvHkr22wbWroKYODqmvFCVM1
 FSpenwv4HcUPw+GQvYbioN/8qEaKJ1MQcZP/FpbCei7NSTFT0d+puTZWfpCsZ4D+iY/e
 6A4XIhcXycM609j+dwSSl6oLntubtdHH5w3RFiAT2F7N3VgtWLQTMHA5CQKOgn6k3RVH
 UMkUiZdlycie/8DJfTuEa1++js+CcVmG+/agcArW2/A1YMZluv0m1ji8iu9DWonj2UxI
 E/FA==
X-Gm-Message-State: AOAM5328Ke8FL0GJpEg0mIQo8IpcfDx5/gnJTs+HqaJ1WUxKj5sukOLX
 BBBV/lzv74HOsMX50Cd7daq2AA==
X-Google-Smtp-Source: ABdhPJyIhjhZHDx3yHDStyO+VZdQLdjivEtz8y/Yum+kIEQaSUJDwOe3Ez/SXV3itj6CcyX522etpg==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr752634wml.98.1605036713925; 
 Tue, 10 Nov 2020 11:31:53 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/30] drm/radeon/cik: Move 'r600_ih_ring_{alloc,
 fini}()'s prototypes to shared header
Date: Tue, 10 Nov 2020 19:31:12 +0000
Message-Id: <20201110193112.988999-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yNjAwLmM6MzQ4MDo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmHI2MDBfaWhfcmluZ19hbGxvY+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
CiAzNDgwIHwgaW50IHI2MDBfaWhfcmluZ19hbGxvYyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dikKIHwgXn5+fn5+fn5+fn5+fn5+fn5+CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYzoz
NTE2OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcjYwMF9paF9yaW5n
X2ZpbmnigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogMzUxNiB8IHZvaWQgcjYwMF9paF9yaW5n
X2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiB8IF5+fn5+fn5+fn5+fn5+fn5+CgpD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBT
dW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8u
b3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYyAgfCAzICstLQogZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yNjAwLmggfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMgICB8IDMgKy0t
CiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9jaWsuYwppbmRleCBiOTRlMmU2NzhmMjU1Li5hNzE2NDU2OTNjYmRiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vY2lrLmMKQEAgLTMzLDYgKzMzLDcgQEAKICNpbmNsdWRlICJjaWtfYmxpdF9zaGFkZXJzLmgi
CiAjaW5jbHVkZSAiY2lrZC5oIgogI2luY2x1ZGUgImNsZWFyc3RhdGVfY2kuaCIKKyNpbmNsdWRl
ICJyNjAwLmgiCiAjaW5jbHVkZSAicmFkZW9uLmgiCiAjaW5jbHVkZSAicmFkZW9uX2FzaWMuaCIK
ICNpbmNsdWRlICJyYWRlb25fYXVkaW8uaCIKQEAgLTEyNCw4ICsxMjUsNiBAQCBNT0RVTEVfRklS
TVdBUkUoInJhZGVvbi9tdWxsaW5zX21lYy5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgicmFkZW9u
L211bGxpbnNfcmxjLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJyYWRlb24vbXVsbGluc19zZG1h
LmJpbiIpOwogCi1leHRlcm4gaW50IHI2MDBfaWhfcmluZ19hbGxvYyhzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldik7Ci1leHRlcm4gdm9pZCByNjAwX2loX3JpbmdfZmluaShzdHJ1Y3QgcmFkZW9u
X2RldmljZSAqcmRldik7CiBleHRlcm4gdm9pZCBldmVyZ3JlZW5fbWNfc3RvcChzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldiwgc3RydWN0IGV2ZXJncmVlbl9tY19zYXZlICpzYXZlKTsKIGV4dGVy
biB2b2lkIGV2ZXJncmVlbl9tY19yZXN1bWUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHN0
cnVjdCBldmVyZ3JlZW5fbWNfc2F2ZSAqc2F2ZSk7CiBleHRlcm4gYm9vbCBldmVyZ3JlZW5faXNf
ZGlzcGxheV9odW5nKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAw
LmgKaW5kZXggMWJmMmQwNTcyZjA0Ny4uNzMwMDRmZmI5ODEyNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yNjAwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAw
LmgKQEAgLTI5LDUgKzI5LDcgQEAKICNkZWZpbmUgX19SNjAwX0hfXwogCiB1MzIgcjYwMF9ncHVf
Y2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CitpbnQgcjYwMF9p
aF9yaW5nX2FsbG9jKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKK3ZvaWQgcjYwMF9paF9y
aW5nX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogCiAjZW5kaWYJCQkJLyogX19S
NjAwX0hfXyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jCmluZGV4IDQ1MDc2YzI3ZDdkZWQuLmQwNDA3MTQ1YzA3
YjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3NpLmMKQEAgLTMzLDYgKzMzLDcgQEAKICNpbmNsdWRlICJhdG9tLmgi
CiAjaW5jbHVkZSAiY2xlYXJzdGF0ZV9zaS5oIgogI2luY2x1ZGUgImV2ZXJncmVlbi5oIgorI2lu
Y2x1ZGUgInI2MDAuaCIKICNpbmNsdWRlICJyYWRlb24uaCIKICNpbmNsdWRlICJyYWRlb25fYXNp
Yy5oIgogI2luY2x1ZGUgInJhZGVvbl9hdWRpby5oIgpAQCAtMTI4LDggKzEyOSw2IEBAIHN0YXRp
YyB2b2lkIHNpX3BjaWVfZ2VuM19lbmFibGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwog
c3RhdGljIHZvaWQgc2lfcHJvZ3JhbV9hc3BtKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsK
IGV4dGVybiB2b2lkIHN1bW9fcmxjX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwog
ZXh0ZXJuIGludCBzdW1vX3JsY19pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKLWV4
dGVybiBpbnQgcjYwMF9paF9yaW5nX2FsbG9jKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsK
LWV4dGVybiB2b2lkIHI2MDBfaWhfcmluZ19maW5pKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2
KTsKIHN0YXRpYyB2b2lkIHNpX2VuYWJsZV9ndWlfaWRsZV9pbnRlcnJ1cHQoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYsCiAJCQkJCSBib29sIGVuYWJsZSk7CiBzdGF0aWMgdm9pZCBzaV9pbml0
X3BnKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
