Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376DD4FE5D0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 18:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DE110E6A1;
	Tue, 12 Apr 2022 16:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C5010E69A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649780876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fiitAF+obi/0SZz4a7WRaAtgx4DdchhRvhz/qzB643E=;
 b=SHJoMDjqlC/KZtg3eDQemaCqUvImvUjth4VCoQ02Qwh4pGhzYNgwHG7jZy/2Alm5K9dKu8
 L/MXXfIsh4k3Z0a30U8TqELdmKWl7cA3wVvpejDYIXGa/6jBpg/S7cDnn3z6wCYNwyES+y
 y9oRKhXKDCiniZDrV7ywPv2GvXvi18U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-xr094tmDOdmSKLhmUi8nKw-1; Tue, 12 Apr 2022 12:27:55 -0400
X-MC-Unique: xr094tmDOdmSKLhmUi8nKw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r127-20020a1c4485000000b0038eaca2b8c9so1469831wma.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fiitAF+obi/0SZz4a7WRaAtgx4DdchhRvhz/qzB643E=;
 b=VxP4nwp+4uAwoPplBDEr/lXoulYooxzcWYmYxANjpTday40VdHep1927AxuJ+taCyY
 9yJJtJGfKbx7nbrJNTAhrKleWcNLkAVnzFXBo4hhi3jdsLmpIHBxGXRwYR/3ApagK6Vj
 m8rL61wx0LQfmc/VZlec+d8fhKiVvDoHMH6qHY6DpVDPnQ9HNhpjUwaaBceV1NLqYFWm
 w6FZ2WjLtyYyfAiiHAkAN988ic+JcMinqXtSWGSgrSvEF9Zl3H7knFfAzUf/dfLjeeHa
 v28+R78Qj6kKidOku6p6sqb33DzdA2jt8dKyS+PphDAW41r/QPJ+0EQNqs8t5UzuGAij
 VGvQ==
X-Gm-Message-State: AOAM530K01dT05k2JpwySdMfZP5v72LoM/W10SQxSCa3kmz8RFLk/6/5
 99Yz2SIh1Cf4UGXLdk361v0D4XO+nB37ZwSSpWdPqLWdLrsq711WzHde29rCFxNFPtNKmpgdHgK
 CDR4BnFCnnIMPRJkOxbVFUWW8WS62
X-Received: by 2002:a05:6000:1566:b0:204:20d9:a5b0 with SMTP id
 6-20020a056000156600b0020420d9a5b0mr31136650wrz.207.1649780873951; 
 Tue, 12 Apr 2022 09:27:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZk0MWTuuvHqtVROhBDnTpdj23O58Hyyzt/iYLuFJGH3Qm6i0aohCcnZ+MQb5YSi1vkdpJ4w==
X-Received: by 2002:a05:6000:1566:b0:204:20d9:a5b0 with SMTP id
 6-20020a056000156600b0020420d9a5b0mr31136615wrz.207.1649780873653; 
 Tue, 12 Apr 2022 09:27:53 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a5d4888000000b00207a49fa6a1sm7700358wrq.81.2022.04.12.09.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 09:27:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] drm/solomon: Add SSD130x OLED displays SPI support
Date: Tue, 12 Apr 2022 18:27:29 +0200
Message-Id: <20220412162729.184783-6-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412162729.184783-1-javierm@redhat.com>
References: <20220412162729.184783-1-javierm@redhat.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ssd130x driver only provides the core support for these devices but it
does not have any bus transport logic. Add a driver to interface over SPI.

There is a difference in the communication protocol when using 4-wire SPI
instead of I2C. For the latter, a control byte that contains a D/C# field
has to be sent. This field tells the controller whether the data has to be
written to the command register or to the graphics display data memory.

But for 4-wire SPI that control byte is not used, instead a real D/C# line
must be pulled HIGH for commands data and LOW for graphics display data.

For this reason the standard SPI regmap can't be used and a custom .write
bus handler is needed.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
---

Changes in v3:
- Drop ssd130x_spi_get_dc() helper and open code it (Geert Uytterhoeven)
- Export variants array and use &info[ID] in device table (Andy Shevchenko)

Changes in v2:
- Add the same compatible strings than I2C (Geert Uytterhoeven)

 drivers/gpu/drm/solomon/Kconfig       |   9 ++
 drivers/gpu/drm/solomon/Makefile      |   1 +
 drivers/gpu/drm/solomon/ssd130x-spi.c | 177 ++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-spi.c

diff --git a/drivers/gpu/drm/solomon/Kconfig b/drivers/gpu/drm/solomon/Kconfig
index 8c0a0c788385..e170716d976b 100644
--- a/drivers/gpu/drm/solomon/Kconfig
+++ b/drivers/gpu/drm/solomon/Kconfig
@@ -20,3 +20,12 @@ config DRM_SSD130X_I2C
 	  I2C bus.
 
 	  If M is selected the module will be called ssd130x-i2c.
+
+config DRM_SSD130X_SPI
+	tristate "DRM support for Solomon SSD130X OLED displays (SPI bus)"
+	depends on DRM_SSD130X && SPI
+	select REGMAP
+	help
+	  Say Y here if the SSD130x OLED display is connected via SPI bus.
+
+	  If M is selected the module will be called ssd130x-spi.
diff --git a/drivers/gpu/drm/solomon/Makefile b/drivers/gpu/drm/solomon/Makefile
index 4bfc5acb0447..b5fc792257d7 100644
--- a/drivers/gpu/drm/solomon/Makefile
+++ b/drivers/gpu/drm/solomon/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_DRM_SSD130X)	+= ssd130x.o
 obj-$(CONFIG_DRM_SSD130X_I2C)	+= ssd130x-i2c.o
+obj-$(CONFIG_DRM_SSD130X_SPI)	+= ssd130x-spi.o
diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
new file mode 100644
index 000000000000..4fda420ae0a6
--- /dev/null
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for Solomon SSD130X OLED displays (SPI bus)
+ *
+ * Copyright 2022 Red Hat Inc.
+ * Authors: Javier Martinez Canillas <javierm@redhat.com>
+ */
+#include <linux/spi/spi.h>
+#include <linux/module.h>
+
+#include "ssd130x.h"
+
+#define DRIVER_NAME	"ssd130x-spi"
+#define DRIVER_DESC	"DRM driver for Solomon SSD130X OLED displays (SPI)"
+
+struct ssd130x_spi_transport {
+	struct spi_device *spi;
+	struct gpio_desc *dc;
+};
+
+static const struct regmap_config ssd130x_spi_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+/*
+ * The regmap bus .write handler, it is just a wrapper around spi_write()
+ * but toggling the Data/Command control pin (D/C#). Since for 4-wire SPI
+ * a D/C# pin is used, in contrast with I2C where a control byte is sent,
+ * prior to every data byte, that contains a bit with the D/C# value.
+ *
+ * These control bytes are considered registers by the ssd130x core driver
+ * and can be used by the ssd130x SPI driver to determine if the data sent
+ * is for a command register or for the Graphic Display Data RAM (GDDRAM).
+ */
+static int ssd130x_spi_write(void *context, const void *data, size_t count)
+{
+	struct ssd130x_spi_transport *t = context;
+	struct spi_device *spi = t->spi;
+	const u8 *reg = data;
+
+	if (*reg == SSD130X_COMMAND)
+		gpiod_set_value_cansleep(t->dc, 0);
+
+	if (*reg == SSD130X_DATA)
+		gpiod_set_value_cansleep(t->dc, 1);
+
+	/* Remove the control byte since is not used by the 4-wire SPI */
+	return spi_write(spi, ((u8 *)data) + 1, count - 1);
+}
+
+/* The ssd130x driver does not read registers but regmap expects a .read */
+static int ssd130x_spi_read(void *context, const void *reg, size_t reg_size,
+			    void *val, size_t val_size)
+{
+	return -EOPNOTSUPP;
+}
+
+/*
+ * A custom bus is needed due the special write that toggles a D/C# pin,
+ * another option could be to just have a .reg_write() callback but that
+ * will prevent to do data writes in bulk.
+ *
+ * Once the regmap API is extended to support defining a bulk write handler
+ * in the struct regmap_config, this can be simplified and the bus dropped.
+ */
+static struct regmap_bus regmap_ssd130x_spi_bus = {
+	.write = ssd130x_spi_write,
+	.read = ssd130x_spi_read,
+};
+
+static int ssd130x_spi_probe(struct spi_device *spi)
+{
+	struct ssd130x_spi_transport *t;
+	struct ssd130x_device *ssd130x;
+	struct regmap *regmap;
+	struct gpio_desc *dc;
+	struct device *dev = &spi->dev;
+
+	dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(dc))
+		return dev_err_probe(dev, PTR_ERR(dc),
+				     "Failed to get dc gpio\n");
+
+	t = devm_kzalloc(dev, sizeof(*t), GFP_KERNEL);
+	if (!t)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed to allocate SPI transport data\n");
+
+	t->spi = spi;
+	t->dc = dc;
+
+	regmap = devm_regmap_init(dev, &regmap_ssd130x_spi_bus, t,
+				  &ssd130x_spi_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ssd130x = ssd130x_probe(dev, regmap);
+	if (IS_ERR(ssd130x))
+		return PTR_ERR(ssd130x);
+
+	spi_set_drvdata(spi, ssd130x);
+
+	return 0;
+}
+
+static void ssd130x_spi_remove(struct spi_device *spi)
+{
+	struct ssd130x_device *ssd130x = spi_get_drvdata(spi);
+
+	ssd130x_remove(ssd130x);
+}
+
+static void ssd130x_spi_shutdown(struct spi_device *spi)
+{
+	struct ssd130x_device *ssd130x = spi_get_drvdata(spi);
+
+	ssd130x_shutdown(ssd130x);
+}
+
+static const struct of_device_id ssd130x_of_match[] = {
+	{
+		.compatible = "sinowealth,sh1106",
+		.data = &ssd130x_variants[SH1106_ID],
+	},
+	{
+		.compatible = "solomon,ssd1305",
+		.data = &ssd130x_variants[SSD1305_ID],
+	},
+	{
+		.compatible = "solomon,ssd1306",
+		.data = &ssd130x_variants[SSD1306_ID],
+	},
+	{
+		.compatible = "solomon,ssd1307",
+		.data = &ssd130x_variants[SSD1307_ID],
+	},
+	{
+		.compatible = "solomon,ssd1309",
+		.data = &ssd130x_variants[SSD1309_ID],
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ssd130x_of_match);
+
+/*
+ * The SPI core always reports a MODALIAS uevent of the form "spi:<dev>", even
+ * if the device was registered via OF. This means that the module will not be
+ * auto loaded, unless it contains an alias that matches the MODALIAS reported.
+ *
+ * To workaround this issue, add a SPI device ID table. Even when this should
+ * not be needed for this driver to match the registered SPI devices.
+ */
+static const struct spi_device_id ssd130x_spi_table[] = {
+	{ "sh1106",  SH1106_ID },
+	{ "ssd1305", SSD1305_ID },
+	{ "ssd1306", SSD1306_ID },
+	{ "ssd1307", SSD1307_ID },
+	{ "ssd1309", SSD1309_ID },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
+
+static struct spi_driver ssd130x_spi_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = ssd130x_of_match,
+	},
+	.probe = ssd130x_spi_probe,
+	.remove = ssd130x_spi_remove,
+	.shutdown = ssd130x_spi_shutdown,
+};
+module_spi_driver(ssd130x_spi_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
+MODULE_LICENSE("GPL");
-- 
2.35.1

