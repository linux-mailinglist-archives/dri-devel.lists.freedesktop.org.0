Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D348192DF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACA510E51E;
	Tue, 19 Dec 2023 22:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE45910E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39E17614BF;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96835C433CA;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023395;
 bh=lDrIpv+Vvy4Ng5UqEvwvmrUkOjepCnMUtodLTS55HZA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=TMt0yOSA2ChLdtbzRtR3zH4/2WypieBzeoWx7IHwppusG3yhkaK+Dw8f7uKfEYqmK
 gnN74o79GFRchP/W5OC4Z3chhiFe1Pedqjx8blexGhok3iur64PvZqrNN+M80h5eoM
 u0deXzqToMrcOaV5ihiM/RcbE/l6a8Kb+mS9S4jtucjkBmnyU8sFXp2ZZcQXzP8S9l
 tYg6nT3jtAN7hzO2lYaK836nsBNU/kQyvLBb7s04zG2wIUvhiDVRGpA4Te+4legrRH
 f+QnQh+sOYTeWi8GNyMmyXdPCqksKTr+AB1cEj43uNx+6PBw31anH1YMcsYR/CzTvW
 Z27yaD/CmgWRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF60C46CD8;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:08 +0100
Subject: [PATCH 03/27] sparc32: Drop floppy support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-3-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=19846;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=m2/MK/BLIa9J3uhewvzMgBnAlbjpMCNEJ46bs8VF1tI=; =?utf-8?q?b=3DQQHSeD7dzx5z?=
 =?utf-8?q?Nx2DaDp4DRmMy1ul1LaTvsCpPx2/Sb6NSMaJxtz2iFFdVbr93lQ1q+rr7qQPXWlB?=
 DZS+bQsTCrzV43KdmnNFm5TRtEJriBvaGBAwpf1IaFFvczniCXMQ
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

LEON do not have floppy support so we can drop it

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/Kconfig                 |   2 +-
 arch/sparc/include/asm/floppy.h    |   2 -
 arch/sparc/include/asm/floppy_32.h | 393 -------------------------------------
 arch/sparc/kernel/entry.S          | 137 -------------
 arch/sparc/kernel/irq.h            |   3 -
 arch/sparc/kernel/irq_32.c         |  93 ---------
 arch/sparc/kernel/kernel.h         |   2 -
 7 files changed, 1 insertion(+), 631 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 49849790e66d..54c91431724b 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -195,7 +195,7 @@ config GENERIC_CALIBRATE_DELAY
 
 config ARCH_MAY_HAVE_PC_FDC
 	bool
-	default y
+	default y if SPARC64
 
 config EMULATED_CMPXCHG
 	bool
diff --git a/arch/sparc/include/asm/floppy.h b/arch/sparc/include/asm/floppy.h
index 4b315802e635..c89f719a18e9 100644
--- a/arch/sparc/include/asm/floppy.h
+++ b/arch/sparc/include/asm/floppy.h
@@ -3,7 +3,5 @@
 #define ___ASM_SPARC_FLOPPY_H
 #if defined(__sparc__) && defined(__arch64__)
 #include <asm/floppy_64.h>
-#else
-#include <asm/floppy_32.h>
 #endif
 #endif
diff --git a/arch/sparc/include/asm/floppy_32.h b/arch/sparc/include/asm/floppy_32.h
deleted file mode 100644
index 836f6575aa1d..000000000000
--- a/arch/sparc/include/asm/floppy_32.h
+++ /dev/null
@@ -1,393 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* asm/floppy.h: Sparc specific parts of the Floppy driver.
- *
- * Copyright (C) 1995 David S. Miller (davem@davemloft.net)
- */
-
-#ifndef __ASM_SPARC_FLOPPY_H
-#define __ASM_SPARC_FLOPPY_H
-
-#include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/pgtable.h>
-
-#include <asm/idprom.h>
-#include <asm/oplib.h>
-#include <asm/auxio.h>
-#include <asm/setup.h>
-#include <asm/page.h>
-#include <asm/irq.h>
-
-/* We don't need no stinkin' I/O port allocation crap. */
-#undef release_region
-#undef request_region
-#define release_region(X, Y)	do { } while(0)
-#define request_region(X, Y, Z)	(1)
-
-/* References:
- * 1) Netbsd Sun floppy driver.
- * 2) NCR 82077 controller manual
- * 3) Intel 82077 controller manual
- */
-struct sun_flpy_controller {
-	volatile unsigned char status_82072;  /* Main Status reg. */
-#define dcr_82072              status_82072   /* Digital Control reg. */
-#define status1_82077          status_82072   /* Auxiliary Status reg. 1 */
-
-	volatile unsigned char data_82072;    /* Data fifo. */
-#define status2_82077          data_82072     /* Auxiliary Status reg. 2 */
-
-	volatile unsigned char dor_82077;     /* Digital Output reg. */
-	volatile unsigned char tapectl_82077; /* What the? Tape control reg? */
-
-	volatile unsigned char status_82077;  /* Main Status Register. */
-#define drs_82077              status_82077   /* Digital Rate Select reg. */
-
-	volatile unsigned char data_82077;    /* Data fifo. */
-	volatile unsigned char ___unused;
-	volatile unsigned char dir_82077;     /* Digital Input reg. */
-#define dcr_82077              dir_82077      /* Config Control reg. */
-};
-
-/* You'll only ever find one controller on a SparcStation anyways. */
-static struct sun_flpy_controller *sun_fdc = NULL;
-
-struct sun_floppy_ops {
-	unsigned char (*fd_inb)(int port);
-	void (*fd_outb)(unsigned char value, int port);
-};
-
-static struct sun_floppy_ops sun_fdops;
-
-#define fd_inb(base, reg)         sun_fdops.fd_inb(reg)
-#define fd_outb(value, base, reg) sun_fdops.fd_outb(value, reg)
-#define fd_enable_dma()           sun_fd_enable_dma()
-#define fd_disable_dma()          sun_fd_disable_dma()
-#define fd_request_dma()          (0) /* nothing... */
-#define fd_free_dma()             /* nothing... */
-#define fd_clear_dma_ff()         /* nothing... */
-#define fd_set_dma_mode(mode)     sun_fd_set_dma_mode(mode)
-#define fd_set_dma_addr(addr)     sun_fd_set_dma_addr(addr)
-#define fd_set_dma_count(count)   sun_fd_set_dma_count(count)
-#define fd_enable_irq()           /* nothing... */
-#define fd_disable_irq()          /* nothing... */
-#define fd_request_irq()          sun_fd_request_irq()
-#define fd_free_irq()             /* nothing... */
-#if 0  /* P3: added by Alain, these cause a MMU corruption. 19960524 XXX */
-#define fd_dma_mem_alloc(size)    ((unsigned long) vmalloc(size))
-#define fd_dma_mem_free(addr,size) (vfree((void *)(addr)))
-#endif
-
-/* XXX This isn't really correct. XXX */
-#define get_dma_residue(x)        (0)
-
-#define FLOPPY0_TYPE  4
-#define FLOPPY1_TYPE  0
-
-/* Super paranoid... */
-#undef HAVE_DISABLE_HLT
-
-/* Here is where we catch the floppy driver trying to initialize,
- * therefore this is where we call the PROM device tree probing
- * routine etc. on the Sparc.
- */
-#define FDC1                      sun_floppy_init()
-
-#define N_FDC    1
-#define N_DRIVE  8
-
-/* No 64k boundary crossing problems on the Sparc. */
-#define CROSS_64KB(a,s) (0)
-
-/* Routines unique to each controller type on a Sun. */
-static void sun_set_dor(unsigned char value, int fdc_82077)
-{
-	if (fdc_82077)
-		sun_fdc->dor_82077 = value;
-}
-
-static unsigned char sun_read_dir(void)
-{
-	return sun_fdc->dir_82077;
-}
-
-static unsigned char sun_82072_fd_inb(int port)
-{
-	udelay(5);
-	switch (port) {
-	default:
-		printk("floppy: Asked to read unknown port %d\n", port);
-		panic("floppy: Port bolixed.");
-	case FD_STATUS:
-		return sun_fdc->status_82072 & ~STATUS_DMA;
-	case FD_DATA:
-		return sun_fdc->data_82072;
-	case FD_DIR:
-		return sun_read_dir();
-	}
-	panic("sun_82072_fd_inb: How did I get here?");
-}
-
-static void sun_82072_fd_outb(unsigned char value, int port)
-{
-	udelay(5);
-	switch (port) {
-	default:
-		printk("floppy: Asked to write to unknown port %d\n", port);
-		panic("floppy: Port bolixed.");
-	case FD_DOR:
-		sun_set_dor(value, 0);
-		break;
-	case FD_DATA:
-		sun_fdc->data_82072 = value;
-		break;
-	case FD_DCR:
-		sun_fdc->dcr_82072 = value;
-		break;
-	case FD_DSR:
-		sun_fdc->status_82072 = value;
-		break;
-	}
-	return;
-}
-
-static unsigned char sun_82077_fd_inb(int port)
-{
-	udelay(5);
-	switch (port) {
-	default:
-		printk("floppy: Asked to read unknown port %d\n", port);
-		panic("floppy: Port bolixed.");
-	case FD_SRA:
-		return sun_fdc->status1_82077;
-	case FD_SRB:
-		return sun_fdc->status2_82077;
-	case FD_DOR:
-		return sun_fdc->dor_82077;
-	case FD_TDR:
-		return sun_fdc->tapectl_82077;
-	case FD_STATUS:
-		return sun_fdc->status_82077 & ~STATUS_DMA;
-	case FD_DATA:
-		return sun_fdc->data_82077;
-	case FD_DIR:
-		return sun_read_dir();
-	}
-	panic("sun_82077_fd_inb: How did I get here?");
-}
-
-static void sun_82077_fd_outb(unsigned char value, int port)
-{
-	udelay(5);
-	switch (port) {
-	default:
-		printk("floppy: Asked to write to unknown port %d\n", port);
-		panic("floppy: Port bolixed.");
-	case FD_DOR:
-		sun_set_dor(value, 1);
-		break;
-	case FD_DATA:
-		sun_fdc->data_82077 = value;
-		break;
-	case FD_DCR:
-		sun_fdc->dcr_82077 = value;
-		break;
-	case FD_DSR:
-		sun_fdc->status_82077 = value;
-		break;
-	case FD_TDR:
-		sun_fdc->tapectl_82077 = value;
-		break;
-	}
-	return;
-}
-
-/* For pseudo-dma (Sun floppy drives have no real DMA available to
- * them so we must eat the data fifo bytes directly ourselves) we have
- * three state variables.  doing_pdma tells our inline low-level
- * assembly floppy interrupt entry point whether it should sit and eat
- * bytes from the fifo or just transfer control up to the higher level
- * floppy interrupt c-code.  I tried very hard but I could not get the
- * pseudo-dma to work in c-code without getting many overruns and
- * underruns.  If non-zero, doing_pdma encodes the direction of
- * the transfer for debugging.  1=read 2=write
- */
-
-/* Common routines to all controller types on the Sparc. */
-static inline void virtual_dma_init(void)
-{
-	/* nothing... */
-}
-
-static inline void sun_fd_disable_dma(void)
-{
-	doing_pdma = 0;
-	pdma_base = NULL;
-}
-
-static inline void sun_fd_set_dma_mode(int mode)
-{
-	switch(mode) {
-	case DMA_MODE_READ:
-		doing_pdma = 1;
-		break;
-	case DMA_MODE_WRITE:
-		doing_pdma = 2;
-		break;
-	default:
-		printk("Unknown dma mode %d\n", mode);
-		panic("floppy: Giving up...");
-	}
-}
-
-static inline void sun_fd_set_dma_addr(char *buffer)
-{
-	pdma_vaddr = buffer;
-}
-
-static inline void sun_fd_set_dma_count(int length)
-{
-	pdma_size = length;
-}
-
-static inline void sun_fd_enable_dma(void)
-{
-	pdma_base = pdma_vaddr;
-	pdma_areasize = pdma_size;
-}
-
-int sparc_floppy_request_irq(unsigned int irq, irq_handler_t irq_handler);
-
-static int sun_fd_request_irq(void)
-{
-	static int once = 0;
-
-	if (!once) {
-		once = 1;
-		return sparc_floppy_request_irq(FLOPPY_IRQ, floppy_interrupt);
-	} else {
-		return 0;
-	}
-}
-
-static struct linux_prom_registers fd_regs[2];
-
-static int sun_floppy_init(void)
-{
-	struct platform_device *op;
-	struct device_node *dp;
-	struct resource r;
-	char state[128];
-	phandle fd_node;
-	phandle tnode;
-	int num_regs;
-
-	use_virtual_dma = 1;
-
-	/* Forget it if we aren't on a machine that could possibly
-	 * ever have a floppy drive.
-	 */
-	if (sparc_cpu_model != sun4m) {
-		/* We certainly don't have a floppy controller. */
-		goto no_sun_fdc;
-	}
-	/* Well, try to find one. */
-	tnode = prom_getchild(prom_root_node);
-	fd_node = prom_searchsiblings(tnode, "obio");
-	if (fd_node != 0) {
-		tnode = prom_getchild(fd_node);
-		fd_node = prom_searchsiblings(tnode, "SUNW,fdtwo");
-	} else {
-		fd_node = prom_searchsiblings(tnode, "fd");
-	}
-	if (fd_node == 0) {
-		goto no_sun_fdc;
-	}
-
-	/* The sun4m lets us know if the controller is actually usable. */
-	if (prom_getproperty(fd_node, "status", state, sizeof(state)) != -1) {
-		if(!strcmp(state, "disabled")) {
-			goto no_sun_fdc;
-		}
-	}
-	num_regs = prom_getproperty(fd_node, "reg", (char *) fd_regs, sizeof(fd_regs));
-	num_regs = (num_regs / sizeof(fd_regs[0]));
-	prom_apply_obio_ranges(fd_regs, num_regs);
-	memset(&r, 0, sizeof(r));
-	r.flags = fd_regs[0].which_io;
-	r.start = fd_regs[0].phys_addr;
-	sun_fdc = of_ioremap(&r, 0, fd_regs[0].reg_size, "floppy");
-
-	/* Look up irq in platform_device.
-	 * We try "SUNW,fdtwo" and "fd"
-	 */
-	op = NULL;
-	for_each_node_by_name(dp, "SUNW,fdtwo") {
-		op = of_find_device_by_node(dp);
-		if (op)
-			break;
-	}
-	if (!op) {
-		for_each_node_by_name(dp, "fd") {
-			op = of_find_device_by_node(dp);
-			if (op)
-				break;
-		}
-	}
-	if (!op)
-		goto no_sun_fdc;
-
-	FLOPPY_IRQ = op->archdata.irqs[0];
-
-	/* Last minute sanity check... */
-	if (sun_fdc->status_82072 == 0xff) {
-		sun_fdc = NULL;
-		goto no_sun_fdc;
-	}
-
-	sun_fdops.fd_inb = sun_82077_fd_inb;
-	sun_fdops.fd_outb = sun_82077_fd_outb;
-	fdc_status = &sun_fdc->status_82077;
-
-	if (sun_fdc->dor_82077 == 0x80) {
-		sun_fdc->dor_82077 = 0x02;
-		if (sun_fdc->dor_82077 == 0x80) {
-			sun_fdops.fd_inb = sun_82072_fd_inb;
-			sun_fdops.fd_outb = sun_82072_fd_outb;
-			fdc_status = &sun_fdc->status_82072;
-		}
-	}
-
-	/* Success... */
-	allowed_drive_mask = 0x01;
-	return (int) sun_fdc;
-
-no_sun_fdc:
-	return -1;
-}
-
-static int sparc_eject(void)
-{
-	set_dor(0x00, 0xff, 0x90);
-	udelay(500);
-	set_dor(0x00, 0x6f, 0x00);
-	udelay(500);
-	return 0;
-}
-
-#define fd_eject(drive) sparc_eject()
-
-#define EXTRA_FLOPPY_PARAMS
-
-static DEFINE_SPINLOCK(dma_spin_lock);
-
-#define claim_dma_lock() \
-({	unsigned long flags; \
-	spin_lock_irqsave(&dma_spin_lock, flags); \
-	flags; \
-})
-
-#define release_dma_lock(__flags) \
-	spin_unlock_irqrestore(&dma_spin_lock, __flags);
-
-#endif /* !(__ASM_SPARC_FLOPPY_H) */
diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
index a3fdee4cd6fa..c6a5cb949381 100644
--- a/arch/sparc/kernel/entry.S
+++ b/arch/sparc/kernel/entry.S
@@ -55,143 +55,6 @@ arch_kgdb_breakpoint:
 	.size		arch_kgdb_breakpoint,.-arch_kgdb_breakpoint
 #endif
 
-#if defined(CONFIG_BLK_DEV_FD) || defined(CONFIG_BLK_DEV_FD_MODULE)
-	.align	4
-	.globl	floppy_hardint
-floppy_hardint:
-	/*
-	 * This code cannot touch registers %l0 %l1 and %l2
-	 * because SAVE_ALL depends on their values. It depends
-	 * on %l3 also, but we regenerate it before a call.
-	 * Other registers are:
-	 * %l3 -- base address of fdc registers
-	 * %l4 -- pdma_vaddr
-	 * %l5 -- scratch for ld/st address
-	 * %l6 -- pdma_size
-	 * %l7 -- scratch [floppy byte, ld/st address, aux. data]
-	 */
-
-	/* Do we have work to do? */
-	sethi	%hi(doing_pdma), %l7
-	ld	[%l7 + %lo(doing_pdma)], %l7
-	cmp	%l7, 0
-	be	floppy_dosoftint
-	 nop
-
-	/* Load fdc register base */
-	sethi	%hi(fdc_status), %l3
-	ld	[%l3 + %lo(fdc_status)], %l3
-
-	/* Setup register addresses */
-	sethi	%hi(pdma_vaddr), %l5	! transfer buffer
-	ld	[%l5 + %lo(pdma_vaddr)], %l4
-	sethi	%hi(pdma_size), %l5	! bytes to go
-	ld	[%l5 + %lo(pdma_size)], %l6
-next_byte:
-  	ldub	[%l3], %l7
-
-	andcc	%l7, 0x80, %g0		! Does fifo still have data
-	bz	floppy_fifo_emptied	! fifo has been emptied...
-	 andcc	%l7, 0x20, %g0		! in non-dma mode still?
-	bz	floppy_overrun		! nope, overrun
-	 andcc	%l7, 0x40, %g0		! 0=write 1=read
-	bz	floppy_write
-	 sub	%l6, 0x1, %l6
-
-	/* Ok, actually read this byte */
-	ldub	[%l3 + 1], %l7
-	orcc	%g0, %l6, %g0
-	stb	%l7, [%l4]
-	bne	next_byte
-	 add	%l4, 0x1, %l4
-
-	b	floppy_tdone
-	 nop
-
-floppy_write:
-	/* Ok, actually write this byte */
-	ldub	[%l4], %l7
-	orcc	%g0, %l6, %g0
-	stb	%l7, [%l3 + 1]
-	bne	next_byte
-	 add	%l4, 0x1, %l4
-
-	/* fall through... */
-floppy_tdone:
-	sethi	%hi(pdma_vaddr), %l5
-	st	%l4, [%l5 + %lo(pdma_vaddr)]
-	sethi	%hi(pdma_size), %l5
-	st	%l6, [%l5 + %lo(pdma_size)]
-	/* Flip terminal count pin */
-	set	auxio_register, %l7
-	ld	[%l7], %l7
-
-	ldub	[%l7], %l5
-
-	or	%l5, 0xc2, %l5
-	stb	%l5, [%l7]
-	andn    %l5, 0x02, %l5
-
-2:
-	/* Kill some time so the bits set */
-	WRITE_PAUSE
-	WRITE_PAUSE
-
-	stb     %l5, [%l7]
-
-	/* Prevent recursion */
-	sethi	%hi(doing_pdma), %l7
-	b	floppy_dosoftint
-	 st	%g0, [%l7 + %lo(doing_pdma)]
-
-	/* We emptied the FIFO, but we haven't read everything
-	 * as of yet.  Store the current transfer address and
-	 * bytes left to read so we can continue when the next
-	 * fast IRQ comes in.
-	 */
-floppy_fifo_emptied:
-	sethi	%hi(pdma_vaddr), %l5
-	st	%l4, [%l5 + %lo(pdma_vaddr)]
-	sethi	%hi(pdma_size), %l7
-	st	%l6, [%l7 + %lo(pdma_size)]
-
-	/* Restore condition codes */
-	wr	%l0, 0x0, %psr
-	WRITE_PAUSE
-
-	jmp	%l1
-	rett	%l2
-
-floppy_overrun:
-	sethi	%hi(pdma_vaddr), %l5
-	st	%l4, [%l5 + %lo(pdma_vaddr)]
-	sethi	%hi(pdma_size), %l5
-	st	%l6, [%l5 + %lo(pdma_size)]
-	/* Prevent recursion */
-	sethi	%hi(doing_pdma), %l7
-	st	%g0, [%l7 + %lo(doing_pdma)]
-
-	/* fall through... */
-floppy_dosoftint:
-	rd	%wim, %l3
-	SAVE_ALL
-
-	/* Set all IRQs off. */
-	or	%l0, PSR_PIL, %l4
-	wr	%l4, 0x0, %psr
-	WRITE_PAUSE
-	wr	%l4, PSR_ET, %psr
-	WRITE_PAUSE
-
-	mov	11, %o0			! floppy irq level (unused anyway)
-	mov	%g0, %o1		! devid is not used in fast interrupts
-	call	sparc_floppy_irq
-	 add	%sp, STACKFRAME_SZ, %o2	! struct pt_regs *regs
-
-	RESTORE_ALL
-	
-#endif /* (CONFIG_BLK_DEV_FD) */
-
 	/* Bad trap handler */
 	.globl	bad_trap_handler
 bad_trap_handler:
diff --git a/arch/sparc/kernel/irq.h b/arch/sparc/kernel/irq.h
index b02026ad6e34..0d9b740725b4 100644
--- a/arch/sparc/kernel/irq.h
+++ b/arch/sparc/kernel/irq.h
@@ -83,9 +83,6 @@ void handler_irq(unsigned int pil, struct pt_regs *regs);
 
 unsigned long leon_get_irqmask(unsigned int irq);
 
-/* irq_32.c */
-void sparc_floppy_irq(int irq, void *dev_id, struct pt_regs *regs);
-
 /* sun4m_irq.c */
 void sun4m_nmi(struct pt_regs *regs);
 
diff --git a/arch/sparc/kernel/irq_32.c b/arch/sparc/kernel/irq_32.c
index e8452be5123b..510184c3aa17 100644
--- a/arch/sparc/kernel/irq_32.c
+++ b/arch/sparc/kernel/irq_32.c
@@ -235,99 +235,6 @@ void handler_irq(unsigned int pil, struct pt_regs *regs)
 	set_irq_regs(old_regs);
 }
 
-#if defined(CONFIG_BLK_DEV_FD) || defined(CONFIG_BLK_DEV_FD_MODULE)
-static unsigned int floppy_irq;
-
-int sparc_floppy_request_irq(unsigned int irq, irq_handler_t irq_handler)
-{
-	unsigned int cpu_irq;
-	int err;
-
-
-	err = request_irq(irq, irq_handler, 0, "floppy", NULL);
-	if (err)
-		return -1;
-
-	/* Save for later use in floppy interrupt handler */
-	floppy_irq = irq;
-
-	cpu_irq = (irq & (NR_IRQS - 1));
-
-	/* Dork with trap table if we get this far. */
-#define INSTANTIATE(table) \
-	table[SP_TRAP_IRQ1+(cpu_irq-1)].inst_one = SPARC_RD_PSR_L0; \
-	table[SP_TRAP_IRQ1+(cpu_irq-1)].inst_two = \
-		SPARC_BRANCH((unsigned long) floppy_hardint, \
-			     (unsigned long) &table[SP_TRAP_IRQ1+(cpu_irq-1)].inst_two);\
-	table[SP_TRAP_IRQ1+(cpu_irq-1)].inst_three = SPARC_RD_WIM_L3; \
-	table[SP_TRAP_IRQ1+(cpu_irq-1)].inst_four = SPARC_NOP;
-
-	INSTANTIATE(sparc_ttable)
-
-#if defined CONFIG_SMP
-	if (sparc_cpu_model != sparc_leon) {
-		struct tt_entry *trap_table;
-
-		trap_table = &trapbase_cpu1;
-		INSTANTIATE(trap_table)
-		trap_table = &trapbase_cpu2;
-		INSTANTIATE(trap_table)
-		trap_table = &trapbase_cpu3;
-		INSTANTIATE(trap_table)
-	}
-#endif
-#undef INSTANTIATE
-	/*
-	 * XXX Correct thing whould be to flush only I- and D-cache lines
-	 * which contain the handler in question. But as of time of the
-	 * writing we have no CPU-neutral interface to fine-grained flushes.
-	 */
-	flush_cache_all();
-	return 0;
-}
-EXPORT_SYMBOL(sparc_floppy_request_irq);
-
-/*
- * These variables are used to access state from the assembler
- * interrupt handler, floppy_hardint, so we cannot put these in
- * the floppy driver image because that would not work in the
- * modular case.
- */
-volatile unsigned char *fdc_status;
-EXPORT_SYMBOL(fdc_status);
-
-char *pdma_vaddr;
-EXPORT_SYMBOL(pdma_vaddr);
-
-unsigned long pdma_size;
-EXPORT_SYMBOL(pdma_size);
-
-volatile int doing_pdma;
-EXPORT_SYMBOL(doing_pdma);
-
-char *pdma_base;
-EXPORT_SYMBOL(pdma_base);
-
-unsigned long pdma_areasize;
-EXPORT_SYMBOL(pdma_areasize);
-
-/* Use the generic irq support to call floppy_interrupt
- * which was setup using request_irq() in sparc_floppy_request_irq().
- * We only have one floppy interrupt so we do not need to check
- * for additional handlers being wired up by irq_link()
- */
-void sparc_floppy_irq(int irq, void *dev_id, struct pt_regs *regs)
-{
-	struct pt_regs *old_regs;
-
-	old_regs = set_irq_regs(regs);
-	irq_enter();
-	generic_handle_irq(floppy_irq);
-	irq_exit();
-	set_irq_regs(old_regs);
-}
-#endif
-
 /* djhr
  * This could probably be made indirect too and assigned in the CPU
  * bits of the code. That would be much nicer I think and would also
diff --git a/arch/sparc/kernel/kernel.h b/arch/sparc/kernel/kernel.h
index 15da3c0597a5..ef5579496088 100644
--- a/arch/sparc/kernel/kernel.h
+++ b/arch/sparc/kernel/kernel.h
@@ -151,8 +151,6 @@ extern unsigned int real_irq_entry[];
 extern unsigned int smp4d_ticker[];
 extern unsigned int patchme_maybe_smp_msg[];
 
-void floppy_hardint(void);
-
 /* trampoline_32.S */
 extern unsigned long sun4m_cpu_startup;
 extern unsigned long sun4d_cpu_startup;

-- 
2.34.1

