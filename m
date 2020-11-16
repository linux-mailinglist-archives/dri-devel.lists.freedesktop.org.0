Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB42B4D3E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020286E06D;
	Mon, 16 Nov 2020 17:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3676E061
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a65so32238wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyNxvxME2tG4MioZh0DLPpucvuaAdYEDiX4yy0UM7tE=;
 b=U3XpEpiWRsz0j+hMtLDZ8ijrHq2pxzt4Q63ge8BICYDILPrM0Uk4Znt6t3gnNNK6TA
 NlOKoWX3AV2dY6ZopWymRVjS6pKydRf3Qy9yyqC+dsxNtmX1UWDNjK6g1ijj8+MSV1PS
 diXcNe5FtP7YT1fRvskacyGs+kp2Rj2sSYX2lkHzUuwA+ZHhRI4Cll4N/5sRzHkFYVaq
 MkX1VQC13yUvBzlVxq3Hmv3pczoGHnxuBNInJfWzFE11iZ7h0ZMcoMLObo7M9IgVC4/R
 k6amszu3ErtAEjGk8HeP0Ws64DknQnHPnko2q4YWihbQ/WiOE45rttjDJudtgCmsouyQ
 M+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyNxvxME2tG4MioZh0DLPpucvuaAdYEDiX4yy0UM7tE=;
 b=WU96sko8KB1pn5cuA21dz4DsPvUYH+o8i6PpvcS7/LzovmdwulPj1ajzE9ej1298FI
 F1BgnzF54EcXwqrp9q3o/3GoezR5q57aQCq7WKVGHKm/tpxoZnjeQd8DGjZMUWy153Db
 psLtHVxIEYei4L1VT8LLFWb/LV7vwsngxc5OmfzJcQyDqYycxY8qvDa1snbPChuCb6d8
 oz+roRtko1a6wcIlhncorKg+5mYVezWxL1ITcw8kwBe/CRcl6uwxBk+vFcGb3ui/UnJA
 UK8PtQPYN49Eo2I/C+mvRdC6YIYZ74N00m55kRhrkoPhUB/81tED+KELEDsPhYsVTwFQ
 Do9w==
X-Gm-Message-State: AOAM531xL2mOJwPC9cnDI/0Li4dfwD/U/+itiZDrhZVYVyK/6e+7/vOS
 m3jwHhuxCscVC2aw6YXhiZ4Edg==
X-Google-Smtp-Source: ABdhPJxjNzoVEL+7L/X1+qeuAPEwh/Hw3rRmVVjqZSe7TGSI246nAKkLp8ED984/eStmZR1+Gdt8Lg==
X-Received: by 2002:a1c:b0c4:: with SMTP id
 z187mr16321450wme.113.1605548258220; 
 Mon, 16 Nov 2020 09:37:38 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:37 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/43] drm/radeon/r600: Move 'evergreen_rlc_resume()'s
 prototype to shared header
Date: Mon, 16 Nov 2020 17:36:41 +0000
Message-Id: <20201116173700.1830487-25-lee.jones@linaro.org>
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
