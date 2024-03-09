Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8818772C8
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E56B1122CD;
	Sat,  9 Mar 2024 18:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h5QnxHzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D09C1122A8
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:15:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C88E460AD9;
 Sat,  9 Mar 2024 18:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DACDC4160D;
 Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710008149;
 bh=6cZ7EkkqsT3XsnxcYHDC+rLmlQ/2YmlMGvCEvx4DQkU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=h5QnxHznCJMQ/0V9s49tqUuUgquKbJwkXSXT5RM90yQVGMWQliOiwIP7OrODGaWhf
 oHkC0AAbmbdxojho8vDj2BZkPCGwQh4j3n7fpsIHoymsU/Sjh8UVhEkraBhF+L+5S3
 TPDy8kC/P1Onj5cD5EnwuFPvvjwUoT4Mmqq48jxo6gTxmCqv6x/+fqwzDsnBMotnqi
 1oA5GJN5PPWvvksoHdzsCcgiu71bkuQpO+5dEJ2j1TShj+Af+BFWRUUu2NxfRhhk5J
 EoOKcZlrC/7mpj5iK6+N/FHW0IT4tRdYeHBRcA3ncunww668B8ZUmRNREPKk9jH+Kb
 KpHhZ2Y3haBJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 397D0C54E61;
 Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 09 Mar 2024 19:15:33 +0100
Subject: [PATCH v2 12/28] sparc32: Drop mbus support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-sunset-v2-12-f09912574d2c@ravnborg.org>
References: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
In-Reply-To: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Kjetil Oftedal <oftedal@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710008145; l=9892;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=61rc+oDXOzeFmUjj78H6jDuEkLnEv0pp1W/du55+hy4=; =?utf-8?q?b=3DHmYQOQTD5tDZ?=
 =?utf-8?q?9UuBJJnx/g+Nd4CNGpsy9yRCCHJ2BRGD/ijmiUNfHzsopy4jB2gF09XkcP6e+9vg?=
 FyxYvqYiCIIhZZ5eOTxPWaJsr0OVshf0VmLa5hRlTvkE2aCMETYH
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Only used by older SPARC HW, not used by LEON.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/elf_32.h |  2 -
 arch/sparc/include/asm/mbus.h   | 97 -----------------------------------------
 arch/sparc/kernel/cpu.c         |  1 -
 arch/sparc/kernel/setup_32.c    |  1 -
 arch/sparc/mm/iommu.c           | 18 ++------
 arch/sparc/mm/srmmu.c           | 48 --------------------
 6 files changed, 3 insertions(+), 164 deletions(-)

diff --git a/arch/sparc/include/asm/elf_32.h b/arch/sparc/include/asm/elf_32.h
index 37a6016c9ccd..b2cca9be55c2 100644
--- a/arch/sparc/include/asm/elf_32.h
+++ b/arch/sparc/include/asm/elf_32.h
@@ -91,8 +91,6 @@ typedef struct {
 	unsigned int	pr_q[64];
 } elf_fpregset_t;
 
-#include <asm/mbus.h>
-
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
diff --git a/arch/sparc/include/asm/mbus.h b/arch/sparc/include/asm/mbus.h
deleted file mode 100644
index 8b6dbe701b9b..000000000000
--- a/arch/sparc/include/asm/mbus.h
+++ /dev/null
@@ -1,97 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * mbus.h:  Various defines for MBUS modules.
- *
- * Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#ifndef _SPARC_MBUS_H
-#define _SPARC_MBUS_H
-
-#include <asm/ross.h>    /* HyperSparc stuff */
-#include <asm/viking.h>  /* Ugh, bug city... */
-
-enum mbus_module {
-	HyperSparc        = 0,
-	Swift_ok          = 4,
-	Swift_bad_c       = 5,
-	Swift_lots_o_bugs = 6,
-	Tsunami           = 7,
-	Viking_12         = 8,
-	Viking_2x         = 9,
-	Viking_30         = 10,
-	Viking_35         = 11,
-	Viking_new        = 12,
-	TurboSparc	  = 13,
-	SRMMU_INVAL_MOD   = 14,
-};
-
-extern enum mbus_module srmmu_modtype;
-extern unsigned int viking_rev, swift_rev, cypress_rev;
-
-/* HW Mbus module bugs we have to deal with */
-#define HWBUG_COPYBACK_BROKEN        0x00000001
-#define HWBUG_ASIFLUSH_BROKEN        0x00000002
-#define HWBUG_VACFLUSH_BITROT        0x00000004
-#define HWBUG_KERN_ACCBROKEN         0x00000008
-#define HWBUG_KERN_CBITBROKEN        0x00000010
-#define HWBUG_MODIFIED_BITROT        0x00000020
-#define HWBUG_PC_BADFAULT_ADDR       0x00000040
-#define HWBUG_SUPERSCALAR_BAD        0x00000080
-#define HWBUG_PACINIT_BITROT         0x00000100
-
-/* First the module type values. To find out which you have, just load
- * the mmu control register from ASI_M_MMUREG alternate address space and
- * shift the value right 28 bits.
- */
-/* IMPL field means the company which produced the chip. */
-#define MBUS_VIKING        0x4   /* bleech, Texas Instruments Module */
-#define MBUS_LSI           0x3   /* LSI Logics */
-#define MBUS_ROSS          0x1   /* Ross is nice */
-#define MBUS_FMI           0x0   /* Fujitsu Microelectronics/Swift */
-
-/* Ross Module versions */
-#define ROSS_604_REV_CDE        0x0   /* revisions c, d, and e */
-#define ROSS_604_REV_F          0x1   /* revision f */
-#define ROSS_605                0xf   /* revision a, a.1, and a.2 */
-#define ROSS_605_REV_B          0xe   /* revision b */
-
-/* TI Viking Module versions */
-#define VIKING_REV_12           0x1   /* Version 1.2 or SPARCclassic's CPU */
-#define VIKING_REV_2            0x2   /* Version 2.1, 2.2, 2.3, and 2.4 */
-#define VIKING_REV_30           0x3   /* Version 3.0 */
-#define VIKING_REV_35           0x4   /* Version 3.5 */
-
-/* LSI Logics. */
-#define LSI_L64815		0x0
-
-/* Fujitsu */
-#define FMI_AURORA		0x4   /* MB8690x, a Swift module... */
-#define FMI_TURBO		0x5   /* MB86907, a TurboSparc module... */
-
-/* For multiprocessor support we need to be able to obtain the CPU id and
- * the MBUS Module id.
- */
-
-/* The CPU ID is encoded in the trap base register, 20 bits to the left of
- * bit zero, with 2 bits being significant.
- */
-#define TBR_ID_SHIFT            20
-
-static inline int get_cpuid(void)
-{
-	register int retval;
-	__asm__ __volatile__("rd %%tbr, %0\n\t"
-			     "srl %0, %1, %0\n\t" :
-			     "=r" (retval) :
-			     "i" (TBR_ID_SHIFT));
-	return (retval & 3);
-}
-
-static inline int get_modid(void)
-{
-	return (get_cpuid() | 0x8);
-}
-
-	
-#endif /* !(_SPARC_MBUS_H) */
diff --git a/arch/sparc/kernel/cpu.c b/arch/sparc/kernel/cpu.c
index 79cd6ccfeac0..cca7de051593 100644
--- a/arch/sparc/kernel/cpu.c
+++ b/arch/sparc/kernel/cpu.c
@@ -19,7 +19,6 @@
 #include <asm/page.h>
 #include <asm/head.h>
 #include <asm/psr.h>
-#include <asm/mbus.h>
 #include <asm/cpudata.h>
 
 #include "kernel.h"
diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
index 704375c061e7..3c6c16fde8c3 100644
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -41,7 +41,6 @@
 #include <asm/page.h>
 #include <asm/traps.h>
 #include <asm/vaddrs.h>
-#include <asm/mbus.h>
 #include <asm/idprom.h>
 #include <asm/cpudata.h>
 #include <asm/setup.h>
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index 5a5080db800f..832e5ff8b663 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -19,7 +19,6 @@
 
 #include <asm/io.h>
 #include <asm/mxcc.h>
-#include <asm/mbus.h>
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 #include <asm/bitext.h>
@@ -117,13 +116,7 @@ static void __init sbus_iommu_init(struct platform_device *op)
 		prom_halt();
 	}
 	bit_map_init(&iommu->usemap, bitmap, IOMMU_NPTES);
-	/* To be coherent on HyperSparc, the page color of DVMA
-	 * and physical addresses must match.
-	 */
-	if (srmmu_modtype == HyperSparc)
-		iommu->usemap.num_colors = vac_cache_size >> PAGE_SHIFT;
-	else
-		iommu->usemap.num_colors = 1;
+	iommu->usemap.num_colors = 1;
 
 	printk(KERN_INFO "IOMMU: impl %d vers %d table 0x%p[%d B] map [%d b]\n",
 	       impl, vers, iommu->page_table,
@@ -445,11 +438,6 @@ static const struct dma_map_ops sbus_iommu_dma_pflush_ops = {
 
 void __init ld_mmu_iommu(void)
 {
-	if (viking_mxcc_present || srmmu_modtype == HyperSparc) {
-		dvma_prot = __pgprot(SRMMU_CACHE | SRMMU_ET_PTE | SRMMU_PRIV);
-		ioperm_noc = IOPTE_CACHE | IOPTE_WRITE | IOPTE_VALID;
-	} else {
-		dvma_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV);
-		ioperm_noc = IOPTE_WRITE | IOPTE_VALID;
-	}
+	dvma_prot = __pgprot(SRMMU_CACHE | SRMMU_ET_PTE | SRMMU_PRIV);
+	ioperm_noc = IOPTE_CACHE | IOPTE_WRITE | IOPTE_VALID;
 }
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 04d9653890c5..3a7e10729a02 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -34,7 +34,6 @@
 #include <asm/cache.h>
 #include <asm/traps.h>
 #include <asm/oplib.h>
-#include <asm/mbus.h>
 #include <asm/page.h>
 #include <asm/asi.h>
 #include <asm/smp.h>
@@ -51,8 +50,6 @@
 
 #include "mm_32.h"
 
-enum mbus_module srmmu_modtype;
-static unsigned int hwbug_bitmask;
 int vac_cache_size;
 EXPORT_SYMBOL(vac_cache_size);
 int vac_line_size;
@@ -1117,7 +1114,6 @@ static const struct sparc32_cachetlb_ops hypersparc_ops = {
 static void __init init_hypersparc(void)
 {
 	srmmu_name = "ROSS HyperSparc";
-	srmmu_modtype = HyperSparc;
 
 	init_vac_layout();
 
@@ -1176,45 +1172,6 @@ static void __init init_swift(void)
 			     "=r" (swift_rev) :
 			     "r" (SWIFT_MASKID_ADDR), "i" (ASI_M_BYPASS));
 	srmmu_name = "Fujitsu Swift";
-	switch (swift_rev) {
-	case 0x11:
-	case 0x20:
-	case 0x23:
-	case 0x30:
-		srmmu_modtype = Swift_lots_o_bugs;
-		hwbug_bitmask |= (HWBUG_KERN_ACCBROKEN | HWBUG_KERN_CBITBROKEN);
-		/*
-		 * Gee george, I wonder why Sun is so hush hush about
-		 * this hardware bug... really braindamage stuff going
-		 * on here.  However I think we can find a way to avoid
-		 * all of the workaround overhead under Linux.  Basically,
-		 * any page fault can cause kernel pages to become user
-		 * accessible (the mmu gets confused and clears some of
-		 * the ACC bits in kernel ptes).  Aha, sounds pretty
-		 * horrible eh?  But wait, after extensive testing it appears
-		 * that if you use pgd_t level large kernel pte's (like the
-		 * 4MB pages on the Pentium) the bug does not get tripped
-		 * at all.  This avoids almost all of the major overhead.
-		 * Welcome to a world where your vendor tells you to,
-		 * "apply this kernel patch" instead of "sorry for the
-		 * broken hardware, send it back and we'll give you
-		 * properly functioning parts"
-		 */
-		break;
-	case 0x25:
-	case 0x31:
-		srmmu_modtype = Swift_bad_c;
-		hwbug_bitmask |= HWBUG_KERN_CBITBROKEN;
-		/*
-		 * You see Sun allude to this hardware bug but never
-		 * admit things directly, they'll say things like,
-		 * "the Swift chip cache problems" or similar.
-		 */
-		break;
-	default:
-		srmmu_modtype = Swift_ok;
-		break;
-	}
 
 	sparc32_cachetlb_ops = &swift_ops;
 	flush_page_for_dma_global = 0;
@@ -1367,7 +1324,6 @@ static const struct sparc32_cachetlb_ops turbosparc_ops = {
 static void __init init_turbosparc(void)
 {
 	srmmu_name = "Fujitsu TurboSparc";
-	srmmu_modtype = TurboSparc;
 	sparc32_cachetlb_ops = &turbosparc_ops;
 	poke_srmmu = poke_turbosparc;
 }
@@ -1406,7 +1362,6 @@ static void __init init_tsunami(void)
 	 */
 
 	srmmu_name = "TI Tsunami";
-	srmmu_modtype = Tsunami;
 	sparc32_cachetlb_ops = &tsunami_ops;
 	poke_srmmu = poke_tsunami;
 
@@ -1546,9 +1501,6 @@ static void __init get_srmmu_type(void)
 	unsigned long mreg, psr;
 	unsigned long mod_typ, mod_rev, psr_typ, psr_vers;
 
-	srmmu_modtype = SRMMU_INVAL_MOD;
-	hwbug_bitmask = 0;
-
 	mreg = srmmu_get_mmureg(); psr = get_psr();
 	mod_typ = (mreg & 0xf0000000) >> 28;
 	mod_rev = (mreg & 0x0f000000) >> 24;

-- 
2.34.1

