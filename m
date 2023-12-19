Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E478192E7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5FD10E529;
	Tue, 19 Dec 2023 22:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C650910E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F0D1AB81AE0;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BACCCC43395;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023395;
 bh=0R9PzmtGxdJ6USDK3n4JiDrY3Q7MGOjxmyoxB9HDftA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=dC1sXLKaC1mdDV9xpjM1S8WSoY9HoRLnfOJbm+uXk2+xFwPPUBHhNAq6vmIEeYC3r
 MzfbLTLD3zY60lu7yrcrtuLdlsNl7Rq3IuFrKirdtJS68dX8S25X2oN7Wu6ebgIDD7
 +D7wwEJHAOhcJVS0aHTLhjiLPst+mTW2UwLZjisGW8yLvMYBk2T4xB/uA3vsO2UIhj
 0GnpMb6WS0mfxz7qEKCBuLS61KgY+SmffGALXDea5pS++iXCM0DY2pxhM2M7EISiZx
 SG+pwU+bZ0PVcVm9vRqWHgrT6VNiiLvJ0Wg8unT5JURhFwmtXRm36zfreb8wuRnHas
 5GEr0ObY73U/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AA4E7C46CD2;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:11 +0100
Subject: [PATCH 06/27] sparc32: Drop auxio support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-6-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=10968;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=uPRcNTHpc3apZmH38dH08GpG9gby+F03Z/5vNFNt+bQ=; =?utf-8?q?b=3DizbwVBxoepZr?=
 =?utf-8?q?5JXsCurPkXmxDhF7NTC6N0iyi+sg9aUQ7sZEdku9HTiFcFOA2jw/0aMKhz4LDPsu?=
 N6j8wXkRBfrUv9dq+TB23KE1Cir6b/VexmmdWaCzgSig1RPwG8pY
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

auxio is not supported by LEON - so drop it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/auxio_32.h |  73 +-------------------
 arch/sparc/kernel/Makefile        |   2 +-
 arch/sparc/kernel/auxio_32.c      | 139 --------------------------------------
 arch/sparc/kernel/devices.c       |   3 -
 arch/sparc/kernel/kernel.h        |   4 --
 arch/sparc/kernel/process_32.c    |  10 ---
 arch/sparc/prom/misc_32.c         |   2 -
 7 files changed, 3 insertions(+), 230 deletions(-)

diff --git a/arch/sparc/include/asm/auxio_32.h b/arch/sparc/include/asm/auxio_32.h
index 852457c7a265..e2335ddd359d 100644
--- a/arch/sparc/include/asm/auxio_32.h
+++ b/arch/sparc/include/asm/auxio_32.h
@@ -1,43 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * auxio.h:  Definitions and code for the Auxiliary I/O register.
+ * Dummy definitions for the Auxiliary I/O register.
  *
  * Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
  */
 #ifndef _SPARC_AUXIO_H
 #define _SPARC_AUXIO_H
 
-#include <asm/vaddrs.h>
-
-/* This register is an unsigned char in IO space.  It does two things.
- * First, it is used to control the front panel LED light on machines
- * that have it (good for testing entry points to trap handlers and irq's)
- * Secondly, it controls various floppy drive parameters.
- */
-#define AUXIO_ORMEIN      0xf0    /* All writes must set these bits. */
-#define AUXIO_ORMEIN4M    0xc0    /* sun4m - All writes must set these bits. */
-#define AUXIO_FLPY_DENS   0x20    /* Floppy density, high if set. Read only. */
-#define AUXIO_FLPY_DCHG   0x10    /* A disk change occurred.  Read only. */
-#define AUXIO_EDGE_ON     0x10    /* sun4m - On means Jumper block is in. */
-#define AUXIO_FLPY_DSEL   0x08    /* Drive select/start-motor. Write only. */
-#define AUXIO_LINK_TEST   0x08    /* sun4m - On means TPE Carrier detect. */
-
-/* Set the following to one, then zero, after doing a pseudo DMA transfer. */
-#define AUXIO_FLPY_TCNT   0x04    /* Floppy terminal count. Write only. */
-
-/* Set the following to zero to eject the floppy. */
-#define AUXIO_FLPY_EJCT   0x02    /* Eject floppy disk.  Write only. */
-#define AUXIO_LED         0x01    /* On if set, off if unset. Read/Write */
-
-#ifndef __ASSEMBLY__
-
-/*
- * NOTE: these routines are implementation dependent--
- * understand the hardware you are querying!
- */
-void set_auxio(unsigned char bits_on, unsigned char bits_off);
-unsigned char get_auxio(void); /* .../asm/floppy.h */
-
 /*
  * The following routines are provided for driver-compatibility
  * with sparc64 (primarily sunlance.c)
@@ -46,44 +15,6 @@ unsigned char get_auxio(void); /* .../asm/floppy.h */
 #define AUXIO_LTE_ON    1
 #define AUXIO_LTE_OFF   0
 
-/* auxio_set_lte - Set Link Test Enable (TPE Link Detect)
- *
- * on - AUXIO_LTE_ON or AUXIO_LTE_OFF
- */
-#define auxio_set_lte(on) \
-do { \
-	if(on) { \
-		set_auxio(AUXIO_LINK_TEST, 0); \
-	} else { \
-		set_auxio(0, AUXIO_LINK_TEST); \
-	} \
-} while (0)
-
-#define AUXIO_LED_ON    1
-#define AUXIO_LED_OFF   0
-
-/* auxio_set_led - Set system front panel LED
- *
- * on - AUXIO_LED_ON or AUXIO_LED_OFF
- */
-#define auxio_set_led(on) \
-do { \
-	if(on) { \
-		set_auxio(AUXIO_LED, 0); \
-	} else { \
-		set_auxio(0, AUXIO_LED); \
-	} \
-} while (0)
-
-#endif /* !(__ASSEMBLY__) */
-
-
-/* AUXIO2 (Power Off Control) */
-extern volatile u8 __iomem *auxio_power_register;
-
-#define	AUXIO_POWER_DETECT_FAILURE	32
-#define	AUXIO_POWER_CLEAR_FAILURE	2
-#define	AUXIO_POWER_OFF			1
-
+#define auxio_set_lte(on)
 
 #endif /* !(_SPARC_AUXIO_H) */
diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index ab47823f8b4e..577cb57c588a 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -83,7 +83,7 @@ obj-$(CONFIG_SMP)         += trampoline_$(BITS).o smp_$(BITS).o
 obj-$(CONFIG_SPARC32_SMP) += sun4m_smp.o sun4d_smp.o leon_smp.o
 obj-$(CONFIG_SPARC64_SMP) += hvtramp.o
 
-obj-y                     += auxio_$(BITS).o
+obj-$(CONFIG_SPARC64)     += auxio_64.o
 
 obj-y                     += termios.o
 
diff --git a/arch/sparc/kernel/auxio_32.c b/arch/sparc/kernel/auxio_32.c
deleted file mode 100644
index 989860e890c4..000000000000
--- a/arch/sparc/kernel/auxio_32.c
+++ /dev/null
@@ -1,139 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* auxio.c: Probing for the Sparc AUXIO register at boot time.
- *
- * Copyright (C) 1996 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#include <linux/stddef.h>
-#include <linux/init.h>
-#include <linux/spinlock.h>
-#include <linux/of.h>
-#include <linux/export.h>
-
-#include <asm/oplib.h>
-#include <asm/io.h>
-#include <asm/auxio.h>
-#include <asm/string.h>		/* memset(), Linux has no bzero() */
-#include <asm/cpu_type.h>
-
-#include "kernel.h"
-
-/* Probe and map in the Auxiliary I/O register */
-
-/* auxio_register is not static because it is referenced 
- * in entry.S::floppy_tdone
- */
-void __iomem *auxio_register = NULL;
-static DEFINE_SPINLOCK(auxio_lock);
-
-void __init auxio_probe(void)
-{
-	phandle node, auxio_nd;
-	struct linux_prom_registers auxregs[1];
-	struct resource r;
-
-	switch (sparc_cpu_model) {
-	case sparc_leon:
-	case sun4d:
-		return;
-	default:
-		break;
-	}
-	node = prom_getchild(prom_root_node);
-	auxio_nd = prom_searchsiblings(node, "auxiliary-io");
-	if(!auxio_nd) {
-		node = prom_searchsiblings(node, "obio");
-		node = prom_getchild(node);
-		auxio_nd = prom_searchsiblings(node, "auxio");
-		if(!auxio_nd) {
-#ifdef CONFIG_PCI
-			/* There may be auxio on Ebus */
-			return;
-#else
-			if(prom_searchsiblings(node, "leds")) {
-				/* VME chassis sun4m machine, no auxio exists. */
-				return;
-			}
-			prom_printf("Cannot find auxio node, cannot continue...\n");
-			prom_halt();
-#endif
-		}
-	}
-	if(prom_getproperty(auxio_nd, "reg", (char *) auxregs, sizeof(auxregs)) <= 0)
-		return;
-	prom_apply_obio_ranges(auxregs, 0x1);
-	/* Map the register both read and write */
-	r.flags = auxregs[0].which_io & 0xF;
-	r.start = auxregs[0].phys_addr;
-	r.end = auxregs[0].phys_addr + auxregs[0].reg_size - 1;
-	auxio_register = of_ioremap(&r, 0, auxregs[0].reg_size, "auxio");
-	/* Fix the address on sun4m. */
-	if ((((unsigned long) auxregs[0].phys_addr) & 3) == 3)
-		auxio_register += (3 - ((unsigned long)auxio_register & 3));
-
-	set_auxio(AUXIO_LED, 0);
-}
-
-unsigned char get_auxio(void)
-{
-	if(auxio_register) 
-		return sbus_readb(auxio_register);
-	return 0;
-}
-EXPORT_SYMBOL(get_auxio);
-
-void set_auxio(unsigned char bits_on, unsigned char bits_off)
-{
-	unsigned char regval;
-	unsigned long flags;
-	spin_lock_irqsave(&auxio_lock, flags);
-	switch (sparc_cpu_model) {
-	case sun4m:
-		if(!auxio_register)
-			break;     /* VME chassis sun4m, no auxio. */
-		regval = sbus_readb(auxio_register);
-		sbus_writeb(((regval | bits_on) & ~bits_off) | AUXIO_ORMEIN4M,
-			auxio_register);
-		break;
-	case sun4d:
-		break;
-	default:
-		panic("Can't set AUXIO register on this machine.");
-	}
-	spin_unlock_irqrestore(&auxio_lock, flags);
-}
-EXPORT_SYMBOL(set_auxio);
-
-/* sun4m power control register (AUXIO2) */
-
-volatile u8 __iomem *auxio_power_register = NULL;
-
-void __init auxio_power_probe(void)
-{
-	struct linux_prom_registers regs;
-	phandle node;
-	struct resource r;
-
-	/* Attempt to find the sun4m power control node. */
-	node = prom_getchild(prom_root_node);
-	node = prom_searchsiblings(node, "obio");
-	node = prom_getchild(node);
-	node = prom_searchsiblings(node, "power");
-	if (node == 0 || (s32)node == -1)
-		return;
-
-	/* Map the power control register. */
-	if (prom_getproperty(node, "reg", (char *)&regs, sizeof(regs)) <= 0)
-		return;
-	prom_apply_obio_ranges(&regs, 1);
-	memset(&r, 0, sizeof(r));
-	r.flags = regs.which_io & 0xF;
-	r.start = regs.phys_addr;
-	r.end = regs.phys_addr + regs.reg_size - 1;
-	auxio_power_register =
-		(u8 __iomem *)of_ioremap(&r, 0, regs.reg_size, "auxpower");
-
-	/* Display a quick message on the console. */
-	if (auxio_power_register)
-		printk(KERN_INFO "Power off control detected.\n");
-}
diff --git a/arch/sparc/kernel/devices.c b/arch/sparc/kernel/devices.c
index 23b6e50d4ada..b3c2d51b22c4 100644
--- a/arch/sparc/kernel/devices.c
+++ b/arch/sparc/kernel/devices.c
@@ -132,7 +132,4 @@ void __init device_scan(void)
 							    0);
 	}
 #endif /* !CONFIG_SMP */
-
-	auxio_probe();
-	auxio_power_probe();
 }
diff --git a/arch/sparc/kernel/kernel.h b/arch/sparc/kernel/kernel.h
index ef5579496088..c8ba3bc7e137 100644
--- a/arch/sparc/kernel/kernel.h
+++ b/arch/sparc/kernel/kernel.h
@@ -174,10 +174,6 @@ asmlinkage void user_unaligned_trap(struct pt_regs *regs, unsigned int insn);
 /* windows.c */
 void try_to_clear_window_buffer(struct pt_regs *regs, int who);
 
-/* auxio_32.c */
-void __init auxio_probe(void);
-void __init auxio_power_probe(void);
-
 /* pcic.c */
 extern void __iomem *pcic_regs;
 void pcic_nmi(unsigned int pend, struct pt_regs *regs);
diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
index 9c7c662cb565..2e2836f314ca 100644
--- a/arch/sparc/kernel/process_32.c
+++ b/arch/sparc/kernel/process_32.c
@@ -27,7 +27,6 @@
 #include <linux/slab.h>
 #include <linux/cpu.h>
 
-#include <asm/auxio.h>
 #include <asm/oplib.h>
 #include <linux/uaccess.h>
 #include <asm/page.h>
@@ -49,8 +48,6 @@ void (*sparc_idle)(void);
 
 /* 
  * Power-off handler instantiation for pm.h compliance
- * This is done via auxio, but could be used as a fallback
- * handler when auxio is not present-- unused for now...
  */
 void (*pm_power_off)(void) = machine_power_off;
 EXPORT_SYMBOL(pm_power_off);
@@ -103,13 +100,6 @@ void machine_restart(char * cmd)
 
 void machine_power_off(void)
 {
-	if (auxio_power_register &&
-	    (!of_node_is_type(of_console_device, "serial") || scons_pwroff)) {
-		u8 power_register = sbus_readb(auxio_power_register);
-		power_register |= AUXIO_POWER_OFF;
-		sbus_writeb(power_register, auxio_power_register);
-	}
-
 	machine_halt();
 }
 
diff --git a/arch/sparc/prom/misc_32.c b/arch/sparc/prom/misc_32.c
index 625750924860..78dde6bfbf0f 100644
--- a/arch/sparc/prom/misc_32.c
+++ b/arch/sparc/prom/misc_32.c
@@ -13,7 +13,6 @@
 
 #include <asm/openprom.h>
 #include <asm/oplib.h>
-#include <asm/auxio.h>
 
 extern void restore_current(void);
 
@@ -60,7 +59,6 @@ prom_cmdline(void)
 	(*(romvec->pv_abort))();
 	restore_current();
 	spin_unlock_irqrestore(&prom_lock, flags);
-	set_auxio(AUXIO_LED, 0);
 }
 
 /* Drop into the prom, but completely terminate the program.

-- 
2.34.1

