Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C494A4FFFC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2BF10E7BC;
	Wed,  5 Mar 2025 13:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaEdQl/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D81510E7C3;
 Wed,  5 Mar 2025 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180518; x=1772716518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rXVSDTeSzlUT2Kg/Nzfk2OhgHOSFA/Hscv2dFo/7zFo=;
 b=YaEdQl/s2h3xa9Uoz3odlFxPHE1F5WIZ2SMvnq/bSHtNIF4Df4o+qC28
 GhLTIWtG4bQ/CkbeHosTnWAIISPuI0u4tL4067L+dwtVfSKNNsp/cjERa
 66O0B0cdtslF3QmulJbJRJeolcMEp0VTq4QKLYQ/fjNvhkoHVXNgyIDHj
 0eH0J/K4m+BL942g8hGebkmQCaVh7cHFZACiPI85emEfn8R8Sxm/WQQWh
 48ZuhVIyh7u62mom4lj4zzzxL22JGNfRbSQw0GRBqjdsvh3XJb8sTJ0e/
 PYJI5p1QIfOHpeJAuxsltGgsm113QGadgGtnMvZTa9qE0J84IUTQ0fiL3 g==;
X-CSE-ConnectionGUID: 2y+uS70CTE6+NDz3RFtLZw==
X-CSE-MsgGUID: JKtzFNZZSUCjE4z5RH0mOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685589"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685589"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:15:17 -0800
X-CSE-ConnectionGUID: dAf/Ard1QhWLBDqbL57GJg==
X-CSE-MsgGUID: +15t5SrhQoSFWru0y4D8ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701224"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:15:13 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org, Uma Shankar <uma.shankar@intel.com>
Subject: [v3 17/23] drm/i915: Add register definitions for Plane Degamma
Date: Wed,  5 Mar 2025 18:56:02 +0530
Message-ID: <20250305132608.2379253-18-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../i915/display/skl_universal_plane_regs.h   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
index ca9fdfbbe57c..2cad4ee9fe04 100644
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
2.42.0

