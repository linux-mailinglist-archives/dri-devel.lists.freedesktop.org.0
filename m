Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCA5C359CE
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D9910E732;
	Wed,  5 Nov 2025 12:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iv3A4DiR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5949510E730;
 Wed,  5 Nov 2025 12:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345393; x=1793881393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P/wVIi6FoLycOHhzdb28HEAeNKqt9Owz0v9Vj3yZQco=;
 b=Iv3A4DiRJM8yrnvPBCOOT2KnnwbFVm73ezvD/a4DHdtr+j+rpUdBw1yv
 tdCOG8ppNALD5O+KQbFCs/ERlngqLyEB+o+Q3H1Mq1JkohPZ9C6A4CAGj
 E/PwjFu8XhAkzpQV+vBjR7nlMtCAiU/u1G9sv2tJpUPA1CQJJkPNBAekY
 S/WPebBVH20lThJtM7NmOKG5gRCFPuR9xOgX3vvgH+uuJf0ZI4vL0JUXi
 Prx25/Uly8fjTb+9DFYBwMZooJzxNNAMBOj6nH5fqJvihOUTt0NAbmDut
 Q9dJm53AzmoOd5F48WAq482n/J9EOMHvjgS2ETL7Tmy6DytMaWktDUqja g==;
X-CSE-ConnectionGUID: u9yIYzhMSJ+4RW0Ya9Bo4A==
X-CSE-MsgGUID: cwA6ijDmSPGvBrHHe3RsAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64364081"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64364081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:23:12 -0800
X-CSE-ConnectionGUID: hiRLarFYSvKByepmJz3MWg==
X-CSE-MsgGUID: dCaWMKCsTca4FfwnF9ULwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740310"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:23:07 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 11/16] drm/i915: Add register definitions for Plane Post CSC
Date: Wed,  5 Nov 2025 18:04:07 +0530
Message-ID: <20251105123413.2671075-12-uma.shankar@intel.com>
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

Add macros to define Plane Post CSC registers

BSpec: 50403, 50404, 50405, 50406, 50409, 50410,

v2:
- Add Plane Post CSC Gamma Multi Segment Enable bit
- Add BSpec entries (Suraj)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../i915/display/skl_universal_plane_regs.h   | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
index b3fbe1e20dfe..4d71d07e90ff 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
@@ -254,6 +254,7 @@
 #define   PLANE_COLOR_PIPE_CSC_ENABLE			REG_BIT(23) /* Pre-ICL */
 #define   PLANE_COLOR_PLANE_CSC_ENABLE			REG_BIT(21) /* ICL+ */
 #define   PLANE_COLOR_INPUT_CSC_ENABLE			REG_BIT(20) /* ICL+ */
+#define   PLANE_COLOR_POST_CSC_GAMMA_MULTSEG_ENABLE	REG_BIT(15) /* TGL+ */
 #define   PLANE_COLOR_PRE_CSC_GAMMA_ENABLE		REG_BIT(14)
 #define   PLANE_COLOR_CSC_MODE_MASK			REG_GENMASK(19, 17)
 #define   PLANE_COLOR_CSC_MODE_BYPASS			REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 0)
@@ -293,6 +294,79 @@
 
 #define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i) * 4)
 
+/* Display13 Plane Gamma Reg */
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A        0x70160
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B        0x71160
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A        0x70260
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B        0x71260
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe)    _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A, \
+                                                       _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe)    _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A, \
+                                                       _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)     \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A 0x70164
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B 0x71164
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A 0x70264
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B 0x71264
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe)     _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A, \
+                                                       _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe)     _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A, \
+                                                       _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)      \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A     0x701d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B     0x711d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A     0x702d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B     0x712d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe) _PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A, \
+                                               _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe) _PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A, \
+                                               _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)  \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_A      0x701dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_B      0x711dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_A      0x702dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_B      0x712dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe)  _PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_1_A, \
+                                               _PLANE_POST_CSC_GAMC_DATA_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe)  _PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_2_A, \
+                                               _PLANE_POST_CSC_GAMC_DATA_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)   \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_INDEX_1_A 0x704d8
+#define _PLANE_POST_CSC_GAMC_INDEX_1_B 0x714d8
+#define _PLANE_POST_CSC_GAMC_INDEX_2_A 0x705d8
+#define _PLANE_POST_CSC_GAMC_INDEX_2_B 0x715d8
+#define _PLANE_POST_CSC_GAMC_INDEX_1(pipe)     _PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_1_A, \
+                                               _PLANE_POST_CSC_GAMC_INDEX_1_B)
+#define _PLANE_POST_CSC_GAMC_INDEX_2(pipe)     _PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_2_A, \
+                                               _PLANE_POST_CSC_GAMC_INDEX_2_B)
+#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)      \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \
+               _PLANE_POST_CSC_GAMC_INDEX_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_DATA_1_A  0x704dc
+#define _PLANE_POST_CSC_GAMC_DATA_1_B  0x714dc
+#define _PLANE_POST_CSC_GAMC_DATA_2_A  0x705dc
+#define _PLANE_POST_CSC_GAMC_DATA_2_B  0x715dc
+#define _PLANE_POST_CSC_GAMC_DATA_1(pipe)      _PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_1_A, \
+                                               _PLANE_POST_CSC_GAMC_DATA_1_B)
+#define _PLANE_POST_CSC_GAMC_DATA_2(pipe)      _PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_2_A, \
+                                               _PLANE_POST_CSC_GAMC_DATA_2_B)
+#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)       \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \
+               _PLANE_POST_CSC_GAMC_DATA_2(pipe))
+
 /* Display13 Plane Degmma Reg */
 #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A      0x701d0
 #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B      0x711d0
-- 
2.50.1

