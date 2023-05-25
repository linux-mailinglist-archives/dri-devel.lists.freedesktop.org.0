Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F071030F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 04:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CA810E628;
	Thu, 25 May 2023 02:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D0A10E626
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 02:50:30 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5304913530fso955496a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 19:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1684983030; x=1687575030; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/CJNJchATCPkxIGeEGlUrxEfsyj8dI4b4dLgXJyu4c=;
 b=seOm5+a0zkAICOxseXsgCreJLCc6VfKJhcd32DS6QV67A1QdhRalgOc2PP97AKW5OY
 3BSCawy0DV9VmXmwOfto3ffdGyMj+ZSuQG5tpNLVYuOGw3nImpWBzTJ2bFGQLBtdFAbW
 Fig/LvpvgBlv+UzufpxNZwvTTYFFpOyYP8izHcx+uHXLOU6m3pKgh9JQcE8sUymHHyn2
 wisHbFUIRTmrwhNOIIrsRd3df6+y3BHLaOSiNYUf+wEUslNYPAFbhLo6pLJaIF5rBWiY
 gWQW5kNmliVIO15V7P56eFTxtCiQ2HRgoCS7Q8W848m8SClAcEIl+wOx76bS8raGYYWX
 3pNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684983030; x=1687575030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I/CJNJchATCPkxIGeEGlUrxEfsyj8dI4b4dLgXJyu4c=;
 b=O8nF9SF0xiJWDXWd9qiqdcbIZZn6kfm/PR3tvwBM1N+CRO5SVcMVP+bnSh32c0jbIf
 FqUiRSy/iK/EPM/KGcN5e800YzmOI6HC7dI0rfDAxBZ7+7NM3JgrFo2U3myBRdN5CPSz
 O3R4gE9L8nAQzzzR2dTtFZhrW0n/jcYTM9FkRpPfIAoqiKUtI7KbmoY0KINJAiqPxQqo
 pSS4dkERrBarHFiNAUvuurJ53M3Z261WnJQ8UxBEPeThMe0al7XqLXXxN9IYf7kOzBbn
 R4K79rIOpxkM5JF4IxCqkzDyQA4FcsldNSg0tu/8DMeh+X58C0KqalwO7kcSRPqyWddO
 vRkA==
X-Gm-Message-State: AC+VfDwoGcWAPl2ou+p4bXWUcAe80cq77XtW1FCga46HurzdgM4hf79A
 BtYj4Et11RPMHAY6yOSQ0BaUP/+dFv+6BLbBKO0=
X-Google-Smtp-Source: ACHHUZ4d6/xyhbyAIyxkcdJBlTd/wUuPCb4o0kcZrcxRJBYvTpKIVF87ScG2vFtWl15OMyXc3wHufQ==
X-Received: by 2002:a05:6a20:72a8:b0:10c:1047:68b9 with SMTP id
 o40-20020a056a2072a800b0010c104768b9mr11323874pzk.50.1684983030026; 
 Wed, 24 May 2023 19:50:30 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090a734600b00253239144c5sm171815pjs.42.2023.05.24.19.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 19:50:29 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@chromium.org
Subject: [v3 2/4] drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI
 panel
Date: Thu, 25 May 2023 10:49:58 +0800
Message-Id: <20230525025000.3692510-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525025000.3692510-1-yangcong5@huaqin.corp-partner.google.com>
References: <CAD=FV=XUuzjjLq3YP3683jOd06odwk5Dox5MS8oY8goB-_8T5w@mail.gmail.com>
 <20230525025000.3692510-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Starry-himax83102-j02 is a 10.51" WUXGA TFT panel. which fits in nicely
with the existing panel-boe-tv101wum-nl6 driver. From the datasheet[1], MIPI
needs to keep the LP11 state before the lcm_reset pin is pulled high, so
increase lp11_before_reset flag.

[1]: https://github.com/HimaxSoftware/Doc/tree/main/Himax_Chipset_Power_Sequence

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index f5a6046f1d19..0772d96e446c 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1301,6 +1301,75 @@ static const struct panel_init_cmd starry_qfh032011_53g_init_cmd[] = {
 	{},
 };
 
+static const struct panel_init_cmd starry_himax83102_j02_init_cmd[] = {
+	_INIT_DCS_CMD(0xB9, 0x83, 0x10, 0x21, 0x55, 0x00),
+	_INIT_DCS_CMD(0xB1, 0x2C, 0xB5, 0xB5, 0x31, 0xF1, 0x31, 0xD7, 0x2F, 0x36, 0x36, 0x36, 0x36, 0x1A, 0x8B, 0x11,
+		0x65, 0x00, 0x88, 0xFA, 0xFF, 0xFF, 0x8F, 0xFF, 0x08, 0x74, 0x33),
+	_INIT_DCS_CMD(0xB2, 0x00, 0x47, 0xB0, 0x80, 0x00, 0x12, 0x72, 0x3C, 0xA3, 0x03, 0x03, 0x00, 0x00, 0x88, 0xF5),
+	_INIT_DCS_CMD(0xB4, 0x76, 0x76, 0x76, 0x76, 0x76, 0x76, 0x63, 0x5C, 0x63, 0x5C, 0x01, 0x9E),
+	_INIT_DCS_CMD(0xE9, 0xCD),
+	_INIT_DCS_CMD(0xBA, 0x84),
+	_INIT_DCS_CMD(0xE9, 0x3F),
+	_INIT_DCS_CMD(0xBC, 0x1B, 0x04),
+	_INIT_DCS_CMD(0xBE, 0x20),
+	_INIT_DCS_CMD(0xBF, 0xFC, 0xC4),
+	_INIT_DCS_CMD(0xC0, 0x36, 0x36, 0x22, 0x11, 0x22, 0xA0, 0x61, 0x08, 0xF5, 0x03),
+	_INIT_DCS_CMD(0xE9, 0xCC),
+	_INIT_DCS_CMD(0xC7, 0x80),
+	_INIT_DCS_CMD(0xE9, 0x3F),
+	_INIT_DCS_CMD(0xE9, 0xC6),
+	_INIT_DCS_CMD(0xC8, 0x97),
+	_INIT_DCS_CMD(0xE9, 0x3F),
+	_INIT_DCS_CMD(0xC9, 0x00, 0x1E, 0x13, 0x88, 0x01),
+	_INIT_DCS_CMD(0xCB, 0x08, 0x13, 0x07, 0x00, 0x0F, 0x33),
+	_INIT_DCS_CMD(0xCC, 0x02),
+	_INIT_DCS_CMD(0xE9, 0xC4),
+	_INIT_DCS_CMD(0xD0, 0x03),
+	_INIT_DCS_CMD(0xE9, 0x3F),
+	_INIT_DCS_CMD(0xD1, 0x37, 0x06, 0x00, 0x02, 0x04, 0x0C, 0xFF),
+	_INIT_DCS_CMD(0xD2, 0x1F, 0x11, 0x1F),
+	_INIT_DCS_CMD(0xD3, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x08, 0x37, 0x47, 0x34, 0x3B, 0x12, 0x12, 0x03,
+		0x03, 0x32, 0x10, 0x10, 0x00, 0x10, 0x32, 0x10, 0x08, 0x00, 0x08, 0x32, 0x17, 0x94, 0x07, 0x94, 0x00, 0x00),
+	_INIT_DCS_CMD(0xD5, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19, 0x40, 0x40, 0x1A, 0x1A,
+		0x1B, 0x1B, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x20, 0x21, 0x28, 0x29, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18),
+	_INIT_DCS_CMD(0xD6, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x40, 0x40, 0x19, 0x19, 0x1A, 0x1A,
+		0x1B, 0x1B, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x29, 0x28, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18),
+	_INIT_DCS_CMD(0xD8, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA,
+		0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0),
+	_INIT_DCS_CMD(0xE0, 0x00, 0x09, 0x14, 0x1E, 0x26, 0x48, 0x61, 0x67, 0x6C, 0x67, 0x7D, 0x7F, 0x80, 0x8B, 0x87, 0x8F, 0x98, 0xAB,
+		0xAB, 0x55, 0x5C, 0x68, 0x73, 0x00, 0x09, 0x14, 0x1E, 0x26, 0x48, 0x61, 0x67, 0x6C, 0x67, 0x7D, 0x7F, 0x80, 0x8B, 0x87, 0x8F, 0x98, 0xAB, 0xAB, 0x55, 0x5C, 0x68, 0x73),
+	_INIT_DCS_CMD(0xE7, 0x0E, 0x10, 0x10, 0x21, 0x2B, 0x9A, 0x02, 0x54, 0x9A, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12, 0x05, 0x02, 0x02, 0x10),
+	_INIT_DCS_CMD(0xBD, 0x01),
+	_INIT_DCS_CMD(0xB1, 0x01, 0xBF, 0x11),
+	_INIT_DCS_CMD(0xCB, 0x86),
+	_INIT_DCS_CMD(0xD2, 0x3C, 0xFA),
+	_INIT_DCS_CMD(0xE9, 0xC5),
+	_INIT_DCS_CMD(0xD3, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x01),
+	_INIT_DCS_CMD(0xE9, 0x3F),
+	_INIT_DCS_CMD(0xE7, 0x02, 0x00, 0x28, 0x01, 0x7E, 0x0F, 0x7E, 0x10, 0xA0, 0x00, 0x00, 0x20, 0x40, 0x50, 0x40),
+	_INIT_DCS_CMD(0xBD, 0x02),
+	_INIT_DCS_CMD(0xD8, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA, 0xA0, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA, 0xA0),
+	_INIT_DCS_CMD(0xE7, 0xFE, 0x04, 0xFE, 0x04, 0xFE, 0x04, 0x03, 0x03, 0x03, 0x26, 0x00, 0x26, 0x81, 0x02, 0x40, 0x00, 0x20, 0x9E, 0x04, 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00),
+	_INIT_DCS_CMD(0xBD, 0x03),
+	_INIT_DCS_CMD(0xE9, 0xC6),
+	_INIT_DCS_CMD(0xB4, 0x03, 0xFF, 0xF8),
+	_INIT_DCS_CMD(0xE9, 0x3F),
+	_INIT_DCS_CMD(0xD8, 0x00, 0x2A, 0xAA, 0xA8, 0x00, 0x00, 0x00, 0x2A, 0xAA, 0xA8, 0x00, 0x00, 0x00, 0x3F, 0xFF, 0xFC, 0x00, 0x00, 0x00, 0x3F, 0xFF, 0xFC, 0x00, 0x00, 0x00, 0x2A, 0xAA, 0xA8, 			0x00, 0x00, 0x00, 0x2A, 0xAA, 0xA8, 0x00, 0x00),
+	_INIT_DCS_CMD(0xBD, 0x00),
+	_INIT_DCS_CMD(0xE9, 0xC4),
+	_INIT_DCS_CMD(0xBA, 0x96),
+	_INIT_DCS_CMD(0xE9, 0x3F),
+	_INIT_DCS_CMD(0xBD, 0x01),
+	_INIT_DCS_CMD(0xE9, 0xC5),
+	_INIT_DCS_CMD(0xBA, 0x4F),
+	_INIT_DCS_CMD(0xE9, 0x3F),
+	_INIT_DCS_CMD(0xBD, 0x00),
+	_INIT_DCS_CMD(0x11),
+	_INIT_DELAY_CMD(120),
+	_INIT_DCS_CMD(0x29),
+	{},
+};
+
 static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
 {
 	return container_of(panel, struct boe_panel, base);
@@ -1698,6 +1767,34 @@ static const struct panel_desc starry_qfh032011_53g_desc = {
 	.init_cmds = starry_qfh032011_53g_init_cmd,
 };
 
+static const struct drm_display_mode starry_himax83102_j02_default_mode = {
+	.clock = 161600,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 40,
+	.hsync_end = 1200 + 40 + 20,
+	.htotal = 1200 + 40 + 20 + 40,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 116,
+	.vsync_end = 1920 + 116 + 8,
+	.vtotal = 1920 + 116 + 8 + 12,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc starry_himax83102_j02_desc = {
+	.modes = &starry_himax83102_j02_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 141,
+		.height_mm = 226,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = starry_himax83102_j02_init_cmd,
+	.lp11_before_reset = true,
+};
+
 static int boe_panel_get_modes(struct drm_panel *panel,
 			       struct drm_connector *connector)
 {
@@ -1871,6 +1968,9 @@ static const struct of_device_id boe_of_match[] = {
 	{ .compatible = "starry,2081101qfh032011-53g",
 	  .data = &starry_qfh032011_53g_desc
 	},
+	{ .compatible = "starry,himax83102-j02",
+	  .data = &starry_himax83102_j02_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_of_match);
-- 
2.25.1

