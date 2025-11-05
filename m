Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62450C359C2
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F0810E72B;
	Wed,  5 Nov 2025 12:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEKO0KIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DC610E72B;
 Wed,  5 Nov 2025 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345383; x=1793881383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fMHeot/QtujRHfbNdKxfM0FtkOSBGh4A74M8aQx4T0M=;
 b=kEKO0KIK4GJlmKKiQtfuEs8yaWxQFbD4BDXnYybyj2aSUUNuQSjCveOw
 Lif1kRTzl9AzFXQBGWS/BeK81BANwcqnExS0j13ytrH0VC3/TUAsBtJHX
 WUaR75TlvWSySjXcMD304BSMlfwEwCVzo3+hXzersO6tC/F8L9Gs0miNQ
 6yxmLZoyWy5jrmMMoa5TEsb1lrIA3M5xZIHZhOOiGCuJ8TW+ZMmFNrs4G
 g5ck+QckUQvis9abvL/w1WlkEttW9pfty+eAWLv44xqNEBqei4AqSwwNQ
 ChH55ZPQklHAr/AHcrut17tT0aefsVJCJ8bwDOWXrgLIXTzJ0yR1J/5+4 A==;
X-CSE-ConnectionGUID: 9mqVtOozSyyMzEHH3YYPIQ==
X-CSE-MsgGUID: H8djy71dS3KC+GU3+UJ18g==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68317538"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="68317538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:23:03 -0800
X-CSE-ConnectionGUID: VJZLHESdQ6Sb/E8BN0Wugg==
X-CSE-MsgGUID: q3B+chYMSpCeSg+ajI26qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740286"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:22:59 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 09/16] drm/i915: Add register definitions for Plane Degamma
Date: Wed,  5 Nov 2025 18:04:05 +0530
Message-ID: <20251105123413.2671075-10-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251105123413.2671075-1-uma.shankar@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
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

Add macros to define Plane Degamma registers

BSpec: 50411, 50412, 50413, 50414

v2:
 - Add BSpec links (Suraj)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../i915/display/skl_universal_plane_regs.h   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
index 7c944d3ca855..b3fbe1e20dfe 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
@@ -254,6 +254,7 @@
 #define   PLANE_COLOR_PIPE_CSC_ENABLE			REG_BIT(23) /* Pre-ICL */
 #define   PLANE_COLOR_PLANE_CSC_ENABLE			REG_BIT(21) /* ICL+ */
 #define   PLANE_COLOR_INPUT_CSC_ENABLE			REG_BIT(20) /* ICL+ */
+#define   PLANE_COLOR_PRE_CSC_GAMMA_ENABLE		REG_BIT(14)
 #define   PLANE_COLOR_CSC_MODE_MASK			REG_GENMASK(19, 17)
 #define   PLANE_COLOR_CSC_MODE_BYPASS			REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 0)
 #define   PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601		REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 1)
@@ -290,6 +291,58 @@
 									   _PLANE_INPUT_CSC_POSTOFF_HI_1_A, _PLANE_INPUT_CSC_POSTOFF_HI_1_B, \
 									   _PLANE_INPUT_CSC_POSTOFF_HI_2_A, _PLANE_INPUT_CSC_POSTOFF_HI_2_B)
 
+#define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i) * 4)
+
+/* Display13 Plane Degmma Reg */
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A      0x701d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B      0x711d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A      0x702d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B      0x712d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe)  _PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A, \
+                                               _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe)  _PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A, \
+                                               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B)
+#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)   \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))
+#define         PLANE_PAL_PREC_AUTO_INCREMENT          REG_BIT(10)
+
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A       0x701d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B       0x711d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A       0x702d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B       0x712d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe)   _PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A, \
+                                               _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B)
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe)   _PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A, \
+                                               _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B)
+#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)    \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))
+
+#define _PLANE_PRE_CSC_GAMC_INDEX_1_A  0x704d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_1_B  0x714d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_2_A  0x705d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_2_B  0x715d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_1(pipe)      _PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_1_A, \
+                                               _PLANE_PRE_CSC_GAMC_INDEX_1_B)
+#define _PLANE_PRE_CSC_GAMC_INDEX_2(pipe)      _PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_2_A, \
+                                               _PLANE_PRE_CSC_GAMC_INDEX_2_B)
+#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)       \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))
+
+#define _PLANE_PRE_CSC_GAMC_DATA_1_A   0x704d4
+#define _PLANE_PRE_CSC_GAMC_DATA_1_B   0x714d4
+#define _PLANE_PRE_CSC_GAMC_DATA_2_A   0x705d4
+#define _PLANE_PRE_CSC_GAMC_DATA_2_B   0x715d4
+#define _PLANE_PRE_CSC_GAMC_DATA_1(pipe)       _PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_1_A, \
+                                               _PLANE_PRE_CSC_GAMC_DATA_1_B)
+#define _PLANE_PRE_CSC_GAMC_DATA_2(pipe)       _PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_2_A, \
+                                               _PLANE_PRE_CSC_GAMC_DATA_2_B)
+#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)        \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_DATA_2(pipe))
+
 #define _PLANE_CSC_RY_GY_1_A			0x70210
 #define _PLANE_CSC_RY_GY_2_A			0x70310
 #define _PLANE_CSC_RY_GY_1_B			0x71210
-- 
2.50.1

