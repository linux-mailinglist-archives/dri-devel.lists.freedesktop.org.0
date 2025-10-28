Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90FC1730A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 23:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC8110E68B;
	Tue, 28 Oct 2025 22:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHfMP+HE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E887710E68B;
 Tue, 28 Oct 2025 22:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761690501; x=1793226501;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1U7IsgaZYOwBYiBpfvQuR0EENvyUdxBUDwFMMENqgr4=;
 b=nHfMP+HE/mNtlXNrTbzbriMhH+HO6IMX/exZVEMae1BXHmY7oKoMPy0T
 6MnvJwYnxmMiJkaNTfycy/YE47bLKOvMAf9yKlmliyEifCIjn2lOKr45Z
 0TbPFmEZHWogmCf8a4w2sSs/Xh4ykl96ZnHx/g9Cuw5wKYUwYK8jqfZBS
 vIKnJKk9vZei8SJmNbQUjwLC3/C3Kqjfkfmx1Z9y9wyfifgpzetUfQz20
 3dNbFa7721QvYmCnwP35hG1/xbvfv8quGj8PLQmyxrzuuedekqRbYd0IZ
 zVxHK3M4S1KVylUoPyHW3xk2fYvrNqGN5bMbxEwhH/dc0Pnrij/YzXkUt w==;
X-CSE-ConnectionGUID: 6OLFpaCiTs29T2UHWkorCA==
X-CSE-MsgGUID: JDYasf+XSaCNs+e30AL8Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81225247"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="81225247"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 15:28:21 -0700
X-CSE-ConnectionGUID: Hnl0jUQ0SWG7T/tbLanHYQ==
X-CSE-MsgGUID: DBbikkIAQd+4EXrZ0JnOPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="184720613"
Received: from kialmah1-desk5.jf.intel.com ([10.23.33.174])
 by orviesa010.jf.intel.com with ESMTP; 28 Oct 2025 15:28:20 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to match
 DP2.1 spec
Date: Tue, 28 Oct 2025 15:28:17 -0700
Message-ID: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
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

The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3 spec.
Update its name to align with the DP 2.1 definition and reflect its
actual use in the code. No functional changes.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
 include/drm/display/drm_dp.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 66e1bbd80db3..5d465cf4dbc2 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -665,7 +665,7 @@ static int msm_dp_link_parse_request(struct msm_dp_link_private *link)
 		return rlen;
 	}
 
-	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
+	if (!data || (data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {
 		drm_dbg_dp(link->drm_dev, "link 0x%x not supported\n", data);
 		goto end;
 	}
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index e4eebabab975..610b8cbf1125 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -849,7 +849,7 @@
 # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
 # define DP_TEST_LINK_EDID_READ		    (1 << 2)
 # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >= 1.1 */
-# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >= 1.2 */
+# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4)
 # define DP_TEST_LINK_AUDIO_PATTERN         (1 << 5) /* DPCD >= 1.2 */
 # define DP_TEST_LINK_AUDIO_DISABLED_VIDEO  (1 << 6) /* DPCD >= 1.2 */
 
-- 
2.43.0

