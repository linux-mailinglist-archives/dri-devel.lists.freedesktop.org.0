Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BBB88A511
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55C010E949;
	Mon, 25 Mar 2024 14:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqCsRsuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B1C10E949;
 Mon, 25 Mar 2024 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711378011; x=1742914011;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rKU4Ry0hPHVWOhxoBoaPun3XDlFOG8bKjiKrBSaseRE=;
 b=LqCsRsuMQ1TYcq2Y8mOZxLERFhinRQHvpXbNcC9E5kt+ecRadCpAShju
 Jctyx+QuEPXOw/mV/11ERrkwvrxqzogeZpkwABCUfv77c1kf/Hr06WM/3
 Ref1H6FYEOQWXsll7fuo368Kh5Guz3bE4v/TwZL0KnsTgHQABI2qYDVLP
 3kn44ULwbChPCDU+V2VaLlDzMOLIFgVqBP6DLn97nxTXcOy7lTteQwn0f
 qvNnqBxgsa+h5BCS1mIUTAXIMk0dbK9Lmf0A2+uWOPwC5dEavjxYtLM49
 dTsfCoYgJc65nwpRT8XVWvKm5j/X1RQq3GZ9VxRCGE+CfipXlvXmPXMwQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6512274"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6512274"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="38746031"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:46:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/i915: Delete stray .rej file
Date: Mon, 25 Mar 2024 07:47:28 -0700
Message-ID: <20240325144728.537855-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

drivers/gpu/drm/i915/gt/intel_workarounds.c.rej was incorrectly added to
the tree after solving a conflict. Remove it.

Fixes: 326e30e4624c ("drm/i915: Drop dead code for pvc")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20240325083435.4f970eec@canb.auug.org.au
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../gpu/drm/i915/gt/intel_workarounds.c.rej    | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_workarounds.c.rej

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c.rej b/drivers/gpu/drm/i915/gt/intel_workarounds.c.rej
deleted file mode 100644
index 91463b1d684a..000000000000
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c.rej
+++ /dev/null
@@ -1,18 +0,0 @@
-diff a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c	(rejected hunks)
-@@ -2844,14 +2767,13 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
- 
- 	if (IS_GFX_GT_IP_STEP(gt, IP_VER(12, 70), STEP_A0, STEP_B0) ||
- 	    IS_GFX_GT_IP_STEP(gt, IP_VER(12, 71), STEP_A0, STEP_B0) ||
--	    IS_PONTEVECCHIO(i915) ||
- 	    IS_DG2(i915)) {
- 		/* Wa_22014226127 */
- 		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
- 	}
- 
--	if (IS_PONTEVECCHIO(i915) || IS_DG2(i915))
--		/* Wa_14015227452:dg2,pvc */
-+	if (IS_DG2(i915))
-+		/* Wa_14015227452 */
- 		wa_mcr_masked_en(wal, GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE);
- 
- 	if (IS_DG2(i915)) {
-- 
2.43.0

