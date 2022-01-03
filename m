Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 036034830A6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 12:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2B310E162;
	Mon,  3 Jan 2022 11:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B96A10E18A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 11:41:03 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s4so37375341ljd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 03:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4/CGTb3gisk7VPqBxNCUWiod5eCACmTEiATwddBHYD8=;
 b=UJY7R+sj9bifbmp5f5AHtGOYXxoC3InQwjYIL3qwmdelSkLVtjdBYj9CcvhWPJZ7nz
 8MpLXHfuMUh4KN83wLccxV1kGMWTLFFjnKILH1dMxe+j3lhoxwiy12/eKhrtBC6M8ynu
 C3PaousSzOqik4UiTqlVe9UlbKeZghUhnh/IAhuzhGs9eTD5tvc7ktv4QoW/C3pIDvHw
 NUrnhN4Jg7KWtUcFoEXfgNI2XXLqnoDGjQJjZELoKSre6T0wy7mJs1hf/Fg903zG8VVH
 OcI8nVf8zZXAhMMLIxfgg4W/zEdqwpm6pBWlTnVkchnPUgVD3n7mT3lFQXlCxP89Jji2
 haLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4/CGTb3gisk7VPqBxNCUWiod5eCACmTEiATwddBHYD8=;
 b=oRc/6aYa+R90ADBQOBPXCaOkIu+8xSVepgpBmW5Cw0mAd+ZyKmbvhnYXx0yFGJfdRW
 DkfDER/CbSdIj4fUDsXbp0X3Y/NOjqeTrgE7eQjCbJVXqf+EvBnf8RPhSXOMadxe83V8
 STS6whZ29rKjWAkBhTY1lsXpHjnZMho6Q5A7DqCtlyJoaygm9L1SGejPujcOJcaVAYGL
 UMZsBY3Fqx5APaqkUwdXwMQZE8MQVo/SWbUNyM3KKOAzT/3XJsZoIxSI8AoGOOq2RUEP
 veJkgkhCvKsK3n/wvuWZqFt/m7eM7Ep20Ft5GUoCHqXHTmRzmNVuB+V3rApyjEhvpJLu
 otmg==
X-Gm-Message-State: AOAM533q7WK/3fu5RVCYoitMEvcEo8Dz9gmfQveK6TtKKcuYhqTDUhBq
 6NFbXG+iqMBRWNcLFuVTSmyKnA==
X-Google-Smtp-Source: ABdhPJy/TZxkG+fV3fAUw9DgsA798dltHg33ol0R28QaudYXTHkklZFFeof18roBD0E9P/9JX1h/YQ==
X-Received: by 2002:a05:651c:98f:: with SMTP id
 b15mr16067256ljq.367.1641210061554; 
 Mon, 03 Jan 2022 03:41:01 -0800 (PST)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id a23sm1910941ljk.8.2022.01.03.03.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:41:00 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/panel: nt35560: Support also ACX424AKM
Date: Mon,  3 Jan 2022 12:38:22 +0100
Message-Id: <20220103113822.654592-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220103113822.654592-1-linus.walleij@linaro.org>
References: <20220103113822.654592-1-linus.walleij@linaro.org>
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

Add some code and config to also support the ACX424AKM used in
some Sony (Ericsson) Mobile phones.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 72 ++++++++++++++++++-
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 41dc278faf80..778542a956f7 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -10,12 +10,15 @@
  * Author: Linus Walleij
  * Based on code and know-how from Marcus Lorentzon
  * Copyright (C) ST-Ericsson SA 2010
+ * Based on code and know-how from Johan Olson and Joakim Wesslen
+ * Copyright (C) Sony Ericsson Mobile Communications 2010
  */
 #include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 
 #include <video/mipi_display.h>
@@ -41,7 +44,13 @@
  */
 #define DISPLAY_SONY_ACX424AKP_ID4	0x8000
 
+struct nt35560_config {
+	const struct drm_display_mode *vid_mode;
+	const struct drm_display_mode *cmd_mode;
+};
+
 struct nt35560 {
+	const struct nt35560_config *conf;
 	struct drm_panel panel;
 	struct device *dev;
 	struct regulator *supply;
@@ -86,6 +95,49 @@ static const struct drm_display_mode sony_acx424akp_cmd_mode = {
 	.height_mm = 84,
 };
 
+static const struct nt35560_config sony_acx424akp_data = {
+	.vid_mode = &sony_acx424akp_vid_mode,
+	.cmd_mode = &sony_acx424akp_cmd_mode,
+};
+
+static const struct drm_display_mode sony_acx424akm_vid_mode = {
+	.clock = 27234,
+	.hdisplay = 480,
+	.hsync_start = 480 + 15,
+	.hsync_end = 480 + 15 + 0,
+	.htotal = 480 + 15 + 0 + 15,
+	.vdisplay = 854,
+	.vsync_start = 854 + 14,
+	.vsync_end = 854 + 14 + 1,
+	.vtotal = 854 + 14 + 1 + 11,
+	.width_mm = 46,
+	.height_mm = 82,
+	.flags = DRM_MODE_FLAG_PVSYNC,
+};
+
+/*
+ * The timings are not very helpful as the display is used in
+ * command mode using the maximum HS frequency.
+ */
+static const struct drm_display_mode sony_acx424akm_cmd_mode = {
+	.clock = 35478,
+	.hdisplay = 480,
+	.hsync_start = 480 + 154,
+	.hsync_end = 480 + 154 + 16,
+	.htotal = 480 + 154 + 16 + 32,
+	.vdisplay = 854,
+	.vsync_start = 854 + 1,
+	.vsync_end = 854 + 1 + 1,
+	.vtotal = 854 + 1 + 1 + 1,
+	.width_mm = 46,
+	.height_mm = 82,
+};
+
+static const struct nt35560_config sony_acx424akm_data = {
+	.vid_mode = &sony_acx424akm_vid_mode,
+	.cmd_mode = &sony_acx424akm_cmd_mode,
+};
+
 static inline struct nt35560 *panel_to_nt35560(struct drm_panel *panel)
 {
 	return container_of(panel, struct nt35560, panel);
@@ -369,14 +421,15 @@ static int nt35560_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
 	struct nt35560 *nt = panel_to_nt35560(panel);
+	const struct nt35560_config *conf = nt->conf;
 	struct drm_display_mode *mode;
 
 	if (nt->video_mode)
 		mode = drm_mode_duplicate(connector->dev,
-					  &sony_acx424akp_vid_mode);
+					  conf->vid_mode);
 	else
 		mode = drm_mode_duplicate(connector->dev,
-					  &sony_acx424akp_cmd_mode);
+					  conf->cmd_mode);
 	if (!mode) {
 		dev_err(panel->dev, "bad mode or failed to add mode\n");
 		return -EINVAL;
@@ -413,6 +466,12 @@ static int nt35560_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, nt);
 	nt->dev = dev;
 
+	nt->conf = of_device_get_match_data(dev);
+	if (!nt->conf) {
+		dev_err(dev, "missing device configuration\n");
+		return -ENODEV;
+	}
+
 	dsi->lanes = 2;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	/*
@@ -475,7 +534,14 @@ static int nt35560_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id nt35560_of_match[] = {
-	{ .compatible = "sony,acx424akp" },
+	{
+		.compatible = "sony,acx424akp",
+		.data = &sony_acx424akp_data,
+	},
+	{
+		.compatible = "sony,acx424akm",
+		.data = &sony_acx424akm_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, nt35560_of_match);
-- 
2.31.1

