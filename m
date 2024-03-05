Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1556F871EFC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 13:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEA1112A91;
	Tue,  5 Mar 2024 12:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="YgK6NkcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DAB112A91
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 12:21:29 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1dc49b00bdbso50134775ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 04:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709641289; x=1710246089;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:dkim-signature:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SEx+zb9TSgK4yB6p6tHYNUfZEDI6oNw+ZcHBjx9ShfU=;
 b=YsTvcnVlPFdYjQkW0n+FuMeAMrc/tpD6lSPUegtngE+ZFYZN++DbG01sIHj1Tj/sTy
 K9aT2TZFqprfhvsCE6xE+Ede2JhSWLXIf46geioaaCp4W7AwfWjNryCSqS5jxIlQ0jzf
 rrp4CmSDFOlAVN/HHOZAIsYSK4FcrH8EUDjp6CD3WvRMjKP7WsaD8qAG9QgplBoeWfvo
 f26H/hffgCFgy3oxQrSb1EttdkvXne7gVwrFLCR+lBTd+1ip291weWwB5zNB7KvvyQce
 f2JuRK4WrTXItGSc7Ji6O/m+KxIHonkdLWsxB5CaA0XfHKfZwYdKhub6L7k1G9/GNZf/
 gagw==
X-Gm-Message-State: AOJu0YzRmputoan8/BvE4VOSSPg/IDqLCAshLcPc9Cmcf6Lnma08zVVz
 wIpBylBnTNVFVNOaBvnY3F5CfIrdLqqoGmEN0nEty5Vobh6MiGkk
X-Google-Smtp-Source: AGHT+IGmOCmr/nPchd/IbKo+mLmdiGP2sn/dFWTak1HHJNlB1jMqv56PTesOXkry/3ewNFEhPLEIng==
X-Received: by 2002:a17:902:da86:b0:1dd:2bc2:ed25 with SMTP id
 j6-20020a170902da8600b001dd2bc2ed25mr1645988plx.42.1709641288888; 
 Tue, 05 Mar 2024 04:21:28 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170902e9c400b001d7252fef6bsm10369231plk.299.2024.03.05.04.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:21:28 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1709641287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEx+zb9TSgK4yB6p6tHYNUfZEDI6oNw+ZcHBjx9ShfU=;
 b=YgK6NkcV2HDpRzMn7ctoup6zYb4x8csJ7THtUKcJzzjJ8RcVsmDRAsPh4Yfvkh2QaPSsaE
 JzOn9WH/glkdghz21tc3GPWUrUDeE7BnH2ybn4ms06a+w72XsjUDASvRLOFLWL+rBPg9ef
 fh+GPzYNlr3V+Kl7meY8aFAlHLT3PrDL8yPha+WydzDgR8udWGjKKBvVsABH45S0HIts00
 m6unjkmPUmZbjwEqDDOro6CmzU3Rso4OEfHdrv0WfT9loTGwFFs4J+EM4O6PhKpTylotpa
 qLFXuvR0MWsh/pmh7Zl048oqbcMUfKrzja8mzI0FWCoq/M7E5Gq0UxYlMJ+c/Q==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 05 Mar 2024 09:21:18 -0300
Subject: [PATCH 2/2] video: backlight: lcd: make lcd_class constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-class_cleanup-backlight-v1-2-c0e15cc25be1@marliere.net>
References: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
In-Reply-To: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Ricardo B. Marliere" <ricardo@marliere.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2445; i=ricardo@marliere.net; 
 h=from:subject:message-id;
 bh=zA1QI3pTmF4PVrGfMGQ4T6AJuBZkkUOxdUv7rVLqvq8=; 
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl5w4+iSyNLDZC3tRX7TPpVThd4AQXUWdlE0ijV
 xMPTkgRv36JAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZecOPgAKCRDJC4p8Y4ZY
 pobYD/4jQPHj7hJi/so8GQHNZhM9h2mU0OKK45lxlhm1Q3dv8hDKlVyL9rq7nXJl4ST4ztys0VI
 trz7QE3BfAjjJqPjqFyxGRXNNGG9DCAjc5iYeMao8xiYOIDrXQWikf81wWNtJJ2jPWmBVIfQgQ3
 qksMZFWx5vVy7oITR3JGVurioxGUV8/MkG7CbiaLqyboIRMseZ5K+I9PIK1QIQ+u26knlbcsIEC
 WC0fckurcLyEnqXEd+ILPgiXzMpm6RpdvZQB058YL9sSkgkFEzg53EtaoeyM2f4yyLv4p/j9tUG
 sybiXdf+j9AXLbKebqkgrJ1oy3k+2F/9CpqO3GfOOfDTqhkheUhALj1B6cpiuMdyxuQe9KoLeAU
 VPXSNHC+Hz4hx2irj88cHO2aYFFRQXIUSYO4Di4Q0b4xYNTGMnV5M8iDAQ1WMFRYVpRMJoD4vcl
 7j3OyKLoRjiF2tUzyc7cK3UsOEEvmv5qD+u45T6y+Gv1nZ6KKfytun2qzJYjm/w7m5wIFjH/EER
 uf6f/GhL3OcKs/MLSRkBETzFm4hPdZJrc9fmZCfV+Pes0dEfGYYlvEIrQRL4bL/SNeZ33AN3OVp
 Ti8gaoYCLznvyG71OlDEdm9Sor7/Tr0kwK8fA1Sco+2c1XHKdYjlrv2ko835i16JDo5RFgu6F+8
 CCmkHoOql2/vOgw==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

Since commit 43a7206b0963 ("driver core: class: make class_register() take
a const *"), the driver core allows for struct class to be in read-only
memory, so move the lcd_class structure to be declared at build time
placing it into read-only memory, instead of having to be dynamically
allocated at boot time.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/video/backlight/lcd.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index 77c5cb2a44e2..ba4771cbd781 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -159,8 +159,6 @@ static ssize_t max_contrast_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(max_contrast);
 
-static struct class *lcd_class;
-
 static void lcd_device_release(struct device *dev)
 {
 	struct lcd_device *ld = to_lcd_device(dev);
@@ -175,6 +173,11 @@ static struct attribute *lcd_device_attrs[] = {
 };
 ATTRIBUTE_GROUPS(lcd_device);
 
+static const struct class lcd_class = {
+	.name = "lcd",
+	.dev_groups = lcd_device_groups,
+};
+
 /**
  * lcd_device_register - register a new object of lcd_device class.
  * @name: the name of the new object(must be the same as the name of the
@@ -202,7 +205,7 @@ struct lcd_device *lcd_device_register(const char *name, struct device *parent,
 	mutex_init(&new_ld->ops_lock);
 	mutex_init(&new_ld->update_lock);
 
-	new_ld->dev.class = lcd_class;
+	new_ld->dev.class = &lcd_class;
 	new_ld->dev.parent = parent;
 	new_ld->dev.release = lcd_device_release;
 	dev_set_name(&new_ld->dev, "%s", name);
@@ -318,19 +321,19 @@ EXPORT_SYMBOL(devm_lcd_device_unregister);
 
 static void __exit lcd_class_exit(void)
 {
-	class_destroy(lcd_class);
+	class_unregister(&lcd_class);
 }
 
 static int __init lcd_class_init(void)
 {
-	lcd_class = class_create("lcd");
-	if (IS_ERR(lcd_class)) {
-		pr_warn("Unable to create backlight class; errno = %ld\n",
-			PTR_ERR(lcd_class));
-		return PTR_ERR(lcd_class);
+	int ret;
+
+	ret = class_register(&lcd_class);
+	if (ret) {
+		pr_warn("Unable to create backlight class; errno = %d\n", ret);
+		return ret;
 	}
 
-	lcd_class->dev_groups = lcd_device_groups;
 	return 0;
 }
 

-- 
2.43.0

