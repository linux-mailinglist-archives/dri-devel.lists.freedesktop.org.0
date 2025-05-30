Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E842AC9A03
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 10:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECE410E8BF;
	Sat, 31 May 2025 08:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N7b1n03e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF9F10E7D5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 04:33:55 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-527a2b89a11so682677e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 21:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748579634; x=1749184434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0SkMG7VLEtFOwLFLWZsT5pmezWKsUgqRrTsvMeAZOn0=;
 b=N7b1n03ecRsfmvX8wgPkpbK7MUQNAezub/8mwFytrXL9dM94vLF7FebIDxBB/sNgAu
 zeZJnsE45EsddIRFXfo+2umzHqfOyE/ScLwF06wFhpPR1mL4gRn6jj3YHokyUm9ZNzCa
 P+4q/f8gRsT8q73FSxvxtgJXkK+JciHTVtOW4vf98quRXfsy3YS7a5zElfCOVGHx7Hp6
 YLKR5INnR1+79CsrY/cLZEFJLF4E0wUji3fVwHm5cS/incz4quHqkTJUEAlml+KRxPAg
 1cs8AwGe3SObtavUk+CgU+/sEMK7o7AoPLbhETXKtFmvrawh7xKRmd8RTMslZlt3hGPk
 qYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748579634; x=1749184434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0SkMG7VLEtFOwLFLWZsT5pmezWKsUgqRrTsvMeAZOn0=;
 b=pKv03RtH/CFY6X3KQEib165NZJG30JyybmFJv5N2l0ONZkkkYKH/nd9x6uCiamWV7P
 8tRbt/msRcRtW4Ru8vcDJl4hIVKchKv6QY8b1awRSZCQZoUrbMxo7pzcrDbSoXMX7E1T
 ARXfXo/OQm4evfVZnzPC4nG5Odf75uyuLyi8yOTnEOGR5OUurRhetvhiIWMppUK4T8IB
 PLb6UNYih+GOJdMaI17u/64I/d8iikasq1eYAUR2+GzOIxM31ZtL53CLynUWtXTL1qin
 BYxijHjehf+Sm3zVwO9q/t7rEeIaj2tRfPgsbcqtphc3KJUEVHtxpe34T8nOKp4Gya95
 fPvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO6pYEwCJGJ1tWGzxjFQ1npNqoGzkiNGOcFB+Xea7aAcn0KuAIdh2P3HppP5ugU0Imx++HvO6Gn6k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhD3r8ld8aZLLQ2o1rsLWwMfyyiwD8OUNhABp+9/2bqulpvA+V
 EcxO4XhOT3ZeM7DYME93vitFDu6jXR7wdtLJ0r8gsb9bnKsVJ3Ys/drK
X-Gm-Gg: ASbGncupIBXj45664asYBTsHtQT5ZWDThtVLceunWy+E6XQufPNu1qVujo/ufgib/vJ
 qRk6xNL38fAtySQa8PX/JDY2T5V7sc6X9sI70FkEJ1cGLheeebdgdTsF31aYTO0yku75enI+iJ0
 n2O3FjeFKPHA+uFIu4W0yLhkSCOFruPuaw+QmsXahiC0eKCVFuxa7yorH5/TcpJUyHSGFqMaB+p
 SnDUBtvN7oP4ZOeRw3AUv7MMIibZtwennoPbVd/RhREdOr9DEH98XNxcTBe7ebUAVms/++ivrva
 W7wc/YLqWd20PYjAFA576QLmy7hI9TyQLjOHqEVlL5+87Ld/ar4NjSijL/9e88GG/y0=
X-Google-Smtp-Source: AGHT+IFNDW0qg4EWhYrexMFTJg/BAUd/8b9Ray4tgDhh/oRqIkMwI2tLjMh9MQJlrBZ8dPK/yzeVqA==
X-Received: by 2002:a05:6122:1d11:b0:529:f50:7904 with SMTP id
 71dfb90a1353d-530810d79f3mr1979885e0c.9.1748579633854; 
 Thu, 29 May 2025 21:33:53 -0700 (PDT)
Received: from alkaleus.. ([168.0.235.12]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53074ad9192sm2461263e0c.17.2025.05.29.21.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 21:33:53 -0700 (PDT)
From: Andre Luiz da Nobrega <andreluizrodriguescastro@gmail.com>
To: lee@kernel.org
Cc: jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andre Luiz da Nobrega <andreluizrodriguescastro@gmail.com>
Subject: [PATCH] backlight: lm3630a: Use scoped iterator to simplify error
 handling
Date: Fri, 30 May 2025 01:33:00 -0300
Message-ID: <20250530043300.89377-1-andreluizrodriguescastro@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 31 May 2025 08:18:51 +0000
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

This avoids the need to manually call fwnode_handle_put() in error paths.
Prevents potential memory leaks if future error paths forget the cleanup.

Signed-off-by: Andre Luiz da Nobrega <andreluizrodriguescastro@gmail.com>
---
 drivers/video/backlight/lm3630a_bl.c | 121 +++++++++++++--------------
 1 file changed, 56 insertions(+), 65 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 37651c2b9393..35a13bd38133 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -16,29 +16,29 @@
 #include <linux/pwm.h>
 #include <linux/platform_data/lm3630a_bl.h>
 
-#define REG_CTRL	0x00
-#define REG_BOOST	0x02
-#define REG_CONFIG	0x01
-#define REG_BRT_A	0x03
-#define REG_BRT_B	0x04
-#define REG_I_A		0x05
-#define REG_I_B		0x06
-#define REG_INT_STATUS	0x09
-#define REG_INT_EN	0x0A
-#define REG_FAULT	0x0B
-#define REG_PWM_OUTLOW	0x12
-#define REG_PWM_OUTHIGH	0x13
-#define REG_FILTER_STRENGTH	0x50
-#define REG_MAX		0x50
-
-#define INT_DEBOUNCE_MSEC	10
-
-#define LM3630A_BANK_0		0
-#define LM3630A_BANK_1		1
-
-#define LM3630A_NUM_SINKS	2
-#define LM3630A_SINK_0		0
-#define LM3630A_SINK_1		1
+#define REG_CTRL 0x00
+#define REG_BOOST 0x02
+#define REG_CONFIG 0x01
+#define REG_BRT_A 0x03
+#define REG_BRT_B 0x04
+#define REG_I_A 0x05
+#define REG_I_B 0x06
+#define REG_INT_STATUS 0x09
+#define REG_INT_EN 0x0A
+#define REG_FAULT 0x0B
+#define REG_PWM_OUTLOW 0x12
+#define REG_PWM_OUTHIGH 0x13
+#define REG_FILTER_STRENGTH 0x50
+#define REG_MAX 0x50
+
+#define INT_DEBOUNCE_MSEC 10
+
+#define LM3630A_BANK_0 0
+#define LM3630A_BANK_1 1
+
+#define LM3630A_NUM_SINKS 2
+#define LM3630A_SINK_0 0
+#define LM3630A_SINK_1 1
 
 struct lm3630a_chip {
 	struct device *dev;
@@ -67,15 +67,14 @@ static int lm3630a_read(struct lm3630a_chip *pchip, unsigned int reg)
 	return reg_val & 0xFF;
 }
 
-static int lm3630a_write(struct lm3630a_chip *pchip,
-			 unsigned int reg, unsigned int data)
+static int lm3630a_write(struct lm3630a_chip *pchip, unsigned int reg,
+			 unsigned int data)
 {
 	return regmap_write(pchip->regmap, reg, data);
 }
 
-static int lm3630a_update(struct lm3630a_chip *pchip,
-			  unsigned int reg, unsigned int mask,
-			  unsigned int data)
+static int lm3630a_update(struct lm3630a_chip *pchip, unsigned int reg,
+			  unsigned int mask, unsigned int data)
 {
 	return regmap_update_bits(pchip->regmap, reg, mask, data);
 }
@@ -158,9 +157,9 @@ static int lm3630a_intr_config(struct lm3630a_chip *pchip)
 		dev_err(pchip->dev, "create irq thread fail\n");
 		return -ENOMEM;
 	}
-	if (request_threaded_irq
-	    (pchip->irq, NULL, lm3630a_isr_func,
-	     IRQF_TRIGGER_FALLING | IRQF_ONESHOT, "lm3630a_irq", pchip)) {
+	if (request_threaded_irq(pchip->irq, NULL, lm3630a_isr_func,
+				 IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+				 "lm3630a_irq", pchip)) {
 		dev_err(pchip->dev, "request threaded irq fail\n");
 		destroy_workqueue(pchip->irqthread);
 		return -ENOMEM;
@@ -208,8 +207,8 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
 		/* turn the string off  */
 		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDA_ENABLE, 0);
 	else
-		ret |= lm3630a_update(pchip, REG_CTRL,
-				      LM3630A_LEDA_ENABLE, LM3630A_LEDA_ENABLE);
+		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDA_ENABLE,
+				      LM3630A_LEDA_ENABLE);
 	if (ret < 0)
 		goto out_i2c_err;
 	return 0;
@@ -283,8 +282,8 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
 		/* turn the string off  */
 		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDB_ENABLE, 0);
 	else
-		ret |= lm3630a_update(pchip, REG_CTRL,
-				      LM3630A_LEDB_ENABLE, LM3630A_LEDB_ENABLE);
+		ret |= lm3630a_update(pchip, REG_CTRL, LM3630A_LEDB_ENABLE,
+				      LM3630A_LEDB_ENABLE);
 	if (ret < 0)
 		goto out_i2c_err;
 	return 0;
@@ -345,10 +344,9 @@ static int lm3630a_backlight_register(struct lm3630a_chip *pchip)
 		props.brightness = pdata->leda_init_brt;
 		props.max_brightness = pdata->leda_max_brt;
 		label = pdata->leda_label ? pdata->leda_label : "lm3630a_leda";
-		pchip->bleda =
-		    devm_backlight_device_register(pchip->dev, label,
-						   pchip->dev, pchip,
-						   &lm3630a_bank_a_ops, &props);
+		pchip->bleda = devm_backlight_device_register(
+			pchip->dev, label, pchip->dev, pchip,
+			&lm3630a_bank_a_ops, &props);
 		if (IS_ERR(pchip->bleda))
 			return PTR_ERR(pchip->bleda);
 	}
@@ -358,10 +356,9 @@ static int lm3630a_backlight_register(struct lm3630a_chip *pchip)
 		props.brightness = pdata->ledb_init_brt;
 		props.max_brightness = pdata->ledb_max_brt;
 		label = pdata->ledb_label ? pdata->ledb_label : "lm3630a_ledb";
-		pchip->bledb =
-		    devm_backlight_device_register(pchip->dev, label,
-						   pchip->dev, pchip,
-						   &lm3630a_bank_b_ops, &props);
+		pchip->bledb = devm_backlight_device_register(
+			pchip->dev, label, pchip->dev, pchip,
+			&lm3630a_bank_b_ops, &props);
 		if (IS_ERR(pchip->bledb))
 			return PTR_ERR(pchip->bledb);
 	}
@@ -392,7 +389,8 @@ static int lm3630a_parse_led_sources(struct fwnode_handle *node,
 		return ret;
 
 	for (i = 0; i < num_sources; i++) {
-		if (sources[i] != LM3630A_SINK_0 && sources[i] != LM3630A_SINK_1)
+		if (sources[i] != LM3630A_SINK_0 &&
+		    sources[i] != LM3630A_SINK_1)
 			return -EINVAL;
 
 		ret |= BIT(sources[i]);
@@ -425,23 +423,20 @@ static int lm3630a_parse_bank(struct lm3630a_platform_data *pdata,
 
 	*seen_led_sources |= led_sources;
 
-	linear = fwnode_property_read_bool(node,
-					   "ti,linear-mapping-mode");
+	linear = fwnode_property_read_bool(node, "ti,linear-mapping-mode");
 	if (bank) {
 		if (led_sources & BIT(LM3630A_SINK_0) ||
 		    !(led_sources & BIT(LM3630A_SINK_1)))
 			return -EINVAL;
 
-		pdata->ledb_ctrl = linear ?
-			LM3630A_LEDB_ENABLE_LINEAR :
-			LM3630A_LEDB_ENABLE;
+		pdata->ledb_ctrl = linear ? LM3630A_LEDB_ENABLE_LINEAR :
+					    LM3630A_LEDB_ENABLE;
 	} else {
 		if (!(led_sources & BIT(LM3630A_SINK_0)))
 			return -EINVAL;
 
-		pdata->leda_ctrl = linear ?
-			LM3630A_LEDA_ENABLE_LINEAR :
-			LM3630A_LEDA_ENABLE;
+		pdata->leda_ctrl = linear ? LM3630A_LEDA_ENABLE_LINEAR :
+					    LM3630A_LEDA_ENABLE;
 
 		if (led_sources & BIT(LM3630A_SINK_1))
 			pdata->ledb_ctrl = LM3630A_LEDB_ON_A;
@@ -455,8 +450,7 @@ static int lm3630a_parse_bank(struct lm3630a_platform_data *pdata,
 			pdata->leda_label = label;
 	}
 
-	ret = fwnode_property_read_u32(node, "default-brightness",
-				       &val);
+	ret = fwnode_property_read_u32(node, "default-brightness", &val);
 	if (!ret) {
 		if (bank)
 			pdata->ledb_init_brt = val;
@@ -479,12 +473,10 @@ static int lm3630a_parse_node(struct lm3630a_chip *pchip,
 			      struct lm3630a_platform_data *pdata)
 {
 	int ret = -ENODEV, seen_led_sources = 0;
-	struct fwnode_handle *node;
 
-	device_for_each_child_node(pchip->dev, node) {
+	device_for_each_child_node_scoped(pchip->dev, node) {
 		ret = lm3630a_parse_bank(pdata, node, &seen_led_sources);
 		if (ret) {
-			fwnode_handle_put(node);
 			return ret;
 		}
 	}
@@ -538,8 +530,8 @@ static int lm3630a_probe(struct i2c_client *client)
 	}
 	pchip->pdata = pdata;
 
-	pchip->enable_gpio = devm_gpiod_get_optional(&client->dev, "enable",
-						GPIOD_OUT_HIGH);
+	pchip->enable_gpio =
+		devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
 	if (IS_ERR(pchip->enable_gpio))
 		return PTR_ERR(pchip->enable_gpio);
 
@@ -595,16 +587,15 @@ static void lm3630a_remove(struct i2c_client *client)
 	}
 }
 
-static const struct i2c_device_id lm3630a_id[] = {
-	{ LM3630A_NAME },
-	{}
-};
+static const struct i2c_device_id lm3630a_id[] = { { LM3630A_NAME }, {} };
 
 MODULE_DEVICE_TABLE(i2c, lm3630a_id);
 
 static const struct of_device_id lm3630a_match_table[] = {
-	{ .compatible = "ti,lm3630a", },
-	{ },
+	{
+		.compatible = "ti,lm3630a",
+	},
+	{},
 };
 
 MODULE_DEVICE_TABLE(of, lm3630a_match_table);
-- 
2.49.0

