Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D1235671
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0C36E0ED;
	Sun,  2 Aug 2020 11:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2F26E0EA
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:25 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t23so13223309ljc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDAh/5RDQvY0YOjmGtHlH46aL/7DLKEfKHORvRyd4Ag=;
 b=EqPykrvwa4OCKEXJ/U+klCurvwCWKasaT4PNIR1EX/oeGUqyluo4KPsmc3xgo6+Xnk
 9QND/5ipsgIf1k1WLFmKEp12zlpIhO+yEC7sqx8j/CcYX+7vvT2win65Wdhad3uBppnv
 miCNQbBeJ6pvjh7+gwmg8YzuhFaEF0AIQ8ivjK1GmKwZ6EKKmPVFZNLt+R7WyIoR8gJM
 IjGKWYBsY/K52cN01hR/Jv9j/DL9NFSdJKh5pGej4DK0+6v8B52GHL4fBQNXOSe1seCI
 vRRW0/bG5o00jdPlwffWMTYcKsmAA8DfAqrNwzp2Fm4j9hrJy0Ci4UxU5b1hGi6zi4Vg
 hgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tDAh/5RDQvY0YOjmGtHlH46aL/7DLKEfKHORvRyd4Ag=;
 b=BeBu/g/Vel51FfsX14c5EC/T8emIlQU9sIy+vKb4hP5GNeAMX5ERf1J1abB1uVQreI
 VLsBD1sY16S0N9yLlQpnZd5g5b6cTTWYlzjtpqS10D6N8EZnsDqz2YB8wUD3/7SsvkWO
 sav0OGbqth3MSGF4gBddr/Y1KHtk1ZkWoiwzej+j+UixMZehElWqi+oaKWBY5h4iZnSI
 XRfnWQP9a3F8TLz6lLJWRGz0buDn6Lpda1GWi/scgaurIHb4KNhxeHBYubK7ztUFMIqD
 GWRoVU47GPgRlRW0OOz/ILpCQHp4MAvPF9LrHvVuxtIqHxa9Vb8Qt4WNWiY1/N4JurZ3
 AgBQ==
X-Gm-Message-State: AOAM532XwAbqFxKzfQxorhhVwzmjEy7QJbUWjxh7M4Jv75urAhXmBHvG
 OSGxDHAwQuf7lMMl0GrpPLX4EVfqkOk=
X-Google-Smtp-Source: ABdhPJziNIeSbVohuWYF8cFzTg7hXO2a8RzwzkVhKQiMv8n7JXtjUf+3m+FttmkkPDboMyYrWHTpog==
X-Received: by 2002:a2e:9842:: with SMTP id e2mr367852ljj.88.1596366444018;
 Sun, 02 Aug 2020 04:07:24 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:23 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 09/22] drm/panel: orisetech-otm8009a: Backlight update
Date: Sun,  2 Aug 2020 13:06:23 +0200
Message-Id: <20200802110636.1018743-10-sam@ravnborg.org>
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
 Philippe CORNU <philippe.cornu@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Replace direct access to backlight_properties with
  backlight_get_brightness().
- Use brightness and not power to determine if backlight is off
- Use the devm_ variant for registering backlight device, and drop
  all explicit unregistering of the backlight device.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Philippe CORNU <philippe.cornu@st.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index bb0c992171e8..e6534cca2a84 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -388,6 +388,7 @@ static const struct drm_panel_funcs otm8009a_drm_funcs = {
 static int otm8009a_backlight_update_status(struct backlight_device *bd)
 {
 	struct otm8009a *ctx = bl_get_data(bd);
+	u8 brightness = backlight_get_brightness(bd);
 	u8 data[2];
 
 	if (!ctx->prepared) {
@@ -395,13 +396,13 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
 		return -ENXIO;
 	}
 
-	if (bd->props.power <= FB_BLANK_NORMAL) {
+	if (brightness > 0) {
 		/* Power on the backlight with the requested brightness
 		 * Note We can not use mipi_dsi_dcs_set_display_brightness()
 		 * as otm8009a driver support only 8-bit brightness (1 param).
 		 */
 		data[0] = MIPI_DCS_SET_DISPLAY_BRIGHTNESS;
-		data[1] = bd->props.brightness;
+		data[1] = brightness;
 		otm8009a_dcs_write_buf_hs(ctx, data, ARRAY_SIZE(data));
 
 		/* set Brightness Control & Backlight on */
@@ -428,6 +429,7 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 	struct device *dev = &dsi->dev;
 	struct otm8009a *ctx;
 	int ret;
+	DECLARE_BACKLIGHT_INIT_RAW(props, OTM8009A_BACKLIGHT_DEFAULT, OTM8009A_BACKLIGHT_MAX);
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -462,25 +464,19 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 	ctx->bl_dev = devm_backlight_device_register(dev, dev_name(dev),
 						     dsi->host->dev, ctx,
 						     &otm8009a_backlight_ops,
-						     NULL);
+						     &props);
 	if (IS_ERR(ctx->bl_dev)) {
 		ret = PTR_ERR(ctx->bl_dev);
 		dev_err(dev, "failed to register backlight: %d\n", ret);
 		return ret;
 	}
 
-	ctx->bl_dev->props.max_brightness = OTM8009A_BACKLIGHT_MAX;
-	ctx->bl_dev->props.brightness = OTM8009A_BACKLIGHT_DEFAULT;
-	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
-	ctx->bl_dev->props.type = BACKLIGHT_RAW;
-
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
 		dev_err(dev, "mipi_dsi_attach failed. Is host ready?\n");
 		drm_panel_remove(&ctx->panel);
-		backlight_device_unregister(ctx->bl_dev);
 		return ret;
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
