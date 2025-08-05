Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7FB1B6B9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3F610E684;
	Tue,  5 Aug 2025 14:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="vLnby3M6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524F710E68E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 14:40:05 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-76858e9e48aso4278587b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754404805; x=1755009605;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+QLReNPzvEXiW5fMWsOqdFMb60gUmO9yYHDNMzbdYhc=;
 b=vLnby3M6Flf0tGd3cuvcBtMLLg4gpwgnESVp7Z198SYQC3DeQ0INJ2G4WxcI/EQFr1
 eBYYLvAGxGvfmzANdxw6ujyVOeEFntf+IPfBPtft+Hwuym6/aUFQZe+7pVlCPJs4oyEd
 zx5r0ECRjieVQGSnk1DfVF5X8i6oV2Bv08520=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754404805; x=1755009605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+QLReNPzvEXiW5fMWsOqdFMb60gUmO9yYHDNMzbdYhc=;
 b=ZK+86P6+UU481ecO8OKP8d2RJnwLmqlZnXkpvvYOHXZFLMwzNbinOsUJWlCkipkat+
 IDLV3JsQuQTOm7vbs5g/juyBhRDnXzMrhO4EmvdTg81Gf5YlG3yHC0UmjQ1qC0btuuNf
 g0vl6Hj16HGYS2NeSSR3qIp6IaXNJ4caIpv3iNdoGewOiR1Det+FKhpWyJqwqdc26bQc
 rwG5u5mAqEbr1x7Xcwm5YD6ywTRzHh2261Ot2viKQd6gbG1ZYf80TBFYj1O/pty1Vxqu
 GR+Z+WmDf3kU5nfvu1MZjU2MIKmfrqTSEG0VflmCBGGSl/ysHdBhUM8GDbA86oc1rBRo
 Vhew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWpPTi+7cEt1Ty5gtaEWswrEI20cTOHqcFZ/X+W+80btIIYqw7xmILRrImgMMx86RmoAUtvZcVA7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXOHVxSN345pxiM5CJgpn3UGm/tSL6DMSV7lSgqmRsVdunkoa/
 CISAgqZG85hbg/KkG9bZZ7b9r3VJJ/WZK+6XTKIkMxuNJCtGq/or0sOddzWKkLDiQ8I=
X-Gm-Gg: ASbGncvDJka7fnBCrQys5QxtHhkZDidCDp7QsbpijJEeAAvKQqIwyzQJ/SuDwsCPsJZ
 DRmHLzH3Kjm+KmO6dyiJ88UJLjgeRE5HQDwFS4PZyIq30rC0zW6rD3UeiA8XWvgHoRwgZzsrfew
 2xIG+wZHDuivpa5ZnxD4Et87mHooC4AGqCP6kJqCSNfviW3d6/9d7uQERyJE0PNuC05VYPNrJ7A
 Nh0GDhOZnxAYB28rn2ha8D/lwPQCdbD/ibISE2VPSm48OXk60VczTsWrf+mkRvC6CVukXfo/H6p
 GCooiDZD0CxhyanZ5QmuLssujvc0sM3Lzk9ehKJr+NE0ZOZ3OVrhOox7mi/3ogdJRoSZirBa+gT
 MPONm4JyukC2b7SBr/80gx+AZhJv0nI+b
X-Google-Smtp-Source: AGHT+IFHUROJcuV5FvggTGJ/yXRXDRKhetH/mmHMBrU5I4hG1bx0c/C6EoSbg0CDsX4KA73C/hF+pg==
X-Received: by 2002:a05:6a00:b54:b0:76b:995c:4bb1 with SMTP id
 d2e1a72fcca58-76bec49b62bmr14089479b3a.15.1754404804689; 
 Tue, 05 Aug 2025 07:40:04 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf1c6d5dcsm7899757b3a.74.2025.08.05.07.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:40:04 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 5/9] drm/i915/gem: Clean-up outdated struct_mutex comments
Date: Tue,  5 Aug 2025 11:39:00 -0300
Message-ID: <20250805143908.32343-6-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
References: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
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
index ca7e9216934a..07500fd5b82d 100644
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
index 7127e90c1a8f..04a18580e7d4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -222,10 +222,10 @@ static unsigned long to_wait_timeout(s64 timeout_ns)
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

