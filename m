Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077218C34A5
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 01:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A912310E12D;
	Sat, 11 May 2024 23:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vc87N9F+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8B010E0A3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 23:00:30 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so3530611e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 16:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715468429; x=1716073229; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Hu0NGC1822F78E4qEEGMD+epvzx8Hq6ZdfvN33IsmMQ=;
 b=Vc87N9F+7tvD/RAcoAI1MRMgV7rtPjk5Bt8uPHAzFpL8XqtNAZE/8R/LPZx7OIRpHQ
 USSmvE1PIzY/eA0qePT7jPpqmIMo9L+V72l196cvwL/grbt9Yyo0Diy5ErLP9AY4w80m
 VXNR4aR1pOrtGfutTKhpo/ysvQg7fxYLpYz6lKUrCl0BoLgBCG5IWPJNahHnB4m1b07n
 VXL4GGDqjzVj5k7xA7sJtaX3ZXvhxmD4PLIOTGsAAewH/I4gqA2TuaTo895pjXbAr1id
 pHRtb1DjHyGMa9EMjKb0RF+j/J+QgbiL40JlawblsK2hrchvh7QT6xPA39+KOjcBddGG
 cQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715468429; x=1716073229;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hu0NGC1822F78E4qEEGMD+epvzx8Hq6ZdfvN33IsmMQ=;
 b=om4IHMFpqsvxjFwFXm0e3h/Im42VvvInwPTlOT94GQNwy/eVpqBEp4O7srbsuqEICI
 E7YRvQ0/AUsTLVgusI1MlcmEDUqtruuAmkXcqehrtqvSBeAc6IaT6WGFG1LCJA53X6oH
 4XSe1Mfzik2TGDEtzgsQ5tXeg0y4N7QxUL1BJV5O2rBnt3K8QQa/BItFK6ibEs0QFjUB
 N9l8Kj9p7muV0GAii/+atBh/yyBD/27dEfUwRtdtab3Ga2iEhZkNrIEZg3Pmjnj/o7Sk
 Vh2TxwWSvFxyP0UooMDaS60ylaQ2galeIQ1Ckcsg/TnpCMSz/PfIISIiFdpRZNaovlTw
 Ti6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPXjE1NrEB/PD5LpdzMD1lU2/nQ53H2bha+cIJbwrmCBluYegYCFdMZQ6LkqXAQiYpfbRolgc0wAYXUBh56aXFSZNTi8p9pVYKHFibPdrd
X-Gm-Message-State: AOJu0YwZC5N7HcYOQc658MThHebB4ZRHeAxOe9U3mtJzNMpSyT3ma+zu
 gl4KqbntKJYN1YUQodM1XRS0R6mkZFrW1WMeGskxHZJpSMYa5dB7h4TgH4b7ooM=
X-Google-Smtp-Source: AGHT+IFr3JJ2vBf6ZQy+IfFzBDbsVRhgW4zc3ltkOgtdnJYsgPSuJLiHSVasG/nFGY1o3ezKQcVUvQ==
X-Received: by 2002:ac2:4437:0:b0:519:2d60:d71b with SMTP id
 2adb3069b0e04-5220fb748e2mr3750214e87.22.1715468428990; 
 Sat, 11 May 2024 16:00:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3717sm1134222e87.173.2024.05.11.16.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 16:00:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 02:00:20 +0300
Subject: [PATCH v2 3/7] drm/panel: boe-tv101wum-nl6: use wrapped MIPI DCS
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-dsi-panels-upd-api-v2-3-e31ca14d102e@linaro.org>
References: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
In-Reply-To: <20240512-dsi-panels-upd-api-v2-0-e31ca14d102e@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4693;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Nb2j0chWOl3K4obprfCylvl2x756Dew7S8N3+vA9f8A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP/iJPUx6S2iov6pW2UiDrNkON3xTRY9bGzjD5
 M6NaOHeuR6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/4iQAKCRCLPIo+Aiko
 1eFkB/9JXBh7kAEoKU1ZGODiXQ9dFDltFasZEZd5OcbnNrPxpevLyXu0CWhZj2Bn6+lGaZ/TfUR
 Psn26XBaBBlqancXr61dMYJfulvUJkDEqsWiAg0/KHwm82Z7aWBd5y7I52BR00EI5g/CMYIuTDP
 o628o7vV2AmVFLEAXfuoisFcYBbeAXsbhIf0SpvmwmMo3ovCgtkm1LbuVhz1uEcfNkeQyaXgzro
 AXUmpdFU72BV6AkBvd3T+g4gyTJjiEfNCxt7jV4A+2VG+E/Ug+WcPe63OOJyurrC2x6V7Gbpw2M
 LPoIuKd5xUrtL1U/xgk6pNCXKJN/r1iyGExMS2bjIZZ2NyOw
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

Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
simplify driver's init/exit code.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 81 ++++++--------------------
 1 file changed, 19 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 4b4b125a6c6b..8e839a1749e4 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -448,22 +448,16 @@ static int boe_tv110c9m_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xbb, 0x13);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0x03, 0x96, 0x1a, 0x04, 0x04);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(100);
+	mipi_dsi_msleep(&ctx, 100);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(200);
+	mipi_dsi_msleep(&ctx, 200);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(100);
+	mipi_dsi_msleep(&ctx, 100);
 
 	return 0;
 };
@@ -893,22 +887,16 @@ static int inx_hj110iz_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x01);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x35, 0x00);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3b, 0x03, 0xae, 0x1a, 0x04, 0x04);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(100);
+	mipi_dsi_msleep(&ctx, 100);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(200);
+	mipi_dsi_msleep(&ctx, 200);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(100);
+	mipi_dsi_msleep(&ctx, 100);
 
 	return 0;
 };
@@ -1207,10 +1195,8 @@ static int boe_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb3, 0x08);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0x04);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb8, 0x68);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(150);
+	mipi_dsi_msleep(&ctx, 150);
 
 	return 0;
 };
@@ -1222,16 +1208,12 @@ static int auo_kd101n80_45na_init(struct boe_panel *boe)
 	msleep(24);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(120);
+	mipi_dsi_msleep(&ctx, 120);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(120);
+	mipi_dsi_msleep(&ctx, 120);
 
 	return 0;
 };
@@ -1283,10 +1265,8 @@ static int auo_b101uan08_3_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe5, 0x4f);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe6, 0x41);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe7, 0x41);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(150);
+	mipi_dsi_msleep(&ctx, 150);
 
 	return 0;
 };
@@ -1385,16 +1365,12 @@ static int starry_qfh032011_53g_init(struct boe_panel *boe)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe1, 0x23);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xe2, 0x07);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0X11);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(120);
+	mipi_dsi_msleep(&ctx, 120);
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29);
-	if (ctx.accum_err)
-		return ctx.accum_err;
 
-	msleep(80);
+	mipi_dsi_msleep(&ctx, 80);
 
 	return 0;
 };
@@ -1404,38 +1380,19 @@ static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
 	return container_of(panel, struct boe_panel, base);
 }
 
-static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
-{
-	struct mipi_dsi_device *dsi = boe->dsi;
-	int ret;
-
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		return ret;
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static int boe_panel_disable(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
-	int ret;
+	struct mipi_dsi_multi_context ctx = { .dsi = boe->dsi };
 
-	ret = boe_panel_enter_sleep_mode(boe);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
-		return ret;
-	}
+	boe->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	msleep(150);
+	mipi_dsi_dcs_set_display_off_multi(&ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
 
-	return 0;
+	mipi_dsi_msleep(&ctx, 150);
+
+	return ctx.accum_err;
 }
 
 static int boe_panel_unprepare(struct drm_panel *panel)

-- 
2.39.2

