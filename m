Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08534DE48C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 00:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187CA10E3B1;
	Fri, 18 Mar 2022 23:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA6F10E3B1;
 Fri, 18 Mar 2022 23:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647646801; x=1679182801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DkbrGdtfLx1CsXkOojKFsHVaSp/jAZ/1npX2NtM84sA=;
 b=Swtb7S8wtOnQ5Sx+xLI/Gk9wA+TNorC5AAKOiO191MfV7JHhsp6aGZpj
 +RfYPyRaur3S0oh49K52XubLcEKN2pSWuevHpfSnfdaXYDnew9+AVsSz7
 /H3E/ZYLVF4aCaE0g1pO9fzXzgG31XJGbxMohBRmXm7BiId0irg7Nky+Q
 F4i+cGTPKe8eG1yDNR6ls4+k4b42S7WH5fvWelV0eQQY+GKBUVccm9Vri
 AvV+HK4B13980MJ6prSd7qvvqiyu5JQs/xKpdj0D9Zd7n8cdC9M42tnTN
 abwBk2MOesFhD5+c0WB7OpL6e9nYb1nFK0rMcNNZT8sh3AtNp7o9DIfwo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="254819056"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="254819056"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:40:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="542098226"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.39.168])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:39:55 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 1/7] drm/i915: Rename INTEL_REGION_LMEM with
 INTEL_REGION_LMEM_0
Date: Sat, 19 Mar 2022 01:39:31 +0200
Message-Id: <20220318233938.149744-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318233938.149744-1-andi.shyti@linux.intel.com>
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Andi Shyti <andi@etezian.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Dale B Stimson <dale.b.stimson@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the upcoming multitile support each tile will have its own
local memory. Mark the current LMEM with the suffix '0' to
emphasise that it belongs to the root tile.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c               | 2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c           | 2 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c    | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c              | 4 ++--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c  | 6 +++---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c | 8 ++++----
 drivers/gpu/drm/i915/gt/intel_gt.c                    | 2 +-
 drivers/gpu/drm/i915/intel_memory_region.c            | 2 +-
 drivers/gpu/drm/i915/intel_memory_region.h            | 4 ++--
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 94c57facbb463..e9ad142ac40fa 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1994,7 +1994,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 
 	/* object is backed with LMEM for discrete */
 	i915 = to_i915(obj->base.dev);
-	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM)) {
+	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM_0)) {
 		/* object is "remote", not in local memory */
 		i915_gem_object_put(obj);
 		return ERR_PTR(-EREMOTE);
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index a307b4993bcf3..bd6e7c98e751d 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -140,7 +140,7 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 	if (!ret && phys_cursor)
 		ret = i915_gem_object_attach_phys(obj, alignment);
 	else if (!ret && HAS_LMEM(dev_priv))
-		ret = i915_gem_object_migrate(obj, &ww, INTEL_REGION_LMEM);
+		ret = i915_gem_object_migrate(obj, &ww, INTEL_REGION_LMEM_0);
 	/* TODO: Do we need to sync when migration becomes async? */
 	if (!ret)
 		ret = i915_gem_object_pin_pages(obj);
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 7979929bb6323..d10f27d0b7b09 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -72,7 +72,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 		}
 
 		phys_base = pte & I915_GTT_PAGE_MASK;
-		mem = i915->mm.regions[INTEL_REGION_LMEM];
+		mem = i915->mm.regions[INTEL_REGION_LMEM_0];
 
 		/*
 		 * We don't currently expect this to ever be placed in the
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index ede084f36ca93..b2aaf620741e3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -102,7 +102,7 @@ __i915_gem_object_create_lmem_with_ps(struct drm_i915_private *i915,
 				      resource_size_t page_size,
 				      unsigned int flags)
 {
-	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM],
+	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM_0],
 					     size, page_size, flags);
 }
 
@@ -137,6 +137,6 @@ i915_gem_object_create_lmem(struct drm_i915_private *i915,
 			    resource_size_t size,
 			    unsigned int flags)
 {
-	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM],
+	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM_0],
 					     size, 0, flags);
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index b071a58dd6daa..a342fd387d4ef 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -88,7 +88,7 @@ static int igt_dmabuf_import_self(void *arg)
 static int igt_dmabuf_import_same_driver_lmem(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
-	struct intel_memory_region *lmem = i915->mm.regions[INTEL_REGION_LMEM];
+	struct intel_memory_region *lmem = i915->mm.regions[INTEL_REGION_LMEM_0];
 	struct drm_i915_gem_object *obj;
 	struct drm_gem_object *import;
 	struct dma_buf *dmabuf;
@@ -252,10 +252,10 @@ static int igt_dmabuf_import_same_driver_lmem_smem(void *arg)
 	struct drm_i915_private *i915 = arg;
 	struct intel_memory_region *regions[2];
 
-	if (!i915->mm.regions[INTEL_REGION_LMEM])
+	if (!i915->mm.regions[INTEL_REGION_LMEM_0])
 		return 0;
 
-	regions[0] = i915->mm.regions[INTEL_REGION_LMEM];
+	regions[0] = i915->mm.regions[INTEL_REGION_LMEM_0];
 	regions[1] = i915->mm.regions[INTEL_REGION_SMEM];
 	return igt_dmabuf_import_same_driver(i915, regions, 2);
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index d534141b2cf7c..2c63daf932de7 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -92,17 +92,17 @@ static int igt_create_migrate(struct intel_gt *gt, enum intel_region_id src,
 
 static int igt_smem_create_migrate(void *arg)
 {
-	return igt_create_migrate(arg, INTEL_REGION_LMEM, INTEL_REGION_SMEM);
+	return igt_create_migrate(arg, INTEL_REGION_LMEM_0, INTEL_REGION_SMEM);
 }
 
 static int igt_lmem_create_migrate(void *arg)
 {
-	return igt_create_migrate(arg, INTEL_REGION_SMEM, INTEL_REGION_LMEM);
+	return igt_create_migrate(arg, INTEL_REGION_SMEM, INTEL_REGION_LMEM_0);
 }
 
 static int igt_same_create_migrate(void *arg)
 {
-	return igt_create_migrate(arg, INTEL_REGION_LMEM, INTEL_REGION_LMEM);
+	return igt_create_migrate(arg, INTEL_REGION_LMEM_0, INTEL_REGION_LMEM_0);
 }
 
 static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
@@ -152,7 +152,7 @@ static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
 		}
 
 	} else {
-		err = i915_gem_object_migrate(obj, ww, INTEL_REGION_LMEM);
+		err = i915_gem_object_migrate(obj, ww, INTEL_REGION_LMEM_0);
 		if (err) {
 			pr_err("Object failed migration to lmem\n");
 			if (err)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 57ca1e6b6203d..ca875ba3e2a9d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -76,7 +76,7 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
 		return err;
 	}
 
-	id = INTEL_REGION_LMEM;
+	id = INTEL_REGION_LMEM_0;
 
 	mem->id = id;
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index ded78b83e0b55..e38d2db1c3e32 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -19,7 +19,7 @@ static const struct {
 		.class = INTEL_MEMORY_SYSTEM,
 		.instance = 0,
 	},
-	[INTEL_REGION_LMEM] = {
+	[INTEL_REGION_LMEM_0] = {
 		.class = INTEL_MEMORY_LOCAL,
 		.instance = 0,
 	},
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index beded40c6d71c..cc7078bcbfbfc 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -29,14 +29,14 @@ enum intel_memory_type {
 
 enum intel_region_id {
 	INTEL_REGION_SMEM = 0,
-	INTEL_REGION_LMEM,
+	INTEL_REGION_LMEM_0,
 	INTEL_REGION_STOLEN_SMEM,
 	INTEL_REGION_STOLEN_LMEM,
 	INTEL_REGION_UNKNOWN, /* Should be last */
 };
 
 #define REGION_SMEM     BIT(INTEL_REGION_SMEM)
-#define REGION_LMEM     BIT(INTEL_REGION_LMEM)
+#define REGION_LMEM     BIT(INTEL_REGION_LMEM_0)
 #define REGION_STOLEN_SMEM   BIT(INTEL_REGION_STOLEN_SMEM)
 #define REGION_STOLEN_LMEM   BIT(INTEL_REGION_STOLEN_LMEM)
 
-- 
2.35.1

