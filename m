Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B50F61379B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 14:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3FF10E2BB;
	Mon, 31 Oct 2022 13:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419A110E294;
 Mon, 31 Oct 2022 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667222089; x=1698758089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bOYyvu37r93/EG7L+GbiMD7vVm7Z4A8ySPIgr3cIehM=;
 b=iXVTGEwlG/yzF/eSELzzIcpTC1vnwScWE0hLsG5ujvJCiDSNV0VhOaHs
 VhlGb7emuHgibblVYkVhsaPxYz/kjayqxsifIje43Tf6axO3y6p39Bl95
 SdsJ9tteopjWN6wfxHakx1xt0fcB5PX0rj34XtmMIkHMIifvxsvVCUMoj
 dsfKAp2fXSKIQHvrzf/+68cWI8fZdyz2v6brYvHBjIiHCJfQOF5W3C7wk
 S3NkVRS9vHT0Sjmm1QZ1FounntHo1teCuy95TOgfgsbcEatvamxgFcAm8
 flMkEDgDa0+F7VkJBrTaEswoMZrOyJ6XZnmJQUgLhQOmx4Vvj02Mt+bsY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="292186873"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="292186873"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 06:14:48 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="808548703"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="808548703"
Received: from wboyer-ubuntu01.jf.intel.com ([10.54.75.13])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 06:14:48 -0700
From: Wayne Boyer <wayne.boyer@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/dg2: Introduce Wa_18017747507
Date: Mon, 31 Oct 2022 06:15:09 -0700
Message-Id: <20221031131509.3411195-1-wayne.boyer@intel.com>
X-Mailer: git-send-email 2.37.3
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

WA 18017747507 applies to all DG2 skus.

BSpec: 56035, 46121, 68173

Signed-off-by: Wayne Boyer <wayne.boyer@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 3 +++
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index f4624262dc81..27b2641e1a53 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -501,6 +501,9 @@
 #define VF_PREEMPTION				_MMIO(0x83a4)
 #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
 
+#define VFG_PREEMPTION_CHICKEN			_MMIO(0x83b4)
+#define  POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
+
 #define GEN8_RC6_CTX_INFO			_MMIO(0x8504)
 
 #define XEHP_SQCM				MCR_REG(0x8724)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 2a35e7e66625..3cdf5c24dbc5 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2975,6 +2975,9 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		 * Wa_22015475538:dg2
 		 */
 		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8);
+
+		/* Wa_18017747507:dg2 */
+		wa_masked_en(wal, VFG_PREEMPTION_CHICKEN, POLYGON_TRIFAN_LINELOOP_DISABLE);
 	}
 }
 
-- 
2.37.3

