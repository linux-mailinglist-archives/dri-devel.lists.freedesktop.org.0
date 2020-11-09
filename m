Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B42472AC6CD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C248953E;
	Mon,  9 Nov 2020 21:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9F48953E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p22so941572wmg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MH4JrPJnV93KjKdduQzhuU+LLZMbEyGUifyLAOa0/tA=;
 b=LZgL07ggHJ7R0ptAiCpzHF9zdgd23QxQBllK5tecy3Tb0t8KoVT1vGpK9+6IeZl6Ef
 QoIJBhYsx0LZBTWLDq0577hYyZJNNfKp+3WPEuTdHhOgXWdJt5fegyQFRifigj05BvOy
 20yqpzld/RJwNMLhDNKYqkxNtMyDyaZoqI2T8b7sL5FRdcvW4K8xR6xjT3DLqtGK+/8y
 25EH/0vFCbVKQyOrgk+EDhDJ726xYSE33dZ+NebIY+hwswqauDuUYiNGxQ4ZFGC9sxrZ
 kIA64UzFlAZUGyLWCj6urbm00THq2CnDEDDejjZXcE6t1KYu0ZbV6AgMTzfHPn3FNzd8
 7G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MH4JrPJnV93KjKdduQzhuU+LLZMbEyGUifyLAOa0/tA=;
 b=jYqhmS9linTlPvhqvKFk3k4N5CCi6ETixBMEtNAvenffgz0SbPEZM7iQ6xoGS2/nvm
 U4ei4vDNIMZNaxTjPbdtDalMd73z7BTm8EVRHhTcCiu6MnN3ukg3x0FoRmChxaVqSTPF
 c6DRxdnj4BOtQAf+j7MdnXIlelNgZbtrXs5dOY+vD5JciiBa2rPasXYS+19yDN087ov9
 kUX+mfF7Xw3kfrD13iAmZSPw4eMogQ+7rI74omfgdnBW0wkdYK1D4s9NEczuBBvXxcX9
 JZhYW2alkFjBFNXVbD0DmNj7sXXvBRQbkMPcvatAaD4yRv3Q7G2m1yvR8YoqLMXaRTFa
 spig==
X-Gm-Message-State: AOAM533y17GmrwSony2tVoWm8fTFxB6zD1mS4w1NKZCgJlvOaEUTg7RC
 whHqwgAnGcxBtXQQlISbtTfxGstRISnIdPWb
X-Google-Smtp-Source: ABdhPJxdSPxtoC36afFGHEwvmULh35smowKhbslHUgo2HOWGKa+63fsjzvMsN+Wp2EpaveQFY8ErUQ==
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr1090012wma.75.1604956742114; 
 Mon, 09 Nov 2020 13:19:02 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/20] drm/radeon/radeon_ttm: Place declaration of 'rdev' in
 same clause as its use
Date: Mon,  9 Nov 2020 21:18:36 +0000
Message-Id: <20201109211855.3340030-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, Jerome Glisse <glisse@freedesktop.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmM6IEluIGZ1bmN0aW9uIOKAmHJhZGVvbl90dG1f
dHRfY3JlYXRl4oCZOgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmM6NjExOjI0
OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZGV24oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBKZXJvbWUgR2xpc3NlIDxnbGlzc2VAZnJlZWRlc2t0b3Aub3Jn
PgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyB8IDggKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwppbmRleCA5NTAzOGFjMzM4MmUyLi5hOGM5MTU5MjAw
NzBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwpAQCAtNjA4LDIxICs2MDgsMjEg
QEAgc3RhdGljIHZvaWQgcmFkZW9uX3R0bV9iYWNrZW5kX2Rlc3Ryb3koc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQKIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICpyYWRlb25f
dHRtX3R0X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJCQkgICB1aW50
MzJfdCBwYWdlX2ZsYWdzKQogewotCXN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2OwogCXN0cnVj
dCByYWRlb25fdHRtX3R0ICpndHQ7CiAJZW51bSB0dG1fY2FjaGluZyBjYWNoaW5nOwogCXN0cnVj
dCByYWRlb25fYm8gKnJibzsKLQotCXJibyA9IGNvbnRhaW5lcl9vZihibywgc3RydWN0IHJhZGVv
bl9ibywgdGJvKTsKKyNpZiBJU19FTkFCTEVEKENPTkZJR19BR1ApCisJc3RydWN0IHJhZGVvbl9k
ZXZpY2UgKnJkZXY7CiAKIAlyZGV2ID0gcmFkZW9uX2dldF9yZGV2KGJvLT5iZGV2KTsKLSNpZiBJ
U19FTkFCTEVEKENPTkZJR19BR1ApCiAJaWYgKHJkZXYtPmZsYWdzICYgUkFERU9OX0lTX0FHUCkg
ewogCQlyZXR1cm4gdHRtX2FncF90dF9jcmVhdGUoYm8sIHJkZXYtPmRkZXYtPmFncC0+YnJpZGdl
LAogCQkJCQkgcGFnZV9mbGFncyk7CiAJfQogI2VuZGlmCiAKKwlyYm8gPSBjb250YWluZXJfb2Yo
Ym8sIHN0cnVjdCByYWRlb25fYm8sIHRibyk7CisKIAlndHQgPSBremFsbG9jKHNpemVvZihzdHJ1
Y3QgcmFkZW9uX3R0bV90dCksIEdGUF9LRVJORUwpOwogCWlmIChndHQgPT0gTlVMTCkgewogCQly
ZXR1cm4gTlVMTDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
