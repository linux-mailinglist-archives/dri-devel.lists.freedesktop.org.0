Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E413A15804
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 20:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3693B10E0E9;
	Fri, 17 Jan 2025 19:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hEHj1Xec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E12E10E0E9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 19:14:11 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3eba7784112so1328469b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 11:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1737141249; x=1737746049;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Tdg+2ivhzG9aHDsjFSHqEHax2k8Xyv8m7nn8s1iQu8=;
 b=hEHj1XechHKye18zfQkJj3ndBWugsJ+7ZMUpEZZQu8q5F4qTd5Yv0giYF8YF2NZYbD
 yr+yG4PU+Dgwy/CYv4zACP2yoxtEfJZkSl6PtMDvlF4d3TBHl2Wi6ibYGo/hbhgT+Kh8
 +eIsp3ZixRhzSNs93q4MP/kmOLd+bIpsAyQTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737141249; x=1737746049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Tdg+2ivhzG9aHDsjFSHqEHax2k8Xyv8m7nn8s1iQu8=;
 b=EbI9b7eIchorZSSwcbnsYb5jp7AFsq9DyP7qZQ4Oyzw0e/R56RQnXz93+K4vpQZ6M7
 70esjt4+8p6PJKVyzCmAGcToxqkGPgsC33atBFjJhqCXNmOBkSLF7KX83DGh4x0zRY6Q
 ILqXJyZ+ViTS7cRpkPDdb4bXY9+B3ONqfRmDRUPG4gK0nKxubnOMdnjFuD539oXBMw3K
 5XefUVq+9iqbcZsLiEHp+eem6tiC+gSeTxUG6ev6VJHRXbOYhasBfAMyeV5tSxGBmpHH
 Y55lyOm13SOoND3d4kd5SQP3B7IZ/7aEwzgnirpQFpD7bxnlZUL65Uzch/AUxwZc1Y1B
 qtAw==
X-Gm-Message-State: AOJu0Yw0JG1W4yEXv1+Bg2DW9qqHgCAWbX8oPhHTZLEHaAfTQMbf2fs2
 mHPS0qcZK3OJVSC+k1K3/2VFKQICZYOazcgN1uMfudsncYu39pfEGfmItIi9AuiOIMkmpGlbfV8
 hTsut84rIiKHsVvKERhFqzzF4HrXCGrb3qH/bCh7VPUCejQaBPIu82fawnCXaqRqSjK2CLESzT3
 yCwXEdHWoDCMZ6YgUtYw5n3b+gLGxFEXnIDaUbAownvJarL+kGGA==
X-Gm-Gg: ASbGncux2Ssc8ov2Ala/OzdPnr+4UACEGrvTYoeRpDnaQm2Hy3NEQ6k5xp0/t3/TDLO
 ukIeyTx43t2BlLGvtiwkS/SNCO6PMPNm2X3V4yxPyJZEVZzFy6q3qorboViaQNXBwo3nDwcx0cg
 F+Om2n+YbM1Y8R2Kh0fOw0eFVfLkZ2LLSsC8n/zu5A6F9TaRhpq7n8R7WYfOMnv8+O1CKSZnsia
 +l4us2Pn00j2UPwzhp8GySvFlAZciRh02Q5YjTT+cevf0IqVa9EGFras9VKJ7slD4oB1dyLCSbA
 Xl7PVP1jXp8ftFxUbH3n+yQos0zxYQp0
X-Google-Smtp-Source: AGHT+IFhmPoiWX9bOPq2YmeL4BVWe3THZMAXApR2mhkUdHceRpmJzHrIQnPfSDyxxM6qEIA20ButiQ==
X-Received: by 2002:a05:6808:164d:b0:3f0:403a:3db9 with SMTP id
 5614622812f47-3f19fd56ab8mr2160017b6e.35.1737141249441; 
 Fri, 17 Jan 2025 11:14:09 -0800 (PST)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f19db9f6casm959540b6e.50.2025.01.17.11.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 11:14:08 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: [PATCH] drm/vmwgfx: Fix dumb buffer leak
Date: Fri, 17 Jan 2025 13:13:43 -0600
Message-Id: <20250117191343.479610-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index a0e433fbcba67..491062e1eb981 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -73,7 +73,7 @@ static void vmw_bo_free(struct ttm_buffer_object *bo)
 {
 	struct vmw_bo *vbo = to_vmw_bo(&bo->base);
 
-	WARN_ON(vbo->dirty);
+	WARN_ON(vbo->dirty && !vbo->is_dumb);
 	WARN_ON(!RB_EMPTY_ROOT(&vbo->res_tree));
 	vmw_bo_release(vbo);
 	kfree(vbo);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5721c74da3e0b..3210941cca302 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -2358,6 +2358,7 @@ int vmw_dumb_create(struct drm_file *file_priv,
 	vbo = res->guest_memory_bo;
 	vbo->is_dumb = true;
 	vbo->dumb_surface = vmw_res_to_srf(res);
+	drm_gem_object_put(&vbo->tbo.base);
 
 err:
 	if (res)
-- 
2.34.1

