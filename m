Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD42ADF71
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0990989C1F;
	Tue, 10 Nov 2020 19:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6082A89BF8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:41 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a65so4311526wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BSn+OXUyqlvsEb5g4HG7YJio2FrFxnG4RAzoSpJ37n4=;
 b=IWSDVKQFg3hpW8WwWnraoONM854vSPQmeNeTXUPVHV2/Mrs0NRUEKMoXn9yMH91a+B
 68ndDNvEffubTXaT7qdx8pdnKbe0bn0OWdVSy0Y4ttygX7CeW5rC91Cf7opxRCPpTZ4u
 mJ5Z88gfhGnngt/P+SIBa18MYmx+vzsnUTjS1lupg/L2S15JCAy38Szym/o6fDNcFpS8
 zspEldGMz285nlZIgF2gy0AGAGL7PAs8AxLYCSNIHCbxlVdqoD46QmdMHn4Wn7W6Xc6V
 AK9qL5k45Pr4fW60coQpZkbVQ8AHoZD6WE+mdwv3lRwL36VWbSOS/7hPW10x66D2uFiN
 qbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BSn+OXUyqlvsEb5g4HG7YJio2FrFxnG4RAzoSpJ37n4=;
 b=r1a68KUwaK0esADHBzmL4ciWzg9s35NaWuA6haRT4IjXIymMwK9zplCYG4Ac/ABgyD
 h0WsgourJwRtPjmaLtuZjat+2dbEiCD8dtXXF4c2hJ3JOpbMCL1/QMQck6JwGD5PvFKD
 olUiarBa7dJF/kikMJDoWArR2Zzi1pPzz8JElSCJjFUgeacZNtYh83aL1c7TJjE881Dz
 7zRE2ff5psBbTTuH15p3ARzJT5XFXeELklgKrcVcurAIzISg2pOJiCKkarLmehmrT1fL
 ZnutMiDMonn1KrJMjipoHKVxKiew6Y0/yQOvtsa9TI1/spIIE2KqM9UcVwwXCPa9WyVp
 czpg==
X-Gm-Message-State: AOAM531huW2Tn+eJ4U5Iqag/9s/bazL7/A40sY/D2WQk8U1vFH9VtDAw
 scbSCRTAs8g17RcAfgBIo8Z4lA==
X-Google-Smtp-Source: ABdhPJxZcgoA5uKFmKKTZVIW/QgalvI0vViRhWbaPgPhsBdeo0EbXOdxljHdeWjtUnGgsfAjxAHN5w==
X-Received: by 2002:a1c:66d5:: with SMTP id a204mr699617wmc.184.1605036700071; 
 Tue, 10 Nov 2020 11:31:40 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:39 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/30] drm/radeon/radeon_drv: Move 'radeon_mmap()'s prototype
 to shared header
Date: Tue, 10 Nov 2020 19:31:01 +0000
Message-Id: <20201110193112.988999-20-lee.jones@linaro.org>
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
 Alex Deucher <alexander.deucher@amd.com>, Gareth Hughes <gareth@valinux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmM6OTMxOjU6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYcmFkZW9uX21tYXDigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQog
OTMxIHwgaW50IHJhZGVvbl9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSkKIHwgXn5+fn5+fn5+fn4KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEdhcmV0aCBIdWdoZXMgPGdhcmV0aEB2YWxpbnV4
LmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgfCAyICst
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uaCB8IDEgKwogMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2Rydi5jCmluZGV4IDUzNmIyNDZiOWE2YWEuLjJiOWRlYWVhZDk5YjIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2Rydi5jCkBAIC01MSw2ICs1MSw3IEBACiAjaW5jbHVkZSA8ZHJtL3Jh
ZGVvbl9kcm0uaD4KIAogI2luY2x1ZGUgInJhZGVvbl9kcnYuaCIKKyNpbmNsdWRlICJyYWRlb25f
dHRtLmgiCiAjaW5jbHVkZSAicmFkZW9uLmgiCiAjaW5jbHVkZSAicmFkZW9uX2RldmljZS5oIgog
CkBAIC0xMjUsNyArMTI2LDYgQEAgZXh0ZXJuIGludCByYWRlb25fZ2V0X2NydGNfc2Nhbm91dHBv
cyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgY3J0YywKIAkJCQkgICAgICBr
dGltZV90ICpzdGltZSwga3RpbWVfdCAqZXRpbWUsCiAJCQkJICAgICAgY29uc3Qgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGUpOwogZXh0ZXJuIGJvb2wgcmFkZW9uX2lzX3B4KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpOwotaW50IHJhZGVvbl9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7CiBpbnQgcmFkZW9uX21vZGVfZHVtYl9tbWFwKHN0cnVj
dCBkcm1fZmlsZSAqZmlscCwKIAkJCSAgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCSAgdWlu
dDMyX3QgaGFuZGxlLCB1aW50NjRfdCAqb2Zmc2V0X3ApOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl90dG0uaAppbmRleCA5MWVhNzE0MWJjODEyLi40ZDdiOTBlZTI3NzQwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl90dG0uaApAQCAtMzIsNSArMzIsNiBAQCBzdHJ1Y3QgcmFkZW9uX2Rldmlj
ZTsKIAogaW50IHJhZGVvbl90dG1faW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB2
b2lkIHJhZGVvbl90dG1fZmluaShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CitpbnQgcmFk
ZW9uX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsK
IAogI2VuZGlmCQkJCS8qIF9fUkFERU9OX1RUTV9IX18gKi8KLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
