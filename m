Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E558F90DD5B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00F510E7B7;
	Tue, 18 Jun 2024 20:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X9SxgqIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B4E10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:28 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-57d046f4afdso268526a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719227; x=1719324027; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lVpSUbQ0RxUxTD6Qqs+KFz8X9qCBPybUa3iBtTp8xZM=;
 b=X9SxgqIozdercT6iUw6kyr6tk6F6O0WgdOReL7lH4hkVDDBU0DJQSk66a4ZBLWvUPE
 4qCGlPrTN2L21tetIUX/6ahwQ2IlX1Yt4kaIDAUJAusKyKuON+MU+dtRfr15lQl2m9SA
 noYI5R19jRew48e79pkFLgsdgYkMUYILZleoTcQLEcjBTObbcJYZ9jrWa0uggDUiilnk
 sMs4hZMKjqM8WrNi7oWMt+nzCoT83wltfubcdOlObmeLaOgpta2UBun0tF5/xx/ECYbf
 kLe7jtO2Fvw0sSn6w9megFssWQGuEMG9tKQoz8Zn0eKXJoGGX216GWV492hJkm0SH+JD
 w23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719227; x=1719324027;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lVpSUbQ0RxUxTD6Qqs+KFz8X9qCBPybUa3iBtTp8xZM=;
 b=t8YhGLK4hSVm+i2lWXLRDcFvMXozJMRfSh5WbrpESU+lQoKoTIwofhhUGKwCPv9Jbk
 vihAyCfECbBJ/72ti4YAlkMwFnlNB8JKgeGagsAO3dHkqwJxBtYSDfd8HRMe8+rdhgN4
 vwHVZ0DE6qnHAFCSxB/3JtsDUUTEWLGulonEVvTQWotLAhh8Fm8eQKD2f6tUFRpcG8b8
 Dgkty2vabGMowiBNWOqETY7zkWwdWpbYxjyijn/Lnlew4SZWv5cy15FWYJiSGg6KJUbD
 HmePE7igEA+vFiABZWauBvnV/xpCkEdnLi3GpCo8Mo0e3rrFu4ipIpQF2BJf9b9IS+3n
 k6Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWadNv2zT2DJMV5DWEPUvmJ2q5ueJft94xavvjtzBgUqq8hma1Ub4cIYj3X0/3M1ErFcMSlOUhHH49CYFWC0xnMFxfwu2+Sn1AMMyhzN5Tr
X-Gm-Message-State: AOJu0YzPf0KsoDVVWnbBZNgz8c+zGG1UdPKimpEcLoMQbcuhWUy9IAq1
 GT1thLJ9lVZ3w8tD7xFfSZGqXb9IMDynigpbThJP0ROhFNDEgSKALafMag==
X-Google-Smtp-Source: AGHT+IHe/0ra3yC6deGQmpMua4UTqdcMRRszmsFv8+QoEjoDXgFjZqQesDDjmgynaNQbxBP6akhjMw==
X-Received: by 2002:aa7:ce04:0:b0:57d:3cf:899d with SMTP id
 4fb4d7f45d1cf-57d03cf8aa2mr974692a12.22.1718719226445; 
 Tue, 18 Jun 2024 07:00:26 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:26 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:51 +0300
Subject: [PATCH v3 17/23] mfd: add s2dos series core driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-17-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719185; l=10509;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=IHZAr5+Cdn0wmqhOZ2PeM9l2Gdz/tWq1OFfADxf5XIQ=;
 b=l66fMD8sHB8UJYTpLpJ1ay3lJvzfpqGlDq6nPosqrMEDYoFHMPD/dy7mDaSAk2An0pOO6QxUi
 qEyrqTzd98iCKNsZDfsTPkuE8JTVRSRulb9nsxxFrfA4H6vj652yV10
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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

S2DOS05 is a panel/touchscreen PMIC, often found in
Samsung phones. We define 2 sub-devices for which drivers will
be added in subsequent patches.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 MAINTAINERS                            |   1 +
 drivers/mfd/Kconfig                    |  13 +++
 drivers/mfd/Makefile                   |   2 +-
 drivers/mfd/s2dos-core.c               | 141 +++++++++++++++++++++++++++++++++
 include/linux/mfd/samsung/s2dos-core.h |  21 +++++
 include/linux/mfd/samsung/s2dos05.h    | 115 +++++++++++++++++++++++++++
 6 files changed, 292 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3c245d432d9..b53462684a30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19908,6 +19908,7 @@ F:	Documentation/devicetree/bindings/regulator/samsung,s2dos*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
+F:	drivers/mfd/s2dos*.c
 F:	drivers/mfd/sec*.c
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index c4eb8ff2dcad..517d8778d7a8 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1278,6 +1278,19 @@ config MFD_RN5T618
 	  additional drivers must be enabled in order to use the
 	  functionality of the device.
 
+config MFD_S2DOS_CORE
+	tristate "Samsung Electronics PMIC Series Support"
+	depends on I2C=y
+	depends on OF
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  Support for the Samsung Electronics PMIC devices
+	  usually used to power displays.
+	  This driver provides common support for accessing the device,
+	  additional drivers must be enabled in order to use the functionality
+	  of the device.
+
 config MFD_SEC_CORE
 	tristate "Samsung Electronics PMIC Series Support"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index bf65cc36d59c..37c51aab0205 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -228,7 +228,7 @@ obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
 obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
 obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
-obj-$(CONFIG_MFD_S2DOS05)	+= s2dos05.o
+obj-$(CONFIG_MFD_S2DOS_CORE)	+= s2dos-core.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
 obj-$(CONFIG_MFD_LM3533)	+= lm3533-core.o lm3533-ctrlbank.o
 obj-$(CONFIG_MFD_VEXPRESS_SYSREG)	+= vexpress-sysreg.o
diff --git a/drivers/mfd/s2dos-core.c b/drivers/mfd/s2dos-core.c
new file mode 100644
index 000000000000..a04363b15a2a
--- /dev/null
+++ b/drivers/mfd/s2dos-core.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * s2dos05.c - mfd core driver for the s2dos05 chip
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/i2c.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/samsung/s2dos-core.h>
+#include <linux/mfd/samsung/s2dos05.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/debugfs.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+
+static struct dentry *debugfs_file;
+
+static int s2dos05_debugfs_show(struct seq_file *s, void *data)
+{
+	struct s2dos_core *s2dos05 = s->private;
+	struct regmap *regmap = s2dos05->regmap;
+	unsigned int i, reg, reg_data, pmic_id;
+	int regs[] = {
+		S2DOS05_REG_DEV_ID,
+		S2DOS05_REG_TOPSYS_STAT,
+		S2DOS05_REG_STAT,
+		S2DOS05_REG_EN,
+		S2DOS05_REG_LDO1_CFG,
+		S2DOS05_REG_LDO2_CFG,
+		S2DOS05_REG_LDO3_CFG,
+		S2DOS05_REG_LDO4_CFG,
+		S2DOS05_REG_BUCK_CFG,
+		S2DOS05_REG_BUCK_VOUT,
+		S2DOS05_REG_IRQ_MASK,
+		S2DOS05_REG_SSD_TSD,
+		S2DOS05_REG_OCL,
+		S2DOS05_REG_IRQ
+	};
+	regmap_read(regmap, S2DOS05_REG_DEV_ID, &pmic_id);
+	seq_printf(s, "S2DOS05, id: %d\n", pmic_id);
+	seq_puts(s, "===================\n");
+	for (i = 0; i < ARRAY_SIZE(regs); i++) {
+		reg = regs[i];
+		regmap_read(regmap, reg, &reg_data);
+		seq_printf(s, "0x%02x:\t0x%02x\n", reg, reg_data);
+	}
+
+	seq_puts(s, "\n");
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(s2dos05_debugfs);
+
+static const struct regmap_config s2dos05_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = S2DOS05_REG_IRQ,
+};
+
+static struct mfd_cell s2dos05_devs[] = {
+	{ .name = "s2dos05-fg" },
+	{
+		.name = "s2dos05-regulator",
+		.of_compatible = "samsung,s2dos05-regulator",
+	},
+};
+
+
+static int s2dos05_i2c_probe(struct i2c_client *i2c)
+{
+	struct s2dos_core *s2dos05;
+	struct regmap *regmap;
+	struct device *dev = &i2c->dev;
+
+	unsigned int reg_data;
+	int ret = 0;
+
+	s2dos05 = kzalloc(sizeof(struct s2dos_core), GFP_KERNEL);
+	if (!s2dos05)
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_i2c(i2c, &s2dos05_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "Unable to initialise I2C Regmap\n");
+		return PTR_ERR(regmap);
+	}
+	s2dos05->regmap = regmap;
+
+	if (regmap_read(regmap, S2DOS05_REG_DEV_ID, &reg_data) < 0) {
+		dev_err(dev,
+			"device not found on this channel (this is not an error)\n");
+		ret = -ENODEV;
+	} else {
+		dev_info(dev, "%s device found with id: .0x%x\n",
+				__func__, reg_data);
+	}
+
+	i2c_set_clientdata(i2c, s2dos05);
+
+	debugfs_file = debugfs_create_file("s2dos05-regs",
+				0664, NULL, (void *)s2dos05,
+				  &s2dos05_debugfs_fops);
+	if (!debugfs_file)
+		dev_err(dev, "Failed to create debugfs file\n");
+
+	return mfd_add_devices(dev, -1, s2dos05_devs,
+			ARRAY_SIZE(s2dos05_devs), NULL, 0, NULL);
+}
+
+static const struct of_device_id s2dos05_i2c_dt_ids[] = {
+	{ .compatible = "samsung,s2dos05-pmic" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, s2dos05_i2c_dt_ids);
+
+static struct i2c_driver s2dos05_i2c_driver = {
+	.driver		= {
+		.name	= "s2dos-core",
+		.owner	= THIS_MODULE,
+		.of_match_table	= s2dos05_i2c_dt_ids,
+	},
+	.probe		= s2dos05_i2c_probe,
+};
+
+module_i2c_driver(s2dos05_i2c_driver);
+
+MODULE_DESCRIPTION("s2dos core driver");
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/samsung/s2dos-core.h b/include/linux/mfd/samsung/s2dos-core.h
new file mode 100644
index 000000000000..7e84b387063c
--- /dev/null
+++ b/include/linux/mfd/samsung/s2dos-core.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * s2dos-core.h
+ *
+ * Copyright (c) 2016 Samsung Electronics Co., Ltd
+ *              http://www.samsung.com
+ * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
+ *
+ */
+
+#ifndef __LINUX_MFD_S2DOS_CORE_H
+#define __LINUX_MFD_S2DOS_CORE_H
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct s2dos_core {
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+#endif /*  __LINUX_MFD_S2DOS_CORE_H */
diff --git a/include/linux/mfd/samsung/s2dos05.h b/include/linux/mfd/samsung/s2dos05.h
new file mode 100644
index 000000000000..0317dbe56f10
--- /dev/null
+++ b/include/linux/mfd/samsung/s2dos05.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * s2dos05.h
+ *
+ * Copyright (c) 2016 Samsung Electronics Co., Ltd
+ *              http://www.samsung.com
+ *
+ */
+
+#ifndef __LINUX_MFD_S2DOS05_H
+#define __LINUX_MFD_S2DOS05_H
+
+/* S2DOS05 registers */
+/* Slave Addr : 0xC0 */
+enum s2dos05_reg {
+	S2DOS05_REG_DEV_ID,
+	S2DOS05_REG_TOPSYS_STAT,
+	S2DOS05_REG_STAT,
+	S2DOS05_REG_EN,
+	S2DOS05_REG_LDO1_CFG,
+	S2DOS05_REG_LDO2_CFG,
+	S2DOS05_REG_LDO3_CFG,
+	S2DOS05_REG_LDO4_CFG,
+	S2DOS05_REG_BUCK_CFG,
+	S2DOS05_REG_BUCK_VOUT,
+	S2DOS05_REG_IRQ_MASK = 0x0D,
+	S2DOS05_REG_SSD_TSD = 0x0E,
+	S2DOS05_REG_OCL = 0x10,
+	S2DOS05_REG_IRQ = 0x11
+};
+
+/* S2DOS05 regulator ids */
+enum s2dos05_regulators {
+	S2DOS05_LDO1,
+	S2DOS05_LDO2,
+	S2DOS05_LDO3,
+	S2DOS05_LDO4,
+	S2DOS05_BUCK1,
+	S2DOS05_REG_MAX,
+};
+
+#define S2DOS05_IRQ_PWRMT_MASK	BIT(5)
+#define S2DOS05_IRQ_TSD_MASK	BIT(4)
+#define S2DOS05_IRQ_SSD_MASK	BIT(3)
+#define S2DOS05_IRQ_SCP_MASK	BIT(2)
+#define S2DOS05_IRQ_UVLO_MASK	BIT(1)
+#define S2DOS05_IRQ_OCD_MASK	BIT(0)
+
+#define S2DOS05_BUCK_MIN1	506250
+#define S2DOS05_LDO_MIN1	1500000
+#define S2DOS05_LDO_MIN2	2700000
+#define S2DOS05_BUCK_STEP1	6250
+#define S2DOS05_LDO_STEP1	25000
+#define S2DOS05_LDO_VSEL_MASK	0x7F
+#define S2DOS05_LDO_FD_MASK	BIT(7)
+#define S2DOS05_BUCK_VSEL_MASK	0xFF
+#define S2DOS05_BUCK_FD_MASK	BIT(3)
+
+#define S2DOS05_ENABLE_MASK_L1	BIT(0)
+#define S2DOS05_ENABLE_MASK_L2	BIT(1)
+#define S2DOS05_ENABLE_MASK_L3	BIT(2)
+#define S2DOS05_ENABLE_MASK_L4	BIT(3)
+#define S2DOS05_ENABLE_MASK_B1	BIT(4)
+
+#define S2DOS05_RAMP_DELAY	12000
+
+#define S2DOS05_ENABLE_TIME_LDO		50
+#define S2DOS05_ENABLE_TIME_BUCK	350
+
+#define S2DOS05_ENABLE_SHIFT	0x06
+#define S2DOS05_LDO_N_VOLTAGES	(S2DOS05_LDO_VSEL_MASK + 1)
+#define S2DOS05_BUCK_N_VOLTAGES (S2DOS05_BUCK_VSEL_MASK + 1)
+
+#define S2DOS05_PMIC_EN_SHIFT	6
+#define S2DOS05_REGULATOR_MAX (S2DOS05_REG_MAX)
+
+/* ----------power meter ----------*/
+#define S2DOS05_REG_PWRMT_CTRL1		0x0A
+#define S2DOS05_REG_PWRMT_CTRL2		0x0B
+#define S2DOS05_REG_PWRMT_DATA	0x0C
+#define S2DOS05_REG_IRQ_MASK	0x0D
+
+#define CHANNEL_ELVDD	0
+#define CHANNEL_ELVSS	1
+#define CHANNEL_AVDD	2
+#define CHANNEL_BUCK	3
+#define CHANNEL_L1	4
+#define CHANNEL_L2	5
+#define CHANNEL_L3	6
+#define CHANNEL_L4	7
+
+#define POWER_ELVDD			24500
+#define POWER_ELVSS			24500
+#define POWER_AVDD			3060
+#define POWER_BUCK			1525
+#define POWER_L1			5000
+#define POWER_L2			5000
+#define POWER_L3			5000
+#define POWER_L4			5000
+
+/* S2DOS05_REG_OCL */
+#define ADC_VALID_MASK			BIT(7)
+/* S2DOS05_REG_PWRMT_CTRL1 */
+#define ADC_ASYNCRD_MASK		BIT(7)
+#define PWRMT_EN_CHK			BIT(6)
+#define SMPNUM_MASK			0x0F
+/* S2DOS05_REG_PWRMT_CTRL2 */
+#define ADC_EN_MASK			BIT(7)
+#define ADC_PTR_MASK			0x0F
+#define POWER_MODE			BIT(4)
+#define RAWCURRENT_MODE			BIT(5)
+
+#define S2DOS05_MAX_ADC_CHANNEL		8
+
+#endif /*  __LINUX_MFD_S2DOS05_H */

-- 
2.39.2

