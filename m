Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ACE4C3A0A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 01:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272AF10E1D1;
	Fri, 25 Feb 2022 00:06:27 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877DB10E13C;
 Fri, 25 Feb 2022 00:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645747585; x=1677283585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IO3Ln45DkiN+JmhKaDtAfg4jDuEvCexwMFpUQ7P/HDc=;
 b=cy0Q0pD/F8XK8zI1ggWbqEm3zV1sP5WSUSjcomqjJ7zV6elaZ2fV62YF
 PHH3m8FxM2u7iZcGBzUUg+mIoJVxJGUPal+65Y5NOwr9/anSHKM1B1mjO
 fKC7Z6k/q5qe+csDzyvXNf+SN73Zxp8XQ483otWzXd3Ix+zk6Ec3pWpew
 67rSu7/WWu/6AlE51UaIyHlrtgHVso82bkoKDCKiYv5lzZPo63r3ABmUy
 ulN/UKDBpkkhxAlsWJBlV32YcHId04/fN7rEtDsL27Zlnus7xUe8SgK0s
 iD+zHcnpFr9cfOuSveFW4+0g5hR4zfiVLqbV8jcPRoRTt6FUIF3IClV2M w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277012942"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277012942"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 16:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="592278978"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2022 16:06:25 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 6/8] drm/i915/guc: Rename desc_idx to ctx_id
Date: Thu, 24 Feb 2022 16:06:21 -0800
Message-Id: <20220225000623.1934438-7-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
References: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
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

The LRC descriptor pool is going away. So, stop naming context ids as
descriptor pool indecies.

While at it, add a bunch of missing line feeds to some error messages.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 52 +++++++++----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d9e1cd3e1db2..53114097a5b9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2245,7 +2245,7 @@ static void prepare_context_registration_info(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
 	struct intel_guc *guc = &engine->gt->uc.guc;
-	u32 desc_idx = ce->guc_id.id;
+	u32 ctx_id = ce->guc_id.id;
 	struct guc_lrc_desc *desc;
 	struct intel_context *child;
 
@@ -2258,7 +2258,7 @@ static void prepare_context_registration_info(struct intel_context *ce)
 	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
 		   i915_gem_object_is_lmem(ce->ring->vma->obj));
 
-	desc = __get_lrc_desc(guc, desc_idx);
+	desc = __get_lrc_desc(guc, ctx_id);
 	desc->engine_class = engine_class_to_guc_class(engine->class);
 	desc->engine_submit_mask = engine->logical_mask;
 	desc->hw_context_desc = ce->lrc.lrca;
@@ -2310,16 +2310,16 @@ static int try_context_registration(struct intel_context *ce, bool loop)
 	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	intel_wakeref_t wakeref;
-	u32 desc_idx = ce->guc_id.id;
+	u32 ctx_id = ce->guc_id.id;
 	bool context_registered;
 	int ret = 0;
 
 	GEM_BUG_ON(!sched_state_is_init(ce));
 
-	context_registered = ctx_id_mapped(guc, desc_idx);
+	context_registered = ctx_id_mapped(guc, ctx_id);
 
-	clr_ctx_id_mapping(guc, desc_idx);
-	set_ctx_id_mapping(guc, desc_idx, ce);
+	clr_ctx_id_mapping(guc, ctx_id);
+	set_ctx_id_mapping(guc, ctx_id, ce);
 
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
@@ -2345,7 +2345,7 @@ static int try_context_registration(struct intel_context *ce, bool loop)
 		}
 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		if (unlikely(disabled)) {
-			clr_ctx_id_mapping(guc, desc_idx);
+			clr_ctx_id_mapping(guc, ctx_id);
 			return 0;	/* Will get registered later */
 		}
 
@@ -2361,9 +2361,9 @@ static int try_context_registration(struct intel_context *ce, bool loop)
 		with_intel_runtime_pm(runtime_pm, wakeref)
 			ret = register_context(ce, loop);
 		if (unlikely(ret == -EBUSY)) {
-			clr_ctx_id_mapping(guc, desc_idx);
+			clr_ctx_id_mapping(guc, ctx_id);
 		} else if (unlikely(ret == -ENODEV)) {
-			clr_ctx_id_mapping(guc, desc_idx);
+			clr_ctx_id_mapping(guc, ctx_id);
 			ret = 0;	/* Will get registered later */
 		}
 	}
@@ -3860,26 +3860,26 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
 }
 
 static inline struct intel_context *
-g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
+g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
 {
 	struct intel_context *ce;
 
-	if (unlikely(desc_idx >= GUC_MAX_CONTEXT_ID)) {
+	if (unlikely(ctx_id >= GUC_MAX_CONTEXT_ID)) {
 		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Invalid desc_idx %u", desc_idx);
+			"Invalid ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
-	ce = __get_context(guc, desc_idx);
+	ce = __get_context(guc, ctx_id);
 	if (unlikely(!ce)) {
 		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Context is NULL, desc_idx %u", desc_idx);
+			"Context is NULL, ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
 	if (unlikely(intel_context_is_child(ce))) {
 		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Context is child, desc_idx %u", desc_idx);
+			"Context is child, ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
@@ -3891,14 +3891,14 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  u32 len)
 {
 	struct intel_context *ce;
-	u32 desc_idx = msg[0];
+	u32 ctx_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
 		return -EPROTO;
 	}
 
-	ce = g2h_context_lookup(guc, desc_idx);
+	ce = g2h_context_lookup(guc, ctx_id);
 	if (unlikely(!ce))
 		return -EPROTO;
 
@@ -3942,14 +3942,14 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 {
 	struct intel_context *ce;
 	unsigned long flags;
-	u32 desc_idx = msg[0];
+	u32 ctx_id = msg[0];
 
 	if (unlikely(len < 2)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
 		return -EPROTO;
 	}
 
-	ce = g2h_context_lookup(guc, desc_idx);
+	ce = g2h_context_lookup(guc, ctx_id);
 	if (unlikely(!ce))
 		return -EPROTO;
 
@@ -3957,8 +3957,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 		     (!context_pending_enable(ce) &&
 		     !context_pending_disable(ce)))) {
 		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Bad context sched_state 0x%x, desc_idx %u",
-			ce->guc_state.sched_state, desc_idx);
+			"Bad context sched_state 0x%x, ctx_id %u\n",
+			ce->guc_state.sched_state, ctx_id);
 		return -EPROTO;
 	}
 
@@ -4057,14 +4057,14 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 {
 	struct intel_context *ce;
 	unsigned long flags;
-	int desc_idx;
+	int ctx_id;
 
 	if (unlikely(len != 1)) {
 		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
 		return -EPROTO;
 	}
 
-	desc_idx = msg[0];
+	ctx_id = msg[0];
 
 	/*
 	 * The context lookup uses the xarray but lookups only require an RCU lock
@@ -4073,7 +4073,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 	 * asynchronously until the reset is done.
 	 */
 	xa_lock_irqsave(&guc->context_lookup, flags);
-	ce = g2h_context_lookup(guc, desc_idx);
+	ce = g2h_context_lookup(guc, ctx_id);
 	if (ce)
 		intel_context_get(ce);
 	xa_unlock_irqrestore(&guc->context_lookup, flags);
-- 
2.25.1

