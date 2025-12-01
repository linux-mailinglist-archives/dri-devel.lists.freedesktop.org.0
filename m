Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC52C95E04
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 07:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1256F10E2E6;
	Mon,  1 Dec 2025 06:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8vaEH5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98C810E2CE;
 Mon,  1 Dec 2025 06:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764570954; x=1796106954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U/+jFeIKDxodca8fqxKhMZQUpRYVCk4/fz/9S5ezuPs=;
 b=f8vaEH5MoBH1y8fcLhoCQTnO4TNaNvr7Duwla4Ja1LSsSQYNJ3di2OgT
 ho135SC7CMkAgkUL6tcdY5r8c1aSujOP49JO/TBhePTZNdKSbEuP5xgHS
 hALkAqfDfSf2BLLR7OlNFwwpsoFKSiFtEr6mLpeci/AeJbROPQ537zBlI
 5kwaSoMusVSkEdvYw8XN77tqd5fm7r1zDc+4FYucTdx1SKn0tw3J6Rvuc
 G3FXgGppZUlyXkSVFZES3YM7DSfixwiJu2tUMUi54zfzUpxEsEi8+EL8N
 bCwPTWmnOXfuyP5HEh1SeHBlrl0hVymxt0amuEd4Cf9LibQUe43t/7KZB Q==;
X-CSE-ConnectionGUID: y/dHPfbyTTGvzZnSQzIiRw==
X-CSE-MsgGUID: Qfs/FeMAQHaiD/W1vKMr4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66663220"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66663220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:35:54 -0800
X-CSE-ConnectionGUID: AHsWihZrT5+n8lDMTNX+Pg==
X-CSE-MsgGUID: 9hl2nqbsQw+5I7G9JVbdbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193806082"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 22:35:46 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v7 09/15] drm/i915: Add register definitions for Plane Post CSC
Date: Mon,  1 Dec 2025 12:16:49 +0530
Message-ID: <20251201064655.3579280-10-uma.shankar@intel.com>
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

Add macros to define Plane Post CSC registers

BSpec: 50403, 50404, 50405, 50406, 50409, 50410,

v2:
- Add Plane Post CSC Gamma Multi Segment Enable bit
- Add BSpec entries (Suraj)
v3:
- Fix checkpatch issues (Suraj)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../i915/display/skl_universal_plane_regs.h   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
index 1e5d7ef37f1c..6fd4da9f63cf 100644
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
@@ -293,6 +294,72 @@
 
 #define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i) * 4)
 
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A	0x70160
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B	0x71160
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A	0x70260
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B	0x71260
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A, \
+								      _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A, \
+								      _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \
+										 _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A	0x70164
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B	0x71164
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A	0x70264
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B	0x71264
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A, \
+							      _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A, \
+							      _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \
+										 _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A	0x701d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B	0x711d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A	0x702d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B	0x712d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A, \
+							      _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A, \
+							      _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \
+									 _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_A	0x701dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_B	0x711dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_A	0x702dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_B	0x712dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_1_A, \
+							      _PLANE_POST_CSC_GAMC_DATA_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_2_A, \
+							      _PLANE_POST_CSC_GAMC_DATA_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \
+									 _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_INDEX_1_A		0x704d8
+#define _PLANE_POST_CSC_GAMC_INDEX_1_B		0x714d8
+#define _PLANE_POST_CSC_GAMC_INDEX_2_A		0x705d8
+#define _PLANE_POST_CSC_GAMC_INDEX_2_B		0x715d8
+#define _PLANE_POST_CSC_GAMC_INDEX_1(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_1_A, \
+							      _PLANE_POST_CSC_GAMC_INDEX_1_B)
+#define _PLANE_POST_CSC_GAMC_INDEX_2(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_2_A, \
+							      _PLANE_POST_CSC_GAMC_INDEX_2_B)
+#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \
+									 _PLANE_POST_CSC_GAMC_INDEX_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_DATA_1_A		0x704dc
+#define _PLANE_POST_CSC_GAMC_DATA_1_B		0x714dc
+#define _PLANE_POST_CSC_GAMC_DATA_2_A		0x705dc
+#define _PLANE_POST_CSC_GAMC_DATA_2_B		0x715dc
+#define _PLANE_POST_CSC_GAMC_DATA_1(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_1_A, \
+							      _PLANE_POST_CSC_GAMC_DATA_1_B)
+#define _PLANE_POST_CSC_GAMC_DATA_2(pipe)		_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_2_A, \
+							      _PLANE_POST_CSC_GAMC_DATA_2_B)
+#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)	_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \
+									 _PLANE_POST_CSC_GAMC_DATA_2(pipe))
+
 #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A	0x701d0
 #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B	0x711d0
 #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A	0x702d0
-- 
2.50.1

