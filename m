Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAC0507C1C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 23:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0E489D8D;
	Tue, 19 Apr 2022 21:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A07389D58
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 21:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650404917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVLLH9C759FHMpXQwwKHJScD/DCbIHfB8SwIPo2nJQ0=;
 b=axsYuzWvKS/rhZKJkaJCETLkGdBz0WXULc0aVsM4WlA+lFX49jmepUKgR6BQcM+O8mWFf6
 d5ZooDYjN1Ir+us9TN/IQgh4WH/sg6QzrLwbOseKOv4sNo95g/uHf8GFP3a0+7wXKfkeHm
 x+a1mxnFc/Vkg31r0Y+2Tg5B8PKjwmM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-P5ERpEGBMp-OhnLjPhHPaA-1; Tue, 19 Apr 2022 17:48:36 -0400
X-MC-Unique: P5ERpEGBMp-OhnLjPhHPaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bh11-20020a05600c3d0b00b003928fe7ba07so11804wmb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVLLH9C759FHMpXQwwKHJScD/DCbIHfB8SwIPo2nJQ0=;
 b=Wz7cZZ3RolN7LoolupoTWxIrAKn8kGgEaJRWrMxwMez8jET8uudtFqWIxxf2MmxvpW
 Ue3RJlUBn8caDNnYZ/3qv07MOer/NXQP1DrB0I96IU1w3hbdnOtBRc7yUpuHUaKCSUhr
 k9cO2i/V6uWdbUe1umDEZ4PjWulShzZ6xcIfqLLBOaeUwTThIaVe4Pucvw2yYu5Fi/jo
 +w3z6yekKR5Gi97LyI7xFyfLH/ylicUs10htVYk6WY68TFA9ROl65CKJ6DySR0nwDNl0
 kZebXwZya/GUHG/R95YNCKn6ww+thFeF2GX/6iZ9LJuyPIlwFNfSxIIH9gc71DqlUd9F
 le+Q==
X-Gm-Message-State: AOAM533JgoCtIFpv9v2vk6PHN1Y7ekBBe/LJzOUH7NilOMLZjZ1kz5o1
 TC/Y4C0bih4WX6jplJNRczskWeTmf3CVlWLwKMfkVzUysRypAb7Q9+NhMo/dOp1auNrFdzNRjDp
 eychZP1f3M7zlIA6t0VpV/qBwAZMk
X-Received: by 2002:a5d:588b:0:b0:20a:9570:de77 with SMTP id
 n11-20020a5d588b000000b0020a9570de77mr9040554wrf.27.1650404915022; 
 Tue, 19 Apr 2022 14:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzatn+dYelnkGoOsI6bvv8PKpP08+CPJhO0Hu57/jsMjYH4dmAtg8p9Rd0YiNjJRCa9cn9xbg==
X-Received: by 2002:a5d:588b:0:b0:20a:9570:de77 with SMTP id
 n11-20020a5d588b000000b0020a9570de77mr9040539wrf.27.1650404914803; 
 Tue, 19 Apr 2022 14:48:34 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00207a8cde900sm13333699wrv.19.2022.04.19.14.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 14:48:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/5] drm/solomon: Move device info from ssd130x-i2c to the
 core driver
Date: Tue, 19 Apr 2022 23:48:22 +0200
Message-Id: <20220419214824.335075-5-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419214824.335075-1-javierm@redhat.com>
References: <20220419214824.335075-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are declared in the ssd130x-i2c transport driver but the information
is not I2C specific, and could be used by other SSD130x transport drivers.

Move them to the ssd130x core driver and just set the OF device entries to
an ID that could be used to lookup the correct device info from an array.

While being there, also move the SSD130X_DATA and SSD130X_COMMAND control
bytes. Since even though they are used by the I2C interface, they could
also be useful for other transport protocols such as SPI.

Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v5:
- Remove unnecessary blank line added by mistake in v4 (Andy Shevchenko).

Changes in v4:
- Export ssd13x_variants array using EXPORT_SYMBOL_NS_GPL() (Andy Shevchenko)
- Use MODULE_IMPORT_NS(DRM_SSD130X) in the ssd130x-i2c driver (Andy Shevchenko)

Changes in v3:
- s/it/they in the commit description (Geert Uytterhoeven)
- Drop unnecessary blank line (Geert Uytterhoeven)
- Export variants array and use &info[ID] in device table (Andy Shevchenko)

Changes in v2:
- Drop ssd13x_variant_to_info() and just use the array index (Neil Armstrong).

 drivers/gpu/drm/solomon/ssd130x-i2c.c | 52 ++++++---------------------
 drivers/gpu/drm/solomon/ssd130x.c     | 35 ++++++++++++++++--
 drivers/gpu/drm/solomon/ssd130x.h     | 14 ++++++++
 3 files changed, 56 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index 45867ef2bc8b..d6835ec71c39 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -53,76 +53,43 @@ static void ssd130x_i2c_shutdown(struct i2c_client *client)
 	ssd130x_shutdown(ssd130x);
 }
 
-static struct ssd130x_deviceinfo ssd130x_sh1106_deviceinfo = {
-	.default_vcomh = 0x40,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 5,
-	.page_mode_only = 1,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1305_deviceinfo = {
-	.default_vcomh = 0x34,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 7,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1306_deviceinfo = {
-	.default_vcomh = 0x20,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 8,
-	.need_chargepump = 1,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1307_deviceinfo = {
-	.default_vcomh = 0x20,
-	.default_dclk_div = 2,
-	.default_dclk_frq = 12,
-	.need_pwm = 1,
-};
-
-static struct ssd130x_deviceinfo ssd130x_ssd1309_deviceinfo = {
-	.default_vcomh = 0x34,
-	.default_dclk_div = 1,
-	.default_dclk_frq = 10,
-};
-
 static const struct of_device_id ssd130x_of_match[] = {
 	{
 		.compatible = "sinowealth,sh1106",
-		.data = &ssd130x_sh1106_deviceinfo,
+		.data = &ssd130x_variants[SH1106_ID],
 	},
 	{
 		.compatible = "solomon,ssd1305",
-		.data = &ssd130x_ssd1305_deviceinfo,
+		.data = &ssd130x_variants[SSD1305_ID],
 	},
 	{
 		.compatible = "solomon,ssd1306",
-		.data = &ssd130x_ssd1306_deviceinfo,
+		.data = &ssd130x_variants[SSD1306_ID],
 	},
 	{
 		.compatible = "solomon,ssd1307",
-		.data = &ssd130x_ssd1307_deviceinfo,
+		.data = &ssd130x_variants[SSD1307_ID],
 	},
 	{
 		.compatible = "solomon,ssd1309",
-		.data = &ssd130x_ssd1309_deviceinfo,
+		.data = &ssd130x_variants[SSD1309_ID],
 	},
 	/* Deprecated but kept for backward compatibility */
 	{
 		.compatible = "solomon,ssd1305fb-i2c",
-		.data = &ssd130x_ssd1305_deviceinfo,
+		.data = &ssd130x_variants[SSD1305_ID],
 	},
 	{
 		.compatible = "solomon,ssd1306fb-i2c",
-		.data = &ssd130x_ssd1306_deviceinfo,
+		.data = &ssd130x_variants[SSD1306_ID],
 	},
 	{
 		.compatible = "solomon,ssd1307fb-i2c",
-		.data = &ssd130x_ssd1307_deviceinfo,
+		.data = &ssd130x_variants[SSD1307_ID],
 	},
 	{
 		.compatible = "solomon,ssd1309fb-i2c",
-		.data = &ssd130x_ssd1309_deviceinfo,
+		.data = &ssd130x_variants[SSD1309_ID],
 	},
 	{ /* sentinel */ }
 };
@@ -142,3 +109,4 @@ module_i2c_driver(ssd130x_i2c_driver);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(DRM_SSD130X);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index a7e784518c69..ba2de93d00f0 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -39,9 +39,6 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-#define SSD130X_DATA				0x40
-#define SSD130X_COMMAND				0x80
-
 #define SSD130X_PAGE_COL_START_LOW		0x00
 #define SSD130X_PAGE_COL_START_HIGH		0x10
 #define SSD130X_SET_ADDRESS_MODE		0x20
@@ -94,6 +91,38 @@
 
 #define MAX_CONTRAST 255
 
+const struct ssd130x_deviceinfo ssd130x_variants[] = {
+	[SH1106_ID] = {
+		.default_vcomh = 0x40,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 5,
+		.page_mode_only = 1,
+	},
+	[SSD1305_ID] = {
+		.default_vcomh = 0x34,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 7,
+	},
+	[SSD1306_ID] = {
+		.default_vcomh = 0x20,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 8,
+		.need_chargepump = 1,
+	},
+	[SSD1307_ID] = {
+		.default_vcomh = 0x20,
+		.default_dclk_div = 2,
+		.default_dclk_frq = 12,
+		.need_pwm = 1,
+	},
+	[SSD1309_ID] = {
+		.default_vcomh = 0x34,
+		.default_dclk_div = 1,
+		.default_dclk_frq = 10,
+	}
+};
+EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
+
 static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
 {
 	return container_of(drm, struct ssd130x_device, drm);
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index f5b062576fdf..d14f78c2eb07 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -18,6 +18,18 @@
 
 #include <linux/regmap.h>
 
+#define SSD130X_DATA				0x40
+#define SSD130X_COMMAND				0x80
+
+enum ssd130x_variants {
+	SH1106_ID,
+	SSD1305_ID,
+	SSD1306_ID,
+	SSD1307_ID,
+	SSD1309_ID,
+	NR_SSD130X_VARIANTS
+};
+
 struct ssd130x_deviceinfo {
 	u32 default_vcomh;
 	u32 default_dclk_div;
@@ -71,6 +83,8 @@ struct ssd130x_device {
 	u8 page_end;
 };
 
+extern const struct ssd130x_deviceinfo ssd130x_variants[];
+
 struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap);
 int ssd130x_remove(struct ssd130x_device *ssd130x);
 void ssd130x_shutdown(struct ssd130x_device *ssd130x);
-- 
2.35.1

