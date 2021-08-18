Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DFE3F0AD7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 20:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CAF6E89C;
	Wed, 18 Aug 2021 18:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF656E89A;
 Wed, 18 Aug 2021 18:11:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216119736"
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="216119736"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 11:11:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="678671114"
Received: from jcarwana-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.249.42.192])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 11:11:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com,
 ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 03/17] drm/dp: add LTTPR DP 2.0 DPCD addresses
Date: Wed, 18 Aug 2021 21:10:38 +0300
Message-Id: <6c62971d1988721e06936a412533c124b6c90d4d.1629310010.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629310010.git.jani.nikula@intel.com>
References: <cover.1629310010.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

DP 2.0 brings some new DPCD addresses for PHY repeaters.

Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_dp_helper.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 1d5b3dbb6e56..f3a61341011d 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1319,6 +1319,10 @@ struct drm_panel;
 #define DP_MAX_LANE_COUNT_PHY_REPEATER			    0xf0004 /* 1.4a */
 #define DP_Repeater_FEC_CAPABILITY			    0xf0004 /* 1.4 */
 #define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT		    0xf0005 /* 1.4a */
+#define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER	    0xf0006 /* 2.0 */
+# define DP_PHY_REPEATER_128B132B_SUPPORTED		    (1 << 0)
+/* See DP_128B132B_SUPPORTED_LINK_RATES for values */
+#define DP_PHY_REPEATER_128B132B_RATES			    0xf0007 /* 2.0 */
 
 enum drm_dp_phy {
 	DP_PHY_DPRX,
-- 
2.20.1

