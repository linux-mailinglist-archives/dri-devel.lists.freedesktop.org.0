Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE06CBBB4E
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 15:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2417510E496;
	Sun, 14 Dec 2025 14:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J1ZaLZMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DBC10E497
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 14:03:25 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7b8bbf16b71so2757528b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 06:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765721005; x=1766325805; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lCxY3lhzUAu/xvlgVrdpK38D40VSsWRpy5wQseo6TFU=;
 b=J1ZaLZMBCRGH8ICbgFq03cCFwqLrhCq2DpQpKpWQ+aCkR0Coz1a5AVE0k0079Nd7IS
 7yyJSDF0w2sQe7gowQ4oRk44sJPK0Sfc/TSIw1JVzziFU/mGMLAwmeQUEPlTk0kdCp0L
 t5aYbmTaJSjwixTE9T1BZHSnRj1PyCd4S+OcCkfNsBehbynBBekmK73/PSy7dWOe1x6J
 YxpOdUjMSjAHxcYTMgHBUJwnET7bNrDqsV8lv3QL0sP8JbtVAFF3O3/eghcIFEet/BwZ
 PzP1k0GlNxmqMeJ9jT/C6nW3vlzGPwhNLBjWjXtsHYUPGv6SnkIp8Ik5M27A0FPnbKoF
 xEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765721005; x=1766325805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCxY3lhzUAu/xvlgVrdpK38D40VSsWRpy5wQseo6TFU=;
 b=ob/2AeION13z1RJCuqEOOoqXVGEv4TddrUgeX6mC/YHx/5/MmNWR0c1L20eUN508cs
 /T/308Qs2w5PmgSm1a7OLL4qQpPuF4K7fl03DqywrSbgRy6NWeu7DOV35uN20tfB30Cr
 xNHzPAldlNJLt1tcN7C0IGuawFBt0XY1Fo38+VhrVSZNE+RVg5R5wWqK/ld3NkSI1gKP
 Rd5Zk8sYx6aFaEbuzvxK/B++Ppwwz2b4Jcg1h8y+C4CsyN1TA9eh6+GNcfLgkfK9mSfp
 Xu+faz8Z3yL1stxYOaJ6DflCZqUb10pICHbQadV+SoiTcN6Z1Bgvk0N1I79IKln37Y55
 RV2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTCWj7Cc9+O9doR7Oa6962+hh4MQjYW/G+TKfu+qbj96Zv9PFnvKtPqAOaGAwCuiAT1T0PbD+Pcls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa4Z4tEuABOx0MJDvcedTWMAmHyPMENDqS9LDrqv+VrDyiHu36
 T0PulsXoSaW5MC+dZs2nLF9dds18Li5eES3leWNJbL/PLSsgAvgIjC9yxkqvZXYc
X-Gm-Gg: AY/fxX5LEGKIhX/1ohsmiGXDBGcXWiP59Woqqn3D1oaiekzNk5owrCLr3GJY/5bswbw
 7XwHBGhYWlj9gkJKuO+E/yNDc5jGEyMJhEjlEEhc6DScSOVlE2ssIa+b5VOm94sGiMD4hRjrzQU
 /+UgC6L9RkoDXpPVJnsntOtcUV6Ln6dcC97at/SGPe3ETnLH4lfPpNRA8c47IolcFZ6C/vGo0Hh
 tCy7FBosaHnZKDLQMiqEn/FN4IfGFJckN3HoK13J4KP9tCyCmwPVhUj4I7GNGO0g6ZkNRA7BPRQ
 Tq0L4SzTii6dgp/y/tAwxwtmj+XWfTYpHfYo6MWscdJRq5fuku2toJYpVq298BPG1D9uY62XV/z
 tbqeAPP9sNkjQ2nvZtL9da5gg1dJRp7FTubdb6XyTLipXVS4UmSJeNDpz7Twc1IQo6B2ybFsRbY
 /GpXJEirkcr789kJKe3p4=
X-Google-Smtp-Source: AGHT+IF/8DyCTIDqIiNfR2carEZCo4WMAg6ZpjrHBT+vhF1qd9c3UkgS9nbSXUeUzJ5pPptBTCplOw==
X-Received: by 2002:a05:6a00:8c11:b0:7e8:450c:61c1 with SMTP id
 d2e1a72fcca58-7f671960f07mr6478071b3a.49.1765721004997; 
 Sun, 14 Dec 2025 06:03:24 -0800 (PST)
Received: from LilGuy ([2409:40c2:105b:dc88:1107:395c:23c0:2b1b])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7f4c53847e4sm10130683b3a.56.2025.12.14.06.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 06:03:24 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR LOONGSON)
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] drm/loongson: Replace custom dumb_map_offset with generic
 helper
Date: Sun, 14 Dec 2025 19:33:01 +0000
Message-ID: <20251214193302.14589-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
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

The lsdc driver implements a custom dumb_map_offset callback which is
functionally equivalent to the generic drm_gem_dumb_map_offset helper,
but lacks standard safety checks.

The generic helper adds:
1. A check to prevent mapping of imported objects (which is invalid for
   dumb buffers).
2. A call to drm_gem_create_mmap_offset() to ensure the offset is
   correctly allocated before access.

Replace the custom implementation with the generic helper and remove
the now unused lsdc_dumb_map_offset() function.

This addresses the TODO:
"Documentation/gpu/todo.rst: Remove custom dumb_map_offset implementations"

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---

Compile-tested only.

 drivers/gpu/drm/loongson/lsdc_drv.c |  2 +-
 drivers/gpu/drm/loongson/lsdc_gem.c | 16 ----------------
 drivers/gpu/drm/loongson/lsdc_gem.h |  5 -----
 3 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index abf5bf68eec2..50023b5573a4 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -45,7 +45,7 @@ static const struct drm_driver lsdc_drm_driver = {

 	.debugfs_init = lsdc_debugfs_init,
 	.dumb_create = lsdc_dumb_create,
-	.dumb_map_offset = lsdc_dumb_map_offset,
+	.dumb_map_offset = drm_gem_dumb_map_offset,
 	.gem_prime_import_sg_table = lsdc_prime_import_sg_table,
 	DRM_FBDEV_TTM_DRIVER_OPS,
 };
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index 6372db2d3093..9f956e63cce3 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -234,22 +234,6 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
 	return 0;
 }

-int lsdc_dumb_map_offset(struct drm_file *filp, struct drm_device *ddev,
-			 u32 handle, uint64_t *offset)
-{
-	struct drm_gem_object *gobj;
-
-	gobj = drm_gem_object_lookup(filp, handle);
-	if (!gobj)
-		return -ENOENT;
-
-	*offset = drm_vma_node_offset_addr(&gobj->vma_node);
-
-	drm_gem_object_put(gobj);
-
-	return 0;
-}
-
 void lsdc_gem_init(struct drm_device *ddev)
 {
 	struct lsdc_device *ldev = to_lsdc(ddev);
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.h b/drivers/gpu/drm/loongson/lsdc_gem.h
index 92cbb10e6e13..f79f06874286 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.h
+++ b/drivers/gpu/drm/loongson/lsdc_gem.h
@@ -14,11 +14,6 @@ lsdc_prime_import_sg_table(struct drm_device *ddev,
 			   struct dma_buf_attachment *attach,
 			   struct sg_table *sg);

-int lsdc_dumb_map_offset(struct drm_file *file,
-			 struct drm_device *dev,
-			 u32 handle,
-			 uint64_t *offset);
-
 int lsdc_dumb_create(struct drm_file *file,
 		     struct drm_device *ddev,
 		     struct drm_mode_create_dumb *args);

base-commit: a859eca0e4cc96f63ff125dbe5388d961558b0e9
prerequisite-patch-id: 84f019e50f016ed5c37c15cb809158ab022686be
--
2.52.0

