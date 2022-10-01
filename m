Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA4F5F1785
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 02:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B96610E49A;
	Sat,  1 Oct 2022 00:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666BE10E49A;
 Sat,  1 Oct 2022 00:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664585183; x=1696121183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ETFBzxia7PYQiQmClNGw3g/LnwleYkSloKnVrQYIFGo=;
 b=RGLiTsP7XHyHy51yHHBBGTuNp9v/09Bfo2NFFHSnu39jCVsYv7u4iWGc
 0qquuKkSIu3FT1ipeMv9yqKa8DhMV3HfCW8jrQ4QmzNGryxIZEqMT2XUD
 cc47cTFpltHmQJhENraywx+1iqbQsT3i95G5Vf6Yy1H+zhK7GkusssaNP
 BxIgxtzpkUfFGdviRmhjbzDYPDUezVDp07OSI9v1wvZpTNmkY8qATPLx4
 i3bUxMv1oHnTN7DRLAgin7LMyjWTYxMWCAU2cNQDynBpEawMjmLbWbVhl
 w0nJEF3B4nQK9cBouweTp86V1XK2DvfpdYMPLl1/jDaMSsBKSM0cM2W7c Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="388607929"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="388607929"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="685477619"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="685477619"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 03/14] drm/i915/gt: Drop a few unused register definitions
Date: Fri, 30 Sep 2022 17:45:39 -0700
Message-Id: <20221001004550.3031431-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001004550.3031431-1-matthew.d.roper@intel.com>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
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
Cc: ravi.kumar.vodapalli@intel.com, balasubramani.vivekanandan@intel.com,
 dri-devel@lists.freedesktop.org
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
index 68f45a748712..3a50e8e966aa 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -454,13 +454,6 @@
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
@@ -967,11 +960,6 @@
 #define GEN7_L3LOG(slice, i)			_MMIO(0xb070 + (slice) * 0x200 + (i) * 4)
 #define   GEN7_L3LOG_SIZE			0x80
 
-#define GEN10_SCRATCH_LNCF2			_MMIO(0xb0a0)
-#define   PMFLUSHDONE_LNICRSDROP		(1 << 20)
-#define   PMFLUSH_GAPL3UNBLOCK			(1 << 21)
-#define   PMFLUSHDONE_LNEBLK			(1 << 22)
-
 #define XEHP_L3NODEARBCFG			_MMIO(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
@@ -986,9 +974,6 @@
 #define   L3_HIGH_PRIO_CREDITS(x)		(((x) >> 1) << 14)
 #define   L3_PRIO_CREDITS_MASK			((0x1f << 19) | (0x1f << 14))
 
-#define GEN10_L3_CHICKEN_MODE_REGISTER		_MMIO(0xb114)
-#define   GEN11_I2M_WRITE_DISABLE		(1 << 28)
-
 #define GEN8_L3SQCREG4				_MMIO(0xb118)
 #define   GEN11_LQSC_CLEAN_EVICT_DISABLE	(1 << 6)
 #define   GEN8_LQSC_RO_PERF_DIS			(1 << 27)
@@ -1191,8 +1176,6 @@
 #define SARB_CHICKEN1				_MMIO(0xe90c)
 #define   COMP_CKN_IN				REG_GENMASK(30, 29)
 
-#define GEN7_HALF_SLICE_CHICKEN1_GT2		_MMIO(0xf100)
-
 #define GEN7_ROW_CHICKEN2_GT2			_MMIO(0xf4f4)
 #define   DOP_CLOCK_GATING_DISABLE		(1 << 0)
 #define   PUSH_CONSTANT_DEREF_DISABLE		(1 << 8)
-- 
2.37.3

