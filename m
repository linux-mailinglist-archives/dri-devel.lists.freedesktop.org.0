Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A2AAFEAC1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04E210E7F0;
	Wed,  9 Jul 2025 13:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CdNz4ZfJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB86410E7EF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:52:24 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3b45edf2303so5290315f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752069143; x=1752673943; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnZp6yN6210AcxuPax3yQqzbOhJDG+erNvkp4eDuxcM=;
 b=CdNz4ZfJUFbJIPIr4iTNYZp0WW6JjXoGDAIjw2stzXdYdjJW+HDSTsKVoJfgsKCWAn
 k9cQ+rqGe0W/viborQLCMT/fxfhadMDv7JR2N5lo7N+7XTa6k9hp+sdjQxJM9fTZX2Pa
 HNII5/79+odhqeI2kXECu3Y5TcfW/KezDKHNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752069143; x=1752673943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnZp6yN6210AcxuPax3yQqzbOhJDG+erNvkp4eDuxcM=;
 b=G0MwYIo6+PiPYnkkLoGN/kVyxshzNFw6OUbXUyPLOjPHtO9g4dHK8ve1xjKHNDF4ve
 Hj+24IHSMspBBL4GtpDEwJjNkAnADTHJn22LTsWSLMv8BbSCVDhRw8B72rZRVv0tUh9M
 0YGK9wfXLM4nUtB08/AY0F3wff3rM8sIMk5ndbOzHtlvDw3YXOHZ5s20htUj8iiA61yi
 RnXgeuZhbYXOS5KhjR1oajqXbdpo0s/DBU+E4TtHAP+Vu18EJB87tyzL9AG8L7Tzg+//
 MC/uUHd06TZb61l+NMrKxKbFsEwc/TzpzhNUU9zHj7mNo/TxPrGOmiVRMm+RQE2Pxfms
 SUNQ==
X-Gm-Message-State: AOJu0YzYHMy+rnIIIihOZCenSO/y38YyRUSguNuTjfeMwANI1toZULgX
 WHPDtIrrBsWJKSEQbtfwXMeWVEiiXHfMBxFFLxFOfgtbKlYOvsHj6g9RSLWEVV2B28MUAklirrn
 jOpdjbj8=
X-Gm-Gg: ASbGncsRzCQy2Kree9Sewi4Xg7QF+mQpynUY1Wl+lOGX7rL3c7ChlPRGJPOzqDaAb/M
 2hTKwvwlSbBAaK1bAIRzCuc8Yks4L9RVJjZLTcZqNiuTKUV7W84/I5QrGy81rTmt8EHY/2Lrv1P
 oNGgjsPaJvhnTdq+ezijjzn4J9UDPJFtUEiZmyGxdPNZH6CJrUL9RCzOXK1Vn0SyqkioEed2CFH
 mBt5Dd8sa8kljRVHtQS7+ajUYzY0ahi6lZGDG8j00pBErxSHWm6ucpI+V5WmLfmoPOXqrKh7/EW
 RyAi7iS8+iBgR+qZTxkZ/5VJWBU29QrFnQOwBfEegoKSCmYscrJEhjG6QRhm/Cw60Bgnc+i+ww=
 =
X-Google-Smtp-Source: AGHT+IFfpN/GQTgs/EaVeArJbpC+ZwvNcPPOxP8+/DjBCmwiHlvauBF4gV9kT6vVrQ0zhSIL2QBrow==
X-Received: by 2002:a05:6000:290e:b0:3a5:2949:6c38 with SMTP id
 ffacd0b85a97d-3b5e453980amr2212246f8f.52.1752069143240; 
 Wed, 09 Jul 2025 06:52:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50ded8csm23832325e9.20.2025.07.09.06.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 06:52:22 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Xe Development <intel-xe@lists.freedesktop.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH] drm/panthor: Fix UAF in panthor_gem_create_with_handle()
 debugfs code
Date: Wed,  9 Jul 2025 15:52:20 +0200
Message-ID: <20250709135220.1428931-1-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707151814.603897-2-simona.vetter@ffwll.ch>
References: <20250707151814.603897-2-simona.vetter@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The object is potentially already gone after the drm_gem_object_put().
In general the object should be fully constructed before calling
drm_gem_handle_create(), except the debugfs tracking uses a separate
lock and list and separate flag to denotate whether the object is
actually initilized.

Since I'm touching this all anyway simplify this by only adding the
object to the debugfs when it's ready for that, which allows us to
delete that separate flag. panthor_gem_debugfs_bo_rm() already checks
whether we've actually been added to the list or this is some error
path cleanup.

v2: Fix build issues for !CONFIG_DEBUGFS (Adrián)

v3: Add linebreak and remove outdated comment (Liviu)

Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 31 +++++++++++++--------------
 drivers/gpu/drm/panthor/panthor_gem.h |  3 ---
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 7c00fd77758b..a123bc740ba1 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -16,10 +16,15 @@
 #include "panthor_mmu.h"
 
 #ifdef CONFIG_DEBUG_FS
-static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
-				       struct panthor_gem_object *bo)
+static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
 {
 	INIT_LIST_HEAD(&bo->debugfs.node);
+}
+
+static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
+{
+	struct panthor_device *ptdev = container_of(bo->base.base.dev,
+						    struct panthor_device, base);
 
 	bo->debugfs.creator.tgid = current->group_leader->pid;
 	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
@@ -44,14 +49,13 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 
 static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
 {
-	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
+	bo->debugfs.flags = usage_flags;
+	panthor_gem_debugfs_bo_add(bo);
 }
 #else
-static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
-				       struct panthor_gem_object *bo)
-{}
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
 static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
+static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
 #endif
 
 static void panthor_gem_free_object(struct drm_gem_object *obj)
@@ -246,7 +250,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
 	mutex_init(&obj->label.lock);
 
-	panthor_gem_debugfs_bo_add(ptdev, obj);
+	panthor_gem_debugfs_bo_init(obj);
 
 	return &obj->base.base;
 }
@@ -285,6 +289,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
 		bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
 	}
 
+	panthor_gem_debugfs_set_usage_flags(bo, 0);
+
 	/*
 	 * Allocate an id of idr table where the obj is registered
 	 * and handle has the id what user can see.
@@ -296,12 +302,6 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(&shmem->base);
 
-	/*
-	 * No explicit flags are needed in the call below, since the
-	 * function internally sets the INITIALIZED bit for us.
-	 */
-	panthor_gem_debugfs_set_usage_flags(bo, 0);
-
 	return ret;
 }
 
@@ -387,7 +387,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 	unsigned int refcount = kref_read(&bo->base.base.refcount);
 	char creator_info[32] = {};
 	size_t resident_size;
-	u32 gem_usage_flags = bo->debugfs.flags & (u32)~PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
+	u32 gem_usage_flags = bo->debugfs.flags;
 	u32 gem_state_flags = 0;
 
 	/* Skip BOs being destroyed. */
@@ -436,8 +436,7 @@ void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
 
 	scoped_guard(mutex, &ptdev->gems.lock) {
 		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
-			if (bo->debugfs.flags & PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED)
-				panthor_gem_debugfs_bo_print(bo, m, &totals);
+			panthor_gem_debugfs_bo_print(bo, m, &totals);
 		}
 	}
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 4dd732dcd59f..8fc7215e9b90 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -35,9 +35,6 @@ enum panthor_debugfs_gem_usage_flags {
 
 	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED: BO is mapped on the FW VM. */
 	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED = BIT(PANTHOR_DEBUGFS_GEM_USAGE_FW_MAPPED_BIT),
-
-	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED: BO is ready for DebugFS display. */
-	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED = BIT(31),
 };
 
 /**
-- 
2.49.0

