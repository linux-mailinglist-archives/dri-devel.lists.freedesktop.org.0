Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D648E9E8CC4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 08:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F98D10E2BB;
	Mon,  9 Dec 2024 07:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G+/WXIg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9812310E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 07:59:38 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-216585cbe1eso4056615ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 23:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733731178; x=1734335978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vQREW8pkvf9d8FBI+//lDw3xZKcfVT8Bj/1BVrjl3sc=;
 b=G+/WXIg6I1k3tclf5Dtw2rwZP4zczXhnH30hpABHYMv2VkeoBNoYTDwW//N55RJ/fR
 WuuO4KS8VZCIh9qTOcfzM6lqySYfVfFkWuQxjEeEHNqce5bzQJ5Sqlug1nNfhTzaf5Jj
 XRymxNvwvLgk1chcZqVtSiKw7HGD5tnCSPDwOBnLgwoxT6og/G1bv2PF8UDv66DvugXQ
 JzlH1w3g9iSkgIhsjoNc1jpNi0ck13Cw6/nynFUeecBlbIiWkCJc8d+VFgYXubpr15Mr
 NM9rjEOM9RCINIM7/sLBniYm837nCQzg+3pixE82t8w1QSthw5mnICN6F9i05xXaUZYq
 Yh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733731178; x=1734335978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQREW8pkvf9d8FBI+//lDw3xZKcfVT8Bj/1BVrjl3sc=;
 b=uCRR4fC2EkE/kv43uq429HnMOFXY0TcWToD8m7rpyAqSzLxt/H8RlryR8QTUh9lpZO
 gbPBNdkFusuMSV/tBi7/J4HWLl5TSk76IxyDpnnxJv33a6SM4qsenjT7WprzUhyusbB7
 b3a7wsuoeWRNapJZ/kEmPS3a4EHLnyXhl/TlqbIvm43Z++KGgCCA44DL5SUozo4oaxiW
 AAWvncweJc9M+JUBQzzBLgYinn2IYMWSwJ449P5gzJltuGv3zS9bXljbAXP+rJ7Rf9nQ
 yvZEa0OK4pClYUknSeECRxL7o0RLEU28JWOPe8BSbKRXYeh00HGwlo+TFPt4Ft+Nc8Ww
 OmHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+93hwLUe5s4TqbBL2D8XUxqSAoPuo/dwYyh1qxJmEsJfg+G1ahyWZDuGPeNgovLsuwbdZs+EglU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLjOf6YwM2EoBTPfmxJUe+BKY+o9gHnRrnhA4asP8aTyW9G+n1
 fdv7LaVCZtH3NNH8r4YxpdyVto3QrtRqFcc+scO2VH3ZbWXWwOkA
X-Gm-Gg: ASbGncsKSNOfyf/i+EZDxHKWqYabAjFfr2soj41GHylhA46/UcE5KWf8b52RYgHn/+u
 vIMuCxA1QOcr8il+4RRolH48A03zAXuyjJgZjMbYVIAxFztLr+ODUanuUKjC+XdmlUEYfz2wGmm
 RWxuFTizeHyQvlz1V6g1LwcLz3e+OUvmVs21JRPBUN+Vlolmc/KsFASxNJt4tg4b1dKBt1TF0tu
 +3ZPqePo2jMpy3D01lXrYyXFgnVPpAe/7l4aV/YnMZdxfQ4Yq2TfUeAGRwpPZD1JQ==
X-Google-Smtp-Source: AGHT+IEJ6aeTSfdHSwUg/1x4m3Ob8o0V0LmoiLC6iCHD0eKmgDPprihMoSkpmUMGcXKVy/JGiuvYmQ==
X-Received: by 2002:a17:902:ec87:b0:215:8dd3:536a with SMTP id
 d9443c01a7336-21614d2efdcmr161736885ad.4.1733731177985; 
 Sun, 08 Dec 2024 23:59:37 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 23:59:37 -0800 (PST)
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
Subject: [PATCH v3 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Date: Mon,  9 Dec 2024 15:58:34 +0800
Message-ID: <20241209075908.140014-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
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

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/Kconfig  |  12 +++
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/dwi_bl.c | 126 +++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/video/backlight/dwi_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 3614a5d29c71..e64cc3d51ac5 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
 	  To compile this driver as a module, choose M here: the module will
 	  be called ep93xx_bl.
 
+config BACKLIGHT_APPLE_DWI
+	tristate "Apple DWI 2-Wire Interface Backlight Driver"
+	depends on ARCH_APPLE || COMPILE_TEST
+	default y
+	help
+          Say Y to enable the backlight driver for backlight controllers
+          attached via the Apple DWI 2-wire interface which is found in some
+          Apple iPhones, iPads and iPod touches.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dwi_bl.
+
 config BACKLIGHT_IPAQ_MICRO
 	tristate "iPAQ microcontroller backlight driver"
 	depends on MFD_IPAQ_MICRO
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 8fc98f760a8a..0a569d7f0210 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
 obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
 obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
 obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
+obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
 obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
 obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
 obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
new file mode 100644
index 000000000000..501c36bed8f3
--- /dev/null
+++ b/drivers/video/backlight/dwi_bl.c
@@ -0,0 +1,126 @@
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
+	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
+	if (!dwi_bl)
+		return -ENOMEM;
+
+	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENXIO;
+
+	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);
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

