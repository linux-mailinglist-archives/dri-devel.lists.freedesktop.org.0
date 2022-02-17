Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCD24BA343
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E6D10EB8F;
	Thu, 17 Feb 2022 14:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B55D10E9A7;
 Thu, 17 Feb 2022 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645109001; x=1676645001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r0MIc3rFoAcZ7QoxY0dsZ+qVzmooW0UX/f1FEpJBSjQ=;
 b=VRD82INXhhymmXm/kgCsWRqbKoxRALZqqgmmlWGjMBTLY5sT6X9qd5qr
 pKgUCtYDDxdL2RO3KPqQwjAL+iqvoFpgq9knDnka1xkKoGiYZPjt4u9K7
 Sf1JK12I4LytfgrHmZSvmu6uxN7S7klKqL8/qURK2t6Bpo+zXbJIh0J85
 BeN8jCNtNx2ZLEoQkbvNStaEk2jj63pDqGnLi8cChNdgCbKhtcxsZWiLV
 Q1gSbyIg61ctEd+PRAksHiGNjh/NAlrUrFVQ6p0GbYrsru2MFBf2bu06s
 j8XuyWsogbqevI0vdlcUuz1TavZygDNNBxoONiCyCyQAlKhoAFFvVVACP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="337331843"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="337331843"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:43:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="502477616"
Received: from sewaggon-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.33.71])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:43:15 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 1/7] drm/i915: Rename INTEL_REGION_LMEM with
 INTEL_REGION_LMEM_0
Date: Thu, 17 Feb 2022 15:41:52 +0100
Message-Id: <20220217144158.21555-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217144158.21555-1-andi.shyti@linux.intel.com>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
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
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the upcoming multitile support each tile will have its own
local memory. Mark the current LMEM with the suffix '0' to
emphasise that it belongs to the root tile.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c               | 2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c           | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c              | 4 ++--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c  | 6 +++---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c | 8 ++++----
 drivers/gpu/drm/i915/gt/intel_gt.c                    | 2 +-
 drivers/gpu/drm/i915/intel_memory_region.c            | 2 +-
 drivers/gpu/drm/i915/intel_memory_region.h            | 4 ++--
 8 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 23cfe2e5ce2a..421f7238da05 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1981,7 +1981,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 
 	/* object is backed with LMEM for discrete */
 	i915 = to_i915(obj->base.dev);
-	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM)) {
+	if (HAS_LMEM(i915) && !i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM_0)) {
 		/* object is "remote", not in local memory */
 		i915_gem_object_put(obj);
 		return ERR_PTR(-EREMOTE);
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index a307b4993bcf..bd6e7c98e751 100644
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
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index 444f8268b9c5..47e43dc3a174 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -100,7 +100,7 @@ __i915_gem_object_create_lmem_with_ps(struct drm_i915_private *i915,
 				      resource_size_t page_size,
 				      unsigned int flags)
 {
-	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM],
+	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM_0],
 					     size, page_size, flags);
 }
 
@@ -135,6 +135,6 @@ i915_gem_object_create_lmem(struct drm_i915_private *i915,
 			    resource_size_t size,
 			    unsigned int flags)
 {
-	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM],
+	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_LMEM_0],
 					     size, 0, flags);
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index b071a58dd6da..a342fd387d4e 100644
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
index d534141b2cf7..2c63daf932de 100644
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
index e8403fa53909..db171e85f4df 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -78,7 +78,7 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
 		return err;
 	}
 
-	id = INTEL_REGION_LMEM;
+	id = INTEL_REGION_LMEM_0;
 
 	mem->id = id;
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index c70d7e286a51..18d7f0aa314e 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -17,7 +17,7 @@ static const struct {
 		.class = INTEL_MEMORY_SYSTEM,
 		.instance = 0,
 	},
-	[INTEL_REGION_LMEM] = {
+	[INTEL_REGION_LMEM_0] = {
 		.class = INTEL_MEMORY_LOCAL,
 		.instance = 0,
 	},
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 5625c9c38993..95db0a8029e2 100644
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
2.27.0

