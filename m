Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8335A01EC7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 06:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F5210E1AD;
	Mon,  6 Jan 2025 05:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gys3Wt04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F3310E1AD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 05:19:22 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6dcd4f1aaccso77002936d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 21:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736140701; x=1736745501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XGHWLOWy3xgYZ6nB0NBVlXpvKd+NSKHd4SgyS3eIpJg=;
 b=Gys3Wt04JWg+QE3vS74JbUrWiksOk//TalO9spj0sn6slPQiUCjNysVA/qj5uBgZJB
 FaK6NKBRRRtx3yOJnp6gnBU1sM9BbX5hpDqI2ckjklPhk92aG/8D1udEH5hoCpR1/MtH
 lGXAndN0iD+KdK0XfCzAFpN/xATsHf552qwpQNuoCX/y52w1FZ310NyogSwcpnvQME/h
 GfYlwJ1YiBQ8aekJV9kK+S7wSLZbg5nDVUklQR6oBeZC7B3Mq4meZEESiR6F4qtREGQI
 vFOWDb6C40WkR8eTlenrwvvdV0/3o0yEhTJ2fgL8r13tRK9IDa07t9xCO1jwZTfYrTTd
 NRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736140701; x=1736745501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XGHWLOWy3xgYZ6nB0NBVlXpvKd+NSKHd4SgyS3eIpJg=;
 b=PA3E2T768cvvTIyGkFK355BKWkQfigbMw97ztCs4LJaj7UlJTm8mRqMR2d1IdZSYJu
 fdj+wouRa+WHKX0T9bVcsK7ByxdpryzBleBekLTAlmcUHioBhIjY6dhS8SMfiE5O6qUc
 GCpBvcZ9omzbkM4vCB8x9Oo0nd/xMNKCMSOB1nXco8Bnxe4n1L6HArgt6d4z/h41R3bF
 umHbehgI17O5X1JOXjHtHwnPhe5GkQC8grzqzPgJkCIktSRjFqGi/sI2Jdvw1Ozki2kP
 5di8J0J3KBqH+Qto+lnfEGYCx+1/fPXIWxNvtiw8dZmCJrBukKG49sO+zN9bl0U2FFO/
 ynpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/4/mGCPvY37Oc/U69KdHTkMipKYO0p20ri4aSXlrTWGdrgwKHWUdJ59J1kH0CHNgh1arwAN4VcoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRA6d5Is3WkEDQWiGi+/z77vuBhiBWM8PL+i8bQK2Krk1HCsc2
 gMtLdqCEhX12ssqbWSZ4VI3gCwlvQQasaqzkd7oCE3Hc8xhGQ3FtUz8jcg==
X-Gm-Gg: ASbGncubsXAxdd04m3w2kXcCGE1qZkNiUwNSOZuMOJQthhRsHpgs9mbN6yGP90EGCug
 cJTHO+ooGc/f/xNf3wVGyodejX/k1SGmTS5XqJY82+lNre8T/xZZs+7EkOKLSwouhshH5Wrw8K9
 qI/eBv8J9uaOE7XfFoa8MOD1ubCWOHva6BH4Wlzog+tFMqpR93n6x0CnSlbvlp1d3mxz2e1O/J6
 erMMU2MSWe78c2Lvna/XGTMyHSUjwABSMclNz275gO+VG9GEK5OJxfxC0U5meRCZwxoaCaw7lvq
 JOH6
X-Google-Smtp-Source: AGHT+IEMWxX0/uzzMrHt9tJYZsDsCSuLbXfj8lzaO0dFZsZ1a+TK2FXF0czZXfX8tlc/ooDwcS8SLQ==
X-Received: by 2002:a17:90b:544b:b0:2ee:5bc9:75c7 with SMTP id
 98e67ed59e1d1-2f452dfcce9mr89650129a91.5.1736136714578; 
 Sun, 05 Jan 2025 20:11:54 -0800 (PST)
Received: from distilledx.SRMIST.EDU.IN
 ([2401:4900:629b:9350:532b:226:f3fe:b873])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f4478aaa74sm32724463a91.45.2025.01.05.20.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 20:11:54 -0800 (PST)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: jo@jsfamily.in, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH] drm/panel: ebbg-ft8719: transition to mipi_dsi wrapped
 functions
Date: Mon,  6 Jan 2025 09:41:29 +0530
Message-ID: <20250106041129.114867-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.47.1
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

Changes the ebbg-ft8719 panel to use multi style functions for
improved error handling.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 67 ++++++-----------------
 1 file changed, 16 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
index e85d63a176d0..0bfed0ec0bbc 100644
--- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -57,65 +57,39 @@ static void ebbg_ft8719_reset(struct ebbg_ft8719 *ctx)
 static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display brightness: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00ff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 90);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(90);
-
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int ebbg_ft8719_off(struct ebbg_ft8719 *ctx)
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
-	usleep_range(10000, 11000);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
-	msleep(90);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 90);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int ebbg_ft8719_prepare(struct drm_panel *panel)
 {
 	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
-	struct device *dev = &ctx->dsi->dev;
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
@@ -126,7 +100,6 @@ static int ebbg_ft8719_prepare(struct drm_panel *panel)
 
 	ret = ebbg_ft8719_on(ctx);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 		return ret;
 	}
@@ -137,18 +110,10 @@ static int ebbg_ft8719_prepare(struct drm_panel *panel)
 static int ebbg_ft8719_unprepare(struct drm_panel *panel)
 {
 	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
-	struct device *dev = &ctx->dsi->dev;
-	int ret;
-
-	ret = ebbg_ft8719_off(ctx);
-	if (ret < 0)
-		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
 
+	ebbg_ft8719_off(ctx);
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-
-	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret)
-		dev_err(panel->dev, "Failed to disable regulators: %d\n", ret);
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 
 	return 0;
 }
-- 
2.47.1

