Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78CF653CF4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 09:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD5710E521;
	Thu, 22 Dec 2022 08:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47CE10E514;
 Thu, 22 Dec 2022 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671697583; x=1703233583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G26Xi+3Mu0RsqVsMq6+Wo/lBvmZFtlv/v/jQGWH5Td4=;
 b=K/cEpwdwUmkwVPI9dUNuTztrBZFPoUd0X0En7Bhp4w6lqFMhkXW7+UED
 bAnf7rASr/aKGcJS0n9653lp46Gq21+7wyjqAhja0TcwBS8gvlv+kLyyI
 1qDWdfZZErUSJE9VmwKwRHuCxvasnFbg5qpNHuwRAHwbNI5zIrzanBt5B
 1VmjtOzL5qPxJ4lwLONp/NyKd1TniIKzeN50WjKXQovFf5iwRQwdbCb/+
 WRNs01AgCkfZ99XWhyE/urAZYOIm67KZ4Ropg8gZi7gM9Y5fdyUAa/MMJ
 NZMJwz+qFD/OjJ7UEVf5aYjoES5nFKPVjxq2WL8me9d10Zt7Mob7baZIx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="384426683"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="384426683"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 00:26:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="645127601"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="645127601"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 00:26:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] fixup! drm/i915: Remove platform comments from workarounds
Date: Thu, 22 Dec 2022 00:25:57 -0800
Message-Id: <20221222082557.1364711-5-lucas.demarchi@intel.com>
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
 drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
 drivers/gpu/drm/i915/i915_perf.c         | 4 ++--
 drivers/gpu/drm/i915/intel_pm.c          | 4 ++--
 drivers/gpu/drm/i915/intel_uncore.c      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 328c886309f3..543881838def 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1636,7 +1636,7 @@ static void psr2_man_trk_ctl_calc(struct intel_crtc_state *crtc_state,
 
 	if (full_update) {
 		/*
-		 * Not applying Wa_14014971508
+		 * Not applying Wa_14014971508 as we do not support the
 		 * feature that requires this workaround.
 		 */
 		val |= man_trk_ctl_single_full_frame_bit_get(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 49f7e1fbd96c..9e6686b8c8f0 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1590,7 +1590,7 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
 	free_oa_buffer(stream);
 
 	/*
-	 * Wa_16011777198
+	 * Wa_16011777198 - Unset the override of GUCRC mode to enable rc6.
 	 */
 	if (intel_uc_uses_guc_rc(&gt->uc) &&
 	    (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_C0) ||
@@ -3293,7 +3293,7 @@ static int i915_oa_stream_init(struct i915_perf_stream *stream,
 	intel_uncore_forcewake_get(stream->uncore, FORCEWAKE_ALL);
 
 	/*
-	 * Wa_16011777198
+	 * Wa_16011777198 - GuC resets render as part of the Wa. This causes
 	 * OA to lose the configuration state. Prevent this by overriding GUCRC
 	 * mode.
 	 */
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 82a59738ca4a..492973085297 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -4578,7 +4578,7 @@ static void ivb_init_clock_gating(struct drm_i915_private *dev_priv)
 
 	/*
 	 * According to the spec, bit 13 (RCZUNIT) must be set on IVB.
-	 * This implements the WaDisableRCZUnitClockGating
+	 * This implements the WaDisableRCZUnitClockGating workaround.
 	 */
 	intel_uncore_write(&dev_priv->uncore, GEN6_UCGCTL2,
 		   GEN6_RCZUNIT_CLOCK_GATE_DISABLE);
@@ -4615,7 +4615,7 @@ static void vlv_init_clock_gating(struct drm_i915_private *dev_priv)
 
 	/*
 	 * According to the spec, bit 13 (RCZUNIT) must be set on IVB.
-	 * This implements the WaDisableRCZUnitClockGating
+	 * This implements the WaDisableRCZUnitClockGating workaround.
 	 */
 	intel_uncore_write(&dev_priv->uncore, GEN6_UCGCTL2,
 		   GEN6_RCZUNIT_CLOCK_GATE_DISABLE);
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index e56dbb20f2fe..182791a9cabb 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1887,7 +1887,7 @@ static const struct intel_forcewake_range __xelpmp_fw_ranges[] = {
 static void
 ilk_dummy_write(struct intel_uncore *uncore)
 {
-	/* WaIssueDummyWriteToWakeupFromRC6
+	/* WaIssueDummyWriteToWakeupFromRC6 - Issue a dummy write to wake up
 	 * the chip from rc6 before touching it for real. MI_MODE is masked,
 	 * hence harmless to write 0 into. */
 	__raw_uncore_write32(uncore, RING_MI_MODE(RENDER_RING_BASE), 0);
-- 
2.39.0

