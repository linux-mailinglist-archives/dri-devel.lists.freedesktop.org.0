Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC0C91BEF2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 14:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130C810EC34;
	Fri, 28 Jun 2024 12:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="E5/jEJiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8578610EC34
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 12:45:51 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1f480624d0fso3438315ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 05:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1719578751; x=1720183551; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=klRQXqJY3KktJ6k1yD9MBmpg/ejmcwgU6PkV3TJWnho=;
 b=E5/jEJiHk0de+Q/uQ1GFC9U2uE73FbWhu9Ly9fxs4bLxKniA4Eh2BBQ6tAAdQpt0tB
 /gfH12XVgvJwJsimqNmNNJkXlfGQQHmLE0AHbby2Uvn7SJvmgj9hxr6qfDYc6OjIcCa6
 hXqxlftz7UyfN8wPGEWmDeq0XNRXPSTi/3LFy/s7eSTCQJnWPfxyk7VK2YNX8fFxtYJA
 fE9me9/lfS4m8tiQc5KckXy51+f+2SHwvKEHetAexyBUxMZPJDm9EqUToRi7tdFB11IE
 J6XKkO3191v9pL4zwDwUUFKapBtQau+PtT8s3nNYXgJWj4sJ+Sqf0OR18RXmLjPyp9mO
 8zFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719578751; x=1720183551;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=klRQXqJY3KktJ6k1yD9MBmpg/ejmcwgU6PkV3TJWnho=;
 b=rOc5cebU7LwF+G+m7POIA9JyVfP8lw6B6ujWiKcyYHqFwUA3+pI3JUcwb/ZWRH6gM2
 x0Fl92CU5sf0Xp2V4LoFDgG3E7tYCLc8mNUDlv55w1VpVXM9vWDk5BWrO0b/e7KVF5Vm
 apYiAky8zDSULEHVyQR1jE37SuIxJKrnPB/EPg5qPbDAQhvVoFRXyoZiJNCamrLqj6wF
 CzYBdrI74zGbeMXAaLoGHtVoF9bkkD743xKTj5yXpmcar2Z2MDUWxH2Mm2DU5bXGPfOG
 7I+VvRdBsowTcr2qNRDlEBafYLF1aeUjBK134MSvT6qguSgJ2Ge/Z8C1TgoJtdx4Evmn
 JwLw==
X-Gm-Message-State: AOJu0YzLamfKHKHTVrvTIq8DBcdbaiUNjEyQ2fx6vYZfrEBfglN4wOT8
 7zpTZ0nlbcpFE45ia7wTVM5zllQVHcR/+UFqX9hDWI3OxZupLYGe5c0FMnFi8f8=
X-Google-Smtp-Source: AGHT+IGTFb3gmYVkw9lDpDQPZWekyB3UUTtUCdQWgHzRB8+Xj13hkgumOG35cnHzPBToFoa/wt2FMg==
X-Received: by 2002:a17:902:d4cf:b0:1fa:acf0:72c8 with SMTP id
 d9443c01a7336-1faacf07699mr34789995ad.18.1719578750982; 
 Fri, 28 Jun 2024 05:45:50 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15695b4sm14346255ad.225.2024.06.28.05.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 05:45:50 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com,
 jagan@edgeble.ai, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v6 4/5] drm/panel: jd9365da: Support for kd101ne3-40ti
 MIPI-DSI panel
Date: Fri, 28 Jun 2024 20:44:43 +0800
Message-Id: <20240628124444.28152-5-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240628124444.28152-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240628124444.28152-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The K&d kd101ne3-40ti is a 10.1" WXGA TFT-LCD panel, use
jd9365da controller,which fits in nicely with the existing
panel-jadard-jd9365da-h3 driver.Hence,we add a new compatible
with panel specific config.

Although they have the same control IC, the two panels are different,
and the timing will be slightly different, so we added some variables
in struct jadard_panel_desc to control the timing.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes between V6 and V5:
-  1. No changes.
V5:https://lore.kernel.org/all/20240624141926.5250-5-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V5 and V4:
-  1. Add a "_ms" suffix to the variables.
-  2. Use more "_multi" in the enable/disable function
-  3. Use mipi_dsi_dcs_write_seq_multi() in the init() function.
V4:https://lore.kernel.org/all/20240620080509.18504-4-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V4 and V3:
-  1. Use mipi_dsi_msleep.
-  2. Adjust the ".clock" assignment format.
-  3. Adjust "compatible" positions to keep the list sorted.
V3:https://lore.kernel.org/all/20240614145510.22965-4-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V3 and V2:
-  1. Give up creating a new driver and re-add K&d kd101ne3-40ti 
-     configuration to the panel-jadard-jd9365da-h3.c driver.
V2:https://lore.kernel.org/all/20240601084528.22502-3-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
-  1. Use the new mipi_dsi_dcs_write_seq_multi() function.
-  2. Modify Move mipi_dsi_dcs_set_display_off() and mipi_dsi_dcs_enter_sleep_mode() to disable(),
-  and drop kingdisplay_panel_enter_sleep_mode().
-  3. If prepare fails, disable GPIO before regulators.
-  4. This function drm_connector_set_panel_orientation() is no longer used. Delete it.
-  5. Drop ".shutdown = kingdisplay_panel_shutdown".
---
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 277 ++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index ff232a83297f..b5265d95be4e 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -27,6 +27,15 @@ struct jadard_panel_desc {
 	enum mipi_dsi_pixel_format format;
 	int (*init)(struct jadard *jadard);
 	u32 num_init_cmds;
+	bool lp11_before_reset;
+	bool reset_before_power_off_vcioo;
+	unsigned int vcioo_to_lp11_delay_ms;
+	unsigned int lp11_to_reset_delay_ms;
+	unsigned int exit_sleep_to_display_on_delay_ms;
+	unsigned int display_on_delay_ms;
+	unsigned int backlight_off_to_display_off_delay_ms;
+	unsigned int display_off_to_enter_sleep_delay_ms;
+	unsigned int enter_sleep_to_reset_down_delay_ms;
 };
 
 struct jadard {
@@ -53,8 +62,14 @@ static int jadard_enable(struct drm_panel *panel)
 
 	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
+	if (jadard->desc->exit_sleep_to_display_on_delay_ms)
+		mipi_dsi_msleep(&dsi_ctx, jadard->desc->exit_sleep_to_display_on_delay_ms);
+
 	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
+	if (jadard->desc->display_on_delay_ms)
+		mipi_dsi_msleep(&dsi_ctx, jadard->desc->display_on_delay_ms);
+
 	return dsi_ctx.accum_err;
 }
 
@@ -63,10 +78,19 @@ static int jadard_disable(struct drm_panel *panel)
 	struct jadard *jadard = panel_to_jadard(panel);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
 
+	if (jadard->desc->backlight_off_to_display_off_delay_ms)
+		mipi_dsi_msleep(&dsi_ctx, jadard->desc->backlight_off_to_display_off_delay_ms);
+
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
+	if (jadard->desc->display_off_to_enter_sleep_delay_ms)
+		mipi_dsi_msleep(&dsi_ctx, jadard->desc->display_off_to_enter_sleep_delay_ms);
+
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
+	if (jadard->desc->enter_sleep_to_reset_down_delay_ms)
+		mipi_dsi_msleep(&dsi_ctx, jadard->desc->enter_sleep_to_reset_down_delay_ms);
+
 	return dsi_ctx.accum_err;
 }
 
@@ -83,6 +107,18 @@ static int jadard_prepare(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
+	if (jadard->desc->vcioo_to_lp11_delay_ms)
+		msleep(jadard->desc->vcioo_to_lp11_delay_ms);
+
+	if (jadard->desc->lp11_before_reset) {
+		ret = mipi_dsi_dcs_nop(jadard->dsi);
+		if (ret)
+			return ret;
+	}
+
+	if (jadard->desc->lp11_to_reset_delay_ms)
+		msleep(jadard->desc->lp11_to_reset_delay_ms);
+
 	gpiod_set_value(jadard->reset, 1);
 	msleep(5);
 
@@ -106,6 +142,12 @@ static int jadard_unprepare(struct drm_panel *panel)
 	gpiod_set_value(jadard->reset, 1);
 	msleep(120);
 
+	if (jadard->desc->reset_before_power_off_vcioo) {
+		gpiod_set_value(jadard->reset, 0);
+
+		usleep_range(1000, 2000);
+	}
+
 	regulator_disable(jadard->vdd);
 	regulator_disable(jadard->vccio);
 
@@ -569,6 +611,237 @@ static const struct jadard_panel_desc cz101b4001_desc = {
 	.init = cz101b4001_init_cmds,
 };
 
+static int kingdisplay_kd101ne3_init_cmds(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x7e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x39);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x36);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x39);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x6c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0xb4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x6c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x6c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xbb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
+
+	return dsi_ctx.accum_err;
+};
+
+static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
+	.mode = {
+		.clock		= (800 + 24 + 24 + 24) * (1280 + 30 + 4 + 8) * 60 / 1000,
+
+		.hdisplay	= 800,
+		.hsync_start	= 800 + 24,
+		.hsync_end	= 800 + 24 + 24,
+		.htotal		= 800 + 24 + 24 + 24,
+
+		.vdisplay	= 1280,
+		.vsync_start	= 1280 + 30,
+		.vsync_end	= 1280 + 30 + 4,
+		.vtotal		= 1280 + 30 + 4 + 8,
+
+		.width_mm	= 135,
+		.height_mm	= 216,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = kingdisplay_kd101ne3_init_cmds,
+	.lp11_before_reset = true,
+	.reset_before_power_off_vcioo = true,
+	.vcioo_to_lp11_delay_ms = 5,
+	.lp11_to_reset_delay_ms = 10,
+	.exit_sleep_to_display_on_delay_ms = 120,
+	.display_on_delay_ms = 20,
+	.backlight_off_to_display_off_delay_ms = 100,
+	.display_off_to_enter_sleep_delay_ms = 50,
+	.enter_sleep_to_reset_down_delay_ms = 100,
+};
+
 static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -637,6 +910,10 @@ static const struct of_device_id jadard_of_match[] = {
 		.compatible = "chongzhou,cz101b4001",
 		.data = &cz101b4001_desc
 	},
+	{
+		.compatible = "kingdisplay,kd101ne3-40ti",
+		.data = &kingdisplay_kd101ne3_40ti_desc
+	},
 	{
 		.compatible = "radxa,display-10hd-ad001",
 		.data = &cz101b4001_desc
-- 
2.17.1

