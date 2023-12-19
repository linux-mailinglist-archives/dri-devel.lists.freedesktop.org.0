Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D4D8192D4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDA710E2C0;
	Tue, 19 Dec 2023 22:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CBE10E206
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 83F00614C7;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF230C43391;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023395;
 bh=i8P0wIY8MHNR0IMtWcJ3lmr2A2+O0+vGlp41TmDW9Ws=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=UUvylM7rIglGvj739qnp45YIczwIDgMAS6sj4ktXX+qZAcpZL9Jp1WoQr6g87GoMT
 pLUhCNvqCas0JWFfGHFTPAygsN3pkDyof2ZD0Ie1cnVS7fE4uG5xZWfbpciFCCK0r0
 X/+AcDWmp8fqzdAGPwGGogrZ/Yh62oz0c7A+S0BAUOJYmpfoytBo1c3tRFK1GCGhXK
 2oyRge7VChXNjdfCAYqNHhk+0E250TKp/K5PHy+efwk3TGep784q+1SrFcVi/YD1pG
 1F4waGytTQygWFsvPn1iiw2nuN703RGjG5ylwG1Bwj8/qSHLSms/M7YFWmzgFJONgq
 aeiEdjRwgQh9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 98D24C46CCD;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:10 +0100
Subject: [PATCH 05/27] sparc32: Drop sun specific power management drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-5-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=8689;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=fThpDz4+PMLtttr9htY2gCawX85PeqZND9L6UPVn/AU=; =?utf-8?q?b=3DOtsYhDQL2gfc?=
 =?utf-8?q?36sjUQEkqHM5Gpi2qOmZo9mUeeInVwO/EiodJOjzL2CLQ6HIKMCVVNmZbBU88Oyw?=
 1xqlbiSlCV4/vr/mH/KffmBQTiaOxktZzxxr8w0r28UXQfg8ZBhV
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

Drop the two sun specific apc and pmc drivers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/Kconfig         |   7 --
 arch/sparc/kernel/Makefile |   1 -
 arch/sparc/kernel/apc.c    | 196 ---------------------------------------------
 arch/sparc/kernel/pmc.c    | 100 -----------------------
 4 files changed, 304 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 1520f68e944a..55a9e67c482e 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -324,13 +324,6 @@ config CMDLINE
 
 	  NOTE: This option WILL override the PROM bootargs setting!
 
-config SUN_PM
-	bool
-	default y if SPARC32
-	help
-	  Enable power management and CPU standby features on supported
-	  SPARC platforms.
-
 config SERIAL_CONSOLE
 	bool
 	depends on SPARC32
diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index 95687af45d20..ab47823f8b4e 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -84,7 +84,6 @@ obj-$(CONFIG_SPARC32_SMP) += sun4m_smp.o sun4d_smp.o leon_smp.o
 obj-$(CONFIG_SPARC64_SMP) += hvtramp.o
 
 obj-y                     += auxio_$(BITS).o
-obj-$(CONFIG_SUN_PM)      += apc.o pmc.o
 
 obj-y                     += termios.o
 
diff --git a/arch/sparc/kernel/apc.c b/arch/sparc/kernel/apc.c
deleted file mode 100644
index d44725d37e30..000000000000
--- a/arch/sparc/kernel/apc.c
+++ /dev/null
@@ -1,196 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* apc - Driver implementation for power management functions
- * of Aurora Personality Chip (APC) on SPARCstation-4/5 and
- * derivatives.
- *
- * Copyright (c) 2002 Eric Brower (ebrower@usa.net)
- */
-
-#include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/miscdevice.h>
-#include <linux/pm.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/module.h>
-
-#include <asm/io.h>
-#include <asm/oplib.h>
-#include <linux/uaccess.h>
-#include <asm/auxio.h>
-#include <asm/apc.h>
-#include <asm/processor.h>
-
-/* Debugging
- * 
- * #define APC_DEBUG_LED
- */
-
-#define APC_MINOR	MISC_DYNAMIC_MINOR
-#define APC_OBPNAME	"power-management"
-#define APC_DEVNAME "apc"
-
-static u8 __iomem *regs;
-static int apc_no_idle = 0;
-
-#define apc_readb(offs)		(sbus_readb(regs+offs))
-#define apc_writeb(val, offs) 	(sbus_writeb(val, regs+offs))
-
-/* Specify "apc=noidle" on the kernel command line to 
- * disable APC CPU standby support.  Certain prototype
- * systems (SPARCstation-Fox) do not play well with APC
- * CPU idle, so disable this if your system has APC and 
- * crashes randomly.
- */
-static int __init apc_setup(char *str) 
-{
-	if(!strncmp(str, "noidle", strlen("noidle"))) {
-		apc_no_idle = 1;
-		return 1;
-	}
-	return 0;
-}
-__setup("apc=", apc_setup);
-
-/* 
- * CPU idle callback function
- * See .../arch/sparc/kernel/process.c
- */
-static void apc_swift_idle(void)
-{
-#ifdef APC_DEBUG_LED
-	set_auxio(0x00, AUXIO_LED); 
-#endif
-
-	apc_writeb(apc_readb(APC_IDLE_REG) | APC_IDLE_ON, APC_IDLE_REG);
-
-#ifdef APC_DEBUG_LED
-	set_auxio(AUXIO_LED, 0x00); 
-#endif
-} 
-
-static inline void apc_free(struct platform_device *op)
-{
-	of_iounmap(&op->resource[0], regs, resource_size(&op->resource[0]));
-}
-
-static int apc_open(struct inode *inode, struct file *f)
-{
-	return 0;
-}
-
-static int apc_release(struct inode *inode, struct file *f)
-{
-	return 0;
-}
-
-static long apc_ioctl(struct file *f, unsigned int cmd, unsigned long __arg)
-{
-	__u8 inarg, __user *arg = (__u8 __user *) __arg;
-
-	switch (cmd) {
-	case APCIOCGFANCTL:
-		if (put_user(apc_readb(APC_FANCTL_REG) & APC_REGMASK, arg))
-			return -EFAULT;
-		break;
-
-	case APCIOCGCPWR:
-		if (put_user(apc_readb(APC_CPOWER_REG) & APC_REGMASK, arg))
-			return -EFAULT;
-		break;
-
-	case APCIOCGBPORT:
-		if (put_user(apc_readb(APC_BPORT_REG) & APC_BPMASK, arg))
-			return -EFAULT;
-		break;
-
-	case APCIOCSFANCTL:
-		if (get_user(inarg, arg))
-			return -EFAULT;
-		apc_writeb(inarg & APC_REGMASK, APC_FANCTL_REG);
-		break;
-
-	case APCIOCSCPWR:
-		if (get_user(inarg, arg))
-			return -EFAULT;
-		apc_writeb(inarg & APC_REGMASK, APC_CPOWER_REG);
-		break;
-
-	case APCIOCSBPORT:
-		if (get_user(inarg, arg))
-			return -EFAULT;
-		apc_writeb(inarg & APC_BPMASK, APC_BPORT_REG);
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static const struct file_operations apc_fops = {
-	.unlocked_ioctl =	apc_ioctl,
-	.open =			apc_open,
-	.release =		apc_release,
-	.llseek =		noop_llseek,
-};
-
-static struct miscdevice apc_miscdev = { APC_MINOR, APC_DEVNAME, &apc_fops };
-
-static int apc_probe(struct platform_device *op)
-{
-	int err;
-
-	regs = of_ioremap(&op->resource[0], 0,
-			  resource_size(&op->resource[0]), APC_OBPNAME);
-	if (!regs) {
-		printk(KERN_ERR "%s: unable to map registers\n", APC_DEVNAME);
-		return -ENODEV;
-	}
-
-	err = misc_register(&apc_miscdev);
-	if (err) {
-		printk(KERN_ERR "%s: unable to register device\n", APC_DEVNAME);
-		apc_free(op);
-		return -ENODEV;
-	}
-
-	/* Assign power management IDLE handler */
-	if (!apc_no_idle)
-		sparc_idle = apc_swift_idle;
-
-	printk(KERN_INFO "%s: power management initialized%s\n", 
-	       APC_DEVNAME, apc_no_idle ? " (CPU idle disabled)" : "");
-
-	return 0;
-}
-
-static const struct of_device_id apc_match[] = {
-	{
-		.name = APC_OBPNAME,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, apc_match);
-
-static struct platform_driver apc_driver = {
-	.driver = {
-		.name = "apc",
-		.of_match_table = apc_match,
-	},
-	.probe		= apc_probe,
-};
-
-static int __init apc_init(void)
-{
-	return platform_driver_register(&apc_driver);
-}
-
-/* This driver is not critical to the boot process
- * and is easiest to ioremap when SBus is already
- * initialized, so we install ourselves thusly:
- */
-__initcall(apc_init);
diff --git a/arch/sparc/kernel/pmc.c b/arch/sparc/kernel/pmc.c
deleted file mode 100644
index 69a0206e56f0..000000000000
--- a/arch/sparc/kernel/pmc.c
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* pmc - Driver implementation for power management functions
- * of Power Management Controller (PMC) on SPARCstation-Voyager.
- *
- * Copyright (c) 2002 Eric Brower (ebrower@usa.net)
- */
-
-#include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/pm.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/module.h>
-
-#include <asm/io.h>
-#include <asm/oplib.h>
-#include <linux/uaccess.h>
-#include <asm/auxio.h>
-#include <asm/processor.h>
-
-/* Debug
- *
- * #define PMC_DEBUG_LED
- * #define PMC_NO_IDLE
- */
-
-#define PMC_OBPNAME	"SUNW,pmc"
-#define PMC_DEVNAME	"pmc"
-
-#define PMC_IDLE_REG	0x00
-#define PMC_IDLE_ON	0x01
-
-static u8 __iomem *regs;
-
-#define pmc_readb(offs)		(sbus_readb(regs+offs))
-#define pmc_writeb(val, offs)	(sbus_writeb(val, regs+offs))
-
-/*
- * CPU idle callback function
- * See .../arch/sparc/kernel/process.c
- */
-static void pmc_swift_idle(void)
-{
-#ifdef PMC_DEBUG_LED
-	set_auxio(0x00, AUXIO_LED);
-#endif
-
-	pmc_writeb(pmc_readb(PMC_IDLE_REG) | PMC_IDLE_ON, PMC_IDLE_REG);
-
-#ifdef PMC_DEBUG_LED
-	set_auxio(AUXIO_LED, 0x00);
-#endif
-}
-
-static int pmc_probe(struct platform_device *op)
-{
-	regs = of_ioremap(&op->resource[0], 0,
-			  resource_size(&op->resource[0]), PMC_OBPNAME);
-	if (!regs) {
-		printk(KERN_ERR "%s: unable to map registers\n", PMC_DEVNAME);
-		return -ENODEV;
-	}
-
-#ifndef PMC_NO_IDLE
-	/* Assign power management IDLE handler */
-	sparc_idle = pmc_swift_idle;
-#endif
-
-	printk(KERN_INFO "%s: power management initialized\n", PMC_DEVNAME);
-	return 0;
-}
-
-static const struct of_device_id pmc_match[] = {
-	{
-		.name = PMC_OBPNAME,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, pmc_match);
-
-static struct platform_driver pmc_driver = {
-	.driver = {
-		.name = "pmc",
-		.of_match_table = pmc_match,
-	},
-	.probe		= pmc_probe,
-};
-
-static int __init pmc_init(void)
-{
-	return platform_driver_register(&pmc_driver);
-}
-
-/* This driver is not critical to the boot process
- * and is easiest to ioremap when SBus is already
- * initialized, so we install ourselves thusly:
- */
-__initcall(pmc_init);

-- 
2.34.1

