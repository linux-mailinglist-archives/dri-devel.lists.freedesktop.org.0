Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D575730AA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6124395CBC;
	Wed, 13 Jul 2022 08:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB194954C2;
 Wed, 13 Jul 2022 08:12:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29270B81D73;
 Wed, 13 Jul 2022 08:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383F1C341DC;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=tHkOaTugHLUdkYUmtojMIw2O+RhRJDtIfYm1j+P0E4w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ghn10S8HCAwuRxpKa3vn21ji+wSVCBWs2CJjnhuR6Scp6Tuh7XUoMAa39AYpKYm3w
 oFxcyFWjAxhkqbhJ6SuoDA9/poPPRcu1rVNcxwm46pK5YPx1fKw+sdbKI5wzf37obg
 /H8Z7cg20gcfejbfzicSwyGTZRQGPp5gXbCjbZZpJbktlytJqOnSa+mwmSMbLZ5C5X
 7OA8pN8jKLGfHSXmMNWmxsorKXe9ref9RhFExWbTmCV7fy7nvFVlgcCqqtGZRHp9T1
 xxzKRp4oQvCvt8FzKmin8pk7tbb0UwqTdq6T64DP6ZGi/LYoTz7QvBySdAmAYkPwPE
 UQLVCLEy1Jthg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004ztD-JQ;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 14/39] drm/i915: document kernel-doc trivial issues
Date: Wed, 13 Jul 2022 09:12:02 +0100
Message-Id: <6eca50ad78a54cadaf8e4deecec2309400c24164.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 David Airlie <airlied@linux.ie>, Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix those kernel-doc warnings:
	drivers/gpu/drm/i915/intel_region_ttm.c:199: warning: Function parameter or member 'offset' not described in 'intel_region_ttm_resource_alloc'
	drivers/gpu/drm/i915/i915_vma_resource.h:123: warning: Function parameter or member 'wakeref' not described in 'i915_vma_resource'
	drivers/gpu/drm/i915/i915_vma.c:1703: warning: Function parameter or member 'vma' not described in 'i915_vma_destroy_locked'
	drivers/gpu/drm/i915/i915_vma.c:751: warning: Function parameter or member 'ww' not described in 'i915_vma_insert'
	drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:159: warning: Function parameter or member 'gt' not described in 'intel_gt_fini_hwconfig'
	drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:146: warning: Function parameter or member 'gt' not described in 'intel_gt_init_hwconfig'
	drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:113: warning: expecting prototype for intel_guc_hwconfig_init(). Prototype was for guc_hwconfig_init() instead
	drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:113: warning: Function parameter or member 'gt' not described in 'guc_hwconfig_init'
	drivers/gpu/drm/i915/gt/intel_engine_types.h:276: warning: Function parameter or member 'preempt_hang' not described in 'intel_engine_execlists'

That are due undocumented parameters.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/intel_engine_types.h    | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 5 ++++-
 drivers/gpu/drm/i915/i915_vma.c                 | 2 ++
 drivers/gpu/drm/i915/i915_vma_resource.h        | 1 +
 drivers/gpu/drm/i915/intel_region_ttm.c         | 3 ++-
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 633a7e5dba3b..7c5ad9071fe7 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -271,6 +271,7 @@ struct intel_engine_execlists {
 	 */
 	u8 csb_head;
 
+	/* private: Used only in selftests */
 	I915_SELFTEST_DECLARE(struct st_preempt_hang preempt_hang;)
 };
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index 4781fccc2687..76f7447302a6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -103,7 +103,8 @@ static bool has_table(struct drm_i915_private *i915)
 }
 
 /**
- * intel_guc_hwconfig_init - Initialize the HWConfig
+ * guc_hwconfig_init - Initialize the HWConfig
+ * @gt: GT structure
  *
  * Retrieve the HWConfig table from the GuC and save it locally.
  * It can then be queried on demand by other users later on.
@@ -138,6 +139,7 @@ static int guc_hwconfig_init(struct intel_gt *gt)
 
 /**
  * intel_gt_init_hwconfig - Initialize the HWConfig if available
+ * @gt: GT structure
  *
  * Retrieve the HWConfig table if available on the current platform.
  */
@@ -151,6 +153,7 @@ int intel_gt_init_hwconfig(struct intel_gt *gt)
 
 /**
  * intel_gt_fini_hwconfig - Finalize the HWConfig
+ * @gt: GT structure
  *
  * Free up the memory allocation holding the table.
  */
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ef3b04c7e153..ddf348c597b0 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -733,6 +733,7 @@ bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color)
 /**
  * i915_vma_insert - finds a slot for the vma in its address space
  * @vma: the vma
+ * @ww: An optional struct i915_gem_ww_ctx
  * @size: requested size in bytes (can be larger than the VMA)
  * @alignment: required alignment
  * @flags: mask of PIN_* flags to use
@@ -1675,6 +1676,7 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
 /**
  * i915_vma_destroy_locked - Remove all weak reference to the vma and put
  * the initial reference.
+ * @vma: VMA to destroy
  *
  * This function should be called when it's decided the vma isn't needed
  * anymore. The caller must assure that it doesn't race with another lookup
diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
index 14a0327b2080..a15271d96b7e 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.h
+++ b/drivers/gpu/drm/i915/i915_vma_resource.h
@@ -49,6 +49,7 @@ struct i915_page_sizes {
  * @__subtree_last: Interval tree private member.
  * @vm: non-refcounted pointer to the vm. This is for internal use only and
  * this member is cleared after vm_resource unbind.
+ * @wakeref: wakeref used for runtime PM reference.
  * @mr: The memory region of the object pointed to by the vma.
  * @ops: Pointer to the backend i915_vma_ops.
  * @private: Bind backend private info.
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 6873808a7015..471a70c50b2c 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -181,7 +181,8 @@ intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
 #ifdef CONFIG_DRM_I915_SELFTEST
 /**
  * intel_region_ttm_resource_alloc - Allocate memory resources from a region
- * @mem: The memory region,
+ * @mem: The memory region
+ * @offset: The range start
  * @size: The requested size in bytes
  * @flags: Allocation flags
  *
-- 
2.36.1

