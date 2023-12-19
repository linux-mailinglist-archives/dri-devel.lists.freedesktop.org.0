Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC9A8192CF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00C310E503;
	Tue, 19 Dec 2023 22:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89D210E2F7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B2675614F0;
 Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2DB6C116D3;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023396;
 bh=QnND/gGVLF0OcIynd0NzBifJ9tXmmVVguZf1/YrvZlE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=IbLmhewLtb9NgYTBXxk9+pJ6F6O7GDiEkdRt39Jr3Df9jR9SdrXxyQiv/YFppNq+/
 qwFsyX/0MfmyGAgH36Wy2pPGzJmTw+teedQBNRERXZ4W2rWDObtonhM+AMv2Yao+d1
 yR82N7tifL04Y9kaq3FOQgGk85CTuE1Z1MXlZDn0aBstvd+3uHDrAbCpG8CeC5uGOE
 PAlpjf/C6trNHTxOyV1Y48Wd8Yk19tXOEaVEH1YdO4PBYyLoGbpmDu8MET/fIalXty
 Ag+55/7cM5j2c8RgEJjXtkktAop2o3eIT/v1eDJRAtW9rUJCRPm+rWMqIvGk3aOUaK
 ixrWwmUQ4z4XQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A1F18C46CD8;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:31 +0100
Subject: [PATCH 26/27] sbus: char: Drop now unused uctrl driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-26-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=13722;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=21mOYM4NXXv1JubhTtkzgWKnjnePccKISVDYYRtLAHM=; =?utf-8?q?b=3Da8Qe94bhAct6?=
 =?utf-8?q?6WlqV9dEh8/bwMD/3XMBirbscfDOp5PFd9jkoKkZv6zyzdaM5huRLWpwci0D96L4?=
 2XW50tqDACwSfIRbQKO9Ax+KTn2XDF1zi8+EFnR2k6wbfPMiJ3/j
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

The uctrl driver is only relevant for the Sparcbook 3 machine,
and with sun4m support removed this driver is no logner relevant.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 drivers/sbus/char/Kconfig  |   8 -
 drivers/sbus/char/Makefile |   1 -
 drivers/sbus/char/uctrl.c  | 435 ---------------------------------------------
 3 files changed, 444 deletions(-)

diff --git a/drivers/sbus/char/Kconfig b/drivers/sbus/char/Kconfig
index 7c0a308e4959..8b80abc554ed 100644
--- a/drivers/sbus/char/Kconfig
+++ b/drivers/sbus/char/Kconfig
@@ -21,14 +21,6 @@ config OBP_FLASH
 	  The OpenBoot PROM on Ultra systems is flashable. If you want to be
 	  able to upgrade the OBP firmware, say Y here.
 
-config TADPOLE_TS102_UCTRL
-	tristate "Tadpole TS102 Microcontroller support"
-	help
-	  Say Y here to directly support the TS102 Microcontroller interface
-	  on the Tadpole Sparcbook 3.  This device handles power-management
-	  events, and can also notice the attachment/detachment of external
-	  monitors and mice.
-
 config BBC_I2C
 	tristate "UltraSPARC-III bootbus i2c controller driver"
 	depends on PCI && SPARC64
diff --git a/drivers/sbus/char/Makefile b/drivers/sbus/char/Makefile
index 44347c918f6b..9db2faabfae8 100644
--- a/drivers/sbus/char/Makefile
+++ b/drivers/sbus/char/Makefile
@@ -14,6 +14,5 @@ obj-$(CONFIG_ENVCTRL)			+= envctrl.o
 obj-$(CONFIG_DISPLAY7SEG)		+= display7seg.o
 obj-$(CONFIG_OBP_FLASH)			+= flash.o
 obj-$(CONFIG_SUN_OPENPROMIO)		+= openprom.o
-obj-$(CONFIG_TADPOLE_TS102_UCTRL)	+= uctrl.o
 obj-$(CONFIG_BBC_I2C)			+= bbc.o
 obj-$(CONFIG_ORACLE_DAX) 		+= oradax.o
diff --git a/drivers/sbus/char/uctrl.c b/drivers/sbus/char/uctrl.c
deleted file mode 100644
index 0660425e3a5a..000000000000
--- a/drivers/sbus/char/uctrl.c
+++ /dev/null
@@ -1,435 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* uctrl.c: TS102 Microcontroller interface on Tadpole Sparcbook 3
- *
- * Copyright 1999 Derrick J Brashear (shadow@dementia.org)
- * Copyright 2008 David S. Miller (davem@davemloft.net)
- */
-
-#include <linux/module.h>
-#include <linux/errno.h>
-#include <linux/delay.h>
-#include <linux/interrupt.h>
-#include <linux/slab.h>
-#include <linux/mutex.h>
-#include <linux/ioport.h>
-#include <linux/miscdevice.h>
-#include <linux/mm.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-
-#include <asm/openprom.h>
-#include <asm/oplib.h>
-#include <asm/irq.h>
-#include <asm/io.h>
-
-#define DEBUG 1
-#ifdef DEBUG
-#define dprintk(x) printk x
-#else
-#define dprintk(x)
-#endif
-
-struct uctrl_regs {
-	u32 uctrl_intr;
-	u32 uctrl_data;
-	u32 uctrl_stat;
-	u32 uctrl_xxx[5];
-};
-
-struct ts102_regs {
-	u32 card_a_intr;
-	u32 card_a_stat;
-	u32 card_a_ctrl;
-	u32 card_a_xxx;
-	u32 card_b_intr;
-	u32 card_b_stat;
-	u32 card_b_ctrl;
-	u32 card_b_xxx;
-	u32 uctrl_intr;
-	u32 uctrl_data;
-	u32 uctrl_stat;
-	u32 uctrl_xxx;
-	u32 ts102_xxx[4];
-};
-
-/* Bits for uctrl_intr register */
-#define UCTRL_INTR_TXE_REQ         0x01    /* transmit FIFO empty int req */
-#define UCTRL_INTR_TXNF_REQ        0x02    /* transmit FIFO not full int req */
-#define UCTRL_INTR_RXNE_REQ        0x04    /* receive FIFO not empty int req */
-#define UCTRL_INTR_RXO_REQ         0x08    /* receive FIFO overflow int req */
-#define UCTRL_INTR_TXE_MSK         0x10    /* transmit FIFO empty mask */
-#define UCTRL_INTR_TXNF_MSK        0x20    /* transmit FIFO not full mask */
-#define UCTRL_INTR_RXNE_MSK        0x40    /* receive FIFO not empty mask */
-#define UCTRL_INTR_RXO_MSK         0x80    /* receive FIFO overflow mask */
-
-/* Bits for uctrl_stat register */
-#define UCTRL_STAT_TXE_STA         0x01    /* transmit FIFO empty status */
-#define UCTRL_STAT_TXNF_STA        0x02    /* transmit FIFO not full status */
-#define UCTRL_STAT_RXNE_STA        0x04    /* receive FIFO not empty status */
-#define UCTRL_STAT_RXO_STA         0x08    /* receive FIFO overflow status */
-
-static DEFINE_MUTEX(uctrl_mutex);
-static const char *uctrl_extstatus[16] = {
-        "main power available",
-        "internal battery attached",
-        "external battery attached",
-        "external VGA attached",
-        "external keyboard attached",
-        "external mouse attached",
-        "lid down",
-        "internal battery currently charging",
-        "external battery currently charging",
-        "internal battery currently discharging",
-        "external battery currently discharging",
-};
-
-/* Everything required for one transaction with the uctrl */
-struct uctrl_txn {
-	u8 opcode;
-	u8 inbits;
-	u8 outbits;
-	u8 *inbuf;
-	u8 *outbuf;
-};
-
-struct uctrl_status {
-	u8 current_temp; /* 0x07 */
-	u8 reset_status; /* 0x0b */
-	u16 event_status; /* 0x0c */
-	u16 error_status; /* 0x10 */
-	u16 external_status; /* 0x11, 0x1b */
-	u8 internal_charge; /* 0x18 */
-	u8 external_charge; /* 0x19 */
-	u16 control_lcd; /* 0x20 */
-	u8 control_bitport; /* 0x21 */
-	u8 speaker_volume; /* 0x23 */
-	u8 control_tft_brightness; /* 0x24 */
-	u8 control_kbd_repeat_delay; /* 0x28 */
-	u8 control_kbd_repeat_period; /* 0x29 */
-	u8 control_screen_contrast; /* 0x2F */
-};
-
-enum uctrl_opcode {
-  READ_SERIAL_NUMBER=0x1,
-  READ_ETHERNET_ADDRESS=0x2,
-  READ_HARDWARE_VERSION=0x3,
-  READ_MICROCONTROLLER_VERSION=0x4,
-  READ_MAX_TEMPERATURE=0x5,
-  READ_MIN_TEMPERATURE=0x6,
-  READ_CURRENT_TEMPERATURE=0x7,
-  READ_SYSTEM_VARIANT=0x8,
-  READ_POWERON_CYCLES=0x9,
-  READ_POWERON_SECONDS=0xA,
-  READ_RESET_STATUS=0xB,
-  READ_EVENT_STATUS=0xC,
-  READ_REAL_TIME_CLOCK=0xD,
-  READ_EXTERNAL_VGA_PORT=0xE,
-  READ_MICROCONTROLLER_ROM_CHECKSUM=0xF,
-  READ_ERROR_STATUS=0x10,
-  READ_EXTERNAL_STATUS=0x11,
-  READ_USER_CONFIGURATION_AREA=0x12,
-  READ_MICROCONTROLLER_VOLTAGE=0x13,
-  READ_INTERNAL_BATTERY_VOLTAGE=0x14,
-  READ_DCIN_VOLTAGE=0x15,
-  READ_HORIZONTAL_POINTER_VOLTAGE=0x16,
-  READ_VERTICAL_POINTER_VOLTAGE=0x17,
-  READ_INTERNAL_BATTERY_CHARGE_LEVEL=0x18,
-  READ_EXTERNAL_BATTERY_CHARGE_LEVEL=0x19,
-  READ_REAL_TIME_CLOCK_ALARM=0x1A,
-  READ_EVENT_STATUS_NO_RESET=0x1B,
-  READ_INTERNAL_KEYBOARD_LAYOUT=0x1C,
-  READ_EXTERNAL_KEYBOARD_LAYOUT=0x1D,
-  READ_EEPROM_STATUS=0x1E,
-  CONTROL_LCD=0x20,
-  CONTROL_BITPORT=0x21,
-  SPEAKER_VOLUME=0x23,
-  CONTROL_TFT_BRIGHTNESS=0x24,
-  CONTROL_WATCHDOG=0x25,
-  CONTROL_FACTORY_EEPROM_AREA=0x26,
-  CONTROL_KBD_TIME_UNTIL_REPEAT=0x28,
-  CONTROL_KBD_TIME_BETWEEN_REPEATS=0x29,
-  CONTROL_TIMEZONE=0x2A,
-  CONTROL_MARK_SPACE_RATIO=0x2B,
-  CONTROL_DIAGNOSTIC_MODE=0x2E,
-  CONTROL_SCREEN_CONTRAST=0x2F,
-  RING_BELL=0x30,
-  SET_DIAGNOSTIC_STATUS=0x32,
-  CLEAR_KEY_COMBINATION_TABLE=0x33,
-  PERFORM_SOFTWARE_RESET=0x34,
-  SET_REAL_TIME_CLOCK=0x35,
-  RECALIBRATE_POINTING_STICK=0x36,
-  SET_BELL_FREQUENCY=0x37,
-  SET_INTERNAL_BATTERY_CHARGE_RATE=0x39,
-  SET_EXTERNAL_BATTERY_CHARGE_RATE=0x3A,
-  SET_REAL_TIME_CLOCK_ALARM=0x3B,
-  READ_EEPROM=0x40,
-  WRITE_EEPROM=0x41,
-  WRITE_TO_STATUS_DISPLAY=0x42,
-  DEFINE_SPECIAL_CHARACTER=0x43,
-  DEFINE_KEY_COMBINATION_ENTRY=0x50,
-  DEFINE_STRING_TABLE_ENTRY=0x51,
-  DEFINE_STATUS_SCREEN_DISPLAY=0x52,
-  PERFORM_EMU_COMMANDS=0x64,
-  READ_EMU_REGISTER=0x65,
-  WRITE_EMU_REGISTER=0x66,
-  READ_EMU_RAM=0x67,
-  WRITE_EMU_RAM=0x68,
-  READ_BQ_REGISTER=0x69,
-  WRITE_BQ_REGISTER=0x6A,
-  SET_USER_PASSWORD=0x70,
-  VERIFY_USER_PASSWORD=0x71,
-  GET_SYSTEM_PASSWORD_KEY=0x72,
-  VERIFY_SYSTEM_PASSWORD=0x73,
-  POWER_OFF=0x82,
-  POWER_RESTART=0x83,
-};
-
-static struct uctrl_driver {
-	struct uctrl_regs __iomem *regs;
-	int irq;
-	int pending;
-	struct uctrl_status status;
-} *global_driver;
-
-static void uctrl_get_event_status(struct uctrl_driver *);
-static void uctrl_get_external_status(struct uctrl_driver *);
-
-static long
-uctrl_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
-{
-	switch (cmd) {
-		default:
-			return -EINVAL;
-	}
-	return 0;
-}
-
-static int
-uctrl_open(struct inode *inode, struct file *file)
-{
-	mutex_lock(&uctrl_mutex);
-	uctrl_get_event_status(global_driver);
-	uctrl_get_external_status(global_driver);
-	mutex_unlock(&uctrl_mutex);
-	return 0;
-}
-
-static irqreturn_t uctrl_interrupt(int irq, void *dev_id)
-{
-	return IRQ_HANDLED;
-}
-
-static const struct file_operations uctrl_fops = {
-	.owner =	THIS_MODULE,
-	.llseek =	no_llseek,
-	.unlocked_ioctl =	uctrl_ioctl,
-	.open =		uctrl_open,
-};
-
-static struct miscdevice uctrl_dev = {
-	UCTRL_MINOR,
-	"uctrl",
-	&uctrl_fops
-};
-
-/* Wait for space to write, then write to it */
-#define WRITEUCTLDATA(value) \
-{ \
-  unsigned int i; \
-  for (i = 0; i < 10000; i++) { \
-      if (UCTRL_STAT_TXNF_STA & sbus_readl(&driver->regs->uctrl_stat)) \
-      break; \
-  } \
-  dprintk(("write data 0x%02x\n", value)); \
-  sbus_writel(value, &driver->regs->uctrl_data); \
-}
-
-/* Wait for something to read, read it, then clear the bit */
-#define READUCTLDATA(value) \
-{ \
-  unsigned int i; \
-  value = 0; \
-  for (i = 0; i < 10000; i++) { \
-      if ((UCTRL_STAT_RXNE_STA & sbus_readl(&driver->regs->uctrl_stat)) == 0) \
-      break; \
-    udelay(1); \
-  } \
-  value = sbus_readl(&driver->regs->uctrl_data); \
-  dprintk(("read data 0x%02x\n", value)); \
-  sbus_writel(UCTRL_STAT_RXNE_STA, &driver->regs->uctrl_stat); \
-}
-
-static void uctrl_do_txn(struct uctrl_driver *driver, struct uctrl_txn *txn)
-{
-	int stat, incnt, outcnt, bytecnt, intr;
-	u32 byte;
-
-	stat = sbus_readl(&driver->regs->uctrl_stat);
-	intr = sbus_readl(&driver->regs->uctrl_intr);
-	sbus_writel(stat, &driver->regs->uctrl_stat);
-
-	dprintk(("interrupt stat 0x%x int 0x%x\n", stat, intr));
-
-	incnt = txn->inbits;
-	outcnt = txn->outbits;
-	byte = (txn->opcode << 8);
-	WRITEUCTLDATA(byte);
-
-	bytecnt = 0;
-	while (incnt > 0) {
-		byte = (txn->inbuf[bytecnt] << 8);
-		WRITEUCTLDATA(byte);
-		incnt--;
-		bytecnt++;
-	}
-
-	/* Get the ack */
-	READUCTLDATA(byte);
-	dprintk(("ack was %x\n", (byte >> 8)));
-
-	bytecnt = 0;
-	while (outcnt > 0) {
-		READUCTLDATA(byte);
-		txn->outbuf[bytecnt] = (byte >> 8);
-		dprintk(("set byte to %02x\n", byte));
-		outcnt--;
-		bytecnt++;
-	}
-}
-
-static void uctrl_get_event_status(struct uctrl_driver *driver)
-{
-	struct uctrl_txn txn;
-	u8 outbits[2];
-
-	txn.opcode = READ_EVENT_STATUS;
-	txn.inbits = 0;
-	txn.outbits = 2;
-	txn.inbuf = NULL;
-	txn.outbuf = outbits;
-
-	uctrl_do_txn(driver, &txn);
-
-	dprintk(("bytes %x %x\n", (outbits[0] & 0xff), (outbits[1] & 0xff)));
-	driver->status.event_status = 
-		((outbits[0] & 0xff) << 8) | (outbits[1] & 0xff);
-	dprintk(("ev is %x\n", driver->status.event_status));
-}
-
-static void uctrl_get_external_status(struct uctrl_driver *driver)
-{
-	struct uctrl_txn txn;
-	u8 outbits[2];
-	int i, v;
-
-	txn.opcode = READ_EXTERNAL_STATUS;
-	txn.inbits = 0;
-	txn.outbits = 2;
-	txn.inbuf = NULL;
-	txn.outbuf = outbits;
-
-	uctrl_do_txn(driver, &txn);
-
-	dprintk(("bytes %x %x\n", (outbits[0] & 0xff), (outbits[1] & 0xff)));
-	driver->status.external_status = 
-		((outbits[0] * 256) + (outbits[1]));
-	dprintk(("ex is %x\n", driver->status.external_status));
-	v = driver->status.external_status;
-	for (i = 0; v != 0; i++, v >>= 1) {
-		if (v & 1) {
-			dprintk(("%s%s", " ", uctrl_extstatus[i]));
-		}
-	}
-	dprintk(("\n"));
-	
-}
-
-static int uctrl_probe(struct platform_device *op)
-{
-	struct uctrl_driver *p;
-	int err = -ENOMEM;
-
-	p = kzalloc(sizeof(*p), GFP_KERNEL);
-	if (!p) {
-		printk(KERN_ERR "uctrl: Unable to allocate device struct.\n");
-		goto out;
-	}
-
-	p->regs = of_ioremap(&op->resource[0], 0,
-			     resource_size(&op->resource[0]),
-			     "uctrl");
-	if (!p->regs) {
-		printk(KERN_ERR "uctrl: Unable to map registers.\n");
-		goto out_free;
-	}
-
-	p->irq = op->archdata.irqs[0];
-	err = request_irq(p->irq, uctrl_interrupt, 0, "uctrl", p);
-	if (err) {
-		printk(KERN_ERR "uctrl: Unable to register irq.\n");
-		goto out_iounmap;
-	}
-
-	err = misc_register(&uctrl_dev);
-	if (err) {
-		printk(KERN_ERR "uctrl: Unable to register misc device.\n");
-		goto out_free_irq;
-	}
-
-	sbus_writel(UCTRL_INTR_RXNE_REQ|UCTRL_INTR_RXNE_MSK, &p->regs->uctrl_intr);
-	printk(KERN_INFO "%pOF: uctrl regs[0x%p] (irq %d)\n",
-	       op->dev.of_node, p->regs, p->irq);
-	uctrl_get_event_status(p);
-	uctrl_get_external_status(p);
-
-	dev_set_drvdata(&op->dev, p);
-	global_driver = p;
-
-out:
-	return err;
-
-out_free_irq:
-	free_irq(p->irq, p);
-
-out_iounmap:
-	of_iounmap(&op->resource[0], p->regs, resource_size(&op->resource[0]));
-
-out_free:
-	kfree(p);
-	goto out;
-}
-
-static int uctrl_remove(struct platform_device *op)
-{
-	struct uctrl_driver *p = dev_get_drvdata(&op->dev);
-
-	if (p) {
-		misc_deregister(&uctrl_dev);
-		free_irq(p->irq, p);
-		of_iounmap(&op->resource[0], p->regs, resource_size(&op->resource[0]));
-		kfree(p);
-	}
-	return 0;
-}
-
-static const struct of_device_id uctrl_match[] = {
-	{
-		.name = "uctrl",
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, uctrl_match);
-
-static struct platform_driver uctrl_driver = {
-	.driver = {
-		.name = "uctrl",
-		.of_match_table = uctrl_match,
-	},
-	.probe		= uctrl_probe,
-	.remove		= uctrl_remove,
-};
-
-
-module_platform_driver(uctrl_driver);
-
-MODULE_LICENSE("GPL");

-- 
2.34.1

