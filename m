Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22631A5B606
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 02:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9661310E501;
	Tue, 11 Mar 2025 01:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="HqA/qxtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4E810E508
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 01:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=VY/DIWys+9hgx9n38Wl/0AM82g3+b7rakdL8YW8mjII=; b=HqA/qxtPHqcoCg1P
 uYMBkSqV2kjXFS4TOiTlYQ5s1wy/r41djyLh9abngkvDfZZvZ8VWlkxqs2n4Bw2L1X8gDW/kVeVQ7
 Js8hJ7w6B95gxzeVgO3tRuf65+nOIzMBb1ffpTtOQbODpg9KU6id+tUskaj5SfVYlYte6LOSJ0oec
 z3utgS93uL4un6fZAuD2GA+2wRe+9b8XZ2IiAVI4/uBhl8IHPTvVIHIGH0qH4/UYCw2Um3XJC5b+W
 kfeGZflgvhcXOYBixnSXjkW6WgOqfpZzJEZmumc85JA7oo/gFFTO8OEmbPpqXKqYDYxfZwaoA5p9l
 ijFEGAttOPZ1iLUkog==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1trokr-0042n5-04;
 Tue, 11 Mar 2025 01:50:01 +0000
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
Subject: [PATCH v2 1/9] mfd: pcf50633-adc:  Remove
Date: Tue, 11 Mar 2025 01:49:51 +0000
Message-ID: <20250311014959.743322-2-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311014959.743322-1-linux@treblig.org>
References: <20250311014959.743322-1-linux@treblig.org>
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
 arch/mips/configs/ip27_defconfig |   1 -
 drivers/mfd/Kconfig              |   7 -
 drivers/mfd/Makefile             |   1 -
 drivers/mfd/pcf50633-adc.c       | 255 -------------------------------
 include/linux/mfd/pcf50633/adc.h |  69 ---------
 5 files changed, 333 deletions(-)
 delete mode 100644 drivers/mfd/pcf50633-adc.c
 delete mode 100644 include/linux/mfd/pcf50633/adc.h

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index b08a199767d1..66085bb71bc4 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -256,7 +256,6 @@ CONFIG_I2C_STUB=m
 # CONFIG_HWMON is not set
 CONFIG_THERMAL=y
 CONFIG_MFD_PCF50633=m
-CONFIG_PCF50633_ADC=m
 CONFIG_PCF50633_GPIO=m
 # CONFIG_VGA_ARB is not set
 CONFIG_LEDS_LP3944=m
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6b0682af6e32..051272126fe1 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1129,13 +1129,6 @@ config MFD_PCF50633
 	  facilities, and registers devices for the various functions
 	  so that function-specific drivers can bind to them.
 
-config PCF50633_ADC
-	tristate "NXP PCF50633 ADC"
-	depends on MFD_PCF50633
-	help
-	  Say yes here if you want to include support for ADC in the
-	  NXP PCF50633 chip.
-
 config PCF50633_GPIO
 	tristate "NXP PCF50633 GPIO"
 	depends on MFD_PCF50633
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9220eaf7cf12..e085da3f13c3 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -185,7 +185,6 @@ obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
 
 pcf50633-objs			:= pcf50633-core.o pcf50633-irq.o
 obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
-obj-$(CONFIG_PCF50633_ADC)	+= pcf50633-adc.o
 obj-$(CONFIG_PCF50633_GPIO)	+= pcf50633-gpio.o
 obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
 obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
diff --git a/drivers/mfd/pcf50633-adc.c b/drivers/mfd/pcf50633-adc.c
deleted file mode 100644
index 1fbba0e666d5..000000000000
--- a/drivers/mfd/pcf50633-adc.c
+++ /dev/null
@@ -1,255 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 ADC Driver
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * Author: Balaji Rao <balajirrao@openmoko.org>
- * All rights reserved.
- *
- * Broken down from monstrous PCF50633 driver mainly by
- * Harald Welte, Andy Green and Werner Almesberger
- *
- *  NOTE: This driver does not yet support subtractive ADC mode, which means
- *  you can do only one measurement per read request.
- */
-
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <linux/device.h>
-#include <linux/platform_device.h>
-#include <linux/completion.h>
-
-#include <linux/mfd/pcf50633/core.h>
-#include <linux/mfd/pcf50633/adc.h>
-
-struct pcf50633_adc_request {
-	int mux;
-	int avg;
-	void (*callback)(struct pcf50633 *, void *, int);
-	void *callback_param;
-};
-
-struct pcf50633_adc_sync_request {
-	int result;
-	struct completion completion;
-};
-
-#define PCF50633_MAX_ADC_FIFO_DEPTH 8
-
-struct pcf50633_adc {
-	struct pcf50633 *pcf;
-
-	/* Private stuff */
-	struct pcf50633_adc_request *queue[PCF50633_MAX_ADC_FIFO_DEPTH];
-	int queue_head;
-	int queue_tail;
-	struct mutex queue_mutex;
-};
-
-static inline struct pcf50633_adc *__to_adc(struct pcf50633 *pcf)
-{
-	return platform_get_drvdata(pcf->adc_pdev);
-}
-
-static void adc_setup(struct pcf50633 *pcf, int channel, int avg)
-{
-	channel &= PCF50633_ADCC1_ADCMUX_MASK;
-
-	/* kill ratiometric, but enable ACCSW biasing */
-	pcf50633_reg_write(pcf, PCF50633_REG_ADCC2, 0x00);
-	pcf50633_reg_write(pcf, PCF50633_REG_ADCC3, 0x01);
-
-	/* start ADC conversion on selected channel */
-	pcf50633_reg_write(pcf, PCF50633_REG_ADCC1, channel | avg |
-		    PCF50633_ADCC1_ADCSTART | PCF50633_ADCC1_RES_10BIT);
-}
-
-static void trigger_next_adc_job_if_any(struct pcf50633 *pcf)
-{
-	struct pcf50633_adc *adc = __to_adc(pcf);
-	int head;
-
-	head = adc->queue_head;
-
-	if (!adc->queue[head])
-		return;
-
-	adc_setup(pcf, adc->queue[head]->mux, adc->queue[head]->avg);
-}
-
-static int
-adc_enqueue_request(struct pcf50633 *pcf, struct pcf50633_adc_request *req)
-{
-	struct pcf50633_adc *adc = __to_adc(pcf);
-	int head, tail;
-
-	mutex_lock(&adc->queue_mutex);
-
-	head = adc->queue_head;
-	tail = adc->queue_tail;
-
-	if (adc->queue[tail]) {
-		mutex_unlock(&adc->queue_mutex);
-		dev_err(pcf->dev, "ADC queue is full, dropping request\n");
-		return -EBUSY;
-	}
-
-	adc->queue[tail] = req;
-	if (head == tail)
-		trigger_next_adc_job_if_any(pcf);
-	adc->queue_tail = (tail + 1) & (PCF50633_MAX_ADC_FIFO_DEPTH - 1);
-
-	mutex_unlock(&adc->queue_mutex);
-
-	return 0;
-}
-
-static void pcf50633_adc_sync_read_callback(struct pcf50633 *pcf, void *param,
-	int result)
-{
-	struct pcf50633_adc_sync_request *req = param;
-
-	req->result = result;
-	complete(&req->completion);
-}
-
-int pcf50633_adc_sync_read(struct pcf50633 *pcf, int mux, int avg)
-{
-	struct pcf50633_adc_sync_request req;
-	int ret;
-
-	init_completion(&req.completion);
-
-	ret = pcf50633_adc_async_read(pcf, mux, avg,
-		pcf50633_adc_sync_read_callback, &req);
-	if (ret)
-		return ret;
-
-	wait_for_completion(&req.completion);
-
-	return req.result;
-}
-EXPORT_SYMBOL_GPL(pcf50633_adc_sync_read);
-
-int pcf50633_adc_async_read(struct pcf50633 *pcf, int mux, int avg,
-			     void (*callback)(struct pcf50633 *, void *, int),
-			     void *callback_param)
-{
-	struct pcf50633_adc_request *req;
-	int ret;
-
-	/* req is freed when the result is ready, in interrupt handler */
-	req = kmalloc(sizeof(*req), GFP_KERNEL);
-	if (!req)
-		return -ENOMEM;
-
-	req->mux = mux;
-	req->avg = avg;
-	req->callback = callback;
-	req->callback_param = callback_param;
-
-	ret = adc_enqueue_request(pcf, req);
-	if (ret)
-		kfree(req);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pcf50633_adc_async_read);
-
-static int adc_result(struct pcf50633 *pcf)
-{
-	u8 adcs1, adcs3;
-	u16 result;
-
-	adcs1 = pcf50633_reg_read(pcf, PCF50633_REG_ADCS1);
-	adcs3 = pcf50633_reg_read(pcf, PCF50633_REG_ADCS3);
-	result = (adcs1 << 2) | (adcs3 & PCF50633_ADCS3_ADCDAT1L_MASK);
-
-	dev_dbg(pcf->dev, "adc result = %d\n", result);
-
-	return result;
-}
-
-static void pcf50633_adc_irq(int irq, void *data)
-{
-	struct pcf50633_adc *adc = data;
-	struct pcf50633 *pcf = adc->pcf;
-	struct pcf50633_adc_request *req;
-	int head, res;
-
-	mutex_lock(&adc->queue_mutex);
-	head = adc->queue_head;
-
-	req = adc->queue[head];
-	if (WARN_ON(!req)) {
-		dev_err(pcf->dev, "pcf50633-adc irq: ADC queue empty!\n");
-		mutex_unlock(&adc->queue_mutex);
-		return;
-	}
-	adc->queue[head] = NULL;
-	adc->queue_head = (head + 1) &
-				      (PCF50633_MAX_ADC_FIFO_DEPTH - 1);
-
-	res = adc_result(pcf);
-	trigger_next_adc_job_if_any(pcf);
-
-	mutex_unlock(&adc->queue_mutex);
-
-	req->callback(pcf, req->callback_param, res);
-	kfree(req);
-}
-
-static int pcf50633_adc_probe(struct platform_device *pdev)
-{
-	struct pcf50633_adc *adc;
-
-	adc = devm_kzalloc(&pdev->dev, sizeof(*adc), GFP_KERNEL);
-	if (!adc)
-		return -ENOMEM;
-
-	adc->pcf = dev_to_pcf50633(pdev->dev.parent);
-	platform_set_drvdata(pdev, adc);
-
-	pcf50633_register_irq(adc->pcf, PCF50633_IRQ_ADCRDY,
-					pcf50633_adc_irq, adc);
-
-	mutex_init(&adc->queue_mutex);
-
-	return 0;
-}
-
-static void pcf50633_adc_remove(struct platform_device *pdev)
-{
-	struct pcf50633_adc *adc = platform_get_drvdata(pdev);
-	int i, head;
-
-	pcf50633_free_irq(adc->pcf, PCF50633_IRQ_ADCRDY);
-
-	mutex_lock(&adc->queue_mutex);
-	head = adc->queue_head;
-
-	if (WARN_ON(adc->queue[head]))
-		dev_err(adc->pcf->dev,
-			"adc driver removed with request pending\n");
-
-	for (i = 0; i < PCF50633_MAX_ADC_FIFO_DEPTH; i++)
-		kfree(adc->queue[i]);
-
-	mutex_unlock(&adc->queue_mutex);
-}
-
-static struct platform_driver pcf50633_adc_driver = {
-	.driver = {
-		.name = "pcf50633-adc",
-	},
-	.probe = pcf50633_adc_probe,
-	.remove = pcf50633_adc_remove,
-};
-
-module_platform_driver(pcf50633_adc_driver);
-
-MODULE_AUTHOR("Balaji Rao <balajirrao@openmoko.org>");
-MODULE_DESCRIPTION("PCF50633 adc driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pcf50633-adc");
-
diff --git a/include/linux/mfd/pcf50633/adc.h b/include/linux/mfd/pcf50633/adc.h
deleted file mode 100644
index 6a81896d4889..000000000000
--- a/include/linux/mfd/pcf50633/adc.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * adc.h  -- Driver for NXP PCF50633 ADC
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * All rights reserved.
- */
-
-#ifndef __LINUX_MFD_PCF50633_ADC_H
-#define __LINUX_MFD_PCF50633_ADC_H
-
-#include <linux/mfd/pcf50633/core.h>
-#include <linux/platform_device.h>
-
-/* ADC Registers */
-#define PCF50633_REG_ADCC3		0x52
-#define PCF50633_REG_ADCC2		0x53
-#define PCF50633_REG_ADCC1		0x54
-#define PCF50633_REG_ADCS1		0x55
-#define PCF50633_REG_ADCS2		0x56
-#define PCF50633_REG_ADCS3		0x57
-
-#define PCF50633_ADCC1_ADCSTART		0x01
-#define PCF50633_ADCC1_RES_8BIT		0x02
-#define PCF50633_ADCC1_RES_10BIT	0x00
-#define PCF50633_ADCC1_AVERAGE_NO	0x00
-#define PCF50633_ADCC1_AVERAGE_4	0x04
-#define PCF50633_ADCC1_AVERAGE_8	0x08
-#define PCF50633_ADCC1_AVERAGE_16	0x0c
-#define PCF50633_ADCC1_MUX_BATSNS_RES	0x00
-#define PCF50633_ADCC1_MUX_BATSNS_SUBTR	0x10
-#define PCF50633_ADCC1_MUX_ADCIN2_RES	0x20
-#define PCF50633_ADCC1_MUX_ADCIN2_SUBTR	0x30
-#define PCF50633_ADCC1_MUX_BATTEMP	0x60
-#define PCF50633_ADCC1_MUX_ADCIN1	0x70
-#define PCF50633_ADCC1_AVERAGE_MASK	0x0c
-#define PCF50633_ADCC1_ADCMUX_MASK	0xf0
-
-#define PCF50633_ADCC2_RATIO_NONE	0x00
-#define PCF50633_ADCC2_RATIO_BATTEMP	0x01
-#define PCF50633_ADCC2_RATIO_ADCIN1	0x02
-#define PCF50633_ADCC2_RATIO_BOTH	0x03
-#define PCF50633_ADCC2_RATIOSETTL_100US 0x04
-
-#define PCF50633_ADCC3_ACCSW_EN		0x01
-#define PCF50633_ADCC3_NTCSW_EN		0x04
-#define PCF50633_ADCC3_RES_DIV_TWO	0x10
-#define PCF50633_ADCC3_RES_DIV_THREE	0x00
-
-#define PCF50633_ADCS3_REF_NTCSW	0x00
-#define PCF50633_ADCS3_REF_ACCSW	0x10
-#define PCF50633_ADCS3_REF_2V0		0x20
-#define PCF50633_ADCS3_REF_VISA		0x30
-#define PCF50633_ADCS3_REF_2V0_2	0x70
-#define PCF50633_ADCS3_ADCRDY		0x80
-
-#define PCF50633_ADCS3_ADCDAT1L_MASK	0x03
-#define PCF50633_ADCS3_ADCDAT2L_MASK	0x0c
-#define PCF50633_ADCS3_ADCDAT2L_SHIFT	2
-#define PCF50633_ASCS3_REF_MASK		0x70
-
-extern int
-pcf50633_adc_async_read(struct pcf50633 *pcf, int mux, int avg,
-		void (*callback)(struct pcf50633 *, void *, int),
-		void *callback_param);
-extern int
-pcf50633_adc_sync_read(struct pcf50633 *pcf, int mux, int avg);
-
-#endif /* __LINUX_PCF50633_ADC_H */
-- 
2.48.1

