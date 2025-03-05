Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D98EA50001
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8795910E7D0;
	Wed,  5 Mar 2025 13:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dze0Cyvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486A910E7CB;
 Wed,  5 Mar 2025 13:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180527; x=1772716527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OsfxXKjEO2bQjAy9ocFNSrb+q/d2ZfAJBARkSJideIw=;
 b=Dze0CyvncIge3m+6+8dWlqTurpXyBWVdjSCeYJw8v4BZvEO6muoocOX4
 WDx40MyEEdI7L0N+t5oOBD9mWEqULQgpb8SwhHfIWgX9ajataHGuk42mP
 RnyeN8+uQT/qczB/KPFw29QuMtxlVKmvEM+r3vjUwj5wlNFw0VHfU2J2n
 WycA/WB6NujsOd4hTJMJ61/siXhl1s3z6riZwcnwm2P34is68IOxGZbFs
 Ns5QleZLVFSVtS82QzgFvQ4RI9cP446EFYsloazrWEMExnqi8d4AkNuWA
 Wd+SacFNg4e4X2Mjkj/Vqm6xa+LUembnTCF51RoA+ot6XhAKjZBugAX9F Q==;
X-CSE-ConnectionGUID: gHY8GfOjSWuqHD9pEOREnA==
X-CSE-MsgGUID: fBoKV07jQdWkSU7msTZ/yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685616"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685616"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:15:27 -0800
X-CSE-ConnectionGUID: BmhOV3luS9+URYCx6csE0Q==
X-CSE-MsgGUID: 0JDut/dITNKv38kx8/5fDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701239"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:15:23 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org, Uma Shankar <uma.shankar@intel.com>
Subject: [v3 19/23] drm/i915: Add register definitions for Plane Post CSC
Date: Wed,  5 Mar 2025 18:56:04 +0530
Message-ID: <20250305132608.2379253-20-uma.shankar@intel.com>
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

Add macros to define Plane Post CSC registers

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../i915/display/skl_universal_plane_regs.h   | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
index 2cad4ee9fe04..f164a978686e 100644
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

