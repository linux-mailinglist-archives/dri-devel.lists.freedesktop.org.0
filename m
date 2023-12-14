Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC27813CB1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 22:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1F910E2D4;
	Thu, 14 Dec 2023 21:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED3E10E304;
 Thu, 14 Dec 2023 21:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702589762; x=1734125762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NqfYZN78B3hVHP2Dit/8JqwIzCyrej/6W8WjTK/vVLc=;
 b=HsjZ+em7qAHw7pwjW1SefKS+4iY2erYc8i+U4UqJaWsUSdcJo8EwHMx7
 ftdBwK/8brw0VCdF4Hgj8o5SfmszEe/V00AaHqRZzRgFMZEpVdBTfHeL6
 x8iGrNa3UF/NV4+oATAiJ8rHXQRbAoy5AYomMnt9HTTwQEXcSZbZDpOAX
 +36+JxlwZh80ZT7lNo7NfPPoZ2grhTB2ectAH7kH0a+/TODANtpkDOL+A
 Qu8xznwrCzaQzslCkwBXACunmqCk9LLLwDkIWx2kLsPk49DPz+uOmJLdg
 oe4KqfAvck8ZabpC7w1HnD2/1jXxizLe+kbPzNU3HW2rn+llcIKn2yQmi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2010157"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="2010157"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="808730983"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="808730983"
Received: from kialmah1-desk5.jf.intel.com ([10.23.15.170])
 by orsmga001.jf.intel.com with ESMTP; 14 Dec 2023 13:35:56 -0800
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/display/dp: Update the name of bit#4 of DPCD TEST_REQUEST
Date: Thu, 14 Dec 2023 13:35:55 -0800
Message-Id: <20231214213555.3643327-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.34.1
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP_TEST_LINK_FAUX_PATTERN is deprecated since DP1.3 Spec.
Update to the latest definition in DP2.1 spec to reflect its true
usage in the code.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
 include/drm/display/drm_dp.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 98427d45e9a7..b7d16c1afb5a 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -664,7 +664,7 @@ static int dp_link_parse_request(struct dp_link_private *link)
 		return rlen;
 	}
 
-	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
+	if (!data || (data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {
 		drm_dbg_dp(link->drm_dev, "link 0x%x not supported\n", data);
 		goto end;
 	}
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 3731828825bd..3ccbc9eb9289 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -807,7 +807,7 @@
 # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
 # define DP_TEST_LINK_EDID_READ		    (1 << 2)
 # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >= 1.1 */
-# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >= 1.2 */
+# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4)
 # define DP_TEST_LINK_AUDIO_PATTERN         (1 << 5) /* DPCD >= 1.2 */
 # define DP_TEST_LINK_AUDIO_DISABLED_VIDEO  (1 << 6) /* DPCD >= 1.2 */
 
-- 
2.34.1

