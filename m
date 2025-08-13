Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC318B24B17
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F68210E722;
	Wed, 13 Aug 2025 13:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="AJ0ydwLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0C310E728
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:51:14 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so7006376a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1755093074; x=1755697874;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVCPVj5njtynUOjkUxjJArQSh1kyV84oddG8Myhc4a8=;
 b=AJ0ydwLdBlg82z8zdp1FLWH/IwiI73JI5XbF4htBV5hgmntf1xZ5WmZN06dKfJnWFj
 DkmJEWLef4gHPHKLVunI48NDQRloTMD56RepN8Z2OQqrLYuJKgQFq3TEMf2Z4pgLJ5Uy
 lc0NadQ5usTwc6YUBRNHYslBvODBwsx0/cfbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755093074; x=1755697874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVCPVj5njtynUOjkUxjJArQSh1kyV84oddG8Myhc4a8=;
 b=Tt7jkJ/M2GIw7QVlowJXRrEgXgigoLXNfMnbJyoAH9aBFwrVaN+zGafH+jt9z9R/2U
 Vp/sAd/4ET8qPNThYbmBUXc84uQGdfQcQXgBcr5PVPHI+Umx/iLk3m7rAlZv4T3t8DzG
 M/rpWtGTCnVW4tPg/kInWN5POSAhlr93u3tz5qVdumzan7DJ/jnp1XlaQe6hy+16SYCu
 osEiwYNubsQe9/QwpqXSUH0ZJSQ8GHboemaGwbkG9xb5znH53XMEozjzUz2yZG3HrfBb
 1FzqzPPv13JnOEMjOWlrX/h3ezvQnJM4vEIqNjCV6B3IZEEQmX3VlfebrNaFokD+PhkC
 m19w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW41DNsDsF4JfZKnZasc7MsssbYqMvpCd1JHftkirmxuXrSoFwwQgaixJlu+oUVYvJrLmGVEBNUDHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyn5UIsRnhe4HPDR6thuEjQpi0w3ySXJkGMxIYzSqfeGnh4nxZq
 J6zZ1oaDIi0gLoAoUzg4hax16SuBB6bqdLvFaxHR1fWFO/f1sQth7GLle/h4TKun6Hg=
X-Gm-Gg: ASbGncsDehHnER++u3RfKdD5X6aTfMKDEplSJYocvoTmonmAi60GwPCU5P8+U7dZOID
 ZxF7tpiCqux2s+Ta2nftko5dj22kILN7w6KEPw2quaaNRfUemvZFrwEZPXQi1wnZ9/gSRRteE4/
 eeBdzFPAITNzAQzCuKtzEDbng6t9E2U4s8ng/4xgSUa7Y7evw0cOlAAbiLA8hd4EmMrQI/fjOO6
 4X2AA4U3pIIH8kjFzhLCo8kdpqcYs+FatZMzz6dNJGkHwij0ZBaxMQn7Wffe5n9omnex4KLeN3f
 cVI+dLC+VFKcxBMErN6+9ROzpkWi7nJg78Lg6N5mZ5seTvMV/Jv601AgaOwIzft77Kf4XOMj45E
 9SYKc26+5YmkxocDVERFxeWNPsl2rEDQV
X-Google-Smtp-Source: AGHT+IE+hmewniN0u3zqb+W8iPloIFVj5pdKblt2Ic1GQQPHMqTnfzxcAziGtOiYg5zRzT6hKg03cA==
X-Received: by 2002:a17:902:f709:b0:240:640a:b2e4 with SMTP id
 d9443c01a7336-2430d21c0e5mr55007035ad.49.1755093073913; 
 Wed, 13 Aug 2025 06:51:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1709])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaf855sm326965955ad.168.2025.08.13.06.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:51:13 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 5/9 v3] drm/i915/gem: Clean-up outdated struct_mutex comments
Date: Wed, 13 Aug 2025 10:50:29 -0300
Message-ID: <20250813135035.144762-6-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
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

The struct_mutex will be removed from the DRM subsystem, as it was a
legacy BKL that was only used by i915 driver. After review, it was
concluded that its usage was no longer necessary

This patch updates various comments in the i915/gem and i915/gt
codebase to either remove or clarify references to struct_mutex, in
order to prevent future misunderstandings.

* i915_gem_execbuffer.c: Replace reference to struct_mutex with
  vm->mutex, as noted in the eb_reserve() function, which states that
  vm->mutex handles deadlocks.
* i915_gem_object.c: Change struct_mutex by
  drm_i915_gem_object->vma.lock. i915_gem_object_unbind() in i915_gem.c
  states that this lock is who actually protects the unbind.
* i915_gem_shrinker.c: The correct lock is actually i915->mm.obj, as
  already documented in its declaration.
* i915_gem_wait.c: The existing comment already mentioned that
  struct_mutex was no longer necessary. Updated to refer to a generic
  global lock instead.
* intel_reset_types.h: Cleaned up the comment text. Updated to refer to
  a generic global lock instead.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c     | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c   | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_wait.c       | 8 ++++----
 drivers/gpu/drm/i915/gt/intel_reset_types.h    | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index f243f8a5215d..39c7c32e1e74 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -182,7 +182,7 @@ enum {
  * the object. Simple! ... The relocation entries are stored in user memory
  * and so to access them we have to copy them into a local buffer. That copy
  * has to avoid taking any pagefaults as they may lead back to a GEM object
- * requiring the struct_mutex (i.e. recursive deadlock). So once again we split
+ * requiring the vm->mutex (i.e. recursive deadlock). So once again we split
  * the relocation into multiple passes. First we try to do everything within an
  * atomic context (avoid the pagefaults) which requires that we never wait. If
  * we detect that we may wait, or if we need to fault, then we have to fallback
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 1f38e367c60b..478011e5ecb3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -459,8 +459,8 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 	atomic_inc(&i915->mm.free_count);
 
 	/*
-	 * Since we require blocking on struct_mutex to unbind the freed
-	 * object from the GPU before releasing resources back to the
+	 * Since we require blocking on drm_i915_gem_object->vma.lock to unbind
+	 * the freed object from the GPU before releasing resources back to the
 	 * system, we can not do that directly from the RCU callback (which may
 	 * be a softirq context), but must instead then defer that work onto a
 	 * kthread. We use the RCU callback rather than move the freed object
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index b81e67504bbe..7a3e74a6676e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -170,7 +170,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 	 * Also note that although these lists do not hold a reference to
 	 * the object we can safely grab one here: The final object
 	 * unreferencing and the bound_list are both protected by the
-	 * dev->struct_mutex and so we won't ever be able to observe an
+	 * i915->mm.obj_lock and so we won't ever be able to observe an
 	 * object on the bound_list with a reference count equals 0.
 	 */
 	for (phase = phases; phase->list; phase++) {
@@ -185,7 +185,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 
 		/*
 		 * We serialize our access to unreferenced objects through
-		 * the use of the struct_mutex. While the objects are not
+		 * the use of the obj_lock. While the objects are not
 		 * yet freed (due to RCU then a workqueue) we still want
 		 * to be able to shrink their pages, so they remain on
 		 * the unbound/bound list until actually freed.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 991666fd9f85..54829801d3f7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -217,10 +217,10 @@ static unsigned long to_wait_timeout(s64 timeout_ns)
  *
  * The wait ioctl with a timeout of 0 reimplements the busy ioctl. With any
  * non-zero timeout parameter the wait ioctl will wait for the given number of
- * nanoseconds on an object becoming unbusy. Since the wait itself does so
- * without holding struct_mutex the object may become re-busied before this
- * function completes. A similar but shorter * race condition exists in the busy
- * ioctl
+ * nanoseconds on an object becoming unbusy. Since the wait occurs without
+ * holding a global or exclusive lock the object may become re-busied before
+ * this function completes. A similar but shorter * race condition exists
+ * in the busy ioctl
  */
 int
 i915_gem_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
diff --git a/drivers/gpu/drm/i915/gt/intel_reset_types.h b/drivers/gpu/drm/i915/gt/intel_reset_types.h
index 4f5fd393af6f..ee4eb574a219 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_reset_types.h
@@ -20,7 +20,7 @@ struct intel_reset {
 	 * FENCE registers).
 	 *
 	 * #I915_RESET_ENGINE[num_engines] - Since the driver doesn't need to
-	 * acquire the struct_mutex to reset an engine, we need an explicit
+	 * acquire a global lock to reset an engine, we need an explicit
 	 * flag to prevent two concurrent reset attempts in the same engine.
 	 * As the number of engines continues to grow, allocate the flags from
 	 * the most significant bits.
-- 
2.50.1

