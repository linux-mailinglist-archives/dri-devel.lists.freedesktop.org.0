Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1774D8192E3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6BF10E527;
	Tue, 19 Dec 2023 22:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4210E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A545E614EA;
 Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8530CC116B5;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023396;
 bh=2X7o1Lt3H8IW+wJpA8JXoQ1HU5uCPMeWcMEAyMe088c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=VUfJaGDbgC/phKWbtTMyOkQbePSPo3CsSs+H2orD28Z719yUfK+7LHFV/hRThkX7w
 OsvS//3ER6zAfdT1VqSZOjm4iaMeqdi8qByRpR+fhPwiUeYZyfKqQ5TbFj27PcUlmj
 Daf197WH/6FawzwaM/heVilGEUG3Zzgy6GUHVJTHI3bMa3Js00Swal4ICD8D59uccq
 3Kwp/k/8up5rhpuZX3hqkkdre90Az9bI2b4pGu2EXj5lYHoTl0G765S1p67pEIYAIA
 XyQK0dXRrNhfjqSXbv4eeI7i0VRxUIiKnI/nKOUrcQTG2iCa7J5Yor+JXJZHD48X90
 WTQauGJ4Uxjpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 75636C4706C;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:27 +0100
Subject: [PATCH 22/27] sparc32: Drop sun4m irq support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-22-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=15199;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=X63koqqYTm+iT+PU2L8ElZACMgk19KzK8/hbmjfO82M=; =?utf-8?q?b=3DY47K421BJoVD?=
 =?utf-8?q?JiQyqLXXy+kXYVTcxLxP3mtpLEkxrpcdOqEP/44A9Qi/FHs7Gbzwk58sTzOQYVP/?=
 +zkvvSvwDmnEx9w4micBREbkE4aZpO5hthhR50uYPebTV00dO9TP
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

Drop all code uses to support sun4m irqs.
Update entry.S to call the leon_nmi function.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/kernel/Makefile      |   1 -
 arch/sparc/kernel/entry.S       |  29 ++---
 arch/sparc/kernel/irq.h         |  47 +-------
 arch/sparc/kernel/irq_32.c      |   6 +-
 arch/sparc/kernel/kernel.h      |   4 -
 arch/sparc/kernel/leon_kernel.c |  10 +-
 arch/sparc/kernel/sun4m_irq.c   | 238 ----------------------------------------
 7 files changed, 23 insertions(+), 312 deletions(-)

diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index 09577e39037c..1961d165b279 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -29,7 +29,6 @@ obj-y                   += traps_$(BITS).o
 
 # IRQ
 obj-y                   += irq_$(BITS).o
-obj-$(CONFIG_SPARC32)   += sun4m_irq.o
 
 obj-y                   += process_$(BITS).o
 obj-y                   += process.o
diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
index eecbe0be7bf6..fb6095aab9c2 100644
--- a/arch/sparc/kernel/entry.S
+++ b/arch/sparc/kernel/entry.S
@@ -427,36 +427,21 @@ setcc_trap_handler:
 	jmp	%l2		! advance over trap instruction
 	rett	%l2 + 0x4	! like this...
 
-sun4m_nmi_error:
+nmi_error:
 	/* NMI async memory error handling. */
-	sethi	%hi(0x80000000), %l4
-	sethi	%hi(sun4m_irq_global), %o5
-	ld	[%o5 + %lo(sun4m_irq_global)], %l5
-	st	%l4, [%l5 + 0x0c]	! sun4m_irq_global->mask_set=0x80000000
-	WRITE_PAUSE
-	ld	[%l5 + 0x00], %g0	! sun4m_irq_global->pending
-	WRITE_PAUSE
+#ifndef CONFIG_SMP
+	.align	4
+	.globl	linux_trap_ipi15_leon
+linux_trap_ipi15_leon:
+	SAVE_ALL
 	or	%l0, PSR_PIL, %l4
 	wr	%l4, 0x0, %psr
 	WRITE_PAUSE
 	wr	%l4, PSR_ET, %psr
 	WRITE_PAUSE
-	call	sun4m_nmi
+	call	leon_nmi
 	 nop
-	st	%l4, [%l5 + 0x08]	! sun4m_irq_global->mask_clear=0x80000000
-	WRITE_PAUSE
-	ld	[%l5 + 0x00], %g0	! sun4m_irq_global->pending
-	WRITE_PAUSE
 	RESTORE_ALL
-
-#ifndef CONFIG_SMP
-	.align	4
-	.globl	linux_trap_ipi15_leon
-linux_trap_ipi15_leon:
-	SAVE_ALL
-
-	ba      sun4m_nmi_error
-	 nop
 #endif /* CONFIG_SMP */
 
 	.align	4
diff --git a/arch/sparc/kernel/irq.h b/arch/sparc/kernel/irq.h
index 8a0b314c8299..9d15dbb9fe6f 100644
--- a/arch/sparc/kernel/irq.h
+++ b/arch/sparc/kernel/irq.h
@@ -10,39 +10,14 @@ struct irq_bucket {
         unsigned int pil;
 };
 
-#define SUN4M_HARD_INT(x)       (0x000000001 << (x))
-#define SUN4M_SOFT_INT(x)       (0x000010000 << (x))
-
-#define SUN4D_MAX_BOARD 10
-#define SUN4D_MAX_IRQ ((SUN4D_MAX_BOARD + 2) << 5)
+#define MAX_BOARD 10
+#define MAX_IRQ ((MAX_BOARD + 2) << 5)
 
 /* Map between the irq identifier used in hw to the
  * irq_bucket. The map is sufficient large to hold
  * the sun4d hw identifiers.
  */
-extern struct irq_bucket *irq_map[SUN4D_MAX_IRQ];
-
-
-/* sun4m specific type definitions */
-
-/* This maps direct to CPU specific interrupt registers */
-struct sun4m_irq_percpu {
-	u32	pending;
-	u32	clear;
-	u32	set;
-};
-
-/* This maps direct to global interrupt registers */
-struct sun4m_irq_global {
-	u32	pending;
-	u32	mask;
-	u32	mask_clear;
-	u32	mask_set;
-	u32	interrupt_target;
-};
-
-extern struct sun4m_irq_percpu __iomem *sun4m_irq_percpu[SUN4M_NCPUS];
-extern struct sun4m_irq_global __iomem *sun4m_irq_global;
+extern struct irq_bucket *irq_map[MAX_IRQ];
 
 unsigned int irq_alloc(unsigned int real_irq, unsigned int pil);
 void irq_link(unsigned int irq);
@@ -51,22 +26,8 @@ void handler_irq(unsigned int pil, struct pt_regs *regs);
 
 unsigned long leon_get_irqmask(unsigned int irq);
 
-/* sun4m_irq.c */
-void sun4m_nmi(struct pt_regs *regs);
-
-/* sun4d_irq.c */
-void sun4d_handler_irq(unsigned int pil, struct pt_regs *regs);
-
 /* leon_kernel.c */
 void leon_clear_clock_irq(void);
 void leon_load_profile_irq(int cpu, unsigned int limit);
 u32 leon_cycles_offset(void);
-
-#ifdef CONFIG_SMP
-
-/* All SUN4D IPIs are sent on this IRQ, may be shared with hard IRQs */
-#define SUN4D_IPI_IRQ 13
-
-void sun4d_ipi_interrupt(void);
-
-#endif
+void leon_nmi(struct pt_regs *regs);
diff --git a/arch/sparc/kernel/irq_32.c b/arch/sparc/kernel/irq_32.c
index f76f57073323..5bd64828e8a0 100644
--- a/arch/sparc/kernel/irq_32.c
+++ b/arch/sparc/kernel/irq_32.c
@@ -111,7 +111,7 @@ static struct irq_bucket irq_table[NR_IRQS];
 static DEFINE_SPINLOCK(irq_table_lock);
 
 /* Map between the irq identifier used in hw to the irq_bucket. */
-struct irq_bucket *irq_map[SUN4D_MAX_IRQ];
+struct irq_bucket *irq_map[MAX_IRQ];
 /* Protect access to irq_map */
 static DEFINE_SPINLOCK(irq_map_lock);
 
@@ -162,7 +162,7 @@ void irq_link(unsigned int irq)
 
 	p = &irq_table[irq];
 	pil = p->pil;
-	BUG_ON(pil >= SUN4D_MAX_IRQ);
+	BUG_ON(pil >= MAX_IRQ);
 	p->next = irq_map[pil];
 	irq_map[pil] = p;
 
@@ -179,7 +179,7 @@ void irq_unlink(unsigned int irq)
 	spin_lock_irqsave(&irq_map_lock, flags);
 
 	p = &irq_table[irq];
-	BUG_ON(p->pil >= SUN4D_MAX_IRQ);
+	BUG_ON(p->pil >= MAX_IRQ);
 	pnext = &irq_map[p->pil];
 	while (*pnext != p)
 		pnext = &(*pnext)->next;
diff --git a/arch/sparc/kernel/kernel.h b/arch/sparc/kernel/kernel.h
index a14812903629..30adbec894f7 100644
--- a/arch/sparc/kernel/kernel.h
+++ b/arch/sparc/kernel/kernel.h
@@ -92,10 +92,6 @@ extern spinlock_t irq_action_lock;
 
 void unexpected_irq(int irq, void *dev_id, struct pt_regs * regs);
 
-/* sun4m_irq.c */
-void sun4m_unmask_profile_irq(void);
-void sun4m_clear_profile_irq(int cpu);
-
 /* leon_smp.c */
 void leon_cpu_pre_starting(void *arg);
 void leon_cpu_pre_online(void *arg);
diff --git a/arch/sparc/kernel/leon_kernel.c b/arch/sparc/kernel/leon_kernel.c
index fa9cdaffdc6b..1bdf08db3037 100644
--- a/arch/sparc/kernel/leon_kernel.c
+++ b/arch/sparc/kernel/leon_kernel.c
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/interrupt.h>
+#include <linux/sched/debug.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 
@@ -269,8 +270,15 @@ u32 leon_cycles_offset(void)
 	return off;
 }
 
-#ifdef CONFIG_SMP
+/* NMI interrupt (15) */
+void leon_nmi(struct pt_regs *regs)
+{
+	printk(KERN_ERR "Aieee: NMI received!\n");
+	show_regs(regs);
+	prom_halt();
+}
 
+#ifdef CONFIG_SMP
 /* smp clockevent irq */
 static irqreturn_t leon_percpu_timer_ce_interrupt(int irq, void *unused)
 {
diff --git a/arch/sparc/kernel/sun4m_irq.c b/arch/sparc/kernel/sun4m_irq.c
deleted file mode 100644
index 1a220a2b9ac3..000000000000
--- a/arch/sparc/kernel/sun4m_irq.c
+++ /dev/null
@@ -1,238 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * sun4m irq support
- *
- *  djhr: Hacked out of irq.c into a CPU dependent version.
- *
- *  Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
- *  Copyright (C) 1995 Miguel de Icaza (miguel@nuclecu.unam.mx)
- *  Copyright (C) 1995 Pete A. Zaitcev (zaitcev@yahoo.com)
- *  Copyright (C) 1996 Dave Redman (djhr@tadpole.co.uk)
- */
-
-#include <linux/slab.h>
-#include <linux/sched/debug.h>
-#include <linux/pgtable.h>
-
-#include <asm/timer.h>
-#include <asm/traps.h>
-#include <asm/irq.h>
-#include <asm/io.h>
-#include <asm/cacheflush.h>
-
-#include "irq.h"
-#include "kernel.h"
-
-/* Sample sun4m IRQ layout:
- *
- * 0x22 - Power
- * 0x24 - ESP SCSI
- * 0x26 - Lance ethernet
- * 0x2b - Floppy
- * 0x2c - Zilog uart
- * 0x32 - SBUS level 0
- * 0x33 - Parallel port, SBUS level 1
- * 0x35 - SBUS level 2
- * 0x37 - SBUS level 3
- * 0x39 - Audio, Graphics card, SBUS level 4
- * 0x3b - SBUS level 5
- * 0x3d - SBUS level 6
- *
- * Each interrupt source has a mask bit in the interrupt registers.
- * When the mask bit is set, this blocks interrupt deliver.  So you
- * clear the bit to enable the interrupt.
- *
- * Interrupts numbered less than 0x10 are software triggered interrupts
- * and unused by Linux.
- *
- * Interrupt level assignment on sun4m:
- *
- *	level		source
- * ------------------------------------------------------------
- *	  1		softint-1
- *	  2		softint-2, VME/SBUS level 1
- *	  3		softint-3, VME/SBUS level 2
- *	  4		softint-4, onboard SCSI
- *	  5		softint-5, VME/SBUS level 3
- *	  6		softint-6, onboard ETHERNET
- *	  7		softint-7, VME/SBUS level 4
- *	  8		softint-8, onboard VIDEO
- *	  9		softint-9, VME/SBUS level 5, Module Interrupt
- *	 10		softint-10, system counter/timer
- *	 11		softint-11, VME/SBUS level 6, Floppy
- *	 12		softint-12, Keyboard/Mouse, Serial
- *	 13		softint-13, VME/SBUS level 7, ISDN Audio
- *	 14		softint-14, per-processor counter/timer
- *	 15		softint-15, Asynchronous Errors (broadcast)
- *
- * Each interrupt source is masked distinctly in the sun4m interrupt
- * registers.  The PIL level alone is therefore ambiguous, since multiple
- * interrupt sources map to a single PIL.
- *
- * This ambiguity is resolved in the 'intr' property for device nodes
- * in the OF device tree.  Each 'intr' property entry is composed of
- * two 32-bit words.  The first word is the IRQ priority value, which
- * is what we're intersted in.  The second word is the IRQ vector, which
- * is unused.
- *
- * The low 4 bits of the IRQ priority indicate the PIL, and the upper
- * 4 bits indicate onboard vs. SBUS leveled vs. VME leveled.  0x20
- * means onboard, 0x30 means SBUS leveled, and 0x40 means VME leveled.
- *
- * For example, an 'intr' IRQ priority value of 0x24 is onboard SCSI
- * whereas a value of 0x33 is SBUS level 2.  Here are some sample
- * 'intr' property IRQ priority values from ss4, ss5, ss10, ss20, and
- * Tadpole S3 GX systems.
- *
- * esp:		0x24	onboard ESP SCSI
- * le:		0x26	onboard Lance ETHERNET
- * p9100:	0x32	SBUS level 1 P9100 video
- * bpp:		0x33	SBUS level 2 BPP parallel port device
- * DBRI:	0x39	SBUS level 5 DBRI ISDN audio
- * SUNW,leo:	0x39	SBUS level 5 LEO video
- * pcmcia:	0x3b	SBUS level 6 PCMCIA controller
- * uctrl:	0x3b	SBUS level 6 UCTRL device
- * modem:	0x3d	SBUS level 7 MODEM
- * zs:		0x2c	onboard keyboard/mouse/serial
- * floppy:	0x2b	onboard Floppy
- * power:	0x22	onboard power device (XXX unknown mask bit XXX)
- */
-
-
-/* Code in entry.S needs to get at these register mappings.  */
-struct sun4m_irq_percpu __iomem *sun4m_irq_percpu[SUN4M_NCPUS];
-struct sun4m_irq_global __iomem *sun4m_irq_global;
-
-struct sun4m_handler_data {
-	bool    percpu;
-	long    mask;
-};
-
-/* Dave Redman (djhr@tadpole.co.uk)
- * The sun4m interrupt registers.
- */
-#define SUN4M_INT_ENABLE	0x80000000
-#define SUN4M_INT_E14		0x00000080
-#define SUN4M_INT_E10		0x00080000
-
-#define	SUN4M_INT_MASKALL	0x80000000	  /* mask all interrupts */
-#define	SUN4M_INT_MODULE_ERR	0x40000000	  /* module error */
-#define	SUN4M_INT_M2S_WRITE_ERR	0x20000000	  /* write buffer error */
-#define	SUN4M_INT_ECC_ERR	0x10000000	  /* ecc memory error */
-#define	SUN4M_INT_VME_ERR	0x08000000	  /* vme async error */
-#define	SUN4M_INT_FLOPPY	0x00400000	  /* floppy disk */
-#define	SUN4M_INT_MODULE	0x00200000	  /* module interrupt */
-#define	SUN4M_INT_VIDEO		0x00100000	  /* onboard video */
-#define	SUN4M_INT_REALTIME	0x00080000	  /* system timer */
-#define	SUN4M_INT_SCSI		0x00040000	  /* onboard scsi */
-#define	SUN4M_INT_AUDIO		0x00020000	  /* audio/isdn */
-#define	SUN4M_INT_ETHERNET	0x00010000	  /* onboard ethernet */
-#define	SUN4M_INT_SERIAL	0x00008000	  /* serial ports */
-#define	SUN4M_INT_KBDMS		0x00004000	  /* keyboard/mouse */
-#define	SUN4M_INT_SBUSBITS	0x00003F80	  /* sbus int bits */
-#define	SUN4M_INT_VMEBITS	0x0000007F	  /* vme int bits */
-
-#define	SUN4M_INT_ERROR		(SUN4M_INT_MODULE_ERR |    \
-				 SUN4M_INT_M2S_WRITE_ERR | \
-				 SUN4M_INT_ECC_ERR |       \
-				 SUN4M_INT_VME_ERR)
-
-#define SUN4M_INT_SBUS(x)	(1 << (x+7))
-#define SUN4M_INT_VME(x)	(1 << (x))
-
-/* Interrupt levels used by OBP */
-#define	OBP_INT_LEVEL_SOFT	0x10
-#define	OBP_INT_LEVEL_ONBOARD	0x20
-#define	OBP_INT_LEVEL_SBUS	0x30
-#define	OBP_INT_LEVEL_VME	0x40
-
-#define SUN4M_TIMER_IRQ         (OBP_INT_LEVEL_ONBOARD | 10)
-#define SUN4M_PROFILE_IRQ       (OBP_INT_LEVEL_ONBOARD | 14)
-
-static unsigned long sun4m_imask[0x50] = {
-	/* 0x00 - SMP */
-	0,  SUN4M_SOFT_INT(1),
-	SUN4M_SOFT_INT(2),  SUN4M_SOFT_INT(3),
-	SUN4M_SOFT_INT(4),  SUN4M_SOFT_INT(5),
-	SUN4M_SOFT_INT(6),  SUN4M_SOFT_INT(7),
-	SUN4M_SOFT_INT(8),  SUN4M_SOFT_INT(9),
-	SUN4M_SOFT_INT(10), SUN4M_SOFT_INT(11),
-	SUN4M_SOFT_INT(12), SUN4M_SOFT_INT(13),
-	SUN4M_SOFT_INT(14), SUN4M_SOFT_INT(15),
-	/* 0x10 - soft */
-	0,  SUN4M_SOFT_INT(1),
-	SUN4M_SOFT_INT(2),  SUN4M_SOFT_INT(3),
-	SUN4M_SOFT_INT(4),  SUN4M_SOFT_INT(5),
-	SUN4M_SOFT_INT(6),  SUN4M_SOFT_INT(7),
-	SUN4M_SOFT_INT(8),  SUN4M_SOFT_INT(9),
-	SUN4M_SOFT_INT(10), SUN4M_SOFT_INT(11),
-	SUN4M_SOFT_INT(12), SUN4M_SOFT_INT(13),
-	SUN4M_SOFT_INT(14), SUN4M_SOFT_INT(15),
-	/* 0x20 - onboard */
-	0, 0, 0, 0,
-	SUN4M_INT_SCSI,  0, SUN4M_INT_ETHERNET, 0,
-	SUN4M_INT_VIDEO, SUN4M_INT_MODULE,
-	SUN4M_INT_REALTIME, SUN4M_INT_FLOPPY,
-	(SUN4M_INT_SERIAL | SUN4M_INT_KBDMS),
-	SUN4M_INT_AUDIO, SUN4M_INT_E14, SUN4M_INT_MODULE_ERR,
-	/* 0x30 - sbus */
-	0, 0, SUN4M_INT_SBUS(0), SUN4M_INT_SBUS(1),
-	0, SUN4M_INT_SBUS(2), 0, SUN4M_INT_SBUS(3),
-	0, SUN4M_INT_SBUS(4), 0, SUN4M_INT_SBUS(5),
-	0, SUN4M_INT_SBUS(6), 0, 0,
-	/* 0x40 - vme */
-	0, 0, SUN4M_INT_VME(0), SUN4M_INT_VME(1),
-	0, SUN4M_INT_VME(2), 0, SUN4M_INT_VME(3),
-	0, SUN4M_INT_VME(4), 0, SUN4M_INT_VME(5),
-	0, SUN4M_INT_VME(6), 0, 0
-};
-
-struct sun4m_timer_percpu {
-	u32		l14_limit;
-	u32		l14_count;
-	u32		l14_limit_noclear;
-	u32		user_timer_start_stop;
-};
-
-static struct sun4m_timer_percpu __iomem *timers_percpu[SUN4M_NCPUS];
-
-void sun4m_nmi(struct pt_regs *regs)
-{
-	unsigned long afsr, afar, si;
-
-	printk(KERN_ERR "Aieee: sun4m NMI received!\n");
-	/* XXX HyperSparc hack XXX */
-	__asm__ __volatile__("mov 0x500, %%g1\n\t"
-			     "lda [%%g1] 0x4, %0\n\t"
-			     "mov 0x600, %%g1\n\t"
-			     "lda [%%g1] 0x4, %1\n\t" :
-			     "=r" (afsr), "=r" (afar));
-	printk(KERN_ERR "afsr=%08lx afar=%08lx\n", afsr, afar);
-	si = sbus_readl(&sun4m_irq_global->pending);
-	printk(KERN_ERR "si=%08lx\n", si);
-	if (si & SUN4M_INT_MODULE_ERR)
-		printk(KERN_ERR "Module async error\n");
-	if (si & SUN4M_INT_M2S_WRITE_ERR)
-		printk(KERN_ERR "MBus/SBus async error\n");
-	if (si & SUN4M_INT_ECC_ERR)
-		printk(KERN_ERR "ECC memory error\n");
-	if (si & SUN4M_INT_VME_ERR)
-		printk(KERN_ERR "VME async error\n");
-	printk(KERN_ERR "you lose buddy boy...\n");
-	show_regs(regs);
-	prom_halt();
-}
-
-void sun4m_unmask_profile_irq(void)
-{
-	unsigned long flags;
-
-	local_irq_save(flags);
-	sbus_writel(sun4m_imask[SUN4M_PROFILE_IRQ], &sun4m_irq_global->mask_clear);
-	local_irq_restore(flags);
-}
-
-void sun4m_clear_profile_irq(int cpu)
-{
-	sbus_readl(&timers_percpu[cpu]->l14_limit);
-}

-- 
2.34.1

