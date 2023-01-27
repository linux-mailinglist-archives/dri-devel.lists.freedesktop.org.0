Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E1267DAD3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 01:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3426910E155;
	Fri, 27 Jan 2023 00:29:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F35310E146;
 Fri, 27 Jan 2023 00:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674779341; x=1706315341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gE2TL8/wmSdfF/qfLiTs7dtrj7rx1/jqcUGqBVk0hBM=;
 b=Oof6KDCXLvcNLjsxHS/DNVNCsx0ir8ufxWY7dtfBkLDSgD74B7hkHcFY
 DpHxBmKmvYSFBCDe0GSL4Lm5r6q+O2dwBv9Z8lFQOUyLrj4diNIMCl9TA
 b7vhw8nbB8ur4tH2xzKclhbux0o25iL6kXDm1CjbMz1S7d5tvdoquWq0u
 kWx+QlpDbx5D2N7bGjWaFRKOFvSE7XDl/vvIKIfDvcbu8sbW2rgYMN7B2
 nUvci+pLhOiW3A5Vf3Ov2NfNYrIOj1ySVwn18TpMaTPhaXiXPtfWuK1UT
 EclPaPNnIX9SnvNGuz5y4knllZoKZF6ev5GjNrjbUmbrYXwuS/vQtneMa g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="324687314"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="324687314"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 16:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805621926"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="805621926"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2023 16:28:53 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v6 8/8] drm/i915/guc: Rename GuC register state capture node
 to be more obvious
Date: Thu, 26 Jan 2023 16:28:42 -0800
Message-Id: <20230127002842.3169194-9-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127002842.3169194-1-John.C.Harrison@Intel.com>
References: <20230127002842.3169194-1-John.C.Harrison@Intel.com>
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

