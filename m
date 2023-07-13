Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97034751EFB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1413D10E682;
	Thu, 13 Jul 2023 10:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34AB10E679;
 Thu, 13 Jul 2023 10:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689244679; x=1720780679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4y42pTh9XibSH+4YiOHfWb5JVrl2VSe96evi/Hs1YUE=;
 b=P0JwSnyx+T5H9SlCHek4p++6j+HjMso2lYhMnj0lHefZnuXwIymB2YIR
 oCGYUEXoxY+bM6BiRlSfkA9u4gOji6tECQqwPtKFfXac7EMJ5eHVSiru2
 0sJfkXT4w6Vwd2QgT6uoAsO21GfL3a42Yn3RcGj9G3Q1br9zKPiPhsAVH
 kHIdpDlqMzpyJyj77UGlc18aG9GB7iZFWHUfKHgTvV1zbLjov9bmz/2P2
 9PRGqaqHJY2IUcOXd2JqDptLL4DHkn1ufnKwQ+WE898bl/+hpFTQw9R0Y
 1VF2g1dJrVDsG6DtkoknFU0NXFlAneb/OPeLjvkxmizTO8oCB662UE/Wz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428897614"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="428897614"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895965387"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="895965387"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 03:37:56 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/19] drm/display/dp: Fix the DP DSC Receiver cap size
Date: Thu, 13 Jul 2023 16:03:36 +0530
Message-Id: <20230713103346.1163315-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP DSC Receiver Capabilities are exposed via DPCD 60h-6Fh.
Fix the DSC RECEIVER CAP SIZE accordingly.

Fixes: ffddc4363c28 ("drm/dp: Add DP DSC DPCD receiver capability size define and missing SHIFT")
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: <stable@vger.kernel.org> # v5.0+

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 02f2ac4dd2df..e69cece404b3 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1537,7 +1537,7 @@ enum drm_dp_phy {
 
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
 #define DP_RECEIVER_CAP_SIZE		0xf
-#define DP_DSC_RECEIVER_CAP_SIZE        0xf
+#define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
 #define EDP_DISPLAY_CTL_CAP_SIZE	3
 #define DP_LTTPR_COMMON_CAP_SIZE	8
-- 
2.40.1

