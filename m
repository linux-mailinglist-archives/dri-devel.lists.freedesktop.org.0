Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD914A94189
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 06:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB8010E2F8;
	Sat, 19 Apr 2025 04:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RmrEy1+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9279310E0AA
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 04:12:44 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-af28bc68846so2053968a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 21:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745035964; x=1745640764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0tqOfb+8mO0V0cNAlNgnOyeQSPHVA6JlcJEWPbfL6rw=;
 b=RmrEy1+gIPffIaMRJGcZIfqRew+w/SsQgfJiusyYIWsCf2WioREdjOopfeAXXfpoWG
 o/jLaXl24QoH/e/k4O3vwwhwg+38SVXvM4oqX3QispVMoid4lQ2i6pCzKSthGHocWPx6
 KRyzfMF+Ggw+xFOgMDEgReSRpgjvkYQx1ZC+FYBWgbhB0c3qaM+E+bBdjW4Fk8S0xw91
 dqyeEE7IxBw/WeXohshcuXZnGzwenVmyp5N9rIMtETYi3zzE6/6ZAt0NkyIrlTYVm1as
 hOivoS5agjEIiQBb4mBQgY2n8QyNiL6oScw5L0L+Yzths2mu9izERdU6OMxrywutVEjA
 XAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745035964; x=1745640764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0tqOfb+8mO0V0cNAlNgnOyeQSPHVA6JlcJEWPbfL6rw=;
 b=xARyTHrijO+n6YkhnUwyAFlc7VWZt4PhCqPlfcPr9MDnWryWoIm5oo7h6CvdmYSsjL
 DnU9auOGSE9iUZsiOBTil/YGceRyGvIaOaJmH5aDzb5dLkmEaTHIor+JH/K/H2Cuz8Sz
 l5T4BJuBzL44Y01wTYVSCpCXDb8kA4RZbcc7StoBxXjNyxmKwNqgivEmH3e4EunvKitv
 6NXMVtkP1Uyp6PldpZ9PePg6jYicC66/h7mVngamKN4Mtpwq6nWxJdpSMCwl08BZSPyA
 w7cEE79lpANaGX4rr58G1lw2b32KSG/pVDDQw+bKchedPy7uOw3vtlG75dauhMMuM4HV
 C2XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHqxDA28o9AMEEY5YPSSuxgm8Sgs6t+/0BTJ8qN0ZkPgJdPRSceyCMWWorA799b1ZW6RtTplq8LYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwomckOGGOtyNkHBJRYSncryCoLLg/+Lx8rOQci47Ghx7XSUYUM
 uvr3uUCNM8ndaUE464f/XA3OHJZkQ+/XNMSYcrn+hOTGLllaI4cN
X-Gm-Gg: ASbGncsHJVHBxMTwXuZLPsjAYFAY8RBPx2+fekq5EiGh14h1zZFj0Vt/dXtFsJ/+j3+
 wJgbjUdzXRnVkYGrmeYna6nSqJemeoNzw3pDwYyLxiJRv7o0pnUgCSIlEAoiG0xx7Iani63ZNBk
 1mGcfEC1MwzbMkj52iwF5R7COLcdnQkP9Wx3tYKgg6CosOncTA1E6khrewFrGu5AhE13huu6ktW
 NDfTTOVocnghwpFTnzSfcBRyTt+aazx2b4iROepWpIKU8Tc1qwAgfrSBngdn1Yps2L9eAB/NK9T
 XDg68JI9YNCu9h+EONJ63zmbrQaoek2lGz1F8AaaKjFlufvwZx38kIrlq2I=
X-Google-Smtp-Source: AGHT+IH06zoUn2Wpu1DAvBAzJLwDM1yMXb2JZbxWISTMcBXQTSv9rJ/poBbsUoc77IM/298QgBrLYg==
X-Received: by 2002:a17:903:1103:b0:220:f87d:9d5b with SMTP id
 d9443c01a7336-22c535acc23mr79544505ad.24.1745035963921; 
 Fri, 18 Apr 2025 21:12:43 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bde283sm25296545ad.6.2025.04.18.21.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 21:12:43 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 1/2] drm/panel: panel-samsung-sofef00: transition to mipi_dsi
 wrapped functions
Date: Sat, 19 Apr 2025 09:42:09 +0530
Message-ID: <20250419041210.515517-2-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419041210.515517-1-tejasvipin76@gmail.com>
References: <20250419041210.515517-1-tejasvipin76@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes the samsung-sofef00 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 70 ++++++-------------
 1 file changed, 21 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 04ce925b3d9d..e20c85d5d9e1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -44,66 +44,44 @@ static void sofef00_panel_reset(struct sofef00_panel *ctx)
 static int sofef00_panel_on(struct sofef00_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	usleep_range(10000, 11000);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
 
-	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set tear on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x12);
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int sofef00_panel_off(struct sofef00_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(40);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 40);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(160);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 160);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int sofef00_panel_prepare(struct drm_panel *panel)
@@ -122,7 +100,6 @@ static int sofef00_panel_prepare(struct drm_panel *panel)
 
 	ret = sofef00_panel_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		return ret;
 	}
@@ -133,13 +110,8 @@ static int sofef00_panel_prepare(struct drm_panel *panel)
 static int sofef00_panel_unprepare(struct drm_panel *panel)
 {
 	struct sofef00_panel *ctx = to_sofef00_panel(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
-
-	ret = sofef00_panel_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
 
+	sofef00_panel_off(ctx);
 	regulator_disable(ctx->supply);
 
 	return 0;
-- 
2.49.0

