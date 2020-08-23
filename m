Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AD524ECCF
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCE46E4AE;
	Sun, 23 Aug 2020 10:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C726E4A2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:03 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f26so6430792ljc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6PZuuW9bKJjgLOX5yF9RqFRPjdIKYkILnp0Ap/l4i0=;
 b=EPbfWmvFTM5RBovngysc+bkLtfGnDOVVDuwIQW2zhfXUDg1nvV4OdwipwZP383Y9BI
 pUKOGiHhmAMpvzY4lRxIjvP+8S57ZLE9w/p36ar+pmX5RuXDcHWnfNc4ZAUhzp5CzJDl
 brPviaKNLkaw9xgmny7S1lvCStuFV66RcMc+9MxvAZnSOfxrIAydomLKAi6yIvpy+k4A
 Gu12fm7g6grWSvSAB1kLX1uxQDDEKNWjOibCKZZJREszcHRFPXOb0DJpMPlQGqQJ48tL
 RF9rDR1P8E3zXYO8ftKaz/eIPMBov5jdvk9ZRBCsVqD0Xf3ceuhWSme0Djc1/nnDG/Q2
 4cnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X6PZuuW9bKJjgLOX5yF9RqFRPjdIKYkILnp0Ap/l4i0=;
 b=RtlZq750nmcV3GDR1U1hlkvyVGKvPp9SbT7tEubyv5iWZYggvCcXO0HbOt+HE8gBxt
 xaCz6gHtDXctETZqi3vVbf1UVp4lXGB0naOtTuOynWQ1g7s2uZMylnT0JzpHwPy9JOEa
 jEe6BCloMKKlm9Zg3wmfVDhOig+MzHcyL9iniEewBLuoQzHCSOeAyhyWhvw8aHRu20PA
 h7UMhzUIZ7b/h1O8MQMm0Em4IJgLyvSBCiu5KPMw5Xd1Z7hjbvyigVtPIpLU2dzeEEg6
 +ajxjc/3i7f2CshVBSgSvmN3R+2giJv8oDk8xKSPf5JTIc52SieTevRhyIKpFrRWYs3w
 qUhQ==
X-Gm-Message-State: AOAM532uqO/rWgJI15B9Rg+41oSglbG87k4YXLwCQ9IaFwbm9qonePk1
 GAZ/S0U+V/TW114GULBlIWjovU+4/CnhHA==
X-Google-Smtp-Source: ABdhPJweQ5KQYSo2Gv07YcP6j+w0GnjvfierTLgHPyCrPWJkBrOeBsM//It9UyKMSn/zwtr+/iKc7g==
X-Received: by 2002:a2e:b6cc:: with SMTP id m12mr398821ljo.256.1598179562184; 
 Sun, 23 Aug 2020 03:46:02 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:01 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 08/24] drm/panel: asus-z00t-tm5p5-n35596: Backlight update
Date: Sun, 23 Aug 2020 12:45:16 +0200
Message-Id: <20200823104532.1024798-9-sam@ravnborg.org>
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
 Konrad Dybcio <konradybcio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update backlight to use macro for initialization and the
backlight_get_brightness() operation to simply the update operation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Konrad Dybcio <konradybcio@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index 39e0f0373f3c..ed742d374696 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -216,14 +216,9 @@ static const struct drm_panel_funcs tm5p5_nt35596_panel_funcs = {
 static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
-	u16 brightness = bl->props.brightness;
+	int brightness = backlight_get_brightness(bl);
 	int ret;
 
-	if (bl->props.power != FB_BLANK_UNBLANK ||
-	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
-	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
-		brightness = 0;
-
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
@@ -238,7 +233,7 @@ static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
 static int tm5p5_nt35596_bl_get_brightness(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
-	u16 brightness = bl->props.brightness;
+	u16 brightness;
 	int ret;
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
@@ -261,11 +256,7 @@ static struct backlight_device *
 tm5p5_nt35596_create_backlight(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
-	const struct backlight_properties props = {
-		.type = BACKLIGHT_RAW,
-		.brightness = 255,
-		.max_brightness = 255,
-	};
+	DECLARE_BACKLIGHT_INIT_RAW(props, 255, 255);
 
 	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
 					      &tm5p5_nt35596_bl_ops, &props);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
