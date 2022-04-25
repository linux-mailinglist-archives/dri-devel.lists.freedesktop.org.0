Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA8750EB26
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA2210E25F;
	Mon, 25 Apr 2022 21:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4406A10E1BC;
 Mon, 25 Apr 2022 21:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650921188; x=1682457188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kKZvZfCBQ8Lsfp1rAfYg6buuK4rhHM2q/JrUberdX2M=;
 b=K0mf3pkdHSBbJcNzCBVNZjbsET4hyLivLlrkUOLJ9QOszGC0TXalHXVG
 aqeg/mFTvIIcAcL9y/J6KyU2qWqN8o/DWdWGO/wp5/vzWk5FRMd5LqWze
 wWKOBMIfVK5HhbmQQ/61dvFXO0MM/H4ce2RCNOVCQWHL3gsVZ25JsJRac
 NRJzzA06cVyzOPH/DnhxcYZznV8FRYLaf+klSEKwpWAeO8M6vJ4jjzpTt
 UY810tDG+z3VDYtcmoixnB2gZNeDSUE0NOVHHWs7+o8r55sbjdT+KJlWW
 v9GSz2VmRAQ+LfE6rcvbiMTuDm6HGlvy/LVHoS5FOqJ8HWCfcSHDhXDj2 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265531323"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="265531323"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 14:12:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729916085"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 14:12:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/3] topic/core-for-CI:  Revert DG2 and ATS-M device IDs
Date: Mon, 25 Apr 2022 14:12:49 -0700
Message-Id: <20220425211251.77154-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220425211251.77154-1-matthew.d.roper@intel.com>
References: <20220425211251.77154-1-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of the IDs here are ready to formally upstream via drm-intel.
We'll rebase these out of the topic/core-for-CI branch (but they're sent
here as a revert to avoid confusing CI).
 - 92b805135ed2 ("drm/i915: Add DG2 PCI IDs")
 - bca8f652e1a0 ("topic/core-for-CI: Add ATS-M PCI IDs")

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c          |  4 +--
 drivers/gpu/drm/i915/intel_device_info.c | 23 ---------------
 include/drm/i915_pciids.h                | 37 ------------------------
 3 files changed, 2 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index b60492826478..a3a1b4cb2942 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1058,6 +1058,7 @@ static const struct intel_device_info xehpsdv_info = {
 		BIT(VECS0) | BIT(VECS1) | \
 		BIT(VCS0) | BIT(VCS2)
 
+__maybe_unused
 static const struct intel_device_info dg2_info = {
 	DG2_FEATURES,
 	XE_LPD_FEATURES,
@@ -1066,6 +1067,7 @@ static const struct intel_device_info dg2_info = {
 	.require_force_probe = 1,
 };
 
+__maybe_unused
 static const struct intel_device_info ats_m_info = {
 	DG2_FEATURES,
 	.display = { 0 },
@@ -1152,8 +1154,6 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_DG1_IDS(&dg1_info),
 	INTEL_RPLS_IDS(&adl_s_info),
 	INTEL_RPLP_IDS(&adl_p_info),
-	INTEL_DG2_IDS(&dg2_info),
-	INTEL_ATS_M_IDS(&ats_m_info),
 	{0, 0, 0}
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 63e05cd15a90..74c3ffb66b8d 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -186,20 +186,6 @@ static const u16 subplatform_rpl_ids[] = {
 	INTEL_RPLP_IDS(0),
 };
 
-static const u16 subplatform_g10_ids[] = {
-	INTEL_DG2_G10_IDS(0),
-	INTEL_ATS_M150_IDS(0),
-};
-
-static const u16 subplatform_g11_ids[] = {
-	INTEL_DG2_G11_IDS(0),
-	INTEL_ATS_M75_IDS(0),
-};
-
-static const u16 subplatform_g12_ids[] = {
-	INTEL_DG2_G12_IDS(0),
-};
-
 static bool find_devid(u16 id, const u16 *p, unsigned int num)
 {
 	for (; num; num--, p++) {
@@ -245,15 +231,6 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	} else if (find_devid(devid, subplatform_rpl_ids,
 			      ARRAY_SIZE(subplatform_rpl_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_RPL);
-	} else if (find_devid(devid, subplatform_g10_ids,
-			      ARRAY_SIZE(subplatform_g10_ids))) {
-		mask = BIT(INTEL_SUBPLATFORM_G10);
-	} else if (find_devid(devid, subplatform_g11_ids,
-			      ARRAY_SIZE(subplatform_g11_ids))) {
-		mask = BIT(INTEL_SUBPLATFORM_G11);
-	} else if (find_devid(devid, subplatform_g12_ids,
-			      ARRAY_SIZE(subplatform_g12_ids))) {
-		mask = BIT(INTEL_SUBPLATFORM_G12);
 	}
 
 	GEM_BUG_ON(mask & ~INTEL_SUBPLATFORM_MASK);
diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
index 97d1270553bd..a7b5eea7ffaa 100644
--- a/include/drm/i915_pciids.h
+++ b/include/drm/i915_pciids.h
@@ -692,41 +692,4 @@
 	INTEL_VGA_DEVICE(0xA7A8, info), \
 	INTEL_VGA_DEVICE(0xA7A9, info)
 
-/* DG2 */
-#define INTEL_DG2_G10_IDS(info) \
-	INTEL_VGA_DEVICE(0x5690, info), \
-	INTEL_VGA_DEVICE(0x5691, info), \
-	INTEL_VGA_DEVICE(0x5692, info), \
-	INTEL_VGA_DEVICE(0x56A0, info), \
-	INTEL_VGA_DEVICE(0x56A1, info), \
-	INTEL_VGA_DEVICE(0x56A2, info)
-
-#define INTEL_DG2_G11_IDS(info) \
-	INTEL_VGA_DEVICE(0x5693, info), \
-	INTEL_VGA_DEVICE(0x5694, info), \
-	INTEL_VGA_DEVICE(0x5695, info), \
-	INTEL_VGA_DEVICE(0x56A5, info), \
-	INTEL_VGA_DEVICE(0x56A6, info), \
-	INTEL_VGA_DEVICE(0x56B0, info), \
-	INTEL_VGA_DEVICE(0x56B1, info)
-
-#define INTEL_DG2_G12_IDS(info) \
-	INTEL_VGA_DEVICE(0x56A3, info), \
-	INTEL_VGA_DEVICE(0x56A4, info)
-
-#define INTEL_DG2_IDS(info) \
-	INTEL_DG2_G10_IDS(info), \
-	INTEL_DG2_G11_IDS(info), \
-	INTEL_DG2_G12_IDS(info)
-
-#define INTEL_ATS_M150_IDS(info) \
-	INTEL_VGA_DEVICE(0x56C0, info)
-
-#define INTEL_ATS_M75_IDS(info) \
-	INTEL_VGA_DEVICE(0x56C1, info)
-
-#define INTEL_ATS_M_IDS(info) \
-	INTEL_ATS_M150_IDS(info), \
-	INTEL_ATS_M75_IDS(info)
-
 #endif /* _I915_PCIIDS_H */
-- 
2.35.1

