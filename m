Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BEF709131
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 10:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2392E10E5DA;
	Fri, 19 May 2023 08:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC6B10E5DA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 08:02:16 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-64d2ca9ef0cso652786b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 01:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1684483336; x=1687075336; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8spYBV8nyKWKYeG4NDoQ/0aWW8/yvL9GBRl394ZOTgQ=;
 b=48Ycx0w9ETePN6zCDTNyzLn3fTYcYUcqvdHRNclSazM0uNk5bEtBOrKxGwomN/MalF
 ncIECCBctTA3u9iQE73tfj3I0/iLZ7IdYt187weUX3bVXCP1Kdhywj8W3bdwBmLqFI/8
 DkyXtLOVOTJ21Ecrj43Y4wC/gRmNh3xeFgPQgtEQsDnuMKeGm5Pg9upY1dFISiXHzdTr
 W3WBIrBEnD5Vs62TLli5aalt1m8/0nsCVULe0c+X/EBpli5Bz31dExs32WD7WkB24C0h
 4oX9Xc/o/RbmeZwped5Bm2RWSsJcI4lOGhvMHzufBwDQw3EtjhAwzWYQWZdj1lWYYqL9
 PuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684483336; x=1687075336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8spYBV8nyKWKYeG4NDoQ/0aWW8/yvL9GBRl394ZOTgQ=;
 b=f38tubnrfblJVGf8SIN/gVu5ZS55lD1rcWwmWCVWzUHlqdI5dioscZombVpYYA5JYZ
 WprVl8MBX6QAWBnhWhn8HO6wBCfrEp30aVUC1E902t9VD9ewMfpVzR3inqTNLJr9j4+8
 PxVyKSN5JkOBJ+9dmuU0p/2BTjq8Ena+RgllKwOxjhFzIc5KpObOwiXAlqnWPWMs1ayj
 A3IWSJk+I2nzuHpUZwjxnGWN4R/AnALcfpx271IFm9ErvxuzvdvP5XerS+IN6oxy3cBm
 bDHfWZbLy5vVNNvVJ8tICwdjZHoxdyZ1N0TvhxF2XkSreYIlUYYG2EYAEX4KGFMlIhys
 qruw==
X-Gm-Message-State: AC+VfDxcCfsm2rtxlPDPGJ8yWPS9W7qim6RpoqNUfPMCFv1sEfPXDtmQ
 yQPoFSrjg2M5d8yb25jpgOTong==
X-Google-Smtp-Source: ACHHUZ7dAa8+gpbDh+yUxxmAZ0IwZeukT0168qN9bjs/+VqPkadxQzRXL8cWp1xUyYXuGnenvDlo/g==
X-Received: by 2002:a05:6a00:1403:b0:64a:2dd6:4f18 with SMTP id
 l3-20020a056a00140300b0064a2dd64f18mr2070488pfu.13.1684483335709; 
 Fri, 19 May 2023 01:02:15 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 e2-20020aa78242000000b0063b86aff031sm2441174pfn.108.2023.05.19.01.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 01:02:15 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Subject: [v1 1/2] drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI
 panel
Date: Fri, 19 May 2023 16:01:35 +0800
Message-Id: <20230519080136.4058243-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519080136.4058243-1-yangcong5@huaqin.corp-partner.google.com>
References: <20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com>
 <20230519080136.4058243-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Starry-himax83102-j02 panel is a TDDI IC. From the datasheet[1],
it seems that the touch can communicate successfully only when the RST
signal is high. Since i2c_hid_core_probe comes after boe_panel_prepare
let's set the default high for RST at boe_panel_add. Also MIPI needs to
keep the LP11 state before the lcm_reset pin is pulled high,So increase
lp11_before_reset flag.

[1]: https://github.com/HimaxSoftware/Doc/tree/main/Himax_Chipset_Power_Sequence

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 103 +++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index f5a6046f1d19..7aaa85b0de8a 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -37,6 +37,7 @@ struct panel_desc {
 	unsigned int lanes;
 	bool discharge_on_disable;
 	bool lp11_before_reset;
+	int enable_gpio_init_value;
 };
 
 struct boe_panel {
@@ -76,6 +77,75 @@ struct panel_init_cmd {
 	.len = sizeof((char[]){__VA_ARGS__}), \
 	.data = (char[]){__VA_ARGS__} }
 
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
 static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0xFF, 0x20),
 	_INIT_DCS_CMD(0xFB, 0x01),
@@ -1698,6 +1768,34 @@ static const struct panel_desc starry_qfh032011_53g_desc = {
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
+	.enable_gpio_init_value = 1,
+	.lp11_before_reset = true,
+};
 static int boe_panel_get_modes(struct drm_panel *panel,
 			       struct drm_connector *connector)
 {
@@ -1772,7 +1870,7 @@ static int boe_panel_add(struct boe_panel *boe)
 		return PTR_ERR(boe->enable_gpio);
 	}
 
-	gpiod_set_value(boe->enable_gpio, 0);
+	gpiod_set_value(boe->enable_gpio, boe->desc->enable_gpio_init_value);
 
 	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
@@ -1871,6 +1969,9 @@ static const struct of_device_id boe_of_match[] = {
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

