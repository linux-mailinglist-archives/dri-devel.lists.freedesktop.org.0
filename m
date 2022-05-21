Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF752FADD
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 13:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF63A10E109;
	Sat, 21 May 2022 11:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA4610E0F1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 11:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Md9/6NzAv0jrHFbIgTAsd+38B+aN7Go6jo2y146vOSs=;
 b=nEkZMStRD5LCP/VtnJZ2rb7SbzoSoQmd6Y7PlbrHS+OlZZVHojupzuFz
 wOJVUYAhRgiCdK5R0aiA9Sd5V9CdCvgiG97CfVa0Vy7lKiwrgN7152Nui
 2oq2VhsyrUmBopkMe4/ki4O4qkCTRa2rN1aX8HQNyyqXmnh/yttadOjeD k=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; d="scan'208";a="14727998"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:12:08 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/i915: fix typos in comments
Date: Sat, 21 May 2022 13:11:40 +0200
Message-Id: <20220521111145.81697-90-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Spelling mistakes (triple letters) in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/i915/display/intel_color.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_pps.c             |    2 +-
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c |    2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c           |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 34128c9c635c..a27ce874a9e8 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1638,7 +1638,7 @@ static u32 icl_gamma_mode(const struct intel_crtc_state *crtc_state)
 	/*
 	 * Enable 10bit gamma for D13
 	 * ToDo: Extend to Logarithmic Gamma once the new UAPI
-	 * is acccepted and implemented by a userspace consumer
+	 * is accepted and implemented by a userspace consumer
 	 */
 	else if (DISPLAY_VER(i915) >= 13)
 		gamma_mode |= GAMMA_MODE_MODE_10BIT;
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 5a598dd06039..4bc0563dde92 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -509,7 +509,7 @@ static void wait_panel_power_cycle(struct intel_dp *intel_dp)
 
 	drm_dbg_kms(&i915->drm, "Wait for panel power cycle\n");
 
-	/* take the difference of currrent time and panel power off time
+	/* take the difference of current time and panel power off time
 	 * and then make panel wait for t11_t12 if needed. */
 	panel_power_on_time = ktime_get_boottime();
 	panel_power_off_duration = ktime_ms_delta(panel_power_on_time, intel_dp->pps.panel_power_off_time);
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 86f7a9ac1c39..aa0d2bbbbcc4 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1350,7 +1350,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 			 * submission. If we don't cancel the timer now,
 			 * we will see that the timer has expired and
 			 * reschedule the tasklet; continually until the
-			 * next context switch or other preeemption event.
+			 * next context switch or other preemption event.
 			 *
 			 * Since we have decided to reschedule based on
 			 * consumption of this timeslice, if we submit the
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 78d2989fe917..02311ad90264 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -588,7 +588,7 @@ int intel_guc_log_relay_open(struct intel_guc_log *log)
 	/*
 	 * We require SSE 4.1 for fast reads from the GuC log buffer and
 	 * it should be present on the chipsets supporting GuC based
-	 * submisssions.
+	 * submissions.
 	 */
 	if (!i915_has_memcpy_from_wc()) {
 		ret = -ENXIO;

