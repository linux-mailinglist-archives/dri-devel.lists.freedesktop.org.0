Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69397FFF38
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 00:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B7810E244;
	Thu, 30 Nov 2023 23:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B2D10E328;
 Thu, 30 Nov 2023 23:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701386113; x=1732922113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ErtMadopJW5hKi3Y92MzIAX8qLaBI2oLVI9n11YeycI=;
 b=Q1dYdUnMn12xYTrJOHyaTXemxYcftBy7nGXBR1OByJcjooL+/tmbOE37
 2TDsfjmZTf47RDFrS02UpRd5Msp6YX287orU/v+JWnhWA8ixSFo0ymxiV
 +6KZ+v+4gEm1RQhszXWTwm7qQnyyLQkbWI6H01n/AEbZPba0GZhPLVlhs
 /WnPPECzBYZ+un8omZTFC0SlDbNfCQ7YGnqPmG+3vezLqPTJFUNRTNAvq
 yDj97Roa9ALrmlvtkLaIrZ6g9DQTmu3DQ0XPLr3Rh+GfQcFBKkH0NqRfe
 QgizFtS4TaQuoN6SD+xzrwy8pTzQHUbw4ate02blqSbckc4DlPGe0Cl6j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="12119157"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="12119157"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 15:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="17554104"
Received: from kialmah1-mobl1.jf.intel.com ([10.24.12.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 15:15:12 -0800
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/display/dp: Add the remaining Square PHY patterns DPCD
 register definitions
Date: Thu, 30 Nov 2023 15:15:10 -0800
Message-Id: <20231130231510.221143-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Lee Shawn C <shawn.c.lee@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP2.1 Specs added new DPCDs definitions for square pattern configs[1]
These new definitions are used for UHBR Source Transmitter
Equalizations tests[2]. Add the 3 new values for square pattern.

v2: rebase

[1]: DP2.1 Specs - 2.12.3.6.5 Square Pattern
[2]: DP2.1 PHY CTS specs - 4.3 UHBR Source Transmitter Equalization

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 include/drm/display/drm_dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 83d2039c018b..3731828825bd 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -651,6 +651,9 @@
 # define DP_LINK_QUAL_PATTERN_PRSBS31       0x38
 # define DP_LINK_QUAL_PATTERN_CUSTOM        0x40
 # define DP_LINK_QUAL_PATTERN_SQUARE        0x48
+# define DP_LINK_QUAL_PATTERN_SQUARE_PRESHOOT_DISABLED                   0x49
+# define DP_LINK_QUAL_PATTERN_SQUARE_DEEMPHASIS_DISABLED                 0x4a
+# define DP_LINK_QUAL_PATTERN_SQUARE_PRESHOOT_DEEMPHASIS_DISABLED        0x4b
 
 #define DP_TRAINING_LANE0_1_SET2	    0x10f
 #define DP_TRAINING_LANE2_3_SET2	    0x110
-- 
2.25.1

