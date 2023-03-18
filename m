Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7596BFB0C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 16:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E3A10E05D;
	Sat, 18 Mar 2023 15:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E495010E05D;
 Sat, 18 Mar 2023 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679151599; x=1710687599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZrjphZd2frRuyBRNmwIyk01vbWYLEqVwTpQ2piO8TiA=;
 b=SdUheg8CZ9+y8aSToueWuxn+UibR0FJNbqBr4AG4AZJdvZQbWXuzOh6R
 8TCt6lgvNDB7r2HbarF6pMNqp+Ob6Zngl90GVqYbuAYpZhoPcAWI8T+03
 dDnSBVMwqmyNvgQ4/laPDLFx887k+eixYOT72gsvPRqqghua/FliHMQYw
 p8RvR7CKfRaSf4GbGOD4JlCBoGC9n6oFi4kwAAfco9ZshcyUJiixwA/ds
 q16UIkGj2AqTLwSZuWPDstAXSrEvhY8IQ2fIYtPpMaLpNHYEDo9pWeL7D
 +NNrBMD03IIgqoUWYdnSYo/kRh1ID2ZRen6mOzCEURPYrBKOGS4900e+S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326805045"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; d="scan'208";a="326805045"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2023 07:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="680600284"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; d="scan'208";a="680600284"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2023 07:59:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] Revert "drm/i915/hwmon: Enable PL1 power limit"
Date: Sat, 18 Mar 2023 07:59:52 -0700
Message-Id: <20230318145952.2829819-1-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit ee892ea83d99610fa33bea612de058e0955eec3a.

0349c41b0596 ("drm/i915/hwmon: Enable PL1 power limit") was reverted in
05d5562e401e ("Revert "drm/i915/hwmon: Enable PL1 power limit"") but has
appeared again as ee892ea83d99 ("drm/i915/hwmon: Enable PL1 power
limit"). Revert it again.

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

