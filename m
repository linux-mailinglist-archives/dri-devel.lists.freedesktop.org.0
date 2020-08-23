Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE424ECC9
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF3A6E49D;
	Sun, 23 Aug 2020 10:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AC26E49D
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w14so6447277ljj.4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aa37o/JC31NMJK0GouhMomg2dXjDz5rCwB/WTVPQexM=;
 b=fcryxtmWzWQ4MoFeKf/VL3QfkWO2742HwbCI2AYbUpxp0Aygk3xhI6kOAj3ejjKb6e
 6bPmtnQVsPKfkGGg9wRy0fEXsssbc4gBff/Ujdc4HkOumF50ZfInaGCrOlBEBgAj15cE
 9e7XgfOkhl0+BuoReg8sDtjRGwdQ3e+XX12FqJPRsAzXBjuW3tA1O46x4O3ePJUBpKAF
 x+oR+YO57M5dySmtLopQEU/+J1cXhN93yNqXbmUEv3l5U2JdyDnd0TE2TZHfO5Nw5x5I
 kZzv3G4b5/KA02+fRPwgjUwQoN85BS2FwdM0efvjlCZnbti9knjL6dH0DJnTzlJ6zKj7
 hqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aa37o/JC31NMJK0GouhMomg2dXjDz5rCwB/WTVPQexM=;
 b=U/F3C/sjulDKz0HP9cimOH3tt17LfoV5cDbqi/zi0hdEDV3wmCbAPqJDhD+WtiHhjM
 6JGJV5oiKYf4Z9n4OxLp2hb0Yk0r5Uyg+/Mb4K2WS5RT+stErVfdg+PVL19cauV3nb2A
 q6C/SWYBUPWUR1i5j3Vf4u0Vk07hQctswNE4PHM9Hy2XK8w0JurgsThaXMqEYUb2iMoK
 CzVSe7flIFQtOO/tWptfNFD5iG2VkQaCIuzmjIbuVShOr1nqDEiIkmmErhLes2Z78snH
 dAm5BLiy6uCp/Et5C2a+l77V3LYuiWu4ZSXQZHbME84QU6bZynbPkYZv68E7E9J3EJio
 OR0w==
X-Gm-Message-State: AOAM5328dzFx9IcsFZJyZjCvidBpqG/PDvFSK2HmAVjdi1aI1QilZ5GB
 kIIr6B7Q+cU9ZT9MpeqJWS2NI9mrsNH3Ow==
X-Google-Smtp-Source: ABdhPJxGJ+VV6Wf8IukG1KhClEaT/9kFe7QqsPrmBb/I7Svb1B/78shxp1BA7Rm9ywep+fboY+eoLA==
X-Received: by 2002:a2e:990c:: with SMTP id v12mr451182lji.449.1598179559731; 
 Sun, 23 Aug 2020 03:45:59 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:45:59 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 06/24] backlight: gpio: Use DECLARE_BACKLIGHT_INIT_RAW
Date: Sun, 23 Aug 2020 12:45:14 +0200
Message-Id: <20200823104532.1024798-7-sam@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce use of DECLARE_BACKLIGHT_INIT_RAW when registering the
backlight.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/gpio_backlight.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 1d509b626b12..13d44417446a 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -49,7 +49,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
 	struct device_node *of_node = dev->of_node;
-	struct backlight_properties props;
+	DECLARE_BACKLIGHT_INIT_RAW(props, 1, 1);
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret, init_brightness, def_value;
@@ -69,9 +69,6 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
 				     "The gpios parameter is missing or invalid.\n");
 
-	memset(&props, 0, sizeof(props));
-	props.type = BACKLIGHT_RAW;
-	props.max_brightness = 1;
 	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
 					    &gpio_backlight_ops, &props);
 	if (IS_ERR(bl)) {
@@ -96,8 +93,6 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	else
 		backlight_disable(bl);
 
-	bl->props.brightness = 1;
-
 	init_brightness = backlight_get_brightness(bl);
 	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
 	if (ret) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
