Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF03A3D615
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4AB10E90D;
	Thu, 20 Feb 2025 10:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QlST3mxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF7910E90E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:08:57 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fa5af6d743so1142465a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740046137; x=1740650937; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8+OUzS6eo8FVNCvAvfNYtKkGJynjAEILZy6jM+oJy/s=;
 b=QlST3mxCitG+jbP6x73BpFsQr0QvCgRLzqnioqa3Jwbh5cW4c1DIfWKwjXC7MNUrux
 gf1v48jyz472lKrsGwDd4T962nDiZKU3FoCRBFv0D0aBU6rEgUIGlkfg3gbAMrSXKSZ4
 xOzImevWSimjbtwbbyUeGi/k0cY410iojd0bcc6ZSZ+XS0eyu04ERzmpCVn2pUfOrv9A
 gvef0z5yz9Pm6iOJ09I6tPw5bCVXRuTrwKJv2OTwzk10ohgCS8ITBapbmGK2/hMY8Jr6
 iQTLsyuYWBYTrGRoz2bk2+5xKMWpQQ3IFBr5/2+l6bd3EfO6qexmRQxf0zl8xD/dkXol
 WIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740046137; x=1740650937;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8+OUzS6eo8FVNCvAvfNYtKkGJynjAEILZy6jM+oJy/s=;
 b=BJKyvasY2ywdekeJ2dIuGv+ceLJ4qVBNRAgwi/6ujLU2atRXApOAWZh3WtoubnkD3P
 MMxDL5dYM3GZurbx9aruCW+EI8YKWgbNrQnOmOddaMx8yTVmbTTj3mvhmer4iO7UgS1I
 1LfVsn2KIc4QSngxHwhMeFaPNMWRMKmMA3tTWwasq0cVlg6Xu1jPV8pk9hKW0ums9ZnO
 SS2XddwZi+gg9/1nP9aW7hSeLTHEt2nUtjA+kptir/Wze40thRWnS+HebpqfrMpZMP/a
 /w8jlBefI8Dh2yHDk/1BuxNd/ce+qHjEtuFTEFbXuMhREmgjoGOPj35XOUULWG0tikKq
 Eexw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3pFClbixREFHjPgOH4bLv4n0xRB7ek/3AamHJ47dpJmcg1Z/l+Y46BIQ8yx4MlLKpZOo81SExUck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgygFb/BKcM0ksbw+Lt2ET5nbUkTkbUlIocIyX8MIt0SF7eo7K
 IiytKSYu7gcu2Wo8KWDVg62lRDYEmHbj1BFhmns1r/+FUkYyiGDOGrXKRJiEKqM=
X-Gm-Gg: ASbGncvOYXxd7juQ2MI4CRZwzZ2Qu3+DUOOSY5Q7uVFrvl9siI07R0dbyOnzkzgnI1l
 7WWnJ8/kjknyQHcD81QX7PXOPaN6+kbPWhsYzAf6BNEU7EUICAzmMG3GseIScmzD1JSYJALXAMA
 ymqj4iyc6cV0To6HalshxauCpekKbotp4IGIuPH6kWCmk47xOUYyA9i5T3w6et59+hjjh0gBY+n
 2HjrpugxLitgF+UgL5Dx6ZlJqMqSTmy2vF12mv9eN1Z+gI3AfYfnF6ei3+95zuJhseY4k1OVH1i
 Bgs+Lf5RFwsI
X-Google-Smtp-Source: AGHT+IHDtFghikb0IsdCfqFtYMffpKN5+PJogSYWwgbB8ovOAObhOmSVEFhYr1RpSHSfSypZl/GVTw==
X-Received: by 2002:a17:90b:3d86:b0:2f4:4500:bb4d with SMTP id
 98e67ed59e1d1-2fc40f233f9mr32996102a91.20.1740046137364; 
 Thu, 20 Feb 2025 02:08:57 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98b3305sm15304645a91.6.2025.02.20.02.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:08:57 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 18:07:56 +0800
Subject: [PATCH v2 5/5] drm/msm/dsi: Support DSC for dual panel case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dual-dsi-v2-5-6c0038d5a2ef@linaro.org>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
In-Reply-To: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740046076; l=5455;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=UmAueoCoAiEP6+F0V8D3CfDL3EJR/catd+q6wTXt9m8=;
 b=6BwqEYg6DasxH9/TNbFINX8D5ATykKXwrq7MbDqfVfVuPFJ845uD3DPApUtH07rTfNUFTW/dz
 GczxnFvXZZ+AWEfDhMOKDN5XUwWsjxgrouT47tVNv40LQ4kUUbFO0uQ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

There is dual DSI case that every DSI link is connected to an independent
panel. In this dual panel case, the frame width for DSC on each link should
be halved to support the usage case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++++++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 ++++++++--
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 35b90c462f637111159b204269ce908614a21586..5a8978bed9f4ca897b418ced60194042d9dd8d05 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -74,7 +74,8 @@ void msm_dsi_host_enable_irq(struct mipi_dsi_host *host);
 void msm_dsi_host_disable_irq(struct mipi_dsi_host *host);
 int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings,
-			bool is_bonded_dsi, struct msm_dsi_phy *phy);
+			bool is_bonded_dsi, bool is_dual_panel,
+			struct msm_dsi_phy *phy);
 int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 976c5d82a2efa0fc51657b8534675890be7c33a6..752a97f7181c30dade0a7745492bf16649b3197b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -902,7 +902,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	}
 }
 
-static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
+static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi,
+			     bool is_dual_panel)
 {
 	struct drm_display_mode *mode = msm_host->mode;
 	u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
@@ -947,7 +948,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			return;
 		}
 
-		dsc->pic_width = mode->hdisplay;
+		if (is_dual_panel)
+			dsc->pic_width = hdisplay;
+		else
+			dsc->pic_width = mode->hdisplay;
 		dsc->pic_height = mode->vdisplay;
 		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
 
@@ -2369,7 +2373,8 @@ static void msm_dsi_sfpb_config(struct msm_dsi_host *msm_host, bool enable)
 
 int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings,
-			bool is_bonded_dsi, struct msm_dsi_phy *phy)
+			bool is_bonded_dsi, bool is_dual_panel,
+			struct msm_dsi_phy *phy)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
@@ -2412,7 +2417,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 		goto fail_disable_clk;
 	}
 
-	dsi_timing_setup(msm_host, is_bonded_dsi);
+	dsi_timing_setup(msm_host, is_bonded_dsi, is_dual_panel);
 	dsi_sw_reset(msm_host);
 	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index be13bf682a9601484c9c14e8419563f37c2281ee..158b6cc907cb39cc3b182d3088b793d322a3527c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -24,6 +24,7 @@ struct msm_dsi_manager {
 	struct msm_dsi *dsi[DSI_MAX];
 
 	bool is_bonded_dsi;
+	bool is_dual_panel;
 	bool is_sync_needed;
 	int master_dsi_link_id;
 };
@@ -31,6 +32,7 @@ struct msm_dsi_manager {
 static struct msm_dsi_manager msm_dsim_glb;
 
 #define IS_BONDED_DSI()		(msm_dsim_glb.is_bonded_dsi)
+#define IS_DUAL_PANEL()		(msm_dsim_glb.is_dual_panel)
 #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
 #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
 
@@ -55,6 +57,7 @@ static int dsi_mgr_parse_of(struct device_node *np, int id)
 		msm_dsim->is_bonded_dsi = of_property_read_bool(np, "qcom,dual-dsi-mode");
 
 	if (msm_dsim->is_bonded_dsi) {
+		msm_dsim->is_dual_panel = of_property_read_bool(np, "qcom,dual-panel");
 		if (of_property_read_bool(np, "qcom,master-dsi"))
 			msm_dsim->master_dsi_link_id = id;
 		if (!msm_dsim->is_sync_needed)
@@ -214,6 +217,7 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
 	bool is_bonded_dsi = IS_BONDED_DSI();
+	bool is_dual_panel = IS_DUAL_PANEL();
 	int ret;
 
 	DBG("id=%d", id);
@@ -222,7 +226,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 	if (ret)
 		goto phy_en_fail;
 
-	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_bonded_dsi, msm_dsi->phy);
+	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
+				    is_bonded_dsi, is_dual_panel, msm_dsi->phy);
 	if (ret) {
 		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
 		goto host_on_fail;
@@ -230,7 +235,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 
 	if (is_bonded_dsi && msm_dsi1) {
 		ret = msm_dsi_host_power_on(msm_dsi1->host,
-				&phy_shared_timings[DSI_1], is_bonded_dsi, msm_dsi1->phy);
+				&phy_shared_timings[DSI_1], is_bonded_dsi,
+				is_dual_panel, msm_dsi1->phy);
 		if (ret) {
 			pr_err("%s: power on host1 failed, %d\n",
 							__func__, ret);

-- 
2.34.1

