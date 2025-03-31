Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96EBA75ECA
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 08:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF1C10E076;
	Mon, 31 Mar 2025 06:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aQOU3ViF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A0010E076
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 06:18:48 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3032aa1b764so5202421a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 23:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743401928; x=1744006728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YqfZ9w/ImUwiK75rO1HvxehLxAen84p9wgdPi0LkNec=;
 b=aQOU3ViF4B+b6gWT7pZkA1X+Zw6BGcw5w+BY9DOeXijcJYLnI1fxfiwO12qb4U7I45
 v1dMJ9PRhFh5HUetfaowOd6iCnNVitlqEUHujCgURG4fILjn0lwqoazMsYBg/NjOWi+L
 Mlm7Fjjb8npR/S5POi8DU8FJzuwO/of4RmkuyBDV6mk7eZCftR+QA628IAJNyQC73jyq
 l8PE20dCl7CnaNNVPaqvogHdbEz1m2K3CRk9KmXO+EVFE7lg2Y5Ka2lPxXUzhrmW/RP9
 CWHGR+QnNQtTu2cVRHfnV0og34IHz7oXdT3KgpvD9iAeIeQ8xWK4qSgU47BNaM/x/ECC
 W9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743401928; x=1744006728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YqfZ9w/ImUwiK75rO1HvxehLxAen84p9wgdPi0LkNec=;
 b=ds7jczElHwQcdEmik6PDkQielToVv1NzHZ6F8mCnTw9I7Fv9jwr8UJ2uxoG9I7GCj/
 LeTUCM7DpBDia52uxK2/yB5cp5julVo2lY2jbq5Rt+x2bUfSy6rvX/UYXj2UhDuyhBg+
 nKoQ55TwvvYv9vLaxsU1r0G7fdOGrAtv2siN+1Wf2gownzLeEROviIdx9vvMfyaV3w6n
 2erqrG+CyjUtZa5VpPFIwkPuagpepPUXvrV9IBcGnKGxbyqXvVb5ltEESv0psS3aw1RU
 09rISG/zZE6QZlZtnRlpVNBQh6r9nmjabNjd4Ig7Ss7pneVF4tgHQGMbkRYkNj0Z/weE
 50TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpxOvaZbdzZ/FB1j21k2G04GGxAOSZd2xx3CAXjk6+uRwKmI5H7lFZ7Rg554gVon/AkX/DnnDXZw8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXmNdBM2SwwvZEeQ0JReksnL6K33w3G1qnPMSU/5cDOy9EHFvB
 fldIqd42C/yDTAocN6VPxVQYhFjIQ2qwA8n8noIAqbZPMOausO3QCjRfaq5l
X-Gm-Gg: ASbGncvkVx3wj/oX6j/kb5ijGKCk57mCUhYVYUspGiJ998qVzoOenugtWHQ9zDjunrP
 3/uJpGvNPUVX+ioabXSmQRxEN80VZirzl7R9PCGb0Y/fmbTX5WYibi/1OlrIKXpG6VSt0YTOWgm
 2SFutgGAQeRDSpAPxW8MAH0ISQwXYHPQp6tiI7hrm2MreBqhKao+4eqoMv5gDCPhLUSWpCTsqDU
 hWUoBrRgZ7srnN8VbvqnLvU3JdyuILLedCWrhyJ5g8IRLZmMh+P7Ne9vUXYbq1yrOq6XBvKUoc0
 +kIuCprm2DKEFyBNc/MRken0M4OtcF69JmnTx7CazAn6cZ0TL48fOS9nzAydVRUi
X-Google-Smtp-Source: AGHT+IHaC2BICbj8uY5XRfbnRS9PlYZs2JBVZA/EL8010zewr1McTuIX82yBfpRHcKhShSMuoQVtFA==
X-Received: by 2002:a17:90a:f946:b0:2ee:94d1:7a89 with SMTP id
 98e67ed59e1d1-30531f7c875mr9920707a91.1.1743401928351; 
 Sun, 30 Mar 2025 23:18:48 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([103.4.222.252])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3039e10c545sm8847841a91.23.2025.03.30.23.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 23:18:47 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
Date: Mon, 31 Mar 2025 11:48:38 +0530
Message-ID: <20250331061838.167781-1-tejasvipin76@gmail.com>
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
failures.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
Changes in v2:
    - Always set MIPI_DSI_MODE_LPM in boe_bf060y8m_aj0_off

Link to v1: https://lore.kernel.org/all/20250330151304.128417-1-tejasvipin76@gmail.com/
---
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 109 +++++++-----------
 1 file changed, 41 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 7e66db4a88bb..3b174b4a41b6 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -55,71 +55,51 @@ static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
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
@@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
 
 	ret = boe_bf060y8m_aj0_on(boe);
 	if (ret < 0) {
-		dev_err(dev, "Failed to initialize panel: %d\n", ret);
 		gpiod_set_value_cansleep(boe->reset_gpio, 1);
 		return ret;
 	}
@@ -178,15 +157,11 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
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
@@ -234,13 +209,11 @@ static int boe_bf060y8m_aj0_bl_update_status(struct backlight_device *bl)
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

