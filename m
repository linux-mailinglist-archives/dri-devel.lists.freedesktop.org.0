Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D0367618E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA6410EB32;
	Fri, 20 Jan 2023 23:28:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952CA10EB20;
 Fri, 20 Jan 2023 23:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674257330; x=1705793330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iu0P2ZIfIuIe5Zvs5goqSilamyFGDM6epKp/Bep3TsE=;
 b=ZjaTql/4al0FrJuExYiMHGRiY1dgRaCiO7btwAvqczZWhn+f/arF0FPe
 D3ekzNwy8lTDxSVIbrMDquWbZqBgSVL7k1gGoVEIKxtutTTf8okXIoL8q
 nKaqwSaH/1+dk+7r2EH2mfl1h+hSOqRbFHz8tSmGScYR70dDOuppdzK0+
 tkXA/Ce7w48OQ7EqTTuDv7UDTzBL/kJeJvfX6kds4gbGdYSbfkpUXM3Ok
 5QQ6iIlnDxwMjF0MmDBYXTyE3VC5i0I7mnzqisY7wdOENzIVS1xs9zqEO
 pbqZwFB4haaTIqSEP/Najtcy4AfC7UGBVXIACmN/Ns/XvHa5Htv94OJS9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324413567"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="324413567"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 15:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="693021628"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="693021628"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 20 Jan 2023 15:28:49 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 7/7] drm/i915/guc: Rename GuC register state capture node
 to be more obvious
Date: Fri, 20 Jan 2023 15:28:31 -0800
Message-Id: <20230120232831.28177-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120232831.28177-1-John.C.Harrison@Intel.com>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
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

The GuC specific register state entry in the error capture object was
just called 'capture'. Although the companion 'node' entry was called
'guc_capture_node'. Rename the base entry to be 'guc_capture' instead
so that it is a) more consistent and b) more obvious what it is.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
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
2.39.0

