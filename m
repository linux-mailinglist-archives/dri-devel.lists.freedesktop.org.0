Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5F3C95DEC
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 07:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBB410E2B8;
	Mon,  1 Dec 2025 06:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="As6kYyou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DCC10E2A4;
 Mon,  1 Dec 2025 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764570952; x=1796106952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3gdXOayDHwIHIvAhnvbsgMs+GZYcMAnk85vDK7yWhg=;
 b=As6kYyou7mkhOpgf+MmyRfhZ8kLEEeBv6BBUWHMx89glnqX2esIJ4KhA
 LaRLnvRGEAAOdhaZrBoJslmNSmxFE3JApn17DzQJBOcR9UzjK92AvG4Wr
 1Q6DrVx+Y+xQ/xoRGrfTlA+ae1DJr4iqACUCbnKUG1mcM8KZ1EB6R2yAL
 oUGQH2d/GakfUQ8dVt95MHNeBeeromZC6kZsFq5erJtn4HedkxBx2gjaa
 Y3EB7up88TB+zPk5HXmyuwQ4E8S08tOeVJcCErWqS3SU05JUQGq6w89VO
 hde6Hl2xXIyqcQQzZukCLYCwWpLV7T98XJNw28Ps1cBFHWsDvEm+RFDkB w==;
X-CSE-ConnectionGUID: 9qkdeJ0qQHWVBnaCx0219Q==
X-CSE-MsgGUID: xfzlmMaZTM+DzjGbVtgnGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66663206"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66663206"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:35:52 -0800
X-CSE-ConnectionGUID: 2YmfRk8BQ7WLThCP936oRw==
X-CSE-MsgGUID: BqehxuSqR82B3ggeSRC4bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193806073"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 22:35:41 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v7 08/15] drm/i915: Add register definitions for Plane Degamma
Date: Mon,  1 Dec 2025 12:16:48 +0530
Message-ID: <20251201064655.3579280-9-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251201064655.3579280-1-uma.shankar@intel.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
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

v2:
 - Add BSpec links (Suraj)
v3:
 - Add Bspec links in trailer (Suraj)
 - Fix checkpatch issues (Suraj)

BSpec: 50411, 50412, 50413, 50414
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../i915/display/skl_universal_plane_regs.h   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
index 6f815b231340..1e5d7ef37f1c 100644
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
@@ -290,6 +291,53 @@
 									   _PLANE_INPUT_CSC_POSTOFF_HI_1_A, _PLANE_INPUT_CSC_POSTOFF_HI_1_B, \
 									   _PLANE_INPUT_CSC_POSTOFF_HI_2_A, _PLANE_INPUT_CSC_POSTOFF_HI_2_B)
 
+#define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i) * 4)
+
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A	0x701d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B	0x711d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A	0x702d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B	0x712d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A, \
+							      _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A, \
+							      _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B)
+#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
+									 _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))
+#define  PLANE_PAL_PREC_AUTO_INCREMENT          REG_BIT(10)
+
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A	0x701d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B	0x711d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A	0x702d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B	0x712d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A, \
+							      _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B)
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A, \
+							      _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B)
+#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \
+									 _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))
+
+#define _PLANE_PRE_CSC_GAMC_INDEX_1_A		0x704d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_1_B		0x714d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_2_A		0x705d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_2_B		0x715d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_1(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_1_A, \
+							      _PLANE_PRE_CSC_GAMC_INDEX_1_B)
+#define _PLANE_PRE_CSC_GAMC_INDEX_2(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_2_A, \
+							      _PLANE_PRE_CSC_GAMC_INDEX_2_B)
+#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \
+									 _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))
+
+#define _PLANE_PRE_CSC_GAMC_DATA_1_A		0x704d4
+#define _PLANE_PRE_CSC_GAMC_DATA_1_B		0x714d4
+#define _PLANE_PRE_CSC_GAMC_DATA_2_A		0x705d4
+#define _PLANE_PRE_CSC_GAMC_DATA_2_B		0x715d4
+#define _PLANE_PRE_CSC_GAMC_DATA_1(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_1_A, \
+							      _PLANE_PRE_CSC_GAMC_DATA_1_B)
+#define _PLANE_PRE_CSC_GAMC_DATA_2(pipe)		_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_2_A, \
+							      _PLANE_PRE_CSC_GAMC_DATA_2_B)
+#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
+									 _PLANE_PRE_CSC_GAMC_DATA_2(pipe))
+
 #define _PLANE_CSC_RY_GY_1_A			0x70210
 #define _PLANE_CSC_RY_GY_2_A			0x70310
 #define _PLANE_CSC_RY_GY_1_B			0x71210
-- 
2.50.1

