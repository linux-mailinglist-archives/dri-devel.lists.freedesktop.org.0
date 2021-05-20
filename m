Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76838AD81
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F0F6F405;
	Thu, 20 May 2021 12:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865446F428
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:41 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso5257994wmm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jO7V0H98Qg2tMCIwDj4FeeKzGM5dSknTEV1LYii8u8w=;
 b=W4x0Pew/IdeVOzVWOMkZldd12omXYquCVkPlxohuHIUCvZ/BWTepLzjBlhhiblpmG0
 gUJwuwhnYvyv3Q3h88pNwzZmHXBXelFCn6KJjQLnX6ztOSiKbeLA8UQ59wDQB2zY9GaL
 QLs6gEfartIy6XZI2vtzV58nNt4DztnsXEvnC40J/30hlNC2OMHkkZA3dq9TFiT/N9Mf
 dd0Bp1pJrdlAv+FGpU8Ls1aO0UGpHh4ZR66obyMP/QvI82ONSDznjEddDWl0rdVuXqLV
 C58IkWCeCV0wiruzMSD8MyGAIL0W379+i/+Dm5F23398Yl+LZOo+S2CYDUorHkHYMCty
 sF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jO7V0H98Qg2tMCIwDj4FeeKzGM5dSknTEV1LYii8u8w=;
 b=DnWolJxmwPvZ4rts2pQz9CuLwxIwkIpPZ13WvsXAENvtSiC7d4AKV/ZqZGmBLDDOXl
 me7RoYydZ1SY6tN7lqpeRavZfAsm2LD55zWF0KIGbmro2+FPDMBkpgyTCDgb5u4pPqB8
 d2yEyuIRebzUwxxWrn/W3XZlaiSFLXtBPhW8G+xdpQSzyKhwFNTR4PVOf4qRY/EGMFbj
 8ldzjfv9GX8F9Xc6bUBgMfhi6URUsDei276E5Xwm7zxjkyUa8XhkN4KccgzM8C3ZWio7
 nGIKxWkz6T/RUudLY8L8uGV7V6WO50Mdnhed24KvvuwcjvZ0RdU0RFAypnn+0VMujtgJ
 KGrQ==
X-Gm-Message-State: AOAM5335RnjDbrTEtb5hOgps43zYQib0Y6hnBBsjrxzMj2O0k/5Sk0YE
 Crik7GCOgZvPY173KzaqmLw7tA==
X-Google-Smtp-Source: ABdhPJyV3+TJPHVMnYSdJETlXphndM0hvCrXSlYbuhpUFkSBWFHcg1oC7Whm3urACs0DpxdCMukdUQ==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr3238405wmb.141.1621512220189; 
 Thu, 20 May 2021 05:03:40 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:39 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 37/38] drm/amd/amdgpu/gfx_v10_0: Demote kernel-doc abuse
Date: Thu, 20 May 2021 13:02:47 +0100
Message-Id: <20210520120248.3464013-38-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:51: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index fc12e3c3e9cae..c833be31e4ae6 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -47,7 +47,7 @@
 #include "gfx_v10_0.h"
 #include "nbio_v2_3.h"
 
-/**
+/*
  * Navi10 has two graphic rings to share each graphic pipe.
  * 1. Primary ring
  * 2. Async ring
-- 
2.31.1

