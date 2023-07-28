Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E0C7662EF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 06:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7205F10E031;
	Fri, 28 Jul 2023 04:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F39D10E645;
 Fri, 28 Jul 2023 04:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690517740; x=1722053740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4y42pTh9XibSH+4YiOHfWb5JVrl2VSe96evi/Hs1YUE=;
 b=Y2VnxQNtrIs+Oo8OJzvvtLzK3fJghdt8/o9MYmhJDR7/12M5TdZQBUUk
 7ks7BKvjRSb2kLwAPDb2YUsbvZLS2lhyQg5r1qarej6QHAMsVyZTSwgHB
 z3tl/fcxeNK5zmlDGjJbRqhe7/uHF284FDDRnvjkkq2mvIwlm9qf7hp7d
 unOYuKxaXGZL5meOinCV6INtbFLOgKLykXOEpITn18Q6mNVFipeKQz0VJ
 aEBDv6d0ZDm7yM+d0oI/+nOKtP2DsetjIDWcuE0fs8Bo09V5JkoWRS7y6
 K3tyQmBb3JBTTyscboaiFTrslJ9+bUwmq9psEQWNhdYq1/reBCOaRuBHj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348104173"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="348104173"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797276306"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="797276306"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:15:37 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/20] drm/display/dp: Fix the DP DSC Receiver cap size
Date: Fri, 28 Jul 2023 09:41:38 +0530
Message-Id: <20230728041150.2524032-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
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

