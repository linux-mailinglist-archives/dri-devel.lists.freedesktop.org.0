Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6734DBB18
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 00:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F1110E67A;
	Wed, 16 Mar 2022 23:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00F710E66F;
 Wed, 16 Mar 2022 23:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647473522; x=1679009522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gEn3n2T2nSZZ3VaGIhww1HvXo28JS+KyQAKq4LhBdnk=;
 b=njmp2k84T2nLQzKtT7G37pY6R3aN5XgQLdxlQUNZyBF286Rh86s6Q2pO
 9WngaZ90VXEdfSkSSPY4VnzOSL3Brhyz7/5YafaQOxzRQgaYJZ0U0EZSc
 Fn+Q3/DEfh4aX3PsuKvjaYQcdS95cfjRx4WQ0BefGmH3gOdPxucm3PKsH
 1dGFEEoR8KjJdIaOd8QkUpL9v9VuhqIYhAzhNwr5qcKmzP6ZB/jsYNLBD
 P0Q9Yt1+xGTQkWsD6jtdQYCWIBJAib4bB1+onUDqi3M2nvqbqzCkbEOoU
 8wPNQXqFyL4d8wgHbaH+WmpUox0lvQo8XytJaFJQH92RaNQJ3XBV1ORrS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237343406"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="237343406"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:32:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="613816756"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:32:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/3] Add logical/physical mapping to media_ver >= 12.50
Date: Wed, 16 Mar 2022 16:31:45 -0700
Message-Id: <20220316233148.434177-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Git-Pile: INTEL_DII
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Logical to physical mapping for VCS was in place for XEHPSDV and PVC,
but not for any other platform with media version 12. According to
BSpec 48028, for all such platforms, there should be the mapping
0 -> 0, 1 -> 2. This was reported by media team as a failure on ATS-M
and when checking for the other platforms, I can't see why we are not
doing the mapping for them.

When sending upstream I will try to extend this up to gen11. For
internal use it's sufficient to fix it only for 12.50.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
baseline: 204d0733767434b3b8e65206527e5a09e8db87aa
pile-commit: 0a765de358b5a5fd1e0f2455b28ed7c044e1a1f5
range-diff:
   -:  ------------- > 1882:  0370f1b9474cf drm/i915: Fix renamed struct field
2507:  cfdc9adc9b032 ! 1883:  9e2eceeacaff0 INTEL_DII: drm/i915/xehpsdv: Add logical mapping for XEHPSDV VDBOXs
2987:  6e66e0eb7e14b <    -:  ------------- INTEL_DII: drm/i915/pvc: Add PVC logical mapping for VDBOXs
   -:  ------------- > 2988:  87832869cabd9 INTEL_DII: drm/i915/pvc: Add PVC logical mapping for VDBOXs
2990:  63675a16190ee ! 2991:  9d9368503e785 INTEL_DII/UAPI/NEEDSIGT: drm/i915/pvc: Add new slim VDBox engines
3153:  0eeccc1dd11fb ! 3154:  885f146052ba0 INTEL_DII: drm/i915: Read graphics/media/display arch version from hw

 series                                             |  3 ++-
 ...API-NEEDSIGT-drm-i915-pvc-Add-new-slim-VD.patch | 24 ++++++++-----------
 ...rm-i915-Read-graphics-media-display-arch-.patch | 20 ++++++++--------
 ...hp-Add-logical-mapping-for-video-decode-e.patch | 26 +++++++++++++--------
 0001-drm-i915-Fix-renamed-struct-field.patch       | 27 ++++++++++++++++++++++
 ...rm-i915-pvc-Add-PVC-logical-mapping-for-V.patch | 25 ++++++++------------
 6 files changed, 73 insertions(+), 52 deletions(-)

diff --git a/series b/series
index 9e4c20d6dc07f..286b188f486b0 100644
--- a/series
+++ b/series
@@ -1881,6 +1881,8 @@
 0001-INTEL_DII-START-SECTION-pending-upstream-patches.patch
 0001-drm-i915-Sanitycheck-PCI-BARs-on-probe.patch
 0001-drm-i915-intel_vsec-Add-Intel-PMT-support-for-DG2.patch
+0001-drm-i915-Fix-renamed-struct-field.patch
+0001-drm-i915-xehp-Add-logical-mapping-for-video-decode-e.patch
 0001-drm-i915-dg1-Fix-power-gate-sequence.patch
 0001-FIXME-drm-i915-remove-some-debug-only-registers-from.patch
 0001-drm-i915-perf-Ensure-observation-logic-is-not-clock-.patch
@@ -2506,7 +2508,6 @@
 0001-INTEL_DII-START-SECTION-XEHPSDV-Enabling.patch
 0001-INTEL_DII-drm-i915-xehpsdv-Add-XEHPSDV-PCI-IDs.patch
 0001-INTEL_DII-UAPI-NEEDSIGT-PRELIM-uapi-for-compute-clas.patch
-0001-INTEL_DII-drm-i915-xehpsdv-Add-logical-mapping-for-X.patch
 0001-INTEL_DII-drm-i915-guc-Support-programming-the-EU-pr.patch
 0001-INTEL_DII-FIXME-UAPI-NEEDSIGT-drm-i915-perf-add-a-pa.patch
 0001-INTEL_DII-drm-i915-perf-Enable-large-OA-buffer-suppo.patch
diff --git a/0001-INTEL_DII-UAPI-NEEDSIGT-drm-i915-pvc-Add-new-slim-VD.patch b/0001-INTEL_DII-UAPI-NEEDSIGT-drm-i915-pvc-Add-new-slim-VD.patch
index d269a1b846af4..5ff53533e8c81 100644
--- a/0001-INTEL_DII-UAPI-NEEDSIGT-drm-i915-pvc-Add-new-slim-VD.patch
+++ b/0001-INTEL_DII-UAPI-NEEDSIGT-drm-i915-pvc-Add-new-slim-VD.patch
@@ -41,19 +41,19 @@ Reviewed-by: Steve Carbonari <steven.carbonari@intel.com>
 Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
 Signed-off-by: Andi Shyti <andi.shyti@intel.com>
 ---
- drivers/gpu/drm/i915/gt/intel_engine_cs.c | 24 +++++++++++++++++++----
+ drivers/gpu/drm/i915/gt/intel_engine_cs.c | 22 +++++++++++++++++++---
  drivers/gpu/drm/i915/gt/sysfs_engines.c   |  1 +
  drivers/gpu/drm/i915/i915_drv.h           |  2 ++
  drivers/gpu/drm/i915/i915_pci.c           |  3 ++-
  drivers/gpu/drm/i915/i915_query.c         |  3 ++-
  drivers/gpu/drm/i915/intel_device_info.h  |  1 +
  include/uapi/drm/i915_drm_prelim.h        |  1 +
- 7 files changed, 29 insertions(+), 6 deletions(-)
+ 7 files changed, 28 insertions(+), 5 deletions(-)
 
 diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
 --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
 +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
-@@ -573,9 +573,15 @@ static void __setup_engine_capabilities(struct intel_engine_cs *engine)
+@@ -646,9 +646,15 @@ static void __setup_engine_capabilities(struct intel_engine_cs *engine)
  		if ((GRAPHICS_VER(i915) >= 11 &&
  		     (engine->gt->info.vdbox_sfc_access &
  		      BIT(engine->instance))) ||
@@ -70,7 +70,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt
  	} else if (engine->class == VIDEO_ENHANCEMENT_CLASS) {
  		if (GRAPHICS_VER(i915) >= 9 &&
  		    engine->gt->info.sfc_mask & BIT(engine->instance))
-@@ -666,12 +672,16 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
+@@ -739,12 +745,16 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
  	 * In Gen12, Even numbered physical instance always are connected
  	 * to an SFC. Odd numbered physical instances have SFC only if
  	 * previous even instance is fused off.
@@ -87,7 +87,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt
  	else if (GRAPHICS_VER(i915) == 12)
  		return (physical_vdbox % 2 == 0) ||
  			!(BIT(physical_vdbox - 1) & vdbox_mask);
-@@ -777,7 +787,13 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
+@@ -850,7 +860,13 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
  	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
  		      GEN11_GT_VEBOX_DISABLE_SHIFT;
  
@@ -102,15 +102,9 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt
  		fuse1 = intel_uncore_read(uncore, HSW_PAVP_FUSE1);
  		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
  	} else {
-@@ -849,12 +865,12 @@ static void populate_logical_ids(struct intel_gt *gt, u8 *logical_ids,
- static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
- {
- 	/*
--	 * As of right now, only PVS / XEHPSDV video decode boxes have a
-+	 * As of right now, only a few platforms' video decode boxes have
- 	 * non-standard logical mappings, hence the specical cases. These
- 	 * mappings are defined in bspec 48028, 48075 and are needed to use the
- 	 * split-frame feature.
+@@ -925,7 +941,7 @@ static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
+ 	 * Logical to physical mapping is needed for proper support
+ 	 * to split-frame feature.
  	 */
 -	if (IS_PONTEVECCHIO(gt->i915) && class == VIDEO_DECODE_CLASS) {
 +	if (HAS_SLIM_VDBOX(gt->i915) && class == VIDEO_DECODE_CLASS) {
@@ -131,7 +125,7 @@ diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/s
 diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
 --- a/drivers/gpu/drm/i915/i915_drv.h
 +++ b/drivers/gpu/drm/i915/i915_drv.h
-@@ -1673,6 +1673,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
+@@ -1640,6 +1640,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
  #define HAS_ASID_TLB_INVALIDATION(i915) \
  	(INTEL_INFO(i915)->has_asid_tlb_invalidation)
  
diff --git a/0001-INTEL_DII-drm-i915-Read-graphics-media-display-arch-.patch b/0001-INTEL_DII-drm-i915-Read-graphics-media-display-arch-.patch
index d69fdc7e7d137..acdd563a75f11 100644
--- a/0001-INTEL_DII-drm-i915-Read-graphics-media-display-arch-.patch
+++ b/0001-INTEL_DII-drm-i915-Read-graphics-media-display-arch-.patch
@@ -125,7 +125,7 @@ diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/i
 diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
 --- a/drivers/gpu/drm/i915/i915_driver.c
 +++ b/drivers/gpu/drm/i915/i915_driver.c
-@@ -71,6 +71,7 @@
+@@ -72,6 +72,7 @@
  #include "gt/intel_clos.h"
  #include "gt/intel_gt.h"
  #include "gt/intel_gt_pm.h"
@@ -133,7 +133,7 @@ diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driv
  #include "gt/intel_rc6.h"
  #include "gt/iov/intel_iov.h"
  
-@@ -497,17 +498,86 @@ static void i915_resize_lmem_bar(struct drm_i915_private *i915)
+@@ -499,17 +500,86 @@ static void i915_resize_lmem_bar(struct drm_i915_private *i915)
  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
  }
  
@@ -221,7 +221,7 @@ diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driv
  {
  	int ret = 0;
  
-@@ -1275,14 +1345,23 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+@@ -1283,14 +1353,23 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
  		return PTR_ERR(i915);
  
  	/* Disable nuclear pageflip by default on pre-ILK */
@@ -250,7 +250,7 @@ diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driv
 diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
 --- a/drivers/gpu/drm/i915/i915_drv.h
 +++ b/drivers/gpu/drm/i915/i915_drv.h
-@@ -1197,19 +1197,19 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
+@@ -1164,19 +1164,19 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
  
  #define IP_VER(ver, rel)		((ver) << 8 | (rel))
  
@@ -264,7 +264,7 @@ diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
  	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
  
 -#define MEDIA_VER(i915)			(INTEL_INFO(i915)->media.ver)
--#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.arch, \
+-#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.ver, \
 -					       INTEL_INFO(i915)->media.rel)
 +#define MEDIA_VER(i915)			(RUNTIME_INFO(i915)->media.ver)
 +#define MEDIA_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->media.ver, \
@@ -277,7 +277,7 @@ diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
  #define IS_DISPLAY_VER(i915, from, until) \
  	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
  
-@@ -1688,6 +1688,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
+@@ -1655,6 +1655,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
  	(INTEL_INFO(dev_priv)->has_oam)
  #define OAM_USES_VDBOX0_CHANNEL(dev_priv) \
  	(INTEL_INFO(dev_priv)->oam_uses_vdbox0_channel)
@@ -290,7 +290,7 @@ diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
 diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
 --- a/drivers/gpu/drm/i915/i915_reg.h
 +++ b/drivers/gpu/drm/i915/i915_reg.h
-@@ -6198,6 +6198,11 @@ enum gt_vctr_registers {
+@@ -6201,6 +6201,11 @@ enum gt_vctr_registers {
  #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
  #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
  
@@ -302,7 +302,7 @@ diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
  /*GEN11 chicken */
  #define _PIPEA_CHICKEN				0x70038
  #define _PIPEB_CHICKEN				0x71038
-@@ -9269,4 +9274,5 @@ enum skl_power_gate {
+@@ -9277,4 +9282,5 @@ enum skl_power_gate {
  #define CPORT_MBDB_CSRS_END (CPORT_MBDB_CSRS + 0x1000)
  #define CPORT_MBDB_INT_ENABLE_MASK _MMIO(CPORT_MBDB_CSRS + 0x8)
  
@@ -311,7 +311,7 @@ diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
 diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
 --- a/drivers/gpu/drm/i915/intel_device_info.c
 +++ b/drivers/gpu/drm/i915/intel_device_info.c
-@@ -88,22 +88,6 @@ const char *intel_platform_name(enum intel_platform platform)
+@@ -90,22 +90,6 @@ const char *intel_platform_name(enum intel_platform platform)
  void intel_device_info_print_static(const struct intel_device_info *info,
  				    struct drm_printer *p)
  {
@@ -334,7 +334,7 @@ diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/int
  	drm_printf(p, "gt: %d\n", info->gt);
  	drm_printf(p, "memory-regions: %x\n", info->memory_regions);
  	drm_printf(p, "page-sizes: %x\n", info->page_sizes);
-@@ -125,6 +109,22 @@ void intel_device_info_print_static(const struct intel_device_info *info,
+@@ -127,6 +111,22 @@ void intel_device_info_print_static(const struct intel_device_info *info,
  void intel_device_info_print_runtime(const struct intel_runtime_info *info,
  				     struct drm_printer *p)
  {
diff --git a/0001-INTEL_DII-drm-i915-xehpsdv-Add-logical-mapping-for-X.patch b/0001-drm-i915-xehp-Add-logical-mapping-for-video-decode-e.patch
similarity index 60%
rename from 0001-INTEL_DII-drm-i915-xehpsdv-Add-logical-mapping-for-X.patch
rename to 0001-drm-i915-xehp-Add-logical-mapping-for-video-decode-e.patch
index 2dc96a37f0ddc..66e9466f9cb79 100644
--- a/0001-INTEL_DII-drm-i915-xehpsdv-Add-logical-mapping-for-X.patch
+++ b/0001-drm-i915-xehp-Add-logical-mapping-for-video-decode-e.patch
@@ -1,14 +1,20 @@
 From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Matthew Brost <matthew.brost@intel.com>
 Date: Mon, 8 Jun 2020 12:35:11 -0700
-Subject: [PATCH] INTEL_DII: drm/i915/xehpsdv: Add logical mapping for XEHPSDV
- VDBOXs
+Subject: [PATCH] drm/i915/xehp: Add logical mapping for video decode engines
 
-Add logical mapping for XEHPSDV VDBOXs. Currently only XEHPSDV has non-standard
-logical mapping for the VDBOXs, hence the special case. This is
-non-standard mapping is required for split-frame workloads.
+Add logical mapping for VDBOXs. This mapping is required for
+split-frame workloads and otherwise fail with:
+
+	00000000-F8C53528: [GUC] 0441-INVALID_ENGINE_SUBMIT_MASK
+
+TODO: double check in upstream regarding extending the mapping to the
+old platforms, because if the userspace stack uses the logical id, it
+needs the mapping. Apparently it's not being used by the media driver in
+Linux.
 
 Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
 ---
  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 23 ++++++++++++++++++-----
  1 file changed, 18 insertions(+), 5 deletions(-)
@@ -16,18 +22,18 @@ Signed-off-by: Matthew Brost <matthew.brost@intel.com>
 diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
 --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
 +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
-@@ -785,12 +785,25 @@ static void populate_logical_ids(struct intel_gt *gt, u8 *logical_ids,
+@@ -728,12 +728,25 @@ static void populate_logical_ids(struct intel_gt *gt, u8 *logical_ids,
  
  static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
  {
 -	int i;
 -	u8 map[MAX_ENGINE_INSTANCE + 1];
 +	/*
-+	 * As of right now, only XEHPSDV video decode boxes have a non-standard
-+	 * logical mapping, hence the specical case. This mapping is defined in
-+	 * bspec 48028, 48075 and is needed to use the split-frame feature.
++	 * Logical to physical mapping is needed for proper support
++	 * to split-frame feature.
 +	 */
-+	if (IS_XEHPSDV(gt->i915) && class == VIDEO_DECODE_CLASS) {
++	if (MEDIA_VER_FULL(gt->i915) >= IP_VER(12, 50) &&
++	    class == VIDEO_DECODE_CLASS) {
 +		static const u8 map[] = { 0, 2, 4, 6, 1, 3, 5, 7 };
  
 -	for (i = 0; i < MAX_ENGINE_INSTANCE + 1; ++i)
diff --git a/0001-drm-i915-Fix-renamed-struct-field.patch b/0001-drm-i915-Fix-renamed-struct-field.patch
new file mode 100644
index 0000000000000..f5ada5d8bca39
--- /dev/null
+++ b/0001-drm-i915-Fix-renamed-struct-field.patch
@@ -0,0 +1,27 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.demarchi@intel.com>
+Date: Wed, 16 Mar 2022 15:19:06 -0700
+Subject: [PATCH] drm/i915: Fix renamed struct field
+
+Earlier versions of commit a5b7ef27da60 ("drm/i915: Add struct to hold
+IP version") named "ver" as "arch" and then when it was renamed it
+missed the rename on MEDIA_VER_FULL() since it it's currently not used.
+
+Fixes: a5b7ef27da60 ("drm/i915: Add struct to hold IP version")
+Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+---
+ drivers/gpu/drm/i915/i915_drv.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
+--- a/drivers/gpu/drm/i915/i915_drv.h
++++ b/drivers/gpu/drm/i915/i915_drv.h
+@@ -1006,7 +1006,7 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
+ 	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
+ 
+ #define MEDIA_VER(i915)			(INTEL_INFO(i915)->media.ver)
+-#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.arch, \
++#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.ver, \
+ 					       INTEL_INFO(i915)->media.rel)
+ #define IS_MEDIA_VER(i915, from, until) \
+ 	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
diff --git a/0001-INTEL_DII-drm-i915-pvc-Add-PVC-logical-mapping-for-V.patch b/0001-INTEL_DII-drm-i915-pvc-Add-PVC-logical-mapping-for-V.patch
index acf4e2e5501c9..0c7d0e19b7bed 100644
--- a/0001-INTEL_DII-drm-i915-pvc-Add-PVC-logical-mapping-for-V.patch
+++ b/0001-INTEL_DII-drm-i915-pvc-Add-PVC-logical-mapping-for-V.patch
@@ -8,31 +8,24 @@ correct mapping.
 
 Signed-off-by: Matthew Brost <matthew.brost@intel.com>
 ---
- drivers/gpu/drm/i915/gt/intel_engine_cs.c | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
+ drivers/gpu/drm/i915/gt/intel_engine_cs.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
 --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
 +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
-@@ -849,11 +849,17 @@ static void populate_logical_ids(struct intel_gt *gt, u8 *logical_ids,
- static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
- {
- 	/*
--	 * As of right now, only XEHPSDV video decode boxes have a non-standard
--	 * logical mapping, hence the specical case. This mapping is defined in
--	 * bspec 48028, 48075 and is needed to use the split-frame feature.
-+	 * As of right now, only PVS / XEHPSDV video decode boxes have a
-+	 * non-standard logical mappings, hence the specical cases. These
-+	 * mappings are defined in bspec 48028, 48075 and are needed to use the
-+	 * split-frame feature.
+@@ -925,7 +925,13 @@ static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
+ 	 * Logical to physical mapping is needed for proper support
+ 	 * to split-frame feature.
  	 */
--	if (IS_XEHPSDV(gt->i915) && class == VIDEO_DECODE_CLASS) {
+-	if (MEDIA_VER_FULL(gt->i915) >= IP_VER(12, 50) &&
 +	if (IS_PONTEVECCHIO(gt->i915) && class == VIDEO_DECODE_CLASS) {
 +		static const u8 map[] = { 0, 2, 1 };
 +
 +		populate_logical_ids(gt, logical_ids, class,
 +				     map, ARRAY_SIZE(map));
-+	} else if (IS_XEHPSDV(gt->i915) && class == VIDEO_DECODE_CLASS) {
++
++	} else if (MEDIA_VER_FULL(gt->i915) >= IP_VER(12, 50) &&
+ 	    class == VIDEO_DECODE_CLASS) {
  		static const u8 map[] = { 0, 2, 4, 6, 1, 3, 5, 7 };
  
- 		populate_logical_ids(gt, logical_ids, class,
--
git-pile 0.99-dev

