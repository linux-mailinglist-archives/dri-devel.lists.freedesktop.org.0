Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696FC235676
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6EF6E0F5;
	Sun,  2 Aug 2020 11:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702806E0F5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x9so36773491ljc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dRC7gr26E18c7vY1VHUHf+rsaYa3dj1EKwwlX8fRbn4=;
 b=O/oFWEX067Xe8sEs/DMRP/kGFgC9+9wpryliQme0KwusLT3eprlOh5tFCMPWDYhSSa
 k2WrB8FMVAiW7M4wATt9DerWXy9F7pbWYvgelJECei2fmVRPZo+6W2tAScqJemr/VGDB
 UHQsOEaGI9V7qsYJfEj7dLsxyofcYDOgy6eGZjDSUDY3jvHQ1tFFxO5PMfBqSAD4leho
 aACjCx1Cdl5h1cwzv3Cvt17ciNrnjLa9Qh31M8nuJBykUoA9SC8H8EEypOgHLpKA9zCx
 Q5YC/VbylBeA7KvYe6O2nljJEt6+5eP58wurKBkRMEGGhSXAZSD+cElMynoilLuKHV1m
 GAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dRC7gr26E18c7vY1VHUHf+rsaYa3dj1EKwwlX8fRbn4=;
 b=NV5MrMpPeP23LbsjP1M4uVjqGXiqHDFTma/yYx7m+3ocYH5BSSl0uLoXpSMJys8QKH
 4l7R9kDi2b/5oVuCat7ZYOeCjoZ4r9FCtdA7ZZYIhYHGXJrwIh4l0Aljg7zEcJtHSzQ2
 oWVu18AXhuV1Ng+wHSsNkn5EppVJ2KKfPT/weBOxGQjLLzxdDzvLJZajBtDmv3Dk0bQL
 RbuMaklebra/7JZohU7unA2zOpQHSQ2jUIUv4KBAhqb5LCyTXvtYn2iTqSAWOPcixecG
 /EWQfkuoTV26t4POM/4XRxUVPweQK/HfN8SsKqjzZCF4+AG8LJby+Ol9/D4uq+6HW+kh
 BTOA==
X-Gm-Message-State: AOAM5332fN7mlRSRSRSAa6LCpE7BoK3RKcVn06C9jjTlmcUmR7fYxxe5
 NZY10EUZF90XgGBKEe/ZdwRkLFTnCD4=
X-Google-Smtp-Source: ABdhPJw+1fhfku+ctYIfH0WjJmm2fGUzYmg3BnKXzz105NGefyUbvV+ue5OFOFvlkMwGYKxXG0CnXw==
X-Received: by 2002:a05:651c:1a7:: with SMTP id
 c7mr5767899ljn.345.1596366449338; 
 Sun, 02 Aug 2020 04:07:29 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:28 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 13/22] drm/panel: samsung-s6e3ha2: Backlight update
Date: Sun,  2 Aug 2020 13:06:27 +0200
Message-Id: <20200802110636.1018743-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Use backlight support from drm_panel.
  This shifts this driver away from manually handling of power state.
- Add helper function for registering backlight, like other samsung
  panel drivers do.
- Use devm_ for backlight register thus benefit from automatic
  unregistering. Drop all explicit unregistering.

In s6e3ha2_disable() a 40 ms delay was dropped. Using drm_panel support
backlight is not disable before display is turned off, so delay after
turning off the display is irrelevant.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c | 68 ++++++++-----------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index 36ebd5a4ac7b..cef781985684 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -233,7 +233,6 @@ struct s6e3ha2_panel_desc {
 struct s6e3ha2 {
 	struct device *dev;
 	struct drm_panel panel;
-	struct backlight_device *bl_dev;
 
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset_gpio;
@@ -408,15 +407,10 @@ static int s6e3ha2_gamma_update(struct s6e3ha2 *ctx)
 	return 0;
 }
 
-static int s6e3ha2_get_brightness(struct backlight_device *bl_dev)
-{
-	return bl_dev->props.brightness;
-}
-
 static int s6e3ha2_set_vint(struct s6e3ha2 *ctx)
 {
-	struct backlight_device *bl_dev = ctx->bl_dev;
-	unsigned int brightness = bl_dev->props.brightness;
+	struct backlight_device *bl_dev = ctx->panel.backlight;
+	unsigned int brightness = backlight_get_brightness(bl_dev);
 	unsigned char data[] = { 0xf4, 0x8b,
 			vint_table[brightness * (S6E3HA2_VINT_STATUS_MAX - 1) /
 			S6E3HA2_MAX_BRIGHTNESS] };
@@ -432,7 +426,7 @@ static unsigned int s6e3ha2_get_brightness_index(unsigned int brightness)
 
 static int s6e3ha2_update_gamma(struct s6e3ha2 *ctx, unsigned int brightness)
 {
-	struct backlight_device *bl_dev = ctx->bl_dev;
+	struct backlight_device *bl_dev = ctx->panel.backlight;
 	unsigned int index = s6e3ha2_get_brightness_index(brightness);
 	u8 data[S6E3HA2_GAMMA_CMD_CNT + 1] = { 0xca, };
 	int ret;
@@ -442,7 +436,7 @@ static int s6e3ha2_update_gamma(struct s6e3ha2 *ctx, unsigned int brightness)
 				s6e3ha2_dcs_write(ctx, data, ARRAY_SIZE(data)));
 
 	s6e3ha2_call_write_func(ret, s6e3ha2_gamma_update(ctx));
-	bl_dev->props.brightness = brightness;
+	backlight_set_brightness(bl_dev, brightness);
 
 	return 0;
 }
@@ -450,18 +444,15 @@ static int s6e3ha2_update_gamma(struct s6e3ha2 *ctx, unsigned int brightness)
 static int s6e3ha2_set_brightness(struct backlight_device *bl_dev)
 {
 	struct s6e3ha2 *ctx = bl_get_data(bl_dev);
-	unsigned int brightness = bl_dev->props.brightness;
+	unsigned int brightness = backlight_get_brightness(bl_dev);
 	int ret;
 
 	if (brightness < S6E3HA2_MIN_BRIGHTNESS ||
-		brightness > bl_dev->props.max_brightness) {
+		brightness > backlight_get_max_brightness(bl_dev)) {
 		dev_err(ctx->dev, "Invalid brightness: %u\n", brightness);
 		return -EINVAL;
 	}
 
-	if (bl_dev->props.power > FB_BLANK_NORMAL)
-		return -EPERM;
-
 	s6e3ha2_call_write_func(ret, s6e3ha2_test_key_on_f0(ctx));
 	s6e3ha2_call_write_func(ret, s6e3ha2_update_gamma(ctx, brightness));
 	s6e3ha2_call_write_func(ret, s6e3ha2_aor_control(ctx));
@@ -472,7 +463,6 @@ static int s6e3ha2_set_brightness(struct backlight_device *bl_dev)
 }
 
 static const struct backlight_ops s6e3ha2_bl_ops = {
-	.get_brightness = s6e3ha2_get_brightness,
 	.update_status = s6e3ha2_set_brightness,
 };
 
@@ -508,9 +498,6 @@ static int s6e3ha2_disable(struct drm_panel *panel)
 	s6e3ha2_call_write_func(ret, mipi_dsi_dcs_enter_sleep_mode(dsi));
 	s6e3ha2_call_write_func(ret, mipi_dsi_dcs_set_display_off(dsi));
 
-	msleep(40);
-	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
-
 	return 0;
 }
 
@@ -555,8 +542,6 @@ static int s6e3ha2_prepare(struct drm_panel *panel)
 	if (ret < 0)
 		goto err;
 
-	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
-
 	return 0;
 
 err:
@@ -588,7 +573,7 @@ static int s6e3ha2_enable(struct drm_panel *panel)
 	s6e3ha2_call_write_func(ret, s6e3ha2_te_start_setting(ctx));
 
 	/* brightness setting */
-	s6e3ha2_call_write_func(ret, s6e3ha2_set_brightness(ctx->bl_dev));
+	s6e3ha2_call_write_func(ret, s6e3ha2_set_brightness(panel->backlight));
 	s6e3ha2_call_write_func(ret, s6e3ha2_aor_control(ctx));
 	s6e3ha2_call_write_func(ret, s6e3ha2_caps_elvss_set(ctx));
 	s6e3ha2_call_write_func(ret, s6e3ha2_gamma_update(ctx));
@@ -602,7 +587,6 @@ static int s6e3ha2_enable(struct drm_panel *panel)
 	s6e3ha2_call_write_func(ret, s6e3ha2_test_key_off_f0(ctx));
 
 	s6e3ha2_call_write_func(ret, mipi_dsi_dcs_set_display_on(dsi));
-	ctx->bl_dev->props.power = FB_BLANK_UNBLANK;
 
 	return 0;
 }
@@ -678,6 +662,25 @@ static const struct drm_panel_funcs s6e3ha2_drm_funcs = {
 	.get_modes = s6e3ha2_get_modes,
 };
 
+static int s6e3ha2_backlight_register(struct s6e3ha2 *ctx)
+{
+	DECLARE_BACKLIGHT_INIT_RAW(props, S6E3HA2_DEFAULT_BRIGHTNESS, S6E3HA2_MAX_BRIGHTNESS);
+	struct device *dev = ctx->dev;
+	struct backlight_device *bd;
+	int ret = 0;
+
+	bd = devm_backlight_device_register(dev, "panel", dev, ctx,
+					    &s6e3ha2_bl_ops, &props);
+	if (IS_ERR(bd)) {
+		ret = PTR_ERR(bd);
+		DRM_DEV_ERROR(dev, "error registering backlight device (%d)\n", ret);
+		return ret;
+	}
+
+	ctx->panel.backlight = bd;
+	return ret;
+}
+
 static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -721,23 +724,16 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->enable_gpio);
 	}
 
-	ctx->bl_dev = backlight_device_register("s6e3ha2", dev, ctx,
-						&s6e3ha2_bl_ops, NULL);
-	if (IS_ERR(ctx->bl_dev)) {
-		dev_err(dev, "failed to register backlight device\n");
-		return PTR_ERR(ctx->bl_dev);
-	}
-
-	ctx->bl_dev->props.max_brightness = S6E3HA2_MAX_BRIGHTNESS;
-	ctx->bl_dev->props.brightness = S6E3HA2_DEFAULT_BRIGHTNESS;
-	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
+	ret = s6e3ha2_backlight_register(ctx);
+	if (ret)
+		return ret;
 
 	drm_panel_init(&ctx->panel, dev, &s6e3ha2_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
 	ret = drm_panel_add(&ctx->panel);
 	if (ret < 0)
-		goto unregister_backlight;
+		return ret;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0)
@@ -748,9 +744,6 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 remove_panel:
 	drm_panel_remove(&ctx->panel);
 
-unregister_backlight:
-	backlight_device_unregister(ctx->bl_dev);
-
 	return ret;
 }
 
@@ -760,7 +753,6 @@ static int s6e3ha2_remove(struct mipi_dsi_device *dsi)
 
 	mipi_dsi_detach(dsi);
 	drm_panel_remove(&ctx->panel);
-	backlight_device_unregister(ctx->bl_dev);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
