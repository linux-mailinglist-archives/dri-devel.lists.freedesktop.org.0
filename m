Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D8524ECD1
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795026E4AF;
	Sun, 23 Aug 2020 10:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8026E4A5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:05 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v4so6472952ljd.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dF9d8I3c1JZSpH3dbgBGj3oM03ESV2nSsHHl2d6BUKI=;
 b=AzloU3dBhqn6eihWDQz1UdumZlzL7/jL/1M9ey4W8J0xF2sHsneglXAVR+b0RAt/p8
 4Akb9IaVMnSc8keLL1u7bk2eHTO7/ZTb68uHhEq5jWhKp8pfw2ANEajfw3TlJ9D/Exry
 jPQ712KtnJMWBvvIYKbVxFAJluXrwV22GQch5lZ3+Wb4obLo1WY+BO6fJIdrp0rDqahC
 Ob40dOfJlsJBJX6+M9BXFOHcyAUd2RT8wzUANb9l99pMPh15lJwZjA10UjH/go4wMU/a
 DFw+JMiEXYV45To+Er6xHBWLC5PsDdT9Pvxoq5RL7sXx9q2YEjWh//vdm+rNep6SxIn0
 z5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dF9d8I3c1JZSpH3dbgBGj3oM03ESV2nSsHHl2d6BUKI=;
 b=DotbFT6VOOTlblpj8ve34okrZk1RBtCJdE03oOrH+JqbMhZ4plYgScM43CSx7NWPBE
 uHKlvaXyrP74YXlbR8he8vAaVH7IaNbfg6aeGSe2t3G0w315pweR8A0cBQDcCahaSBld
 jd7/X9fNSzNvxRjRDENnFJIGZDz6WqMK0txJ1Vep7w2melhmPqDGxrPNYR9D5PlYiE6y
 fwxvZi1o2Vgn7zWhIMEBM6XvxvCB4IGTlfk1aOxXcXo14IEHbtTzZ9rbRn3VqzXvq8c9
 w5gEDdO1JNG0BmTWHYKBrUJ+hdx10hTGilXnWrVmsNBFdje3Nk6lWRr4VIXLCMBwFIGy
 jrbw==
X-Gm-Message-State: AOAM532zfK8Sb8jLFTfPQKU/DNL2+jNZ1ez/HY2zbkC0aSLbGEJtcn6w
 0+/gHPofDeMkbL5LCCBl79P/AzJPLkP5Xg==
X-Google-Smtp-Source: ABdhPJx3EESboLitrlv5FHBJ9EPz7jR1l6SYFmvGLVKF0tD4Gi2b+S04UDbwCrAEqwhF20oAtbgXWQ==
X-Received: by 2002:a2e:91d2:: with SMTP id u18mr461792ljg.436.1598179563451; 
 Sun, 23 Aug 2020 03:46:03 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:02 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 09/24] drm/panel: jdi-lt070me05000: Backlight update
Date: Sun, 23 Aug 2020 12:45:17 +0200
Message-Id: <20200823104532.1024798-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
References: <20200823104532.1024798-1-sam@ravnborg.org>
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
 Vinay Simha BN <simhavcs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update backlight to use macro for initialization and the
backlight_get_brightness() operation to simply the update operation.

Use the drm_panel backlight functionality, which allowed the
deletion of the enable and disable functions.

Moved init of backlight device so it comes after drm_panel_init().
This is the order that is required by drm_panel.

v2:
  - Use drm_panel based backlight

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 58 ++++---------------
 1 file changed, 11 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 4bfd8c877c8e..d50dbe74b376 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -39,7 +39,6 @@ struct jdi_panel {
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *dcdc_en_gpio;
-	struct backlight_device *backlight;
 
 	bool prepared;
 	bool enabled;
@@ -176,20 +175,6 @@ static void jdi_panel_off(struct jdi_panel *jdi)
 	msleep(100);
 }
 
-static int jdi_panel_disable(struct drm_panel *panel)
-{
-	struct jdi_panel *jdi = to_jdi_panel(panel);
-
-	if (!jdi->enabled)
-		return 0;
-
-	backlight_disable(jdi->backlight);
-
-	jdi->enabled = false;
-
-	return 0;
-}
-
 static int jdi_panel_unprepare(struct drm_panel *panel)
 {
 	struct jdi_panel *jdi = to_jdi_panel(panel);
@@ -272,20 +257,6 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static int jdi_panel_enable(struct drm_panel *panel)
-{
-	struct jdi_panel *jdi = to_jdi_panel(panel);
-
-	if (jdi->enabled)
-		return 0;
-
-	backlight_enable(jdi->backlight);
-
-	jdi->enabled = true;
-
-	return 0;
-}
-
 static const struct drm_display_mode default_mode = {
 		.clock = 155493,
 		.hdisplay = 1200,
@@ -329,7 +300,7 @@ static int dsi_dcs_bl_get_brightness(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
 	int ret;
-	u16 brightness = bl->props.brightness;
+	u16 brightness;
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
@@ -349,7 +320,7 @@ static int dsi_dcs_bl_update_status(struct backlight_device *bl)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, backlight_get_brightness(bl));
 	if (ret < 0)
 		return ret;
 
@@ -367,22 +338,15 @@ static struct backlight_device *
 drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
-	struct backlight_properties props;
-
-	memset(&props, 0, sizeof(props));
-	props.type = BACKLIGHT_RAW;
-	props.brightness = 255;
-	props.max_brightness = 255;
+	DECLARE_BACKLIGHT_INIT_RAW(props, 255, 255);
 
 	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
 					      &dsi_bl_ops, &props);
 }
 
 static const struct drm_panel_funcs jdi_panel_funcs = {
-	.disable = jdi_panel_disable,
 	.unprepare = jdi_panel_unprepare,
 	.prepare = jdi_panel_prepare,
-	.enable = jdi_panel_enable,
 	.get_modes = jdi_panel_get_modes,
 };
 
@@ -431,16 +395,16 @@ static int jdi_panel_add(struct jdi_panel *jdi)
 		return ret;
 	}
 
-	jdi->backlight = drm_panel_create_dsi_backlight(jdi->dsi);
-	if (IS_ERR(jdi->backlight)) {
-		ret = PTR_ERR(jdi->backlight);
+	drm_panel_init(&jdi->base, &jdi->dsi->dev, &jdi_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
+	jdi->base.backlight = drm_panel_create_dsi_backlight(jdi->dsi);
+	if (IS_ERR(jdi->base.backlight)) {
+		ret = PTR_ERR(jdi->base.backlight);
 		dev_err(dev, "failed to register backlight %d\n", ret);
 		return ret;
 	}
 
-	drm_panel_init(&jdi->base, &jdi->dsi->dev, &jdi_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_add(&jdi->base);
 
 	return ret;
@@ -482,7 +446,7 @@ static int jdi_panel_remove(struct mipi_dsi_device *dsi)
 	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = jdi_panel_disable(&jdi->base);
+	ret = drm_panel_disable(&jdi->base);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
 
@@ -500,7 +464,7 @@ static void jdi_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
 
-	jdi_panel_disable(&jdi->base);
+	drm_panel_disable(&jdi->base);
 }
 
 static struct mipi_dsi_driver jdi_panel_driver = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
