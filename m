Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9367227331
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 01:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB466E088;
	Mon, 20 Jul 2020 23:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146E06E088;
 Mon, 20 Jul 2020 23:41:31 +0000 (UTC)
IronPort-SDR: uUvqIuMszcn1utZn7J5XWh1ukdb7AMWL4zoNFAexF9S5PvBt11vliM2XG5GgKVBpFyjIl/zCTL
 7MXdudpgKn8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="234879842"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="234879842"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 16:41:30 -0700
IronPort-SDR: 5QIZmpKRMNGCAozwjCq0aV5yoY9SsyhMb6O3A6xAyGP8QkUlv6w6dMNUO2hPABuNgvTzX7QVp2
 KgopwxLgkj1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="283682965"
Received: from unknown (HELO kialmah1-mobl.jf.intel.com) ([10.241.228.98])
 by orsmga003.jf.intel.com with ESMTP; 20 Jul 2020 16:41:30 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dp: Add PHY_TEST_PATTERN CP2520 Pattern 2 and 3
Date: Mon, 20 Jul 2020 16:41:25 -0700
Message-Id: <20200720234126.11853-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: manasi.d.navare@intel.com, animesh.manna@intel.com,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing CP2520 pattern 2 and 3 phy compliance patterns

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 2 +-
 include/drm/drm_dp_helper.h     | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index a3c82e726057..d0fb78c6aca6 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1583,7 +1583,7 @@ int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
 			return err;
 
 		break;
-	case DP_PHY_TEST_PATTERN_CP2520:
+	case DP_PHY_TEST_PATTERN_CP2520_PAT1:
 		err = drm_dp_dpcd_read(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
 				       &data->hbr2_reset,
 				       sizeof(data->hbr2_reset));
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index e47dc22ebf50..65dd6cd71f1e 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -708,7 +708,9 @@
 # define DP_PHY_TEST_PATTERN_ERROR_COUNT    0x2
 # define DP_PHY_TEST_PATTERN_PRBS7          0x3
 # define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
-# define DP_PHY_TEST_PATTERN_CP2520         0x5
+# define DP_PHY_TEST_PATTERN_CP2520_PAT1	0x5
+# define DP_PHY_TEST_PATTERN_CP2520_PAT2	0x6
+# define DP_PHY_TEST_PATTERN_CP2520_PAT3	0x7
 
 #define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
 #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
