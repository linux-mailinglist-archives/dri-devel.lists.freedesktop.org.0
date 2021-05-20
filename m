Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAEE38AD80
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012876F418;
	Thu, 20 May 2021 12:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10946F43D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x8so17378473wrq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=25hbKCKPnZleCOPr+RSYM8icUrz00DW2ZJX4QTilpw8=;
 b=T+NtzJmFUghwg7s32gDqjUu8IBC4kxHD18dAQVtRRVAmbg0mCylHk99kLxQQPe45t7
 mQwRZi00yTostuRy+A6rYt60NFhyn5sMWlWDlrC/SgC684FQxmPGwrOBcjAWxsHYiT6m
 X2QhXN5aCsKAbsT0nir4URuVJYeK46Emef0w3uyEPkFy/dsc834OSj5V6xX/Cm+eywih
 YYIEL5odB9rBQzvi3rR42Qy26ybZkPttc/evZ2pDRDawBBBcupFY7l6jEAEZ9KOfhWqW
 fdbNuvFM1uzpcK7ZyGlIyXPRPfemXKC0Ecpj53AbEx+IzL/YMlxvUoBwZUs1ajfWbbbO
 Hsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25hbKCKPnZleCOPr+RSYM8icUrz00DW2ZJX4QTilpw8=;
 b=a6rnQlFYffwISl9L8T21exOc0iGsLbBo3sLq7Z97NTkokPkBMCHeJ8FxV2bQyjBfiG
 2qwJbOQIkOBzoH+gEe/lJ3Z3W6yb9DI5iZ1c6aBte8JdZvC8HJIRAzkwzwyjnbyYZfjE
 f1cw/LhspV89Ov7tSNOr/Lc2nCQVkmbZ/C7nMeb9dBwCkn0HzUntztTiPbtAYjUuJwnX
 9Pe/YmBbkoNu1+O54ihgRgJWUVhhKkEApB2lcEXNBBwkLaCdyF+M3fJLIqidQKFVgLLt
 F0VBQyQFusHoXwJezRauicZ21EBVey2BjerZhuWkkE/n7q8JAv5fq3oPMPVwpku+dn13
 SveA==
X-Gm-Message-State: AOAM5329268lblZnsFqTnIy2x4wDe0qXJHZ1F5vFDYv8kgCv9PSuY9xU
 oIrudreKFlDxbgcjDZsbwuZDog==
X-Google-Smtp-Source: ABdhPJyL3A14u1dIYxWZuBNDzCNakC9GYeqVMGa1CSSlfC6rvVzVOSJi3RJqmvSko5JP/WBPAWzp9g==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr4040620wrt.189.1621512216601; 
 Thu, 20 May 2021 05:03:36 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 34/38] drm/amd/amdgpu/amdgpu_vce: Fix a few incorrectly named
 functions
Date: Thu, 20 May 2021 13:02:44 +0100
Message-Id: <20210520120248.3464013-35-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:98: warning: expecting prototype for amdgpu_vce_init(). Prototype was for amdgpu_vce_sw_init() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:214: warning: expecting prototype for amdgpu_vce_fini(). Prototype was for amdgpu_vce_sw_fini() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:590: warning: expecting prototype for amdgpu_vce_cs_validate_bo(). Prototype was for amdgpu_vce_validate_bo() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:724: warning: expecting prototype for amdgpu_vce_cs_parse(). Prototype was for amdgpu_vce_ring_parse_cs() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:960: warning: expecting prototype for amdgpu_vce_cs_parse_vm(). Prototype was for amdgpu_vce_ring_parse_cs_vm() instead

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index ea6a62f67e380..7ad83da613edd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -87,7 +87,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 				      bool direct, struct dma_fence **fence);
 
 /**
- * amdgpu_vce_init - allocate memory, load vce firmware
+ * amdgpu_vce_sw_init - allocate memory, load vce firmware
  *
  * @adev: amdgpu_device pointer
  * @size: size for the new BO
@@ -204,7 +204,7 @@ int amdgpu_vce_sw_init(struct amdgpu_device *adev, unsigned long size)
 }
 
 /**
- * amdgpu_vce_fini - free memory
+ * amdgpu_vce_sw_fini - free memory
  *
  * @adev: amdgpu_device pointer
  *
@@ -574,7 +574,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 }
 
 /**
- * amdgpu_vce_cs_validate_bo - make sure not to cross 4GB boundary
+ * amdgpu_vce_validate_bo - make sure not to cross 4GB boundary
  *
  * @p: parser context
  * @ib_idx: indirect buffer to use
@@ -715,7 +715,7 @@ static int amdgpu_vce_validate_handle(struct amdgpu_cs_parser *p,
 }
 
 /**
- * amdgpu_vce_cs_parse - parse and validate the command stream
+ * amdgpu_vce_ring_parse_cs - parse and validate the command stream
  *
  * @p: parser context
  * @ib_idx: indirect buffer to use
@@ -951,7 +951,7 @@ int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, uint32_t ib_idx)
 }
 
 /**
- * amdgpu_vce_cs_parse_vm - parse the command stream in VM mode
+ * amdgpu_vce_ring_parse_cs_vm - parse the command stream in VM mode
  *
  * @p: parser context
  * @ib_idx: indirect buffer to use
-- 
2.31.1

