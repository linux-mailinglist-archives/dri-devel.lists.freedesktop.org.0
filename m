Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6CC2ADF5B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB0189BD5;
	Tue, 10 Nov 2020 19:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27A589BE8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h2so4361557wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=StAAQEcBU7NR52Iv4O4K3Wzt60gqSmLeuRfVm5ltXDE=;
 b=mZZml1jytN4/9i59YihQPrNuAaWkUZdpVAXKmHE+4/4U0iTDxxXftQINnq5G5KzB7G
 YesRLVtr9cgChuzabdGh9KH2EuSxiXVqGIXVcVPQt0PXeGOfgTM5dOjXbabrkCeznPMS
 M/oG817gEvJDwb4E3oJv+VQi0vnLJ71+SwUju8DAErlpIANOm0L3QGER585yKxQzU2Sf
 ebwUEsuVFPKaXemnBJXXnWktrStj7pS8IV4rj3r73hdlRkZN+oQgb3LOacCljFAfP4Mj
 WTSoGT13avpp4RioJ2BY4M491H5h2fw29JW0vttsqLYfbm7NEnYd57MfEAr1ELF2pGoA
 MX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=StAAQEcBU7NR52Iv4O4K3Wzt60gqSmLeuRfVm5ltXDE=;
 b=KoptQKcDago7JXPXc90oyMxpRkf74kb4NhJxdG7aqgsti3LqyF4RVc5ZpmkyaaIEX9
 ymRnPwYPHAoyNrzEED3orC5joQm5fHX//L2r+aaHvBeGndxJAtWmDtmWFSvobEdCi0ja
 hGp0BONpP/cgEYhc/4oQSMCDzjwWtt2cDf19ksgn2JAsLsx7Xp4WY2rhIzXz9fguhP4B
 al+GWkTK3RpjIAaU/HRKxIYXNg1Fux8R+IHY7lJO84t2nF/iz1eJbjit4G3DzEoDPwmL
 VuhTOeDBszl1XWbP8d8bJ8AEvNIXE1ChdTUxG38PVnUDjPx1iO0BpyGo4rvyZ5ZpvUOh
 3eUA==
X-Gm-Message-State: AOAM533L53YPguYECCmufPVXsIGy7X9/cs7p8Zi6UtRYlCBevfhlij+P
 6pD5unKc87/GK4onR9/CkdUgpA==
X-Google-Smtp-Source: ABdhPJygMM2wHpSm/z5nOffXXW1qdVFhGsZ9Tt9PjrxCds2cWRaFqtX2RLwd7EtuOhsFgrpLiAq/TQ==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr717105wmc.64.1605036681441;
 Tue, 10 Nov 2020 11:31:21 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:20 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/30] drm/radeon/si: Remove set but unused variable
 'mc_shared_chmap'
Date: Tue, 10 Nov 2020 19:30:46 +0000
Message-Id: <20201110193112.988999-5-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9zaS5jOiBJbiBmdW5jdGlvbiDigJhzaV9ncHVfaW5pdOKAmToKIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuYzozMDkwOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmG1j
X3NoYXJlZF9jaG1hcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlXQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jCmlu
ZGV4IGMyN2FmODk3ODVmMzQuLjQ1MDc2YzI3ZDdkZWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMKQEAgLTMw
ODgsNyArMzA4OCw3IEBAIHN0YXRpYyB2b2lkIHNpX3NldHVwX3JiKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2LAogc3RhdGljIHZvaWQgc2lfZ3B1X2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpCiB7CiAJdTMyIGdiX2FkZHJfY29uZmlnID0gMDsKLQl1MzIgbWNfc2hhcmVkX2NobWFw
LCBtY19hcmJfcmFtY2ZnOworCXUzMiBtY19hcmJfcmFtY2ZnOwogCXUzMiBzeF9kZWJ1Z18xOwog
CXUzMiBoZHBfaG9zdF9wYXRoX2NudGw7CiAJdTMyIHRtcDsKQEAgLTMyMDAsNyArMzIwMCw3IEBA
IHN0YXRpYyB2b2lkIHNpX2dwdV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCiAJ
V1JFRzMyKEJJRl9GQl9FTiwgRkJfUkVBRF9FTiB8IEZCX1dSSVRFX0VOKTsKIAotCW1jX3NoYXJl
ZF9jaG1hcCA9IFJSRUczMihNQ19TSEFSRURfQ0hNQVApOworCVJSRUczMihNQ19TSEFSRURfQ0hN
QVApOwogCW1jX2FyYl9yYW1jZmcgPSBSUkVHMzIoTUNfQVJCX1JBTUNGRyk7CiAKIAlyZGV2LT5j
b25maWcuc2kubnVtX3RpbGVfcGlwZXMgPSByZGV2LT5jb25maWcuc2kubWF4X3RpbGVfcGlwZXM7
Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
