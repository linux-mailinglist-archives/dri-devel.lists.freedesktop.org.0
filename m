Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38226939
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 19:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7D789C8F;
	Wed, 22 May 2019 17:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E5989C93
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 17:37:20 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id f24so3353327qtk.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXxK1SdvMa5QM5LCKyWVp4e9t2vqNYcogqHpLSLLhIg=;
 b=DL7XdJgO+/2B90gE6ppTLSCf9UJNlF6nod139NwVzd9g2IaDgmws/XTfLZT5tbzrPk
 m4MbOLMSX7Ky4qcBOItXdtBaGrRBIqXpXQCpClYHIYfZAefxgREtxbD3CJSNQlwJHLRZ
 s81nNBrEqOE3zMOYwP7E/HmVwfalPwtAfvs83aU5h6oT2473Bgorvvjl7WyeAZkPlJev
 4f5u95rHsvbgYGpYzNGBdXrA6G0yc/fGsiWsqB4voZEt4yQMvDm6cLkIpSQdC9ZmvV64
 wgzobBJ5Yo+xUkuoV2nn4JyPYA446WoTwh0/+ioDd6a/l2uEEImoEJlgp/FFzut0RUuJ
 kZmQ==
X-Gm-Message-State: APjAAAVtgXmNXWutyFZqO+Bymcz2VfSoEk5X61zO9ErHNshslqPvsud3
 XyqBP5jEIPXFY2xxX4mqqRYE5ailEZw=
X-Google-Smtp-Source: APXvYqy/u71X2vK71//eIydQ9D0SXgzfKKRGUI6ixkuJuEU3Fh6rhvDxQqu3U20I+iJYQX7kbjFjgA==
X-Received: by 2002:a0c:9639:: with SMTP id 54mr56022780qvx.105.1558546639896; 
 Wed, 22 May 2019 10:37:19 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id w143sm10692969qka.22.2019.05.22.10.37.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 10:37:19 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 5/5] drm/msm/a6xx: Rename a6xx_gmu_probe to a6xx_gmu_init
Date: Wed, 22 May 2019 13:36:44 -0400
Message-Id: <20190522173656.162006-5-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190522173656.162006-1-sean@poorly.run>
References: <20190522173656.162006-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXxK1SdvMa5QM5LCKyWVp4e9t2vqNYcogqHpLSLLhIg=;
 b=fYwz5Xn2gUyJ8TSsHmm2mYXLmdUcoer3oKLz0EdRFeyNzHUkmTz/MDnIp1x4eu9we9
 D5sdfruQ69jaDbrbw0XZB/8H09QuDjotmkN1/zedx0Avo2WO+FX2rtBLBOEVQpF4hPHP
 UJjTRAPkuqGinXdu2hyOkQYpsHEOlsG6gh2ROj0DNNq2TvYpWmq73UJ9TOlYiFLo6wmj
 uDkIgLd8CvA9WhUWUC2pECn4CQQyn+1mCLPjbfCXPfaxvOoOWvhoXGIW9Cm2Sh1c7H3A
 dPWDMIVTgibXIqVhta/pM6A7E2v5bxMviAbomMdjkndOke/g8SgNNQpuO5eDoPQ7GQeN
 +tdQ==
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGlzIHJlbmFtZSBtYWtl
cyBpdCBtb3JlIGNsZWFyIHRoYXQgZXZlcnl0aGluZyBpbml0aWFsaXplZCBpbiB0aGUgX2luaXQK
ZnVuY3Rpb24gbXVzdCBiZSBjbGVhbmVkIHVwIGluIGE2eHhfZ211X3JlbW92ZS4gVGhpcyB3aWxs
IGhvcGVmdWxseQpkaXNzdWFkZSBwZW9wbGUgZnJvbSB1c2luZyBkZXZpY2UgbWFuYWdlZCByZXNv
dXJjZXMgKGZvciByZWFzb25zIGxhaWQKb3V0IGluIHRoZSBwcmV2aW91cyBwYXRjaCkuCgpTaWdu
ZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYTZ4eF9ncHUuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2
eHhfZ3B1LmggfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dt
dS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwppbmRleCA3MDFiODEz
ZmEzOGEuLjI2ZjQ0YTE4N2VkYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYTZ4eF9nbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5j
CkBAIC0xMjU2LDcgKzEyNTYsNyBAQCB2b2lkIGE2eHhfZ211X3JlbW92ZShzdHJ1Y3QgYTZ4eF9n
cHUgKmE2eHhfZ3B1KQogCWdtdS0+aW5pdGlhbGl6ZWQgPSBmYWxzZTsKIH0KIAotaW50IGE2eHhf
Z211X3Byb2JlKHN0cnVjdCBhNnh4X2dwdSAqYTZ4eF9ncHUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSkKK2ludCBhNnh4X2dtdV9pbml0KHN0cnVjdCBhNnh4X2dwdSAqYTZ4eF9ncHUsIHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbm9kZSkKIHsKIAlzdHJ1Y3QgYTZ4eF9nbXUgKmdtdSA9ICZhNnh4X2dw
dS0+Z211OwogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSBvZl9maW5kX2RldmljZV9i
eV9ub2RlKG5vZGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4
eF9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKaW5kZXggZTc0
ZGNlNDc0MjUwLi4xZjlmNGIwYTk2NTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E2eHhfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
cHUuYwpAQCAtODU0LDcgKzg1NCw3IEBAIHN0cnVjdCBtc21fZ3B1ICphNnh4X2dwdV9pbml0KHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJLyogRklYTUU6IEhvdyBkbyB3ZSBncmFjZWZ1bGx5IGhh
bmRsZSB0aGlzPyAqLwogCUJVR19PTighbm9kZSk7CiAKLQlyZXQgPSBhNnh4X2dtdV9wcm9iZShh
Nnh4X2dwdSwgbm9kZSk7CisJcmV0ID0gYTZ4eF9nbXVfaW5pdChhNnh4X2dwdSwgbm9kZSk7CiAJ
aWYgKHJldCkgewogCQlhNnh4X2Rlc3Ryb3koJihhNnh4X2dwdS0+YmFzZS5iYXNlKSk7CiAJCXJl
dHVybiBFUlJfUFRSKHJldCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNnh4X2dwdS5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuaAppbmRl
eCBiNDYyNzllYjE4YzUuLjY0Mzk5NTU0ZjJkZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9hZHJlbm8vYTZ4eF9ncHUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
Nnh4X2dwdS5oCkBAIC01Myw3ICs1Myw3IEBAIGJvb2wgYTZ4eF9nbXVfaXNpZGxlKHN0cnVjdCBh
Nnh4X2dtdSAqZ211KTsKIGludCBhNnh4X2dtdV9zZXRfb29iKHN0cnVjdCBhNnh4X2dtdSAqZ211
LCBlbnVtIGE2eHhfZ211X29vYl9zdGF0ZSBzdGF0ZSk7CiB2b2lkIGE2eHhfZ211X2NsZWFyX29v
YihzdHJ1Y3QgYTZ4eF9nbXUgKmdtdSwgZW51bSBhNnh4X2dtdV9vb2Jfc3RhdGUgc3RhdGUpOwog
Ci1pbnQgYTZ4eF9nbXVfcHJvYmUoc3RydWN0IGE2eHhfZ3B1ICphNnh4X2dwdSwgc3RydWN0IGRl
dmljZV9ub2RlICpub2RlKTsKK2ludCBhNnh4X2dtdV9pbml0KHN0cnVjdCBhNnh4X2dwdSAqYTZ4
eF9ncHUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSk7CiB2b2lkIGE2eHhfZ211X3JlbW92ZShz
dHJ1Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1KTsKIAogdm9pZCBhNnh4X2dtdV9zZXRfZnJlcShzdHJ1
Y3QgbXNtX2dwdSAqZ3B1LCB1bnNpZ25lZCBsb25nIGZyZXEpOwotLSAKU2VhbiBQYXVsLCBTb2Z0
d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
