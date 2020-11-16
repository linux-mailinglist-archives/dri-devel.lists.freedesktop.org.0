Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D93D2B4D4B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF3A89AB7;
	Mon, 16 Nov 2020 17:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7E06E08E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:38:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u12so12421709wrt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6EGHBJr/siM/pdwXEUEQclk4ZNpHlp4udszmTbY7hrM=;
 b=UuKytIDbOl5cWtgBiIsWcmk9ftgGmt0ocZumuYxm/bwx2yewiFf7ODuEWIWUObEHwt
 u/6foaKVEKE7gFlKbWuWb0Y7knKW8H+gYjQY8UEn4ujHVnNw5RXWGtFUC6ISAdzmwmS7
 +3KmvW/h75YvcbtZcJoSTl0bs3A2kvABq1p1AuAdFzEnSvx8QjhtCxz7Bo7ZoPVxkzbi
 O8qEVO0+JppHqjPK2rDiYgMvBNL6IEwVh5R5YP5L5vGzYCyEc8RMaYWqnmkwkaJoYA/1
 6gcjOKEOJXxmVUbCAj/WEQRbp0GDt435I6cxJCgWzRVcdAO/isl87S9qubkTrh8VFn5S
 VD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6EGHBJr/siM/pdwXEUEQclk4ZNpHlp4udszmTbY7hrM=;
 b=jiO1P9FmBhsvghMtLR0Uzh4lotw9cw/83AnY7xjJfenD9mX/FPX9eqx07/Ou0D+9yx
 p1ptrj4gGy4Fstr4MQ9OyDD4ODGOargjFiuPkv96Pfg+Bcm2aPyp2CTGaVfZq6OajJYk
 MBl6rtQFwxlGBulcu8r7FLznCDUJSScoMB++L1xf0oFGFPyDiTrK9lkpe0JfC2cM+uik
 eyxP9iJazpGzpJOWfeCIIF1sHquUxHqGM0zGfXL8Bv/3loie4wpX/lZGff/RgQlpsKrb
 il7ZwVD94Bg5m2NFS83ilteEpHbXTvWdRcVOR3HpwbWgzBif/RJnWbGCp5uNn6tepumt
 NYQg==
X-Gm-Message-State: AOAM531GqdecRDHbnkRjq37LbnJsbSpT4dgRC5zokDO0TvQLPwxMK0vF
 ExFLXQiPnZgYBgoUJat77JDDvA==
X-Google-Smtp-Source: ABdhPJxzfocDhqgLAmUd/wvU5bZO7g89veQLZYQ5qcY6PqsH7itoImCY2hfETUgl3Ai7qVPqGfFApg==
X-Received: by 2002:adf:9e48:: with SMTP id v8mr21997979wre.55.1605548282267; 
 Mon, 16 Nov 2020 09:38:02 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:38:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 43/43] drm/radeon/radeon_drv: Move
 'radeon_gem_prime_import_sg_table()'s prototype to shared header
Date: Mon, 16 Nov 2020 17:37:00 +0000
Message-Id: <20201116173700.1830487-44-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Gareth Hughes <gareth@valinux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuYzo0MzoyNDogd2FybmluZzogbm8gcHJldmlv
dXMgcHJvdG90eXBlIGZvciDigJhyYWRlb25fZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZeKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCiA0MyB8IHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqcmFkZW9u
X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIHwgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEdhcmV0aCBIdWdoZXMgPGdhcmV0aEB2YWxp
bnV4LmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgICB8
IDQgKy0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuaCB8IDMgKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2Rydi5jCmluZGV4IDIxMTkzMmQ3M2IxOTEuLjdhMDk4OWIzOTdkYTEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCkBAIC01NSw2ICs1NSw3IEBACiAjaW5j
bHVkZSAicmFkZW9uX3R0bS5oIgogI2luY2x1ZGUgInJhZGVvbi5oIgogI2luY2x1ZGUgInJhZGVv
bl9kZXZpY2UuaCIKKyNpbmNsdWRlICJyYWRlb25fcHJpbWUuaCIKIAogLyoKICAqIEtNUyB3cmFw
cGVyLgpAQCAtMTI5LDkgKzEzMCw2IEBAIGludCByYWRlb25fbW9kZV9kdW1iX21tYXAoc3RydWN0
IGRybV9maWxlICpmaWxwLAogaW50IHJhZGVvbl9tb2RlX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1f
ZmlsZSAqZmlsZV9wcml2LAogCQkJICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkgICAg
c3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iICphcmdzKTsKLXN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqcmFkZW9uX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKLQkJCQkJCQlzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICosCi0JCQkJCQkJc3RydWN0IHNn
X3RhYmxlICpzZyk7CiAKIC8qIGF0cHggaGFuZGxlciAqLwogI2lmIGRlZmluZWQoQ09ORklHX1ZH
QV9TV0lUQ0hFUk9PKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
cHJpbWUuaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmgKaW5kZXggMTFi
N2Y4MDk4NzgzNC4uMjRkZGZkNGI0OGE2ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fcHJpbWUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9w
cmltZS5oCkBAIC0zNSw1ICszNSw4IEBAIGludCByYWRlb25fZ2VtX3ByaW1lX3BpbihzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaik7CiB2b2lkIHJhZGVvbl9nZW1fcHJpbWVfdW5waW4oc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmopOwogdm9pZCAqcmFkZW9uX2dlbV9wcmltZV92bWFwKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKIHZvaWQgcmFkZW9uX2dlbV9wcmltZV92dW5tYXAoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQgKnZhZGRyKTsKK3N0cnVjdCBkcm1fZ2VtX29i
amVjdCAqcmFkZW9uX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwKKwkJCQkJCQlzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICosCisJCQkJCQkJc3RydWN0
IHNnX3RhYmxlICpzZyk7CiAKICNlbmRpZgkJCQkvKiBfX1JBREVPTl9QUklNRV9IX18gKi8KLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
