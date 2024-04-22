Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771958AD1E6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 18:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0840112C59;
	Mon, 22 Apr 2024 16:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYNwGcOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376B0112C59;
 Mon, 22 Apr 2024 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713803338; x=1745339338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wZ/2/oyjSTOKxjDP7J7CQRzKasV07S7HKUDBvq/K1Lg=;
 b=SYNwGcOX2V4MovTTIhOhr7UCJuGhwyVczgw/cAhHCxbscPLSA03yZT6j
 CaTG8PBNJ3YWmhVgOuBQlNZhqMCXow5/fNDVCEbhBgSJD1cbRCYC1clyc
 Je52pmHdtmfKwjY97TRJ+OJ7uOfWWYxPlPKYMRgmAh6eq9r87IBXwkB+K
 NV0aBPvB906esc695cia21TeUH72Npq/4ORjqJM1C6cP9XCUajHVQ1c5A
 VtBxd9bmLliSwx6lfxYPzmR4av8JmML/zYOs4wcaDjoEG0x/+jMrTCf7W
 lGV9YFHeG7t3dDHMmIzcgDBuHqzvgsaGpE5O6XVOjnYH8PPdnsD0y4Xuo A==;
X-CSE-ConnectionGUID: gl53+043SvWNdxrE0RHDqA==
X-CSE-MsgGUID: QC27d9efS3u4IiHJNthBKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19959107"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="19959107"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 09:28:58 -0700
X-CSE-ConnectionGUID: Ea6s723yQ1yVzOTv4kGAOA==
X-CSE-MsgGUID: +LH2wVSoQYiLiSGPb8WfcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="28727253"
Received: from unknown (HELO intel.com) ([10.247.119.74])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 09:28:50 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [CI 2/2] drm/i915/gt: Force ccs_mode 4
Date: Mon, 22 Apr 2024 18:27:31 +0200
Message-ID: <20240422162731.7046-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422162731.7046-1-andi.shyti@linux.intel.com>
References: <20240422162731.7046-1-andi.shyti@linux.intel.com>
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

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index 044219c5960a..d0f181a8e73e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -10,29 +10,33 @@
 
 void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
+	unsigned long ccs_mask = CCS_MASK(gt);
 	int cslice;
 	u32 mode = 0;
-	int first_ccs = __ffs(CCS_MASK(gt));
+	int first_ccs = __ffs(ccs_mask);
 
 	if (!IS_DG2(gt->i915))
 		return;
 
 	/* Build the value for the fixed CCS load balancing */
 	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
-		if (CCS_MASK(gt) & BIT(cslice))
+		if (CCS_MASK(gt) & BIT(cslice)) {
 			/*
 			 * If available, assign the cslice
 			 * to the first available engine...
 			 */
 			mode |= XEHP_CCS_MODE_CSLICE(cslice, first_ccs);
-
-		else
+			first_ccs = find_next_bit(&ccs_mask,
+						  I915_MAX_CCS,
+						  first_ccs + 1);
+		} else {
 			/*
 			 * ... otherwise, mark the cslice as
 			 * unavailable if no CCS dispatches here
 			 */
 			mode |= XEHP_CCS_MODE_CSLICE(cslice,
 						     XEHP_CCS_MODE_CSLICE_MASK);
+		}
 	}
 
 	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);
-- 
2.43.0

