Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BCA23567C
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239D26E109;
	Sun,  2 Aug 2020 11:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314F96E108
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:35 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d2so13392042lfj.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwqL/6dA2WivZzHXrLFmLgyo2veGKlDyO6+rhntNF54=;
 b=Zt6dIqXKD2+4LYX23pfa9VmdU3+NitbSwxSkCGmy2Au8PwadTqaM/HRr7nK4LEWbHJ
 qws7wORkHRXyX87767Rvf1NqfAyzYiMWUw1ZPSniUY1G/wA+TVLNhhf5K1shRZCzYrNU
 NfY5jy8m/K8ybT4DBIK+UK7ECKw6Rjx4FrE42srfdrHXRbl0CZyFfMP/dksKf6Fnhlhg
 3XTgfdI3ATDJ++H4Vs+4zyEEPpoKE5t8IaKlaAI6uSwGPpg0+iJVBIfWbXx5lvMCd9SC
 m67s8ICvMj7MkXWcjDslYlmCRTv6oPsZFY393imMhkPQw9NNFj25TjLDY96uxW6QJRVA
 UOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LwqL/6dA2WivZzHXrLFmLgyo2veGKlDyO6+rhntNF54=;
 b=NLaltoO53HZ0vIGnJBXyarssIqtIAa5GEnlKhmVa5ChYh3QfegvNf7d7jRbR+oqtR8
 BTo+3/Aa+e2u7DCb057/hKy3VE6SeuZVAkPoALE4LU7HrRhN/0vgXUgM0UA64yXWi93O
 Wp15NsO/Kasy6mlR+vhANwVhbfM/TSMyRtYldmOIJokUPZRYVV/rOKY1U9OJ4xQxffOF
 ky/ZgDgdP3hnRWtC06rwv3K+cmvg5PwVTN4QsljxYhzNl9XfC9Qn6fxLgCRIm+f4ruCc
 1PuOOvgoK2VkkGb5qxtacnhZgp/FczGHHoEivKNTC+UoIOYI5qUmpae9N2mJyFpEv/Ce
 3Iqg==
X-Gm-Message-State: AOAM530JZLQodKwtbftc0O0b2o722v2O2ca/0QcPaq0kcvmGmqghdgaI
 IJ6btsjxVkYO+O1DqreXJMtn+cYjbTE=
X-Google-Smtp-Source: ABdhPJxIwdOq0VoD7ms+A4D+hap55co35bLSR3HuFChSKkFucJFiwfBHnjw401ecGhqoheRf/7dGaw==
X-Received: by 2002:a19:654c:: with SMTP id c12mr6249010lfj.132.1596366453439; 
 Sun, 02 Aug 2020 04:07:33 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:32 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 16/22] drm/bridge: parade-ps8622: Backlight update
Date: Sun,  2 Aug 2020 13:06:30 +0200
Message-Id: <20200802110636.1018743-17-sam@ravnborg.org>
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
index d789ea2a7fb9..9304484e7f71 100644
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
+	return ps8622_set(ps8622->client, 0x01, 0xa7, blacklight_get_brightness(bl));
 }
 
 static const struct backlight_ops ps8622_backlight_ops = {
@@ -521,7 +513,23 @@ static const struct drm_bridge_funcs ps8622_bridge_funcs = {
 	.attach = ps8622_attach,
 };
 
-static const struct of_device_id ps8622_devices[] = {
+static int ps8622_register_blacklight(struct ps8622_bridge *ps8622)
+{
+	DECLARE_BACKLIGHT_INIT_RAW(props, PS8622_MAX_BRIGHTNESS, PS8622_MAX_BRIGHTNESS);
+	backlight_device *bl;
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
+		ret = ps8622_register_blacklight(ps8622);
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
