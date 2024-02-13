Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473985294E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5434110E9D9;
	Tue, 13 Feb 2024 06:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8Xi/LWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9BA10E9D9;
 Tue, 13 Feb 2024 06:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806586; x=1739342586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HMVSK0o4h43GR5qaYRhC3Gh+Go0+4ik69CGEAqecgDA=;
 b=f8Xi/LWJy+Xx5FyEJarywyPAn1V1mmq4vgKfgSgQTMGvoTqcBTpONCxN
 P1g9AHh8nZxQbCZbM0659gXuG6RtI0d4iwJbzlN7RAqL0o/RiscFhMu3C
 u3hTpeY//eclWjapuHM0Sbkspx9ALcZ27iYAtsiQoPYygWvzMNoa56P/O
 rQaJJcFKSentzFhgr/HUxDmpSqfx84gdm5UlTYYb+quPbpEfOVsA5kLWP
 KT+T+bQqEYdMOkI4xEfBu/dMH66N0+3j3SE+ydGm9Cs1rEbIUCFuPKbUE
 bXWqbVuUOj+t+GtHuCw+5oASbJH5d/JeUhx/NU1JC+dAn2zurBwsMQx2K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948213"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948213"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:43:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450630"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:42:59 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 22/28] drm/i915: Add register definitions for Plane Degamma
Date: Tue, 13 Feb 2024 12:18:29 +0530
Message-ID: <20240213064835.139464-23-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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
 drivers/gpu/drm/i915/i915_reg.h | 51 +++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e00557e1a57f..633c0d0cb8f4 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -3732,6 +3732,7 @@
 #define   PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709		REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 2)
 #define   PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020	REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 3)
 #define   PLANE_COLOR_CSC_MODE_RGB709_TO_RGB2020	REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 4)
+#define   PLANE_COLOR_PRE_CSC_GAMMA_ENABLE		REG_BIT(14)
 #define   PLANE_COLOR_PLANE_GAMMA_DISABLE		REG_BIT(13)
 #define   PLANE_COLOR_ALPHA_MASK			REG_GENMASK(5, 4)
 #define   PLANE_COLOR_ALPHA_DISABLE			REG_FIELD_PREP(PLANE_COLOR_ALPHA_MASK, 0)
@@ -6243,6 +6244,56 @@ enum skl_power_gate {
 
 #define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i) * 4)
 
+/* Display13 Plane Degmma Reg */
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A	0x701d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B	0x711d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A	0x702d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B	0x712d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A, \
+						_PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A, \
+						_PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B)
+#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
+		_PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))
+#define	 PLANE_PAL_PREC_AUTO_INCREMENT		REG_BIT(10)
+
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A	0x701d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B	0x711d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A	0x702d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B	0x712d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A, \
+						_PLANE_PRE_CSC_GAMC_DATA_ENH_1_B)
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A, \
+						_PLANE_PRE_CSC_GAMC_DATA_ENH_2_B)
+#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \
+		_PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))
+
+#define _PLANE_PRE_CSC_GAMC_INDEX_1_A	0x704d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_1_B	0x714d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_2_A	0x705d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_2_B	0x715d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_1(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_1_A, \
+						_PLANE_PRE_CSC_GAMC_INDEX_1_B)
+#define _PLANE_PRE_CSC_GAMC_INDEX_2(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_2_A, \
+						_PLANE_PRE_CSC_GAMC_INDEX_2_B)
+#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \
+		_PLANE_PRE_CSC_GAMC_INDEX_2(pipe))
+
+#define _PLANE_PRE_CSC_GAMC_DATA_1_A	0x704d4
+#define _PLANE_PRE_CSC_GAMC_DATA_1_B	0x714d4
+#define _PLANE_PRE_CSC_GAMC_DATA_2_A	0x705d4
+#define _PLANE_PRE_CSC_GAMC_DATA_2_B	0x715d4
+#define _PLANE_PRE_CSC_GAMC_DATA_1(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_1_A, \
+						_PLANE_PRE_CSC_GAMC_DATA_1_B)
+#define _PLANE_PRE_CSC_GAMC_DATA_2(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_2_A, \
+						_PLANE_PRE_CSC_GAMC_DATA_2_B)
+#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
+		_PLANE_PRE_CSC_GAMC_DATA_2(pipe))
+
 /* Plane CSC Registers */
 #define _PLANE_CSC_RY_GY_1_A	0x70210
 #define _PLANE_CSC_RY_GY_2_A	0x70310
-- 
2.42.0

