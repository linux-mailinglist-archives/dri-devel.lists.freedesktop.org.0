Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0D49ECB5C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 12:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0345B10E216;
	Wed, 11 Dec 2024 11:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m1QA+Pai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94B110E1C3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 11:35:40 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-21670dce0a7so22199695ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733916940; x=1734521740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jkHtq9idtKzQ6fNQxVQI03Qs+Bo7JPqfFg778nP11bo=;
 b=m1QA+Paivgtd4lIS1rVLTdAsP4a29ZolztchHnba7/W4lep4jxQp1ftBh4p49ZeU0+
 JSqKbUgaLPZvMZXTamlzlNrfdsIEXHCPHn6fZcCtmhVmmw7d8r/Z5yyiX+WMP5FDiGIC
 omKXaH9F+vguVw5mUyBQcDQDR1F6+MCEfNI7dRxIo79UjKz7bHIjQCn0EwVrfhIuA9T4
 3huY7OydKXhlndFuKolVIX9AbDX8SIY2oXapRcxEMgOf/PZJsF6I177wrzy/ypMc/PLF
 qnrsHmMGDJjXHryb1Sts3G311PNotB5WD9QmO4Biw+SGoi/GWOgjGXqetqfQLKgm2J74
 IfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733916940; x=1734521740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jkHtq9idtKzQ6fNQxVQI03Qs+Bo7JPqfFg778nP11bo=;
 b=g/ovVspw5n55YAs5rif2qBvQs4pwUErqhSNezaMqJkCfwkc2WInd/wV1nd5AQC8ZVS
 vmc68NCmVGMDXmsZekhtqXHsTnjSwCmExtKm/iHmbcpjIi7Xhn/xup/29wWUgQ+kw7rN
 5niQyAxy0p4pu8Y80R0RhFoxA1+8kRQ/6kMuKUpwS6NpYihDYzBp5RTYgihyRNUD2kce
 qjX/b4/WdrasP2QwHnFjjVpgaU0OAXUisVDFUAv07d3W2jsuyGObdEey9zl1+DSrG31L
 AJ5fm21LqT+4uqowPgeGNZDqlnZHiQiHiAPb9NUGwzQO+Io+lmVNonmR2L19GdUjUc7b
 he6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1quABVv7ig5GPMrAjD4WJtzgvJBxIteievtuXPdBYCPZAlYWrzp35yEqAzQcoCd6v9yTCsN1yWns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpPnj56jgBUIwU/lS51k7l7vXmXo3YyGNPYV+O6fl4aCm++arr
 yO0kSA20Da1LZOgz8TAYhF6Y1JX9Z1SKKp9tJ/c9DZzqsEdn2Kj8
X-Gm-Gg: ASbGncuE9r9PopWahd6CQZT4oNroZC8G7oj+PVT54hhXE/qzc2fY+f9Jk+Elsp7naJn
 53QIvmKvDGYByHIcX1SyTlgXHwG0dIinRhH3/hYyNgM7+nDdHLRmNtb817MqG9vakfUTkv9qiv0
 uu2VUIKm/GaIE87J+zRiyGaJisNi1cHaG4i/WVqb0ZQMi0gX4+CNIFauxBD3DMi2GgQMMnfJBoT
 TBAcxBtdFavyjM3ntbCZ2iWeDwD8fiYVLo/g1WCehQ8ZGPeZQesLlqXsBlPBNCQtyGmZQ==
X-Google-Smtp-Source: AGHT+IEvwlSiJ/A/e/bX+VxNlELH+lImFhyckJUBzQs/9yPJZMVZ9VQiinmNaf4t+2eVGwvQVdZbIA==
X-Received: by 2002:a17:902:f646:b0:212:615f:c1 with SMTP id
 d9443c01a7336-21778534ccamr43159815ad.14.1733916940321; 
 Wed, 11 Dec 2024 03:35:40 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 03:35:39 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nick Chan <towinchenmi@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Date: Wed, 11 Dec 2024 19:34:38 +0800
Message-ID: <20241211113512.19009-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add driver for backlight controllers attached via Apple DWI 2-wire
interface, which is found on some Apple iPhones, iPads and iPod touches
with a LCD display.

Although there is an existing apple_bl driver, it is for backlight
controllers on Intel Macs attached via PCI, which is completely different
from the Samsung-derived DWI block.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/Kconfig  |  12 +++
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 drivers/video/backlight/dwi_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..debb1326df63 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -290,6 +290,18 @@ config BACKLIGHT_APPLE
 	  If you have an Intel-based Apple say Y to enable a driver for its
 	  backlight.
 
+config BACKLIGHT_APPLE_DWI
+	tristate "Apple DWI 2-Wire Interface Backlight Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default y
+	help
+	  Say Y to enable the backlight driver for backlight controllers
+	  attached via the Apple DWI 2-wire interface which is found in some
+	  Apple iPhones, iPads and iPod touches.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dwi_bl.
+
 config BACKLIGHT_QCOM_WLED
 	tristate "Qualcomm PMIC WLED Driver"
 	select REGMAP
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..45cc80d9ae22 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_BACKLIGHT_ADP5520)		+= adp5520_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8860)		+= adp8860_bl.o
 obj-$(CONFIG_BACKLIGHT_ADP8870)		+= adp8870_bl.o
 obj-$(CONFIG_BACKLIGHT_APPLE)		+= apple_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
 obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
new file mode 100644
index 000000000000..59e5cad0fbd8
--- /dev/null
+++ b/drivers/video/backlight/dwi_bl.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Driver for backlight controllers attached via Apple DWI 2-wire interface
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define DWI_BL_CTL			0x0
+#define DWI_BL_CTL_SEND1		BIT(0)
+#define DWI_BL_CTL_SEND2		BIT(4)
+#define DWI_BL_CTL_SEND3		BIT(5)
+#define DWI_BL_CTL_LE_DATA		BIT(6)
+/* Only used on Apple A9 and later */
+#define DWI_BL_CTL_SEND4		BIT(12)
+
+#define DWI_BL_CMD			0x4
+#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
+#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
+#define DWI_BL_CMD_DATA			GENMASK(10, 0)
+
+#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
+					 DWI_BL_CTL_SEND2 | \
+					 DWI_BL_CTL_SEND3 | \
+					 DWI_BL_CTL_LE_DATA | \
+					 DWI_BL_CTL_SEND4)
+
+#define DWI_BL_MAX_BRIGHTNESS		2047
+
+struct apple_dwi_bl {
+	void __iomem *base;
+};
+
+static int dwi_bl_update_status(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	int brightness = backlight_get_brightness(bl);
+
+	u32 cmd = 0;
+
+	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
+	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
+
+	writel(cmd, dwi_bl->base + DWI_BL_CMD);
+	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
+
+	return 0;
+}
+
+static int dwi_bl_get_brightness(struct backlight_device *bl)
+{
+	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
+
+	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
+
+	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
+}
+
+static const struct backlight_ops dwi_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.get_brightness = dwi_bl_get_brightness,
+	.update_status	= dwi_bl_update_status
+};
+
+static int dwi_bl_probe(struct platform_device *dev)
+{
+	struct apple_dwi_bl *dwi_bl;
+	struct backlight_device *bl;
+	struct backlight_properties props;
+	struct resource *res;
+
+	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
+	if (!dwi_bl)
+		return -ENOMEM;
+
+	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
+	if (IS_ERR(dwi_bl->base))
+		return PTR_ERR(dwi_bl->base);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
+
+	bl = devm_backlight_device_register(&dev->dev, dev->name, &dev->dev,
+					dwi_bl, &dwi_bl_ops, &props);
+	if (IS_ERR(bl))
+		return PTR_ERR(bl);
+
+	platform_set_drvdata(dev, dwi_bl);
+
+	bl->props.brightness = dwi_bl_get_brightness(bl);
+
+	return 0;
+}
+
+static const struct of_device_id dwi_bl_of_match[] = {
+	{ .compatible = "apple,dwi-bl" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, dwi_bl_of_match);
+
+static struct platform_driver dwi_bl_driver = {
+	.driver		= {
+		.name	= "dwi-bl",
+		.of_match_table = dwi_bl_of_match
+	},
+	.probe		= dwi_bl_probe,
+};
+
+module_platform_driver(dwi_bl_driver);
+
+MODULE_DESCRIPTION("Apple DWI Backlight Driver");
+MODULE_AUTHOR("Nick Chan <towinchenmi@gmail.com>");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.47.1

