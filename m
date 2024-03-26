Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100E488C64F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D28810F02B;
	Tue, 26 Mar 2024 15:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pcJ/Eo2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1025D10EB82;
 Tue, 26 Mar 2024 15:06:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B1BC612BC;
 Tue, 26 Mar 2024 15:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC22C43601;
 Tue, 26 Mar 2024 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711465605;
 bh=ux2gJRKYbJtB1caE8tUqKnWbosy/ET6Ap41xPNx8LYI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pcJ/Eo2k+G18Wwd/YTyBKqV80j6+3s0CcBfAwEvmkVwIbNqtADHOh+ljnvhyhcuTx
 Nhcfp32+9VXqTEbX926zg4O/QPRaTC9FmkgX/g0PkNzJl6Kt7IBfFuI8DvJ9Zo+Bk5
 O2dZHLGGmsMALGo+FGrF4GRIpBGyCSgFW0rCaz9tY7RHkArYuO7ScZMCI/fuE9vUzr
 uUbm2IOrlsaH4ZVa34STR5PtA6d16WGer7QQpFR1Ok18vGHtBf4PTfdDiGsi25Rl6j
 7jAyUDNPX2wNay5gUmvOwqfsoQV1Q2ZnGtL5bNs+rVm1XVwjRQGfbXIvcamlNmHols
 EfNsr7ixyeMqg==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 26 Mar 2024 08:11:31 -0700
Subject: [PATCH 3/6] drm/msm/dp: Remove unused defines and members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-msm-dp-cleanup-v1-3-e775556ecec0@quicinc.com>
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=7373;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=1Vt/PUJRNML3XV+iy2c2v7ZwN3HbD8qAP7vs4E1jcfQ=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmAuWinIX++PuIKhc2yR5Ugs2UtUOKKY0lovwMx
 EZcqxUBUdaJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZgLlohUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcW7DRAAw8D+BmOE4fIW0XT/aRT5yVHCgRUZif87xbUEa73
 uJJuWgVwPqohnGZ4++yqDm7TsyCl/7OZ+HQDWQejBR2Rqb0CQrNeXjaNYnZFziMQcImHDx1Bex+
 CtHCoCaeunAteGYXIOFDWaQTuQ/eG1Pxcn3k64SF4mSR4R7agcD8Y53klFMf8n2Y/rUkmQDMzAn
 1dDyxOgNRRbiJsyzzeLPHmKCL4AlgWrPqn5A1Yx7hFFi2gg0bDexoXxqyHxGMMG576jOR8QB6zt
 /gHZxEqgt5zhAMWYzxw3XzOmXq4YIyCqBbNs/1MNzU77d3UFSQ24lD+RnI0YI4y0llUVuI8T6u+
 2Y6XejK89iMx1jLm9zt8S/00f5I2F6wLO1rhRMsDCGsxu1hNiank44sNLCR+Qm/o8pmWGkzQKu9
 AMNt9TCe8ZUL6ux47OnK1nazlnD9UEmBUDb3zbaJJQm9iq7jYL79Wit2i6/+Z1G3T+27PPNcSIA
 LBdTCWx37H93trT5HU/k4vGjZ9+0bVnxxjhlNZm9Ct7fuH7bfIJ+65/B6KssE6590HICKBlyQNJ
 +A26QOSwWrGNDGEx7VJaSeKvN+R/M+/5WyuAao/T2p6Rqros+QDsM8eJYxCZSLWhUq0BCXPEEBj
 ryZs7dlFK+RlIgspqRN5+l9FKFBbHYu8WUR/+XaWui2E=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <quic_bjorande@quicinc.com>

Throughout the Qualcomm Displayport driver a number of defines and
struct members has become unused, but lingers in the code. Remove these.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  5 -----
 drivers/gpu/drm/msm/dp/dp_catalog.c |  1 -
 drivers/gpu/drm/msm/dp/dp_catalog.h | 17 -----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_display.c |  5 -----
 drivers/gpu/drm/msm/dp/dp_display.h |  3 ---
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 --
 drivers/gpu/drm/msm/dp/dp_link.c    |  4 ----
 drivers/gpu/drm/msm/dp/dp_link.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 --
 10 files changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 7634e4b74208..7fd0c1793ba3 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -22,9 +22,7 @@ struct dp_audio_private {
 	struct platform_device *pdev;
 	struct drm_device *drm_dev;
 	struct dp_catalog *catalog;
-	struct dp_panel *panel;
 
-	bool engine_on;
 	u32 channels;
 
 	struct dp_audio dp_audio;
@@ -356,8 +354,6 @@ static void dp_audio_enable(struct dp_audio_private *audio, bool enable)
 
 	catalog->audio_data = enable;
 	dp_catalog_audio_enable(catalog);
-
-	audio->engine_on = enable;
 }
 
 static struct dp_audio_private *dp_audio_get_data(struct platform_device *pdev)
@@ -571,7 +567,6 @@ struct dp_audio *dp_audio_get(struct platform_device *pdev,
 	}
 
 	audio->pdev = pdev;
-	audio->panel = panel;
 	audio->catalog = catalog;
 
 	dp_audio = &audio->dp_audio;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 8c72d532d96b..55114a6aba7e 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -81,7 +81,6 @@ struct dp_catalog_private {
 	struct dss_io_data io;
 	u32 (*audio_map)[DP_AUDIO_SDP_HEADER_MAX];
 	struct dp_catalog dp_catalog;
-	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
 };
 
 void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index b85ad6bdb2e7..2c2dbeee7634 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -28,26 +28,9 @@
 #define DP_INTR_FRAME_END		BIT(6)
 #define DP_INTR_CRC_UPDATED		BIT(9)
 
-#define DP_AUX_CFG_MAX_VALUE_CNT 3
-
 #define DP_HW_VERSION_1_0	0x10000000
 #define DP_HW_VERSION_1_2	0x10020000
 
-/* PHY AUX config registers */
-enum dp_phy_aux_config_type {
-	PHY_AUX_CFG0,
-	PHY_AUX_CFG1,
-	PHY_AUX_CFG2,
-	PHY_AUX_CFG3,
-	PHY_AUX_CFG4,
-	PHY_AUX_CFG5,
-	PHY_AUX_CFG6,
-	PHY_AUX_CFG7,
-	PHY_AUX_CFG8,
-	PHY_AUX_CFG9,
-	PHY_AUX_CFG_MAX,
-};
-
 enum dp_catalog_audio_sdp_type {
 	DP_AUDIO_SDP_STREAM,
 	DP_AUDIO_SDP_TIMESTAMP,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index fa014cee7e21..ffcbd9a25748 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -12,7 +12,6 @@
 #include "dp_catalog.h"
 
 struct dp_ctrl {
-	atomic_t aborted;
 	bool wide_bus_en;
 };
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a9187be95166..f7692c20bb04 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -74,7 +74,6 @@ struct dp_event {
 };
 
 struct dp_display_private {
-	char *name;
 	int irq;
 
 	unsigned int id;
@@ -82,11 +81,9 @@ struct dp_display_private {
 	/* state variables */
 	bool core_initialized;
 	bool phy_initialized;
-	bool hpd_irq_on;
 	bool audio_supported;
 
 	struct drm_device *drm_dev;
-	struct dentry *root;
 
 	struct dp_catalog *catalog;
 	struct drm_dp_aux *aux;
@@ -800,7 +797,6 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 
 	drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
 	dp->panel->dp_mode.bpp = mode->bpp;
-	dp->panel->dp_mode.capabilities = mode->capabilities;
 	dp->panel->dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
 	dp_panel_init_panel_info(dp->panel);
 	return 0;
@@ -1260,7 +1256,6 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	dp->dp_display.pdev = pdev;
-	dp->name = "drm_dp";
 	dp->id = desc->id;
 	dp->dp_display.connector_type = desc->connector_type;
 	dp->wide_bus_supported = desc->wide_bus_supported;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 234dada88687..ec7fa67e0569 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,7 +16,6 @@ struct msm_dp {
 	struct drm_device *drm_dev;
 	struct platform_device *pdev;
 	struct device *codec_dev;
-	struct drm_bridge *bridge;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
 	bool link_ready;
@@ -28,8 +27,6 @@ struct msm_dp {
 
 	hdmi_codec_plugged_cb plugged_cb;
 
-	bool wide_bus_en;
-
 	struct dp_audio *dp_audio;
 	bool psr_supported;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index a819a4ff76a9..1b9be5bd97f1 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -347,8 +347,6 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 		}
 	}
 
-	dp_display->bridge = bridge;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 49dfac1fd1ef..b94da000014a 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -36,7 +36,6 @@ struct dp_link_request {
 
 struct dp_link_private {
 	u32 prev_sink_count;
-	struct device *dev;
 	struct drm_device *drm_dev;
 	struct drm_dp_aux *aux;
 	struct dp_link dp_link;
@@ -804,8 +803,6 @@ int dp_link_psm_config(struct dp_link *dp_link,
 	if (ret)
 		DRM_ERROR("Failed to %s low power mode\n", enable ?
 							"enter" : "exit");
-	else
-		dp_link->psm_enabled = enable;
 
 	mutex_unlock(&link->psm_mutex);
 	return ret;
@@ -1226,7 +1223,6 @@ struct dp_link *dp_link_get(struct device *dev, struct drm_dp_aux *aux)
 	if (!link)
 		return ERR_PTR(-ENOMEM);
 
-	link->dev   = dev;
 	link->aux   = aux;
 
 	mutex_init(&link->psm_mutex);
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 83da170bc56b..f04407fe7375 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -74,7 +74,6 @@ struct dp_link_phy_params {
 struct dp_link {
 	u32 sink_request;
 	u32 test_response;
-	bool psm_enabled;
 
 	u8 sink_count;
 	struct dp_link_test_video test_video;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9afd99e00b0c..4ea42fa936ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -15,7 +15,6 @@ struct edid;
 
 struct dp_display_mode {
 	struct drm_display_mode drm_mode;
-	u32 capabilities;
 	u32 bpp;
 	u32 h_active_low;
 	u32 v_active_low;
@@ -47,7 +46,6 @@ struct dp_panel {
 	bool video_test;
 	bool vsc_sdp_supported;
 
-	u32 vic;
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 

-- 
2.43.0

