Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FA22495A3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9316E1F3;
	Wed, 19 Aug 2020 06:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A45E6E15D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:16:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597785386; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=qJRVk6l3SQnsOddDC1vxjEkUzwcf4Qp5+UauytJlvpU=;
 b=n2RjJG4Hj9Xp3vPoOG3LavTEQRe5vGEhwlZ/DCk5NgJUQ+F3HmhtZCXoImXmo/do7HMFkFEk
 a63sbJOFsuMUy19zTfn5OlqECvrN/2LD8vxxRSRVafodfFHW309YLXW05gqPSbgod4dyefRU
 +H17ICQ4wqgfOFK5ZVAp+h+Qiu0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f3c45218567201751d8e204 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 21:16:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D48A0C43395; Tue, 18 Aug 2020 21:16:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 041E7C433CA;
 Tue, 18 Aug 2020 21:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 041E7C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH v3] drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets
Date: Tue, 18 Aug 2020 14:15:46 -0700
Message-Id: <20200818211546.559-1-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 Guenter Roeck <groeck@chromium.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add event thread to execute events serially from event queue. Also
timeout mode is supported  which allow an event be deferred to be
executed at later time. Both link and phy compliant tests had been
done successfully.

Changes in v2:
- Fix potential deadlock by removing redundant connect_mutex
- Check and enable link clock during modeset
- Drop unused code and fix function prototypes.
- set sink power to normal operation state (D0) before DPCD read

Changes in v3:
- push idle pattern at main link before timing generator off
- add timeout handles for both connect and disconnect

This patch depends-on following series:
https://lkml.kernel.org/lkml/20200812044223.19279-1-tanmay@codeaurora.org/t.atom

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
Signed-off-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |   6 +
 drivers/gpu/drm/msm/dp/dp_aux.c             |   3 +
 drivers/gpu/drm/msm/dp/dp_aux.h             |   1 +
 drivers/gpu/drm/msm/dp/dp_catalog.c         |  77 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c            | 370 +++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h            |   3 +-
 drivers/gpu/drm/msm/dp/dp_display.c         | 747 +++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_display.h         |   1 -
 drivers/gpu/drm/msm/dp/dp_drm.c             |   4 -
 drivers/gpu/drm/msm/dp/dp_hpd.c             |   2 +-
 drivers/gpu/drm/msm/dp/dp_hpd.h             |   1 +
 drivers/gpu/drm/msm/dp/dp_link.c            |  22 +-
 drivers/gpu/drm/msm/dp/dp_panel.c           |  78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h           |   9 +-
 drivers/gpu/drm/msm/dp/dp_parser.c          |  45 +-
 drivers/gpu/drm/msm/dp/dp_parser.h          |   2 +
 drivers/gpu/drm/msm/dp/dp_power.c           |  46 +-
 drivers/gpu/drm/msm/dp/dp_power.h           |  13 +
 drivers/gpu/drm/msm/dp/dp_reg.h             |   1 +
 drivers/gpu/drm/msm/msm_drv.h               |   1 +
 20 files changed, 972 insertions(+), 460 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6a9e257d2fe6..81373bd38f0b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1221,6 +1221,11 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	/* wait for idle */
 	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
 
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
+		if (msm_dp_display_pre_disable(priv->dp, drm_enc))
+			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
+	}
+
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
@@ -1230,6 +1235,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 			phys->ops.disable(phys);
 	}
 
+
 	/* after phys waits for frame-done, should be no more frames pending */
 	if (atomic_xchg(&dpu_enc->frame_done_timeout_ms, 0)) {
 		DPU_ERROR("enc%d timeout pending\n", drm_enc->base.id);
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 582b551f8689..5aaa4b50c303 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -189,6 +189,8 @@ static void dp_aux_native_handler(struct dp_aux_private *aux)
 		aux->aux_error_num = DP_AUX_ERR_TOUT;
 	if (isr & DP_INTR_NACK_DEFER)
 		aux->aux_error_num = DP_AUX_ERR_NACK;
+	if (isr & DP_INTR_AUX_ERROR)
+		aux->aux_error_num = DP_AUX_ERR_DPPHY_AUX;
 
 	complete(&aux->comp);
 }
@@ -359,6 +361,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 					PHY_AUX_CFG1);
 			dp_catalog_aux_reset(aux->catalog);
 		}
+		usleep_range(400, 500); /* at least 400us to next try */
 		goto unlock_exit;
 	}
 
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 2de11021d84a..1fbdfc9aa62e 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -15,6 +15,7 @@
 #define DP_AUX_ERR_NACK		-3
 #define DP_AUX_ERR_DEFER	-4
 #define DP_AUX_ERR_NACK_DEFER	-5
+#define DP_AUX_ERR_DPPHY_AUX	-6
 
 int dp_aux_register(struct drm_dp_aux *dp_aux);
 void dp_aux_unregister(struct drm_dp_aux *dp_aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index d186424044b1..f92a8e37a312 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -524,16 +524,21 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
 		 * To make sure link reg writes happens before other operation,
 		 * dp_write_link() function uses writel()
 		 */
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
-				DP_MAINLINK_FB_BOUNDARY_SEL);
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
-					DP_MAINLINK_FB_BOUNDARY_SEL |
-					DP_MAINLINK_CTRL_RESET);
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
+		mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+
+		mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
+						DP_MAINLINK_CTRL_ENABLE);
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+
+		mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+
+		mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
 					DP_MAINLINK_FB_BOUNDARY_SEL);
-		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
-					DP_MAINLINK_FB_BOUNDARY_SEL |
-					DP_MAINLINK_CTRL_ENABLE);
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 	} else {
 		mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 		mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
@@ -629,7 +634,7 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
 
 	bit = BIT(pattern - 1);
 	DRM_DEBUG_DP("hw: bit=%d train=%d\n", bit, pattern);
-	dp_write_link(catalog, REG_DP_STATE_CTRL, bit);
+	dp_catalog_ctrl_state_ctrl(dp_catalog, bit);
 
 	bit = BIT(pattern - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
@@ -754,7 +759,7 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
 	/* enable HPD interrupts */
 	dp_catalog_hpd_config_intr(dp_catalog,
 		DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK
-		| DP_DP_HPD_UNPLUG_INT_MASK, true);
+		| DP_DP_HPD_UNPLUG_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
 
 	/* Configure REFTIMER and enable it */
 	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
@@ -866,15 +871,27 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 	dp_write_link(catalog, REG_DP_STATE_CTRL, 0x0);
 
 	switch (pattern) {
-	case DP_LINK_QUAL_PATTERN_D10_2:
+	case DP_PHY_TEST_PATTERN_D10_2:
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
-		return;
-	case DP_LINK_QUAL_PATTERN_PRBS7:
+		break;
+	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
+		value &= ~(1 << 16);
+		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+					value);
+		value |= SCRAMBLER_RESET_COUNT_VALUE;
+		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+					value);
+		dp_write_link(catalog, REG_DP_MAINLINK_LEVELS,
+					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
+		dp_write_link(catalog, REG_DP_STATE_CTRL,
+					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
+		break;
+	case DP_PHY_TEST_PATTERN_PRBS7:
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_PRBS7);
-		return;
-	case DP_LINK_QUAL_PATTERN_80BIT_CUSTOM:
+		break;
+	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
 		/* 00111110000011111000001111100000 */
@@ -886,14 +903,15 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 		/* 1111100000111110 */
 		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
 				0x0000F83E);
-		return;
-	case DP_LINK_QUAL_PATTERN_HBR2_EYE:
-	case DP_LINK_QUAL_PATTERN_ERROR_RATE:
-		value &= ~DP_HBR2_ERM_PATTERN;
-		if (pattern == DP_LINK_QUAL_PATTERN_HBR2_EYE)
-			value = DP_HBR2_ERM_PATTERN;
+		break;
+	case DP_PHY_TEST_PATTERN_CP2520:
+		value = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
+
+		value = DP_HBR2_ERM_PATTERN;
 		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
-					value);
+				value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
 		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
@@ -901,10 +919,19 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
 					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
-		return;
+		value = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		value |= DP_MAINLINK_CTRL_ENABLE;
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
+		break;
+	case DP_PHY_TEST_PATTERN_SEL_MASK:
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
+				DP_MAINLINK_CTRL_ENABLE);
+		dp_write_link(catalog, REG_DP_STATE_CTRL,
+				DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
+		break;
 	default:
 		DRM_DEBUG_DP("No valid test pattern requested:0x%x\n", pattern);
-		return;
+		break;
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index ae07e43b541b..70b0e06953f6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -26,6 +26,13 @@
 #define MR_LINK_SYMBOL_ERM 0x80
 #define MR_LINK_PRBS7 0x100
 #define MR_LINK_CUSTOM80 0x200
+#define MR_LINK_TRAINING4  0x40
+
+enum {
+	DP_TRAINING_NONE,
+	DP_TRAINING_1,
+	DP_TRAINING_2,
+};
 
 struct dp_tu_calc_input {
 	u64 lclk;        /* 162, 270, 540 and 810 */
@@ -58,7 +65,6 @@ struct dp_vc_tu_mapping_table {
 
 struct dp_ctrl_private {
 	struct dp_ctrl dp_ctrl;
-
 	struct device *dev;
 	struct drm_dp_aux *aux;
 	struct dp_panel *panel;
@@ -68,10 +74,16 @@ struct dp_ctrl_private {
 	struct dp_catalog *catalog;
 
 	struct completion idle_comp;
-	struct mutex push_idle_mutex;
 	struct completion video_comp;
 };
 
+struct dp_cr_status {
+	u8 lane_0_1;
+	u8 lane_2_3;
+};
+
+#define DP_LANE0_1_CR_DONE	0x11
+
 static int dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct dp_link_info *link)
 {
@@ -97,8 +109,6 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
-	mutex_lock(&ctrl->push_idle_mutex);
-
 	reinit_completion(&ctrl->idle_comp);
 	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_PUSH_IDLE);
 
@@ -106,7 +116,6 @@ void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
 			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
 		pr_warn("PUSH_IDLE pattern timedout\n");
 
-	mutex_unlock(&ctrl->push_idle_mutex);
 	pr_debug("mainlink off done\n");
 }
 
@@ -979,7 +988,7 @@ static int dp_ctrl_wait4video_ready(struct dp_ctrl_private *ctrl)
 
 	if (!wait_for_completion_timeout(&ctrl->video_comp,
 				WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES)) {
-		DRM_ERROR("Link Train timedout\n");
+		DRM_ERROR("wait4video timedout\n");
 		ret = -ETIMEDOUT;
 	}
 	return ret;
@@ -1000,13 +1009,13 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 	if (ret)
 		return ret;
 
-	if (voltage_swing_level > DP_TRAIN_VOLTAGE_SWING_MAX) {
+	if (voltage_swing_level >= DP_TRAIN_VOLTAGE_SWING_MAX) {
 		DRM_DEBUG_DP("max. voltage swing level reached %d\n",
 				voltage_swing_level);
 		max_level_reached |= DP_TRAIN_MAX_SWING_REACHED;
 	}
 
-	if (pre_emphasis_level == DP_TRAIN_PRE_EMPHASIS_MAX) {
+	if (pre_emphasis_level >= DP_TRAIN_PRE_EMPHASIS_MAX) {
 		DRM_DEBUG_DP("max. pre-emphasis level reached %d\n",
 				pre_emphasis_level);
 		max_level_reached  |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
@@ -1038,8 +1047,11 @@ static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
 	DRM_DEBUG_DP("sink: pattern=%x\n", pattern);
 
 	buf = pattern;
-	ret = drm_dp_dpcd_writeb(ctrl->aux,
-					DP_TRAINING_PATTERN_SET, buf);
+
+	if (pattern && pattern != DP_TRAINING_PATTERN_4)
+		buf |= DP_LINK_SCRAMBLING_DISABLE;
+
+	ret = drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET, buf);
 	return ret == 1;
 }
 
@@ -1065,19 +1077,23 @@ static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
 	return -ETIMEDOUT;
 }
 
-static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl)
+static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
+		struct dp_cr_status *cr, int *training_step)
 {
 	int tries, old_v_level, ret = 0;
 	u8 link_status[DP_LINK_STATUS_SIZE];
-	int const maximum_retries = 5;
+	int const maximum_retries = 4;
 
 	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
+	*training_step = DP_TRAINING_1;
+
 	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, DP_TRAINING_PATTERN_1);
 	if (ret)
 		return ret;
 	dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
 		DP_LINK_SCRAMBLING_DISABLE);
+
 	ret = dp_ctrl_update_vx_px(ctrl);
 	if (ret)
 		return ret;
@@ -1091,12 +1107,15 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl)
 		if (ret)
 			return ret;
 
+		cr->lane_0_1 = link_status[0];
+		cr->lane_2_3 = link_status[1];
+
 		if (drm_dp_clock_recovery_ok(link_status,
 			ctrl->link->link_params.num_lanes)) {
-			return ret;
+			return 0;
 		}
 
-		if (ctrl->link->phy_params.v_level >
+		if (ctrl->link->phy_params.v_level >=
 			DP_TRAIN_VOLTAGE_SWING_MAX) {
 			DRM_ERROR_RATELIMITED("max v_level reached\n");
 			return -EAGAIN;
@@ -1119,8 +1138,10 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl)
 	return -ETIMEDOUT;
 }
 
-static void dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
+static int dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
 {
+	int ret = 0;
+
 	switch (ctrl->link->link_params.rate) {
 	case 810000:
 		ctrl->link->link_params.rate = 540000;
@@ -1129,13 +1150,33 @@ static void dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
 		ctrl->link->link_params.rate = 270000;
 		break;
 	case 270000:
+		ctrl->link->link_params.rate = 162000;
+		break;
 	case 162000:
 	default:
-		ctrl->link->link_params.rate = 162000;
+		ret = -EINVAL;
 		break;
 	};
 
-	DRM_DEBUG_DP("new rate=0x%x\n", ctrl->link->link_params.rate);
+	if (!ret)
+		DRM_DEBUG_DP("new rate=0x%x\n", ctrl->link->link_params.rate);
+
+	return ret;
+}
+
+static int dp_ctrl_link_lane_down_shift(struct dp_ctrl_private *ctrl)
+{
+
+	if (ctrl->link->link_params.num_lanes == 1)
+		return -1;
+
+	ctrl->link->link_params.num_lanes /= 2;
+	ctrl->link->link_params.rate = ctrl->panel->link_info.rate;
+
+	ctrl->link->phy_params.p_level = 0;
+	ctrl->link->phy_params.v_level = 0;
+
+	return 0;
 }
 
 static void dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
@@ -1144,7 +1185,8 @@ static void dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
 	drm_dp_link_train_channel_eq_delay(ctrl->panel->dpcd);
 }
 
-static int dp_ctrl_link_training_2(struct dp_ctrl_private *ctrl)
+static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
+		struct dp_cr_status *cr, int *training_step)
 {
 	int tries = 0, ret = 0;
 	char pattern;
@@ -1153,6 +1195,8 @@ static int dp_ctrl_link_training_2(struct dp_ctrl_private *ctrl)
 
 	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
+	*training_step = DP_TRAINING_2;
+
 	if (drm_dp_tps3_supported(ctrl->panel->dpcd))
 		pattern = DP_TRAINING_PATTERN_3;
 	else
@@ -1174,10 +1218,13 @@ static int dp_ctrl_link_training_2(struct dp_ctrl_private *ctrl)
 		ret = dp_ctrl_read_link_status(ctrl, link_status);
 		if (ret)
 			return ret;
+		cr->lane_0_1 = link_status[0];
+		cr->lane_2_3 = link_status[1];
 
 		if (drm_dp_channel_eq_ok(link_status,
-			ctrl->link->link_params.num_lanes))
-			return ret;
+			ctrl->link->link_params.num_lanes)) {
+			return 0;
+		}
 
 		dp_link_adjust_levels(ctrl->link, link_status);
 		ret = dp_ctrl_update_vx_px(ctrl);
@@ -1189,15 +1236,15 @@ static int dp_ctrl_link_training_2(struct dp_ctrl_private *ctrl)
 	return -ETIMEDOUT;
 }
 
-static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl)
+static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl);
+
+static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
+		struct dp_cr_status *cr, int *training_step)
 {
 	int ret = 0;
 	u8 encoding = DP_SET_ANSI_8B10B;
 	struct dp_link_info link_info = {0};
 
-	ctrl->link->phy_params.p_level = 0;
-	ctrl->link->phy_params.v_level = 0;
-
 	dp_ctrl_config_ctrl(ctrl);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
@@ -1208,7 +1255,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl)
 	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
 				&encoding, 1);
 
-	ret = dp_ctrl_link_train_1(ctrl);
+	ret = dp_ctrl_link_train_1(ctrl, cr, training_step);
 	if (ret) {
 		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
 		goto end;
@@ -1217,7 +1264,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl)
 	/* print success info as this is a result of user initiated action */
 	DRM_DEBUG_DP("link training #1 successful\n");
 
-	ret = dp_ctrl_link_training_2(ctrl);
+	ret = dp_ctrl_link_train_2(ctrl, cr, training_step);
 	if (ret) {
 		DRM_ERROR("link training #2 failed. ret=%d\n", ret);
 		goto end;
@@ -1229,58 +1276,36 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl)
 end:
 	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
 
-	dp_ctrl_clear_training_pattern(ctrl);
 	return ret;
 }
 
-static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl, bool train)
+static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
+		struct dp_cr_status *cr, int *training_step)
 {
-	bool mainlink_ready = false;
 	int ret = 0;
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
 
-	ret = dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, false);
-	if (ret)
-		return ret;
-
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
 		return ret;
 
-	if (train) {
-		/*
-		 * As part of previous calls, DP controller state might have
-		 * transitioned to PUSH_IDLE. In order to start transmitting
-		 * a link training pattern, we have to first do soft reset.
-		 */
-		dp_catalog_ctrl_reset(ctrl->catalog);
-
-		ret = dp_ctrl_link_train(ctrl);
-		if (ret)
-			return ret;
-	}
-
 	/*
-	 * Set up transfer unit values and set controller state to send
-	 * video.
+	 * As part of previous calls, DP controller state might have
+	 * transitioned to PUSH_IDLE. In order to start transmitting
+	 * a link training pattern, we have to first do soft reset.
 	 */
-	dp_ctrl_setup_tr_unit(ctrl);
-	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+	dp_catalog_ctrl_reset(ctrl->catalog);
 
-	ret = dp_ctrl_wait4video_ready(ctrl);
-	if (ret)
-		return ret;
+	ret = dp_ctrl_link_train(ctrl, cr, training_step);
 
-	mainlink_ready = dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
-	DRM_DEBUG_DP("mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 	return ret;
 }
 
 static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
-				   char *name, u32 rate)
+			enum dp_pm_type module, char *name, u32 rate)
 {
-	u32 num = ctrl->parser->mp[DP_CTRL_PM].num_clk;
-	struct dss_clk *cfg = ctrl->parser->mp[DP_CTRL_PM].clk_config;
+	u32 num = ctrl->parser->mp[module].num_clk;
+	struct dss_clk *cfg = ctrl->parser->mp[module].clk_config;
 
 	while (num && strcmp(cfg->clk_name, name)) {
 		num--;
@@ -1302,16 +1327,33 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 
 	dp_power_set_link_clk_parent(ctrl->power);
 
-	dp_ctrl_set_clock_rate(ctrl, "ctrl_link",
+	dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
 					ctrl->link->link_params.rate);
 
-	dp_ctrl_set_clock_rate(ctrl, "stream_pixel",
-					ctrl->dp_ctrl.pixel_rate);
-
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
 	if (ret)
 		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
 
+	DRM_DEBUG_DP("link rate=%d pixel_clk=%d\n",
+		ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
+
+	return ret;
+}
+
+static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
+{
+	int ret = 0;
+
+	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
+					ctrl->dp_ctrl.pixel_rate);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
+	if (ret)
+		DRM_ERROR("Unabled to start pixel clocks. ret=%d\n", ret);
+
+	DRM_DEBUG_DP("link rate=%d pixel_clk=%d\n",
+			ctrl->link->link_params.rate, ctrl->dp_ctrl.pixel_rate);
+
 	return ret;
 }
 
@@ -1401,37 +1443,30 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 		return ret;
 	}
 
-	dp_ctrl_configure_source_params(ctrl);
-	dp_catalog_ctrl_config_msa(ctrl->catalog,
-		ctrl->link->link_params.rate,
-		ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
-	reinit_completion(&ctrl->idle_comp);
-
 	return ret;
 }
 
 static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
-	int tries;
+	struct dp_cr_status cr;
+	int training_step = DP_TRAINING_NONE;
 
 	dp_ctrl_push_idle(&ctrl->dp_ctrl);
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
-	for (tries = 0; tries < 10; tries++) {
-		ret = dp_ctrl_reinitialize_mainlink(ctrl);
-		if (ret) {
-			DRM_ERROR("Failed to reinitialize mainlink. ret=%d\n",
-					ret);
-			break;
-		}
+	ret = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
+	if (ret)
+		goto end;
 
-		ret = dp_ctrl_setup_main_link(ctrl, true);
-		if (ret == -EAGAIN) /* try with lower link rate */
-			dp_ctrl_link_rate_down_shift(ctrl);
-	}
+	dp_ctrl_clear_training_pattern(ctrl);
+
+	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+
+	ret = dp_ctrl_wait4video_ready(ctrl);
+end:
 	return ret;
 }
 
@@ -1444,22 +1479,22 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 		return ret;
 	}
 
-	dp_ctrl_push_idle(&ctrl->dp_ctrl);
 	/*
 	 * The global reset will need DP link related clocks to be
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	dp_catalog_ctrl_reset(ctrl->catalog);
 	ret = dp_ctrl_off(&ctrl->dp_ctrl);
 	if (ret) {
 		DRM_ERROR("failed to disable DP controller\n");
 		return ret;
 	}
 
-	ret = dp_ctrl_on(&ctrl->dp_ctrl);
-	if (ret)
-		DRM_ERROR("failed to enable DP controller\n");
+	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
+	if (!ret)
+		ret = dp_ctrl_on_stream(&ctrl->dp_ctrl);
+	else
+		DRM_ERROR("failed to enable DP link controller\n");
 
 	return ret;
 }
@@ -1479,27 +1514,33 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 		return false;
 	}
 	dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
+	dp_ctrl_update_vx_px(ctrl);
 	dp_link_send_test_response(ctrl->link);
 
 	pattern_sent = dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
 
 	switch (pattern_sent) {
 	case MR_LINK_TRAINING1:
-		success = pattern_requested ==
-				DP_LINK_QUAL_PATTERN_D10_2;
+		success = (pattern_requested ==
+				DP_PHY_TEST_PATTERN_D10_2);
 		break;
 	case MR_LINK_SYMBOL_ERM:
-		success = (pattern_requested ==
-				DP_LINK_QUAL_PATTERN_ERROR_RATE)
-			|| (pattern_requested ==
-				DP_LINK_QUAL_PATTERN_HBR2_EYE);
+		success = ((pattern_requested ==
+			DP_PHY_TEST_PATTERN_ERROR_COUNT) ||
+				(pattern_requested ==
+				DP_PHY_TEST_PATTERN_CP2520));
 		break;
 	case MR_LINK_PRBS7:
-		success = pattern_requested == DP_LINK_QUAL_PATTERN_PRBS7;
+		success = (pattern_requested ==
+				DP_PHY_TEST_PATTERN_PRBS7);
 		break;
 	case MR_LINK_CUSTOM80:
-		success = pattern_requested ==
-				DP_LINK_QUAL_PATTERN_80BIT_CUSTOM;
+		success = (pattern_requested ==
+				DP_PHY_TEST_PATTERN_80BIT_CUSTOM);
+		break;
+	case MR_LINK_TRAINING4:
+		success = (pattern_requested ==
+				DP_PHY_TEST_PATTERN_SEL_MASK);
 		break;
 	default:
 		success = false;
@@ -1531,12 +1572,12 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
 		}
 	}
 
-	if (sink_request & DP_LINK_STATUS_UPDATED)
+	if (sink_request & DP_LINK_STATUS_UPDATED) {
 		if (dp_ctrl_link_maintenance(ctrl)) {
-			DRM_ERROR("LM failed: STATUS_UPDATED\n");
+			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
 		}
-
+	}
 
 	if (sink_request & DP_TEST_LINK_TRAINING) {
 		dp_link_send_test_response(ctrl->link);
@@ -1547,13 +1588,15 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
 	}
 }
 
-int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
+int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 {
 	int rc = 0;
 	struct dp_ctrl_private *ctrl;
 	u32 rate = 0;
-	u32 link_train_max_retries = 10;
+	int link_train_max_retries = 5;
 	u32 const phy_cts_pixel_clk_khz = 148500;
+	struct dp_cr_status cr;
+	unsigned int training_step;
 
 	if (!dp_ctrl)
 		return -EINVAL;
@@ -1587,6 +1630,9 @@ int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
 	if (rc)
 		return rc;
 
+	ctrl->link->phy_params.p_level = 0;
+	ctrl->link->phy_params.v_level = 0;
+
 	while (--link_train_max_retries &&
 		!atomic_read(&ctrl->dp_ctrl.aborted)) {
 		rc = dp_ctrl_reinitialize_mainlink(ctrl);
@@ -1595,19 +1641,125 @@ int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
 					rc);
 			break;
 		}
-		rc = dp_ctrl_setup_main_link(ctrl, true);
-		if (!rc)
+
+		training_step = DP_TRAINING_NONE;
+		rc = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
+		if (rc == 0) {
+			/* training completed successfully */
 			break;
-		/* try with lower link rate */
-		dp_ctrl_link_rate_down_shift(ctrl);
+		} else if (training_step == DP_TRAINING_1) {
+			/* link train_1 failed */
+			rc = dp_ctrl_link_rate_down_shift(ctrl);
+			if (rc < 0) { /* already in RBR = 1.6G */
+				if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) {
+					/*
+					 * some lanes are ready,
+					 * reduce lane number
+					 */
+					rc = dp_ctrl_link_lane_down_shift(ctrl);
+					if (rc < 0) { /* lane == 1 already */
+						/* end with failure */
+						break;
+					}
+				} else {
+					/* end with failure */
+					break; /* lane == 1 already */
+				}
+			}
+		} else if (training_step == DP_TRAINING_2) {
+			/* link train_2 failed, lower lane rate */
+			rc = dp_ctrl_link_lane_down_shift(ctrl);
+			if (rc < 0) {
+				/* end with failure */
+				break; /* lane == 1 already */
+			}
+		}
 	}
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
-		dp_ctrl_send_phy_test_pattern(ctrl);
+		return rc;
+
+	/* stop txing train pattern */
+	dp_ctrl_clear_training_pattern(ctrl);
+
+	/*
+	 * keep transmitting idle pattern until video ready
+	 * to avoid main link from loss of sync
+	 */
+	if (rc == 0)  /* link train successfully */
+		dp_ctrl_push_idle(dp_ctrl);
 
 	return rc;
 }
 
+int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
+{
+	u32 rate = 0;
+	int ret = 0;
+	bool mainlink_ready = false;
+	struct dp_ctrl_private *ctrl;
+
+	if (!dp_ctrl)
+		return -EINVAL;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	rate = ctrl->panel->link_info.rate;
+
+	ctrl->link->link_params.rate = rate;
+	ctrl->link->link_params.num_lanes = ctrl->panel->link_info.num_lanes;
+	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+
+	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
+		ctrl->link->link_params.rate,
+		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
+
+	if (!dp_power_clk_status(ctrl->power, DP_CTRL_PM)) { /* link clk is off */
+		ret = dp_ctrl_enable_mainlink_clocks(ctrl);
+		if (ret) {
+			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
+			goto end;
+		}
+	}
+
+	ret = dp_ctrl_enable_stream_clocks(ctrl);
+	if (ret) {
+		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		goto end;
+	}
+
+	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
+		dp_ctrl_send_phy_test_pattern(ctrl);
+		return 0;
+	}
+
+	/*
+	 * Set up transfer unit values and set controller state to send
+	 * video.
+	 */
+	dp_ctrl_configure_source_params(ctrl);
+
+	dp_catalog_ctrl_config_msa(ctrl->catalog,
+		ctrl->link->link_params.rate,
+		ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
+
+	reinit_completion(&ctrl->video_comp);
+
+	dp_ctrl_setup_tr_unit(ctrl);
+
+	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+
+	ret = dp_ctrl_wait4video_ready(ctrl);
+	if (ret)
+		return ret;
+
+	mainlink_ready = dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
+	DRM_DEBUG_DP("mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
+
+end:
+	return ret;
+}
+
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
@@ -1619,11 +1771,16 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+
 	dp_catalog_ctrl_reset(ctrl->catalog);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, false);
+	if (ret)
+		DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);
+
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
 	if (ret) {
-		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
-		return ret;
+		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 	}
 
 	DRM_DEBUG_DP("DP off done\n");
@@ -1674,7 +1831,6 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 
 	init_completion(&ctrl->idle_comp);
 	init_completion(&ctrl->video_comp);
-	mutex_init(&ctrl->push_idle_mutex);
 
 	/* in parameters */
 	ctrl->parser   = parser;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 94713a0daff0..f60ba93c8678 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -21,7 +21,8 @@ struct dp_ctrl {
 
 int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip);
 void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
-int dp_ctrl_on(struct dp_ctrl *dp_ctrl);
+int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
+int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 36b6ee4131bb..97f076324242 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -9,6 +9,7 @@
 #include <linux/debugfs.h>
 #include <linux/component.h>
 #include <linux/of_irq.h>
+#include <linux/delay.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
@@ -28,6 +29,45 @@
 static struct msm_dp *g_dp_display;
 #define HPD_STRING_SIZE 30
 
+enum {
+	ISR_DISCONNECTED,
+	ISR_CONNECT_PENDING,
+	ISR_CONNECTED,
+	ISR_HPD_REPLUG_COUNT,
+	ISR_IRQ_HPD_PULSE_COUNT,
+	ISR_HPD_LO_GLITH_COUNT,
+};
+
+/* event thread connection state */
+enum {
+	ST_DISCONNECTED,
+	ST_CONNECT_PENDING,
+	ST_CONNECTED,
+	ST_DISCONNECT_PENDING,
+};
+
+enum {
+	EV_NO_EVENT,
+	/* hpd events */
+	EV_HPD_INIT_SETUP,
+	EV_HPD_PLUG_INT,
+	EV_IRQ_HPD_INT,
+	EV_HPD_REPLUG_INT,
+	EV_HPD_UNPLUG_INT,
+	EV_USER_NOTIFICATION,
+	EV_CONNECT_PENDING_TIMEOUT,
+	EV_DISCONNECT_PENDING_TIMEOUT,
+};
+
+#define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
+#define DP_EVENT_Q_MAX	8
+
+struct dp_event {
+	u32 event_id;
+	u32 data;
+	u32 delay;
+};
+
 struct dp_display_private {
 	char *name;
 	int irq;
@@ -37,11 +77,9 @@ struct dp_display_private {
 	bool power_on;
 	bool hpd_irq_on;
 	bool audio_supported;
-	atomic_t hpd_isr_status;
 
 	struct platform_device *pdev;
 	struct dentry *root;
-	struct completion notification_comp;
 
 	struct dp_usbpd   *usbpd;
 	struct dp_parser  *parser;
@@ -52,12 +90,20 @@ struct dp_display_private {
 	struct dp_link    *link;
 	struct dp_panel   *panel;
 	struct dp_ctrl    *ctrl;
+	struct dp_debug   *debug;
 
 	struct dp_usbpd_cb usbpd_cb;
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
-	struct delayed_work config_hpd_work;
+	/* event related only access by event thread */
+	struct mutex event_mutex;
+	wait_queue_head_t event_q;
+	atomic_t hpd_state;
+	u32 event_pndx;
+	u32 event_gndx;
+	struct dp_event event_list[DP_EVENT_Q_MAX];
+	spinlock_t event_lock;
 };
 
 static const struct of_device_id dp_dt_match[] = {
@@ -65,79 +111,58 @@ static const struct of_device_id dp_dt_match[] = {
 	{}
 };
 
-static irqreturn_t dp_display_irq(int irq, void *dev_id)
+static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
+						u32 data, u32 delay)
 {
-	struct dp_display_private *dp = dev_id;
-	irqreturn_t ret = IRQ_HANDLED;
-	u32 hpd_isr_status;
-
-	if (!dp) {
-		DRM_ERROR("invalid data\n");
-		return IRQ_NONE;
+	unsigned long flag;
+	struct dp_event *todo;
+	int pndx;
+
+	spin_lock_irqsave(&dp_priv->event_lock, flag);
+	pndx = dp_priv->event_pndx + 1;
+	pndx %= DP_EVENT_Q_MAX;
+	if (pndx == dp_priv->event_gndx) {
+		pr_err("event_q is full: pndx=%d gndx=%d\n",
+			dp_priv->event_pndx, dp_priv->event_gndx);
+		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+		return -EPERM;
 	}
+	todo = &dp_priv->event_list[dp_priv->event_pndx++];
+	dp_priv->event_pndx %= DP_EVENT_Q_MAX;
+	todo->event_id = event;
+	todo->data = data;
+	todo->delay = delay;
+	wake_up(&dp_priv->event_q);
+	spin_unlock_irqrestore(&dp_priv->event_lock, flag);
 
-	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
-
-	if (hpd_isr_status & DP_DP_HPD_INT_MASK) {
-		atomic_set(&dp->hpd_isr_status, hpd_isr_status);
-		ret = IRQ_WAKE_THREAD;
-	}
-
-	/* DP controller isr */
-	dp_ctrl_isr(dp->ctrl);
-
-	/* DP aux isr */
-	dp_aux_isr(dp->aux);
-
-	return ret;
+	return 0;
 }
 
-static irqreturn_t dp_display_hpd_isr_work(int irq, void *data)
+static int dp_del_event(struct dp_display_private *dp_priv, u32 event)
 {
-	struct dp_display_private *dp;
-	struct dp_usbpd *hpd;
-	u32 isr = 0;
-
-	dp = (struct dp_display_private *)data;
-	if (!dp)
-		return IRQ_NONE;
-
-	isr = atomic_read(&dp->hpd_isr_status);
-
-	/* reset to default */
-	atomic_set(&dp->hpd_isr_status, 0);
-
-	hpd = dp->usbpd;
-	if (!hpd)
-		return IRQ_NONE;
-
-	if (isr & DP_DP_HPD_PLUG_INT_MASK &&
-		isr & DP_DP_HPD_STATE_STATUS_CONNECTED) {
-		hpd->hpd_high = 1;
-		dp->usbpd_cb.configure(&dp->pdev->dev);
-	} else if (isr & DP_DP_HPD_UNPLUG_INT_MASK &&
-		(isr & DP_DP_HPD_STATE_STATUS_MASK) ==
-			 DP_DP_HPD_STATE_STATUS_DISCONNECTED) {
-
-		/* disable HPD plug interrupt until disconnect is done
-		 */
-		dp_catalog_hpd_config_intr(dp->catalog,
-			DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK,
-			false);
-
-		hpd->hpd_high = 0;
-
-		/* We don't need separate work for disconnect as
-		 * connect/attention interrupts are disabled
-		 */
-		dp->usbpd_cb.disconnect(&dp->pdev->dev);
+	unsigned long flag;
+	struct dp_event *todo;
+	u32	gndx;
+
+	spin_lock_irqsave(&dp_priv->event_lock, flag);
+	if (dp_priv->event_pndx == dp_priv->event_gndx) {
+		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+		return -ENOENT;
+	}
 
-		dp_catalog_hpd_config_intr(dp->catalog,
-			DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK,
-			true);
+	gndx = dp_priv->event_gndx;
+	while (dp_priv->event_pndx != gndx) {
+		todo = &dp_priv->event_list[gndx];
+		if (todo->event_id == event) {
+			todo->event_id = EV_NO_EVENT;	/* deleted */
+			todo->delay = 0;
+		}
+		gndx++;
+		gndx %= DP_EVENT_Q_MAX;
 	}
+	spin_unlock_irqrestore(&dp_priv->event_lock, flag);
 
-	return IRQ_HANDLED;
+	return 0;
 }
 
 static int dp_display_bind(struct device *dev, struct device *master,
@@ -178,7 +203,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
 		DRM_ERROR("Power client create failed\n");
 		goto end;
 	}
-
 end:
 	return rc;
 }
@@ -237,11 +261,9 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 
-	mutex_lock(&dp->dp_display.connect_mutex);
 	if ((hpd && dp->dp_display.is_connected) ||
 			(!hpd && !dp->dp_display.is_connected)) {
 		DRM_DEBUG_DP("HPD already %s\n", (hpd ? "on" : "off"));
-		mutex_unlock(&dp->dp_display.connect_mutex);
 		return 0;
 	}
 
@@ -250,7 +272,6 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 		dp->panel->video_test = false;
 
 	dp->dp_display.is_connected = hpd;
-	reinit_completion(&dp->notification_comp);
 
 	if (dp->dp_display.is_connected && dp->dp_display.encoder
 				&& !encoder_mode_set
@@ -263,13 +284,6 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 
 	dp_display_send_hpd_event(&dp->dp_display);
 
-	if (!wait_for_completion_timeout(&dp->notification_comp, HZ * 2)) {
-		pr_warn("%s timeout\n", hpd ? "connect" : "disconnect");
-		mutex_unlock(&dp->dp_display.connect_mutex);
-		return -EINVAL;
-	}
-
-	mutex_unlock(&dp->dp_display.connect_mutex);
 	return 0;
 }
 
@@ -278,23 +292,14 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	int rc = 0;
 	struct edid *edid;
 
-	if (dp->link->psm_enabled)
-		goto notify;
-
 	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
 
 	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
 	if (rc)
-		goto notify;
+		goto end;
 
 	dp_link_process_request(dp->link);
 
-	if (dp_display_is_sink_count_zero(dp)) {
-		DRM_DEBUG_DP("no downstream devices connected\n");
-		rc = -EINVAL;
-		goto end;
-	}
-
 	edid = dp->panel->edid;
 
 	dp->audio_supported = drm_detect_monitor_audio(edid);
@@ -302,8 +307,15 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 	dp->dp_display.max_pclk_khz = DP_MAX_PIXEL_CLK_KHZ;
 	dp->dp_display.max_dp_lanes = dp->parser->max_dp_lanes;
-notify:
-	dp_display_send_hpd_notification(dp, true);
+
+	rc = dp_ctrl_on_link(dp->ctrl);
+	if (rc) {
+		DRM_ERROR("failed to complete DP link training\n");
+		goto end;
+	}
+
+	dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+
 
 end:
 	return rc;
@@ -327,23 +339,6 @@ static void dp_display_host_init(struct dp_display_private *dp)
 	dp->core_initialized = true;
 }
 
-static void dp_display_host_deinit(struct dp_display_private *dp)
-{
-	if (!dp->core_initialized) {
-		DRM_DEBUG_DP("DP core already off\n");
-		return;
-	}
-
-	dp->core_initialized = false;
-}
-
-static void dp_display_process_hpd_low(struct dp_display_private *dp)
-{
-	dp_display_send_hpd_notification(dp, false);
-
-	dp_aux_deinit(dp->aux);
-}
-
 static int dp_display_usbpd_configure_cb(struct device *dev)
 {
 	int rc = 0;
@@ -364,18 +359,16 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 
 	dp_display_host_init(dp);
 
-	if (dp->usbpd->hpd_high)
-		dp_display_process_hpd_high(dp);
+	/*
+	 * set sink to normal operation mode -- D0
+	 * before dpcd read
+	 */
+	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
+	rc = dp_display_process_hpd_high(dp);
 end:
 	return rc;
 }
 
-static void dp_display_clean(struct dp_display_private *dp)
-{
-	dp_ctrl_push_idle(dp->ctrl);
-	dp_ctrl_off(dp->ctrl);
-}
-
 static int dp_display_usbpd_disconnect_cb(struct device *dev)
 {
 	int rc = 0;
@@ -383,16 +376,8 @@ static int dp_display_usbpd_disconnect_cb(struct device *dev)
 
 	dp = dev_get_drvdata(dev);
 
-	rc = dp_display_send_hpd_notification(dp, false);
-
-	/* if cable is disconnected, reset psm_enabled flag */
-	if (!dp->usbpd->alt_mode_cfg_done)
-		dp->link->psm_enabled = false;
-
-	if ((rc < 0) && dp->power_on)
-		dp_display_clean(dp);
+	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
-	dp_display_host_deinit(dp);
 	return rc;
 }
 
@@ -407,11 +392,14 @@ static void dp_display_handle_video_request(struct dp_display_private *dp)
 	}
 }
 
-static int dp_display_handle_hpd_irq(struct dp_display_private *dp)
+static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 {
-	if (dp->link->sink_request & DS_PORT_STATUS_CHANGED) {
-		dp_display_send_hpd_notification(dp, false);
+	u32 sink_request;
 
+	sink_request = dp->link->sink_request;
+
+	if (sink_request & DS_PORT_STATUS_CHANGED) {
+		dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 		if (dp_display_is_sink_count_zero(dp)) {
 			DRM_DEBUG_DP("sink count is zero, nothing to do\n");
 			return 0;
@@ -422,7 +410,8 @@ static int dp_display_handle_hpd_irq(struct dp_display_private *dp)
 
 	dp_ctrl_handle_sink_request(dp->ctrl);
 
-	dp_display_handle_video_request(dp);
+	if (dp->link->sink_request & DP_TEST_LINK_VIDEO_PATTERN)
+		dp_display_handle_video_request(dp);
 
 	return 0;
 }
@@ -443,27 +432,152 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -ENODEV;
 	}
 
-	if (dp->usbpd->hpd_irq) {
-		dp->hpd_irq_on = true;
+	/* check for any test request issued by sink */
+	rc = dp_link_process_request(dp->link);
+	if (!rc)
+		dp_display_handle_irq_hpd(dp);
 
-		rc = dp_link_process_request(dp->link);
-		/* check for any test request issued by sink */
-		if (!rc)
-			dp_display_handle_hpd_irq(dp);
+	return rc;
+}
 
-		dp->hpd_irq_on = false;
-		goto end;
+static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
+{
+	struct dp_usbpd *hpd = dp->usbpd;
+	u32 state;
+	int ret;
+
+	if (!hpd)
+		return 0;
+
+	mutex_lock(&dp->event_mutex);
+
+	state =  atomic_read(&dp->hpd_state);
+	if (state == ST_CONNECT_PENDING || state == ST_CONNECTED) {
+		mutex_unlock(&dp->event_mutex);
+		return 0;
 	}
 
-	if (!dp->usbpd->hpd_high) {
-		dp_display_process_hpd_low(dp);
-		goto end;
+	if (state == ST_DISCONNECT_PENDING) {
+		/* wait until ST_DISCONNECTED */
+		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
+		mutex_unlock(&dp->event_mutex);
+		return 0;
 	}
 
-	if (dp->usbpd->alt_mode_cfg_done)
-		dp_display_process_hpd_high(dp);
-end:
-	return rc;
+	atomic_set(&dp->hpd_state, ST_CONNECT_PENDING);
+
+	hpd->hpd_high = 1;
+
+	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
+	if (ret) {	/* failed */
+		hpd->hpd_high = 0;
+		atomic_set(&dp->hpd_state, ST_DISCONNECTED);
+	}
+
+	/* start sanity checking */
+	dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, 50);
+
+	mutex_unlock(&dp->event_mutex);
+
+	/* uevent will complete connection part */
+	return 0;
+};
+
+static int dp_display_enable(struct dp_display_private *dp, u32 data);
+static int dp_display_disable(struct dp_display_private *dp, u32 data);
+
+static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
+{
+	u32 state;
+
+	mutex_lock(&dp->event_mutex);
+
+	state =  atomic_read(&dp->hpd_state);
+	if (state == ST_CONNECT_PENDING) {
+		dp_display_enable(dp, 0);
+		atomic_set(&dp->hpd_state, ST_CONNECTED);
+	}
+
+	mutex_unlock(&dp->event_mutex);
+
+	return 0;
+}
+
+static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
+{
+	struct dp_usbpd *hpd = dp->usbpd;
+	u32 state;
+
+	if (!hpd)
+		return 0;
+
+	mutex_lock(&dp->event_mutex);
+
+	state = atomic_read(&dp->hpd_state);
+	if (state == ST_DISCONNECT_PENDING || state == ST_DISCONNECTED) {
+		mutex_unlock(&dp->event_mutex);
+		return 0;
+	}
+
+	if (state == ST_CONNECT_PENDING) {
+		/* wait until CONNECTED */
+		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 1); /* delay = 1 */
+		mutex_unlock(&dp->event_mutex);
+		return 0;
+	}
+
+	atomic_set(&dp->hpd_state, ST_DISCONNECT_PENDING);
+
+	/* disable HPD plug interrupt until disconnect is done */
+	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK
+				| DP_DP_IRQ_HPD_INT_MASK, false);
+
+	hpd->hpd_high = 0;
+
+	/*
+	 * We don't need separate work for disconnect as
+	 * connect/attention interrupts are disabled
+	 */
+	dp_display_usbpd_disconnect_cb(&dp->pdev->dev);
+
+	/* start sanity checking */
+	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, 50);
+
+	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
+					DP_DP_IRQ_HPD_INT_MASK, true);
+
+	/* uevent will complete disconnection part */
+	mutex_unlock(&dp->event_mutex);
+	return 0;
+}
+
+static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data)
+{
+	u32 state;
+
+	mutex_lock(&dp->event_mutex);
+
+	state =  atomic_read(&dp->hpd_state);
+	if (state == ST_DISCONNECT_PENDING) {
+		dp_display_disable(dp, 0);
+		atomic_set(&dp->hpd_state, ST_DISCONNECTED);
+	}
+
+	mutex_unlock(&dp->event_mutex);
+
+	return 0;
+}
+
+static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
+{
+	/* irq_hpd can happen at either connected or disconnected state */
+	mutex_lock(&dp->event_mutex);
+
+	dp_display_usbpd_attention_cb(&dp->pdev->dev);
+
+	mutex_unlock(&dp->event_mutex);
+
+	return 0;
 }
 
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
@@ -599,106 +713,37 @@ static int dp_display_prepare(struct msm_dp *dp)
 	return 0;
 }
 
-static void dp_display_dump(struct msm_dp *dp_display)
-{
-	struct dp_display_private *dp;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-
-	dp_panel_dump_regs(dp->panel);
-}
-
-static int dp_display_enable(struct msm_dp *dp_display)
+static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
-	struct dp_display_private *dp;
-	bool dump_dp = false;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
 	if (dp->power_on) {
 		DRM_DEBUG_DP("Link already setup, return\n");
 		return 0;
 	}
 
-	rc = dp_ctrl_on(dp->ctrl);
+	rc = dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		dp->power_on = true;
 
-	if (dump_dp != false)
-		dp_display_dump(dp_display);
-
 	return rc;
 }
 
 static int dp_display_post_enable(struct msm_dp *dp_display)
 {
-	struct dp_display_private *dp;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-
-	complete_all(&dp->notification_comp);
-	return 0;
-}
-
-static int dp_display_pre_disable(struct msm_dp *dp_display)
-{
-	struct dp_display_private *dp;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-
-	if (dp->usbpd->alt_mode_cfg_done)
-		dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-
-	dp_ctrl_push_idle(dp->ctrl);
 	return 0;
 }
 
-static int dp_display_disable(struct msm_dp *dp_display)
+static int dp_display_disable(struct dp_display_private *dp, u32 data)
 {
-	struct dp_display_private *dp;
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-
-	if (!dp->power_on || !dp->core_initialized)
+	if (!dp->power_on)
 		return -EINVAL;
 
 	dp_ctrl_off(dp->ctrl);
 
-	dp->power_on = false;
-
-	complete_all(&dp->notification_comp);
-	return 0;
-}
-
-int dp_display_request_irq(struct msm_dp *dp_display)
-{
-	int rc = 0;
-	struct dp_display_private *dp;
-
-	if (!dp_display) {
-		DRM_ERROR("invalid input\n");
-		return -EINVAL;
-	}
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
-
-	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
-	if (dp->irq < 0) {
-		rc = dp->irq;
-		DRM_ERROR("failed to get irq: %d\n", rc);
-		return rc;
-	}
+	dp->core_initialized = false;
 
-	rc = devm_request_threaded_irq(&dp->pdev->dev, dp->irq,
-		dp_display_irq, dp_display_hpd_isr_work,
-		IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
-	if (rc < 0) {
-		DRM_ERROR("failed to request IRQ%u: %d\n",
-				dp->irq, rc);
-		return rc;
-	}
-	disable_irq(dp->irq);
+	dp->power_on = false;
 
 	return 0;
 }
@@ -783,6 +828,189 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
 		dp_display->link->test_video.test_bit_depth);
 }
 
+static void dp_display_config_hpd(struct dp_display_private *dp)
+{
+
+	dp_display_host_init(dp);
+	dp_catalog_ctrl_hpd_config(dp->catalog);
+
+	/* Enable interrupt first time
+	 * we are leaving dp clocks on during disconnect
+	 * and never disable interrupt
+	 */
+	enable_irq(dp->irq);
+}
+
+static int hpd_event_thread(void *data)
+{
+	struct dp_display_private *dp_priv;
+	unsigned long flag;
+	struct dp_event *todo;
+	int timeout_mode = 0;
+
+	dp_priv = (struct dp_display_private *)data;
+
+	while (1) {
+		if (timeout_mode) {
+			wait_event_timeout(dp_priv->event_q,
+				(dp_priv->event_pndx == dp_priv->event_gndx),
+						EVENT_TIMEOUT);
+		} else {
+			wait_event_timeout(dp_priv->event_q,
+				(dp_priv->event_pndx != dp_priv->event_gndx),
+						EVENT_TIMEOUT);
+		}
+		spin_lock_irqsave(&dp_priv->event_lock, flag);
+		todo = &dp_priv->event_list[dp_priv->event_gndx];
+		if (todo->delay) {
+			struct dp_event *todo_next;
+
+			dp_priv->event_gndx++;
+			dp_priv->event_gndx %= DP_EVENT_Q_MAX;
+
+			/* re enter delay event into q */
+			todo_next = &dp_priv->event_list[dp_priv->event_pndx++];
+			dp_priv->event_pndx %= DP_EVENT_Q_MAX;
+			todo_next->event_id = todo->event_id;
+			todo_next->data = todo->data;
+			todo_next->delay = todo->delay - 1;
+
+			/* clean up older event */
+			todo->event_id = EV_NO_EVENT;
+			todo->delay = 0;
+
+			/* switch to timeout mode */
+			timeout_mode = 1;
+			spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+			continue;
+		}
+
+		/* timeout with no events in q */
+		if (dp_priv->event_pndx == dp_priv->event_gndx) {
+			spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+			continue;
+		}
+
+		dp_priv->event_gndx++;
+		dp_priv->event_gndx %= DP_EVENT_Q_MAX;
+		timeout_mode = 0;
+		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
+
+		switch (todo->event_id) {
+		case EV_HPD_INIT_SETUP:
+			dp_display_config_hpd(dp_priv);
+			break;
+		case EV_HPD_PLUG_INT:
+			dp_hpd_plug_handle(dp_priv, todo->data);
+			break;
+		case EV_HPD_UNPLUG_INT:
+			dp_hpd_unplug_handle(dp_priv, todo->data);
+			break;
+		case EV_IRQ_HPD_INT:
+			dp_irq_hpd_handle(dp_priv, todo->data);
+			break;
+		case EV_HPD_REPLUG_INT:
+			/* do nothing */
+			break;
+		case EV_USER_NOTIFICATION:
+			dp_display_send_hpd_notification(dp_priv,
+						todo->data);
+			break;
+		case EV_CONNECT_PENDING_TIMEOUT:
+			dp_connect_pending_timeout(dp_priv,
+						todo->data);
+			break;
+		case EV_DISCONNECT_PENDING_TIMEOUT:
+			dp_disconnect_pending_timeout(dp_priv,
+						todo->data);
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
+{
+	init_waitqueue_head(&dp_priv->event_q);
+	spin_lock_init(&dp_priv->event_lock);
+
+	kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
+}
+
+static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
+{
+	struct dp_display_private *dp = dev_id;
+	irqreturn_t ret = IRQ_HANDLED;
+	u32 hpd_isr_status;
+
+	if (!dp) {
+		DRM_ERROR("invalid data\n");
+		return IRQ_NONE;
+	}
+
+	hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
+
+	if (hpd_isr_status & 0x0F) {
+		/* hpd related interrupts */
+		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK ||
+			hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
+			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		}
+
+		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+
+		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK)
+			dp_add_event(dp, EV_HPD_REPLUG_INT, 0, 0);
+
+		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
+			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+	}
+
+	/* DP controller isr */
+	dp_ctrl_isr(dp->ctrl);
+
+	/* DP aux isr */
+	dp_aux_isr(dp->aux);
+
+	return ret;
+}
+
+int dp_display_request_irq(struct msm_dp *dp_display)
+{
+	int rc = 0;
+	struct dp_display_private *dp;
+
+	if (!dp_display) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
+	if (dp->irq < 0) {
+		rc = dp->irq;
+		DRM_ERROR("failed to get irq: %d\n", rc);
+		return rc;
+	}
+
+	rc = devm_request_irq(&dp->pdev->dev, dp->irq,
+			dp_display_irq_handler,
+			IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
+	if (rc < 0) {
+		DRM_ERROR("failed to request IRQ%u: %d\n",
+				dp->irq, rc);
+		return rc;
+	}
+	disable_irq(dp->irq);
+
+	return 0;
+}
+
 static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -797,8 +1025,6 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
-	init_completion(&dp->notification_comp);
-
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 
@@ -810,7 +1036,7 @@ static int dp_display_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dp);
 
-	mutex_init(&dp->dp_display.connect_mutex);
+	mutex_init(&dp->event_mutex);
 	g_dp_display = &dp->dp_display;
 
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
@@ -861,26 +1087,6 @@ void __exit msm_dp_unregister(void)
 	platform_driver_unregister(&dp_display_driver);
 }
 
-static void dp_display_config_hpd_work(struct work_struct *work)
-{
-	struct dp_display_private *dp;
-	struct delayed_work *dw = to_delayed_work(work);
-
-	dp = container_of(dw, struct dp_display_private, config_hpd_work);
-
-	dp_display_host_init(dp);
-	dp_catalog_ctrl_hpd_config(dp->catalog);
-
-	/* set default to 0 */
-	atomic_set(&dp->hpd_isr_status, 0);
-
-	/* Enable interrupt first time
-	 * we are leaving dp clocks on during disconnect
-	 * and never disable interrupt
-	 */
-	enable_irq(dp->irq);
-}
-
 void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 {
 	struct dp_display_private *dp;
@@ -890,8 +1096,9 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	INIT_DELAYED_WORK(&dp->config_hpd_work, dp_display_config_hpd_work);
-	queue_delayed_work(system_wq, &dp->config_hpd_work, HZ * 10);
+	dp_hpd_event_setup(dp);
+
+	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
 }
 
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
@@ -938,54 +1145,74 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		return -EINVAL;
 	}
 
+	mutex_lock(&dp_display->event_mutex);
+
 	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
+		mutex_unlock(&dp_display->event_mutex);
 		return rc;
 	}
 
 	rc = dp_display_prepare(dp);
 	if (rc) {
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
+		mutex_unlock(&dp_display->event_mutex);
 		return rc;
 	}
 
-	rc = dp_display_enable(dp);
-	if (rc) {
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
-		dp_display_unprepare(dp);
-		return rc;
-	}
+	dp_display_enable(dp_display, 0);
 
 	rc = dp_display_post_enable(dp);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		dp_display_disable(dp);
+		dp_display_disable(dp_display, 0);
 		dp_display_unprepare(dp);
 	}
+
+	dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
+
+	/* completed connection */
+	atomic_set(&dp_display->hpd_state, ST_CONNECTED);
+
+	mutex_unlock(&dp_display->event_mutex);
+
 	return rc;
 }
 
+int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
+{
+	struct dp_display_private *dp_display;
+
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
+
+	dp_ctrl_push_idle(dp_display->ctrl);
+
+	return 0;
+}
+
 int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 {
 	int rc = 0;
+	struct dp_display_private *dp_display;
 
-	rc = dp_display_pre_disable(dp);
-	if (rc) {
-		DRM_ERROR("DP display pre disable failed, rc=%d\n", rc);
-		return rc;
-	}
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
-	rc = dp_display_disable(dp);
-	if (rc) {
-		DRM_ERROR("DP display disable failed, rc=%d\n", rc);
-		return rc;
-	}
+	mutex_lock(&dp_display->event_mutex);
+
+	dp_display_disable(dp_display, 0);
 
 	rc = dp_display_unprepare(dp);
 	if (rc)
 		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
 
+
+	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
+
+	/* completed disconnection */
+	atomic_set(&dp_display->hpd_state, ST_DISCONNECTED);
+
+	mutex_unlock(&dp_display->event_mutex);
 	return rc;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 4c53ed55d1cc..2f2d1279dfc6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -13,7 +13,6 @@ struct msm_dp {
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	bool is_connected;
-	struct mutex connect_mutex;
 	u32 max_pclk_khz;
 	u32 max_dp_lanes;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index e58906f4ae1e..764f4b81017e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -58,7 +58,6 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 	if (!dp_mode)
 		return 0;
 
-	mutex_lock(&dp->connect_mutex);
 	/* pluggable case assumes EDID is read when HPD */
 	if (dp->is_connected) {
 		/*
@@ -71,7 +70,6 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 		if (rc <= 0) {
 			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
 			kfree(dp_mode);
-			mutex_unlock(&dp->connect_mutex);
 			return rc;
 		}
 		if (dp_mode->drm_mode.clock) { /* valid DP mode */
@@ -83,7 +81,6 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 				       drm_mode.hdisplay,
 				       drm_mode.vdisplay);
 				kfree(dp_mode);
-				mutex_unlock(&dp->connect_mutex);
 				return 0;
 			}
 			drm_mode_probed_add(connector, m);
@@ -91,7 +88,6 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 	} else {
 		DRM_DEBUG_DP("No sink connected\n");
 	}
-	mutex_unlock(&dp->connect_mutex);
 	kfree(dp_mode);
 	return rc;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
index 5b08ce580702..5b8fe32022b5 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
@@ -24,7 +24,7 @@ struct dp_hpd_private {
 	struct dp_usbpd dp_usbpd;
 };
 
-static int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
+int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
 {
 	int rc = 0;
 	struct dp_hpd_private *hpd_priv;
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
index c0178524bec7..5bc5bb64680f 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.h
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.h
@@ -75,5 +75,6 @@ struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb);
 
 int dp_hpd_register(struct dp_usbpd *dp_usbpd);
 void dp_hpd_unregister(struct dp_usbpd *dp_usbpd);
+int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd);
 
 #endif /* _DP_HPD_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 7400a7ba45f8..5110fc8ccfae 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -38,7 +38,6 @@ struct dp_link_private {
 	struct dp_link dp_link;
 
 	struct dp_link_request request;
-	struct mutex test_response_mutex;
 	struct mutex psm_mutex;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 };
@@ -580,17 +579,18 @@ static int dp_link_parse_phy_test_params(struct dp_link_private *link)
 		return rlen;
 	}
 
-	link->dp_link.phy_params.phy_test_pattern_sel = data;
+	link->dp_link.phy_params.phy_test_pattern_sel = data & 0x07;
 
 	DRM_DEBUG_DP("phy_test_pattern_sel = 0x%x\n", data);
 
 	switch (data) {
-	case DP_LINK_QUAL_PATTERN_DISABLE:
-	case DP_LINK_QUAL_PATTERN_D10_2:
-	case DP_LINK_QUAL_PATTERN_ERROR_RATE:
-	case DP_LINK_QUAL_PATTERN_PRBS7:
-	case DP_LINK_QUAL_PATTERN_80BIT_CUSTOM:
-	case DP_LINK_QUAL_PATTERN_HBR2_EYE:
+	case DP_PHY_TEST_PATTERN_SEL_MASK:
+	case DP_PHY_TEST_PATTERN_NONE:
+	case DP_PHY_TEST_PATTERN_D10_2:
+	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
+	case DP_PHY_TEST_PATTERN_PRBS7:
+	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
+	case DP_PHY_TEST_PATTERN_CP2520:
 		return 0;
 	default:
 		return -EINVAL;
@@ -661,7 +661,6 @@ static int dp_link_parse_request(struct dp_link_private *link)
 
 	DRM_DEBUG_DP("Test:(0x%x) requested\n", data);
 	link->request.test_requested = data;
-
 	if (link->request.test_requested == DP_TEST_LINK_PHY_TEST_PATTERN) {
 		ret = dp_link_parse_phy_test_params(link);
 		if (ret)
@@ -789,10 +788,8 @@ bool dp_link_send_test_response(struct dp_link *dp_link)
 
 	link = container_of(dp_link, struct dp_link_private, dp_link);
 
-	mutex_lock(&link->test_response_mutex);
 	ret = drm_dp_dpcd_writeb(link->aux, DP_TEST_RESPONSE,
 			dp_link->test_response);
-	mutex_unlock(&link->test_response_mutex);
 
 	return ret == 1;
 }
@@ -1028,11 +1025,9 @@ int dp_link_process_request(struct dp_link *dp_link)
 
 	link = container_of(dp_link, struct dp_link_private, dp_link);
 
-	mutex_lock(&link->test_response_mutex);
 	dp_link_reset_data(link);
 
 	dp_link_parse_sink_status_field(link);
-	mutex_unlock(&link->test_response_mutex);
 
 	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
 		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
@@ -1206,7 +1201,6 @@ struct dp_link *dp_link_get(struct device *dev, struct drm_dp_aux *aux)
 	link->dev   = dev;
 	link->aux   = aux;
 
-	mutex_init(&link->test_response_mutex);
 	mutex_init(&link->psm_mutex);
 	dp_link = &link->dp_link;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 5ac4b017da8f..7cdf37c525d8 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -8,8 +8,6 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 
-#define DP_MAX_DS_PORT_COUNT 1
-
 struct dp_panel_private {
 	struct device *dev;
 	struct dp_panel dp_panel;
@@ -23,26 +21,32 @@ struct dp_panel_private {
 static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 {
 	int rc = 0;
-	size_t rlen;
+	size_t len;
+	ssize_t rlen;
 	struct dp_panel_private *panel;
 	struct dp_link_info *link_info;
 	u8 *dpcd, major = 0, minor = 0, temp;
-	u32 dfp_count = 0, offset = DP_DPCD_REV;
+	u32 offset = DP_DPCD_REV;
 
 	dpcd = dp_panel->dpcd;
 
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 	link_info = &dp_panel->link_info;
 
-	rlen = drm_dp_dpcd_read(panel->aux,
-				DP_TRAINING_AUX_RD_INTERVAL, &temp, 1);
-	if (rlen < 0) {
-		DRM_ERROR("err reading DP_TRAINING_AUX_RD_INTERVAL,rlen=%zd\n",
-				rlen);
-		rc = -EINVAL;
+	rlen = drm_dp_dpcd_read(panel->aux, offset,
+			dpcd, (DP_RECEIVER_CAP_SIZE + 1));
+	if (rlen < (DP_RECEIVER_CAP_SIZE + 1)) {
+		DRM_ERROR("dpcd read failed, rlen=%zd\n", rlen);
+		if (rlen == -ETIMEDOUT)
+			rc = rlen;
+		else
+			rc = -EINVAL;
+
 		goto end;
 	}
 
+	temp = dpcd[DP_TRAINING_AUX_RD_INTERVAL];
+
 	/* check for EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT */
 	if (temp & BIT(7)) {
 		DRM_DEBUG_DP("using EXTENDED_RECEIVER_CAPABILITY_FIELD\n");
@@ -61,9 +65,6 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 		goto end;
 	}
 
-	print_hex_dump(KERN_DEBUG, "[drm-dp] SINK DPCD: ",
-		DUMP_PREFIX_NONE, 8, 1, dp_panel->dpcd, rlen, false);
-
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
@@ -85,14 +86,23 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 	if (drm_dp_enhanced_frame_cap(dpcd))
 		link_info->capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
 
-	dfp_count = dpcd[DP_DOWN_STREAM_PORT_COUNT] &
-						DP_DOWN_STREAM_PORT_COUNT;
+	dp_panel->dfp_present = dpcd[DP_DOWNSTREAMPORT_PRESENT];
+	dp_panel->dfp_present &= DP_DWN_STRM_PORT_PRESENT;
 
-	if (dfp_count > DP_MAX_DS_PORT_COUNT) {
-		DRM_ERROR("DS port count %d greater that max (%d) supported\n",
-			dfp_count, DP_MAX_DS_PORT_COUNT);
-		return -EINVAL;
+	if (dp_panel->dfp_present && (dpcd[DP_DPCD_REV] > 0x10)) {
+		dp_panel->ds_port_cnt = dpcd[DP_DOWN_STREAM_PORT_COUNT];
+		dp_panel->ds_port_cnt &= DP_PORT_COUNT_MASK;
+		len = DP_DOWNSTREAM_PORTS * DP_DOWNSTREAM_CAP_SIZE;
+
+		rlen = drm_dp_dpcd_read(panel->aux,
+			DP_DOWNSTREAM_PORT_0, dp_panel->ds_cap_info, len);
+		if (rlen < len) {
+			DRM_ERROR("ds port status failed, rlen=%zd\n", rlen);
+			rc = -EINVAL;
+			goto end;
+		}
 	}
+
 end:
 	return rc;
 }
@@ -185,6 +195,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	struct drm_connector *connector)
 {
 	int rc = 0, bw_code;
+	int rlen, count;
 	struct dp_panel_private *panel;
 
 	if (!dp_panel || !connector) {
@@ -202,11 +213,19 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 		DRM_ERROR("read dpcd failed %d\n", rc);
 		return rc;
 	}
-	rc = drm_dp_read_desc(panel->aux, &dp_panel->desc,
-			      drm_dp_is_branch(dp_panel->dpcd));
-	if (rc) {
-		DRM_ERROR("read sink/branch descriptor failed %d\n", rc);
-		return rc;
+
+	if (dp_panel->dfp_present) {
+		rlen = drm_dp_dpcd_read(panel->aux, DP_SINK_COUNT,
+				&count, 1);
+		if (rlen == 1) {
+			count = DP_GET_SINK_COUNT(count);
+			if (!count) {
+				DRM_ERROR("no downstream ports connected\n");
+				panel->link->sink_count = 0;
+				rc = -ENOTCONN;
+				goto end;
+			}
+		}
 	}
 
 	kfree(dp_panel->edid);
@@ -216,7 +235,12 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 					      &panel->aux->ddc);
 	if (!dp_panel->edid) {
 		DRM_ERROR("panel edid read failed\n");
-		return -EINVAL;
+
+		/* fail safe edid */
+		mutex_lock(&connector->dev->mode_config.mutex);
+		if (drm_add_modes_noedid(connector, 640, 480))
+			drm_set_preferred_mode(connector, 640, 480);
+		mutex_unlock(&connector->dev->mode_config.mutex);
 	}
 
 	if (panel->aux_cfg_update_done) {
@@ -231,8 +255,8 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 		}
 		panel->aux_cfg_update_done = false;
 	}
-
-	return 0;
+end:
+	return rc;
 }
 
 u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index f6f417eef2e9..9023e5bb4b8b 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -14,8 +14,10 @@
 
 struct edid;
 
-#define DP_MAX_DOWNSTREAM_PORTS 0x10
-#define DPRX_EXTENDED_DPCD_FIELD 0x2200
+#define DPRX_EXTENDED_DPCD_FIELD	0x2200
+
+#define DP_DOWNSTREAM_PORTS		4
+#define DP_DOWNSTREAM_CAP_SIZE		4
 
 struct dp_display_mode {
 	struct drm_display_mode drm_mode;
@@ -35,6 +37,9 @@ struct dp_panel_in {
 struct dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE + 1];
+	u8 ds_cap_info[DP_DOWNSTREAM_PORTS * DP_DOWNSTREAM_CAP_SIZE];
+	u32 ds_port_cnt;
+	u32 dfp_present;
 
 	struct dp_link_info link_info;
 	struct drm_dp_desc desc;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 558eaf7ce656..641f2bccf3bf 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -103,11 +103,12 @@ static inline bool dp_parser_check_prefix(const char *clk_prefix,
 static int dp_parser_init_clk_data(struct dp_parser *parser)
 {
 	int num_clk, i, rc;
-	int core_clk_count = 0, ctrl_clk_count = 0;
+	int core_clk_count = 0, ctrl_clk_count = 0, stream_clk_count = 0;
 	const char *clk_name;
 	struct device *dev = &parser->pdev->dev;
 	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
 	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
+	struct dss_module_power *stream_power = &parser->mp[DP_STREAM_PM];
 
 	num_clk = of_property_count_strings(dev->of_node, "clock-names");
 	if (num_clk <= 0) {
@@ -128,7 +129,7 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 			ctrl_clk_count++;
 
 		if (dp_parser_check_prefix("stream", clk_name))
-			ctrl_clk_count++;
+			stream_clk_count++;
 	}
 
 	/* Initialize the CORE power module */
@@ -159,6 +160,21 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
 		return -EINVAL;
 	}
 
+	/* Initialize the STREAM power module */
+	if (stream_clk_count == 0) {
+		DRM_ERROR("no stream (pixel) clocks are defined\n");
+		return -EINVAL;
+	}
+
+	stream_power->num_clk = stream_clk_count;
+	stream_power->clk_config = devm_kzalloc(dev,
+			sizeof(struct dss_clk) * stream_power->num_clk,
+			GFP_KERNEL);
+	if (!stream_power->clk_config) {
+		stream_power->num_clk = 0;
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -166,15 +182,13 @@ static int dp_parser_clock(struct dp_parser *parser)
 {
 	int rc = 0, i = 0;
 	int num_clk = 0;
-	int core_clk_index = 0, ctrl_clk_index = 0;
-	int core_clk_count = 0, ctrl_clk_count = 0;
+	int core_clk_index = 0, ctrl_clk_index = 0, stream_clk_index = 0;
+	int core_clk_count = 0, ctrl_clk_count = 0, stream_clk_count = 0;
 	const char *clk_name;
 	struct device *dev = &parser->pdev->dev;
 	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
 	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
-
-	core_power = &parser->mp[DP_CORE_PM];
-	ctrl_power = &parser->mp[DP_CTRL_PM];
+	struct dss_module_power *stream_power = &parser->mp[DP_STREAM_PM];
 
 	rc =  dp_parser_init_clk_data(parser);
 	if (rc) {
@@ -184,8 +198,9 @@ static int dp_parser_clock(struct dp_parser *parser)
 
 	core_clk_count = core_power->num_clk;
 	ctrl_clk_count = ctrl_power->num_clk;
+	stream_clk_count = stream_power->num_clk;
 
-	num_clk = core_clk_count + ctrl_clk_count;
+	num_clk = core_clk_count + ctrl_clk_count + stream_clk_count;
 
 	for (i = 0; i < num_clk; i++) {
 		rc = of_property_read_string_index(dev->of_node, "clock-names",
@@ -201,8 +216,14 @@ static int dp_parser_clock(struct dp_parser *parser)
 			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
 			clk->type = DSS_CLK_AHB;
 			core_clk_index++;
-		} else if ((dp_parser_check_prefix("ctrl", clk_name) ||
-			   dp_parser_check_prefix("stream", clk_name))  &&
+		} else if (dp_parser_check_prefix("stream", clk_name) &&
+				stream_clk_index < stream_clk_count) {
+			struct dss_clk *clk =
+				&stream_power->clk_config[stream_clk_index];
+			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			clk->type = DSS_CLK_PCLK;
+			stream_clk_index++;
+		} else if (dp_parser_check_prefix("ctrl", clk_name) &&
 			   ctrl_clk_index < ctrl_clk_count) {
 			struct dss_clk *clk =
 				&ctrl_power->clk_config[ctrl_clk_index];
@@ -210,9 +231,7 @@ static int dp_parser_clock(struct dp_parser *parser)
 			ctrl_clk_index++;
 
 			if (!strncmp(clk_name, "ctrl_link",
-					strlen("ctrl_link")) ||
-					!strncmp(clk_name, "stream_pixel",
-					strlen("ctrl_pixel")))
+					strlen("ctrl_link")))
 				clk->type = DSS_CLK_PCLK;
 			else
 				clk->type = DSS_CLK_AHB;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index aa0380b6a280..841e776124c4 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -19,6 +19,7 @@
 enum dp_pm_type {
 	DP_CORE_PM,
 	DP_CTRL_PM,
+	DP_STREAM_PM,
 	DP_PHY_PM,
 	DP_MAX_PM
 };
@@ -33,6 +34,7 @@ static inline const char *dp_parser_pm_name(enum dp_pm_type module)
 	switch (module) {
 	case DP_CORE_PM:	return "DP_CORE_PM";
 	case DP_CTRL_PM:	return "DP_CTRL_PM";
+	case DP_STREAM_PM:	return "DP_STREAM_PM";
 	case DP_PHY_PM:		return "DP_PHY_PM";
 	default:		return "???";
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 8b0a276d34a4..34fdb2e5d644 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -95,11 +95,12 @@ static int dp_power_regulator_init(struct dp_power_private *power)
 static int dp_power_clk_init(struct dp_power_private *power)
 {
 	int rc = 0;
-	struct dss_module_power *core, *ctrl;
+	struct dss_module_power *core, *ctrl, *stream;
 	struct device *dev = &power->pdev->dev;
 
 	core = &power->parser->mp[DP_CORE_PM];
 	ctrl = &power->parser->mp[DP_CTRL_PM];
+	stream = &power->parser->mp[DP_STREAM_PM];
 
 	if (power->parser->pll && power->parser->pll->get_provider) {
 		rc = power->parser->pll->get_provider(power->parser->pll,
@@ -126,21 +127,33 @@ static int dp_power_clk_init(struct dp_power_private *power)
 		return -ENODEV;
 	}
 
+	rc = msm_dss_get_clk(dev, stream->clk_config, stream->num_clk);
+	if (rc) {
+		DRM_ERROR("failed to get %s clk. err=%d\n",
+			dp_parser_pm_name(DP_CTRL_PM), rc);
+		msm_dss_put_clk(core->clk_config, core->num_clk);
+		return -ENODEV;
+	}
+
 	return 0;
 }
 
 static int dp_power_clk_deinit(struct dp_power_private *power)
 {
-	struct dss_module_power *core, *ctrl;
+	struct dss_module_power *core, *ctrl, *stream;
 
 	core = &power->parser->mp[DP_CORE_PM];
 	ctrl = &power->parser->mp[DP_CTRL_PM];
+	stream = &power->parser->mp[DP_STREAM_PM];
 
-	if (!core || !ctrl)
+	if (!core || !ctrl || !stream) {
+		DRM_ERROR("invalid power_data\n");
 		return -EINVAL;
+	}
 
 	msm_dss_put_clk(ctrl->clk_config, ctrl->num_clk);
 	msm_dss_put_clk(core->clk_config, core->num_clk);
+	msm_dss_put_clk(stream->clk_config, stream->num_clk);
 	return 0;
 }
 
@@ -167,6 +180,20 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
 	return 0;
 }
 
+int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type)
+{
+	if (pm_type == DP_CORE_PM)
+		return dp_power->core_clks_on;
+
+	if (pm_type == DP_CTRL_PM)
+		return dp_power->link_clks_on;
+
+	if (pm_type == DP_STREAM_PM)
+		return dp_power->stream_clks_on;
+
+	return 0;
+}
+
 int dp_power_clk_enable(struct dp_power *dp_power,
 		enum dp_pm_type pm_type, bool enable)
 {
@@ -175,7 +202,8 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
-	if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM) {
+	if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM &&
+			pm_type != DP_STREAM_PM) {
 		DRM_ERROR("unsupported power module: %s\n",
 				dp_parser_pm_name(pm_type));
 		return -EINVAL;
@@ -192,6 +220,11 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 			return 0;
 		}
 
+		if (pm_type == DP_STREAM_PM && dp_power->stream_clks_on) {
+			DRM_DEBUG_DP("pixel clks already enabled\n");
+			return 0;
+		}
+
 		if ((pm_type == DP_CTRL_PM) && (!dp_power->core_clks_on)) {
 			DRM_DEBUG_DP("Enable core clks before link clks\n");
 
@@ -215,13 +248,16 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 
 	if (pm_type == DP_CORE_PM)
 		dp_power->core_clks_on = enable;
+	else if (pm_type == DP_STREAM_PM)
+		dp_power->stream_clks_on = enable;
 	else
 		dp_power->link_clks_on = enable;
 
 	DRM_DEBUG_DP("%s clocks for %s\n",
 			enable ? "enable" : "disable",
 			dp_parser_pm_name(pm_type));
-	DRM_DEBUG_DP("link_clks:%s core_clks:%s\n",
+	DRM_DEBUG_DP("strem_clks:%s link_clks:%s core_clks:%s\n",
+		dp_power->stream_clks_on ? "on" : "off",
 		dp_power->link_clks_on ? "on" : "off",
 		dp_power->core_clks_on ? "on" : "off");
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 756341e290ed..5333a97d5c35 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -19,6 +19,7 @@
 struct dp_power {
 	bool core_clks_on;
 	bool link_clks_on;
+	bool stream_clks_on;
 };
 
 /**
@@ -43,6 +44,18 @@ int dp_power_init(struct dp_power *power, bool flip);
  */
 int dp_power_deinit(struct dp_power *power);
 
+/**
+ * dp_power_clk_status() - display controller clocks status
+ *
+ * @power: instance of power module
+ * @pm_type: type of pm, core/ctrl/phy
+ * return: status of power clocks
+ *
+ * This API return status of DP clocks
+ */
+
+int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type);
+
 /**
  * dp_power_clk_enable() - enable display controller clocks
  *
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 6b3e297e4e04..d8bc175246da 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -101,6 +101,7 @@
 #define REG_DP_MAINLINK_CTRL			(0x00000000)
 #define DP_MAINLINK_CTRL_ENABLE			(0x00000001)
 #define DP_MAINLINK_CTRL_RESET			(0x00000002)
+#define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER	(0x00000010)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b4b213e57f99..a0e3c0b8bd4e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -387,6 +387,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			 struct drm_encoder *encoder);
 int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
 int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
+int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
 void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
