Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC12A5B603
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 02:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC3110E0E2;
	Tue, 11 Mar 2025 01:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="J07cUTyb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93C810E4FD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=qNX/32/y/eek03+mO8Mcyd55EvyQ+nmtHunaLNtjVjw=; b=J07cUTybI7MRGCFw
 bs4k4SdQy0zNVMGTEG2dQ6FK0WVsgKJ2bjqsZdYTBdxdl3HFHUsDEWSsi1zbnJU/kIMap1MRMK9/B
 cIqHCX12yn1vzsaK2sWjAbhef4TekzCoHZpZE4SAwDTQDrCuWy/95U2WWUV9h24JGMR1xfMH0ySBk
 yEORO4BH1+6um2IIwoKPQUpNLdyfYKhvHg7klP/FblBkwfEFOtlRfJnfkZkRxtcIyX1IbmJ8q0cYx
 RoyvbpoLQs1S8HpV4TOlRjKzhzVuPht4mvgG573Iz/ovzNFDVxa65ihULACG086lEsz0juakGceq+
 DbKk9xc934zowK9fSw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1troks-0042n5-2c;
 Tue, 11 Mar 2025 01:50:02 +0000
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
Subject: [PATCH v2 4/9] Input: pcf50633-input - Remove
Date: Tue, 11 Mar 2025 01:49:54 +0000
Message-ID: <20250311014959.743322-5-linux@treblig.org>
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
 drivers/input/misc/Kconfig          |   7 --
 drivers/input/misc/Makefile         |   1 -
 drivers/input/misc/pcf50633-input.c | 113 ----------------------------
 3 files changed, 121 deletions(-)
 delete mode 100644 drivers/input/misc/pcf50633-input.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 13d135257e06..62819144bd8c 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -584,13 +584,6 @@ config INPUT_PALMAS_PWRBUTTON
 	  To compile this driver as a module, choose M here. The module will
 	  be called palmas_pwrbutton.
 
-config INPUT_PCF50633_PMU
-	tristate "PCF50633 PMU events"
-	depends on MFD_PCF50633
-	help
-	 Say Y to include support for delivering  PMU events via  input
-	 layer on NXP PCF50633.
-
 config INPUT_PCF8574
 	tristate "PCF8574 Keypad input device"
 	depends on I2C
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 6d91804d0a6f..d468c8140b93 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -59,7 +59,6 @@ obj-$(CONFIG_INPUT_MC13783_PWRBUTTON)	+= mc13783-pwrbutton.o
 obj-$(CONFIG_INPUT_MMA8450)		+= mma8450.o
 obj-$(CONFIG_INPUT_PALMAS_PWRBUTTON)	+= palmas-pwrbutton.o
 obj-$(CONFIG_INPUT_PCAP)		+= pcap_keys.o
-obj-$(CONFIG_INPUT_PCF50633_PMU)	+= pcf50633-input.o
 obj-$(CONFIG_INPUT_PCF8574)		+= pcf8574_keypad.o
 obj-$(CONFIG_INPUT_PCSPKR)		+= pcspkr.o
 obj-$(CONFIG_INPUT_PM8941_PWRKEY)	+= pm8941-pwrkey.o
diff --git a/drivers/input/misc/pcf50633-input.c b/drivers/input/misc/pcf50633-input.c
deleted file mode 100644
index 6d046e236ba6..000000000000
--- a/drivers/input/misc/pcf50633-input.c
+++ /dev/null
@@ -1,113 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 Input Driver
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * Author: Balaji Rao <balajirrao@openmoko.org>
- * All rights reserved.
- *
- * Broken down from monstrous PCF50633 driver mainly by
- * Harald Welte, Andy Green and Werner Almesberger
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/device.h>
-#include <linux/platform_device.h>
-#include <linux/input.h>
-#include <linux/slab.h>
-
-#include <linux/mfd/pcf50633/core.h>
-
-#define PCF50633_OOCSTAT_ONKEY	0x01
-#define PCF50633_REG_OOCSTAT	0x12
-#define PCF50633_REG_OOCMODE	0x10
-
-struct pcf50633_input {
-	struct pcf50633 *pcf;
-	struct input_dev *input_dev;
-};
-
-static void
-pcf50633_input_irq(int irq, void *data)
-{
-	struct pcf50633_input *input;
-	int onkey_released;
-
-	input = data;
-
-	/* We report only one event depending on the key press status */
-	onkey_released = pcf50633_reg_read(input->pcf, PCF50633_REG_OOCSTAT)
-						& PCF50633_OOCSTAT_ONKEY;
-
-	if (irq == PCF50633_IRQ_ONKEYF && !onkey_released)
-		input_report_key(input->input_dev, KEY_POWER, 1);
-	else if (irq == PCF50633_IRQ_ONKEYR && onkey_released)
-		input_report_key(input->input_dev, KEY_POWER, 0);
-
-	input_sync(input->input_dev);
-}
-
-static int pcf50633_input_probe(struct platform_device *pdev)
-{
-	struct pcf50633_input *input;
-	struct input_dev *input_dev;
-	int ret;
-
-
-	input = kzalloc(sizeof(*input), GFP_KERNEL);
-	if (!input)
-		return -ENOMEM;
-
-	input_dev = input_allocate_device();
-	if (!input_dev) {
-		kfree(input);
-		return -ENOMEM;
-	}
-
-	platform_set_drvdata(pdev, input);
-	input->pcf = dev_to_pcf50633(pdev->dev.parent);
-	input->input_dev = input_dev;
-
-	input_dev->name = "PCF50633 PMU events";
-	input_dev->id.bustype = BUS_I2C;
-	input_dev->evbit[0] = BIT(EV_KEY) | BIT(EV_PWR);
-	set_bit(KEY_POWER, input_dev->keybit);
-
-	ret = input_register_device(input_dev);
-	if (ret) {
-		input_free_device(input_dev);
-		kfree(input);
-		return ret;
-	}
-	pcf50633_register_irq(input->pcf, PCF50633_IRQ_ONKEYR,
-				pcf50633_input_irq, input);
-	pcf50633_register_irq(input->pcf, PCF50633_IRQ_ONKEYF,
-				pcf50633_input_irq, input);
-
-	return 0;
-}
-
-static void pcf50633_input_remove(struct platform_device *pdev)
-{
-	struct pcf50633_input *input  = platform_get_drvdata(pdev);
-
-	pcf50633_free_irq(input->pcf, PCF50633_IRQ_ONKEYR);
-	pcf50633_free_irq(input->pcf, PCF50633_IRQ_ONKEYF);
-
-	input_unregister_device(input->input_dev);
-	kfree(input);
-}
-
-static struct platform_driver pcf50633_input_driver = {
-	.driver = {
-		.name = "pcf50633-input",
-	},
-	.probe = pcf50633_input_probe,
-	.remove = pcf50633_input_remove,
-};
-module_platform_driver(pcf50633_input_driver);
-
-MODULE_AUTHOR("Balaji Rao <balajirrao@openmoko.org>");
-MODULE_DESCRIPTION("PCF50633 input driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pcf50633-input");
-- 
2.48.1

