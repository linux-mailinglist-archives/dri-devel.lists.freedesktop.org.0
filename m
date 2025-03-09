Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E77A587A1
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 20:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDD710E30D;
	Sun,  9 Mar 2025 19:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ip7x4GoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F04910E30D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=VDx/vx74AX9uSjm40zIYghmBbHkHjYVqQJXVjZJWJ4g=; b=ip7x4GoFixgQxX/v
 mxPPyVnlRN/Qfj0t94QY8sa3LMejz0vyePE1GHlX/u+Qa1S7oUNvkJ4ApKuV0DtTevnGJ41GHM6uC
 voQBdNpoV8/x4qeKPANtJ5IxNsOx+ukEWneNyKfdc0g1CyJ52LGZje6vMrhbhiPdrb3kSBp0ysIE2
 cYQanp7CHUPBsNl3LBAocK8d8uI98CtZ01gAKt/EUo4u+AgruyO9Pm7XyjbQi1w7aTBXyIYyzc3uM
 p9/WMXqGN0zeCyypP84Jp7aLxExopRMLR1B88r7UDkhpTG4+D8xNAXYvPe0ejDPQvisSRkTERcTzr
 0pWfrctQmtRYgNYc3A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1trMSB-003kFU-17;
 Sun, 09 Mar 2025 19:36:51 +0000
From: linux@treblig.org
To: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, sre@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linus.walleij@linaro.org, brgl@bgdev.pl, tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 6/9] regulator: pcf50633-regulator: Remove
Date: Sun,  9 Mar 2025 19:36:09 +0000
Message-ID: <20250309193612.251929-7-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309193612.251929-1-linux@treblig.org>
References: <20250309193612.251929-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The pcf50633 was used as part of the OpenMoko devices but
the support for its main chip was recently removed in:
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")

See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/mfd/pcf50633-core.c            |  35 +------
 drivers/regulator/Kconfig              |   7 --
 drivers/regulator/Makefile             |   1 -
 drivers/regulator/pcf50633-regulator.c | 124 -------------------------
 include/linux/mfd/pcf50633/core.h      |   1 -
 5 files changed, 1 insertion(+), 167 deletions(-)
 delete mode 100644 drivers/regulator/pcf50633-regulator.c

diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
index f12359f42140..be90ca30b75b 100644
--- a/drivers/mfd/pcf50633-core.c
+++ b/drivers/mfd/pcf50633-core.c
@@ -166,9 +166,8 @@ static const struct regmap_config pcf50633_regmap_config = {
 static int pcf50633_probe(struct i2c_client *client)
 {
 	struct pcf50633 *pcf;
-	struct platform_device *pdev;
 	struct pcf50633_platform_data *pdata = dev_get_platdata(&client->dev);
-	int i, j, ret;
+	int ret;
 	int version, variant;
 
 	if (!client->irq) {
@@ -210,26 +209,6 @@ static int pcf50633_probe(struct i2c_client *client)
 	pcf50633_client_dev_register(pcf, "pcf50633-mbc", &pcf->mbc_pdev);
 
 
-	for (i = 0; i < PCF50633_NUM_REGULATORS; i++) {
-		pdev = platform_device_alloc("pcf50633-regulator", i);
-		if (!pdev) {
-			ret = -ENOMEM;
-			goto err2;
-		}
-
-		pdev->dev.parent = pcf->dev;
-		ret = platform_device_add_data(pdev, &pdata->reg_init_data[i],
-					       sizeof(pdata->reg_init_data[i]));
-		if (ret)
-			goto err;
-
-		ret = platform_device_add(pdev);
-		if (ret)
-			goto err;
-
-		pcf->regulator_pdev[i] = pdev;
-	}
-
 	ret = sysfs_create_group(&client->dev.kobj, &pcf_attr_group);
 	if (ret)
 		dev_warn(pcf->dev, "error creating sysfs entries\n");
@@ -238,28 +217,16 @@ static int pcf50633_probe(struct i2c_client *client)
 		pdata->probe_done(pcf);
 
 	return 0;
-
-err:
-	platform_device_put(pdev);
-err2:
-	for (j = 0; j < i; j++)
-		platform_device_put(pcf->regulator_pdev[j]);
-
-	return ret;
 }
 
 static void pcf50633_remove(struct i2c_client *client)
 {
 	struct pcf50633 *pcf = i2c_get_clientdata(client);
-	int i;
 
 	sysfs_remove_group(&client->dev.kobj, &pcf_attr_group);
 	pcf50633_irq_free(pcf);
 
 	platform_device_unregister(pcf->mbc_pdev);
-
-	for (i = 0; i < PCF50633_NUM_REGULATORS; i++)
-		platform_device_unregister(pcf->regulator_pdev[i]);
 }
 
 static const struct i2c_device_id pcf50633_id_table[] = {
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 39297f7d8177..1236b3a1f93f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -988,13 +988,6 @@ config REGULATOR_PCAP
 	 This driver provides support for the voltage regulators of the
 	 PCAP2 PMIC.
 
-config REGULATOR_PCF50633
-	tristate "NXP PCF50633 regulator driver"
-	depends on MFD_PCF50633
-	help
-	 Say Y here to support the voltage regulators and converters
-	 on PCF50633
-
 config REGULATOR_PF8X00
 	tristate "NXP PF8100/PF8121A/PF8200 regulator driver"
 	depends on I2C && OF
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 3d5a803dce8a..8dca3567437f 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -132,7 +132,6 @@ obj-$(CONFIG_REGULATOR_PWM) += pwm-regulator.o
 obj-$(CONFIG_REGULATOR_TPS51632) += tps51632-regulator.o
 obj-$(CONFIG_REGULATOR_PBIAS) += pbias-regulator.o
 obj-$(CONFIG_REGULATOR_PCAP) += pcap-regulator.o
-obj-$(CONFIG_REGULATOR_PCF50633) += pcf50633-regulator.o
 obj-$(CONFIG_REGULATOR_RAA215300) += raa215300.o
 obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY)  += rpi-panel-attiny-regulator.o
 obj-$(CONFIG_REGULATOR_RC5T583)  += rc5t583-regulator.o
diff --git a/drivers/regulator/pcf50633-regulator.c b/drivers/regulator/pcf50633-regulator.c
deleted file mode 100644
index 9f08a62c800e..000000000000
--- a/drivers/regulator/pcf50633-regulator.c
+++ /dev/null
@@ -1,124 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 PMIC Driver
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * Author: Balaji Rao <balajirrao@openmoko.org>
- * All rights reserved.
- *
- * Broken down from monstrous PCF50633 driver mainly by
- * Harald Welte and Andy Green and Werner Almesberger
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/device.h>
-#include <linux/err.h>
-#include <linux/platform_device.h>
-
-#include <linux/mfd/pcf50633/core.h>
-#include <linux/mfd/pcf50633/pmic.h>
-
-#define PCF50633_REGULATOR(_name, _id, _min_uV, _uV_step, _min_sel, _n) \
-	{							\
-		.name = _name,					\
-		.id = PCF50633_REGULATOR_##_id,			\
-		.ops = &pcf50633_regulator_ops,			\
-		.n_voltages = _n,				\
-		.min_uV = _min_uV,				\
-		.uV_step = _uV_step,				\
-		.linear_min_sel = _min_sel,			\
-		.type = REGULATOR_VOLTAGE,			\
-		.owner = THIS_MODULE,				\
-		.vsel_reg = PCF50633_REG_##_id##OUT,		\
-		.vsel_mask = 0xff,				\
-		.enable_reg = PCF50633_REG_##_id##OUT + 1,	\
-		.enable_mask = PCF50633_REGULATOR_ON,		\
-	}
-
-static const struct regulator_ops pcf50633_regulator_ops = {
-	.set_voltage_sel = regulator_set_voltage_sel_regmap,
-	.get_voltage_sel = regulator_get_voltage_sel_regmap,
-	.list_voltage = regulator_list_voltage_linear,
-	.map_voltage = regulator_map_voltage_linear,
-	.enable = regulator_enable_regmap,
-	.disable = regulator_disable_regmap,
-	.is_enabled = regulator_is_enabled_regmap,
-};
-
-static const struct regulator_desc regulators[] = {
-	[PCF50633_REGULATOR_AUTO] =
-		PCF50633_REGULATOR("auto", AUTO, 1800000, 25000, 0x2f, 128),
-	[PCF50633_REGULATOR_DOWN1] =
-		PCF50633_REGULATOR("down1", DOWN1, 625000, 25000, 0, 96),
-	[PCF50633_REGULATOR_DOWN2] =
-		PCF50633_REGULATOR("down2", DOWN2, 625000, 25000, 0, 96),
-	[PCF50633_REGULATOR_LDO1] =
-		PCF50633_REGULATOR("ldo1", LDO1, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_LDO2] =
-		PCF50633_REGULATOR("ldo2", LDO2, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_LDO3] =
-		PCF50633_REGULATOR("ldo3", LDO3, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_LDO4] =
-		PCF50633_REGULATOR("ldo4", LDO4, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_LDO5] =
-		PCF50633_REGULATOR("ldo5", LDO5, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_LDO6] =
-		PCF50633_REGULATOR("ldo6", LDO6, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_HCLDO] =
-		PCF50633_REGULATOR("hcldo", HCLDO, 900000, 100000, 0, 28),
-	[PCF50633_REGULATOR_MEMLDO] =
-		PCF50633_REGULATOR("memldo", MEMLDO, 900000, 100000, 0, 28),
-};
-
-static int pcf50633_regulator_probe(struct platform_device *pdev)
-{
-	struct regulator_dev *rdev;
-	struct pcf50633 *pcf;
-	struct regulator_config config = { };
-
-	/* Already set by core driver */
-	pcf = dev_to_pcf50633(pdev->dev.parent);
-
-	config.dev = &pdev->dev;
-	config.init_data = dev_get_platdata(&pdev->dev);
-	config.driver_data = pcf;
-	config.regmap = pcf->regmap;
-
-	rdev = devm_regulator_register(&pdev->dev, &regulators[pdev->id],
-				       &config);
-	if (IS_ERR(rdev))
-		return PTR_ERR(rdev);
-
-	platform_set_drvdata(pdev, rdev);
-
-	if (pcf->pdata->regulator_registered)
-		pcf->pdata->regulator_registered(pcf, pdev->id);
-
-	return 0;
-}
-
-static struct platform_driver pcf50633_regulator_driver = {
-	.driver = {
-		.name = "pcf50633-regulator",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.probe = pcf50633_regulator_probe,
-};
-
-static int __init pcf50633_regulator_init(void)
-{
-	return platform_driver_register(&pcf50633_regulator_driver);
-}
-subsys_initcall(pcf50633_regulator_init);
-
-static void __exit pcf50633_regulator_exit(void)
-{
-	platform_driver_unregister(&pcf50633_regulator_driver);
-}
-module_exit(pcf50633_regulator_exit);
-
-MODULE_AUTHOR("Balaji Rao <balajirrao@openmoko.org>");
-MODULE_DESCRIPTION("PCF50633 regulator driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pcf50633-regulator");
diff --git a/include/linux/mfd/pcf50633/core.h b/include/linux/mfd/pcf50633/core.h
index 8d63059f1153..0bd7f7e46e46 100644
--- a/include/linux/mfd/pcf50633/core.h
+++ b/include/linux/mfd/pcf50633/core.h
@@ -147,7 +147,6 @@ struct pcf50633 {
 	int onkey1s_held;
 
 	struct platform_device *mbc_pdev;
-	struct platform_device *regulator_pdev[PCF50633_NUM_REGULATORS];
 };
 
 enum pcf50633_reg_int1 {
-- 
2.48.1

