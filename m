Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8AC4ED012
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4D110EB4E;
	Wed, 30 Mar 2022 23:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43B010E20F;
 Wed, 30 Mar 2022 23:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682956; x=1680218956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y0k4BmlzYZnDbfVHpqqrKm1PCCqOWZmggF4shZRZItY=;
 b=W44yE+mv7Y/eHixAK04HnvmLuN2i6xiv7wcRn/1ge7juU2R213MWQETy
 7Ou04GtCUintxFjrw4T6UjU893Wzn8bDapgcK5NWM2I3QAiHRXTqo0FOe
 nxsh/t0aO+cChprV8YkS5/E4w7IrCwUy1SeRCPTgKES+C8hrMUrE+mtDh
 nCa33wJNuCN9sGjGrLmyceg9SBWhrvGpWhtLSLZh6rYX2TXEWf2b5isrk
 tE1+yNDHXAiBWFEUFJQLOzyEIGZcCbHu/Ce+eZoXqs+Gi2aR4mg7jrqT5
 BHKh79kLZZxByXMbbSqTvSR0cTQQs6feB+dDUkrtz9biqd6p/e/3hx4Jw g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582509"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582509"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547052003"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/15] drm/i915: Drop duplicated definition of
 XEHPSDV_FLAT_CCS_BASE_ADDR
Date: Wed, 30 Mar 2022 16:28:49 -0700
Message-Id: <20220330232858.3204283-7-matthew.d.roper@intel.com>
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

When this register was moved to intel_gt_regs.h it wasn't dropped from
i915_reg.h; do so now.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index efb81cb4c7c0..062e11289aa0 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8494,9 +8494,6 @@ enum skl_power_gate {
 #define XEHPSDV_TILE0_ADDR_RANGE	_MMIO(0x4900)
 #define   XEHPSDV_TILE_LMEM_RANGE_SHIFT  8
 
-#define XEHPSDV_FLAT_CCS_BASE_ADDR	_MMIO(0x4910)
-#define   XEHPSDV_CCS_BASE_SHIFT	8
-
 /* gamt regs */
 #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
 #define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
-- 
2.34.1

