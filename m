Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80615A587AB
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 20:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B9F10E369;
	Sun,  9 Mar 2025 19:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Jka6yp3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF5C10E369
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 19:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=RviVdqbHH4yyz8IM6MiPPTK6+eJv1qH9++/Jve5VjJc=; b=Jka6yp3hf0Kd003R
 rxOnugQ53I1Qth2DQd7bYAzxVbJYLt370jNnUZQoWUzeTkichsqcjQddmgobQM8BZ+oCgkGAIDpf2
 v4XZUlWaXqN+52IoKFOtEOR7BKXBnmzZTkFMn1vdxzCd+o4PS5/rueZjs/5mkqyW7YYeREf918ZGf
 dJ1lhAFwIn9AmcOTOrv4m75hyRhIRKdtaQbDOwVU8i5WOKRlaC5nSjYa+RXfmXSuzcGQGdHIySCv0
 d3UNj9rDDIk4kA8a0ooY4zheNfdVa14cbKXCv4LcoViFLBvov+yKjNa7t1JeGNSfzFe46zrwBGg9D
 stQcFcwQp7QHjOl7PA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1trMST-003kFU-1R;
 Sun, 09 Mar 2025 19:37:09 +0000
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
Subject: [PATCH 9/9] mfd: pcf50633: Remove remains
Date: Sun,  9 Mar 2025 19:36:12 +0000
Message-ID: <20250309193612.251929-10-linux@treblig.org>
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

Remove the remaining parts of the 50633, the core, headers and glue.

The pcf50633 was used as part of the OpenMoko devices but
the support for its main chip was recently removed in:
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")

See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 arch/mips/configs/ip27_defconfig  |   1 -
 drivers/mfd/Kconfig               |  10 --
 drivers/mfd/Makefile              |   2 -
 drivers/mfd/pcf50633-core.c       | 260 ------------------------------
 include/linux/mfd/pcf50633/core.h | 224 -------------------------
 include/linux/mfd/pcf50633/mbc.h  | 130 ---------------
 include/linux/mfd/pcf50633/pmic.h |  68 --------
 7 files changed, 695 deletions(-)
 delete mode 100644 drivers/mfd/pcf50633-core.c
 delete mode 100644 include/linux/mfd/pcf50633/core.h
 delete mode 100644 include/linux/mfd/pcf50633/mbc.h
 delete mode 100644 include/linux/mfd/pcf50633/pmic.h

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index 0a9ec09aff65..c13c2f3cff9a 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -255,7 +255,6 @@ CONFIG_I2C_TAOS_EVM=m
 CONFIG_I2C_STUB=m
 # CONFIG_HWMON is not set
 CONFIG_THERMAL=y
-CONFIG_MFD_PCF50633=m
 # CONFIG_VGA_ARB is not set
 CONFIG_LEDS_LP3944=m
 CONFIG_LEDS_PCA955X=m
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 766453ef6c2d..1eeb62dac8d3 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1119,16 +1119,6 @@ config MFD_RETU
 	  Retu and Tahvo are a multi-function devices found on Nokia
 	  Internet Tablets (770, N800 and N810).
 
-config MFD_PCF50633
-	tristate "NXP PCF50633"
-	depends on I2C
-	select REGMAP_I2C
-	help
-	  Say yes here if you have NXP PCF50633 chip on your board.
-	  This core driver provides register access and IRQ handling
-	  facilities, and registers devices for the various functions
-	  so that function-specific drivers can bind to them.
-
 config MFD_PM8XXX
 	tristate "Qualcomm PM8xxx PMIC chips driver"
 	depends on ARM || HEXAGON || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index f1c7a15c8f7b..941e4ba58b24 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -183,8 +183,6 @@ obj-$(CONFIG_MFD_MT6370)	+= mt6370.o
 mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
 obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
 
-pcf50633-objs			:= pcf50633-core.o
-obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
 obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
 obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
 obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
deleted file mode 100644
index 1637816a23d1..000000000000
--- a/drivers/mfd/pcf50633-core.c
+++ /dev/null
@@ -1,260 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 Power Management Unit (PMU) driver
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * Author: Harald Welte <laforge@openmoko.org>
- * 	   Balaji Rao <balajirrao@openmoko.org>
- * All rights reserved.
- */
-
-#include <linux/kernel.h>
-#include <linux/device.h>
-#include <linux/sysfs.h>
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/interrupt.h>
-#include <linux/workqueue.h>
-#include <linux/platform_device.h>
-#include <linux/i2c.h>
-#include <linux/pm.h>
-#include <linux/slab.h>
-#include <linux/regmap.h>
-#include <linux/err.h>
-
-#include <linux/mfd/pcf50633/core.h>
-
-/* Read a block of up to 32 regs  */
-int pcf50633_read_block(struct pcf50633 *pcf, u8 reg,
-					int nr_regs, u8 *data)
-{
-	int ret;
-
-	ret = regmap_raw_read(pcf->regmap, reg, data, nr_regs);
-	if (ret != 0)
-		return ret;
-
-	return nr_regs;
-}
-EXPORT_SYMBOL_GPL(pcf50633_read_block);
-
-/* Write a block of up to 32 regs  */
-int pcf50633_write_block(struct pcf50633 *pcf , u8 reg,
-					int nr_regs, u8 *data)
-{
-	return regmap_raw_write(pcf->regmap, reg, data, nr_regs);
-}
-EXPORT_SYMBOL_GPL(pcf50633_write_block);
-
-u8 pcf50633_reg_read(struct pcf50633 *pcf, u8 reg)
-{
-	unsigned int val;
-	int ret;
-
-	ret = regmap_read(pcf->regmap, reg, &val);
-	if (ret < 0)
-		return -1;
-
-	return val;
-}
-EXPORT_SYMBOL_GPL(pcf50633_reg_read);
-
-int pcf50633_reg_write(struct pcf50633 *pcf, u8 reg, u8 val)
-{
-	return regmap_write(pcf->regmap, reg, val);
-}
-EXPORT_SYMBOL_GPL(pcf50633_reg_write);
-
-int pcf50633_reg_set_bit_mask(struct pcf50633 *pcf, u8 reg, u8 mask, u8 val)
-{
-	return regmap_update_bits(pcf->regmap, reg, mask, val);
-}
-EXPORT_SYMBOL_GPL(pcf50633_reg_set_bit_mask);
-
-int pcf50633_reg_clear_bits(struct pcf50633 *pcf, u8 reg, u8 val)
-{
-	return regmap_update_bits(pcf->regmap, reg, val, 0);
-}
-EXPORT_SYMBOL_GPL(pcf50633_reg_clear_bits);
-
-/* sysfs attributes */
-static ssize_t dump_regs_show(struct device *dev,
-			      struct device_attribute *attr, char *buf)
-{
-	struct pcf50633 *pcf = dev_get_drvdata(dev);
-	u8 dump[16];
-	int n, n1, idx = 0;
-	char *buf1 = buf;
-	static u8 address_no_read[] = { /* must be ascending */
-		PCF50633_REG_INT1,
-		PCF50633_REG_INT2,
-		PCF50633_REG_INT3,
-		PCF50633_REG_INT4,
-		PCF50633_REG_INT5,
-		0 /* terminator */
-	};
-
-	for (n = 0; n < 256; n += sizeof(dump)) {
-		for (n1 = 0; n1 < sizeof(dump); n1++)
-			if (n == address_no_read[idx]) {
-				idx++;
-				dump[n1] = 0x00;
-			} else
-				dump[n1] = pcf50633_reg_read(pcf, n + n1);
-
-		buf1 += sprintf(buf1, "%*ph\n", (int)sizeof(dump), dump);
-	}
-
-	return buf1 - buf;
-}
-static DEVICE_ATTR_ADMIN_RO(dump_regs);
-
-static ssize_t resume_reason_show(struct device *dev,
-				  struct device_attribute *attr, char *buf)
-{
-	struct pcf50633 *pcf = dev_get_drvdata(dev);
-	int n;
-
-	n = sprintf(buf, "%02x%02x%02x%02x%02x\n",
-				pcf->resume_reason[0],
-				pcf->resume_reason[1],
-				pcf->resume_reason[2],
-				pcf->resume_reason[3],
-				pcf->resume_reason[4]);
-
-	return n;
-}
-static DEVICE_ATTR_ADMIN_RO(resume_reason);
-
-static struct attribute *pcf_sysfs_entries[] = {
-	&dev_attr_dump_regs.attr,
-	&dev_attr_resume_reason.attr,
-	NULL,
-};
-
-static struct attribute_group pcf_attr_group = {
-	.name	= NULL,			/* put in device directory */
-	.attrs	= pcf_sysfs_entries,
-};
-
-static void
-pcf50633_client_dev_register(struct pcf50633 *pcf, const char *name,
-						struct platform_device **pdev)
-{
-	int ret;
-
-	*pdev = platform_device_alloc(name, -1);
-	if (!*pdev) {
-		dev_err(pcf->dev, "Failed to allocate %s\n", name);
-		return;
-	}
-
-	(*pdev)->dev.parent = pcf->dev;
-
-	ret = platform_device_add(*pdev);
-	if (ret) {
-		dev_err(pcf->dev, "Failed to register %s: %d\n", name, ret);
-		platform_device_put(*pdev);
-		*pdev = NULL;
-	}
-}
-
-static const struct regmap_config pcf50633_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
-static int pcf50633_probe(struct i2c_client *client)
-{
-	struct pcf50633 *pcf;
-	struct pcf50633_platform_data *pdata = dev_get_platdata(&client->dev);
-	int ret;
-	int version, variant;
-
-	if (!client->irq) {
-		dev_err(&client->dev, "Missing IRQ\n");
-		return -ENOENT;
-	}
-
-	pcf = devm_kzalloc(&client->dev, sizeof(*pcf), GFP_KERNEL);
-	if (!pcf)
-		return -ENOMEM;
-
-	i2c_set_clientdata(client, pcf);
-	pcf->dev = &client->dev;
-	pcf->pdata = pdata;
-
-	mutex_init(&pcf->lock);
-
-	pcf->regmap = devm_regmap_init_i2c(client, &pcf50633_regmap_config);
-	if (IS_ERR(pcf->regmap)) {
-		ret = PTR_ERR(pcf->regmap);
-		dev_err(pcf->dev, "Failed to allocate register map: %d\n", ret);
-		return ret;
-	}
-
-	version = pcf50633_reg_read(pcf, 0);
-	variant = pcf50633_reg_read(pcf, 1);
-	if (version < 0 || variant < 0) {
-		dev_err(pcf->dev, "Unable to probe pcf50633\n");
-		ret = -ENODEV;
-		return ret;
-	}
-
-	dev_info(pcf->dev, "Probed device version %d variant %d\n",
-							version, variant);
-
-	/* Create sub devices */
-	pcf50633_client_dev_register(pcf, "pcf50633-mbc", &pcf->mbc_pdev);
-
-
-	ret = sysfs_create_group(&client->dev.kobj, &pcf_attr_group);
-	if (ret)
-		dev_warn(pcf->dev, "error creating sysfs entries\n");
-
-	if (pdata->probe_done)
-		pdata->probe_done(pcf);
-
-	return 0;
-}
-
-static void pcf50633_remove(struct i2c_client *client)
-{
-	struct pcf50633 *pcf = i2c_get_clientdata(client);
-
-	sysfs_remove_group(&client->dev.kobj, &pcf_attr_group);
-
-	platform_device_unregister(pcf->mbc_pdev);
-}
-
-static const struct i2c_device_id pcf50633_id_table[] = {
-	{"pcf50633", 0x73},
-	{/* end of list */}
-};
-MODULE_DEVICE_TABLE(i2c, pcf50633_id_table);
-
-static struct i2c_driver pcf50633_driver = {
-	.driver = {
-		.name	= "pcf50633",
-		/* going.... .pm	= pm_sleep_ptr(&pcf50633_pm), */
-	},
-	.id_table = pcf50633_id_table,
-	.probe = pcf50633_probe,
-	.remove = pcf50633_remove,
-};
-
-static int __init pcf50633_init(void)
-{
-	return i2c_add_driver(&pcf50633_driver);
-}
-
-static void __exit pcf50633_exit(void)
-{
-	i2c_del_driver(&pcf50633_driver);
-}
-
-MODULE_DESCRIPTION("I2C chip driver for NXP PCF50633 PMU");
-MODULE_AUTHOR("Harald Welte <laforge@openmoko.org>");
-MODULE_LICENSE("GPL");
-
-subsys_initcall(pcf50633_init);
-module_exit(pcf50633_exit);
diff --git a/include/linux/mfd/pcf50633/core.h b/include/linux/mfd/pcf50633/core.h
deleted file mode 100644
index 0bd7f7e46e46..000000000000
--- a/include/linux/mfd/pcf50633/core.h
+++ /dev/null
@@ -1,224 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * core.h  -- Core driver for NXP PCF50633
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * All rights reserved.
- */
-
-#ifndef __LINUX_MFD_PCF50633_CORE_H
-#define __LINUX_MFD_PCF50633_CORE_H
-
-#include <linux/i2c.h>
-#include <linux/workqueue.h>
-#include <linux/regulator/driver.h>
-#include <linux/regulator/machine.h>
-#include <linux/pm.h>
-#include <linux/power_supply.h>
-
-struct pcf50633;
-struct regmap;
-
-#define PCF50633_NUM_REGULATORS	11
-
-struct pcf50633_platform_data {
-	struct regulator_init_data reg_init_data[PCF50633_NUM_REGULATORS];
-
-	char **batteries;
-	int num_batteries;
-
-	/*
-	 * Should be set accordingly to the reference resistor used, see
-	 * I_{ch(ref)} charger reference current in the pcf50633 User
-	 * Manual.
-	 */
-	int charger_reference_current_ma;
-
-	/* Callbacks */
-	void (*probe_done)(struct pcf50633 *);
-	void (*mbc_event_callback)(struct pcf50633 *, int);
-	void (*regulator_registered)(struct pcf50633 *, int);
-	void (*force_shutdown)(struct pcf50633 *);
-
-	u8 resumers[5];
-};
-
-struct pcf50633_irq {
-	void (*handler) (int, void *);
-	void *data;
-};
-
-int pcf50633_register_irq(struct pcf50633 *pcf, int irq,
-			void (*handler) (int, void *), void *data);
-int pcf50633_free_irq(struct pcf50633 *pcf, int irq);
-
-int pcf50633_irq_mask(struct pcf50633 *pcf, int irq);
-int pcf50633_irq_unmask(struct pcf50633 *pcf, int irq);
-int pcf50633_irq_mask_get(struct pcf50633 *pcf, int irq);
-
-int pcf50633_read_block(struct pcf50633 *, u8 reg,
-					int nr_regs, u8 *data);
-int pcf50633_write_block(struct pcf50633 *pcf, u8 reg,
-					int nr_regs, u8 *data);
-u8 pcf50633_reg_read(struct pcf50633 *, u8 reg);
-int pcf50633_reg_write(struct pcf50633 *pcf, u8 reg, u8 val);
-
-int pcf50633_reg_set_bit_mask(struct pcf50633 *pcf, u8 reg, u8 mask, u8 val);
-int pcf50633_reg_clear_bits(struct pcf50633 *pcf, u8 reg, u8 bits);
-
-/* Interrupt registers */
-
-#define PCF50633_REG_INT1	0x02
-#define PCF50633_REG_INT2	0x03
-#define PCF50633_REG_INT3	0x04
-#define PCF50633_REG_INT4	0x05
-#define PCF50633_REG_INT5	0x06
-
-#define PCF50633_REG_INT1M	0x07
-#define PCF50633_REG_INT2M	0x08
-#define PCF50633_REG_INT3M	0x09
-#define PCF50633_REG_INT4M	0x0a
-#define PCF50633_REG_INT5M	0x0b
-
-enum {
-	/* Chip IRQs */
-	PCF50633_IRQ_ADPINS,
-	PCF50633_IRQ_ADPREM,
-	PCF50633_IRQ_USBINS,
-	PCF50633_IRQ_USBREM,
-	PCF50633_IRQ_RESERVED1,
-	PCF50633_IRQ_RESERVED2,
-	PCF50633_IRQ_ALARM,
-	PCF50633_IRQ_SECOND,
-	PCF50633_IRQ_ONKEYR,
-	PCF50633_IRQ_ONKEYF,
-	PCF50633_IRQ_EXTON1R,
-	PCF50633_IRQ_EXTON1F,
-	PCF50633_IRQ_EXTON2R,
-	PCF50633_IRQ_EXTON2F,
-	PCF50633_IRQ_EXTON3R,
-	PCF50633_IRQ_EXTON3F,
-	PCF50633_IRQ_BATFULL,
-	PCF50633_IRQ_CHGHALT,
-	PCF50633_IRQ_THLIMON,
-	PCF50633_IRQ_THLIMOFF,
-	PCF50633_IRQ_USBLIMON,
-	PCF50633_IRQ_USBLIMOFF,
-	PCF50633_IRQ_ADCRDY,
-	PCF50633_IRQ_ONKEY1S,
-	PCF50633_IRQ_LOWSYS,
-	PCF50633_IRQ_LOWBAT,
-	PCF50633_IRQ_HIGHTMP,
-	PCF50633_IRQ_AUTOPWRFAIL,
-	PCF50633_IRQ_DWN1PWRFAIL,
-	PCF50633_IRQ_DWN2PWRFAIL,
-	PCF50633_IRQ_LEDPWRFAIL,
-	PCF50633_IRQ_LEDOVP,
-	PCF50633_IRQ_LDO1PWRFAIL,
-	PCF50633_IRQ_LDO2PWRFAIL,
-	PCF50633_IRQ_LDO3PWRFAIL,
-	PCF50633_IRQ_LDO4PWRFAIL,
-	PCF50633_IRQ_LDO5PWRFAIL,
-	PCF50633_IRQ_LDO6PWRFAIL,
-	PCF50633_IRQ_HCLDOPWRFAIL,
-	PCF50633_IRQ_HCLDOOVL,
-
-	/* Always last */
-	PCF50633_NUM_IRQ,
-};
-
-struct pcf50633 {
-	struct device *dev;
-	struct regmap *regmap;
-
-	struct pcf50633_platform_data *pdata;
-	int irq;
-	struct pcf50633_irq irq_handler[PCF50633_NUM_IRQ];
-	struct work_struct irq_work;
-	struct workqueue_struct *work_queue;
-	struct mutex lock;
-
-	u8 mask_regs[5];
-
-	u8 suspend_irq_masks[5];
-	u8 resume_reason[5];
-	int is_suspended;
-
-	int onkey1s_held;
-
-	struct platform_device *mbc_pdev;
-};
-
-enum pcf50633_reg_int1 {
-	PCF50633_INT1_ADPINS	= 0x01,	/* Adapter inserted */
-	PCF50633_INT1_ADPREM	= 0x02,	/* Adapter removed */
-	PCF50633_INT1_USBINS	= 0x04,	/* USB inserted */
-	PCF50633_INT1_USBREM	= 0x08,	/* USB removed */
-	/* reserved */
-	PCF50633_INT1_ALARM	= 0x40, /* RTC alarm time is reached */
-	PCF50633_INT1_SECOND	= 0x80,	/* RTC periodic second interrupt */
-};
-
-enum pcf50633_reg_int2 {
-	PCF50633_INT2_ONKEYR	= 0x01, /* ONKEY rising edge */
-	PCF50633_INT2_ONKEYF	= 0x02, /* ONKEY falling edge */
-	PCF50633_INT2_EXTON1R	= 0x04, /* EXTON1 rising edge */
-	PCF50633_INT2_EXTON1F	= 0x08, /* EXTON1 falling edge */
-	PCF50633_INT2_EXTON2R	= 0x10, /* EXTON2 rising edge */
-	PCF50633_INT2_EXTON2F	= 0x20, /* EXTON2 falling edge */
-	PCF50633_INT2_EXTON3R	= 0x40, /* EXTON3 rising edge */
-	PCF50633_INT2_EXTON3F	= 0x80, /* EXTON3 falling edge */
-};
-
-enum pcf50633_reg_int3 {
-	PCF50633_INT3_BATFULL	= 0x01, /* Battery full */
-	PCF50633_INT3_CHGHALT	= 0x02,	/* Charger halt */
-	PCF50633_INT3_THLIMON	= 0x04,
-	PCF50633_INT3_THLIMOFF	= 0x08,
-	PCF50633_INT3_USBLIMON	= 0x10,
-	PCF50633_INT3_USBLIMOFF	= 0x20,
-	PCF50633_INT3_ADCRDY	= 0x40, /* ADC result ready */
-	PCF50633_INT3_ONKEY1S	= 0x80,	/* ONKEY pressed 1 second */
-};
-
-enum pcf50633_reg_int4 {
-	PCF50633_INT4_LOWSYS		= 0x01,
-	PCF50633_INT4_LOWBAT		= 0x02,
-	PCF50633_INT4_HIGHTMP		= 0x04,
-	PCF50633_INT4_AUTOPWRFAIL	= 0x08,
-	PCF50633_INT4_DWN1PWRFAIL	= 0x10,
-	PCF50633_INT4_DWN2PWRFAIL	= 0x20,
-	PCF50633_INT4_LEDPWRFAIL	= 0x40,
-	PCF50633_INT4_LEDOVP		= 0x80,
-};
-
-enum pcf50633_reg_int5 {
-	PCF50633_INT5_LDO1PWRFAIL	= 0x01,
-	PCF50633_INT5_LDO2PWRFAIL	= 0x02,
-	PCF50633_INT5_LDO3PWRFAIL	= 0x04,
-	PCF50633_INT5_LDO4PWRFAIL	= 0x08,
-	PCF50633_INT5_LDO5PWRFAIL	= 0x10,
-	PCF50633_INT5_LDO6PWRFAIL	= 0x20,
-	PCF50633_INT5_HCLDOPWRFAIL	= 0x40,
-	PCF50633_INT5_HCLDOOVL		= 0x80,
-};
-
-/* misc. registers */
-#define PCF50633_REG_OOCSHDWN	0x0c
-
-/* LED registers */
-#define PCF50633_REG_LEDOUT 0x28
-#define PCF50633_REG_LEDENA 0x29
-#define PCF50633_REG_LEDCTL 0x2a
-#define PCF50633_REG_LEDDIM 0x2b
-
-static inline struct pcf50633 *dev_to_pcf50633(struct device *dev)
-{
-	return dev_get_drvdata(dev);
-}
-
-int pcf50633_irq_init(struct pcf50633 *pcf, int irq);
-void pcf50633_irq_free(struct pcf50633 *pcf);
-extern const struct dev_pm_ops pcf50633_pm;
-
-#endif
diff --git a/include/linux/mfd/pcf50633/mbc.h b/include/linux/mfd/pcf50633/mbc.h
deleted file mode 100644
index fa5cb9256d99..000000000000
--- a/include/linux/mfd/pcf50633/mbc.h
+++ /dev/null
@@ -1,130 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * mbc.h  -- Driver for NXP PCF50633 Main Battery Charger
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * All rights reserved.
- */
-
-#ifndef __LINUX_MFD_PCF50633_MBC_H
-#define __LINUX_MFD_PCF50633_MBC_H
-
-#include <linux/mfd/pcf50633/core.h>
-#include <linux/platform_device.h>
-
-#define PCF50633_REG_MBCC1	0x43
-#define PCF50633_REG_MBCC2	0x44
-#define PCF50633_REG_MBCC3	0x45
-#define PCF50633_REG_MBCC4	0x46
-#define PCF50633_REG_MBCC5	0x47
-#define PCF50633_REG_MBCC6	0x48
-#define PCF50633_REG_MBCC7	0x49
-#define PCF50633_REG_MBCC8	0x4a
-#define PCF50633_REG_MBCS1	0x4b
-#define PCF50633_REG_MBCS2	0x4c
-#define PCF50633_REG_MBCS3	0x4d
-
-enum pcf50633_reg_mbcc1 {
-	PCF50633_MBCC1_CHGENA		= 0x01,	/* Charger enable */
-	PCF50633_MBCC1_AUTOSTOP		= 0x02,
-	PCF50633_MBCC1_AUTORES		= 0x04, /* automatic resume */
-	PCF50633_MBCC1_RESUME		= 0x08, /* explicit resume cmd */
-	PCF50633_MBCC1_RESTART		= 0x10, /* restart charging */
-	PCF50633_MBCC1_PREWDTIME_60M	= 0x20,	/* max. precharging time */
-	PCF50633_MBCC1_WDTIME_1H	= 0x00,
-	PCF50633_MBCC1_WDTIME_2H	= 0x40,
-	PCF50633_MBCC1_WDTIME_4H	= 0x80,
-	PCF50633_MBCC1_WDTIME_6H	= 0xc0,
-};
-#define PCF50633_MBCC1_WDTIME_MASK	  0xc0
-
-enum pcf50633_reg_mbcc2 {
-	PCF50633_MBCC2_VBATCOND_2V7	= 0x00,
-	PCF50633_MBCC2_VBATCOND_2V85	= 0x01,
-	PCF50633_MBCC2_VBATCOND_3V0	= 0x02,
-	PCF50633_MBCC2_VBATCOND_3V15	= 0x03,
-	PCF50633_MBCC2_VMAX_4V		= 0x00,
-	PCF50633_MBCC2_VMAX_4V20	= 0x28,
-	PCF50633_MBCC2_VRESDEBTIME_64S	= 0x80,	/* debounce time (32/64sec) */
-};
-
-enum pcf50633_reg_mbcc7 {
-	PCF50633_MBCC7_USB_100mA	= 0x00,
-	PCF50633_MBCC7_USB_500mA	= 0x01,
-	PCF50633_MBCC7_USB_1000mA	= 0x02,
-	PCF50633_MBCC7_USB_SUSPEND	= 0x03,
-	PCF50633_MBCC7_BATTEMP_EN	= 0x04,
-	PCF50633_MBCC7_BATSYSIMAX_1A6	= 0x00,
-	PCF50633_MBCC7_BATSYSIMAX_1A8	= 0x40,
-	PCF50633_MBCC7_BATSYSIMAX_2A0	= 0x80,
-	PCF50633_MBCC7_BATSYSIMAX_2A2	= 0xc0,
-};
-#define PCF50633_MBCC7_USB_MASK 0x03
-
-enum pcf50633_reg_mbcc8 {
-	PCF50633_MBCC8_USBENASUS	= 0x10,
-};
-
-enum pcf50633_reg_mbcs1 {
-	PCF50633_MBCS1_USBPRES		= 0x01,
-	PCF50633_MBCS1_USBOK		= 0x02,
-	PCF50633_MBCS1_ADAPTPRES	= 0x04,
-	PCF50633_MBCS1_ADAPTOK		= 0x08,
-	PCF50633_MBCS1_TBAT_OK		= 0x00,
-	PCF50633_MBCS1_TBAT_ABOVE	= 0x10,
-	PCF50633_MBCS1_TBAT_BELOW	= 0x20,
-	PCF50633_MBCS1_TBAT_UNDEF	= 0x30,
-	PCF50633_MBCS1_PREWDTEXP	= 0x40,
-	PCF50633_MBCS1_WDTEXP		= 0x80,
-};
-
-enum pcf50633_reg_mbcs2_mbcmod {
-	PCF50633_MBCS2_MBC_PLAY		= 0x00,
-	PCF50633_MBCS2_MBC_USB_PRE	= 0x01,
-	PCF50633_MBCS2_MBC_USB_PRE_WAIT	= 0x02,
-	PCF50633_MBCS2_MBC_USB_FAST	= 0x03,
-	PCF50633_MBCS2_MBC_USB_FAST_WAIT = 0x04,
-	PCF50633_MBCS2_MBC_USB_SUSPEND	= 0x05,
-	PCF50633_MBCS2_MBC_ADP_PRE	= 0x06,
-	PCF50633_MBCS2_MBC_ADP_PRE_WAIT	= 0x07,
-	PCF50633_MBCS2_MBC_ADP_FAST	= 0x08,
-	PCF50633_MBCS2_MBC_ADP_FAST_WAIT = 0x09,
-	PCF50633_MBCS2_MBC_BAT_FULL	= 0x0a,
-	PCF50633_MBCS2_MBC_HALT		= 0x0b,
-};
-#define PCF50633_MBCS2_MBC_MASK		0x0f
-enum pcf50633_reg_mbcs2_chgstat {
-	PCF50633_MBCS2_CHGS_NONE	= 0x00,
-	PCF50633_MBCS2_CHGS_ADAPTER	= 0x10,
-	PCF50633_MBCS2_CHGS_USB		= 0x20,
-	PCF50633_MBCS2_CHGS_BOTH	= 0x30,
-};
-#define PCF50633_MBCS2_RESSTAT_AUTO	0x40
-
-enum pcf50633_reg_mbcs3 {
-	PCF50633_MBCS3_USBLIM_PLAY	= 0x01,
-	PCF50633_MBCS3_USBLIM_CGH	= 0x02,
-	PCF50633_MBCS3_TLIM_PLAY	= 0x04,
-	PCF50633_MBCS3_TLIM_CHG		= 0x08,
-	PCF50633_MBCS3_ILIM		= 0x10,	/* 1: Ibat > Icutoff */
-	PCF50633_MBCS3_VLIM		= 0x20,	/* 1: Vbat == Vmax */
-	PCF50633_MBCS3_VBATSTAT		= 0x40,	/* 1: Vbat > Vbatcond */
-	PCF50633_MBCS3_VRES		= 0x80, /* 1: Vbat > Vth(RES) */
-};
-
-#define PCF50633_MBCC2_VBATCOND_MASK	  0x03
-#define PCF50633_MBCC2_VMAX_MASK	  0x3c
-
-/* Charger status */
-#define PCF50633_MBC_USB_ONLINE		0x01
-#define PCF50633_MBC_USB_ACTIVE		0x02
-#define PCF50633_MBC_ADAPTER_ONLINE	0x04
-#define PCF50633_MBC_ADAPTER_ACTIVE	0x08
-
-int pcf50633_mbc_usb_curlim_set(struct pcf50633 *pcf, int ma);
-
-int pcf50633_mbc_get_status(struct pcf50633 *);
-int pcf50633_mbc_get_usb_online_status(struct pcf50633 *);
-
-#endif
-
diff --git a/include/linux/mfd/pcf50633/pmic.h b/include/linux/mfd/pcf50633/pmic.h
deleted file mode 100644
index eac0c3d8e984..000000000000
--- a/include/linux/mfd/pcf50633/pmic.h
+++ /dev/null
@@ -1,68 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __LINUX_MFD_PCF50633_PMIC_H
-#define __LINUX_MFD_PCF50633_PMIC_H
-
-#include <linux/mfd/pcf50633/core.h>
-#include <linux/platform_device.h>
-
-#define PCF50633_REG_AUTOOUT	0x1a
-#define PCF50633_REG_AUTOENA	0x1b
-#define PCF50633_REG_AUTOCTL	0x1c
-#define PCF50633_REG_AUTOMXC	0x1d
-#define PCF50633_REG_DOWN1OUT	0x1e
-#define PCF50633_REG_DOWN1ENA	0x1f
-#define PCF50633_REG_DOWN1CTL	0x20
-#define PCF50633_REG_DOWN1MXC	0x21
-#define PCF50633_REG_DOWN2OUT	0x22
-#define PCF50633_REG_DOWN2ENA	0x23
-#define PCF50633_REG_DOWN2CTL	0x24
-#define PCF50633_REG_DOWN2MXC	0x25
-#define PCF50633_REG_MEMLDOOUT	0x26
-#define PCF50633_REG_MEMLDOENA	0x27
-#define PCF50633_REG_LDO1OUT	0x2d
-#define PCF50633_REG_LDO1ENA	0x2e
-#define PCF50633_REG_LDO2OUT	0x2f
-#define PCF50633_REG_LDO2ENA	0x30
-#define PCF50633_REG_LDO3OUT	0x31
-#define PCF50633_REG_LDO3ENA	0x32
-#define PCF50633_REG_LDO4OUT	0x33
-#define PCF50633_REG_LDO4ENA	0x34
-#define PCF50633_REG_LDO5OUT	0x35
-#define PCF50633_REG_LDO5ENA	0x36
-#define PCF50633_REG_LDO6OUT	0x37
-#define PCF50633_REG_LDO6ENA	0x38
-#define PCF50633_REG_HCLDOOUT	0x39
-#define PCF50633_REG_HCLDOENA	0x3a
-#define PCF50633_REG_HCLDOOVL	0x40
-
-enum pcf50633_regulator_enable {
-	PCF50633_REGULATOR_ON		= 0x01,
-	PCF50633_REGULATOR_ON_GPIO1	= 0x02,
-	PCF50633_REGULATOR_ON_GPIO2	= 0x04,
-	PCF50633_REGULATOR_ON_GPIO3	= 0x08,
-};
-#define PCF50633_REGULATOR_ON_MASK	0x0f
-
-enum pcf50633_regulator_phase {
-	PCF50633_REGULATOR_ACTPH1	= 0x00,
-	PCF50633_REGULATOR_ACTPH2	= 0x10,
-	PCF50633_REGULATOR_ACTPH3	= 0x20,
-	PCF50633_REGULATOR_ACTPH4	= 0x30,
-};
-#define PCF50633_REGULATOR_ACTPH_MASK	0x30
-
-enum pcf50633_regulator_id {
-	PCF50633_REGULATOR_AUTO,
-	PCF50633_REGULATOR_DOWN1,
-	PCF50633_REGULATOR_DOWN2,
-	PCF50633_REGULATOR_LDO1,
-	PCF50633_REGULATOR_LDO2,
-	PCF50633_REGULATOR_LDO3,
-	PCF50633_REGULATOR_LDO4,
-	PCF50633_REGULATOR_LDO5,
-	PCF50633_REGULATOR_LDO6,
-	PCF50633_REGULATOR_HCLDO,
-	PCF50633_REGULATOR_MEMLDO,
-};
-#endif
-
-- 
2.48.1

