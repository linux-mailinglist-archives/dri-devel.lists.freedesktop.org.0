Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AB8AFB716
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 17:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F8710E4CC;
	Mon,  7 Jul 2025 15:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="QjnM7Rvm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B83F10E321
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 15:18:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso1911379f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 08:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1751901507; x=1752506307; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6CC1cvUAsk8N7isqx6HALT3NrV0r67uwhMiDy5SbZQ=;
 b=QjnM7Rvm6Oo2E8WH/4iHJie15ZWdIJG9zXzshwq98dScxsw/hD1FOtc7z5BtzoIG26
 T27WP8xAnT83DiXASpBqGrWzqBC3grc4DfHHlcDi6MuOZFW2edAKjKbmmhU9jIeEy51V
 EW2qOMrv7ijiWAyP3EXWQqVEYWULYD6r1lmfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751901507; x=1752506307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6CC1cvUAsk8N7isqx6HALT3NrV0r67uwhMiDy5SbZQ=;
 b=aMfSL0oYeqnJj63GCP9v/clnI6IBmWD7aUhK9DKVfUHLaGlpt98cAyCHW1rXB8YVqQ
 qs3Mq6P5BSRbUg695jt3oa2BbI1FcYER0Yl51OILE9JppsaoEmljmVWR33ZXrYPCmu2m
 n3OD4SGTEskVV3/lR9G9Jg9dDnwBxBE5vj3zNG9DJzXNRfhXXAE91xgVnn+8F8QxEOfK
 KcmGoQH7Y4eBVmLvD5kKCOgnzccke0FWU9kEZ+p+TBg8x2prFnJwkEP38ayHtI6EWX9a
 5u0J7+thAlp0OTNgdGh25sfV8987xIZ2/NUj1IBD4j+53iyWJBIe5OGEsmnOL7g1RQtJ
 D7MA==
X-Gm-Message-State: AOJu0Yy4hnjm5wA6C+udPxAsskXfHL//VRl6JEsXfJihSJ2ONtls9xPs
 kvVsxtVmxRZVQ98/fxWNRUK98FL7r4XdrlLZFTZOCuasiBWGsMo2PFQpqSxmcgz3QiwQmyNh1op
 5BX/41CU=
X-Gm-Gg: ASbGncvuA4Yc9U8QPK8M5aVsLFf+0Dt64tiYhHODPSowoAzYtcAwmlC9IGw1JcVIYRP
 +vh6McSNPTpWetVjH5PdgIGRCAyWXraAWEypqpHdCXs1I9HPmNoVaZx1JkFSFLQ8bJmVwR503iQ
 tuuqFpfa73iWy8nV+j4/kSV19CwLwcF1uO229gTmf3qkjbtRY/WLGtY7nPsb/7VJfwPP8b3oybt
 r69BjiMi8ZV+AUAzIMzkWClwDKADsJgJl21n50ua0hCviyc/Ww37D0akekKCX266JL3fOQtLI6m
 8Z9y/Y3tkkkhU7G+uPz2uwb7S4MQjvNGLCDD0Os5DveQKxM+dYhGE0HgIdBrRnm4osY27vjvlOw
 FC+PpsN6L
X-Google-Smtp-Source: AGHT+IE1hrQ7ioK++cpM3hGypspA/hPhNJKSpa4wQM0tRAz+AQxBfs6swIe4874tnKWPX4+F9Kw+Tw==
X-Received: by 2002:a5d:5f81:0:b0:3a8:3105:1d49 with SMTP id
 ffacd0b85a97d-3b49aa80b6bmr7411887f8f.45.1751901507016; 
 Mon, 07 Jul 2025 08:18:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b46d4c8619sm10369057f8f.0.2025.07.07.08.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 08:18:26 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Xe Development <intel-xe@lists.freedesktop.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 2/2] drm/panthor: Fix UAF in panthor_gem_create_with_handle()
 debugfs code
Date: Mon,  7 Jul 2025 17:18:14 +0200
Message-ID: <20250707151814.603897-2-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707151814.603897-1-simona.vetter@ffwll.ch>
References: <20250707151814.603897-1-simona.vetter@ffwll.ch>
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

Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 34 ++++++++++++++-------------
 drivers/gpu/drm/panthor/panthor_gem.h |  3 ---
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 7c00fd77758b..8232f91f3bf7 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -16,10 +16,14 @@
 #include "panthor_mmu.h"
 
 #ifdef CONFIG_DEBUG_FS
-static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
-				       struct panthor_gem_object *bo)
+static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
 {
 	INIT_LIST_HEAD(&bo->debugfs.node);
+}
+static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
+{
+	struct panthor_device *ptdev = container_of(bo->base.base.dev,
+						    struct panthor_device, base);
 
 	bo->debugfs.creator.tgid = current->group_leader->pid;
 	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
@@ -44,14 +48,13 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 
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
@@ -246,7 +249,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
 	mutex_init(&obj->label.lock);
 
-	panthor_gem_debugfs_bo_add(ptdev, obj);
+	panthor_gem_debugfs_bo_init(obj);
 
 	return &obj->base.base;
 }
@@ -285,6 +288,12 @@ panthor_gem_create_with_handle(struct drm_file *file,
 		bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
 	}
 
+	/*
+	 * No explicit flags are needed in the call below, since the
+	 * function internally sets the INITIALIZED bit for us.
+	 */
+	panthor_gem_debugfs_set_usage_flags(bo, 0);
+
 	/*
 	 * Allocate an id of idr table where the obj is registered
 	 * and handle has the id what user can see.
@@ -296,12 +305,6 @@ panthor_gem_create_with_handle(struct drm_file *file,
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
 
@@ -387,7 +390,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 	unsigned int refcount = kref_read(&bo->base.base.refcount);
 	char creator_info[32] = {};
 	size_t resident_size;
-	u32 gem_usage_flags = bo->debugfs.flags & (u32)~PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
+	u32 gem_usage_flags = bo->debugfs.flags;
 	u32 gem_state_flags = 0;
 
 	/* Skip BOs being destroyed. */
@@ -436,8 +439,7 @@ void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
 
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

