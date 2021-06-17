Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774443AA870
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 03:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC858897FB;
	Thu, 17 Jun 2021 01:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D70897FB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 01:09:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623892169; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jFdctibapv2kmHKwbyaYDWL4qhN7osPb6AHzf0+1kh4=;
 b=P/fxY8WQcgKNYTB9Ed5h2SOPJr74PmgqSzxqGaJ8br+Uq19Eq1MT8VFlmbLJ5V3xHLkdTM4M
 KbB22vaJHXeyuefQNiMwi6jFCXow5LgT6xAyzklgN2XPnM3//d/h7ptwzTbxPVaczbt3axYp
 DcgTVxPC1qpyFsqUN9S+mAFZrQU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60caa0bded59bf69cc87e0fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 01:09:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CBA68C43217; Thu, 17 Jun 2021 01:09:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from nganji-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: maitreye)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B0F7FC433F1;
 Thu, 17 Jun 2021 01:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0F7FC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=maitreye@codeaurora.org
From: maitreye <maitreye@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dp: add logs across DP driver for ease of debugging
Date: Wed, 16 Jun 2021 18:08:54 -0700
Message-Id: <1623892134-20447-1-git-send-email-maitreye@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: Maitreyee Rao <maitreye@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, swboyd@chromium.org, khsieh@codeaurora.org,
 robdclark@gmail.com, seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maitreyee Rao <maitreye@codeaurora.org>

Add trace points across the MSM DP driver to help debug
interop issues.

Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |  5 +++--
 drivers/gpu/drm/msm/dp/dp_catalog.c |  4 ++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.c    | 20 +++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 ++
 drivers/gpu/drm/msm/dp/dp_power.c   |  3 +++
 7 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 4a3293b..5fdff18d 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -121,9 +121,10 @@ static ssize_t dp_aux_cmd_fifo_tx(struct dp_aux_private *aux,
 
 	time_left = wait_for_completion_timeout(&aux->comp,
 						msecs_to_jiffies(250));
-	if (!time_left)
+	if (!time_left) {
+		DRM_DEBUG_DP("%s aux timeout error timeout:%lu\n", __func__, time_left);
 		return -ETIMEDOUT;
-
+	}
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 32f3575..5de5dcd 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -372,6 +372,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
+	DRM_DEBUG_DP("%s enable=0x%x\n", __func__, enable);
 	if (enable) {
 		/*
 		 * To make sure link reg writes happens before other operation,
@@ -580,6 +581,7 @@ void dp_catalog_hpd_config_intr(struct dp_catalog *dp_catalog,
 
 	config = (en ? config | intr_mask : config & ~intr_mask);
 
+	DRM_DEBUG_DP("%s intr_mask=0x%x config=0x%x\n", __func__, intr_mask, config);
 	dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
 				config & DP_DP_HPD_INT_MASK);
 }
@@ -610,6 +612,7 @@ u32 dp_catalog_link_is_connected(struct dp_catalog *dp_catalog)
 	u32 status;
 
 	status = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
+	DRM_DEBUG_DP("%s aux status:0x%x\n", __func__, status);
 	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
 	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
 
@@ -685,6 +688,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 	/* Make sure to clear the current pattern before starting a new one */
 	dp_write_link(catalog, REG_DP_STATE_CTRL, 0x0);
 
+	DRM_DEBUG_DP("%s pattern:0x%x\n", __func__, pattern);
 	switch (pattern) {
 	case DP_PHY_TEST_PATTERN_D10_2:
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 2a8955c..7fd1e3f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -99,6 +99,7 @@ static int dp_aux_link_configure(struct drm_dp_aux *aux,
 	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
 	values[1] = link->num_lanes;
 
+	DRM_DEBUG_DP("%s value0:0x%x value1:0x%x\n", __func__, values[0], values[1]);
 	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
 		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
 
@@ -122,6 +123,7 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
 			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
 		pr_warn("PUSH_IDLE pattern timedout\n");
 
+	DRM_DEBUG_DP("PUSH IDLE\n");
 	pr_debug("mainlink off done\n");
 }
 
@@ -1013,6 +1015,8 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 	u32 voltage_swing_level = link->phy_params.v_level;
 	u32 pre_emphasis_level = link->phy_params.p_level;
 
+	DRM_DEBUG_DP("%s: voltage level:%d emphasis level:%d\n", __func__,
+			voltage_swing_level, pre_emphasis_level);
 	ret = dp_catalog_ctrl_update_vx_px(ctrl->catalog,
 		voltage_swing_level, pre_emphasis_level);
 
@@ -1112,6 +1116,8 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 		cr->lane_0_1 = link_status[0];
 		cr->lane_2_3 = link_status[1];
 
+		DRM_DEBUG_DP("link status:0x%x 0x%x 0x%x 0x%x 0x%x\n", link_status[0],
+				link_status[1], link_status[2], link_status[3], link_status[4]);
 		if (drm_dp_clock_recovery_ok(link_status,
 			ctrl->link->link_params.num_lanes)) {
 			return 0;
@@ -1384,6 +1390,7 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
 	if (reset)
 		dp_catalog_ctrl_reset(ctrl->catalog);
 
+	DRM_DEBUG_DP("%s Flip:%d\n", __func__, flip);
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
 	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cf9c645..b471fe4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -275,6 +275,8 @@ static bool dp_display_is_ds_bridge(struct dp_panel *panel)
 
 static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
 {
+	DRM_DEBUG_DP("%s present=0x%x sink_count=%d\n", __func__,
+			dp->panel->dpcd[DP_DOWNSTREAMPORT_PRESENT], dp->link->sink_count);
 	return dp_display_is_ds_bridge(dp->panel) &&
 		(dp->link->sink_count == 0);
 }
@@ -320,6 +322,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 
 	dp->dp_display.is_connected = hpd;
 
+	DRM_DEBUG_DP("%s hpd=%d\n", __func__, hpd);
 	dp_display_send_hpd_event(&dp->dp_display);
 
 	return 0;
@@ -369,6 +372,8 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
 {
 	bool flip = false;
 
+	DRM_DEBUG_DP("%s core_initialized=%d", __func__, dp->core_initialized);
+
 	if (dp->core_initialized) {
 		DRM_DEBUG_DP("DP core already initialized\n");
 		return;
@@ -483,8 +488,10 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 {
 	u32 sink_request = dp->link->sink_request;
 
+	DRM_DEBUG_DP("%s %d\n", __func__, sink_request);
 	if (dp->hpd_state == ST_DISCONNECTED) {
 		if (sink_request & DP_LINK_STATUS_UPDATED) {
+			DRM_DEBUG_DP("%s:Disconnected sink_count:%d\n", __func__, sink_request);
 			DRM_ERROR("Disconnected, no DP_LINK_STATUS_UPDATED\n");
 			return -EINVAL;
 		}
@@ -509,6 +516,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		DRM_ERROR("invalid dev\n");
 		return -EINVAL;
 	}
+	DRM_DEBUG_DP("%s sink_request:%d\n", __func__, sink_request);
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
@@ -523,6 +531,8 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 	rc = dp_link_process_request(dp->link);
 	if (!rc) {
 		sink_request = dp->link->sink_request;
+		DRM_DEBUG_DP("%s hpd_state=%d sink_count=%d\n", __func__,
+				dp->hpd_state, sink_request);
 		if (sink_request & DS_PORT_STATUS_CHANGED)
 			rc = dp_display_handle_port_ststus_changed(dp);
 		else
@@ -545,6 +555,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	mutex_lock(&dp->event_mutex);
 
 	state =  dp->hpd_state;
+	DRM_DEBUG_DP("%s hpd_state=%d\n", __func__, state);
 	if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -680,6 +691,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	/* start sentinel checking in case of missing uevent */
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
+	DRM_DEBUG_DP("%s hpd_state=%d\n", __func__, state);
 	/* signal the disconnect event early to ensure proper teardown */
 	dp_display_handle_plugged_change(g_dp_display, false);
 
@@ -738,6 +750,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 	if (ret == -ECONNRESET) { /* cable unplugged */
 		dp->core_initialized = false;
 	}
+	DRM_DEBUG_DP("%s hpd_state=%d\n", __func__, state);
 
 	mutex_unlock(&dp->event_mutex);
 
@@ -882,6 +895,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 
 	dp_display = g_dp_display;
 
+	DRM_DEBUG_DP("%s sink_count=%d\n", __func__, dp->link->sink_count);
 	if (dp_display->power_on) {
 		DRM_DEBUG_DP("Link already setup, return\n");
 		return 0;
@@ -943,6 +957,7 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
 	dp_display->power_on = false;
 
+	DRM_DEBUG_DP("%s:  sink count:%d\n", __func__, dp->link->sink_count);
 	return 0;
 }
 
@@ -1190,6 +1205,7 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 
 	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
 
+	DRM_DEBUG_DP("%s: hpd isr status:%x\n", __func__, hpd_isr_status);
 	if (hpd_isr_status & 0x0F) {
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK ||
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index be986da..f858a8c 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -973,6 +973,9 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
  */
 static int dp_link_process_ds_port_status_change(struct dp_link_private *link)
 {
+	DRM_DEBUG_DP("link status 0:0x%x 1:0x%x 2:0x%x 3:0x%x 4:0x%x", link->link_status[0],
+			link->link_status[1], link->link_status[2],
+			link->link_status[3], link->link_status[4]);
 	if (get_link_status(link->link_status, DP_LANE_ALIGN_STATUS_UPDATED) &
 					DP_DOWNSTREAM_PORT_STATUS_CHANGED)
 		goto reset;
@@ -1036,43 +1039,46 @@ int dp_link_process_request(struct dp_link *dp_link)
 
 	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
 		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
-		return ret;
+		goto error;
 	}
 
 	ret = dp_link_process_ds_port_status_change(link);
 	if (!ret) {
 		dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
-		return ret;
+		goto error;
 	}
 
 	ret = dp_link_process_link_training_request(link);
 	if (!ret) {
 		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
-		return ret;
+		goto error;
 	}
 
 	ret = dp_link_process_phy_test_pattern_request(link);
 	if (!ret) {
 		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
-		return ret;
+		goto error;
 	}
 
 	ret = dp_link_process_link_status_update(link);
 	if (!ret) {
 		dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
-		return ret;
+		goto error;
 	}
 
 	if (dp_link_is_video_pattern_requested(link)) {
-		ret = 0;
 		dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
+		goto error;
 	}
 
 	if (dp_link_is_audio_pattern_requested(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
-		return -EINVAL;
+		ret = -EINVAL;
+		goto error;
 	}
 
+error:
+	DRM_DEBUG_DP("%s sink request:%x", __func__, dp_link->sink_request);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 88196f7..71db071 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -66,6 +66,8 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 		goto end;
 	}
 
+	DRM_DEBUG_DP("%s 0x%x 0x%x 0x%x 0x%x 0x%x\n", __func__, dpcd[0],
+			dpcd[1], dpcd[2], dpcd[3], dpcd[4]);
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 3961ba4..2271941 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -208,6 +208,9 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
 
 int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type)
 {
+	DRM_DEBUG_DP("%s core_clk_on=%d link_clk_on%d stream_clk_on=%d\n", __func__,
+			dp_power->core_clks_on, dp_power->link_clks_on, dp_power->stream_clks_on);
+
 	if (pm_type == DP_CORE_PM)
 		return dp_power->core_clks_on;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

