Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E06C023A
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 15:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF25010E48A;
	Sun, 19 Mar 2023 14:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DEE10E48A;
 Sun, 19 Mar 2023 14:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679234585; x=1710770585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kam5KnEwSr8wv6TKx5GlijRY5Fj7Idrg7iQSml4/RDs=;
 b=IeKrAxvR3OQSdq0gqjqOY+JBTjlTddWyxIg5CvcSNYcrv9bYMgAK9kQn
 hjEflvO+o1Sa0C1MIiDW2w75+PB/y7p+2EJhBxHjeeESaisazgx7sytdK
 MM/dzEL7zTvsrS5Y3K5GRy89gnoccFGdSRNutgxOoy0csoAzyVDTnA+xa
 m5Va8HGeh1DhURVATXAQTZNzVXgLNYNYL6GJSDKKMWjv6SU4xQSlofnps
 q3e6PGh61GrujhiRsfaNZUk80kfVShpYLNIcu/UDhHY3jkN8cEVSOu1wD
 7Y52uMJicaP/RY0Fd7qwX6Sh8crGTevIfju4mTSe1wKRhtu1KevBimb/P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="318911018"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; d="scan'208";a="318911018"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 07:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="926701886"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; d="scan'208";a="926701886"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 07:03:04 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] Revert "drm/i915/hwmon: Enable PL1 power limit"
Date: Sun, 19 Mar 2023 07:03:00 -0700
Message-Id: <20230319140300.2892032-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit ee892ea83d99610fa33bea612de058e0955eec3a.

0349c41b0596 ("drm/i915/hwmon: Enable PL1 power limit") was reverted in
05d5562e401e ("Revert "drm/i915/hwmon: Enable PL1 power limit"") but has
appeared again as ee892ea83d99 ("drm/i915/hwmon: Enable PL1 power
limit"). Revert it again.

Cc: <stable@vger.kernel.org> # v6.2+
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
Fixes: ee892ea83d99 ("drm/i915/hwmon: Enable PL1 power limit")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index ee63a8fd88fc1..596dd2c070106 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -688,11 +688,6 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 		for_each_gt(gt, i915, i)
 			hwm_energy(&hwmon->ddat_gt[i], &energy);
 	}
-
-	/* Enable PL1 power limit */
-	if (i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
-		hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
-						    PKG_PWR_LIM_1_EN, PKG_PWR_LIM_1_EN);
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
-- 
2.38.0

