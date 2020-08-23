Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5730D24ECE2
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211FC6E4D2;
	Sun, 23 Aug 2020 10:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2266E49B
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:17 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id i10so6452662ljn.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvdLxjXaJn11TTJtwrNCJ2FiPaDtkOV4A0DapdP967U=;
 b=cIwftmEZ70Z4kNecN7JtApoAOOH1GPx5ZkzjlEnh/PomRr1qCSUqPp/SZjPaD2WwOt
 gZMqW5v9eLKLGRVGGTL3dJiOJVypgMb3bw4tvO9Ek9ryxOBXzegdHM7nBUPNu3ZUe76/
 AxbdH9ej9r2mJKpvIrx74Ql3Rk2F0604Awsw/MXFjzH7r0fKY8wqYKku489gPJkzlIrl
 jEDLvA3kAK3gDwFMvMvUv7uopAiBFAoKkhBh/zXXdYpqKRkJpj9+sHQ1jJMka+mM6fMX
 S3+ez3YENC+cw+8mThH4sQXTvcMxCWkX/5Nhd/TUgxZMDPEDsl/WbutV/dkp2O4M24T6
 1VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CvdLxjXaJn11TTJtwrNCJ2FiPaDtkOV4A0DapdP967U=;
 b=dBHTyiDXCReVZ809HUi0vRUSPv3CzgryF8MGwOgkt/PkWAyxs1GoiVjWcSb7fdXMgc
 WOx8sIVK79qpZPlogRs5UDwxNOvZkjC99nWFYAeOF/uzuIxpln10+kFGp67yuBi2DkCS
 woG2t9aKB/5dmglniVQus4MTnUiN9tPhvIDLiOhrC25MMfqQn/lS8CwS1eAiidrwn45b
 KsxCu4EmuyYBB/bjlLpjAhOiWvsPO7GDaa2wFbaVgWTfPMIWqhgaK8z46EBoNtkSVwEb
 evmX3A5EJYmIGR21nMJA5QIOwT0SFBdvHuHbXwbEAjud9bkULgakx8nyAd+MNlvRLDbb
 oqkA==
X-Gm-Message-State: AOAM533TXYa3x3hZxvMyjEregs8DOXUL2fFNdlh+1yNn1PpmahCi0+jv
 1txR6OeilejeJs6WHxIF/ZKdrml8/3LjNg==
X-Google-Smtp-Source: ABdhPJzdLFMCus5PyE+fYm/kg+LkHD9Zljc+pxDNJoD0Jx8/HVGfZw58602RqnUASqPBsyWJIXrFng==
X-Received: by 2002:a2e:9812:: with SMTP id a18mr444294ljj.25.1598179575619;
 Sun, 23 Aug 2020 03:46:15 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:15 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 18/24] drm/bridge: parade-ps8622: Backlight update
Date: Sun, 23 Aug 2020 12:45:26 +0200
Message-Id: <20200823104532.1024798-19-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Use blacklight_get_brightness() helper
- Use devm_ variant to register backlight device and drop explicit
  unregister
- Use macro for initialization

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/parade-ps8622.c | 43 +++++++++++++-------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index d789ea2a7fb9..a46a883e0b8c 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -284,8 +284,7 @@ static int ps8622_send_config(struct ps8622_bridge *ps8622)
 			goto error;
 
 		/* FFh for 100% brightness, 0h for 0% brightness */
-		err = ps8622_set(cl, 0x01, 0xa7,
-				ps8622->bl->props.brightness);
+		err = ps8622_set(cl, 0x01, 0xa7, backlight_get_brightness(ps8622->bl));
 		if (err)
 			goto error;
 	} else {
@@ -331,18 +330,11 @@ static int ps8622_send_config(struct ps8622_bridge *ps8622)
 static int ps8622_backlight_update(struct backlight_device *bl)
 {
 	struct ps8622_bridge *ps8622 = dev_get_drvdata(&bl->dev);
-	int ret, brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK ||
-	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
-		brightness = 0;
 
 	if (!ps8622->enabled)
 		return -EINVAL;
 
-	ret = ps8622_set(ps8622->client, 0x01, 0xa7, brightness);
-
-	return ret;
+	return ps8622_set(ps8622->client, 0x01, 0xa7, backlight_get_brightness(bl));
 }
 
 static const struct backlight_ops ps8622_backlight_ops = {
@@ -521,7 +513,23 @@ static const struct drm_bridge_funcs ps8622_bridge_funcs = {
 	.attach = ps8622_attach,
 };
 
-static const struct of_device_id ps8622_devices[] = {
+static int ps8622_register_blacklight(struct device *dev, struct ps8622_bridge *ps8622)
+{
+	DECLARE_BACKLIGHT_INIT_RAW(props, PS8622_MAX_BRIGHTNESS, PS8622_MAX_BRIGHTNESS);
+	struct backlight_device *bl;
+
+	bl = devm_backlight_device_register(dev, dev_name(dev), dev,
+					    ps8622, &ps8622_backlight_ops, &props);
+	if (IS_ERR(bl)) {
+		DRM_ERROR("failed to register backlight\n");
+		return PTR_ERR(bl);
+	}
+
+	ps8622->bl = bl;
+	return 0;
+}
+
+const struct of_device_id ps8622_devices[] = {
 	{.compatible = "parade,ps8622",},
 	{.compatible = "parade,ps8625",},
 	{}
@@ -581,17 +589,9 @@ static int ps8622_probe(struct i2c_client *client,
 	}
 
 	if (!of_find_property(dev->of_node, "use-external-pwm", NULL)) {
-		ps8622->bl = backlight_device_register("ps8622-backlight",
-				dev, ps8622, &ps8622_backlight_ops,
-				NULL);
-		if (IS_ERR(ps8622->bl)) {
-			DRM_ERROR("failed to register backlight\n");
-			ret = PTR_ERR(ps8622->bl);
-			ps8622->bl = NULL;
+		ret = ps8622_register_blacklight(dev, ps8622);
+		if (ret)
 			return ret;
-		}
-		ps8622->bl->props.max_brightness = PS8622_MAX_BRIGHTNESS;
-		ps8622->bl->props.brightness = PS8622_MAX_BRIGHTNESS;
 	}
 
 	ps8622->bridge.funcs = &ps8622_bridge_funcs;
@@ -607,7 +607,6 @@ static int ps8622_remove(struct i2c_client *client)
 {
 	struct ps8622_bridge *ps8622 = i2c_get_clientdata(client);
 
-	backlight_device_unregister(ps8622->bl);
 	drm_bridge_remove(&ps8622->bridge);
 
 	return 0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
