Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254E7B1DC3D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 19:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F72E10E8A0;
	Thu,  7 Aug 2025 17:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="WHqCzjqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A0510E8A1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 17:03:30 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-24014cd385bso14193045ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754586210; x=1755191010;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQ08Q3F5//ScelewFQNb1Y+OxsA3CwvY5bYcUdZkXhc=;
 b=WHqCzjqoRQs6MRND5cMoi2UYiplEj25BWvB30mTwlkeiLi9TZ6EK6cImwml8id4fD9
 GZyHm+4vyz3u3S6gIJduF9jjHd7CNzQKbNINTVfON6r+YTGKIEhbH3Eg93bVbzG0HllV
 1RcVdr3T8qJgmc9DIlDCCekhCAVVvet2MhngA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754586210; x=1755191010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQ08Q3F5//ScelewFQNb1Y+OxsA3CwvY5bYcUdZkXhc=;
 b=FAGAaWJ43Mjq6aZv/+oGeQVsazxYNFi0JoDTez+lfZm8oIztIoqfVDivMlbjHm5cJJ
 8wakqLwSklkrog8crupYEaCbc9d+yOR19GlyiBsV9Huszig89AxEsjpZ2ZE3zyd8COx7
 eggkssmz6SN3ynYbUnxsTOnR7rAE9Xqp0LGaxKneiC8TPw9DU5/bpnYqzqI+bM1d95HG
 lkik67a9jXyYQrYg/feO1tnGMpHZjc3ikKQv0l1jCFR0zDfvUvfC4D+k7etip5c5BPdn
 TsV+G3P8kABZUCC3f9JdDoNpbiLfiVIW7SQqczbMxeS1r/PGhluvQb2Z3dYRd08PvRAZ
 M8sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbZB8ZC3aU4aXpv2sxV5obVgk6V0eBvw9RilVE88uYUNLWlvXhncmycu9zVfmy1pScgrz9zQ+aqFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUvnjzgiKkZ/UKDESbUzAwSu/0tdy7JYcIMAVggVxwzI9NyHx7
 Gn7gZmVzMaYzISpKC4ahKGplNcKwO5o3QF8R7IUABEEd6o8e/jdXg0XVf/G1DdcyE4A=
X-Gm-Gg: ASbGncvvBRjiqO9IGJXIkKDYxPkyduHZnQF6jDreHDFJu7clT6Fng3QvAXUwH9tL5br
 07KJLa7hBQRRX6Q2LcK7OtDQg1vf5ryvSkbK7/Bt1hXeO7I4YHCJJdv5oX5ZeLpoUGlyV6RC6ut
 heS5UEu71o27e6d5bKitTZ7Jx5TAbNyo2cBQNZFRUIYkVKH0qVYt+pLB27D8AN28TeLCKEVwunS
 EEquZYY3jIzVASu/TL0aP+xgr4l/izsdXRewdsE59ezYMUVX9drnNVTeSBntqzmQCDrDTuyuGpR
 JYPu3XRos+/OmgQJal27zxMcm9K+UtbuiclVHzgwajEqvVvLhxdJQNmht1UwOEWWnp9/5cxrjU+
 Dv3KyIFRCx9Lxvtv/RGjQDkYgzb/KACt1
X-Google-Smtp-Source: AGHT+IFJ+sZTJrWQ/Bs5EJWR4q9UqTZ55kaYxP5hcWjcOxDczTSxwzTnoT1cNGp/yBFnbe2lKFaHmw==
X-Received: by 2002:a17:902:ce83:b0:23d:d2d2:b511 with SMTP id
 d9443c01a7336-242a0ac1ecfmr92176305ad.19.1754586208382; 
 Thu, 07 Aug 2025 10:03:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7c30sm188804875ad.37.2025.08.07.10.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 10:03:27 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 5/9 v2] drm/i915/gem: Clean-up outdated struct_mutex comments
Date: Thu,  7 Aug 2025 14:02:04 -0300
Message-ID: <20250807170212.285385-6-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
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

