Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FAA496BBB
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 11:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5356F10EA8F;
	Sat, 22 Jan 2022 10:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B625B10ED8E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 16:55:42 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s22so14316940oie.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 08:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EONUWJiGBiFmk1iJqYCT7v73PWb5tLXI9z7AYQ153+I=;
 b=aad+fr6w46RiyYwIGj0bv9tlmUENIOrZQpszpW75bDcFiMmDEQ7MA3A3+vn7o/1SZi
 uthe990vX/MVBrA4EkUn9GYzFohlQQu/TZ0SRqkRs7Njk0/NqPfPeW2F4on/rzC56k05
 OrUJO8V20q/mAxbJTiWQWN7bgsQEEUPrzJiwMrW7KO7db+WiHBjbhe4IXzJJ1jXeDw/Q
 nK7iNU5uj9N5T6NfJFOnzA7Fj6lUGXHMONlcUDOCs7yWBNbMiGuhPzBGzMJ6/16e/yrR
 fl1kmqXIU10sQxaWdeDTrOQs9A4ZOA1awpk8APv8Hx8WS9QU39kXTOs4PSKN56ASEYrh
 qiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EONUWJiGBiFmk1iJqYCT7v73PWb5tLXI9z7AYQ153+I=;
 b=LmxnxafPrTLlRwK+nGgzc/z9PohgS1pS5uvjxvYvixJweywogXom/7yJoo4MdSuD10
 /nCiuuoWSnTQlZRSTY+/w+2tep0lMNt0OXghz+cE0NbEM94RougrCVcbltzbHaYXW8HO
 JW+LyR0gJHpDn0IFzay4fK9ZT1MWrlVdK2kOCgDEUU1/j4t94fabsY3AqvuQmb4eTTrL
 Rlw/nzM58DpK+rBQ5DOJxoB0xSSpkvQc1niygCol6rVvuh8qHZabQHZlJyKRRdMlf8aP
 vAqRdzv6HBUezm7+QtwkjcZOHyqhhB6qmKnaTozOL8xsXx+5qNEAn5hrAc3fDwaAx7sy
 FlNw==
X-Gm-Message-State: AOAM533IcejCGhL4Ati71BSbtnX5L2Y4HB4QAGA8mDbLH03SRPSjBtIp
 YndyCS6JuZYtnOQysR3xRjI=
X-Google-Smtp-Source: ABdhPJw5RZlemfgOZ2JSxB+h74JPNrnYn7EOQ34SHJ6/u2NPq0tcb7c4dwH4t5xwlLqRqvJClr2EJg==
X-Received: by 2002:a54:4198:: with SMTP id 24mr1225683oiy.21.1642784142081;
 Fri, 21 Jan 2022 08:55:42 -0800 (PST)
Received: from thinkpad.localdomain ([2804:14d:5cd1:5d03:cf72:4317:3105:f6e5])
 by smtp.gmail.com with ESMTPSA id
 y8sm1089271oou.23.2022.01.21.08.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 08:55:41 -0800 (PST)
From: Luiz Sampaio <sampaio.ime@gmail.com>
To: Michael Hennerich <michael.hennerich@analog.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH 24/31] video: backlight: changing LED_* from enum
 led_brightness to actual value
Date: Fri, 21 Jan 2022 13:54:29 -0300
Message-Id: <20220121165436.30956-25-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121165436.30956-1-sampaio.ime@gmail.com>
References: <20220121165436.30956-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Jan 2022 10:44:23 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luiz Sampaio <sampaio.ime@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The enum led_brightness, which contains the declaration of LED_OFF,
LED_ON, LED_HALF and LED_FULL is obsolete, as the led class now supports
max_brightness.
---
 drivers/video/backlight/adp8860_bl.c | 4 ++--
 drivers/video/backlight/adp8870_bl.c | 4 ++--
 drivers/video/backlight/led_bl.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/backlight/adp8860_bl.c b/drivers/video/backlight/adp8860_bl.c
index 8ec19425671f..063be4189e7e 100644
--- a/drivers/video/backlight/adp8860_bl.c
+++ b/drivers/video/backlight/adp8860_bl.c
@@ -261,10 +261,10 @@ static int adp8860_led_probe(struct i2c_client *client)
 		led_dat->cdev.name = cur_led->name;
 		led_dat->cdev.default_trigger = cur_led->default_trigger;
 		led_dat->cdev.brightness_set = adp8860_led_set;
-		led_dat->cdev.brightness = LED_OFF;
+		led_dat->cdev.brightness = 0;
 		led_dat->flags = cur_led->flags >> FLAG_OFFT_SHIFT;
 		led_dat->client = client;
-		led_dat->new_brightness = LED_OFF;
+		led_dat->new_brightness = 0;
 		INIT_WORK(&led_dat->work, adp8860_led_work);
 
 		ret = led_classdev_register(&client->dev, &led_dat->cdev);
diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backlight/adp8870_bl.c
index 8b5213a39527..b04faf8d631d 100644
--- a/drivers/video/backlight/adp8870_bl.c
+++ b/drivers/video/backlight/adp8870_bl.c
@@ -287,10 +287,10 @@ static int adp8870_led_probe(struct i2c_client *client)
 		led_dat->cdev.name = cur_led->name;
 		led_dat->cdev.default_trigger = cur_led->default_trigger;
 		led_dat->cdev.brightness_set = adp8870_led_set;
-		led_dat->cdev.brightness = LED_OFF;
+		led_dat->cdev.brightness = 0;
 		led_dat->flags = cur_led->flags >> FLAG_OFFT_SHIFT;
 		led_dat->client = client;
-		led_dat->new_brightness = LED_OFF;
+		led_dat->new_brightness = 0;
 		INIT_WORK(&led_dat->work, adp8870_led_work);
 
 		ret = led_classdev_register(&client->dev, &led_dat->cdev);
diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index f54d256e2d54..1b869624b4f8 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -46,7 +46,7 @@ static void led_bl_power_off(struct led_bl_data *priv)
 		return;
 
 	for (i = 0; i < priv->nb_leds; i++)
-		led_set_brightness(priv->leds[i], LED_OFF);
+		led_set_brightness(priv->leds[i], 0);
 
 	priv->enabled = false;
 }
-- 
2.34.1

