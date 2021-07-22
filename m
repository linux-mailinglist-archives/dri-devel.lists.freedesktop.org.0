Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 018053D1C13
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 04:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314EA6EE97;
	Thu, 22 Jul 2021 02:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08B96EE94
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:50:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626922259; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Y+/wkHthXmZDLajwAWsHJiH7R9xdjpqHvT4l4LMLXIA=;
 b=pRJAoOQtasTUfkjYCZfbTMR3hMrMMhSsc0qSsheP/LZvO36HDd0SaqD8QVcdfsLt9RJ4Gi88
 h8LOkGoSL+LO7rG2BO/1f4eF4vUyFxKvG9uE3VIVlHA0Lovd5rKaDtopdqYffBtvTKbFIJkg
 BhOJn/p9Hor6dOPZYeNtEaMjZxk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60f8dd10290ea35ee63745c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 02:50:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 54157C43217; Thu, 22 Jul 2021 02:50:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D29CFC43460;
 Thu, 22 Jul 2021 02:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D29CFC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm/dsi: add support for dsi test pattern generator
Date: Wed, 21 Jul 2021 19:50:32 -0700
Message-Id: <1626922232-29105-2-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org>
References: <1626922232-29105-1-git-send-email-abhinavk@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During board bringups its useful to have a DSI test pattern
generator to isolate a DPU vs a DSI issue and focus on the relevant
hardware block.

To facilitate this, add an API which triggers the DSI controller
test pattern. The expected output is a rectangular checkered pattern.

This has been validated on a single DSI video mode panel by calling it
right after drm_panel_enable() which is also the ideal location to use
this as the DSI host and the panel have been initialized by then.

Further validation on dual DSI and command mode panel is pending.
If there are any fix ups needed for those, it shall be applied on top
of this change.

Changes in v2:
 - generate the new dsi.xml.h and update the bitfield names

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 61 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 13 ++++++++
 3 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 9b8e9b0..663ccbd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -84,6 +84,7 @@ void msm_dsi_manager_setup_encoder(int id);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 bool msm_dsi_manager_validate_current_config(u8 id);
+void msm_dsi_manager_tpg_enable(void);
 
 /* msm dsi */
 static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
@@ -148,6 +149,8 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_dual_dsi);
 void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
+void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
+
 /* dsi phy */
 struct msm_dsi_phy;
 struct msm_dsi_phy_shared_timings {
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ed504fe..e0a3581 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2495,3 +2495,64 @@ void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_ho
 
 	pm_runtime_put_sync(&msm_host->pdev->dev);
 }
+
+static void msm_dsi_host_video_test_pattern_setup(struct msm_dsi_host *msm_host)
+{
+	u32 reg;
+
+	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
+
+	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_VIDEO_INIT_VAL, 0xff);
+	/* draw checkered rectangle pattern */
+	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL,
+			DSI_TPG_MAIN_CONTROL_CHECKERED_RECTANGLE_PATTERN);
+	/* use 24-bit RGB test pttern */
+	dsi_write(msm_host, REG_DSI_TPG_VIDEO_CONFIG,
+			DSI_TPG_VIDEO_CONFIG_BPP(VIDEO_CONFIG_24BPP) |
+			DSI_TPG_VIDEO_CONFIG_RGB);
+
+	reg |= DSI_TEST_PATTERN_GEN_CTRL_VIDEO_PATTERN_SEL(VID_MDSS_GENERAL_PATTERN);
+	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
+
+	DBG("Video test pattern setup done\n");
+}
+
+static void msm_dsi_host_cmd_test_pattern_setup(struct msm_dsi_host *msm_host)
+{
+	u32 reg;
+
+	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
+
+	/* initial value for test pattern */
+	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0, 0xff);
+
+	reg |= DSI_TEST_PATTERN_GEN_CTRL_CMD_MDP_STREAM0_PATTERN_SEL(CMD_MDP_MDSS_GENERAL_PATTERN);
+
+	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
+	/* draw checkered rectangle pattern */
+	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL2,
+			DSI_TPG_MAIN_CONTROL2_CMD_MDP0_CHECKERED_RECTANGLE_PATTERN);
+
+	DBG("Cmd test pattern setup done\n");
+}
+
+void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+	bool is_video_mode = !!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO);
+	u32 reg;
+
+	if (is_video_mode)
+		msm_dsi_host_video_test_pattern_setup(msm_host);
+	else
+		msm_dsi_host_cmd_test_pattern_setup(msm_host);
+
+	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
+	/* enable the test pattern generator */
+	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, (reg | DSI_TEST_PATTERN_GEN_CTRL_EN));
+
+	/* for command mode need to trigger one frame from tpg */
+	if (!is_video_mode)
+		dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER,
+				DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER_SW_TRIGGER);
+}
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 4ebfedc..db80de6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -441,6 +441,19 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	return;
 }
 
+void msm_dsi_manager_tpg_enable(void)
+{
+	struct msm_dsi *m_dsi = dsi_mgr_get_dsi(DSI_0);
+	struct msm_dsi *s_dsi = dsi_mgr_get_dsi(DSI_1);
+
+	/* if dual dsi, trigger tpg on master first then slave */
+	if (m_dsi) {
+		msm_dsi_host_test_pattern_en(m_dsi->host);
+		if (IS_DUAL_DSI() && s_dsi)
+			msm_dsi_host_test_pattern_en(s_dsi->host);
+	}
+}
+
 static void dsi_mgr_bridge_enable(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

