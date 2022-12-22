Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D053A653CF7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 09:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A064B10E519;
	Thu, 22 Dec 2022 08:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205D710E516;
 Thu, 22 Dec 2022 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671697584; x=1703233584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mDYgpkWeT/34EYocoEYpbYixBqpsTsHOBuNtgqMJW+s=;
 b=L980WB5Ro1GJtW1YxrrXfFuYueFS1pNU4MUpuQMAMzuUPvCTaZfBt8Il
 ktzbZx1zhiZD8b9B70ZWxVLQXEaYJVVfMP3WK5argEfUBB3pQLOrPahuJ
 KsFqA8soho6ji2gvEKR0Jz4gnfTLXvW6dwvkcNvDlUUTnxlfLe2qDxe1p
 Fj22Yee/Cabj7Jb7QPuzsmg/d5BA/roXaGLZMdHniQ8iPGJ+3PpwAky7q
 eqGs+DNwJp66F5xbAUKoxt6XuinJme5Wi0L4fonn58gYv2MCb25yHJ7Y3
 Xlfg4VfmJ1XhjYuKlxxLIqk974Ak4zIgWaKC6n9VHK3V3tKjictvZPl6m w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="384426684"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="384426684"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 00:26:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="645127595"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="645127595"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 00:26:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] fixup! drm/i915/gt: Remove platform comments from
 workarounds
Date: Thu, 22 Dec 2022 00:25:55 -0800
Message-Id: <20221222082557.1364711-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222082557.1364711-1-lucas.demarchi@intel.com>
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c            | 2 +-
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c                | 2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c      | 4 ++--
 drivers/gpu/drm/i915/gt/intel_workarounds.c          | 7 +++----
 5 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index ef45dfc6adae..25a982925cf2 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1614,7 +1614,7 @@ static void __gpm_wait_for_fw_complete(struct intel_gt *gt, u32 fw_mask)
 }
 
 /*
- * Wa_22011802037
+ * Wa_22011802037 - In addition to stopping the cs, we need to wait for any
  * pending MI_FORCE_WAKEUP requests that the CS has initiated to complete. The
  * pending status is indicated by bits[13:9] (masked by bits[29:25]) in the
  * MSG_IDLE register. There's one MSG_IDLE register per reset domain. Since we
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 9f232c743ee7..1510255f6a50 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2989,7 +2989,7 @@ static void execlists_reset_prepare(struct intel_engine_cs *engine)
 	intel_engine_stop_cs(engine);
 
 	/*
-	 * Wa_22011802037
+	 * Wa_22011802037 - In addition to stopping the cs, we need
 	 * to wait for any pending mi force wakeups
 	 */
 	if (IS_GRAPHICS_VER(engine->i915, 11, 12))
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index f59d38a5e2a0..b3ea634958d1 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -613,7 +613,7 @@ static int gen8_reset_engines(struct intel_gt *gt,
 	}
 
 	/*
-	 * Wa_22011100796
+	 * Wa_22011100796 - whenever Full soft reset is required,
 	 * reset all individual engines firstly, and then do a full soft reset.
 	 *
 	 * This is best effort, so ignore any error from the initial reset.
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 704b50467ce3..5414df579341 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -317,9 +317,9 @@ static void reset_prepare(struct intel_engine_cs *engine)
 	 * Thus assume it is best to stop engines on all gens
 	 * where we have a gpu reset.
 	 *
-	 * WaKBLVECSSemaphoreWaitPoll
+	 * WaKBLVECSSemaphoreWaitPoll - on ALL_ENGINES
 	 *
-	 * WaMediaResetMainRingCleanup
+	 * WaMediaResetMainRingCleanup - presumably
 	 * WaClearRingBufHeadRegAtInit
 	 *
 	 * FIXME: Wa for more modern gens needs to be validated
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index edfa7d98a409..b01af1ed2382 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1425,7 +1425,7 @@ tgl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 				SUBSLICE_UNIT_LEVEL_CLKGATE2,
 				CPSSUNIT_CLKGATE_DIS);
 
-	/* Wa_1607087056 */
+	/* Wa_1607087056 - also know as BUG:1409180338 */
 	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0))
 		wa_write_or(wal,
 			    GEN11_SLICE_UNIT_LEVEL_CLKGATE,
@@ -2318,7 +2318,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 				FORCE_1_SUB_MESSAGE_PER_FRAGMENT);
 	}
 
-	/* Wa_1308578152 */
+	/* Wa_1308578152 - when first gslice is fused off */
 	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_B0, STEP_C0) &&
 	    needs_wa_1308578152(engine)) {
 		wa_masked_dis(wal, GEN12_CS_DEBUG_MODE1_CCCSUNIT_BE_COMMON,
@@ -2417,8 +2417,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 
 	if (IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0)) {
 		/*
-		 * Wa_1606679103
-		 * (see also Wa_1606682166
+		 * Wa_1606679103 - see also Wa_1606682166
 		 */
 		wa_write_or(wal,
 			    GEN7_SARCHKMD,
-- 
2.39.0

