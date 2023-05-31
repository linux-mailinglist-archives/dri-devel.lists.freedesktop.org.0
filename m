Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3677186EA
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 18:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87C810E1CB;
	Wed, 31 May 2023 16:00:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF4C10E1CB;
 Wed, 31 May 2023 16:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685548823; x=1717084823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9VCiQaigMGXKNyziAsRtTdCC8bH1CTMeHx7t9epsfnE=;
 b=Lv1yWjdvh0ux5CvU7QPOFut+7JvAMm9KcEbMUSaWPME2Mwin6HhR1Ikg
 7zRhJ8xucPHy0nAzmUR9bGjqNe7BRG34DLHrVcv/YPa/mvjlvW4xSj6yP
 xwDO8PPJBgpMGQjaw5q/MZi9bFRe+ynBbygFPuYyCT3rAd7NsI7QOc85p
 +PxyZfGqXjkPWMRYQYg4BJ1knPRzq2sdHlmZvOfR5xlNzB5vwC2rq5Hgj
 lnO4g6Or4aWbXVVZGBrYK1Oc69BIwYKHUP5pv3apsHseXV9Biotoi4Ljt
 zdecmfTvWZvf01s9EXgQFcE4j43+DDOEY5V2epEhWc5yVzbYmdLuBPlKQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="344797678"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="344797678"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:58:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="710129975"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="710129975"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga007.fm.intel.com with ESMTP; 31 May 2023 08:58:52 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Remove some obsolete definitions
Date: Wed, 31 May 2023 08:59:42 -0700
Message-Id: <20230531155942.441862-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

There were a bunch of defines and structures left over from an API
update a very long time ago. Remove them.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 33 ---------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 4e57bd09d50d9..b4d56eccfb1f0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -35,13 +35,6 @@
 #define GUC_MAX_CONTEXT_ID		65535
 #define	GUC_INVALID_CONTEXT_ID		GUC_MAX_CONTEXT_ID
 
-#define GUC_RENDER_ENGINE		0
-#define GUC_VIDEO_ENGINE		1
-#define GUC_BLITTER_ENGINE		2
-#define GUC_VIDEOENHANCE_ENGINE		3
-#define GUC_VIDEO_ENGINE2		4
-#define GUC_MAX_ENGINES_NUM		(GUC_VIDEO_ENGINE2 + 1)
-
 #define GUC_RENDER_CLASS		0
 #define GUC_VIDEO_CLASS			1
 #define GUC_VIDEOENHANCE_CLASS		2
@@ -499,32 +492,6 @@ struct guc_log_buffer_state {
 	u32 version;
 } __packed;
 
-struct guc_ctx_report {
-	u32 report_return_status;
-	u32 reserved1[64];
-	u32 affected_count;
-	u32 reserved2[2];
-} __packed;
-
-/* GuC Shared Context Data Struct */
-struct guc_shared_ctx_data {
-	u32 addr_of_last_preempted_data_low;
-	u32 addr_of_last_preempted_data_high;
-	u32 addr_of_last_preempted_data_high_tmp;
-	u32 padding;
-	u32 is_mapped_to_proxy;
-	u32 proxy_ctx_id;
-	u32 engine_reset_ctx_id;
-	u32 media_reset_count;
-	u32 reserved1[8];
-	u32 uk_last_ctx_switch_reason;
-	u32 was_reset;
-	u32 lrca_gpu_addr;
-	u64 execlist_ctx;
-	u32 reserved2[66];
-	struct guc_ctx_report preempt_ctx_report[GUC_MAX_ENGINES_NUM];
-} __packed;
-
 /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
 enum intel_guc_recv_message {
 	INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
-- 
2.39.1

