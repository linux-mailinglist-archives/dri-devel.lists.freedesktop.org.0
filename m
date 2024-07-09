Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FDE92BBC6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DEC10E55F;
	Tue,  9 Jul 2024 13:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="sFh1IfM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17EE10E55F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:48:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1fb53bfb6easo22029005ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1720532931; x=1721137731; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0LDer4lgG10CfZwv78g2/1O/QsyYKSsveDj/sHWq8Y0=;
 b=sFh1IfM8zzTdbHZgfRzpIUPRuhWzNvPvclpmkO5EP1izYA2P9zneMVXuN4bV7INH5X
 Gp20y4fnr2CHWquwcQXa16BZPxu91U+YDYQq6UmaIF4dUNu5yxZT4DNqTfF/wzxloWUp
 BQLctFjXDVPMs8tJQdm1fYqYLGkTIB2NbeXd8WFNrKVAkUXLKlJSUuWRTdjxnOkgo/ck
 bmQhzEKaxjy7HsSZxSIt2EOyRx33b32Hcz2cEY9wjrmE7kHnEHi0DFAvkN69stFYgXRV
 qQtUa2IrikwVdhmMbm0xVNS0cgaQ3/6gRWLBb6qeJur0sB2n62Sz3EAgcNCd7tMXBVbi
 yomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532931; x=1721137731;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LDer4lgG10CfZwv78g2/1O/QsyYKSsveDj/sHWq8Y0=;
 b=fpUEi/yMTea623IecWWYLWbNZIoyTxte42xWlWZo/w47gCaReJ+wxEoJuM9TdFCn/D
 tN3EasHswuOWCmSLBTz5jDcN/XpbCNJl9skQWq5xZxBlEgVfgzzKlEjmWb9h3vdpJB4B
 mE9GdaDnog8GoHIgBUb1HmZTTFYU2lIAdFqdQKP1SUP0mw8dMaJvc4dedR33c8kHGb2j
 0I+wuNGI9SFvZcXh4nH0hMUcCt1xZ8d6qPS5YRxwbHtN9ezqiHogbqODw/cM28xx7U7l
 sEW74gjPWipipEVPZEGWojoDGIVszbN0HVZqUh5OB2H3O5WrnHyD8vXj7mV/l7fgFqXv
 4HIA==
X-Gm-Message-State: AOJu0YyC2mfZLe5zKfmtMYh983V1nh471DVQ7jw5dqsyGCuOIigIH+Wb
 eYg9gYZ4hn+9jLoU31Rr1fTYg+onK6GY0YSVIY1f8xDjVQyj+eXTM+yMnPtXQ1g=
X-Google-Smtp-Source: AGHT+IEtRsRUTkkAu9rxsEOQiPZlA0Ipx5vAQh5WtecZ3b2Kq2sfW2mId2orsJOk1NcJPnyoJ7RbSQ==
X-Received: by 2002:a17:902:ecce:b0:1fb:7e13:a7cd with SMTP id
 d9443c01a7336-1fbb6d34be6mr22069205ad.37.1720532931188; 
 Tue, 09 Jul 2024 06:48:51 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab6b9fsm16211685ad.138.2024.07.09.06.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:48:50 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@google.com, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v6 5/5] drm/panel: boe-th101mb31ig002: Support for
 starry-er88577 MIPI-DSI panel
Date: Tue,  9 Jul 2024 21:47:54 +0800
Message-Id: <20240709134754.28013-6-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240709134754.28013-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The init_code of the starry-er88577 panel is very similar to the
panel-boe-th101mb31ig002-28a.c driver, so we make it compatible with
the panel-boe-th101mb31ig002-28a.c driver

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes between V6 and V5:
-  1. Add two lines of init_code (D1 and D3) to modify the internal resistance of the mipi channel.
v5: https://lore.kernel.org/all/20240704072958.27876-6-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V5 and V4:
-  1. Compatible with starry-er88577 panel in panel-boe-th101mb31ig002-28a.c driver,.
v4: https://lore.kernel.org/all/20240620115245.31540-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
-  1. Adjust the ".clock" assignment format.
v3: https://lore.kernel.org/all/20240614145609.25432-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
-  Separate Starry-er88577 from the panel-kingdisplay-kd101ne3 driver.
-  Use mipi_dsi_dcs_set_display_on_multi().
-  Use mipi_dsi_dcs_exit_sleep_mode_multi() and mipi_dsi_msleep().
v2: https://lore.kernel.org/all/20240601084528.22502-5-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  Add compatible for Starry er88577 in panel-kingdisplay-kd101ne3 drivers.
---
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index 5993e6c0cc4a..b55cf80c5522 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -25,6 +25,12 @@ struct panel_desc {
 	enum mipi_dsi_pixel_format format;
 	int (*init)(struct boe_th101mb31ig002 *ctx);
 	unsigned int lanes;
+	bool lp11_before_reset;
+	unsigned int vcioo_to_lp11_delay_ms;
+	unsigned int lp11_to_reset_delay_ms;
+	unsigned int backlight_off_to_display_off_delay_ms;
+	unsigned int enter_sleep_to_reset_down_delay_ms;
+	unsigned int power_off_delay_ms;
 };
 
 struct boe_th101mb31ig002 {
@@ -108,6 +114,68 @@ static int boe_th101mb31ig002_enable(struct boe_th101mb31ig002 *ctx)
 	return dsi_ctx.accum_err;
 }
 
+static int starry_er88577_init_cmd(struct boe_th101mb31ig002 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	msleep(70);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xab, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0xba, 0xab);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x10, 0x01, 0x47, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x0c, 0x14, 0x04, 0x50, 0x50, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x56, 0x53, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x33, 0x30, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0xb0, 0x00, 0x00, 0x10, 0x00, 0x10,
+					       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x05, 0x12, 0x29, 0x49, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x7c, 0x61, 0x4f, 0x42, 0x3e, 0x2d,
+					       0x31, 0x1a, 0x33, 0x33, 0x33, 0x52, 0x40,
+					       0x47, 0x38, 0x34, 0x26, 0x0e, 0x06, 0x7c,
+					       0x61, 0x4f, 0x42, 0x3e, 0x2d, 0x31, 0x1a,
+					       0x33, 0x33, 0x33, 0x52, 0x40, 0x47, 0x38,
+					       0x34, 0x26, 0x0e, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0xcc, 0x76, 0x12, 0x34, 0x44, 0x44,
+					       0x44, 0x44, 0x98, 0x04, 0x98, 0x04, 0x0f,
+					       0x00, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x54, 0x94, 0x02, 0x85, 0x9f, 0x00,
+					       0x6f, 0x00, 0x54, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x17, 0x09, 0x08, 0x89, 0x08, 0x11,
+					       0x22, 0x20, 0x44, 0xff, 0x18, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x87, 0x47, 0x05, 0x05, 0x1c, 0x1c,
+					       0x1d, 0x1d, 0x02, 0x1e, 0x1e, 0x1f, 0x1f,
+					       0x0f, 0x0f, 0x0d, 0x0d, 0x13, 0x13, 0x11,
+					       0x11, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x06, 0x06, 0x04, 0x04, 0x1c, 0x1c,
+					       0x1d, 0x1d, 0x02, 0x1e, 0x1e, 0x1f, 0x1f,
+					       0x0e, 0x0e, 0x0c, 0x0c, 0x12, 0x12, 0x10,
+					       0x10, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x21, 0x00, 0x31, 0x42, 0x34, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0xcb, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x0e, 0x4b, 0x4b, 0x20, 0x19, 0x6b,
+					       0x06, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1, 0x40, 0x0d, 0xff, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0xe3, 0x2b, 0x38, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3, 0x00, 0x00, 0x00, 0x00,
+					       0x00, 0x33, 0x20, 0x3a, 0xd5, 0x86, 0xf3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x00, 0x01, 0x00, 0x0e, 0x04, 0x44,
+					       0x08, 0x10, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x80, 0x09, 0xff, 0xff, 0xff, 0xff,
+					       0xff, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x12, 0x03, 0x20, 0x00, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 20);
+
+	return dsi_ctx.accum_err;
+}
+
 static int boe_th101mb31ig002_disable(struct drm_panel *panel)
 {
 	struct boe_th101mb31ig002 *ctx = container_of(panel,
@@ -115,12 +183,18 @@ static int boe_th101mb31ig002_disable(struct drm_panel *panel)
 						      panel);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
+	if (ctx->desc->backlight_off_to_display_off_delay_ms)
+		mipi_dsi_msleep(&dsi_ctx, ctx->desc->backlight_off_to_display_off_delay_ms);
+
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
 	mipi_dsi_msleep(&dsi_ctx, 120);
 
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
+	if (ctx->desc->enter_sleep_to_reset_down_delay_ms)
+		mipi_dsi_msleep(&dsi_ctx, ctx->desc->enter_sleep_to_reset_down_delay_ms);
+
 	return dsi_ctx.accum_err;
 }
 
@@ -134,6 +208,9 @@ static int boe_th101mb31ig002_unprepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(ctx->enable, 0);
 	regulator_disable(ctx->power);
 
+	if (ctx->desc->power_off_delay_ms)
+		msleep(ctx->desc->power_off_delay_ms);
+
 	return 0;
 }
 
@@ -151,6 +228,18 @@ static int boe_th101mb31ig002_prepare(struct drm_panel *panel)
 		return ret;
 	}
 
+	if (ctx->desc->vcioo_to_lp11_delay_ms)
+		msleep(ctx->desc->vcioo_to_lp11_delay_ms);
+
+	if (ctx->desc->lp11_before_reset) {
+		ret = mipi_dsi_dcs_nop(ctx->dsi);
+		if (ret)
+			return ret;
+	}
+
+	if (ctx->desc->lp11_to_reset_delay_ms)
+		msleep(ctx->desc->lp11_to_reset_delay_ms);
+
 	gpiod_set_value_cansleep(ctx->enable, 1);
 	msleep(50);
 	boe_th101mb31ig002_reset(ctx);
@@ -187,6 +276,36 @@ static const struct panel_desc boe_th101mb31ig002_desc = {
 	.init = boe_th101mb31ig002_enable,
 };
 
+static const struct drm_display_mode starry_er88577_default_mode = {
+	.clock	= (800 + 25 + 25 + 25) * (1280 + 20 + 4 + 12) * 60 / 1000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 25,
+	.hsync_end = 800 + 25 + 25,
+	.htotal = 800 + 25 + 25 + 25,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 20,
+	.vsync_end = 1280 + 20 + 4,
+	.vtotal = 1280 + 20 + 4 + 12,
+	.width_mm = 135,
+	.height_mm = 216,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc starry_er88577_desc = {
+	.modes = &starry_er88577_default_mode,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init = starry_er88577_init_cmd,
+	.lp11_before_reset = true,
+	.vcioo_to_lp11_delay_ms = 5,
+	.lp11_to_reset_delay_ms = 50,
+	.backlight_off_to_display_off_delay_ms = 100,
+	.enter_sleep_to_reset_down_delay_ms = 100,
+	.power_off_delay_ms = 1000,
+};
+
 static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
 					struct drm_connector *connector)
 {
@@ -313,6 +432,10 @@ static const struct of_device_id boe_th101mb31ig002_of_match[] = {
 		.compatible = "boe,th101mb31ig002-28a",
 		.data = &boe_th101mb31ig002_desc
 	},
+	{
+		.compatible = "starry,er88577",
+		.data = &starry_er88577_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_th101mb31ig002_of_match);
-- 
2.17.1

