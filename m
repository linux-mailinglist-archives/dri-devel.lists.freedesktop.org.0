Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A792AF816
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3496E0B6;
	Wed, 11 Nov 2020 18:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F076E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:35:52 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b8so3528477wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 10:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyNxvxME2tG4MioZh0DLPpucvuaAdYEDiX4yy0UM7tE=;
 b=pZ+Qh5Ir0/lUkjSQsdZgT0qNsnE0Kwon6ayRY4sx+bJ7U2t95+wam8fCVcVYBQy3hX
 AuDoAsSXTh3xeuT4E4r2i+u0RRFD1EiCY9T3C0Xgkq8wSfVcPtW9PVHnim5Cnp+zsmT9
 zz112QT7ngXkmeKYTV3biTKexdGTYGHonT4el6Xo2iPzUX/ZkfMN3Du0t7dd80eMKzZP
 f93rAUQgaRHJzbR7P9KIZYs5AM0iFg4IUBa1MtgtG3Q/Owj5iXYPEx9PjJBnC5zbS6C8
 xR3zEPCXFZNsjaNtqFCbfMXBHlp+C98S3ZNNEW8ePYQAYo/iIenIqSTFaMe9Vs6uQnEw
 sEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyNxvxME2tG4MioZh0DLPpucvuaAdYEDiX4yy0UM7tE=;
 b=eluTqR7YOQRKS2WOt9VvmqpOtcIUTsFrmZLXPpuIpfnjf+ombsP0XJof09nxKi/qa9
 +hCcjkCzegaSE8/JZeUYBtDMgQMt0IH5xjfOlNbL1L6fn6ziiuicuoPDGZ+QcBGU/XrO
 v8hX4zJxU4JTUCliUS7MPLWEv/rMT1yt++wsAIdzXPh9b5x51KtbfINffjZbrDZLyBty
 QOsw9jHFE8m8TncsXo09iR1M1UjukN6L7pIV6RaQpX0eMZoEP1nf08nzEBtzDOk0bmgp
 lwKGt0aPxRPFmMkP4pMV5kO79auWrYl7xBngkKVQPQhl9iwclzTRdJJeu1YCDYVxmjp4
 tPcQ==
X-Gm-Message-State: AOAM533jRrWGrcWe/Fcvg4VWHxnoM8iGxOsq9VoWZ99Df7fAuF6b/5Bo
 ppv4YcDO1BIlEJyuNR21DKwwVQ==
X-Google-Smtp-Source: ABdhPJzXU4WDrLLMPa79WjcoHOQsKAyxzRDNTbkyMczIslidwC4TN6humNF53xIsEkReAjLaT3O4uw==
X-Received: by 2002:adf:de91:: with SMTP id w17mr30549664wrl.84.1605119751376; 
 Wed, 11 Nov 2020 10:35:51 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:35:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/19] drm/radeon/r600: Move 'evergreen_rlc_resume()'s
 prototype to shared header
Date: Wed, 11 Nov 2020 18:35:28 +0000
Message-Id: <20201111183545.1756994-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYzo0MzgwOjU6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYZXZlcmdyZWVuX3JsY19yZXN1bWXigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQogNDM4MCB8IGludCBldmVyZ3JlZW5fcmxjX3Jlc3VtZShzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldikKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9ldmVyZ3JlZW4uaCB8IDEgKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMg
ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uaCBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmgKaW5kZXggZWI0NmFjNzc3Njk1MS4uZjhk
NzcyZTYxMmE0OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4u
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5oCkBAIC00OCw1ICs0OCw2
IEBAIHZvaWQgZXZlcmdyZWVuX2dwdV9wY2lfY29uZmlnX3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKIHUzMiBldmVyZ3JlZW5fZ2V0X251bWJlcl9vZl9kcmFtX2NoYW5uZWxzKHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHZvaWQgZXZlcmdyZWVuX3ByaW50X2dwdV9zdGF0
dXNfcmVncyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB1MzIgZXZlcmdyZWVuX2dwdV9j
aGVja19zb2Z0X3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKK2ludCBldmVyZ3Jl
ZW5fcmxjX3Jlc3VtZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiAKICNlbmRpZgkJCQkv
KiBfX1JBREVPTl9FVkVSR1JFRU5fSF9fICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3I2MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jCmluZGV4IDk0ZTg4
MTVlNTA2N2QuLmI0NGUwYzYwN2IxYjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcjYwMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jCkBAIC0zOSw2ICsz
OSw3IEBACiAKICNpbmNsdWRlICJhdG9tLmgiCiAjaW5jbHVkZSAiYXZpdm9kLmgiCisjaW5jbHVk
ZSAiZXZlcmdyZWVuLmgiCiAjaW5jbHVkZSAicjYwMC5oIgogI2luY2x1ZGUgInI2MDBkLmgiCiAj
aW5jbHVkZSAicnY3NzAuaCIKQEAgLTExMyw3ICsxMTQsNiBAQCBzdGF0aWMgdm9pZCByNjAwX2dw
dV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHZvaWQgcjYwMF9maW5pKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2KTsKIHZvaWQgcjYwMF9pcnFfZGlzYWJsZShzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldik7CiBzdGF0aWMgdm9pZCByNjAwX3BjaWVfZ2VuMl9lbmFibGUoc3Ry
dWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwotZXh0ZXJuIGludCBldmVyZ3JlZW5fcmxjX3Jlc3Vt
ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiAKIC8qCiAgKiBJbmRpcmVjdCByZWdpc3Rl
cnMgYWNjZXNzb3IKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
