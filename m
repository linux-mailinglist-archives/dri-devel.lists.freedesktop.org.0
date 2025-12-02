Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EF0C9AAC3
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5AF10E5B4;
	Tue,  2 Dec 2025 08:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sy49BfZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C26F10E5B3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 08:26:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5942bac322dso50714e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 00:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764663978; x=1765268778; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OSUsJtZmVyJFMumy5C75Kafona0a7fDMqaNggZdL9to=;
 b=Sy49BfZQy8EvxfScqhFnXFfw3ywoSO2ZKrktNcxbS3X0iZuFmlb1lxetMzWTn5S39d
 9/xyM36oeyf3b4fSYFvoPhiENRFLkE6LhKLow8G4Fn+ws5zdIm7xfM5W6N4F87KwZjwJ
 rF/cIwLMOiKOdHzS7aM6F9m7ZJUp/vd8SDUz7QF38ivdVS8ft0+e32E2MstXBqskeqiJ
 RtwPSGlpW9IWkZzjtdtKJGQgf4rCcNjFOCX04oK1jNrySN9DPeLlzUSGp9vBhsRoO5y6
 17CN+qzuYPbVSyd8ichUih7lsyMoICwaLCVkWDt1csWeEL028LBTkA4OWp6AZKS0BJeQ
 cyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764663978; x=1765268778;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OSUsJtZmVyJFMumy5C75Kafona0a7fDMqaNggZdL9to=;
 b=BMPWeDokffd7+eQnmmbnnTB91XGbOZMZfjlVgNl/RkXo/FMrCMtT77ltfHkPDyOJGC
 1GBSSNfIV8vCK3tJ+kEp/OmBYS/dVbwClIal+KDFA3AI5YyhdTYRJHAOco1REmZBTiCB
 CSTLyPVw2DU1MYvYKz+e5YFaD1c1D9LOCdnDBT24zx+F/vTYTlvFtZjhY4/aymt4zVh7
 I7kv0cd5LSmjq0F8RMJp5T0JmBZGuq9onHh1dTAybOv0jyjQZpVP4CFESwFDArfP9AOn
 nGKXA5Anzl36KAEA9zwIvVRQ3uFimR9ly7urBo1TycITItJnj/o5lBRmY8ksyB+yfq7I
 9cfg==
X-Gm-Message-State: AOJu0Yxxf+dQ6vxIve9YpC9355A891O1uIT1HOjbQfYn8Kns67Zzbgvv
 vZZLsp1rAH0YQsao5RYf2ymAYyrUOawemXSn816MJEwdz1hJe4hH6JqX
X-Gm-Gg: ASbGncu/oU4TSn8CTD9oKv+9HDYT6wYxbt0vZoJDmovvrjvFmHuWQnPJx7eUFBB/7h2
 vvhd0CeHPv3stK8mS88iP1O0/307T4al3yTft8rE16acVNwhIQYjM5/OwqJADyzKf8+whvuSqET
 cDLE/ewkQytTd3RLLUUtpvUNTf8NtVvqNjmGh2x2DkvedK/0eEOIrlFthlbDEPHm5p6T880C2kt
 vK/Rtk0M2bcM3KH11y5vqz+9PKUE8BB2qfQYuAN6aQ5YBbs+izabmeeFkgFgNjZFFDMfBdh0NFb
 8Sww8NTPFXXl1x3SdOKDNY1PRpJq0QIvdTTmXQrXT24PZntpMefdiAy/Mux6wLaU3+Z2GeCmMYm
 jz5hWwyLtQmLKioBgTA4zJcC6Ed0jcOdXnIqqeCjJSvuSZjGNTQXYTi+lXkah16XhwNudPiAqRG
 CtUpSBja3jkWXNlV1BdZlSEAwT3zXscgP64oSzPUSxPXXVWecD3Un920diNw803pp+cZ4=
X-Google-Smtp-Source: AGHT+IGjykhC2zoR8hTlVXXe+Skv0zw1/qAkZP6sy5Z13nSnub9A43A+C4Id3mGwfG9St6ZgSaDchA==
X-Received: by 2002:a05:6512:1154:b0:595:7876:7b78 with SMTP id
 2adb3069b0e04-596a3eac7edmr14185853e87.15.1764663977468; 
 Tue, 02 Dec 2025 00:26:17 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bf8b06bcsm4423727e87.25.2025.12.02.00.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 00:26:16 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:25:22 +0100
Subject: [PATCH RESEND v2 6/6] drm/sitronix/st7571-spi: add support for SPI
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-st7571-split-v2-6-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
In-Reply-To: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4371;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=M2AEWs1PlE4kHIlUXzPT49FDEzkCCXRLe8Ws9kBRYLc=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLqKZU7jBbtSJJ40+LT2OBg5HNtGXFaAbA3sIp
 HshImbm5RyJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6imQAKCRCIgE5vWV1S
 MnZ0D/wNq7LJe20xNdz7/iBRa3JcaSkQNJoiRTfDZCoOYmepqgB1lQeJREVhw3MeGoaDuK9oyNF
 1SuhtEKY9mE+VzC5Ke+7r5nKm8H/fwMMPqWYtsFMzAotYbCO2EsCH0+GYYh15c6m6RBhKkCmIse
 NQkOeeRklldJG4jq+POUr1uhaBVC0dska4F+tYL+pMefWaHtvy9qGuJV0KGviBiMRQXv1JPE7Kh
 GM5wVFnKZxvgNy3BW0ZZwZ7ZzTeMJ5jJ2T4Ka5hzLN5kBAH2X3A3H2kaQln2fs/Rpmzx+Mn7T50
 akLLeJMOcIm3Up4aepRr6mX/aW30Dd/IVcu+HOU70y9UZezwu1yDGmEWXoyZn7s4Peo9RGHnidW
 1R/+AFxVyj8U1nbkUQtnoqa1VVDu/odnTUDs4w/u+2Z20OEzLzjtxjQLrY0r7FrAfaTiXMkGgAj
 aEPqDzJUcMvgNa+6kBsLtjy6m5DhiV74WpmE9G5KpmRWHhOXkGnd9sw8fJxVcUB310ZWOCHHulR
 X/UCtHrLXghCOYEo673Q0yI//JDtA4Ejb2R4JGmbu42iJfg6P+AIOUSb9ZcIfez5x/ifFJGZqY+
 6+rfzpiOOkwmF4E0DGmd9ZXfj9XC3MlZiAH9Y7OncUd9kB92hEUrmvsmgUNoQ8KvcZcJutyQYUX
 GJWWzutJ+G4EHUA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Add support for ST7561/ST7571 connected to SPI bus.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS                           |  1 +
 drivers/gpu/drm/sitronix/Kconfig      | 12 ++++++
 drivers/gpu/drm/sitronix/Makefile     |  1 +
 drivers/gpu/drm/sitronix/st7571-spi.c | 76 +++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66e9ffb757c8..c89e521cafa1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8083,6 +8083,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/sitronix,st7567.yaml
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
 F:	drivers/gpu/drm/sitronix/st7571-i2c.c
+F:	drivers/gpu/drm/sitronix/st7571-spi.c
 F:	drivers/gpu/drm/sitronix/st7571.c
 F:	drivers/gpu/drm/sitronix/st7571.h
 
diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
index 0676a86661ca..2204250ab413 100644
--- a/drivers/gpu/drm/sitronix/Kconfig
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -27,6 +27,18 @@ config DRM_ST7571_I2C
 
 	  if M is selected the module will be called st7571-i2c.
 
+config DRM_ST7571_SPI
+	tristate "DRM support for Sitronix ST7567/ST7571 display panels (SPI)"
+	depends on DRM_ST7571 && SPI
+	select REGMAP_SPI
+	help
+	  Sitronix ST7571 is a driver and controller for 4-level gray
+	  scale and monochrome dot matrix LCD panels.
+
+	  DRM driver for Sitronix ST7565/ST7571 panels connected via SPI bus.
+
+	  if M is selected the module will be called st7571-spi.
+
 config DRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
index 8073bb776ff9..c631e3359c3d 100644
--- a/drivers/gpu/drm/sitronix/Makefile
+++ b/drivers/gpu/drm/sitronix/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_DRM_ST7571)		+= st7571.o
 obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
+obj-$(CONFIG_DRM_ST7571_SPI)		+= st7571-spi.o
 obj-$(CONFIG_DRM_ST7586)		+= st7586.o
 obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/sitronix/st7571-spi.c b/drivers/gpu/drm/sitronix/st7571-spi.c
new file mode 100644
index 000000000000..0206e9162f1c
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/st7571-spi.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Sitronix ST7571 connected via SPI bus.
+ *
+ * Copyright (C) 2025 Marcus Folkesson <marcus.folkesson@gmail.com>
+ */
+
+#include <linux/spi/spi.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include "st7571.h"
+
+static const struct regmap_config st7571_spi_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.can_multi_write = true,
+};
+
+static int st7571_spi_probe(struct spi_device *spi)
+{
+	struct st7571_device *st7571;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_spi(spi, &st7571_spi_regmap_config);
+	if (IS_ERR(regmap)) {
+		return dev_err_probe(&spi->dev, PTR_ERR(regmap),
+				     "Failed to initialize regmap\n");
+	}
+
+	st7571 = st7571_probe(&spi->dev, regmap);
+	if (IS_ERR(st7571))
+		return dev_err_probe(&spi->dev, PTR_ERR(st7571),
+				     "Failed to initialize regmap\n");
+
+	spi_set_drvdata(spi, st7571);
+	return 0;
+}
+
+static void st7571_spi_remove(struct spi_device *spi)
+{
+	struct st7571_device *st7571 = spi_get_drvdata(spi);
+
+	st7571_remove(st7571);
+}
+
+static const struct of_device_id st7571_of_match[] = {
+	{ .compatible = "sitronix,st7567", .data = &st7567_config },
+	{ .compatible = "sitronix,st7571", .data = &st7571_config },
+	{},
+};
+MODULE_DEVICE_TABLE(of, st7571_of_match);
+
+static const struct spi_device_id st7571_spi_id[] = {
+	{ "st7567", 0 },
+	{ "st7571", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, st7571_spi_id);
+
+static struct spi_driver st7571_spi_driver = {
+	.driver = {
+		.name = "st7571-spi",
+		.of_match_table = st7571_of_match,
+	},
+	.probe = st7571_spi_probe,
+	.remove = st7571_spi_remove,
+	.id_table = st7571_spi_id,
+};
+
+module_spi_driver(st7571_spi_driver);
+
+MODULE_AUTHOR("Marcus Folkesson <marcus.folkesson@gmail.com>");
+MODULE_DESCRIPTION("DRM Driver for Sitronix ST7571 LCD controller (SPI)");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DRM_ST7571");

-- 
2.51.2

