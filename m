Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA2334A14
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 22:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA136EA6C;
	Wed, 10 Mar 2021 21:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40B46E3AC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 21:49:06 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id a14so1597745qvj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 13:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEd5AsA5xg18eVkLGLl1ZQeCR2oZqmgoHrlt2YFADVM=;
 b=TSm1Aof5H44JIYwWrR5poEzpmEUdulZ0a0a+yJfZJv0fnNS8/uW1B6RJWyiXYGHj0P
 4kA5j0l62xNPC5ghGmVMoTZI9GJOoj0bsaLucnlV1UXcRt2h9uxREgwW1quyj2EnWa4j
 UGuOrR7NeMHXxim7do+7QPgGxs5IGC7PgsnfffbuZhymIYDFPkAmQi4wU5VfbUftKvIL
 GebztBkmh2rFMtLsm/g5uptsQW5vVlky6d2Kl216jhW0PFlu1NUCeT0E7nA9H5FDhUgd
 oWAm70QgbyNa0wPc49RHx7xd5hBG4+8AG4KHm7pnkjtZeFknGTG9DKk/YbaY3cEUfQLU
 3U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEd5AsA5xg18eVkLGLl1ZQeCR2oZqmgoHrlt2YFADVM=;
 b=CIUEISoTFn2gKO80EVFrMTTl0Em/4zPjFH38ONZvgtuiRZ4tPOCuYKLy2pf+uQ0QqS
 5vHmCLvj3cqOUWjlCzgJ2CWEaVrSQ6ypO9jX8QQsqbuPQFB25/1SgIfb0S0rHTilS3fW
 ElOVpSDROrjLXB+jjFTIyqjUPYH2O/0aiibT4yHiH45pJ+t/c4NFsUL4DC+2vNvewVrq
 3SPwR60l7k6TicFNg9r9Fxqx/xD2zpeyoBqDfZm6jJ48UvXHnXjkl2rU6BfgPq4Vm5Zm
 cVtr4KqdZTmx1/QQ53hxa2b+tS8tVt62miGe0jgB+X2Fk16UJaNMAyWi+XbvyrkbBewj
 3HDw==
X-Gm-Message-State: AOAM5300H0Z9YgfG8Ai+rIuuVwHTXcLk1aBDA/gZQ1ZvTvtav9nxomg9
 jTQbS72yKq7rzfVV/MYa6zSluQ==
X-Google-Smtp-Source: ABdhPJzQXO4kE3VQdkvVOwo/o1DDoChi4gZkl7dHDwEGtnHOUlIMQD16l7a194B1N1dIXu+9uvDo/Q==
X-Received: by 2002:a05:6214:2464:: with SMTP id
 im4mr4873762qvb.61.1615412945747; 
 Wed, 10 Mar 2021 13:49:05 -0800 (PST)
Received: from localhost ([172.58.155.143])
 by smtp.gmail.com with ESMTPSA id c125sm482464qke.117.2021.03.10.13.49.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Mar 2021 13:49:05 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/dp_link_training: Convert DRM_DEBUG_KMS to
 drm_dbg_kms
Date: Wed, 10 Mar 2021 16:47:57 -0500
Message-Id: <20210310214845.29021-2-sean@poorly.run>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210310214845.29021-1-sean@poorly.run>
References: <20210310214845.29021-1-sean@poorly.run>
MIME-Version: 1.0
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
Cc: Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

One instance of DRM_DEBUG_KMS was leftover in dp_link_training, convert
it to the new shiny.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index ad02d493ec16..19ba7c7cbaab 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -26,12 +26,13 @@
 #include "intel_dp_link_training.h"
 
 static void
-intel_dp_dump_link_status(const u8 link_status[DP_LINK_STATUS_SIZE])
+intel_dp_dump_link_status(struct drm_device *drm,
+			  const u8 link_status[DP_LINK_STATUS_SIZE])
 {
-
-	DRM_DEBUG_KMS("ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x%x adj_req2_3:0x%x\n",
-		      link_status[0], link_status[1], link_status[2],
-		      link_status[3], link_status[4], link_status[5]);
+	drm_dbg_kms(drm,
+		    "ln0_1:0x%x ln2_3:0x%x align:0x%x sink:0x%x adj_req0_1:0x%x adj_req2_3:0x%x\n",
+		    link_status[0], link_status[1], link_status[2],
+		    link_status[3], link_status[4], link_status[5]);
 }
 
 static void intel_dp_reset_lttpr_count(struct intel_dp *intel_dp)
@@ -642,7 +643,7 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 		/* Make sure clock is still ok */
 		if (!drm_dp_clock_recovery_ok(link_status,
 					      crtc_state->lane_count)) {
-			intel_dp_dump_link_status(link_status);
+			intel_dp_dump_link_status(&i915->drm, link_status);
 			drm_dbg_kms(&i915->drm,
 				    "Clock recovery check failed, cannot "
 				    "continue channel equalization\n");
@@ -669,7 +670,7 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 
 	/* Try 5 times, else fail and try at lower BW */
 	if (tries == 5) {
-		intel_dp_dump_link_status(link_status);
+		intel_dp_dump_link_status(&i915->drm, link_status);
 		drm_dbg_kms(&i915->drm,
 			    "Channel equalization failed 5 times\n");
 	}
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
