Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4920DA5D710
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B4F10E714;
	Wed, 12 Mar 2025 07:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkHPlG35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D40210E718;
 Wed, 12 Mar 2025 07:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763610; x=1773299610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OsfxXKjEO2bQjAy9ocFNSrb+q/d2ZfAJBARkSJideIw=;
 b=ZkHPlG35Jo/x0Pf9TdSYysRsnkJY82IgdyDyazX5kXQ8GWnB+EIgjyLh
 mZ6JFNeJ8eeuGYnn3KStbRgfe+xfkidUSmdxGaqSstTS+VljQqkGGdVo/
 saqnkJlaTvi9AKXDoesq3n0zTjNMmdbQQBGGyTBx5tST4kgZccmezINp6
 t3EMpFqgUQ0LIXkzHFgH6vQ1wkZbZewnBYFC2NLFm/INZHc7QA4+jLXx8
 HYFUG+ktnAsboVdwX5jtaeMDoQJ/ClMie6HJg8NHaG9vaf9P/uh280l4c
 9l5VRt/zZSHEORiXgOkndG4Ajwp8L6DFxoePnsZVeqoDH9euyTuj7wn/6 A==;
X-CSE-ConnectionGUID: XYXzmZO5T5Wso2HqRVzJKg==
X-CSE-MsgGUID: XEYgKEC8QWC9cnF/3eKyog==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288897"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:13:29 -0700
X-CSE-ConnectionGUID: gsoNnpz3Q26om8Ot5HOy2Q==
X-CSE-MsgGUID: aaLSpUSQQHKBECpKTevujA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120368106"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:13:26 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 19/23] drm/i915: Add register definitions for Plane Post CSC
Date: Wed, 12 Mar 2025 12:54:21 +0530
Message-ID: <20250312072425.3099205-20-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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

