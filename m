Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877A44020F7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6014389DC2;
	Mon,  6 Sep 2021 21:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DCC89D86;
 Mon,  6 Sep 2021 21:01:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="219732481"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="219732481"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362366"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:49 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Subject: [RFC v2 20/22] drm/i915/xelpd: Add register definitions for Plane
 Gamma
Date: Tue,  7 Sep 2021 03:09:02 +0530
Message-Id: <20210906213904.27918-21-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
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

Add macros to define Plane Gamma registers

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 73 +++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index ceee500e64d7..fc4f8b430518 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -11464,6 +11464,79 @@ enum skl_power_gate {
 		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
 		_PLANE_PRE_CSC_GAMC_DATA_2(pipe))
 
+/* Display13 Plane Gamma Reg */
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A	0x70160
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B	0x71160
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A	0x70260
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B	0x71260
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A	0x70164
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B	0x71164
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A	0x70264
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B	0x71264
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A	0x701d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B	0x711d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A	0x702d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B	0x712d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_A	0x701dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_B	0x711dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_A	0x702dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_B	0x712dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_1_A, \
+						_PLANE_POST_CSC_GAMC_DATA_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_2_A, \
+						_PLANE_POST_CSC_GAMC_DATA_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_INDEX_1_A	0x704d8
+#define _PLANE_POST_CSC_GAMC_INDEX_1_B	0x714d8
+#define _PLANE_POST_CSC_GAMC_INDEX_2_A	0x705d8
+#define _PLANE_POST_CSC_GAMC_INDEX_2_B	0x715d8
+#define _PLANE_POST_CSC_GAMC_INDEX_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_1_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_1_B)
+#define _PLANE_POST_CSC_GAMC_INDEX_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_2_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_2_B)
+#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \
+		_PLANE_POST_CSC_GAMC_INDEX_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_DATA_1_A	0x704dc
+#define _PLANE_POST_CSC_GAMC_DATA_1_B	0x714dc
+#define _PLANE_POST_CSC_GAMC_DATA_2_A	0x705dc
+#define _PLANE_POST_CSC_GAMC_DATA_2_B	0x715dc
+#define _PLANE_POST_CSC_GAMC_DATA_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_1_A, \
+						_PLANE_POST_CSC_GAMC_DATA_1_B)
+#define _PLANE_POST_CSC_GAMC_DATA_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_2_A, \
+						_PLANE_POST_CSC_GAMC_DATA_2_B)
+#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \
+		_PLANE_POST_CSC_GAMC_DATA_2(pipe))
+
 /* pipe CSC & degamma/gamma LUTs on CHV */
 #define _CGM_PIPE_A_CSC_COEFF01	(VLV_DISPLAY_BASE + 0x67900)
 #define _CGM_PIPE_A_CSC_COEFF23	(VLV_DISPLAY_BASE + 0x67904)
-- 
2.26.2

