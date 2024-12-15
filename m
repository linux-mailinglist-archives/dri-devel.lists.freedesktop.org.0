Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9D9F26C8
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B81010E4FC;
	Sun, 15 Dec 2024 22:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m5Sx19R3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E909D10E4FC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:50 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3003c0c43c0so38818181fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302689; x=1734907489; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+296vAyMuQ8gRY6T48nP00jA3mm+oO9UHHBrJmnhzGQ=;
 b=m5Sx19R3ud6LXey9vrT6KTHPbCob1AUdGWZnNoKe5oFdIsK/RW8YZnDTZPM+O/cbLA
 qaVgP71HFK2mnIEiYGujV7B2aQTfIzp9cpuwx81Yr9stFTTSLeT5Yn2UsCPsQa+DYDAZ
 isXadWTcJgNox6TYOYanHlJ61QuH12zJjaa2GMKCwp+D+29M0GPSwbp8jp9QsQI6xWgc
 dTdt3dicmtdXTywAdgc3i9Yj/xYXWzL+2cWs9hLHvQLD/GJbCpU73ZiWOiuV8F9AmEgY
 dBRTr3X58jGKVVMrlh8Zuktw4THsCgLO2Vnm/C4P52I4tqZSFGZQnvbxkH4zQuV62ppb
 XUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302689; x=1734907489;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+296vAyMuQ8gRY6T48nP00jA3mm+oO9UHHBrJmnhzGQ=;
 b=f2QHHFkgyGQM1l4oSn4h00nNIpn07dF3doKi4vJXhEmK/vo88iZ/OhHW9dL4xd+9qf
 gnO1cg01NW020agHyi7PjBWfyPNKEa8ImrXDEpLwU/2hWzrdaTq6UkLEEUCdi8DMCYXK
 zlUbOfezbkZlw2UI6kXpmw7W3UmeFw555UxB0IrhHeQ/XdortGO1b8jrPlh7jURv/r4z
 UzqGO0BGU+lSYKLkkMY74CrYR+3aB21x7LAobbhwyI//Rw/1K7OOct5lbc6I+UYfFiCA
 92yIuhLQfQ/gES0v9SLpxEJ9Bw/3TVo1sLW2GkljNYIFOCjTbWxHougzIAanhdM/a+VZ
 IK1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6kMu6nmfdbOqXfAqyBcR+lIJKImqAAAmIkyjk0hkAjzmlD63xlYzGdndaq8YlLsR/788PwkO21fU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXZDLWPOP1ASXuT7jlA6YDwg+2rZ9Yjunijx0VAF4s3wvVaegA
 sRgN3t6EYRW3uOBuilvqkZqoz2v465fiKruY2eIVgHqEDpbG+L84Z5p0tC/QwqA=
X-Gm-Gg: ASbGncsgkSaXnXuKCGT2Y6+60uwfkNRTiEFi10ozaJMSI1PwZaDfppSJOs9vd1IA0jf
 wbZVVZhyPZ7piGuA2XyJelth0DGdFoYQgs4VOgXU60vYNnTbR0K0BrpYmNJ6vFpjt9+rQjebjla
 n5krjbwEyNXxHoq/Mzac4l06fkZ16RaIVX+wl2a6G0ZV4e6+RipqZ+K0QxnJwyB5yZcEyt3zZ92
 VzEcGVOjxQDoWJiS/iU2bmWzCh4Y9dYohe5uk634ywAlk7g5LbR/dQxTH/6ApmH
X-Google-Smtp-Source: AGHT+IH2GCXfzbVvWNOK9XBTJKSJBxpiSiM6H3OPGKPuzaqEk3p2cRZmqDTdIQF591kChEB/AWaj5A==
X-Received: by 2002:a05:651c:50f:b0:302:17e7:e18a with SMTP id
 38308e7fff4ca-3025459b038mr35569091fa.26.1734302689250; 
 Sun, 15 Dec 2024 14:44:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:20 +0200
Subject: [PATCH v4 15/16] drm/msm/dp: read hw revision only once
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-15-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4887;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hQBxsTOsUN7geLuBg/YMa+OCFGXDLFQzdaIrPM9DcOQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3p89O71XdGyjxqU/orazo4tUFb6+1k5faNh76UVloduN
 /Qfm3i7k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATKWdl/yu0QiGK65mu5FG5
 Fp2oh9n5E9ui82WrMjxufX9vONPixpzALX9Of1/Ned3/kw+ruygjS/1b7tdPHMRjDh5sX/R6fsS
 lYtnJJTttU2/eNZ282WCqyCJXq223On8aBfAye6wU2MtyRenrBvYTukJls3lOJW2e80r4wsnFT3
 IULNqim02Xrc4Obv0+Q2aZYoxcsrKHZUBcrWVAzAfBvzn8+5v5ImYnboq8GFyxPMW56luEsn0N4
 /7/5cmbtzPXGDlnKv05E/dOVeB7aZJrerW81qxnLJlbmb0u3zPJ0Pn34snMg4bPyrZJzqpI4bTd
 s89ZQHJm3faPl7Vrre2rKqIncESfj32yMCMlgTf901V2AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

There is little point in rereading DP controller revision over and over
again. Read it once, after the first software reset and propagate it to
the dp_panel module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 13 -------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  3 ---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 +++++++++---
 drivers/gpu/drm/msm/dp/dp_panel.c   |  3 +--
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
 5 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 2992a0df262e9ab167a21a270d1aa8fd1383033d..84adf3a38e4cf0619b15850c31416f1e67049a42 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -42,19 +42,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-/**
- * msm_dp_catalog_hw_revision() - retrieve DP hw revision
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * Return: DP controller hw revision
- *
- */
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
-{
-	return msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
-}
-
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 310319619242df5fa0d91c89fbcc477f16c130ea..ddbae0fcf5fc428b2d37cd1eab1d5860a2f11a50 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -95,9 +95,6 @@ static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 
-/* DP Controller APIs */
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
-
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index b15b7ba599e29c4edd746e9c2a8bf2f4a8eedf15..60dbf7eab3fd184bc12035d267abb3758cce9f89 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -131,6 +131,8 @@ struct msm_dp_ctrl_private {
 	struct completion psr_op_comp;
 	struct completion video_comp;
 
+	u32 hw_revision;
+
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on;
@@ -173,6 +175,11 @@ void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	sw_reset &= ~DP_SW_RESET;
 	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
+
+	if (!ctrl->hw_revision) {
+		ctrl->hw_revision = msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
+		ctrl->panel->hw_revision = ctrl->hw_revision;
+	}
 }
 
 static u32 msm_dp_ctrl_get_aux_interrupt(struct msm_dp_ctrl_private *ctrl)
@@ -307,12 +314,11 @@ static void msm_dp_ctrl_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
 static void msm_dp_setup_peripheral_flush(struct msm_dp_ctrl_private *ctrl)
 {
 	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
-	u32 mainlink_ctrl, hw_revision;
+	u32 mainlink_ctrl;
 
 	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision >= DP_HW_VERSION_1_2)
+	if (ctrl->hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 3441c28e3ce332bfe932d7adee7f0ecbaa486c2e..969d618c909876fd7a13aeb6e6c9e117071bc682 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -380,9 +380,8 @@ static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct
 
 static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
 {
-	u32 hw_revision;
+	u32 hw_revision = panel->msm_dp_panel.hw_revision;
 
-	hw_revision = msm_dp_catalog_hw_revision(panel->catalog);
 	if (hw_revision >= DP_HW_VERSION_1_0 &&
 	    hw_revision < DP_HW_VERSION_1_2) {
 		msm_dp_write_link(panel->catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 8dde55b3a5ab64c0c12d69cb2dd5b5c733c83432..c348417bb07f33efdf1402a73c27ff99e394e5a3 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -38,6 +38,7 @@ struct msm_dp_panel {
 	struct msm_dp_panel_psr psr_cap;
 	bool video_test;
 	bool vsc_sdp_supported;
+	u32 hw_revision;
 
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;

-- 
2.39.5

