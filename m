Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793704ED00D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B3910E2CC;
	Wed, 30 Mar 2022 23:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AE310E1DA;
 Wed, 30 Mar 2022 23:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682956; x=1680218956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4CKioz1nIqtT9z/Fnoz9GxI9qHvjE8umaNmIxyK94cI=;
 b=Yeud0zQhexVYCbQdGtiODXnwhqoRn3UGZMzv8VzeNZQmq889AhPONhLN
 wnvMOAHWMRAs2u7N9V8+rHz/9rflDfwEPc/Qeo191dsqXNFpQrnFYFBDF
 9VgMugQFIZrOTypCg/kd9ekP2YncU2bwqhGpu63ijzO2xRLZPEw2jOLdI
 c1mkdX5tIMcqw2xxqIor/JdWM0Vr4sULIDytx9esbiLNFrNvehQEoK9LJ
 yQSaPu4OwwDzAycika7EtuNabAkbEsn4Og9UcrMzjjrE2HiSheu754MLA
 RQhjdCuFdSZ3GP8rTF+KCUxja0wLI3EGbfO7bHaJ8SV03KhnYQ+/5BV7I Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582506"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582506"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547051994"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/15] drm/i915/gt: Drop a few unused register definitions
Date: Wed, 30 Mar 2022 16:28:46 -0700
Message-Id: <20220330232858.3204283-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330232858.3204283-1-matthew.d.roper@intel.com>
References: <20220330232858.3204283-1-matthew.d.roper@intel.com>
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
index e98e04b4a7a8..9e236397397f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -434,13 +434,6 @@
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
@@ -912,11 +905,6 @@
 #define GEN7_L3LOG(slice, i)			_MMIO(0xb070 + (slice) * 0x200 + (i) * 4)
 #define   GEN7_L3LOG_SIZE			0x80
 
-#define GEN10_SCRATCH_LNCF2			_MMIO(0xb0a0)
-#define   PMFLUSHDONE_LNICRSDROP		(1 << 20)
-#define   PMFLUSH_GAPL3UNBLOCK			(1 << 21)
-#define   PMFLUSHDONE_LNEBLK			(1 << 22)
-
 #define XEHP_L3NODEARBCFG			_MMIO(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
@@ -931,9 +919,6 @@
 #define   L3_HIGH_PRIO_CREDITS(x)		(((x) >> 1) << 14)
 #define   L3_PRIO_CREDITS_MASK			((0x1f << 19) | (0x1f << 14))
 
-#define GEN10_L3_CHICKEN_MODE_REGISTER		_MMIO(0xb114)
-#define   GEN11_I2M_WRITE_DISABLE		(1 << 28)
-
 #define GEN8_L3SQCREG4				_MMIO(0xb118)
 #define   GEN11_LQSC_CLEAN_EVICT_DISABLE	(1 << 6)
 #define   GEN8_LQSC_RO_PERF_DIS			(1 << 27)
@@ -1113,8 +1098,6 @@
 #define SARB_CHICKEN1				_MMIO(0xe90c)
 #define   COMP_CKN_IN				REG_GENMASK(30, 29)
 
-#define GEN7_HALF_SLICE_CHICKEN1_GT2		_MMIO(0xf100)
-
 #define GEN7_ROW_CHICKEN2_GT2			_MMIO(0xf4f4)
 #define   DOP_CLOCK_GATING_DISABLE		(1 << 0)
 #define   PUSH_CONSTANT_DEREF_DISABLE		(1 << 8)
-- 
2.34.1

