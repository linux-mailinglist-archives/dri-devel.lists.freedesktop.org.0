Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDB12A5F5E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1932C896FA;
	Wed,  4 Nov 2020 08:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5776E911
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 22:20:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604442016; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KSinNATC2VbdTtMtPqRkCzS6AlH3P9KV1us9k4CUbRs=;
 b=tA4H7Zv9OcngZR463yfzd9KnMILlZwjxT0cjRzqFdogmjlShJKS3J+wwpYdmPjxCPR6n35+3
 cxRVcH6ceBGuILs5eke31/gU9MisVUvkY6Cp4krPoYkwgFVw3Dq3YS9v34KdElloo5NC8jhV
 omMTk71MEzoPNy4MaPy2CPOafM4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fa1d7a0875877e3ed0aa9f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 22:20:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29231C433C9; Tue,  3 Nov 2020 22:20:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EF2ACC433C9;
 Tue,  3 Nov 2020 22:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF2ACC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Subject: [PATCH 2/3] FIXUP: FROMLIST: drm/msm/dp: return correct connection
 status after suspend
Date: Tue,  3 Nov 2020 14:19:52 -0800
Message-Id: <20201103221953.3920-3-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103221953.3920-1-khsieh@codeaurora.org>
References: <20201103221953.3920-1-khsieh@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stephen Boyd <swboyd@chromium.org>

During suspend, dp host controller and hpd block are disabled due to
both ahb and aux clock are disabled. Therefore hpd plug/unplug interrupts
will not be generated. At dp_pm_resume(), reinitialize both dp host
controller and hpd block so that hpd plug/unplug interrupts will be
generated and handled by driver so that hpd connection state is updated
correctly. This patch will fix link training flaky issues.

Changes in v2:
-- use container_of to cast correct dp_display_private pointer
   at both dp_pm_suspend() and dp_pm_resume().

Changes in v3:
-- replace hpd_state atomic_t  with u32

Changes in v4
-- call dp_display_host_deinit() at dp_pm_suspend()
-- call dp_display_host_init() at msm_dp_display_enable()
-- fix phy->init_count unbalance which causes link training failed

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
(am from https://lore.kernel.org/patchwork/patch/1320895/)
(also found at https://lore.kernel.org/r/20201013233522.5222-1-khsieh@codeaurora.org)

BUG=b:166844571, b:148864048, b:170279524
TEST=On lazor, suspend with DP connected, disconnect cable, resume see
     panel is gone from settings

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Change-Id: I9ff76b552ad9c671d1a75bd54bdf0ecb3a053e5c
Reviewed-on: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2469808
Commit-Queue: Rob Clark <robdclark@chromium.org>
Reviewed-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  5 ++
 drivers/gpu/drm/msm/dp/dp_display.c | 83 ++++++++++++++++++-----------
 3 files changed, 58 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 63c5ada34c21..4963bfe6a472 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -576,7 +576,7 @@ u32 dp_catalog_hpd_get_state_status(struct dp_catalog *dp_catalog)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
-	u32 status = 0;
+	u32 status;
 
 	status = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
 	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 7572264a7156..aa40429cad42 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1403,6 +1403,8 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip)
 void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
+	struct dp_io *dp_io;
+	struct phy *phy;
 
 	if (!dp_ctrl) {
 		DRM_ERROR("Invalid input data\n");
@@ -1410,8 +1412,11 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 	}
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	dp_io = &ctrl->parser->io;
+	phy = dp_io->phy;
 
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
+	phy_exit(phy);
 
 	DRM_DEBUG_DP("Host deinitialized successfully\n");
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d431f0ee02bf..edae497da937 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,7 +108,7 @@ struct dp_display_private {
 	/* event related only access by event thread */
 	struct mutex event_mutex;
 	wait_queue_head_t event_q;
-	atomic_t hpd_state;
+	u32 hpd_state;
 	u32 event_pndx;
 	u32 event_gndx;
 	struct dp_event event_list[DP_EVENT_Q_MAX];
@@ -365,6 +365,20 @@ static void dp_display_host_init(struct dp_display_private *dp)
 	dp->core_initialized = true;
 }
 
+static void dp_display_host_deinit(struct dp_display_private *dp)
+{
+	if (!dp->core_initialized) {
+		DRM_DEBUG_DP("DP core not initialized\n");
+		return;
+	}
+
+	dp_ctrl_host_deinit(dp->ctrl);
+	dp_aux_deinit(dp->aux);
+	dp_power_deinit(dp->power);
+
+	dp->core_initialized = false;
+}
+
 static int dp_display_usbpd_configure_cb(struct device *dev)
 {
 	int rc = 0;
@@ -489,7 +503,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	state =  atomic_read(&dp->hpd_state);
+	state =  dp->hpd_state;
 	if (state == ST_SUSPEND_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -507,14 +521,14 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	atomic_set(&dp->hpd_state, ST_CONNECT_PENDING);
+	dp->hpd_state = ST_CONNECT_PENDING;
 
 	hpd->hpd_high = 1;
 
 	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
 	if (ret) {	/* failed */
 		hpd->hpd_high = 0;
-		atomic_set(&dp->hpd_state, ST_DISCONNECTED);
+		dp->hpd_state = ST_DISCONNECTED;
 	}
 
 	/* start sanity checking */
@@ -535,10 +549,10 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	state =  atomic_read(&dp->hpd_state);
+	state = dp->hpd_state;
 	if (state == ST_CONNECT_PENDING) {
 		dp_display_enable(dp, 0);
-		atomic_set(&dp->hpd_state, ST_CONNECTED);
+		dp->hpd_state = ST_CONNECTED;
 	}
 
 	mutex_unlock(&dp->event_mutex);
@@ -571,7 +585,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 
 	mutex_lock(&dp->event_mutex);
 
-	state = atomic_read(&dp->hpd_state);
+	state = dp->hpd_state;
 	if (state == ST_SUSPEND_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -589,7 +603,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	atomic_set(&dp->hpd_state, ST_DISCONNECT_PENDING);
+	dp->hpd_state = ST_DISCONNECT_PENDING;
 
 	/* disable HPD plug interrupt until disconnect is done */
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK
@@ -624,10 +638,10 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
 
 	mutex_lock(&dp->event_mutex);
 
-	state =  atomic_read(&dp->hpd_state);
+	state =  dp->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		dp_display_disable(dp, 0);
-		atomic_set(&dp->hpd_state, ST_DISCONNECTED);
+		dp->hpd_state = ST_DISCONNECTED;
 	}
 
 	mutex_unlock(&dp->event_mutex);
@@ -642,7 +656,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	state =  atomic_read(&dp->hpd_state);
+	state =  dp->hpd_state;
 	if (state == ST_SUSPEND_PENDING) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -793,11 +807,6 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 
 	dp_display = g_dp_display;
 
-	if (dp_display->power_on) {
-		DRM_DEBUG_DP("Link already setup, return\n");
-		return 0;
-	}
-
 	rc = dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		dp_display->power_on = true;
@@ -830,9 +839,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
 	dp_display = g_dp_display;
 
-	if (!dp_display->power_on)
-		return -EINVAL;
-
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
 		if (!wait_for_completion_timeout(&dp->audio_comp,
@@ -1195,6 +1201,12 @@ static int dp_pm_resume(struct device *dev)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	mutex_lock(&dp->event_mutex);
+
+	/* start from disconnected state */
+	dp->hpd_state = ST_DISCONNECTED;
+
+	/* turn on dp ctrl/phy */
 	dp_display_host_init(dp);
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
@@ -1209,6 +1221,8 @@ static int dp_pm_resume(struct device *dev)
 		dp->core_initialized = false;
 	}
 
+	mutex_unlock(&dp->event_mutex);
+
 	return 0;
 }
 
@@ -1220,10 +1234,14 @@ static int dp_pm_suspend(struct device *dev)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	if (dp_display->power_on == true)
-		dp_display_disable(dp, 0);
+	mutex_lock(&dp->event_mutex);
 
-	atomic_set(&dp->hpd_state, ST_SUSPENDED);
+	if (dp->core_initialized == true)
+		dp_display_host_deinit(dp);
+
+	dp->hpd_state = ST_SUSPENDED;
+
+	mutex_unlock(&dp->event_mutex);
 
 	return 0;
 }
@@ -1352,6 +1370,8 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
+
 	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
@@ -1366,7 +1386,10 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		return rc;
 	}
 
-	state =  atomic_read(&dp_display->hpd_state);
+	state =  dp_display->hpd_state;
+
+	if (state == ST_DISPLAY_OFF)
+		dp_display_host_init(dp_display);
 
 	dp_display_enable(dp_display, 0);
 
@@ -1377,13 +1400,11 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		dp_display_unprepare(dp);
 	}
 
-	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
-
 	if (state == ST_SUSPEND_PENDING)
 		dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
 
 	/* completed connection */
-	atomic_set(&dp_display->hpd_state, ST_CONNECTED);
+	dp_display->hpd_state = ST_CONNECTED;
 
 	mutex_unlock(&dp_display->event_mutex);
 
@@ -1411,20 +1432,20 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	mutex_lock(&dp_display->event_mutex);
 
+	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
+
 	dp_display_disable(dp_display, 0);
 
 	rc = dp_display_unprepare(dp);
 	if (rc)
 		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
 
-	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
-
-	state =  atomic_read(&dp_display->hpd_state);
+	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
-		atomic_set(&dp_display->hpd_state, ST_DISCONNECTED);
+		dp_display->hpd_state = ST_DISCONNECTED;
 	} else {
-		atomic_set(&dp_display->hpd_state, ST_SUSPEND_PENDING);
+		dp_display->hpd_state = ST_SUSPEND_PENDING;
 	}
 
 	mutex_unlock(&dp_display->event_mutex);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
