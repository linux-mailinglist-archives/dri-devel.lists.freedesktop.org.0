Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411EFA7DC8A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 13:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F5B10E43A;
	Mon,  7 Apr 2025 11:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nwfaqktu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528DB10E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:58 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-22622ddcc35so54604625ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 02:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744019638; x=1744624438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqsxLQYznUT9RsPhQAq/Ha4vcZ/fvmuGVrYbn4a8PBA=;
 b=Nwfaqktu361bxFj4YtkikYabEKOxFlx+Sl+XGcfLz0nAl7e+f3qQmtf6ohmpsz21SF
 JhHkqLqKfsgBB3ZBQ3utwLNUuV9+IePgoyx04DN/47IR8Q3hi921zOmv1JstpFwatdR1
 X8xKDKxgNiDMCeMrH8oh5ps9w0kT3q1kgAni5n4DVH25A/OJOEAB4KHLc0E7rYzIqzYm
 JfaBG8y3ufDxh023OtL06mlgGqfLqzr0iMqIsGnUFU0IUd8tYVWjTxXNSCaxxOMFjTAk
 iQTd5XFPCiGG4dxe/MPl3Ql2jr51nmThWCOHp1QDupwTvgj7cMkvsHFRVgWUjTDssLQE
 iCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744019638; x=1744624438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QqsxLQYznUT9RsPhQAq/Ha4vcZ/fvmuGVrYbn4a8PBA=;
 b=wk7M4LNbdYfQfP4gdY17D4HGVmQdeA2uxSsPPyFcAc9bHjVWDmIYaE5jKacyNGe1fz
 V6Z1iZbk05T929Uy409MBshmMt6EbuAFF/y2TtQNjrssahy7Jt/RTy+IaF9DpeTMYk/X
 P/hu8Lh6gpuvPdUHeEEVXDepHM9TJI5HTfp6v8ggunThI8LIjHXM6sJ6ZG6ZNM0yQAQh
 BSlMNO3m+ztw0wBM3Qe3d0oTpoC5jhzGCCuADY1RtxpcRkATx9x9M4Dv0qMM9kaH7NU7
 53RrzbGhLNhsKgMszyM+8Yq5Euw/Hf90QKmMCHJw/ffTkxEHVZLJD/xP+oRbHb+ro/6e
 sw5A==
X-Gm-Message-State: AOJu0YyK471f1CmyHmIG5AvzikI1YfZYJnnBn1tuWMpRCPX0tRA437CC
 kc11Se5I6LSs4l7iGARQZJQX+tiOywFr97qo/6KrqUoso58ru9VC
X-Gm-Gg: ASbGncsOyXFYNQi3J645LgzDeKzYmsvNk0Srx97ZM7Y/ni/jA+hwICzrUA8TDun0RyS
 KhtDyodWc2u2cgTE37jW7CUmLY/Kek674u7Z1ox9yqSIc3VkpGVs1cv3L2pbhXNcr49TDOW/Xgc
 0zdjvJoek1B532+njsvwIB/kvh9Sx64kKGziNJ1uVcd3BbQBQ4ouPu0nMCuih7UxvtD0oVp9zHg
 i6wIyQXcCyF5mIvHxBSawjLjCgZf+M2/nZQwsW/BKiMBTb3QBavskGJ/stKrQwKG+RTHjAihXwT
 0ENbgcW8DjOqV9quwp0EhRD+Rt8dzrmiHMI7L07yHSU=
X-Google-Smtp-Source: AGHT+IEuCKwpckL0Z9qXyRFKR/AGg8nN7XQo8YQhcxfUUoLSqUZ0cLSWOWcAvb+fY4I/YHLsAll3+Q==
X-Received: by 2002:a17:902:ebc7:b0:21f:dbb:20a6 with SMTP id
 d9443c01a7336-22a95573892mr114847295ad.33.1744019637847; 
 Mon, 07 Apr 2025 02:53:57 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785bfddfsm77213805ad.66.2025.04.07.02.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 02:53:57 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/4] backlight: ktz8866: add slave handler
Date: Mon,  7 Apr 2025 17:51:17 +0800
Message-ID: <20250407095119.588920-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407095119.588920-1-mitltlatltl@gmail.com>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Apr 2025 11:40:40 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kinetic ktz8866, found in many android devices, nowadays, some oem use
dual ktz8866 to support a larger panel and  higher brightness, original
driver would only handle half backlight region on these devices,
registering it twice is unreasonable, so adding the slave handler to
support it.

Note that, none of the devices supported by upstream require this, the
devices using this is porting.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/video/backlight/ktz8866.c | 68 +++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index 351c2b4d6..017ad80dd 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -3,6 +3,9 @@
  * Backlight driver for the Kinetic KTZ8866
  *
  * Copyright (C) 2022, 2023 Jianhua Lu <lujianhua000@gmail.com>
+ *
+ * Apr 2025 - Pengyu Luo <mitltlatltl@gmail.com>
+ *	Added handling for dual KTZ8866(master and slave)
  */
 
 #include <linux/backlight.h>
@@ -43,11 +46,17 @@
 #define LCD_BIAS_EN 0x9F
 #define PWM_HYST 0x5
 
+struct ktz8866_slave {
+	struct i2c_client *client;
+	struct regmap *regmap;
+};
+
 struct ktz8866 {
 	struct i2c_client *client;
 	struct regmap *regmap;
-	bool led_on;
 	struct gpio_desc *enable_gpio;
+	struct ktz8866_slave *slave;
+	bool led_on;
 };
 
 static const struct regmap_config ktz8866_regmap_config = {
@@ -56,16 +65,22 @@ static const struct regmap_config ktz8866_regmap_config = {
 	.max_register = REG_MAX,
 };
 
-static int ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
-			 unsigned int val)
+static void ktz8866_write(struct ktz8866 *ktz, unsigned int reg,
+			  unsigned int val)
 {
-	return regmap_write(ktz->regmap, reg, val);
+	regmap_write(ktz->regmap, reg, val);
+
+	if (ktz->slave)
+		regmap_write(ktz->slave->regmap, reg, val);
 }
 
-static int ktz8866_update_bits(struct ktz8866 *ktz, unsigned int reg,
-			       unsigned int mask, unsigned int val)
+static void ktz8866_update_bits(struct ktz8866 *ktz, unsigned int reg,
+				unsigned int mask, unsigned int val)
 {
-	return regmap_update_bits(ktz->regmap, reg, mask, val);
+	regmap_update_bits(ktz->regmap, reg, mask, val);
+
+	if (ktz->slave)
+		regmap_update_bits(ktz->slave->regmap, reg, mask, val);
 }
 
 static int ktz8866_backlight_update_status(struct backlight_device *backlight_dev)
@@ -124,10 +139,41 @@ static void ktz8866_init(struct ktz8866 *ktz)
 		ktz8866_write(ktz, LCD_BIAS_CFG1, LCD_BIAS_EN);
 }
 
+static int ktz8866_slave_register(struct ktz8866 *ktz)
+{
+	struct device *dev = &ktz->client->dev;
+	struct ktz8866_slave *slave;
+	struct i2c_client *client;
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "kinetic,ktz8866-slave");
+	if (!np)
+		return 0;
+
+	client = of_find_i2c_device_by_node(np);
+	of_node_put(np);
+	if (!client)
+		return 0;
+
+	slave = devm_kzalloc(dev, sizeof(*slave), GFP_KERNEL);
+	if (!slave)
+		return -ENOMEM;
+
+	slave->client = client;
+	slave->regmap = devm_regmap_init_i2c(client, &ktz8866_regmap_config);
+	if (IS_ERR(slave->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(slave->regmap),
+				     "failed to init regmap\n");
+
+	ktz->slave = slave;
+
+	return 0;
+}
+
 static int ktz8866_probe(struct i2c_client *client)
 {
 	struct backlight_device *backlight_dev;
-	struct backlight_properties props;
+	struct backlight_properties props = {};
 	struct ktz8866 *ktz;
 	int ret = 0;
 
@@ -151,7 +197,6 @@ static int ktz8866_probe(struct i2c_client *client)
 	if (IS_ERR(ktz->enable_gpio))
 		return PTR_ERR(ktz->enable_gpio);
 
-	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = MAX_BRIGHTNESS;
 	props.brightness = DEFAULT_BRIGHTNESS;
@@ -163,6 +208,11 @@ static int ktz8866_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(backlight_dev),
 				"failed to register backlight device\n");
 
+	ret = ktz8866_slave_register(ktz);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to register slave\n");
+
 	ktz8866_init(ktz);
 
 	i2c_set_clientdata(client, backlight_dev);
-- 
2.49.0

