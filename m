Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC7F6DA5C5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 00:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7777010ED54;
	Thu,  6 Apr 2023 22:26:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74DD10EA51;
 Thu,  6 Apr 2023 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680820003; x=1712356003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nGnsDK6K+vYGCzopAusCQsPCN+w3ymdlW+hkNyKNSos=;
 b=CzWY342GEqz9QXudECp/B0PmJ7vl6tUEsfnODSJYi+PPqm+Um/EXfQRq
 Ewavph44tZfg3z9owA8CXz32Goe8fKz5B83/9g5Fn05XifoDIaaseSnEf
 Q5KWuPUMCBy4FJFVRlnmDOLmxyiM6j1R8PT0sqBRX4mty9O9+GJICJ0R2
 nx6oSmrauutEisGV9ZiancUhpRZCAb3q3mj8cYF+KqLOCDM60b0QrWGc9
 qS2c5zeE8WcviiTrexn3EH1Cxk6D2r9A39rdyIN5PpKES+OfM8MlTyylU
 Jl0hKIs8Eo66SUrTDwSzz7VECQKAnUV99LJ3/Zso2gNVXetOioUZUFoAf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341604983"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="341604983"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 15:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776635902"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776635902"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 15:26:43 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 4/5] drm/i915/guc: Capture list clean up - 3
Date: Thu,  6 Apr 2023 15:26:16 -0700
Message-Id: <20230406222617.790484-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230406222617.790484-1-John.C.Harrison@Intel.com>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Fix Xe_LP name.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 44 +++++++++----------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 7968a495fcfa8..fbd0be4afc6d5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -96,47 +96,47 @@
 	{ GEN12_SFC_DONE(2),        0,      0, "SFC_DONE[2]" }, \
 	{ GEN12_SFC_DONE(3),        0,      0, "SFC_DONE[3]" }
 
-/* XE_LPD - Global */
-static const struct __guc_mmio_reg_descr xe_lpd_global_regs[] = {
+/* XE_LP Global */
+static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
 	COMMON_BASE_GLOBAL,
 	COMMON_GEN9BASE_GLOBAL,
 	COMMON_GEN12BASE_GLOBAL,
 };
 
-/* XE_LPD - Render / Compute Per-Class */
-static const struct __guc_mmio_reg_descr xe_lpd_rc_class_regs[] = {
+/* XE_LP Render / Compute Per-Class */
+static const struct __guc_mmio_reg_descr xe_lp_rc_class_regs[] = {
 	COMMON_BASE_HAS_EU,
 	COMMON_BASE_RENDER,
 	COMMON_GEN12BASE_RENDER,
 };
 
-/* GEN9/XE_LPD - Render / Compute Per-Engine-Instance */
+/* GEN8+ Render / Compute Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr gen8_rc_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
-/* GEN9/XE_LPD - Media Decode/Encode Per-Engine-Instance */
+/* GEN8+ Media Decode/Encode Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr gen8_vd_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
-/* XE_LPD - Video Enhancement Per-Class */
-static const struct __guc_mmio_reg_descr xe_lpd_vec_class_regs[] = {
+/* XE_LP Video Enhancement Per-Class */
+static const struct __guc_mmio_reg_descr xe_lp_vec_class_regs[] = {
 	COMMON_GEN12BASE_VEC,
 };
 
-/* GEN9/XE_LPD - Video Enhancement Per-Engine-Instance */
+/* GEN8+ Video Enhancement Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr gen8_vec_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
-/* GEN9/XE_LPD - Blitter Per-Engine-Instance */
+/* GEN8+ Blitter Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr gen8_blt_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
-/* XE_LPD - GSC Per-Engine-Instance */
-static const struct __guc_mmio_reg_descr xe_lpd_gsc_inst_regs[] = {
+/* XE_LP - GSC Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
@@ -153,10 +153,8 @@ static const struct __guc_mmio_reg_descr default_rc_class_regs[] = {
 };
 
 /*
- * Empty lists:
- * GEN9/XE_LPD - Blitter Per-Class
- * GEN9/XE_LPD - Media Decode/Encode Per-Class
- * GEN9 - VEC Class
+ * Empty list to prevent warnings about unknown class/instance types
+ * as not all class/instanace types have entries on all platforms.
  */
 static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 };
@@ -191,20 +189,20 @@ static const struct __guc_mmio_reg_descr_group default_lists[] = {
 	{}
 };
 
-static const struct __guc_mmio_reg_descr_group xe_lpd_lists[] = {
-	MAKE_REGLIST(xe_lpd_global_regs, PF, GLOBAL, 0),
-	MAKE_REGLIST(xe_lpd_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
+static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
+	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(xe_lp_rc_class_regs, PF, ENGINE_CLASS, GUC_RENDER_CLASS),
 	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_RENDER_CLASS),
-	MAKE_REGLIST(xe_lpd_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
+	MAKE_REGLIST(xe_lp_rc_class_regs, PF, ENGINE_CLASS, GUC_COMPUTE_CLASS),
 	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_COMPUTE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_VIDEO_CLASS),
 	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEO_CLASS),
-	MAKE_REGLIST(xe_lpd_vec_class_regs, PF, ENGINE_CLASS, GUC_VIDEOENHANCE_CLASS),
+	MAKE_REGLIST(xe_lp_vec_class_regs, PF, ENGINE_CLASS, GUC_VIDEOENHANCE_CLASS),
 	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_VIDEOENHANCE_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_BLITTER_CLASS),
 	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_BLITTER_CLASS),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_GSC_OTHER_CLASS),
-	MAKE_REGLIST(xe_lpd_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
+	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_GSC_OTHER_CLASS),
 	{}
 };
 
@@ -366,7 +364,7 @@ guc_capture_get_device_reglist(struct intel_guc *guc)
 	const struct __guc_mmio_reg_descr_group *lists;
 
 	if (GRAPHICS_VER(i915) >= 12)
-		lists = xe_lpd_lists;
+		lists = xe_lp_lists;
 	else
 		lists = default_lists;
 
-- 
2.39.1

