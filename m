Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A386A58797
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 20:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EB010E240;
	Sun,  9 Mar 2025 19:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="F4kjb4EE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6051A10E240
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 19:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=erRt1dDovuWfENR1VnHCG3XdvUtOnZZH7N7b29g9rI8=; b=F4kjb4EEQxxRY9FT
 GnbL4i/3Okwhv/lRSjX7UNDtpnO4ii47EtOWtg66/L5y46f+AU5zhe8qEQPHKi60Sp0PwNIk0SIph
 jrjQAcuznkEWJ7hzu69xeBjU+w935GinFXb21mm7kI/1CoqAUz6CcFcLKEqQ67V/ZutajRk8CFfuy
 bNh/LLCcWW5Cx6y1KJDo46LOXqpo5llO57ZDNEYrS6Oubx5vefcQQij/A1vNQsmIhPVLEKALb89Rv
 C8zTwIsw+Y+B+Qg/gvyFG/VIDyB6Fx+XWNh/hHMb5ya8sB0i8FsW4FPTruZm3F7MN4uptbteH6Em9
 XMcbPaGoKty5LZy6XQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1trMRx-003kFU-1K;
 Sun, 09 Mar 2025 19:36:37 +0000
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
Subject: [PATCH 3/9] rtc: pcf50633: Remove
Date: Sun,  9 Mar 2025 19:36:06 +0000
Message-ID: <20250309193612.251929-4-linux@treblig.org>
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
 drivers/mfd/pcf50633-core.c       |   2 -
 drivers/rtc/Kconfig               |   7 -
 drivers/rtc/Makefile              |   1 -
 drivers/rtc/rtc-pcf50633.c        | 284 ------------------------------
 include/linux/mfd/pcf50633/core.h |   1 -
 5 files changed, 295 deletions(-)
 delete mode 100644 drivers/rtc/rtc-pcf50633.c

diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
index 08aa68ef2fbc..d991a77f6dd2 100644
--- a/drivers/mfd/pcf50633-core.c
+++ b/drivers/mfd/pcf50633-core.c
@@ -208,7 +208,6 @@ static int pcf50633_probe(struct i2c_client *client)
 
 	/* Create sub devices */
 	pcf50633_client_dev_register(pcf, "pcf50633-input", &pcf->input_pdev);
-	pcf50633_client_dev_register(pcf, "pcf50633-rtc", &pcf->rtc_pdev);
 	pcf50633_client_dev_register(pcf, "pcf50633-mbc", &pcf->mbc_pdev);
 
 
@@ -259,7 +258,6 @@ static void pcf50633_remove(struct i2c_client *client)
 	pcf50633_irq_free(pcf);
 
 	platform_device_unregister(pcf->input_pdev);
-	platform_device_unregister(pcf->rtc_pdev);
 	platform_device_unregister(pcf->mbc_pdev);
 
 	for (i = 0; i < PCF50633_NUM_REGULATORS; i++)
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0bbbf778ecfa..838bdc138ffe 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1321,13 +1321,6 @@ config RTC_DRV_SPEAR
 	 If you say Y here you will get support for the RTC found on
 	 spear
 
-config RTC_DRV_PCF50633
-	depends on MFD_PCF50633
-	tristate "NXP PCF50633 RTC"
-	help
-	  If you say yes here you get support for the RTC subsystem of the
-	  NXP PCF50633 used in embedded systems.
-
 config RTC_DRV_AB8500
 	tristate "ST-Ericsson AB8500 RTC"
 	depends on AB8500_CORE
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 489b4ab07068..31473b3276d9 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -126,7 +126,6 @@ obj-$(CONFIG_RTC_DRV_PALMAS)	+= rtc-palmas.o
 obj-$(CONFIG_RTC_DRV_PCAP)	+= rtc-pcap.o
 obj-$(CONFIG_RTC_DRV_PCF2123)	+= rtc-pcf2123.o
 obj-$(CONFIG_RTC_DRV_PCF2127)	+= rtc-pcf2127.o
-obj-$(CONFIG_RTC_DRV_PCF50633)	+= rtc-pcf50633.o
 obj-$(CONFIG_RTC_DRV_PCF85063)	+= rtc-pcf85063.o
 obj-$(CONFIG_RTC_DRV_PCF8523)	+= rtc-pcf8523.o
 obj-$(CONFIG_RTC_DRV_PCF85363)	+= rtc-pcf85363.o
diff --git a/drivers/rtc/rtc-pcf50633.c b/drivers/rtc/rtc-pcf50633.c
deleted file mode 100644
index c019c4d91c7d..000000000000
--- a/drivers/rtc/rtc-pcf50633.c
+++ /dev/null
@@ -1,284 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 RTC Driver
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
-#include <linux/init.h>
-#include <linux/device.h>
-#include <linux/slab.h>
-#include <linux/platform_device.h>
-#include <linux/rtc.h>
-#include <linux/bcd.h>
-#include <linux/err.h>
-
-#include <linux/mfd/pcf50633/core.h>
-
-#define PCF50633_REG_RTCSC	0x59 /* Second */
-#define PCF50633_REG_RTCMN	0x5a /* Minute */
-#define PCF50633_REG_RTCHR	0x5b /* Hour */
-#define PCF50633_REG_RTCWD	0x5c /* Weekday */
-#define PCF50633_REG_RTCDT	0x5d /* Day */
-#define PCF50633_REG_RTCMT	0x5e /* Month */
-#define PCF50633_REG_RTCYR	0x5f /* Year */
-#define PCF50633_REG_RTCSCA	0x60 /* Alarm Second */
-#define PCF50633_REG_RTCMNA	0x61 /* Alarm Minute */
-#define PCF50633_REG_RTCHRA	0x62 /* Alarm Hour */
-#define PCF50633_REG_RTCWDA	0x63 /* Alarm Weekday */
-#define PCF50633_REG_RTCDTA	0x64 /* Alarm Day */
-#define PCF50633_REG_RTCMTA	0x65 /* Alarm Month */
-#define PCF50633_REG_RTCYRA	0x66 /* Alarm Year */
-
-enum pcf50633_time_indexes {
-	PCF50633_TI_SEC,
-	PCF50633_TI_MIN,
-	PCF50633_TI_HOUR,
-	PCF50633_TI_WKDAY,
-	PCF50633_TI_DAY,
-	PCF50633_TI_MONTH,
-	PCF50633_TI_YEAR,
-	PCF50633_TI_EXTENT /* always last */
-};
-
-struct pcf50633_time {
-	u_int8_t time[PCF50633_TI_EXTENT];
-};
-
-struct pcf50633_rtc {
-	int alarm_enabled;
-	int alarm_pending;
-
-	struct pcf50633 *pcf;
-	struct rtc_device *rtc_dev;
-};
-
-static void pcf2rtc_time(struct rtc_time *rtc, struct pcf50633_time *pcf)
-{
-	rtc->tm_sec = bcd2bin(pcf->time[PCF50633_TI_SEC]);
-	rtc->tm_min = bcd2bin(pcf->time[PCF50633_TI_MIN]);
-	rtc->tm_hour = bcd2bin(pcf->time[PCF50633_TI_HOUR]);
-	rtc->tm_wday = bcd2bin(pcf->time[PCF50633_TI_WKDAY]);
-	rtc->tm_mday = bcd2bin(pcf->time[PCF50633_TI_DAY]);
-	rtc->tm_mon = bcd2bin(pcf->time[PCF50633_TI_MONTH]) - 1;
-	rtc->tm_year = bcd2bin(pcf->time[PCF50633_TI_YEAR]) + 100;
-}
-
-static void rtc2pcf_time(struct pcf50633_time *pcf, struct rtc_time *rtc)
-{
-	pcf->time[PCF50633_TI_SEC] = bin2bcd(rtc->tm_sec);
-	pcf->time[PCF50633_TI_MIN] = bin2bcd(rtc->tm_min);
-	pcf->time[PCF50633_TI_HOUR] = bin2bcd(rtc->tm_hour);
-	pcf->time[PCF50633_TI_WKDAY] = bin2bcd(rtc->tm_wday);
-	pcf->time[PCF50633_TI_DAY] = bin2bcd(rtc->tm_mday);
-	pcf->time[PCF50633_TI_MONTH] = bin2bcd(rtc->tm_mon + 1);
-	pcf->time[PCF50633_TI_YEAR] = bin2bcd(rtc->tm_year % 100);
-}
-
-static int
-pcf50633_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
-{
-	struct pcf50633_rtc *rtc = dev_get_drvdata(dev);
-	int err;
-
-	if (enabled)
-		err = pcf50633_irq_unmask(rtc->pcf, PCF50633_IRQ_ALARM);
-	else
-		err = pcf50633_irq_mask(rtc->pcf, PCF50633_IRQ_ALARM);
-
-	if (err < 0)
-		return err;
-
-	rtc->alarm_enabled = enabled;
-
-	return 0;
-}
-
-static int pcf50633_rtc_read_time(struct device *dev, struct rtc_time *tm)
-{
-	struct pcf50633_rtc *rtc;
-	struct pcf50633_time pcf_tm;
-	int ret;
-
-	rtc = dev_get_drvdata(dev);
-
-	ret = pcf50633_read_block(rtc->pcf, PCF50633_REG_RTCSC,
-					    PCF50633_TI_EXTENT,
-					    &pcf_tm.time[0]);
-	if (ret != PCF50633_TI_EXTENT) {
-		dev_err(dev, "Failed to read time\n");
-		return -EIO;
-	}
-
-	dev_dbg(dev, "PCF_TIME: %02x.%02x.%02x %02x:%02x:%02x\n",
-		pcf_tm.time[PCF50633_TI_DAY],
-		pcf_tm.time[PCF50633_TI_MONTH],
-		pcf_tm.time[PCF50633_TI_YEAR],
-		pcf_tm.time[PCF50633_TI_HOUR],
-		pcf_tm.time[PCF50633_TI_MIN],
-		pcf_tm.time[PCF50633_TI_SEC]);
-
-	pcf2rtc_time(tm, &pcf_tm);
-
-	dev_dbg(dev, "RTC_TIME: %ptRr\n", tm);
-
-	return 0;
-}
-
-static int pcf50633_rtc_set_time(struct device *dev, struct rtc_time *tm)
-{
-	struct pcf50633_rtc *rtc;
-	struct pcf50633_time pcf_tm;
-	int alarm_masked, ret = 0;
-
-	rtc = dev_get_drvdata(dev);
-
-	dev_dbg(dev, "RTC_TIME: %ptRr\n", tm);
-
-	rtc2pcf_time(&pcf_tm, tm);
-
-	dev_dbg(dev, "PCF_TIME: %02x.%02x.%02x %02x:%02x:%02x\n",
-		pcf_tm.time[PCF50633_TI_DAY],
-		pcf_tm.time[PCF50633_TI_MONTH],
-		pcf_tm.time[PCF50633_TI_YEAR],
-		pcf_tm.time[PCF50633_TI_HOUR],
-		pcf_tm.time[PCF50633_TI_MIN],
-		pcf_tm.time[PCF50633_TI_SEC]);
-
-
-	alarm_masked = pcf50633_irq_mask_get(rtc->pcf, PCF50633_IRQ_ALARM);
-
-	if (!alarm_masked)
-		pcf50633_irq_mask(rtc->pcf, PCF50633_IRQ_ALARM);
-
-	/* Returns 0 on success */
-	ret = pcf50633_write_block(rtc->pcf, PCF50633_REG_RTCSC,
-					     PCF50633_TI_EXTENT,
-					     &pcf_tm.time[0]);
-
-	if (!alarm_masked)
-		pcf50633_irq_unmask(rtc->pcf, PCF50633_IRQ_ALARM);
-
-	return ret;
-}
-
-static int pcf50633_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	struct pcf50633_rtc *rtc;
-	struct pcf50633_time pcf_tm;
-	int ret = 0;
-
-	rtc = dev_get_drvdata(dev);
-
-	alrm->enabled = rtc->alarm_enabled;
-	alrm->pending = rtc->alarm_pending;
-
-	ret = pcf50633_read_block(rtc->pcf, PCF50633_REG_RTCSCA,
-				PCF50633_TI_EXTENT, &pcf_tm.time[0]);
-	if (ret != PCF50633_TI_EXTENT) {
-		dev_err(dev, "Failed to read time\n");
-		return -EIO;
-	}
-
-	pcf2rtc_time(&alrm->time, &pcf_tm);
-
-	return rtc_valid_tm(&alrm->time);
-}
-
-static int pcf50633_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	struct pcf50633_rtc *rtc;
-	struct pcf50633_time pcf_tm;
-	int alarm_masked, ret = 0;
-
-	rtc = dev_get_drvdata(dev);
-
-	rtc2pcf_time(&pcf_tm, &alrm->time);
-
-	/* do like mktime does and ignore tm_wday */
-	pcf_tm.time[PCF50633_TI_WKDAY] = 7;
-
-	alarm_masked = pcf50633_irq_mask_get(rtc->pcf, PCF50633_IRQ_ALARM);
-
-	/* disable alarm interrupt */
-	if (!alarm_masked)
-		pcf50633_irq_mask(rtc->pcf, PCF50633_IRQ_ALARM);
-
-	/* Returns 0 on success */
-	ret = pcf50633_write_block(rtc->pcf, PCF50633_REG_RTCSCA,
-				PCF50633_TI_EXTENT, &pcf_tm.time[0]);
-	if (!alrm->enabled)
-		rtc->alarm_pending = 0;
-
-	if (!alarm_masked || alrm->enabled)
-		pcf50633_irq_unmask(rtc->pcf, PCF50633_IRQ_ALARM);
-	rtc->alarm_enabled = alrm->enabled;
-
-	return ret;
-}
-
-static const struct rtc_class_ops pcf50633_rtc_ops = {
-	.read_time		= pcf50633_rtc_read_time,
-	.set_time		= pcf50633_rtc_set_time,
-	.read_alarm		= pcf50633_rtc_read_alarm,
-	.set_alarm		= pcf50633_rtc_set_alarm,
-	.alarm_irq_enable	= pcf50633_rtc_alarm_irq_enable,
-};
-
-static void pcf50633_rtc_irq(int irq, void *data)
-{
-	struct pcf50633_rtc *rtc = data;
-
-	rtc_update_irq(rtc->rtc_dev, 1, RTC_AF | RTC_IRQF);
-	rtc->alarm_pending = 1;
-}
-
-static int pcf50633_rtc_probe(struct platform_device *pdev)
-{
-	struct pcf50633_rtc *rtc;
-
-	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
-	if (!rtc)
-		return -ENOMEM;
-
-	rtc->pcf = dev_to_pcf50633(pdev->dev.parent);
-	platform_set_drvdata(pdev, rtc);
-	rtc->rtc_dev = devm_rtc_device_register(&pdev->dev, "pcf50633-rtc",
-				&pcf50633_rtc_ops, THIS_MODULE);
-
-	if (IS_ERR(rtc->rtc_dev))
-		return PTR_ERR(rtc->rtc_dev);
-
-	pcf50633_register_irq(rtc->pcf, PCF50633_IRQ_ALARM,
-					pcf50633_rtc_irq, rtc);
-	return 0;
-}
-
-static void pcf50633_rtc_remove(struct platform_device *pdev)
-{
-	struct pcf50633_rtc *rtc;
-
-	rtc = platform_get_drvdata(pdev);
-	pcf50633_free_irq(rtc->pcf, PCF50633_IRQ_ALARM);
-}
-
-static struct platform_driver pcf50633_rtc_driver = {
-	.driver = {
-		.name = "pcf50633-rtc",
-	},
-	.probe = pcf50633_rtc_probe,
-	.remove = pcf50633_rtc_remove,
-};
-
-module_platform_driver(pcf50633_rtc_driver);
-
-MODULE_DESCRIPTION("PCF50633 RTC driver");
-MODULE_AUTHOR("Balaji Rao <balajirrao@openmoko.org>");
-MODULE_LICENSE("GPL");
-
diff --git a/include/linux/mfd/pcf50633/core.h b/include/linux/mfd/pcf50633/core.h
index 42e0412fa98f..f5ab3e64c230 100644
--- a/include/linux/mfd/pcf50633/core.h
+++ b/include/linux/mfd/pcf50633/core.h
@@ -146,7 +146,6 @@ struct pcf50633 {
 
 	int onkey1s_held;
 
-	struct platform_device *rtc_pdev;
 	struct platform_device *mbc_pdev;
 	struct platform_device *input_pdev;
 	struct platform_device *regulator_pdev[PCF50633_NUM_REGULATORS];
-- 
2.48.1

