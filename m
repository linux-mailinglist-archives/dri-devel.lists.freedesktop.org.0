Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB1ABF362
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 13:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B0211B514;
	Wed, 21 May 2025 11:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ak7/vbT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6576011B509;
 Wed, 21 May 2025 11:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747828423; x=1779364423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OhqRvD8q7Nd61j5ob935nDmj34VM/s1Vuh09kx8HahU=;
 b=Ak7/vbT8a2YjoDvuVCQXzeyEa/lNR6LMg+6osmuzVR77NRuAQvZxg6vz
 85/BanlEHOVTsnudxum4pxgcMSywt/IxQHSz6/iKxgX+FDtLMkVXGQJa7
 KctXMLiuXW/Sm74fRJzs+Da5N9T1T9q87VVwK8ZJLhxRWZqSYkogW5LHp
 EvSeOswv0dYf/JsBdSDBMuz6NQXvxLSblx5J7F0fyoDA/9DOWmmHcSfOH
 nrW8OX7nnmk0XiffwffmLiHthmcDr0yGkxTCYLU25HujjkuY7Kv/4jHJt
 P5bG5HhwFqyiry2gFj2jkZ8INA5dXnM+TeH9HA3Mdf1TMnAoa5rWWl6oS A==;
X-CSE-ConnectionGUID: 12XhE4rHRx2G/uZ/yihg0w==
X-CSE-MsgGUID: bBB4Fu9iTWC+JhU0yfpeIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67217787"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="67217787"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:42 -0700
X-CSE-ConnectionGUID: G9llTCsjSCSp6sodm3vXCg==
X-CSE-MsgGUID: cpn6P6PESkSYaTkG+FBU2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140452860"
Received: from abityuts-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 01/12] drm/panelreplay: Panel Replay capability DPCD
 register definitions
Date: Wed, 21 May 2025 14:53:08 +0300
Message-ID: <20250521115319.2380655-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521115319.2380655-1-jouni.hogander@intel.com>
References: <20250521115319.2380655-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add new definition for size of Panel Replay DPCD capability registers
area. Rename existing definitions to group capability registers together.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c |  8 ++++----
 include/drm/display/drm_dp.h             | 12 +++++++-----
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index cd833b63ea6b..0cfdeff268f9 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -516,7 +516,7 @@ static u8 intel_dp_get_su_capability(struct intel_dp *intel_dp)
 
 	if (intel_dp->psr.sink_panel_replay_su_support)
 		drm_dp_dpcd_readb(&intel_dp->aux,
-				  DP_PANEL_PANEL_REPLAY_CAPABILITY,
+				  DP_PANEL_REPLAY_CAP_CAPABILITY,
 				  &su_capability);
 	else
 		su_capability = intel_dp->psr_dpcd[1];
@@ -528,7 +528,7 @@ static unsigned int
 intel_dp_get_su_x_granularity_offset(struct intel_dp *intel_dp)
 {
 	return intel_dp->psr.sink_panel_replay_su_support ?
-		DP_PANEL_PANEL_REPLAY_X_GRANULARITY :
+		DP_PANEL_REPLAY_CAP_X_GRANULARITY :
 		DP_PSR2_SU_X_GRANULARITY;
 }
 
@@ -536,7 +536,7 @@ static unsigned int
 intel_dp_get_su_y_granularity_offset(struct intel_dp *intel_dp)
 {
 	return intel_dp->psr.sink_panel_replay_su_support ?
-		DP_PANEL_PANEL_REPLAY_Y_GRANULARITY :
+		DP_PANEL_REPLAY_CAP_Y_GRANULARITY :
 		DP_PSR2_SU_Y_GRANULARITY;
 }
 
@@ -676,7 +676,7 @@ void intel_psr_init_dpcd(struct intel_dp *intel_dp)
 {
 	drm_dp_dpcd_read(&intel_dp->aux, DP_PSR_SUPPORT, intel_dp->psr_dpcd,
 			 sizeof(intel_dp->psr_dpcd));
-	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP,
+	drm_dp_dpcd_readb(&intel_dp->aux, DP_PANEL_REPLAY_CAP_SUPPORT,
 			  &intel_dp->pr_dpcd);
 
 	if (intel_dp->pr_dpcd & DP_PANEL_REPLAY_SUPPORT)
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 3001c0b6e7bb..3371e2edd9e9 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -547,16 +547,18 @@
 /* DFP Capability Extension */
 #define DP_DFP_CAPABILITY_EXTENSION_SUPPORT	0x0a3	/* 2.0 */
 
-#define DP_PANEL_REPLAY_CAP				0x0b0  /* DP 2.0 */
+#define DP_PANEL_REPLAY_CAP_SUPPORT			0x0b0  /* DP 2.0 */
 # define DP_PANEL_REPLAY_SUPPORT			(1 << 0)
 # define DP_PANEL_REPLAY_SU_SUPPORT			(1 << 1)
 # define DP_PANEL_REPLAY_EARLY_TRANSPORT_SUPPORT	(1 << 2) /* eDP 1.5 */
 
-#define DP_PANEL_PANEL_REPLAY_CAPABILITY		0xb1
-# define DP_PANEL_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
+#define DP_PANEL_REPLAY_CAP_SIZE	7
 
-#define DP_PANEL_PANEL_REPLAY_X_GRANULARITY		0xb2
-#define DP_PANEL_PANEL_REPLAY_Y_GRANULARITY		0xb4
+#define DP_PANEL_REPLAY_CAP_CAPABILITY			0xb1
+# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
+
+#define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
+#define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
 
 /* Link Configuration */
 #define	DP_LINK_BW_SET		            0x100
-- 
2.43.0

