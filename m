Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C88F67C20E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 01:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D64510E8D2;
	Thu, 26 Jan 2023 00:54:41 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C9710E8CF;
 Thu, 26 Jan 2023 00:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674694474; x=1706230474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gE2TL8/wmSdfF/qfLiTs7dtrj7rx1/jqcUGqBVk0hBM=;
 b=dyw/m0NBVRRwh5yKCRe7aEN3m9TpjF8FG+TbQTYG9TakGdUg3/gjqs78
 HunVAk+DKhEdQtX7raVH61ZCp9L0ygKHWYZqzVKDVtiVP2gFMObr3bUQG
 ZMuYIaLYtf44xez8Of5/JSEqITxgvhXWKtgCcpDezItGjonrZQ/+VgxxL
 jh+Ml32+MS38+BpYoE1SSCx83mkVF5z1gFwRphUE41uZczP8acpUxLise
 Ia4L0KVRO6FkL3alUrY8swOUB/5ayqg74Qn3aqBPev++Xa5dq4dQKx8u9
 yiYkcWIefGO6bQ+p4DhWbwe8uj1vTG3YPdUGtfLWIZIwHmzHR8TW8xCFF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="389064433"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="389064433"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 16:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="751404311"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="751404311"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2023 16:54:33 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v5 8/8] drm/i915/guc: Rename GuC register state capture node
 to be more obvious
Date: Wed, 25 Jan 2023 16:54:20 -0800
Message-Id: <20230126005420.160070-9-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126005420.160070-1-John.C.Harrison@Intel.com>
References: <20230126005420.160070-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The GuC specific register state entry in the error capture object was
just called 'capture'. Although the companion 'node' entry was called
'guc_capture_node'. Rename the base entry to be 'guc_capture' instead
so that it is a) more consistent and b) more obvious what it is.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 8 ++++----
 drivers/gpu/drm/i915/i915_gpu_error.h          | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 1c1b85073b4bd..fc3b994626a4f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -1506,7 +1506,7 @@ int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *ebuf,
 
 	if (!ebuf || !ee)
 		return -EINVAL;
-	cap = ee->capture;
+	cap = ee->guc_capture;
 	if (!cap || !ee->engine)
 		return -ENODEV;
 
@@ -1576,8 +1576,8 @@ void intel_guc_capture_free_node(struct intel_engine_coredump *ee)
 	if (!ee || !ee->guc_capture_node)
 		return;
 
-	guc_capture_add_node_to_cachelist(ee->capture, ee->guc_capture_node);
-	ee->capture = NULL;
+	guc_capture_add_node_to_cachelist(ee->guc_capture, ee->guc_capture_node);
+	ee->guc_capture = NULL;
 	ee->guc_capture_node = NULL;
 }
 
@@ -1611,7 +1611,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 		    (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK)) {
 			list_del(&n->link);
 			ee->guc_capture_node = n;
-			ee->capture = guc->capture;
+			ee->guc_capture = guc->capture;
 			return;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index efc75cc2ffdb9..56027ffbce51f 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -94,7 +94,7 @@ struct intel_engine_coredump {
 	struct intel_instdone instdone;
 
 	/* GuC matched capture-lists info */
-	struct intel_guc_state_capture *capture;
+	struct intel_guc_state_capture *guc_capture;
 	struct __guc_capture_parsed_output *guc_capture_node;
 
 	struct i915_gem_context_coredump {
-- 
2.39.1

