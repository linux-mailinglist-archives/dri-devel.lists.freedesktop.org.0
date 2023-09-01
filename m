Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D1D78F8D2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 09:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D36410E724;
	Fri,  1 Sep 2023 07:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5859C10E724;
 Fri,  1 Sep 2023 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693551630; x=1725087630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VVpME9gZbktKYzW4oB1D8iH1dKOxV0E2Uzi24Q6P4E0=;
 b=O+r6j95wvljR3OkHcgNXF1gE4/YIdZuTW8bRkde/Hcc94cZTNw9/pIGt
 OldfdTFh8y4zaLt3xtu4q7PvFyhjci4tCMrgzwDU2TJWfdYIRoQOvmEgi
 shIWKF/MNwnEMPA7307VbfhSkeCNpRdpUX+sZeW25fsjbumvrOeXdfcWL
 MYa/2B1xV4ZPz7Twt1QnFHWaU0RsIT71cshRQ5wpxRNxZn7FQBNP8p9P5
 vq+RWonjIMjHD1E366llrX1dqL4z6qYgIltyJANxO/s8qHF3xQCb39ZN9
 H5AVBMhpn8yfOufBgjGlmbCVsHILEf3dME4wUdcM8KkCrKLSlJXmXbuNX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442546614"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="442546614"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 00:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="743011319"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="743011319"
Received: from jvdelosr-mobl3.amr.corp.intel.com (HELO kialmah1-mobl1.lan)
 ([10.251.8.145])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 00:00:26 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/display/dp: Add the remaining Square PHY patterns DPCD
 register definitions
Date: Fri,  1 Sep 2023 00:00:00 -0700
Message-Id: <20230901070000.56304-1-khaled.almahallawy@intel.com>
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

DP Scope may send requests for all Square PHY pattern configuration
during automation. Add them instead of failing these tests.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 include/drm/display/drm_dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index e69cece404b3..acabf29b4972 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -646,6 +646,9 @@
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

