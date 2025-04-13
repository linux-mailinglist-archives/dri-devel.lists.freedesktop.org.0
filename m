Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF8AA8707D
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 06:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235C510E1D8;
	Sun, 13 Apr 2025 04:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cllYpcWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AE010E1D8
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Apr 2025 04:00:12 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-739be717eddso2455533b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 21:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744516812; x=1745121612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UqI6Xg+tP1YvCk+YIG6SA8ycGL1vJCda4FkJGkBHxOA=;
 b=cllYpcWaCZi4kYNrRe2JvL3qv3pE8gpPuDSubMzzSVor7KkEGRwSXI3B6U+mbKLDoi
 BXuPBvCbMNCbFgFWRfriwT9BP6jxO+EcbRDTd9kcvJwTc99IdxulYhxcjLzInBBWz/KF
 J55SNU9lgzprxIrv1f7IoL2NutdiHrmLdRoI5X7+4cQbxPQBjBsbom9s8zESgpM/wkOt
 lhdALqoKaJvIP/K8colNR2L2eupdFa0mCA5UGYlYT6wCHdULEcm+2ioXspSunqOBmR5n
 3+0OZxjS7pbBnTaYFFDEIFXnGts10EyXVPYK8Q2UpowHdPdQUJM9T5yR8valP6xBLDLx
 q/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744516812; x=1745121612;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UqI6Xg+tP1YvCk+YIG6SA8ycGL1vJCda4FkJGkBHxOA=;
 b=mFEoounNrofTTi7p/qaa6G/+WBLvRuCDiyFavUdmbt8U51s8SjjEDMjmjsHVz4HLCW
 PF09YOLPX4PCQwdK0CWi79+Jrbt0d70tYRf7D2O/VswFrVYWyfCSSr5KhIQbB/Cnf2Vq
 KuVULwLvprAW0SNCa/Jn9r+3sAKerJiLhf+ueMs1WURt2x5PcQJqyylD8tlvhXCTd4tS
 qQRk+chJyiZwSH/UkguPYCAEMTqD3c/PTKCkJLgpG6f1+8Qoov1F8zbV24qlENxU3O34
 OdA3xsYok2CDpFkYeoDxQ4Sp9CIFYGO/IplZiSf2GElDrXqy0WXdOQU4iO3cwfYSPIrL
 FE7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCULMiuzrEbrmn1tH1EYgrVwg6qKf+V15OuXoVmXSSW9rKWXiKbQm7UhYQG6Jt0plp7PIM3shA9d52U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWBXHRoQr3G9ocYNZ7QrqQ6PwY2pwbtP3+5hLAZssaBK/zb4BY
 mzevYV2QsBNENkOk7+IyQOLWaxN/n21IVyRoY9BW7X28YVKhQd73
X-Gm-Gg: ASbGncvd7txgXZJX4JekjoqvsXrIkdfKpgyp43DBmNxYsSw2EHXEXRTB2kFXN9YOd2m
 GSSSNmK9v3DL/TZ8gN1wFNjenNK98IH4yBtOheyX6KcWUHpy5UubslaajxIgl7ISv8F5cmWKCu0
 vaZeh/OZklEICOcSX4RS6ne0sbINlC7/Rdmi0z7WrVndJwjEV0BOEVdYgKwpkzT/ebMLnKrj3r+
 qnyj+orVweydhzFJmtn7PZI5Z83c7sQwzXqf/uRGXyeoSzbKfDYTD68ByX8zhjXzGLGZdZ0wHkE
 l2K4SrFoXegqChCOTG5yf7OJIDiYgUZhZSrlJgUtLAk6lyhTkWqVJaJsszE=
X-Google-Smtp-Source: AGHT+IH4z1XO9PKG2LeQ+zLCK87XjAg8XpDkF9DVoeFsRX0I6R5xjTm+AlGTaFzpspsTdU7i4GaSBA==
X-Received: by 2002:a05:6a00:2405:b0:736:5544:7ad7 with SMTP id
 d2e1a72fcca58-73bd1203c12mr8268514b3a.14.1744516811348; 
 Sat, 12 Apr 2025 21:00:11 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd21c3870sm4193836b3a.48.2025.04.12.21.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 21:00:10 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v3] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
Date: Sun, 13 Apr 2025 09:29:59 +0530
Message-ID: <20250413035959.255842-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
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

Changes the boe-bf060y8m-aj0 panel to use multi style functions for
improved error handling. Additionally the MIPI_DSI_MODE_LPM flag is set
after the off commands are run in boe_bf060y8m_aj0_off regardless of any
failures, and regulators are disabled if the boe_bf060y8m_aj0_on call in
boe_bf060y8m_aj0_prepare fails.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v3:
    - Disable regulators in boe_bf060y8m_aj0_prepare if
      boe_bf060y8m_aj0_on fails.
Changes in v2:
    - Always set MIPI_DSI_MODE_LPM in boe_bf060y8m_aj0_off

Link to v2: https://lore.kernel.org/all/20250331061838.167781-1-tejasvipin76@gmail.com/
Link to v1: https://lore.kernel.org/all/20250330151304.128417-1-tejasvipin76@gmail.com/
---
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 114 +++++++-----------
 1 file changed, 44 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 7e66db4a88bb..dbbfee22ae76 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -55,77 +55,56 @@ static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
 static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
 {
 	struct mipi_dsi_device *dsi = boe->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
-
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
-	mipi_dsi_dcs_write_seq(dsi, 0xf8,
-			       0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(30);
-
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc0,
-			       0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
-			       0x2a, 0x31, 0x39, 0x20, 0x09);
-	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
-			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
-			       0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
-			       0x5c, 0x5c, 0x5c);
-	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
-
-	msleep(30);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-	msleep(50);
-
-	return 0;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x00, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8,
+				     0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 30);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0,
+				     0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
+				     0x2a, 0x31, 0x39, 0x20, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+				     0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
+				     0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
+				     0x5c, 0x5c, 0x5c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
+
+	mipi_dsi_msleep(&dsi_ctx, 30);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	return dsi_ctx.accum_err;
 }
 
-static int boe_bf060y8m_aj0_off(struct boe_bf060y8m_aj0 *boe)
+static void boe_bf060y8m_aj0_off(struct boe_bf060y8m_aj0 *boe)
 {
 	struct mipi_dsi_device *dsi = boe->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* OFF commands sent in HS mode */
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
-	msleep(20);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	usleep_range(1000, 2000);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
-
-	return 0;
 }
 
 static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
 {
 	struct boe_bf060y8m_aj0 *boe = to_boe_bf060y8m_aj0(panel);
-	struct device *dev = &boe->dsi->dev;
 	int ret;
 
 	/*
@@ -157,13 +136,14 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
 
 	ret = boe_bf060y8m_aj0_on(boe);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(boe->reset_gpio, 1);
-		return ret;
+		goto err_on;
 	}
 
 	return 0;
 
+err_on:
+	regulator_disable(boe->vregs[BF060Y8M_VREG_VCI].consumer);
 err_vci:
 	regulator_disable(boe->vregs[BF060Y8M_VREG_VDDIO].consumer);
 err_vddio:
@@ -178,15 +158,11 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
 static int boe_bf060y8m_aj0_unprepare(struct drm_panel *panel)
 {
 	struct boe_bf060y8m_aj0 *boe = to_boe_bf060y8m_aj0(panel);
-	struct device *dev = &boe->dsi->dev;
-	int ret;
 
-	ret = boe_bf060y8m_aj0_off(boe);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+	boe_bf060y8m_aj0_off(boe);
 
 	gpiod_set_value_cansleep(boe->reset_gpio, 1);
-	ret = regulator_bulk_disable(ARRAY_SIZE(boe->vregs), boe->vregs);
+	regulator_bulk_disable(ARRAY_SIZE(boe->vregs), boe->vregs);
 
 	return 0;
 }
@@ -234,13 +210,11 @@ static int boe_bf060y8m_aj0_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
 	u16 brightness = backlight_get_brightness(bl);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, brightness);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int boe_bf060y8m_aj0_bl_get_brightness(struct backlight_device *bl)
-- 
2.49.0

