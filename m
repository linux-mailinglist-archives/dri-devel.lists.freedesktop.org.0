Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30853D43C0
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FB46FD3F;
	Sat, 24 Jul 2021 00:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767B56FD2C;
 Sat, 24 Jul 2021 00:11:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563467"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563467"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434270044"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 24/30] drm/i915: rename CNL references in intel_dram.c
Date: Fri, 23 Jul 2021 17:11:08 -0700
Message-Id: <20210724001114.249295-25-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the removal of CNL, let's consider ICL as the first platform using
those constants.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h   | 24 +++++++++++------------
 drivers/gpu/drm/i915/intel_dram.c | 32 +++++++++++++++----------------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index f032a4c8b26d..8782d1723254 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -11082,18 +11082,18 @@ enum skl_power_gate {
 #define  SKL_DRAM_RANK_1			(0x0 << 10)
 #define  SKL_DRAM_RANK_2			(0x1 << 10)
 #define  SKL_DRAM_RANK_MASK			(0x1 << 10)
-#define  CNL_DRAM_SIZE_MASK			0x7F
-#define  CNL_DRAM_WIDTH_MASK			(0x3 << 7)
-#define  CNL_DRAM_WIDTH_SHIFT			7
-#define  CNL_DRAM_WIDTH_X8			(0x0 << 7)
-#define  CNL_DRAM_WIDTH_X16			(0x1 << 7)
-#define  CNL_DRAM_WIDTH_X32			(0x2 << 7)
-#define  CNL_DRAM_RANK_MASK			(0x3 << 9)
-#define  CNL_DRAM_RANK_SHIFT			9
-#define  CNL_DRAM_RANK_1			(0x0 << 9)
-#define  CNL_DRAM_RANK_2			(0x1 << 9)
-#define  CNL_DRAM_RANK_3			(0x2 << 9)
-#define  CNL_DRAM_RANK_4			(0x3 << 9)
+#define  ICL_DRAM_SIZE_MASK			0x7F
+#define  ICL_DRAM_WIDTH_MASK			(0x3 << 7)
+#define  ICL_DRAM_WIDTH_SHIFT			7
+#define  ICL_DRAM_WIDTH_X8			(0x0 << 7)
+#define  ICL_DRAM_WIDTH_X16			(0x1 << 7)
+#define  ICL_DRAM_WIDTH_X32			(0x2 << 7)
+#define  ICL_DRAM_RANK_MASK			(0x3 << 9)
+#define  ICL_DRAM_RANK_SHIFT			9
+#define  ICL_DRAM_RANK_1			(0x0 << 9)
+#define  ICL_DRAM_RANK_2			(0x1 << 9)
+#define  ICL_DRAM_RANK_3			(0x2 << 9)
+#define  ICL_DRAM_RANK_4			(0x3 << 9)
 
 #define SA_PERF_STATUS_0_0_0_MCHBAR_PC		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5918)
 #define  DG1_QCLK_RATIO_MASK			REG_GENMASK(9, 2)
diff --git a/drivers/gpu/drm/i915/intel_dram.c b/drivers/gpu/drm/i915/intel_dram.c
index 9675bb94b70b..34d6cf440352 100644
--- a/drivers/gpu/drm/i915/intel_dram.c
+++ b/drivers/gpu/drm/i915/intel_dram.c
@@ -77,21 +77,21 @@ static int skl_get_dimm_ranks(u16 val)
 }
 
 /* Returns total Gb for the whole DIMM */
-static int cnl_get_dimm_size(u16 val)
+static int icl_get_dimm_size(u16 val)
 {
-	return (val & CNL_DRAM_SIZE_MASK) * 8 / 2;
+	return (val & ICL_DRAM_SIZE_MASK) * 8 / 2;
 }
 
-static int cnl_get_dimm_width(u16 val)
+static int icl_get_dimm_width(u16 val)
 {
-	if (cnl_get_dimm_size(val) == 0)
+	if (icl_get_dimm_size(val) == 0)
 		return 0;
 
-	switch (val & CNL_DRAM_WIDTH_MASK) {
-	case CNL_DRAM_WIDTH_X8:
-	case CNL_DRAM_WIDTH_X16:
-	case CNL_DRAM_WIDTH_X32:
-		val = (val & CNL_DRAM_WIDTH_MASK) >> CNL_DRAM_WIDTH_SHIFT;
+	switch (val & ICL_DRAM_WIDTH_MASK) {
+	case ICL_DRAM_WIDTH_X8:
+	case ICL_DRAM_WIDTH_X16:
+	case ICL_DRAM_WIDTH_X32:
+		val = (val & ICL_DRAM_WIDTH_MASK) >> ICL_DRAM_WIDTH_SHIFT;
 		return 8 << val;
 	default:
 		MISSING_CASE(val);
@@ -99,12 +99,12 @@ static int cnl_get_dimm_width(u16 val)
 	}
 }
 
-static int cnl_get_dimm_ranks(u16 val)
+static int icl_get_dimm_ranks(u16 val)
 {
-	if (cnl_get_dimm_size(val) == 0)
+	if (icl_get_dimm_size(val) == 0)
 		return 0;
 
-	val = (val & CNL_DRAM_RANK_MASK) >> CNL_DRAM_RANK_SHIFT;
+	val = (val & ICL_DRAM_RANK_MASK) >> ICL_DRAM_RANK_SHIFT;
 
 	return val + 1;
 }
@@ -121,10 +121,10 @@ skl_dram_get_dimm_info(struct drm_i915_private *i915,
 		       struct dram_dimm_info *dimm,
 		       int channel, char dimm_name, u16 val)
 {
-	if (GRAPHICS_VER(i915) >= 10) {
-		dimm->size = cnl_get_dimm_size(val);
-		dimm->width = cnl_get_dimm_width(val);
-		dimm->ranks = cnl_get_dimm_ranks(val);
+	if (GRAPHICS_VER(i915) >= 11) {
+		dimm->size = icl_get_dimm_size(val);
+		dimm->width = icl_get_dimm_width(val);
+		dimm->ranks = icl_get_dimm_ranks(val);
 	} else {
 		dimm->size = skl_get_dimm_size(val);
 		dimm->width = skl_get_dimm_width(val);
-- 
2.31.1

