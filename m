Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4D5BD76C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 00:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3048010E19B;
	Mon, 19 Sep 2022 22:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F68D10E194;
 Mon, 19 Sep 2022 22:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663626788; x=1695162788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7QjUzmiUth4kqdi5YPtzSa58NcK9S0dbAyNHqbT6H1M=;
 b=G2Izx2R6RNKMKRLrolCObnjTqYqPm/Zrfc+emtiIFssHzZ7tzubekq4d
 MSs4UevEUF8/bb6JpKGi4Z13gfS7MUodFoPxL2wvOMx9BumMuYpOCr4au
 w4hHc+4GzdGd7G4F3/EwAH68EqOSf6Xe88oMeLEI5YpdzORKn8XksyytR
 M1DsWRRpRgQTlPXuox/hnHQOz/1YS6jPZcrModdQsUwgwsKv9hD/gTzQ3
 XCWotXiuH2L6NgK5+p8a4/Cud5GQ08e1KFTYwwCYEBUeVCOuvdscrMLIi
 L5tAMG4aAtLZZzD5Dhfi1wXF0c3TqohVJ3khDggFOUsekE8gp2HPtCD4+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="286585478"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="286585478"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="794030764"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/12] drm/i915/gt: Drop a few unused register definitions
Date: Mon, 19 Sep 2022 15:32:50 -0700
Message-Id: <20220919223259.263525-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919223259.263525-1-matthew.d.roper@intel.com>
References: <20220919223259.263525-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's drop a few register definitions that are unused anywhere in the
driver today.  Since the referenced offsets are part of what is now
considered a multicast register region, the current definitions would
not be correct for use on any future platform.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 559e3473f14c..53bedbd5ba0c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -450,13 +450,6 @@
 #define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
 #define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE	REG_BIT(9)
 
-/* GEN9 chicken */
-#define SLICE_ECO_CHICKEN0			_MMIO(0x7308)
-#define   PIXEL_MASK_CAMMING_DISABLE		(1 << 14)
-
-#define GEN9_SLICE_COMMON_ECO_CHICKEN0		_MMIO(0x7308)
-#define   DISABLE_PIXEL_MASK_CAMMING		(1 << 14)
-
 #define GEN9_SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
 #define XEHP_SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731c)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
@@ -963,11 +956,6 @@
 #define GEN7_L3LOG(slice, i)			_MMIO(0xb070 + (slice) * 0x200 + (i) * 4)
 #define   GEN7_L3LOG_SIZE			0x80
 
-#define GEN10_SCRATCH_LNCF2			_MMIO(0xb0a0)
-#define   PMFLUSHDONE_LNICRSDROP		(1 << 20)
-#define   PMFLUSH_GAPL3UNBLOCK			(1 << 21)
-#define   PMFLUSHDONE_LNEBLK			(1 << 22)
-
 #define XEHP_L3NODEARBCFG			_MMIO(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
@@ -982,9 +970,6 @@
 #define   L3_HIGH_PRIO_CREDITS(x)		(((x) >> 1) << 14)
 #define   L3_PRIO_CREDITS_MASK			((0x1f << 19) | (0x1f << 14))
 
-#define GEN10_L3_CHICKEN_MODE_REGISTER		_MMIO(0xb114)
-#define   GEN11_I2M_WRITE_DISABLE		(1 << 28)
-
 #define GEN8_L3SQCREG4				_MMIO(0xb118)
 #define   GEN11_LQSC_CLEAN_EVICT_DISABLE	(1 << 6)
 #define   GEN8_LQSC_RO_PERF_DIS			(1 << 27)
@@ -1179,8 +1164,6 @@
 #define SARB_CHICKEN1				_MMIO(0xe90c)
 #define   COMP_CKN_IN				REG_GENMASK(30, 29)
 
-#define GEN7_HALF_SLICE_CHICKEN1_GT2		_MMIO(0xf100)
-
 #define GEN7_ROW_CHICKEN2_GT2			_MMIO(0xf4f4)
 #define   DOP_CLOCK_GATING_DISABLE		(1 << 0)
 #define   PUSH_CONSTANT_DEREF_DISABLE		(1 << 8)
-- 
2.37.3

