Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E31669091
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8014010E23B;
	Fri, 13 Jan 2023 08:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574B310E1D5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 04:19:10 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id e22so5769859qts.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 20:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lLkvPYf2Ke9zk2IwTXoOAkiIP7b8LjXjkqvGfmAjbT0=;
 b=fy1lR4LcLNAnoCT1h5498TaEqy9pg2nkf5XJGVzuMQHn98hz5NcfADR6oRxfwLBYrv
 5DJtWZvdgknyDsVjeqNI3w3R+8SEpiz4Iha/4XKzuFr2tA9PMnTabuuCAsZuZ/29V+Os
 FWczXjX8XrKX5zTQCqiAe/EWQ+/OwwcCYtef+bs9xGP19jqZ4nTy61j+hkvn0MbkJeBz
 +vvlKNBvVKEZWYs9HO062W2TpE+VjrqT1RdWZwzn38HE3mTd46l9t+/ffFQaILrnIyZ7
 OlO6oXgxb7mvTaVauu1sIGC/vWhg6hTfCRLiOI1OzHii7fAcjukCr96SSgWhMjRAnLw1
 Pg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lLkvPYf2Ke9zk2IwTXoOAkiIP7b8LjXjkqvGfmAjbT0=;
 b=MysC1IsXUYqGsUExrALIohZEt3JebGjgfDkL8VxK6iXuuZVNvw1yMkhQ4hXEIhGCpW
 V3caIockbn0EXhzZrEMFl7Mv/wX21ZXsvOudyLzrNtEcSQoDgHb3Wah2Jxr6aL9DFabj
 Q+/UZgRDNuIghhoJO7/hSGDqPspctntJ3PsG59CzDINwhvVnuSU0Jxt9l2CZRh04T2cb
 gLmpJmvU2+nKVujZwz4KgG/DaL+sp5RW6twOyfsLgtKzJOeT2RkNcAL4xs9aMl+Po/TO
 kxgFmQEIJ9I5cUQHotJam7+B0JQ+6ysQQR04hEM+B611Zd3iEuFVLIcsQKKvPudOZkxa
 mL3g==
X-Gm-Message-State: AFqh2kqZx2d2aOw0RDnYwAlccHvLCtC4/wS1ZZgslmIwzBMTfklt7Q0r
 b+Qvlt6HzB8sbaBGx+4YjdpMNEH8+k8=
X-Google-Smtp-Source: AMrXdXt+U8O6YcZRkv+o8ah+yIuX/vhXN+6n2lpOW6Nq9XuaG6aodQLs32gkgaKnN+YvL4lAc2ADlw==
X-Received: by 2002:a05:622a:5911:b0:3ac:c2b8:e with SMTP id
 ga17-20020a05622a591100b003acc2b8000emr25684486qtb.19.1673583549236; 
 Thu, 12 Jan 2023 20:19:09 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::e680])
 by smtp.gmail.com with ESMTPSA id
 c8-20020ac80548000000b003972790deb9sm9996393qth.84.2023.01.12.20.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 20:19:08 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Joel Selvaraj <jo@jsfamily.in>,
 Robert Chiras <robert.chiras@nxp.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Vinay Simha BN <simhavcs@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/dsi-mipi: Fix byte order of DCS set/get brightness
Date: Thu, 12 Jan 2023 23:18:48 -0500
Message-Id: <20230113041848.200704-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Jan 2023 08:20:31 +0000
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
Cc: Richard Acayan <mailingradian@gmail.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Mentz <danielmentz@google.com>

The MIPI DCS specification demands that brightness values are sent in
big endian byte order. It also states that one parameter (i.e. one byte)
shall be sent/received for 8 bit wide values, and two parameters shall
be used for values that are between 9 and 16 bits wide.

Fixes: 1a9d759331b8 ("drm/dsi: Implement DCS set/get display brightness")
Signed-off-by: Daniel Mentz <danielmentz@google.com>
Change-Id: I24306e21ec6a5ff48ea121d977419a81d5b44152
Link: https://android.googlesource.com/kernel/msm/+/754affd62d0ee268c686c53169b1dbb7deac8550
[richard: fix 16-bit brightness_get; change brightness call by all panels on the -next tree]
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c                | 44 ++++++++++++++++---
 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  |  4 +-
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    |  4 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c     |  2 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c  |  2 +-
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    |  4 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c |  4 +-
 .../gpu/drm/panel/panel-samsung-s6e63j0x03.c  |  2 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  4 +-
 .../panel/panel-sony-tulip-truly-nt35521.c    |  4 +-
 include/drm/drm_mipi_dsi.h                    |  4 +-
 11 files changed, 55 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 497ef4b6a90a..1e6dbf986d97 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1180,17 +1180,33 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline);
  *    display
  * @dsi: DSI peripheral device
  * @brightness: brightness value
+ * @num_params: Number of parameters (bytes) to encode brightness value in. The
+ *              MIPI specification states that one parameter shall be sent for
+ *              devices that support 8-bit brightness levels. For devices that
+ *              support brightness levels wider than 8-bit, two parameters
+ *              shall be sent.
  *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
-					u16 brightness)
+					u16 brightness, size_t num_params)
 {
-	u8 payload[2] = { brightness & 0xff, brightness >> 8 };
+	u8 payload[2];
 	ssize_t err;
 
+	switch (num_params) {
+	case 1:
+		payload[0] = brightness & 0xff;
+		break;
+	case 2:
+		payload[0] = brightness >> 8;
+		payload[1] = brightness & 0xff;
+		break;
+	default:
+		return -EINVAL;
+	}
 	err = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
-				 payload, sizeof(payload));
+				 payload, num_params);
 	if (err < 0)
 		return err;
 
@@ -1203,16 +1219,25 @@ EXPORT_SYMBOL(mipi_dsi_dcs_set_display_brightness);
  *    of the display
  * @dsi: DSI peripheral device
  * @brightness: brightness value
+ * @num_params: Number of parameters (i.e. bytes) the brightness value is
+ *              encoded in. The MIPI specification states that one parameter
+ *              shall be returned from devices that support 8-bit brightness
+ *              levels. Devices that support brightness levels wider than
+ *              8-bit return two parameters (i.e. bytes).
  *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
-					u16 *brightness)
+					u16 *brightness, size_t num_params)
 {
+	u8 payload[2];
 	ssize_t err;
 
+	if (!(num_params == 1 || num_params == 2))
+		return -EINVAL;
+
 	err = mipi_dsi_dcs_read(dsi, MIPI_DCS_GET_DISPLAY_BRIGHTNESS,
-				brightness, sizeof(*brightness));
+				payload, num_params);
 	if (err <= 0) {
 		if (err == 0)
 			err = -ENODATA;
@@ -1220,6 +1245,15 @@ int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
 		return err;
 	}
 
+	switch (num_params) {
+	case 1:
+		*brightness = payload[0];
+		break;
+	case 2:
+		*brightness = (payload[0] << 8) | payload[1];
+		break;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness);
diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index b3235781e6ba..9f849c68d57c 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -220,7 +220,7 @@ static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness, 1);
 	if (ret < 0)
 		return ret;
 
@@ -237,7 +237,7 @@ static int tm5p5_nt35596_bl_get_brightness(struct backlight_device *bl)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness, 1);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index ad58840eda41..5a0366366055 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -253,7 +253,7 @@ static int boe_bf060y8m_aj0_bl_update_status(struct backlight_device *bl)
 	u16 brightness = backlight_get_brightness(bl);
 	int ret;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness, 1);
 	if (ret < 0)
 		return ret;
 
@@ -266,7 +266,7 @@ static int boe_bf060y8m_aj0_bl_get_brightness(struct backlight_device *bl)
 	u16 brightness;
 	int ret;
 
-	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness, 1);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
index e85d63a176d0..0666e0390c7c 100644
--- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -62,7 +62,7 @@ static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff, 1);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set display brightness: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
index d8765b2294fb..47ebf7b7da4a 100644
--- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
@@ -102,7 +102,7 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 		return ret;
 	}
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff, 1);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set display brightness: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 8f4f137a2af6..7d2f147a2504 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -332,7 +332,7 @@ static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness, 1);
 	if (ret < 0)
 		return ret;
 
@@ -348,7 +348,7 @@ static int dsi_dcs_bl_update_status(struct backlight_device *bl)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness, 1);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index dbb1ed4efbed..00f6bd163af2 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -473,7 +473,7 @@ static int rad_bl_get_brightness(struct backlight_device *bl)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness, 1);
 	if (ret < 0)
 		return ret;
 
@@ -493,7 +493,7 @@ static int rad_bl_update_status(struct backlight_device *bl)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness, 1);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index e06fd35de814..f5e235db7ad2 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -365,7 +365,7 @@ static int s6e63j0x03_enable(struct drm_panel *panel)
 		return ret;
 
 	/* set default white brightness */
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff, 1);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 1a0d24595faa..b481195c9b8f 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -224,10 +224,8 @@ static int sofef00_panel_bl_update_status(struct backlight_device *bl)
 	u16 brightness;
 
 	brightness = (u16)backlight_get_brightness(bl);
-	// This panel needs the high and low bytes swapped for the brightness value
-	brightness = __swab16(brightness);
 
-	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+	err = mipi_dsi_dcs_set_display_brightness(dsi, brightness, 2);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
index fa9be3c299c0..dbf179fdda88 100644
--- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
+++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
@@ -420,7 +420,7 @@ static int truly_nt35521_bl_update_status(struct backlight_device *bl)
 	u16 brightness = backlight_get_brightness(bl);
 	int ret;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness, 1);
 	if (ret < 0)
 		return ret;
 
@@ -433,7 +433,7 @@ static int truly_nt35521_bl_get_brightness(struct backlight_device *bl)
 	u16 brightness;
 	int ret;
 
-	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
+	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness, 1);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 4f503d99f668..da02f09f251b 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -293,9 +293,9 @@ int mipi_dsi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
 int mipi_dsi_dcs_set_pixel_format(struct mipi_dsi_device *dsi, u8 format);
 int mipi_dsi_dcs_set_tear_scanline(struct mipi_dsi_device *dsi, u16 scanline);
 int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
-					u16 brightness);
+					u16 brightness, size_t num_params);
 int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
-					u16 *brightness);
+					u16 *brightness, size_t num_params);
 
 /**
  * mipi_dsi_generic_write_seq - transmit data using a generic write packet
-- 
2.39.0

