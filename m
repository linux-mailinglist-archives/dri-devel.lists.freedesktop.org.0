Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293219D9861
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B4810E8B5;
	Tue, 26 Nov 2024 13:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipnqsMlv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E024810E8AB;
 Tue, 26 Nov 2024 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627252; x=1764163252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d7sOV1eolZ1+RyWo0uyl09i92tNZcKSvDZkCVGqhmNw=;
 b=ipnqsMlv1fR8uEhWn8dV+p/oKsmb8gEaURQKTuqEQPmfD8pMO3Soq7C5
 IhTXatH42tYZKQ4o0LotFdWF0IZzIE1UXcYUIYsEYGYokq082usnLW62f
 OoxLklLY0Okg0dQ8oetKGWxiRfPj+f7CvIqzJlrvLY8YoC8+WwrN86jhc
 uNcswY3yHo4OZ5iXq+ShnO+Pvxk61zKyBgvapZvggp+fOHpwCSt9Qkng2
 6pTMLKKqgt4FPyYTf1FuLzwDLdwK0cKVo3q4j8t/0upNBq6b5++59zkAf
 +olsbIvB+/Pp8hBMfK2vaE9bOHfr7cHoo//V5BWqW0aMTVnfLJS01VzQL A==;
X-CSE-ConnectionGUID: vSErAJ/wS1WNAolLxS2GEA==
X-CSE-MsgGUID: 4zrqka0dQj+Zv+QlYuF3xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170411"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170411"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:51 -0800
X-CSE-ConnectionGUID: gRKKFf1AT/CeJVaWM3EVow==
X-CSE-MsgGUID: ajn4Bz/ZRO+Lp/ECB4dFOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114875034"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:47 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 21/25] drm/i915: Add register definitions for Plane Post CSC
Date: Tue, 26 Nov 2024 18:57:26 +0530
Message-ID: <20241126132730.1192571-22-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../i915/display/skl_universal_plane_regs.h   | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
index 8625914a9614..5e2a40f7d919 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
@@ -293,6 +293,79 @@
 
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
2.42.0

