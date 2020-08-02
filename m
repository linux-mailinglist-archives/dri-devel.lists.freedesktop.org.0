Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD223566A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A720A6E0DD;
	Sun,  2 Aug 2020 11:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7CF6E0DB
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:21 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 185so26506422ljj.7
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9FugQwTYF0kdz3rI5rJhC5K9yiCYsbKV5lHO+DscOGs=;
 b=dGzRuEJROgDfbSIvLYQGmsMAKiZjrNPual6naFf2N+ngwnaqtv0M5lC3bVkhNOj3zf
 J4aXE5rGKNzXJNG4HJwAMrRXCkfRyDAS5LaLO0DNqy+3RVI7Oal2AB/TyGv4rhwIjIl3
 88Z+tJ3kpyVMOCPztjEUiesnF+3tZz1GZL0icE1JzxWv5XNpRfBveJGtXufXPmxXsV4m
 kXXyKgZWSylYPhsrMm5K3zYPkmghleB/CynfS0KB0Pgplm30p5JehbcsHoWnygB/mzQL
 ioQzzcGULjrIecIiMSsUNxSmH/VavnQufVmJYQ8in9HyijGKH7ISrUh6Z33Jg/ftqCRu
 FzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9FugQwTYF0kdz3rI5rJhC5K9yiCYsbKV5lHO+DscOGs=;
 b=O+PzlbzY8WLC471/jlcwhZOGrFNeiZZMhgjfSuu1BfpNK+K4dfCWynGxzoXUJO/3d+
 5nBH+/gkyvh0egHcEy/oSVkeW83BM2EWsoceymwgLTg6vMKh32tvIG1+owwLKdiSZDsg
 99hydfvAryf+racZsiS2pMsS6k1J/f8LyKxKp5doWDDou3Jj8gkM8NE47PgbMNSPnIzO
 PGRNMZwj3z/V3K0SsvB+xs+0iE5P9H6nE++GaAQqO8FHTtuGPuquVWImQiziwyMbx8SW
 j11lwZMu4xJajkdnxgjDSXr3Ik5RVONM683TodKE81+u/2R+kgtQaZfhuLYxdbWT7v8Z
 lDAA==
X-Gm-Message-State: AOAM532avRwTlwRJDopOktZNgaSfKEwHYdSZaeybrZEKpugg96Db+jHL
 uVzAV7gQbN+BwHyU8/XdOiaBs0GKf5I=
X-Google-Smtp-Source: ABdhPJyNMZy3frN2j/BsEl/IDE4DZmVYP6UVjnr4DXVudHBJrGMf49PTu+hwumFn6lf6BnFs5wMZcA==
X-Received: by 2002:a2e:9882:: with SMTP id b2mr5307298ljj.93.1596366439811;
 Sun, 02 Aug 2020 04:07:19 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:19 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 06/22] drm/panel: asus-z00t-tm5p5-n35596: Backlight update
Date: Sun,  2 Aug 2020 13:06:20 +0200
Message-Id: <20200802110636.1018743-7-sam@ravnborg.org>
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
index 39e0f0373f3c..c090fc6f1ed5 100644
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
+	u16 brightness = backlight_get_brightness(bl);
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
