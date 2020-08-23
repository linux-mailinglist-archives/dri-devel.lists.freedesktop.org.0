Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D93E24ECD7
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5056E49B;
	Sun, 23 Aug 2020 10:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578206E4AB
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f26so6431005ljc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+8Q2TDM3ai0df+vX1aS5w/AfWw+2B7q6iiQpKDOvxI=;
 b=hYCZmntRUDTIZ+UowLQKdUntCHNq4nsaQ1wtRjRoaohRpLM72GDly4mHgPbHWvJD8q
 YS10C5gufqvSsOhqSgTNLHlgEo2v98ITMWpR1UyoNvBj8jKShc8tKr4R8gITI4gxTof/
 63WipMo0IoG8tahwkhGsJnyxgJWMJHAegx98Dd0gXpxIvVaBUMrOVZYLOW+o9O4I1+n3
 vLDitlQ31cxKAlu8YB59pEMMAobDXhJerPeWm4vyoQk53NdMZBJ11TjKqsVukhj5umTh
 hu+qMbf+syBu6fNN7UfIIY0GWO2MhSmDuQX3tQHzAE85jo8wKxRCpNQRfmzNWnB6zfW+
 ouNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X+8Q2TDM3ai0df+vX1aS5w/AfWw+2B7q6iiQpKDOvxI=;
 b=WuMpmZq4aaM98VQaVaX977yG4iyazUcn+HRUoNlWinsN9PrahF06OgUP/K1+6slkrz
 tUQffFhf58dF5HjOKMLVXOp3oSYLZmkuZVzJb4yN4GqVqOsD06/VxQ4bY1FgO2LoHA9F
 HNbiaTq/36ssGEnGLnbk8D4cHr1drIC3B3s12ygifBSNt11yX/N5soWkeJ25/6R+7NAL
 TXS2X9+PaFpfULsxVZJOab+Ua3aELnaCMvJC7CaTPEsYV8QNLNgGRfE8q3iHymaOnqyd
 3EXpmkhTvPcpxQ2kJ4Xdv4HFBFEJ2Ld6fuDfpQwu1P/7p1ytWCDtVUsifoaLItOQHkxL
 G+Pg==
X-Gm-Message-State: AOAM532XGqNojBIM1Jky0d2xQJie/ZdkB+LdFljbnMSCjrlHyVGBHyaZ
 0WwISbRvpApWL78qZln+8+kArvV/6FEpCA==
X-Google-Smtp-Source: ABdhPJzXgYmVhWR6Im3hmiPPD46buYRJkmioLxYJ+jdFzVqVLRK8V+ueRgkY0JglHEy/Lbfpeuy0rA==
X-Received: by 2002:a05:651c:1213:: with SMTP id
 i19mr443125lja.191.1598179572584; 
 Sun, 23 Aug 2020 03:46:12 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:12 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 16/24] drm/panel: sony-acx424akp: Backlight update
Date: Sun, 23 Aug 2020 12:45:24 +0200
Message-Id: <20200823104532.1024798-17-sam@ravnborg.org>
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
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Use get method to read brightness
- Use drm_panel support for backlight
  - This drops enable/disable operations as they are no longer needed.
    The enable/disable operations had some backlight related comments
    that are no longer valid. The only correct way to enable/disable
    backlight is using the backlight enable/disable helpers.
- Use macro for backlight initialization

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-sony-acx424akp.c | 49 ++++----------------
 1 file changed, 9 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
index c91e55b2d7a3..ce9ae8f1f5d7 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
@@ -99,7 +99,7 @@ static int acx424akp_set_brightness(struct backlight_device *bl)
 	struct acx424akp *acx = bl_get_data(bl);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(acx->dev);
 	int period_ns = 1023;
-	int duty_ns = bl->props.brightness;
+	int duty_ns = backlight_get_brightness(bl);
 	u8 pwm_ratio;
 	u8 pwm_div;
 	u8 par;
@@ -332,8 +332,6 @@ static int acx424akp_prepare(struct drm_panel *panel)
 		}
 	}
 
-	acx->bl->props.power = FB_BLANK_NORMAL;
-
 	return 0;
 
 err_power_off:
@@ -376,34 +374,6 @@ static int acx424akp_unprepare(struct drm_panel *panel)
 	msleep(85);
 
 	acx424akp_power_off(acx);
-	acx->bl->props.power = FB_BLANK_POWERDOWN;
-
-	return 0;
-}
-
-static int acx424akp_enable(struct drm_panel *panel)
-{
-	struct acx424akp *acx = panel_to_acx424akp(panel);
-
-	/*
-	 * The backlight is on as long as the display is on
-	 * so no use to call backlight_enable() here.
-	 */
-	acx->bl->props.power = FB_BLANK_UNBLANK;
-
-	return 0;
-}
-
-static int acx424akp_disable(struct drm_panel *panel)
-{
-	struct acx424akp *acx = panel_to_acx424akp(panel);
-
-	/*
-	 * The backlight is on as long as the display is on
-	 * so no use to call backlight_disable() here.
-	 */
-	acx->bl->props.power = FB_BLANK_NORMAL;
-
 	return 0;
 }
 
@@ -435,18 +405,18 @@ static int acx424akp_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs acx424akp_drm_funcs = {
-	.disable = acx424akp_disable,
 	.unprepare = acx424akp_unprepare,
 	.prepare = acx424akp_prepare,
-	.enable = acx424akp_enable,
 	.get_modes = acx424akp_get_modes,
 };
 
 static int acx424akp_probe(struct mipi_dsi_device *dsi)
 {
+	struct backlight_device *bd;
 	struct device *dev = &dsi->dev;
 	struct acx424akp *acx;
 	int ret;
+	DECLARE_BACKLIGHT_INIT_RAW(props, 512, 1023);
 
 	acx = devm_kzalloc(dev, sizeof(struct acx424akp), GFP_KERNEL);
 	if (!acx)
@@ -496,15 +466,14 @@ static int acx424akp_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&acx->panel, dev, &acx424akp_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
-	acx->bl = devm_backlight_device_register(dev, "acx424akp", dev, acx,
-						 &acx424akp_bl_ops, NULL);
-	if (IS_ERR(acx->bl)) {
+	bd = devm_backlight_device_register(dev, "acx424akp", dev, acx,
+					    &acx424akp_bl_ops, &props);
+	if (IS_ERR(bd)) {
 		DRM_DEV_ERROR(dev, "failed to register backlight device\n");
-		return PTR_ERR(acx->bl);
+		return PTR_ERR(bd);
 	}
-	acx->bl->props.max_brightness = 1023;
-	acx->bl->props.brightness = 512;
-	acx->bl->props.power = FB_BLANK_POWERDOWN;
+
+	acx->panel.backlight = bd;
 
 	ret = drm_panel_add(&acx->panel);
 	if (ret < 0)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
