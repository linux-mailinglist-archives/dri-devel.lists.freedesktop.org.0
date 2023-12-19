Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CFE8192DD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0929410E51F;
	Tue, 19 Dec 2023 22:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8471510E206
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C9833614CE;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06B89C433CC;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023396;
 bh=PlMXyekQOmZ+JWokrR3lquvstGM0aEn4kdi/CNEbsdg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=hmamGPqs81Q9mCCMl6Ed/6/4NJbWuIKitycq8R0fGjPcLfCMaf3m/m1TDe1qbD2GZ
 BwAaps2RwNV47iEK3dbtgnCVyEoagRdR5cdqi3Zyeu+WVdJ5BZz4vcLtIP3zB/jGuQ
 x8eg1v3kiLhePpyRki9dSWp+vAaErnY/a+R3ycuHmJN4HeYf/d1R+eQbFEFVzTceEj
 qcuyft5g1tgkpfJotM/YgmPkon+1IwhYD11es0EGAc0imHgyuE1OooYei8Vbl/D9ck
 OIlODjGWIsqK2KYpAx8eqGcVawC6jvZR6LT8h1pKA1pmZ9WhaYhbiEhenqO1w+M/bG
 DdL1RVx1VMVzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E9E0DC46CCD;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:16 +0100
Subject: [PATCH 11/27] sparc32: Drop pcic support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-11-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=34263;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=uRX8vRHYaM+ohYq8gHGopGdLsV8EDe1irKhP8hCVhgk=; =?utf-8?q?b=3DKZIbJxvNeWaW?=
 =?utf-8?q?ZOsWyvhNqH7ARx3ExGODwAg0wAqxsPvD5XtuPRBaoOpMXoU7npLceLwKH/gFoZ+q?=
 lXj0lWAJB7KraiIf7vC8DsLYTTkbwdwTxpsUQKbZ7NSXmPdRdHqS
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

pcic is only used by MicroSPARC-IIep and not relevant for LEON.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/Kconfig            |   5 -
 arch/sparc/include/asm/pcic.h | 130 -------
 arch/sparc/kernel/Makefile    |   1 -
 arch/sparc/kernel/entry.S     |  48 ---
 arch/sparc/kernel/irq_32.c    |   1 -
 arch/sparc/kernel/kernel.h    |   4 -
 arch/sparc/kernel/pcic.c      | 829 ------------------------------------------
 arch/sparc/kernel/time_32.c   |   6 +-
 8 files changed, 1 insertion(+), 1023 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 55a9e67c482e..7ae304bab2d8 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -414,11 +414,6 @@ config SUN_LDOMS
 	  Say Y here is you want to support virtual devices via
 	  Logical Domains.
 
-config PCIC_PCI
-	bool
-	depends on PCI && SPARC32 && !SPARC_LEON
-	default y
-
 config LEON_PCI
 	bool
 	depends on PCI && SPARC_LEON
diff --git a/arch/sparc/include/asm/pcic.h b/arch/sparc/include/asm/pcic.h
deleted file mode 100644
index 238376b1ffcc..000000000000
--- a/arch/sparc/include/asm/pcic.h
+++ /dev/null
@@ -1,130 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * pcic.h: JavaEngine 1 specific PCI definitions.
- *
- * Copyright (C) 1998 V. Roganov and G. Raiko
- */
-
-#ifndef __SPARC_PCIC_H
-#define __SPARC_PCIC_H
-
-#ifndef __ASSEMBLY__
-
-#include <linux/types.h>
-#include <linux/smp.h>
-#include <linux/pci.h>
-#include <linux/ioport.h>
-#include <asm/pbm.h>
-
-struct linux_pcic {
-        void __iomem            *pcic_regs;
-        unsigned long           pcic_io;
-        void __iomem            *pcic_config_space_addr;
-        void __iomem            *pcic_config_space_data;
-	struct resource		pcic_res_regs;
-	struct resource		pcic_res_io;
-	struct resource		pcic_res_cfg_addr;
-	struct resource		pcic_res_cfg_data;
-        struct linux_pbm_info   pbm;
-	struct pcic_ca2irq	*pcic_imap;
-	int			pcic_imdim;
-};
-
-#ifdef CONFIG_PCIC_PCI
-int pcic_present(void);
-int pcic_probe(void);
-void pci_time_init(void);
-void sun4m_pci_init_IRQ(void);
-#else
-static inline int pcic_present(void) { return 0; }
-static inline int pcic_probe(void) { return 0; }
-static inline void pci_time_init(void) {}
-static inline void sun4m_pci_init_IRQ(void) {}
-#endif
-#endif
-
-/* Size of PCI I/O space which we relocate. */
-#define PCI_SPACE_SIZE                  0x1000000       /* 16 MB */
-
-/* PCIC Register Set. */
-#define PCI_DIAGNOSTIC_0                0x40    /* 32 bits */
-#define PCI_SIZE_0                      0x44    /* 32 bits */
-#define PCI_SIZE_1                      0x48    /* 32 bits */
-#define PCI_SIZE_2                      0x4c    /* 32 bits */
-#define PCI_SIZE_3                      0x50    /* 32 bits */
-#define PCI_SIZE_4                      0x54    /* 32 bits */
-#define PCI_SIZE_5                      0x58    /* 32 bits */
-#define PCI_PIO_CONTROL                 0x60    /* 8  bits */
-#define PCI_DVMA_CONTROL                0x62    /* 8  bits */
-#define  PCI_DVMA_CONTROL_INACTIVITY_REQ        (1<<0)
-#define  PCI_DVMA_CONTROL_IOTLB_ENABLE          (1<<0)
-#define  PCI_DVMA_CONTROL_IOTLB_DISABLE         0
-#define  PCI_DVMA_CONTROL_INACTIVITY_ACK        (1<<4)
-#define PCI_INTERRUPT_CONTROL           0x63    /* 8  bits */
-#define PCI_CPU_INTERRUPT_PENDING       0x64    /* 32 bits */
-#define PCI_DIAGNOSTIC_1                0x68    /* 16 bits */
-#define PCI_SOFTWARE_INT_CLEAR          0x6a    /* 16 bits */
-#define PCI_SOFTWARE_INT_SET            0x6e    /* 16 bits */
-#define PCI_SYS_INT_PENDING             0x70    /* 32 bits */
-#define  PCI_SYS_INT_PENDING_PIO		0x40000000
-#define  PCI_SYS_INT_PENDING_DMA		0x20000000
-#define  PCI_SYS_INT_PENDING_PCI		0x10000000
-#define  PCI_SYS_INT_PENDING_APSR		0x08000000
-#define PCI_SYS_INT_TARGET_MASK         0x74    /* 32 bits */
-#define PCI_SYS_INT_TARGET_MASK_CLEAR   0x78    /* 32 bits */
-#define PCI_SYS_INT_TARGET_MASK_SET     0x7c    /* 32 bits */
-#define PCI_SYS_INT_PENDING_CLEAR       0x83    /* 8  bits */
-#define  PCI_SYS_INT_PENDING_CLEAR_ALL		0x80
-#define  PCI_SYS_INT_PENDING_CLEAR_PIO		0x40
-#define  PCI_SYS_INT_PENDING_CLEAR_DMA		0x20
-#define  PCI_SYS_INT_PENDING_CLEAR_PCI		0x10
-#define PCI_IOTLB_CONTROL               0x84    /* 8  bits */
-#define PCI_INT_SELECT_LO               0x88    /* 16 bits */
-#define PCI_ARBITRATION_SELECT          0x8a    /* 16 bits */
-#define PCI_INT_SELECT_HI               0x8c    /* 16 bits */
-#define PCI_HW_INT_OUTPUT               0x8e    /* 16 bits */
-#define PCI_IOTLB_RAM_INPUT             0x90    /* 32 bits */
-#define PCI_IOTLB_CAM_INPUT             0x94    /* 32 bits */
-#define PCI_IOTLB_RAM_OUTPUT            0x98    /* 32 bits */
-#define PCI_IOTLB_CAM_OUTPUT            0x9c    /* 32 bits */
-#define PCI_SMBAR0                      0xa0    /* 8  bits */
-#define PCI_MSIZE0                      0xa1    /* 8  bits */
-#define PCI_PMBAR0                      0xa2    /* 8  bits */
-#define PCI_SMBAR1                      0xa4    /* 8  bits */
-#define PCI_MSIZE1                      0xa5    /* 8  bits */
-#define PCI_PMBAR1                      0xa6    /* 8  bits */
-#define PCI_SIBAR                       0xa8    /* 8  bits */
-#define   PCI_SIBAR_ADDRESS_MASK        0xf
-#define PCI_ISIZE                       0xa9    /* 8  bits */
-#define   PCI_ISIZE_16M                 0xf
-#define   PCI_ISIZE_32M                 0xe
-#define   PCI_ISIZE_64M                 0xc
-#define   PCI_ISIZE_128M                0x8
-#define   PCI_ISIZE_256M                0x0
-#define PCI_PIBAR                       0xaa    /* 8  bits */
-#define PCI_CPU_COUNTER_LIMIT_HI        0xac    /* 32 bits */
-#define PCI_CPU_COUNTER_LIMIT_LO        0xb0    /* 32 bits */
-#define PCI_CPU_COUNTER_LIMIT           0xb4    /* 32 bits */
-#define PCI_SYS_LIMIT                   0xb8    /* 32 bits */
-#define PCI_SYS_COUNTER                 0xbc    /* 32 bits */
-#define   PCI_SYS_COUNTER_OVERFLOW      (1<<31) /* Limit reached */
-#define PCI_SYS_LIMIT_PSEUDO            0xc0    /* 32 bits */
-#define PCI_USER_TIMER_CONTROL          0xc4    /* 8  bits */
-#define PCI_USER_TIMER_CONFIG           0xc5    /* 8  bits */
-#define PCI_COUNTER_IRQ                 0xc6    /* 8  bits */
-#define  PCI_COUNTER_IRQ_SET(sys_irq, cpu_irq)  ((((sys_irq) & 0xf) << 4) | \
-                                                  ((cpu_irq) & 0xf))
-#define  PCI_COUNTER_IRQ_SYS(v)                 (((v) >> 4) & 0xf)
-#define  PCI_COUNTER_IRQ_CPU(v)                 ((v) & 0xf)
-#define PCI_PIO_ERROR_COMMAND           0xc7    /* 8  bits */
-#define PCI_PIO_ERROR_ADDRESS           0xc8    /* 32 bits */
-#define PCI_IOTLB_ERROR_ADDRESS         0xcc    /* 32 bits */
-#define PCI_SYS_STATUS                  0xd0    /* 8  bits */
-#define   PCI_SYS_STATUS_RESET_ENABLE           (1<<0)
-#define   PCI_SYS_STATUS_RESET                  (1<<1)
-#define   PCI_SYS_STATUS_WATCHDOG_RESET         (1<<4)
-#define   PCI_SYS_STATUS_PCI_RESET              (1<<5)
-#define   PCI_SYS_STATUS_PCI_RESET_ENABLE       (1<<6)
-#define   PCI_SYS_STATUS_PCI_SATTELITE_MODE     (1<<7)
-
-#endif /* !(__SPARC_PCIC_H) */
diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index 386bbb30fff2..09577e39037c 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -74,7 +74,6 @@ obj-$(CONFIG_SPARC64)	+= pcr.o
 obj-$(CONFIG_SPARC64)	+= nmi.o
 obj-$(CONFIG_SPARC64_SMP) += cpumap.o
 
-obj-$(CONFIG_PCIC_PCI)    += pcic.o
 obj-$(CONFIG_LEON_PCI)    += leon_pci.o
 obj-$(CONFIG_SPARC_GRPCI2)+= leon_pci_grpci2.o
 obj-$(CONFIG_SPARC_GRPCI1)+= leon_pci_grpci1.o
diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
index 9bd3813b872d..13011969e7eb 100644
--- a/arch/sparc/kernel/entry.S
+++ b/arch/sparc/kernel/entry.S
@@ -965,54 +965,6 @@ restore_current:
 	retl
 	 nop
 
-#ifdef CONFIG_PCIC_PCI
-#include <asm/pcic.h>
-
-	.align	4
-	.globl	linux_trap_ipi15_pcic
-linux_trap_ipi15_pcic:
-	rd	%wim, %l3
-	SAVE_ALL
-
-	/*
-	 * First deactivate NMI
-	 * or we cannot drop ET, cannot get window spill traps.
-	 * The busy loop is necessary because the PIO error
-	 * sometimes does not go away quickly and we trap again.
-	 */
-	sethi	%hi(pcic_regs), %o1
-	ld	[%o1 + %lo(pcic_regs)], %o2
-
-	! Get pending status for printouts later.
-	ld	[%o2 + PCI_SYS_INT_PENDING], %o0
-
-	mov	PCI_SYS_INT_PENDING_CLEAR_ALL, %o1
-	stb	%o1, [%o2 + PCI_SYS_INT_PENDING_CLEAR]
-1:
-	ld	[%o2 + PCI_SYS_INT_PENDING], %o1
-	andcc	%o1, ((PCI_SYS_INT_PENDING_PIO|PCI_SYS_INT_PENDING_PCI)>>24), %g0
-	bne	1b
-	 nop
-
-	or	%l0, PSR_PIL, %l4
-	wr	%l4, 0x0, %psr
-	WRITE_PAUSE
-	wr	%l4, PSR_ET, %psr
-	WRITE_PAUSE
-
-	call	pcic_nmi
-	 add	%sp, STACKFRAME_SZ, %o1	! struct pt_regs *regs
-	RESTORE_ALL
-
-	.globl	pcic_nmi_trap_patch
-pcic_nmi_trap_patch:
-	sethi	%hi(linux_trap_ipi15_pcic), %l3
-	jmpl	%l3 + %lo(linux_trap_ipi15_pcic), %g0
-	 rd	%psr, %l0
-	.word	0
-
-#endif /* CONFIG_PCIC_PCI */
-
 	.globl	flushw_all
 flushw_all:
 	save	%sp, -0x40, %sp
diff --git a/arch/sparc/kernel/irq_32.c b/arch/sparc/kernel/irq_32.c
index 135170f362c1..a6af08fce796 100644
--- a/arch/sparc/kernel/irq_32.c
+++ b/arch/sparc/kernel/irq_32.c
@@ -19,7 +19,6 @@
 #include <asm/cacheflush.h>
 #include <asm/cpudata.h>
 #include <asm/setup.h>
-#include <asm/pcic.h>
 #include <asm/leon.h>
 
 #include "kernel.h"
diff --git a/arch/sparc/kernel/kernel.h b/arch/sparc/kernel/kernel.h
index ff8f412e3153..a14812903629 100644
--- a/arch/sparc/kernel/kernel.h
+++ b/arch/sparc/kernel/kernel.h
@@ -138,10 +138,6 @@ asmlinkage void user_unaligned_trap(struct pt_regs *regs, unsigned int insn);
 /* windows.c */
 void try_to_clear_window_buffer(struct pt_regs *regs, int who);
 
-/* pcic.c */
-extern void __iomem *pcic_regs;
-void pcic_nmi(unsigned int pend, struct pt_regs *regs);
-
 /* time_32.c */
 void __init time_init(void);
 
diff --git a/arch/sparc/kernel/pcic.c b/arch/sparc/kernel/pcic.c
deleted file mode 100644
index d952bcbbc395..000000000000
--- a/arch/sparc/kernel/pcic.c
+++ /dev/null
@@ -1,829 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * pcic.c: MicroSPARC-IIep PCI controller support
- *
- * Copyright (C) 1998 V. Roganov and G. Raiko
- *
- * Code is derived from Ultra/PCI PSYCHO controller support, see that
- * for author info.
- *
- * Support for diverse IIep based platforms by Pete Zaitcev.
- * CP-1200 by Eric Brower.
- */
-
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/init.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/jiffies.h>
-
-#include <asm/swift.h> /* for cache flushing. */
-#include <asm/io.h>
-
-#include <linux/ctype.h>
-#include <linux/pci.h>
-#include <linux/time.h>
-#include <linux/timex.h>
-#include <linux/interrupt.h>
-#include <linux/export.h>
-
-#include <asm/irq.h>
-#include <asm/oplib.h>
-#include <asm/prom.h>
-#include <asm/pcic.h>
-#include <asm/timex.h>
-#include <asm/timer.h>
-#include <linux/uaccess.h>
-#include <asm/irq_regs.h>
-
-#include "kernel.h"
-#include "irq.h"
-
-/*
- * I studied different documents and many live PROMs both from 2.30
- * family and 3.xx versions. I came to the amazing conclusion: there is
- * absolutely no way to route interrupts in IIep systems relying on
- * information which PROM presents. We must hardcode interrupt routing
- * schematics. And this actually sucks.   -- zaitcev 1999/05/12
- *
- * To find irq for a device we determine which routing map
- * is in effect or, in other words, on which machine we are running.
- * We use PROM name for this although other techniques may be used
- * in special cases (Gleb reports a PROMless IIep based system).
- * Once we know the map we take device configuration address and
- * find PCIC pin number where INT line goes. Then we may either program
- * preferred irq into the PCIC or supply the preexisting irq to the device.
- */
-struct pcic_ca2irq {
-	unsigned char busno;		/* PCI bus number */
-	unsigned char devfn;		/* Configuration address */
-	unsigned char pin;		/* PCIC external interrupt pin */
-	unsigned char irq;		/* Preferred IRQ (mappable in PCIC) */
-	unsigned int force;		/* Enforce preferred IRQ */
-};
-
-struct pcic_sn2list {
-	char *sysname;
-	struct pcic_ca2irq *intmap;
-	int mapdim;
-};
-
-/*
- * JavaEngine-1 apparently has different versions.
- *
- * According to communications with Sun folks, for P2 build 501-4628-03:
- * pin 0 - parallel, audio;
- * pin 1 - Ethernet;
- * pin 2 - su;
- * pin 3 - PS/2 kbd and mouse.
- *
- * OEM manual (805-1486):
- * pin 0: Ethernet
- * pin 1: All EBus
- * pin 2: IGA (unused)
- * pin 3: Not connected
- * OEM manual says that 501-4628 & 501-4811 are the same thing,
- * only the latter has NAND flash in place.
- *
- * So far unofficial Sun wins over the OEM manual. Poor OEMs...
- */
-static struct pcic_ca2irq pcic_i_je1a[] = {	/* 501-4811-03 */
-	{ 0, 0x00, 2, 12, 0 },		/* EBus: hogs all */
-	{ 0, 0x01, 1,  6, 1 },		/* Happy Meal */
-	{ 0, 0x80, 0,  7, 0 },		/* IGA (unused) */
-};
-
-/* XXX JS-E entry is incomplete - PCI Slot 2 address (pin 7)? */
-static struct pcic_ca2irq pcic_i_jse[] = {
-	{ 0, 0x00, 0, 13, 0 },		/* Ebus - serial and keyboard */
-	{ 0, 0x01, 1,  6, 0 },		/* hme */
-	{ 0, 0x08, 2,  9, 0 },		/* VGA - we hope not used :) */
-	{ 0, 0x10, 6,  8, 0 },		/* PCI INTA# in Slot 1 */
-	{ 0, 0x18, 7, 12, 0 },		/* PCI INTA# in Slot 2, shared w. RTC */
-	{ 0, 0x38, 4,  9, 0 },		/* All ISA devices. Read 8259. */
-	{ 0, 0x80, 5, 11, 0 },		/* EIDE */
-	/* {0,0x88, 0,0,0} - unknown device... PMU? Probably no interrupt. */
-	{ 0, 0xA0, 4,  9, 0 },		/* USB */
-	/*
-	 * Some pins belong to non-PCI devices, we hardcode them in drivers.
-	 * sun4m timers - irq 10, 14
-	 * PC style RTC - pin 7, irq 4 ?
-	 * Smart card, Parallel - pin 4 shared with USB, ISA
-	 * audio - pin 3, irq 5 ?
-	 */
-};
-
-/* SPARCengine-6 was the original release name of CP1200.
- * The documentation differs between the two versions
- */
-static struct pcic_ca2irq pcic_i_se6[] = {
-	{ 0, 0x08, 0,  2, 0 },		/* SCSI	*/
-	{ 0, 0x01, 1,  6, 0 },		/* HME	*/
-	{ 0, 0x00, 3, 13, 0 },		/* EBus	*/
-};
-
-/*
- * Krups (courtesy of Varol Kaptan)
- * No documentation available, but it was easy to guess
- * because it was very similar to Espresso.
- *  
- * pin 0 - kbd, mouse, serial;
- * pin 1 - Ethernet;
- * pin 2 - igs (we do not use it);
- * pin 3 - audio;
- * pin 4,5,6 - unused;
- * pin 7 - RTC (from P2 onwards as David B. says).
- */
-static struct pcic_ca2irq pcic_i_jk[] = {
-	{ 0, 0x00, 0, 13, 0 },		/* Ebus - serial and keyboard */
-	{ 0, 0x01, 1,  6, 0 },		/* hme */
-};
-
-/*
- * Several entries in this list may point to the same routing map
- * as several PROMs may be installed on the same physical board.
- */
-#define SN2L_INIT(name, map)	\
-  { name, map, ARRAY_SIZE(map) }
-
-static struct pcic_sn2list pcic_known_sysnames[] = {
-	SN2L_INIT("SUNW,JavaEngine1", pcic_i_je1a),	/* JE1, PROM 2.32 */
-	SN2L_INIT("SUNW,JS-E", pcic_i_jse),	/* PROLL JavaStation-E */
-	SN2L_INIT("SUNW,SPARCengine-6", pcic_i_se6), /* SPARCengine-6/CP-1200 */
-	SN2L_INIT("SUNW,JS-NC", pcic_i_jk),	/* PROLL JavaStation-NC */
-	SN2L_INIT("SUNW,JSIIep", pcic_i_jk),	/* OBP JavaStation-NC */
-	{ NULL, NULL, 0 }
-};
-
-/*
- * Only one PCIC per IIep,
- * and since we have no SMP IIep, only one per system.
- */
-static int pcic0_up;
-static struct linux_pcic pcic0;
-
-void __iomem *pcic_regs;
-static volatile int pcic_speculative;
-static volatile int pcic_trapped;
-
-/* forward */
-unsigned int pcic_build_device_irq(struct platform_device *op,
-                                   unsigned int real_irq);
-
-#define CONFIG_CMD(bus, device_fn, where) (0x80000000 | (((unsigned int)bus) << 16) | (((unsigned int)device_fn) << 8) | (where & ~3))
-
-static int pcic_read_config_dword(unsigned int busno, unsigned int devfn,
-    int where, u32 *value)
-{
-	struct linux_pcic *pcic;
-	unsigned long flags;
-
-	pcic = &pcic0;
-
-	local_irq_save(flags);
-#if 0 /* does not fail here */
-	pcic_speculative = 1;
-	pcic_trapped = 0;
-#endif
-	writel(CONFIG_CMD(busno, devfn, where), pcic->pcic_config_space_addr);
-#if 0 /* does not fail here */
-	nop();
-	if (pcic_trapped) {
-		local_irq_restore(flags);
-		*value = ~0;
-		return 0;
-	}
-#endif
-	pcic_speculative = 2;
-	pcic_trapped = 0;
-	*value = readl(pcic->pcic_config_space_data + (where&4));
-	nop();
-	if (pcic_trapped) {
-		pcic_speculative = 0;
-		local_irq_restore(flags);
-		*value = ~0;
-		return 0;
-	}
-	pcic_speculative = 0;
-	local_irq_restore(flags);
-	return 0;
-}
-
-static int pcic_read_config(struct pci_bus *bus, unsigned int devfn,
-   int where, int size, u32 *val)
-{
-	unsigned int v;
-
-	if (bus->number != 0) return -EINVAL;
-	switch (size) {
-	case 1:
-		pcic_read_config_dword(bus->number, devfn, where&~3, &v);
-		*val = 0xff & (v >> (8*(where & 3)));
-		return 0;
-	case 2:
-		if (where&1) return -EINVAL;
-		pcic_read_config_dword(bus->number, devfn, where&~3, &v);
-		*val = 0xffff & (v >> (8*(where & 3)));
-		return 0;
-	case 4:
-		if (where&3) return -EINVAL;
-		pcic_read_config_dword(bus->number, devfn, where&~3, val);
-		return 0;
-	}
-	return -EINVAL;
-}
-
-static int pcic_write_config_dword(unsigned int busno, unsigned int devfn,
-    int where, u32 value)
-{
-	struct linux_pcic *pcic;
-	unsigned long flags;
-
-	pcic = &pcic0;
-
-	local_irq_save(flags);
-	writel(CONFIG_CMD(busno, devfn, where), pcic->pcic_config_space_addr);
-	writel(value, pcic->pcic_config_space_data + (where&4));
-	local_irq_restore(flags);
-	return 0;
-}
-
-static int pcic_write_config(struct pci_bus *bus, unsigned int devfn,
-   int where, int size, u32 val)
-{
-	unsigned int v;
-
-	if (bus->number != 0) return -EINVAL;
-	switch (size) {
-	case 1:
-		pcic_read_config_dword(bus->number, devfn, where&~3, &v);
-		v = (v & ~(0xff << (8*(where&3)))) |
-		    ((0xff&val) << (8*(where&3)));
-		return pcic_write_config_dword(bus->number, devfn, where&~3, v);
-	case 2:
-		if (where&1) return -EINVAL;
-		pcic_read_config_dword(bus->number, devfn, where&~3, &v);
-		v = (v & ~(0xffff << (8*(where&3)))) |
-		    ((0xffff&val) << (8*(where&3)));
-		return pcic_write_config_dword(bus->number, devfn, where&~3, v);
-	case 4:
-		if (where&3) return -EINVAL;
-		return pcic_write_config_dword(bus->number, devfn, where, val);
-	}
-	return -EINVAL;
-}
-
-static struct pci_ops pcic_ops = {
-	.read =		pcic_read_config,
-	.write =	pcic_write_config,
-};
-
-/*
- * On sparc64 pcibios_init() calls pci_controller_probe().
- * We want PCIC probed little ahead so that interrupt controller
- * would be operational.
- */
-int __init pcic_probe(void)
-{
-	struct linux_pcic *pcic;
-	struct linux_prom_registers regs[PROMREG_MAX];
-	struct linux_pbm_info* pbm;
-	char namebuf[64];
-	phandle node;
-	int err;
-
-	if (pcic0_up) {
-		prom_printf("PCIC: called twice!\n");
-		prom_halt();
-	}
-	pcic = &pcic0;
-
-	node = prom_getchild (prom_root_node);
-	node = prom_searchsiblings (node, "pci");
-	if (node == 0)
-		return -ENODEV;
-	/*
-	 * Map in PCIC register set, config space, and IO base
-	 */
-	err = prom_getproperty(node, "reg", (char*)regs, sizeof(regs));
-	if (err == 0 || err == -1) {
-		prom_printf("PCIC: Error, cannot get PCIC registers "
-			    "from PROM.\n");
-		prom_halt();
-	}
-
-	pcic0_up = 1;
-
-	pcic->pcic_res_regs.name = "pcic_registers";
-	pcic->pcic_regs = ioremap(regs[0].phys_addr, regs[0].reg_size);
-	if (!pcic->pcic_regs) {
-		prom_printf("PCIC: Error, cannot map PCIC registers.\n");
-		prom_halt();
-	}
-
-	pcic->pcic_res_io.name = "pcic_io";
-	if ((pcic->pcic_io = (unsigned long)
-	    ioremap(regs[1].phys_addr, 0x10000)) == 0) {
-		prom_printf("PCIC: Error, cannot map PCIC IO Base.\n");
-		prom_halt();
-	}
-
-	pcic->pcic_res_cfg_addr.name = "pcic_cfg_addr";
-	if ((pcic->pcic_config_space_addr =
-	    ioremap(regs[2].phys_addr, regs[2].reg_size * 2)) == NULL) {
-		prom_printf("PCIC: Error, cannot map "
-			    "PCI Configuration Space Address.\n");
-		prom_halt();
-	}
-
-	/*
-	 * Docs say three least significant bits in address and data
-	 * must be the same. Thus, we need adjust size of data.
-	 */
-	pcic->pcic_res_cfg_data.name = "pcic_cfg_data";
-	if ((pcic->pcic_config_space_data =
-	    ioremap(regs[3].phys_addr, regs[3].reg_size * 2)) == NULL) {
-		prom_printf("PCIC: Error, cannot map "
-			    "PCI Configuration Space Data.\n");
-		prom_halt();
-	}
-
-	pbm = &pcic->pbm;
-	pbm->prom_node = node;
-	prom_getstring(node, "name", namebuf, 63);  namebuf[63] = 0;
-	strcpy(pbm->prom_name, namebuf);
-
-	prom_getstring(prom_root_node, "name", namebuf, 63);  namebuf[63] = 0;
-	{
-		struct pcic_sn2list *p;
-
-		for (p = pcic_known_sysnames; p->sysname != NULL; p++) {
-			if (strcmp(namebuf, p->sysname) == 0)
-				break;
-		}
-		pcic->pcic_imap = p->intmap;
-		pcic->pcic_imdim = p->mapdim;
-	}
-	if (pcic->pcic_imap == NULL) {
-		/*
-		 * We do not panic here for the sake of embedded systems.
-		 */
-		printk("PCIC: System %s is unknown, cannot route interrupts\n",
-		    namebuf);
-	}
-
-	return 0;
-}
-
-static void __init pcic_pbm_scan_bus(struct linux_pcic *pcic)
-{
-	struct linux_pbm_info *pbm = &pcic->pbm;
-
-	pbm->pci_bus = pci_scan_bus(pbm->pci_first_busno, &pcic_ops, pbm);
-	if (!pbm->pci_bus)
-		return;
-
-#if 0 /* deadwood transplanted from sparc64 */
-	pci_fill_in_pbm_cookies(pbm->pci_bus, pbm, pbm->prom_node);
-	pci_record_assignments(pbm, pbm->pci_bus);
-	pci_assign_unassigned(pbm, pbm->pci_bus);
-	pci_fixup_irq(pbm, pbm->pci_bus);
-#endif
-	pci_bus_add_devices(pbm->pci_bus);
-}
-
-/*
- * Main entry point from the PCI subsystem.
- */
-static int __init pcic_init(void)
-{
-	struct linux_pcic *pcic;
-
-	/*
-	 * PCIC should be initialized at start of the timer.
-	 * So, here we report the presence of PCIC and do some magic passes.
-	 */
-	if(!pcic0_up)
-		return 0;
-	pcic = &pcic0;
-
-	/*
-	 *      Switch off IOTLB translation.
-	 */
-	writeb(PCI_DVMA_CONTROL_IOTLB_DISABLE, 
-	       pcic->pcic_regs+PCI_DVMA_CONTROL);
-
-	/*
-	 *      Increase mapped size for PCI memory space (DMA access).
-	 *      Should be done in that order (size first, address second).
-	 *      Why we couldn't set up 4GB and forget about it? XXX
-	 */
-	writel(0xF0000000UL, pcic->pcic_regs+PCI_SIZE_0);
-	writel(0+PCI_BASE_ADDRESS_SPACE_MEMORY, 
-	       pcic->pcic_regs+PCI_BASE_ADDRESS_0);
-
-	pcic_pbm_scan_bus(pcic);
-
-	return 0;
-}
-
-int pcic_present(void)
-{
-	return pcic0_up;
-}
-
-static int pdev_to_pnode(struct linux_pbm_info *pbm, struct pci_dev *pdev)
-{
-	struct linux_prom_pci_registers regs[PROMREG_MAX];
-	int err;
-	phandle node = prom_getchild(pbm->prom_node);
-
-	while(node) {
-		err = prom_getproperty(node, "reg", 
-				       (char *)&regs[0], sizeof(regs));
-		if(err != 0 && err != -1) {
-			unsigned long devfn = (regs[0].which_io >> 8) & 0xff;
-			if(devfn == pdev->devfn)
-				return node;
-		}
-		node = prom_getsibling(node);
-	}
-	return 0;
-}
-
-static inline struct pcidev_cookie *pci_devcookie_alloc(void)
-{
-	return kmalloc(sizeof(struct pcidev_cookie), GFP_ATOMIC);
-}
-
-static void pcic_map_pci_device(struct linux_pcic *pcic,
-    struct pci_dev *dev, int node)
-{
-	char namebuf[64];
-	unsigned long address;
-	unsigned long flags;
-	int j;
-
-	if (node == 0 || node == -1) {
-		strcpy(namebuf, "???");
-	} else {
-		prom_getstring(node, "name", namebuf, 63); namebuf[63] = 0;
-	}
-
-	for (j = 0; j < 6; j++) {
-		address = dev->resource[j].start;
-		if (address == 0) break;	/* are sequential */
-		flags = dev->resource[j].flags;
-		if ((flags & IORESOURCE_IO) != 0) {
-			if (address < 0x10000) {
-				/*
-				 * A device responds to I/O cycles on PCI.
-				 * We generate these cycles with memory
-				 * access into the fixed map (phys 0x30000000).
-				 *
-				 * Since a device driver does not want to
-				 * do ioremap() before accessing PC-style I/O,
-				 * we supply virtual, ready to access address.
-				 *
-				 * Note that request_region()
-				 * works for these devices.
-				 *
-				 * XXX Neat trick, but it's a *bad* idea
-				 * to shit into regions like that.
-				 * What if we want to allocate one more
-				 * PCI base address...
-				 */
-				dev->resource[j].start =
-				    pcic->pcic_io + address;
-				dev->resource[j].end = 1;  /* XXX */
-				dev->resource[j].flags =
-				    (flags & ~IORESOURCE_IO) | IORESOURCE_MEM;
-			} else {
-				/*
-				 * OOPS... PCI Spec allows this. Sun does
-				 * not have any devices getting above 64K
-				 * so it must be user with a weird I/O
-				 * board in a PCI slot. We must remap it
-				 * under 64K but it is not done yet. XXX
-				 */
-				pci_info(dev, "PCIC: Skipping I/O space at "
-					 "0x%lx, this will Oops if a driver "
-					 "attaches device '%s'\n", address,
-					 namebuf);
-			}
-		}
-	}
-}
-
-static void
-pcic_fill_irq(struct linux_pcic *pcic, struct pci_dev *dev, int node)
-{
-	struct pcic_ca2irq *p;
-	unsigned int real_irq;
-	int i, ivec;
-	char namebuf[64];
-
-	if (node == 0 || node == -1) {
-		strcpy(namebuf, "???");
-	} else {
-		prom_getstring(node, "name", namebuf, sizeof(namebuf));
-	}
-
-	if ((p = pcic->pcic_imap) == NULL) {
-		dev->irq = 0;
-		return;
-	}
-	for (i = 0; i < pcic->pcic_imdim; i++) {
-		if (p->busno == dev->bus->number && p->devfn == dev->devfn)
-			break;
-		p++;
-	}
-	if (i >= pcic->pcic_imdim) {
-		pci_info(dev, "PCIC: device %s not found in %d\n", namebuf,
-			 pcic->pcic_imdim);
-		dev->irq = 0;
-		return;
-	}
-
-	i = p->pin;
-	if (i >= 0 && i < 4) {
-		ivec = readw(pcic->pcic_regs+PCI_INT_SELECT_LO);
-		real_irq = ivec >> (i << 2) & 0xF;
-	} else if (i >= 4 && i < 8) {
-		ivec = readw(pcic->pcic_regs+PCI_INT_SELECT_HI);
-		real_irq = ivec >> ((i-4) << 2) & 0xF;
-	} else {					/* Corrupted map */
-		pci_info(dev, "PCIC: BAD PIN %d\n", i); for (;;) {}
-	}
-/* P3 */ /* printk("PCIC: device %s pin %d ivec 0x%x irq %x\n", namebuf, i, ivec, dev->irq); */
-
-	/* real_irq means PROM did not bother to program the upper
-	 * half of PCIC. This happens on JS-E with PROM 3.11, for instance.
-	 */
-	if (real_irq == 0 || p->force) {
-		if (p->irq == 0 || p->irq >= 15) {	/* Corrupted map */
-			pci_info(dev, "PCIC: BAD IRQ %d\n", p->irq); for (;;) {}
-		}
-		pci_info(dev, "PCIC: setting irq %d at pin %d\n", p->irq,
-			 p->pin);
-		real_irq = p->irq;
-
-		i = p->pin;
-		if (i >= 4) {
-			ivec = readw(pcic->pcic_regs+PCI_INT_SELECT_HI);
-			ivec &= ~(0xF << ((i - 4) << 2));
-			ivec |= p->irq << ((i - 4) << 2);
-			writew(ivec, pcic->pcic_regs+PCI_INT_SELECT_HI);
-		} else {
-			ivec = readw(pcic->pcic_regs+PCI_INT_SELECT_LO);
-			ivec &= ~(0xF << (i << 2));
-			ivec |= p->irq << (i << 2);
-			writew(ivec, pcic->pcic_regs+PCI_INT_SELECT_LO);
-		}
-	}
-	dev->irq = pcic_build_device_irq(NULL, real_irq);
-}
-
-/*
- * Normally called from {do_}pci_scan_bus...
- */
-void pcibios_fixup_bus(struct pci_bus *bus)
-{
-	struct pci_dev *dev;
-	struct linux_pcic *pcic;
-	/* struct linux_pbm_info* pbm = &pcic->pbm; */
-	int node;
-	struct pcidev_cookie *pcp;
-
-	if (!pcic0_up) {
-		pci_info(bus, "pcibios_fixup_bus: no PCIC\n");
-		return;
-	}
-	pcic = &pcic0;
-
-	/*
-	 * Next crud is an equivalent of pbm = pcic_bus_to_pbm(bus);
-	 */
-	if (bus->number != 0) {
-		pci_info(bus, "pcibios_fixup_bus: nonzero bus 0x%x\n",
-			 bus->number);
-		return;
-	}
-
-	list_for_each_entry(dev, &bus->devices, bus_list) {
-		node = pdev_to_pnode(&pcic->pbm, dev);
-		if(node == 0)
-			node = -1;
-
-		/* cookies */
-		pcp = pci_devcookie_alloc();
-		pcp->pbm = &pcic->pbm;
-		pcp->prom_node = of_find_node_by_phandle(node);
-		dev->sysdata = pcp;
-
-		/* fixing I/O to look like memory */
-		if ((dev->class>>16) != PCI_BASE_CLASS_BRIDGE)
-			pcic_map_pci_device(pcic, dev, node);
-
-		pcic_fill_irq(pcic, dev, node);
-	}
-}
-
-int pcibios_enable_device(struct pci_dev *dev, int mask)
-{
-	struct resource *res;
-	u16 cmd, oldcmd;
-	int i;
-
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	oldcmd = cmd;
-
-	pci_dev_for_each_resource(dev, res, i) {
-		/* Only set up the requested stuff */
-		if (!(mask & (1<<i)))
-			continue;
-
-		if (res->flags & IORESOURCE_IO)
-			cmd |= PCI_COMMAND_IO;
-		if (res->flags & IORESOURCE_MEM)
-			cmd |= PCI_COMMAND_MEMORY;
-	}
-
-	if (cmd != oldcmd) {
-		pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd);
-		pci_write_config_word(dev, PCI_COMMAND, cmd);
-	}
-	return 0;
-}
-
-/* Makes compiler happy */
-static volatile int pcic_timer_dummy;
-
-static void pcic_clear_clock_irq(void)
-{
-	pcic_timer_dummy = readl(pcic0.pcic_regs+PCI_SYS_LIMIT);
-}
-
-/* CPU frequency is 100 MHz, timer increments every 4 CPU clocks */
-#define USECS_PER_JIFFY  (1000000 / HZ)
-#define TICK_TIMER_LIMIT ((100 * 1000000 / 4) / HZ)
-
-static unsigned int pcic_cycles_offset(void)
-{
-	u32 value, count;
-
-	value = readl(pcic0.pcic_regs + PCI_SYS_COUNTER);
-	count = value & ~PCI_SYS_COUNTER_OVERFLOW;
-
-	if (value & PCI_SYS_COUNTER_OVERFLOW)
-		count += TICK_TIMER_LIMIT;
-	/*
-	 * We divide all by HZ
-	 * to have microsecond resolution and to avoid overflow
-	 */
-	count = ((count / HZ) * USECS_PER_JIFFY) / (TICK_TIMER_LIMIT / HZ);
-
-	/* Coordinate with the sparc_config.clock_rate setting */
-	return count * 2;
-}
-
-void __init pci_time_init(void)
-{
-	struct linux_pcic *pcic = &pcic0;
-	unsigned long v;
-	int timer_irq, irq;
-	int err;
-
-#ifndef CONFIG_SMP
-	/*
-	 * The clock_rate is in SBUS dimension.
-	 * We take into account this in pcic_cycles_offset()
-	 */
-	sparc_config.clock_rate = SBUS_CLOCK_RATE / HZ;
-	sparc_config.features |= FEAT_L10_CLOCKEVENT;
-#endif
-	sparc_config.features |= FEAT_L10_CLOCKSOURCE;
-	sparc_config.get_cycles_offset = pcic_cycles_offset;
-
-	writel (TICK_TIMER_LIMIT, pcic->pcic_regs+PCI_SYS_LIMIT);
-	/* PROM should set appropriate irq */
-	v = readb(pcic->pcic_regs+PCI_COUNTER_IRQ);
-	timer_irq = PCI_COUNTER_IRQ_SYS(v);
-	writel (PCI_COUNTER_IRQ_SET(timer_irq, 0),
-		pcic->pcic_regs+PCI_COUNTER_IRQ);
-	irq = pcic_build_device_irq(NULL, timer_irq);
-	err = request_irq(irq, timer_interrupt,
-			  IRQF_TIMER, "timer", NULL);
-	if (err) {
-		prom_printf("time_init: unable to attach IRQ%d\n", timer_irq);
-		prom_halt();
-	}
-	local_irq_enable();
-}
-
-
-#if 0
-static void watchdog_reset() {
-	writeb(0, pcic->pcic_regs+PCI_SYS_STATUS);
-}
-#endif
-
-/*
- * NMI
- */
-void pcic_nmi(unsigned int pend, struct pt_regs *regs)
-{
-	pend = swab32(pend);
-
-	if (!pcic_speculative || (pend & PCI_SYS_INT_PENDING_PIO) == 0) {
-		/*
-		 * XXX On CP-1200 PCI #SERR may happen, we do not know
-		 * what to do about it yet.
-		 */
-		printk("Aiee, NMI pend 0x%x pc 0x%x spec %d, hanging\n",
-		    pend, (int)regs->pc, pcic_speculative);
-		for (;;) { }
-	}
-	pcic_speculative = 0;
-	pcic_trapped = 1;
-	regs->pc = regs->npc;
-	regs->npc += 4;
-}
-
-static inline unsigned long get_irqmask(int irq_nr)
-{
-	return 1 << irq_nr;
-}
-
-static void pcic_mask_irq(struct irq_data *data)
-{
-	unsigned long mask, flags;
-
-	mask = (unsigned long)data->chip_data;
-	local_irq_save(flags);
-	writel(mask, pcic0.pcic_regs+PCI_SYS_INT_TARGET_MASK_SET);
-	local_irq_restore(flags);
-}
-
-static void pcic_unmask_irq(struct irq_data *data)
-{
-	unsigned long mask, flags;
-
-	mask = (unsigned long)data->chip_data;
-	local_irq_save(flags);
-	writel(mask, pcic0.pcic_regs+PCI_SYS_INT_TARGET_MASK_CLEAR);
-	local_irq_restore(flags);
-}
-
-static unsigned int pcic_startup_irq(struct irq_data *data)
-{
-	irq_link(data->irq);
-	pcic_unmask_irq(data);
-	return 0;
-}
-
-static struct irq_chip pcic_irq = {
-	.name		= "pcic",
-	.irq_startup	= pcic_startup_irq,
-	.irq_mask	= pcic_mask_irq,
-	.irq_unmask	= pcic_unmask_irq,
-};
-
-unsigned int pcic_build_device_irq(struct platform_device *op,
-                                   unsigned int real_irq)
-{
-	unsigned int irq;
-	unsigned long mask;
-
-	irq = 0;
-	mask = get_irqmask(real_irq);
-	if (mask == 0)
-		goto out;
-
-	irq = irq_alloc(real_irq, real_irq);
-	if (irq == 0)
-		goto out;
-
-	irq_set_chip_and_handler_name(irq, &pcic_irq,
-	                              handle_level_irq, "PCIC");
-	irq_set_chip_data(irq, (void *)mask);
-
-out:
-	return irq;
-}
-
-
-static void pcic_load_profile_irq(int cpu, unsigned int limit)
-{
-	printk("PCIC: unimplemented code: FILE=%s LINE=%d", __FILE__, __LINE__);
-}
-
-void __init sun4m_pci_init_IRQ(void)
-{
-	sparc_config.build_device_irq = pcic_build_device_irq;
-	sparc_config.clear_clock_irq  = pcic_clear_clock_irq;
-	sparc_config.load_profile_irq = pcic_load_profile_irq;
-}
-
-subsys_initcall(pcic_init);
diff --git a/arch/sparc/kernel/time_32.c b/arch/sparc/kernel/time_32.c
index 08bbdc458596..848404610b86 100644
--- a/arch/sparc/kernel/time_32.c
+++ b/arch/sparc/kernel/time_32.c
@@ -43,7 +43,6 @@
 #include <asm/io.h>
 #include <asm/idprom.h>
 #include <asm/page.h>
-#include <asm/pcic.h>
 #include <asm/irq_regs.h>
 #include <asm/setup.h>
 
@@ -347,9 +346,6 @@ void __init time_init(void)
 	sparc_config.features = 0;
 	late_time_init = sparc32_late_time_init;
 
-	if (pcic_present())
-		pci_time_init();
-	else
-		sbus_time_init();
+	sbus_time_init();
 }
 

-- 
2.34.1

