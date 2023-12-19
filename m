Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65AB8192E8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294D310E52B;
	Tue, 19 Dec 2023 22:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955110E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 17C9BB81AE1;
 Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D161C43142;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023396;
 bh=hxqIDfqG+SEwIfLe1X10qvpM8vvDtmPIdeb2vuFr4+U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=SiGZeXwI8jpeWYctdU/OK/2GVULW/bXhrRHAl3C8CGKOQRuLhAUGLeAcqAO1DZLpW
 Wx4bKX6durQbuSJNsf1ScouM+0R+Qc5hEmX1sO101RoUv92XKQzuqTYagdURKfUhFc
 /LeiiKDFT5pWB4p98P59Gk7arjtLE6EnNHI5pUomVmSxFrVIdwAZR9ZXPIzn0XmSKW
 d/+YVmBRpbBffgkImzs7Pj6tJNRB7QWjeI1bNtB2nMi2FISO1i8JtScCRXenKGck57
 er0wgRI1LI0ClOwsHQLLZyqrM6laGVobg3TQIWl7o2le6dWzQquykZveoLcp4wLhmj
 90UOowkZZE8VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADE8C46CD2;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:19 +0100
Subject: [PATCH 14/27] sparc32: Drop unused mmu models
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-14-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=89334;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=T+hkwod++ILVSnOVa0kDocwwSS4VaboREDDllAHHfCE=; =?utf-8?q?b=3DsaUYE6jGA/Oq?=
 =?utf-8?q?tkFEJbAXJ5RRXQcNbkXlPYDWV9FxYPfk2pxNaap/B/6bVEochZHRgKXWxeIuGli3?=
 Gq2xnxi5Bt4MzXN1SI/1ipqDumByQf93qtjO9VMfWkyTkCNoQNGh
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

Drop mmu models not used by LEON, including their header files.
This includes removal of unused includes in various files to fix the
build.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/mxcc.h       | 138 -------
 arch/sparc/include/asm/ross.h       | 192 ---------
 arch/sparc/include/asm/swift.h      | 107 -----
 arch/sparc/include/asm/tsunami.h    |  65 ---
 arch/sparc/include/asm/turbosparc.h | 126 ------
 arch/sparc/include/asm/viking.h     | 255 ------------
 arch/sparc/kernel/entry.S           |   1 -
 arch/sparc/mm/Makefile              |   1 -
 arch/sparc/mm/hypersparc.S          | 414 -------------------
 arch/sparc/mm/io-unit.c             |   1 -
 arch/sparc/mm/iommu.c               |  31 +-
 arch/sparc/mm/mm_32.h               |   1 -
 arch/sparc/mm/srmmu.c               | 776 +-----------------------------------
 arch/sparc/mm/swift.S               | 256 ------------
 arch/sparc/mm/tsunami.S             | 132 ------
 arch/sparc/mm/viking.S              | 284 -------------
 16 files changed, 21 insertions(+), 2759 deletions(-)

diff --git a/arch/sparc/include/asm/mxcc.h b/arch/sparc/include/asm/mxcc.h
deleted file mode 100644
index 3a2561bea4dd..000000000000
--- a/arch/sparc/include/asm/mxcc.h
+++ /dev/null
@@ -1,138 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * mxcc.h:  Definitions of the Viking MXCC registers
- *
- * Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#ifndef _SPARC_MXCC_H
-#define _SPARC_MXCC_H
-
-/* These registers are accessed through ASI 0x2. */
-#define MXCC_DATSTREAM       0x1C00000  /* Data stream register */
-#define MXCC_SRCSTREAM       0x1C00100  /* Source stream register */
-#define MXCC_DESSTREAM       0x1C00200  /* Destination stream register */
-#define MXCC_RMCOUNT         0x1C00300  /* Count of references and misses */
-#define MXCC_STEST           0x1C00804  /* Internal self-test */
-#define MXCC_CREG            0x1C00A04  /* Control register */
-#define MXCC_SREG            0x1C00B00  /* Status register */
-#define MXCC_RREG            0x1C00C04  /* Reset register */
-#define MXCC_EREG            0x1C00E00  /* Error code register */
-#define MXCC_PREG            0x1C00F04  /* Address port register */
-
-/* Some MXCC constants. */
-#define MXCC_STREAM_SIZE     0x20       /* Size in bytes of one stream r/w */
-
-/* The MXCC Control Register:
- *
- * ----------------------------------------------------------------------
- * |                                   | RRC | RSV |PRE|MCE|PARE|ECE|RSV|
- * ----------------------------------------------------------------------
- *  31                              10    9    8-6   5   4    3   2  1-0
- *
- * RRC: Controls what you read from MXCC_RMCOUNT reg.
- *      0=Misses 1=References
- * PRE: Prefetch enable
- * MCE: Multiple Command Enable
- * PARE: Parity enable
- * ECE: External cache enable
- */
-
-#define MXCC_CTL_RRC   0x00000200
-#define MXCC_CTL_PRE   0x00000020
-#define MXCC_CTL_MCE   0x00000010
-#define MXCC_CTL_PARE  0x00000008
-#define MXCC_CTL_ECE   0x00000004
-
-/* The MXCC Error Register:
- *
- * --------------------------------------------------------
- * |ME| RSV|CE|PEW|PEE|ASE|EIV| MOPC|ECODE|PRIV|RSV|HPADDR|
- * --------------------------------------------------------
- *  31   30 29  28  27  26  25 24-15  14-7   6  5-3   2-0
- *
- * ME: Multiple Errors have occurred
- * CE: Cache consistency Error
- * PEW: Parity Error during a Write operation
- * PEE: Parity Error involving the External cache
- * ASE: ASynchronous Error
- * EIV: This register is toast
- * MOPC: MXCC Operation Code for instance causing error
- * ECODE: The Error CODE
- * PRIV: A privileged mode error? 0=no 1=yes
- * HPADDR: High PhysicalADDRess bits (35-32)
- */
-
-#define MXCC_ERR_ME     0x80000000
-#define MXCC_ERR_CE     0x20000000
-#define MXCC_ERR_PEW    0x10000000
-#define MXCC_ERR_PEE    0x08000000
-#define MXCC_ERR_ASE    0x04000000
-#define MXCC_ERR_EIV    0x02000000
-#define MXCC_ERR_MOPC   0x01FF8000
-#define MXCC_ERR_ECODE  0x00007F80
-#define MXCC_ERR_PRIV   0x00000040
-#define MXCC_ERR_HPADDR 0x0000000f
-
-/* The MXCC Port register:
- *
- * -----------------------------------------------------
- * |                | MID |                            |
- * -----------------------------------------------------
- *  31            21 20-18 17                         0
- *
- * MID: The moduleID of the cpu your read this from.
- */
-
-#ifndef __ASSEMBLY__
-
-static inline void mxcc_set_stream_src(unsigned long *paddr)
-{
-	unsigned long data0 = paddr[0];
-	unsigned long data1 = paddr[1];
-
-	__asm__ __volatile__ ("or %%g0, %0, %%g2\n\t"
-			      "or %%g0, %1, %%g3\n\t"
-			      "stda %%g2, [%2] %3\n\t" : :
-			      "r" (data0), "r" (data1),
-			      "r" (MXCC_SRCSTREAM),
-			      "i" (ASI_M_MXCC) : "g2", "g3");
-}
-
-static inline void mxcc_set_stream_dst(unsigned long *paddr)
-{
-	unsigned long data0 = paddr[0];
-	unsigned long data1 = paddr[1];
-
-	__asm__ __volatile__ ("or %%g0, %0, %%g2\n\t"
-			      "or %%g0, %1, %%g3\n\t"
-			      "stda %%g2, [%2] %3\n\t" : :
-			      "r" (data0), "r" (data1),
-			      "r" (MXCC_DESSTREAM),
-			      "i" (ASI_M_MXCC) : "g2", "g3");
-}
-
-static inline unsigned long mxcc_get_creg(void)
-{
-	unsigned long mxcc_control;
-
-	__asm__ __volatile__("set 0xffffffff, %%g2\n\t"
-			     "set 0xffffffff, %%g3\n\t"
-			     "stda %%g2, [%1] %2\n\t"
-			     "lda [%3] %2, %0\n\t" :
-			     "=r" (mxcc_control) :
-			     "r" (MXCC_EREG), "i" (ASI_M_MXCC),
-			     "r" (MXCC_CREG) : "g2", "g3");
-	return mxcc_control;
-}
-
-static inline void mxcc_set_creg(unsigned long mxcc_control)
-{
-	__asm__ __volatile__("sta %0, [%1] %2\n\t" : :
-			     "r" (mxcc_control), "r" (MXCC_CREG),
-			     "i" (ASI_M_MXCC));
-}
-
-#endif /* !__ASSEMBLY__ */
-
-#endif /* !(_SPARC_MXCC_H) */
diff --git a/arch/sparc/include/asm/ross.h b/arch/sparc/include/asm/ross.h
deleted file mode 100644
index 79a54d66a2c0..000000000000
--- a/arch/sparc/include/asm/ross.h
+++ /dev/null
@@ -1,192 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * ross.h: Ross module specific definitions and defines.
- *
- * Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#ifndef _SPARC_ROSS_H
-#define _SPARC_ROSS_H
-
-#include <asm/asi.h>
-#include <asm/page.h>
-
-/* Ross made Hypersparcs have a %psr 'impl' field of '0001'.  The 'vers'
- * field has '1111'.
- */
-
-/* The MMU control register fields on the HyperSparc.
- *
- * -----------------------------------------------------------------
- * |implvers| RSV |CWR|SE|WBE| MID |BM| C|CS|MR|CM|RSV|CE|RSV|NF|ME|
- * -----------------------------------------------------------------
- *  31    24 23-22 21  20  19 18-15 14 13 12 11 10  9   8 7-2  1  0
- *
- * Phew, lots of fields there ;-)
- *
- * CWR: Cache Wrapping Enabled, if one cache wrapping is on.
- * SE: Snoop Enable, turns on bus snooping for cache activity if one.
- * WBE: Write Buffer Enable, one turns it on.
- * MID: The ModuleID of the chip for MBus transactions.
- * BM: Boot-Mode. One indicates the MMU is in boot mode.
- * C: Indicates whether accesses are cachable while the MMU is
- *    disabled.
- * CS: Cache Size -- 0 = 128k, 1 = 256k
- * MR: Memory Reflection, one indicates that the memory bus connected
- *     to the MBus supports memory reflection.
- * CM: Cache Mode -- 0 = write-through, 1 = copy-back
- * CE: Cache Enable -- 0 = no caching, 1 = cache is on
- * NF: No Fault -- 0 = faults trap the CPU from supervisor mode
- *                 1 = faults from supervisor mode do not generate traps
- * ME: MMU Enable -- 0 = MMU is off, 1 = MMU is on
- */
-
-#define HYPERSPARC_CWENABLE   0x00200000
-#define HYPERSPARC_SBENABLE   0x00100000
-#define HYPERSPARC_WBENABLE   0x00080000
-#define HYPERSPARC_MIDMASK    0x00078000
-#define HYPERSPARC_BMODE      0x00004000
-#define HYPERSPARC_ACENABLE   0x00002000
-#define HYPERSPARC_CSIZE      0x00001000
-#define HYPERSPARC_MRFLCT     0x00000800
-#define HYPERSPARC_CMODE      0x00000400
-#define HYPERSPARC_CENABLE    0x00000100
-#define HYPERSPARC_NFAULT     0x00000002
-#define HYPERSPARC_MENABLE    0x00000001
-
-
-/* The ICCR instruction cache register on the HyperSparc.
- *
- * -----------------------------------------------
- * |                                 | FTD | ICE |
- * -----------------------------------------------
- *  31                                  1     0
- *
- * This register is accessed using the V8 'wrasr' and 'rdasr'
- * opcodes, since not all assemblers understand them and those
- * that do use different semantics I will just hard code the
- * instruction with a '.word' statement.
- *
- * FTD:  If set to one flush instructions executed during an
- *       instruction cache hit occurs, the corresponding line
- *       for said cache-hit is invalidated.  If FTD is zero,
- *       an unimplemented 'flush' trap will occur when any
- *       flush is executed by the processor.
- *
- * ICE:  If set to one, the instruction cache is enabled.  If
- *       zero, the cache will not be used for instruction fetches.
- *
- * All other bits are read as zeros, and writes to them have no
- * effect.
- *
- * Wheee, not many assemblers understand the %iccr register nor
- * the generic asr r/w instructions.
- *
- *  1000 0011 0100 0111 1100 0000 0000 0000   ! rd %iccr, %g1
- *
- * 0x  8    3    4    7    c    0    0    0   ! 0x8347c000
- *
- *  1011 1111 1000 0000 0110 0000 0000 0000   ! wr %g1, 0x0, %iccr
- *
- * 0x  b    f    8    0    6    0    0    0   ! 0xbf806000
- *
- */
-
-#define HYPERSPARC_ICCR_FTD     0x00000002
-#define HYPERSPARC_ICCR_ICE     0x00000001
-
-#ifndef __ASSEMBLY__
-
-static inline unsigned int get_ross_icr(void)
-{
-	unsigned int icreg;
-
-	__asm__ __volatile__(".word 0x8347c000\n\t" /* rd %iccr, %g1 */
-			     "mov %%g1, %0\n\t"
-			     : "=r" (icreg)
-			     : /* no inputs */
-			     : "g1", "memory");
-
-	return icreg;
-}
-
-static inline void put_ross_icr(unsigned int icreg)
-{
-	__asm__ __volatile__("or %%g0, %0, %%g1\n\t"
-			     ".word 0xbf806000\n\t" /* wr %g1, 0x0, %iccr */
-			     "nop\n\t"
-			     "nop\n\t"
-			     "nop\n\t"
-			     : /* no outputs */
-			     : "r" (icreg)
-			     : "g1", "memory");
-
-	return;
-}
-
-/* HyperSparc specific cache flushing. */
-
-/* This is for the on-chip instruction cache. */
-static inline void hyper_flush_whole_icache(void)
-{
-	__asm__ __volatile__("sta %%g0, [%%g0] %0\n\t"
-			     : /* no outputs */
-			     : "i" (ASI_M_FLUSH_IWHOLE)
-			     : "memory");
-	return;
-}
-
-extern int vac_cache_size;
-extern int vac_line_size;
-
-static inline void hyper_clear_all_tags(void)
-{
-	unsigned long addr;
-
-	for(addr = 0; addr < vac_cache_size; addr += vac_line_size)
-		__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-				     : /* no outputs */
-				     : "r" (addr), "i" (ASI_M_DATAC_TAG)
-				     : "memory");
-}
-
-static inline void hyper_flush_unconditional_combined(void)
-{
-	unsigned long addr;
-
-	for (addr = 0; addr < vac_cache_size; addr += vac_line_size)
-		__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-				     : /* no outputs */
-				     : "r" (addr), "i" (ASI_M_FLUSH_CTX)
-				     : "memory");
-}
-
-static inline void hyper_flush_cache_user(void)
-{
-	unsigned long addr;
-
-	for (addr = 0; addr < vac_cache_size; addr += vac_line_size)
-		__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-				     : /* no outputs */
-				     : "r" (addr), "i" (ASI_M_FLUSH_USER)
-				     : "memory");
-}
-
-static inline void hyper_flush_cache_page(unsigned long page)
-{
-	unsigned long end;
-
-	page &= PAGE_MASK;
-	end = page + PAGE_SIZE;
-	while (page < end) {
-		__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-				     : /* no outputs */
-				     : "r" (page), "i" (ASI_M_FLUSH_PAGE)
-				     : "memory");
-		page += vac_line_size;
-	}
-}
-
-#endif /* !(__ASSEMBLY__) */
-
-#endif /* !(_SPARC_ROSS_H) */
diff --git a/arch/sparc/include/asm/swift.h b/arch/sparc/include/asm/swift.h
deleted file mode 100644
index 96f6526b964e..000000000000
--- a/arch/sparc/include/asm/swift.h
+++ /dev/null
@@ -1,107 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* swift.h: Specific definitions for the _broken_ Swift SRMMU
- *          MMU module.
- *
- * Copyright (C) 1996 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#ifndef _SPARC_SWIFT_H
-#define _SPARC_SWIFT_H
-
-/* Swift is so brain damaged, here is the mmu control register. */
-#define SWIFT_ST       0x00800000   /* SW tablewalk enable */
-#define SWIFT_WP       0x00400000   /* Watchpoint enable   */
-
-/* Branch folding (buggy, disable on production systems!)  */
-#define SWIFT_BF       0x00200000
-#define SWIFT_PMC      0x00180000   /* Page mode control   */
-#define SWIFT_PE       0x00040000   /* Parity enable       */
-#define SWIFT_PC       0x00020000   /* Parity control      */
-#define SWIFT_AP       0x00010000   /* Graphics page mode control (TCX/SX) */
-#define SWIFT_AC       0x00008000   /* Alternate Cacheability (see viking.h) */
-#define SWIFT_BM       0x00004000   /* Boot mode */
-#define SWIFT_RC       0x00003c00   /* DRAM refresh control */
-#define SWIFT_IE       0x00000200   /* Instruction cache enable */
-#define SWIFT_DE       0x00000100   /* Data cache enable */
-#define SWIFT_SA       0x00000080   /* Store Allocate */
-#define SWIFT_NF       0x00000002   /* No fault mode */
-#define SWIFT_EN       0x00000001   /* MMU enable */
-
-/* Bits [13:5] select one of 512 instruction cache tags */
-static inline void swift_inv_insn_tag(unsigned long addr)
-{
-	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-			     : /* no outputs */
-			     : "r" (addr), "i" (ASI_M_TXTC_TAG)
-			     : "memory");
-}
-
-/* Bits [12:4] select one of 512 data cache tags */
-static inline void swift_inv_data_tag(unsigned long addr)
-{
-	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-			     : /* no outputs */
-			     : "r" (addr), "i" (ASI_M_DATAC_TAG)
-			     : "memory");
-}
-
-static inline void swift_flush_dcache(void)
-{
-	unsigned long addr;
-
-	for (addr = 0; addr < 0x2000; addr += 0x10)
-		swift_inv_data_tag(addr);
-}
-
-static inline void swift_flush_icache(void)
-{
-	unsigned long addr;
-
-	for (addr = 0; addr < 0x4000; addr += 0x20)
-		swift_inv_insn_tag(addr);
-}
-
-static inline void swift_idflash_clear(void)
-{
-	unsigned long addr;
-
-	for (addr = 0; addr < 0x2000; addr += 0x10) {
-		swift_inv_insn_tag(addr<<1);
-		swift_inv_data_tag(addr);
-	}
-}
-
-/* Swift is so broken, it isn't even safe to use the following. */
-static inline void swift_flush_page(unsigned long page)
-{
-	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-			     : /* no outputs */
-			     : "r" (page), "i" (ASI_M_FLUSH_PAGE)
-			     : "memory");
-}
-
-static inline void swift_flush_segment(unsigned long addr)
-{
-	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-			     : /* no outputs */
-			     : "r" (addr), "i" (ASI_M_FLUSH_SEG)
-			     : "memory");
-}
-
-static inline void swift_flush_region(unsigned long addr)
-{
-	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-			     : /* no outputs */
-			     : "r" (addr), "i" (ASI_M_FLUSH_REGION)
-			     : "memory");
-}
-
-static inline void swift_flush_context(void)
-{
-	__asm__ __volatile__("sta %%g0, [%%g0] %0\n\t"
-			     : /* no outputs */
-			     : "i" (ASI_M_FLUSH_CTX)
-			     : "memory");
-}
-
-#endif /* !(_SPARC_SWIFT_H) */
diff --git a/arch/sparc/include/asm/tsunami.h b/arch/sparc/include/asm/tsunami.h
deleted file mode 100644
index acaf014eff46..000000000000
--- a/arch/sparc/include/asm/tsunami.h
+++ /dev/null
@@ -1,65 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * tsunami.h:  Module specific definitions for Tsunami V8 Sparcs
- *
- * Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#ifndef _SPARC_TSUNAMI_H
-#define _SPARC_TSUNAMI_H
-
-#include <asm/asi.h>
-
-/* The MMU control register on the Tsunami:
- *
- * -----------------------------------------------------------------------
- * | implvers |SW|AV|DV|MV| RSV |PC|ITD|ALC| RSV |PE| RC |IE|DE|RSV|NF|ME|
- * -----------------------------------------------------------------------
- *  31      24 23 22 21 20 19-18 17  16 14  13-12 11 10-9  8  7 6-2  1  0
- *
- * SW: Enable Software Table Walks  0=off 1=on
- * AV: Address View bit
- * DV: Data View bit
- * MV: Memory View bit
- * PC: Parity Control
- * ITD: ITBR disable
- * ALC: Alternate Cacheable
- * PE: Parity Enable   0=off 1=on
- * RC: Refresh Control
- * IE: Instruction cache Enable  0=off 1=on
- * DE: Data cache Enable  0=off 1=on
- * NF: No Fault, same as all other SRMMUs
- * ME: MMU Enable, same as all other SRMMUs
- */
-
-#define TSUNAMI_SW        0x00800000
-#define TSUNAMI_AV        0x00400000
-#define TSUNAMI_DV        0x00200000
-#define TSUNAMI_MV        0x00100000
-#define TSUNAMI_PC        0x00020000
-#define TSUNAMI_ITD       0x00010000
-#define TSUNAMI_ALC       0x00008000
-#define TSUNAMI_PE        0x00001000
-#define TSUNAMI_RCMASK    0x00000C00
-#define TSUNAMI_IENAB     0x00000200
-#define TSUNAMI_DENAB     0x00000100
-#define TSUNAMI_NF        0x00000002
-#define TSUNAMI_ME        0x00000001
-
-static inline void tsunami_flush_icache(void)
-{
-	__asm__ __volatile__("sta %%g0, [%%g0] %0\n\t"
-			     : /* no outputs */
-			     : "i" (ASI_M_IC_FLCLEAR)
-			     : "memory");
-}
-
-static inline void tsunami_flush_dcache(void)
-{
-	__asm__ __volatile__("sta %%g0, [%%g0] %0\n\t"
-			     : /* no outputs */
-			     : "i" (ASI_M_DC_FLCLEAR)
-			     : "memory");
-}
-
-#endif /* !(_SPARC_TSUNAMI_H) */
diff --git a/arch/sparc/include/asm/turbosparc.h b/arch/sparc/include/asm/turbosparc.h
deleted file mode 100644
index 23df777f9cea..000000000000
--- a/arch/sparc/include/asm/turbosparc.h
+++ /dev/null
@@ -1,126 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * turbosparc.h:  Defines specific to the TurboSparc module.
- *            This is SRMMU stuff.
- *
- * Copyright (C) 1997 Jakub Jelinek (jj@sunsite.mff.cuni.cz)
- */
-#ifndef _SPARC_TURBOSPARC_H
-#define _SPARC_TURBOSPARC_H
-
-#include <asm/asi.h>
-#include <asm/pgtsrmmu.h>
-
-/* Bits in the SRMMU control register for TurboSparc modules.
- *
- * -------------------------------------------------------------------
- * |impl-vers| RSV| PMC |PE|PC| RSV |BM| RFR |IC|DC|PSO|RSV|ICS|NF|ME|
- * -------------------------------------------------------------------
- *  31    24 23-21 20-19 18 17 16-15 14 13-10  9  8  7  6-3   2  1  0
- *
- * BM: Boot Mode -- 0 = not in boot mode, 1 = in boot mode
- *
- * This indicates whether the TurboSparc is in boot-mode or not.
- *
- * IC: Instruction Cache -- 0 = off, 1 = on
- * DC: Data Cache -- 0 = off, 1 = 0n
- *
- * These bits enable the on-cpu TurboSparc split I/D caches.
- *
- * ICS: ICache Snooping -- 0 = disable, 1 = enable snooping of icache
- * NF: No Fault -- 0 = faults generate traps, 1 = faults don't trap
- * ME: MMU enable -- 0 = mmu not translating, 1 = mmu translating
- *
- */
-
-#define TURBOSPARC_MMUENABLE    0x00000001
-#define TURBOSPARC_NOFAULT      0x00000002
-#define TURBOSPARC_ICSNOOP	0x00000004
-#define TURBOSPARC_PSO          0x00000080
-#define TURBOSPARC_DCENABLE     0x00000100   /* Enable data cache */
-#define TURBOSPARC_ICENABLE     0x00000200   /* Enable instruction cache */
-#define TURBOSPARC_BMODE        0x00004000   
-#define TURBOSPARC_PARITYODD	0x00020000   /* Parity odd, if enabled */
-#define TURBOSPARC_PCENABLE	0x00040000   /* Enable parity checking */
-
-/* Bits in the CPU configuration register for TurboSparc modules.
- *
- * -------------------------------------------------------
- * |IOClk|SNP|AXClk| RAH |  WS |  RSV  |SBC|WT|uS2|SE|SCC|
- * -------------------------------------------------------
- *    31   30 29-28 27-26 25-23   22-8  7-6  5  4   3 2-0
- *
- */
-
-#define TURBOSPARC_SCENABLE 0x00000008	 /* Secondary cache enable */
-#define TURBOSPARC_uS2	    0x00000010   /* Swift compatibility mode */
-#define TURBOSPARC_WTENABLE 0x00000020	 /* Write thru for dcache */
-#define TURBOSPARC_SNENABLE 0x40000000	 /* DVMA snoop enable */
-
-#ifndef __ASSEMBLY__
-
-/* Bits [13:5] select one of 512 instruction cache tags */
-static inline void turbosparc_inv_insn_tag(unsigned long addr)
-{
-        __asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-			     : /* no outputs */
-			     : "r" (addr), "i" (ASI_M_TXTC_TAG)
-			     : "memory");
-}
-
-/* Bits [13:5] select one of 512 data cache tags */
-static inline void turbosparc_inv_data_tag(unsigned long addr)
-{
-        __asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-			     : /* no outputs */
-			     : "r" (addr), "i" (ASI_M_DATAC_TAG)
-			     : "memory");
-}
-
-static inline void turbosparc_flush_icache(void)
-{
-	unsigned long addr;
-
-        for (addr = 0; addr < 0x4000; addr += 0x20)
-                turbosparc_inv_insn_tag(addr);
-}
-
-static inline void turbosparc_flush_dcache(void)
-{
-	unsigned long addr;
-
-        for (addr = 0; addr < 0x4000; addr += 0x20)
-                turbosparc_inv_data_tag(addr);
-}
-
-static inline void turbosparc_idflash_clear(void)
-{
-	unsigned long addr;
-
-        for (addr = 0; addr < 0x4000; addr += 0x20) {
-                turbosparc_inv_insn_tag(addr);
-                turbosparc_inv_data_tag(addr);
-	}
-}
-
-static inline void turbosparc_set_ccreg(unsigned long regval)
-{
-	__asm__ __volatile__("sta %0, [%1] %2\n\t"
-			     : /* no outputs */
-			     : "r" (regval), "r" (0x600), "i" (ASI_M_MMUREGS)
-			     : "memory");
-}
-
-static inline unsigned long turbosparc_get_ccreg(void)
-{
-	unsigned long regval;
-
-	__asm__ __volatile__("lda [%1] %2, %0\n\t"
-			     : "=r" (regval)
-			     : "r" (0x600), "i" (ASI_M_MMUREGS));
-	return regval;
-}
-
-#endif /* !__ASSEMBLY__ */
-
-#endif /* !(_SPARC_TURBOSPARC_H) */
diff --git a/arch/sparc/include/asm/viking.h b/arch/sparc/include/asm/viking.h
deleted file mode 100644
index 08ffc605035f..000000000000
--- a/arch/sparc/include/asm/viking.h
+++ /dev/null
@@ -1,255 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * viking.h:  Defines specific to the GNU/Viking MBUS module.
- *            This is SRMMU stuff.
- *
- * Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
- */
-#ifndef _SPARC_VIKING_H
-#define _SPARC_VIKING_H
-
-#include <asm/asi.h>
-#include <asm/mxcc.h>
-#include <asm/pgtable.h>
-#include <asm/pgtsrmmu.h>
-
-/* Bits in the SRMMU control register for GNU/Viking modules.
- *
- * -----------------------------------------------------------
- * |impl-vers| RSV |TC|AC|SP|BM|PC|MBM|SB|IC|DC|PSO|RSV|NF|ME|
- * -----------------------------------------------------------
- *  31     24 23-17 16 15 14 13 12 11  10  9  8  7  6-2  1  0
- *
- * TC: Tablewalk Cacheable -- 0 = Twalks are not cacheable in E-cache
- *                            1 = Twalks are cacheable in E-cache
- *
- * GNU/Viking will only cache tablewalks in the E-cache (mxcc) if present
- * and never caches them internally (or so states the docs).  Therefore
- * for machines lacking an E-cache (ie. in MBUS mode) this bit must
- * remain cleared.
- *
- * AC: Alternate Cacheable -- 0 = Passthru physical accesses not cacheable
- *                            1 = Passthru physical accesses cacheable
- *
- * This indicates whether accesses are cacheable when no cachable bit
- * is present in the pte when the processor is in boot-mode or the
- * access does not need pte's for translation (ie. pass-thru ASI's).
- * "Cachable" is only referring to E-cache (if present) and not the
- * on chip split I/D caches of the GNU/Viking.
- *
- * SP: SnooP Enable -- 0 = bus snooping off, 1 = bus snooping on
- *
- * This enables snooping on the GNU/Viking bus.  This must be on
- * for the hardware cache consistency mechanisms of the GNU/Viking
- * to work at all.  On non-mxcc GNU/Viking modules the split I/D
- * caches will snoop regardless of whether they are enabled, this
- * takes care of the case where the I or D or both caches are turned
- * off yet still contain valid data.  Note also that this bit does
- * not affect GNU/Viking store-buffer snoops, those happen if the
- * store-buffer is enabled no matter what.
- *
- * BM: Boot Mode -- 0 = not in boot mode, 1 = in boot mode
- *
- * This indicates whether the GNU/Viking is in boot-mode or not,
- * if it is then all instruction fetch physical addresses are
- * computed as 0xff0000000 + low 28 bits of requested address.
- * GNU/Viking boot-mode does not affect data accesses.  Also,
- * in boot mode instruction accesses bypass the split on chip I/D
- * caches, they may be cached by the GNU/MXCC if present and enabled.
- *
- * MBM: MBus Mode -- 0 = not in MBus mode, 1 = in MBus mode
- *
- * This indicated the GNU/Viking configuration present.  If in
- * MBUS mode, the GNU/Viking lacks a GNU/MXCC E-cache.  If it is
- * not then the GNU/Viking is on a module VBUS connected directly
- * to a GNU/MXCC cache controller.  The GNU/MXCC can be thus connected
- * to either an GNU/MBUS (sun4m) or the packet-switched GNU/XBus (sun4d).
- *
- * SB: StoreBuffer enable -- 0 = store buffer off, 1 = store buffer on
- *
- * The GNU/Viking store buffer allows the chip to continue execution
- * after a store even if the data cannot be placed in one of the
- * caches during that cycle.  If disabled, all stores operations
- * occur synchronously.
- *
- * IC: Instruction Cache -- 0 = off, 1 = on
- * DC: Data Cache -- 0 = off, 1 = 0n
- *
- * These bits enable the on-cpu GNU/Viking split I/D caches.  Note,
- * as mentioned above, these caches will snoop the bus in GNU/MBUS
- * configurations even when disabled to avoid data corruption.
- *
- * NF: No Fault -- 0 = faults generate traps, 1 = faults don't trap
- * ME: MMU enable -- 0 = mmu not translating, 1 = mmu translating
- *
- */
-
-#define VIKING_MMUENABLE    0x00000001
-#define VIKING_NOFAULT      0x00000002
-#define VIKING_PSO          0x00000080
-#define VIKING_DCENABLE     0x00000100   /* Enable data cache */
-#define VIKING_ICENABLE     0x00000200   /* Enable instruction cache */
-#define VIKING_SBENABLE     0x00000400   /* Enable store buffer */
-#define VIKING_MMODE        0x00000800   /* MBUS mode */
-#define VIKING_PCENABLE     0x00001000   /* Enable parity checking */
-#define VIKING_BMODE        0x00002000   
-#define VIKING_SPENABLE     0x00004000   /* Enable bus cache snooping */
-#define VIKING_ACENABLE     0x00008000   /* Enable alternate caching */
-#define VIKING_TCENABLE     0x00010000   /* Enable table-walks to be cached */
-#define VIKING_DPENABLE     0x00040000   /* Enable the data prefetcher */
-
-/*
- * GNU/Viking Breakpoint Action Register fields.
- */
-#define VIKING_ACTION_MIX   0x00001000   /* Enable multiple instructions */
-
-/*
- * GNU/Viking Cache Tags.
- */
-#define VIKING_PTAG_VALID   0x01000000   /* Cache block is valid */
-#define VIKING_PTAG_DIRTY   0x00010000   /* Block has been modified */
-#define VIKING_PTAG_SHARED  0x00000100   /* Shared with some other cache */
-
-#ifndef __ASSEMBLY__
-
-static inline void viking_flush_icache(void)
-{
-	__asm__ __volatile__("sta %%g0, [%%g0] %0\n\t"
-			     : /* no outputs */
-			     : "i" (ASI_M_IC_FLCLEAR)
-			     : "memory");
-}
-
-static inline void viking_flush_dcache(void)
-{
-	__asm__ __volatile__("sta %%g0, [%%g0] %0\n\t"
-			     : /* no outputs */
-			     : "i" (ASI_M_DC_FLCLEAR)
-			     : "memory");
-}
-
-static inline void viking_unlock_icache(void)
-{
-	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-			     : /* no outputs */
-			     : "r" (0x80000000), "i" (ASI_M_IC_FLCLEAR)
-			     : "memory");
-}
-
-static inline void viking_unlock_dcache(void)
-{
-	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"
-			     : /* no outputs */
-			     : "r" (0x80000000), "i" (ASI_M_DC_FLCLEAR)
-			     : "memory");
-}
-
-static inline void viking_set_bpreg(unsigned long regval)
-{
-	__asm__ __volatile__("sta %0, [%%g0] %1\n\t"
-			     : /* no outputs */
-			     : "r" (regval), "i" (ASI_M_ACTION)
-			     : "memory");
-}
-
-static inline unsigned long viking_get_bpreg(void)
-{
-	unsigned long regval;
-
-	__asm__ __volatile__("lda [%%g0] %1, %0\n\t"
-			     : "=r" (regval)
-			     : "i" (ASI_M_ACTION));
-	return regval;
-}
-
-static inline void viking_get_dcache_ptag(int set, int block,
-					      unsigned long *data)
-{
-	unsigned long ptag = ((set & 0x7f) << 5) | ((block & 0x3) << 26) |
-			     0x80000000;
-	unsigned long info, page;
-
-	__asm__ __volatile__ ("ldda [%2] %3, %%g2\n\t"
-			      "or %%g0, %%g2, %0\n\t"
-			      "or %%g0, %%g3, %1\n\t"
-			      : "=r" (info), "=r" (page)
-			      : "r" (ptag), "i" (ASI_M_DATAC_TAG)
-			      : "g2", "g3");
-	data[0] = info;
-	data[1] = page;
-}
-
-static inline void viking_mxcc_turn_off_parity(unsigned long *mregp,
-						   unsigned long *mxcc_cregp)
-{
-	unsigned long mreg = *mregp;
-	unsigned long mxcc_creg = *mxcc_cregp;
-
-	mreg &= ~(VIKING_PCENABLE);
-	mxcc_creg &= ~(MXCC_CTL_PARE);
-
-	__asm__ __volatile__ ("set 1f, %%g2\n\t"
-			      "andcc %%g2, 4, %%g0\n\t"
-			      "bne 2f\n\t"
-			      " nop\n"
-			      "1:\n\t"
-			      "sta %0, [%%g0] %3\n\t"
-			      "sta %1, [%2] %4\n\t"
-			      "b 1f\n\t"
-			      " nop\n\t"
-			      "nop\n"
-			      "2:\n\t"
-			      "sta %0, [%%g0] %3\n\t"
-			      "sta %1, [%2] %4\n"
-			      "1:\n\t"
-			      : /* no output */
-			      : "r" (mreg), "r" (mxcc_creg),
-			        "r" (MXCC_CREG), "i" (ASI_M_MMUREGS),
-			        "i" (ASI_M_MXCC)
-			      : "g2", "memory", "cc");
-	*mregp = mreg;
-	*mxcc_cregp = mxcc_creg;
-}
-
-static inline unsigned long viking_hwprobe(unsigned long vaddr)
-{
-	unsigned long val;
-
-	vaddr &= PAGE_MASK;
-	/* Probe all MMU entries. */
-	__asm__ __volatile__("lda [%1] %2, %0\n\t"
-			     : "=r" (val)
-			     : "r" (vaddr | 0x400), "i" (ASI_M_FLUSH_PROBE));
-	if (!val)
-		return 0;
-
-	/* Probe region. */
-	__asm__ __volatile__("lda [%1] %2, %0\n\t"
-			     : "=r" (val)
-			     : "r" (vaddr | 0x200), "i" (ASI_M_FLUSH_PROBE));
-	if ((val & SRMMU_ET_MASK) == SRMMU_ET_PTE) {
-		vaddr &= ~PGDIR_MASK;
-		vaddr >>= PAGE_SHIFT;
-		return val | (vaddr << 8);
-	}
-
-	/* Probe segment. */
-	__asm__ __volatile__("lda [%1] %2, %0\n\t"
-			     : "=r" (val)
-			     : "r" (vaddr | 0x100), "i" (ASI_M_FLUSH_PROBE));
-	if ((val & SRMMU_ET_MASK) == SRMMU_ET_PTE) {
-		vaddr &= ~PMD_MASK;
-		vaddr >>= PAGE_SHIFT;
-		return val | (vaddr << 8);
-	}
-
-	/* Probe page. */
-	__asm__ __volatile__("lda [%1] %2, %0\n\t"
-			     : "=r" (val)
-			     : "r" (vaddr), "i" (ASI_M_FLUSH_PROBE));
-	return val;
-}
-
-#endif /* !__ASSEMBLY__ */
-
-#endif /* !(_SPARC_VIKING_H) */
diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
index 13011969e7eb..0f2417ee3f95 100644
--- a/arch/sparc/kernel/entry.S
+++ b/arch/sparc/kernel/entry.S
@@ -25,7 +25,6 @@
 #include <asm/winmacro.h>
 #include <asm/signal.h>
 #include <asm/obio.h>
-#include <asm/mxcc.h>
 #include <asm/thread_info.h>
 #include <asm/param.h>
 #include <asm/unistd.h>
diff --git a/arch/sparc/mm/Makefile b/arch/sparc/mm/Makefile
index 871354aa3c00..4347247d6cb0 100644
--- a/arch/sparc/mm/Makefile
+++ b/arch/sparc/mm/Makefile
@@ -10,7 +10,6 @@ obj-y                   += fault_$(BITS).o
 obj-y                   += init_$(BITS).o
 obj-$(CONFIG_SPARC32)   += srmmu.o iommu.o io-unit.o
 obj-$(CONFIG_SPARC32)   += srmmu_access.o
-obj-$(CONFIG_SPARC32)   += hypersparc.o viking.o tsunami.o swift.o
 obj-$(CONFIG_SPARC32)   += leon_mm.o
 
 # Only used by sparc64
diff --git a/arch/sparc/mm/hypersparc.S b/arch/sparc/mm/hypersparc.S
deleted file mode 100644
index 6c2521e85a42..000000000000
--- a/arch/sparc/mm/hypersparc.S
+++ /dev/null
@@ -1,414 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * hypersparc.S: High speed Hypersparc mmu/cache operations.
- *
- * Copyright (C) 1997 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#include <asm/ptrace.h>
-#include <asm/psr.h>
-#include <asm/asm-offsets.h>
-#include <asm/asi.h>
-#include <asm/page.h>
-#include <asm/pgtable.h>
-#include <asm/pgtsrmmu.h>
-#include <linux/init.h>
-
-	.text
-	.align	4
-
-	.globl	hypersparc_flush_cache_all, hypersparc_flush_cache_mm
-	.globl	hypersparc_flush_cache_range, hypersparc_flush_cache_page
-	.globl	hypersparc_flush_page_to_ram
-	.globl	hypersparc_flush_page_for_dma, hypersparc_flush_sig_insns
-	.globl	hypersparc_flush_tlb_all, hypersparc_flush_tlb_mm
-	.globl	hypersparc_flush_tlb_range, hypersparc_flush_tlb_page
-
-hypersparc_flush_cache_all:
-	WINDOW_FLUSH(%g4, %g5)
-	sethi	%hi(vac_cache_size), %g4
-	ld	[%g4 + %lo(vac_cache_size)], %g5
-	sethi	%hi(vac_line_size), %g1
-	ld	[%g1 + %lo(vac_line_size)], %g2
-1:	
-	subcc	%g5, %g2, %g5			! hyper_flush_unconditional_combined
-	bne	1b
-	 sta	%g0, [%g5] ASI_M_FLUSH_CTX
-	retl
-	 sta	%g0, [%g0] ASI_M_FLUSH_IWHOLE	! hyper_flush_whole_icache
-
-	/* We expand the window flush to get maximum performance. */
-hypersparc_flush_cache_mm:
-#ifndef CONFIG_SMP
-	ld	[%o0 + AOFF_mm_context], %g1
-	cmp	%g1, -1
-	be	hypersparc_flush_cache_mm_out
-#endif
-	WINDOW_FLUSH(%g4, %g5)
-
-	sethi	%hi(vac_line_size), %g1
-	ld	[%g1 + %lo(vac_line_size)], %o1
-	sethi	%hi(vac_cache_size), %g2
-	ld	[%g2 + %lo(vac_cache_size)], %o0
-	add	%o1, %o1, %g1
-	add	%o1, %g1, %g2
-	add	%o1, %g2, %g3
-	add	%o1, %g3, %g4
-	add	%o1, %g4, %g5
-	add	%o1, %g5, %o4
-	add	%o1, %o4, %o5
-
-	/* BLAMMO! */
-1:
-	subcc	%o0, %o5, %o0				! hyper_flush_cache_user
-	sta	%g0, [%o0 + %g0] ASI_M_FLUSH_USER
-	sta	%g0, [%o0 + %o1] ASI_M_FLUSH_USER
-	sta	%g0, [%o0 + %g1] ASI_M_FLUSH_USER
-	sta	%g0, [%o0 + %g2] ASI_M_FLUSH_USER
-	sta	%g0, [%o0 + %g3] ASI_M_FLUSH_USER
-	sta	%g0, [%o0 + %g4] ASI_M_FLUSH_USER
-	sta	%g0, [%o0 + %g5] ASI_M_FLUSH_USER
-	bne	1b
-	 sta	%g0, [%o0 + %o4] ASI_M_FLUSH_USER
-hypersparc_flush_cache_mm_out:
-	retl
-	 nop
-
-	/* The things we do for performance... */
-hypersparc_flush_cache_range:
-	ld	[%o0 + VMA_VM_MM], %o0
-#ifndef CONFIG_SMP
-	ld	[%o0 + AOFF_mm_context], %g1
-	cmp	%g1, -1
-	be	hypersparc_flush_cache_range_out
-#endif
-	WINDOW_FLUSH(%g4, %g5)
-
-	sethi	%hi(vac_line_size), %g1
-	ld	[%g1 + %lo(vac_line_size)], %o4
-	sethi	%hi(vac_cache_size), %g2
-	ld	[%g2 + %lo(vac_cache_size)], %o3
-
-	/* Here comes the fun part... */
-	add	%o2, (PAGE_SIZE - 1), %o2
-	andn	%o1, (PAGE_SIZE - 1), %o1
-	add	%o4, %o4, %o5
-	andn	%o2, (PAGE_SIZE - 1), %o2
-	add	%o4, %o5, %g1
-	sub	%o2, %o1, %g4
-	add	%o4, %g1, %g2
-	sll	%o3, 2, %g5
-	add	%o4, %g2, %g3
-	cmp	%g4, %g5
-	add	%o4, %g3, %g4
-	blu	0f
-	 add	%o4, %g4, %g5
-	add	%o4, %g5, %g7
-
-	/* Flush entire user space, believe it or not this is quicker
-	 * than page at a time flushings for range > (cache_size<<2).
-	 */
-1:
-	subcc	%o3, %g7, %o3
-	sta	%g0, [%o3 + %g0] ASI_M_FLUSH_USER
-	sta	%g0, [%o3 + %o4] ASI_M_FLUSH_USER
-	sta	%g0, [%o3 + %o5] ASI_M_FLUSH_USER
-	sta	%g0, [%o3 + %g1] ASI_M_FLUSH_USER
-	sta	%g0, [%o3 + %g2] ASI_M_FLUSH_USER
-	sta	%g0, [%o3 + %g3] ASI_M_FLUSH_USER
-	sta	%g0, [%o3 + %g4] ASI_M_FLUSH_USER
-	bne	1b
-	 sta	%g0, [%o3 + %g5] ASI_M_FLUSH_USER
-	retl
-	 nop
-
-	/* Below our threshold, flush one page at a time. */
-0:
-	ld	[%o0 + AOFF_mm_context], %o0
-	mov	SRMMU_CTX_REG, %g7
-	lda	[%g7] ASI_M_MMUREGS, %o3
-	sta	%o0, [%g7] ASI_M_MMUREGS
-	add	%o2, -PAGE_SIZE, %o0
-1:
-	or	%o0, 0x400, %g7
-	lda	[%g7] ASI_M_FLUSH_PROBE, %g7
-	orcc	%g7, 0, %g0
-	be,a	3f
-	 mov	%o0, %o2
-	add	%o4, %g5, %g7
-2:
-	sub	%o2, %g7, %o2
-	sta	%g0, [%o2 + %g0] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o2 + %o4] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o2 + %o5] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o2 + %g1] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o2 + %g2] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o2 + %g3] ASI_M_FLUSH_PAGE
-	andcc	%o2, 0xffc, %g0
-	sta	%g0, [%o2 + %g4] ASI_M_FLUSH_PAGE
-	bne	2b
-	 sta	%g0, [%o2 + %g5] ASI_M_FLUSH_PAGE
-3:
-	cmp	%o2, %o1
-	bne	1b
-	 add	%o2, -PAGE_SIZE, %o0
-	mov	SRMMU_FAULT_STATUS, %g5
-	lda	[%g5] ASI_M_MMUREGS, %g0
-	mov	SRMMU_CTX_REG, %g7
-	sta	%o3, [%g7] ASI_M_MMUREGS
-hypersparc_flush_cache_range_out:
-	retl
-	 nop
-
-	/* HyperSparc requires a valid mapping where we are about to flush
-	 * in order to check for a physical tag match during the flush.
-	 */
-	/* Verified, my ass... */
-hypersparc_flush_cache_page:
-	ld	[%o0 + VMA_VM_MM], %o0
-	ld	[%o0 + AOFF_mm_context], %g2
-#ifndef CONFIG_SMP
-	cmp	%g2, -1
-	be	hypersparc_flush_cache_page_out
-#endif
-	WINDOW_FLUSH(%g4, %g5)
-
-	sethi	%hi(vac_line_size), %g1
-	ld	[%g1 + %lo(vac_line_size)], %o4
-	mov	SRMMU_CTX_REG, %o3
-	andn	%o1, (PAGE_SIZE - 1), %o1
-	lda	[%o3] ASI_M_MMUREGS, %o2
-	sta	%g2, [%o3] ASI_M_MMUREGS
-	or	%o1, 0x400, %o5
-	lda	[%o5] ASI_M_FLUSH_PROBE, %g1
-	orcc	%g0, %g1, %g0
-	be	2f
-	 add	%o4, %o4, %o5
-	sub	%o1, -PAGE_SIZE, %o1
-	add	%o4, %o5, %g1
-	add	%o4, %g1, %g2
-	add	%o4, %g2, %g3
-	add	%o4, %g3, %g4
-	add	%o4, %g4, %g5
-	add	%o4, %g5, %g7
-
-	/* BLAMMO! */
-1:
-	sub	%o1, %g7, %o1
-	sta	%g0, [%o1 + %g0] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o4] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o5] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %g1] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %g2] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %g3] ASI_M_FLUSH_PAGE
-	andcc	%o1, 0xffc, %g0
-	sta	%g0, [%o1 + %g4] ASI_M_FLUSH_PAGE
-	bne	1b
-	 sta	%g0, [%o1 + %g5] ASI_M_FLUSH_PAGE
-2:
-	mov	SRMMU_FAULT_STATUS, %g7
-	mov	SRMMU_CTX_REG, %g4
-	lda	[%g7] ASI_M_MMUREGS, %g0
-	sta	%o2, [%g4] ASI_M_MMUREGS
-hypersparc_flush_cache_page_out:
-	retl
-	 nop
-
-hypersparc_flush_sig_insns:
-	flush	%o1
-	retl
-	 flush	%o1 + 4
-
-	/* HyperSparc is copy-back. */
-hypersparc_flush_page_to_ram:
-	sethi	%hi(vac_line_size), %g1
-	ld	[%g1 + %lo(vac_line_size)], %o4
-	andn	%o0, (PAGE_SIZE - 1), %o0
-	add	%o4, %o4, %o5
-	or	%o0, 0x400, %g7
-	lda	[%g7] ASI_M_FLUSH_PROBE, %g5
-	add	%o4, %o5, %g1
-	orcc	%g5, 0, %g0
-	be	2f
-	 add	%o4, %g1, %g2
-	add	%o4, %g2, %g3
-	sub	%o0, -PAGE_SIZE, %o0
-	add	%o4, %g3, %g4
-	add	%o4, %g4, %g5
-	add	%o4, %g5, %g7
-
-	/* BLAMMO! */
-1:
-	sub	%o0, %g7, %o0
-	sta	%g0, [%o0 + %g0] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o0 + %o4] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o0 + %o5] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o0 + %g1] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o0 + %g2] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o0 + %g3] ASI_M_FLUSH_PAGE
-	andcc	%o0, 0xffc, %g0
-	sta	%g0, [%o0 + %g4] ASI_M_FLUSH_PAGE
-	bne	1b
-	 sta	%g0, [%o0 + %g5] ASI_M_FLUSH_PAGE
-2:
-	mov	SRMMU_FAULT_STATUS, %g1
-	retl
-	 lda	[%g1] ASI_M_MMUREGS, %g0
-
-	/* HyperSparc is IO cache coherent. */
-hypersparc_flush_page_for_dma:
-	retl
-	 nop
-
-	/* It was noted that at boot time a TLB flush all in a delay slot
-	 * can deliver an illegal instruction to the processor if the timing
-	 * is just right...
-	 */
-hypersparc_flush_tlb_all:
-	mov	0x400, %g1
-	sta	%g0, [%g1] ASI_M_FLUSH_PROBE
-	retl
-	 nop
-
-hypersparc_flush_tlb_mm:
-	mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + AOFF_mm_context], %o1
-	lda	[%g1] ASI_M_MMUREGS, %g5
-#ifndef CONFIG_SMP
-	cmp	%o1, -1
-	be	hypersparc_flush_tlb_mm_out
-#endif
-	 mov	0x300, %g2
-	sta	%o1, [%g1] ASI_M_MMUREGS
-	sta	%g0, [%g2] ASI_M_FLUSH_PROBE
-hypersparc_flush_tlb_mm_out:
-	retl
-	 sta	%g5, [%g1] ASI_M_MMUREGS
-
-hypersparc_flush_tlb_range:
-	ld	[%o0 + VMA_VM_MM], %o0
-	mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + AOFF_mm_context], %o3
-	lda	[%g1] ASI_M_MMUREGS, %g5
-#ifndef CONFIG_SMP
-	cmp	%o3, -1
-	be	hypersparc_flush_tlb_range_out
-#endif
-	 sethi	%hi(~((1 << PGDIR_SHIFT) - 1)), %o4
-	sta	%o3, [%g1] ASI_M_MMUREGS
-	and	%o1, %o4, %o1
-	add	%o1, 0x200, %o1
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-1:
-	sub	%o1, %o4, %o1
-	cmp	%o1, %o2
-	blu,a	1b
-	 sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-hypersparc_flush_tlb_range_out:
-	retl
-	 sta	%g5, [%g1] ASI_M_MMUREGS
-
-hypersparc_flush_tlb_page:
-	ld	[%o0 + VMA_VM_MM], %o0
-	mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + AOFF_mm_context], %o3
-	andn	%o1, (PAGE_SIZE - 1), %o1
-#ifndef CONFIG_SMP
-	cmp	%o3, -1
-	be	hypersparc_flush_tlb_page_out
-#endif
-	 lda	[%g1] ASI_M_MMUREGS, %g5
-	sta	%o3, [%g1] ASI_M_MMUREGS
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-hypersparc_flush_tlb_page_out:
-	retl
-	 sta	%g5, [%g1] ASI_M_MMUREGS
-
-	__INIT
-	
-	/* High speed page clear/copy. */
-hypersparc_bzero_1page:
-/* NOTE: This routine has to be shorter than 40insns --jj */
-	clr	%g1
-	mov	32, %g2
-	mov	64, %g3
-	mov	96, %g4
-	mov	128, %g5
-	mov	160, %g7
-	mov	192, %o2
-	mov	224, %o3
-	mov	16, %o1
-1:
-	stda	%g0, [%o0 + %g0] ASI_M_BFILL
-	stda	%g0, [%o0 + %g2] ASI_M_BFILL
-	stda	%g0, [%o0 + %g3] ASI_M_BFILL
-	stda	%g0, [%o0 + %g4] ASI_M_BFILL
-	stda	%g0, [%o0 + %g5] ASI_M_BFILL
-	stda	%g0, [%o0 + %g7] ASI_M_BFILL
-	stda	%g0, [%o0 + %o2] ASI_M_BFILL
-	stda	%g0, [%o0 + %o3] ASI_M_BFILL
-	subcc	%o1, 1, %o1
-	bne	1b
-	 add	%o0, 256, %o0
-
-	retl
-	 nop
-
-hypersparc_copy_1page:
-/* NOTE: This routine has to be shorter than 70insns --jj */
-	sub	%o1, %o0, %o2		! difference
-	mov	16, %g1
-1:
-	sta	%o0, [%o0 + %o2] ASI_M_BCOPY
-	add	%o0, 32, %o0
-	sta	%o0, [%o0 + %o2] ASI_M_BCOPY
-	add	%o0, 32, %o0
-	sta	%o0, [%o0 + %o2] ASI_M_BCOPY
-	add	%o0, 32, %o0
-	sta	%o0, [%o0 + %o2] ASI_M_BCOPY
-	add	%o0, 32, %o0
-	sta	%o0, [%o0 + %o2] ASI_M_BCOPY
-	add	%o0, 32, %o0
-	sta	%o0, [%o0 + %o2] ASI_M_BCOPY
-	add	%o0, 32, %o0
-	sta	%o0, [%o0 + %o2] ASI_M_BCOPY
-	add	%o0, 32, %o0
-	sta	%o0, [%o0 + %o2] ASI_M_BCOPY
-	subcc	%g1, 1, %g1
-	bne	1b
-	 add	%o0, 32, %o0
-
-	retl
-	 nop
-
-	.globl	hypersparc_setup_blockops
-hypersparc_setup_blockops:
-	sethi	%hi(bzero_1page), %o0
-	or	%o0, %lo(bzero_1page), %o0
-	sethi	%hi(hypersparc_bzero_1page), %o1
-	or	%o1, %lo(hypersparc_bzero_1page), %o1
-	sethi	%hi(hypersparc_copy_1page), %o2
-	or	%o2, %lo(hypersparc_copy_1page), %o2
-	ld	[%o1], %o4
-1:
-	add	%o1, 4, %o1
-	st	%o4, [%o0]
-	add	%o0, 4, %o0
-	cmp	%o1, %o2
-	bne	1b
-	 ld	[%o1], %o4
-	sethi	%hi(__copy_1page), %o0
-	or	%o0, %lo(__copy_1page), %o0
-	sethi	%hi(hypersparc_setup_blockops), %o2
-	or	%o2, %lo(hypersparc_setup_blockops), %o2
-	ld	[%o1], %o4
-1:
-	add	%o1, 4, %o1
-	st	%o4, [%o0]
-	add	%o0, 4, %o0
-	cmp	%o1, %o2
-	bne	1b
-	 ld	[%o1], %o4
-	sta	%g0, [%g0] ASI_M_FLUSH_IWHOLE
-	retl
-	 nop
diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
index d94d7868feb9..a2cfa8757795 100644
--- a/arch/sparc/mm/io-unit.c
+++ b/arch/sparc/mm/io-unit.c
@@ -18,7 +18,6 @@
 
 #include <asm/io.h>
 #include <asm/io-unit.h>
-#include <asm/mxcc.h>
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 #include <asm/dma.h>
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index 832e5ff8b663..482e08df7bad 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 
 #include <asm/io.h>
-#include <asm/mxcc.h>
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
 #include <asm/bitext.h>
@@ -37,11 +36,6 @@
 #define IOMMU_NPTES	(IOMMU_WINSIZE/PAGE_SIZE)	/* 64K PTEs, 256KB */
 #define IOMMU_ORDER	6				/* 4096 * (1<<6) */
 
-static int viking_flush;
-/* viking.S */
-extern void viking_flush_page(unsigned long page);
-extern void viking_mxcc_flush_page(unsigned long page);
-
 /*
  * Values precomputed according to CPU type.
  */
@@ -156,21 +150,9 @@ static void iommu_flush_iotlb(iopte_t *iopte, unsigned int niopte)
 	start = (unsigned long)iopte;
 	end = PAGE_ALIGN(start + niopte*sizeof(iopte_t));
 	start &= PAGE_MASK;
-	if (viking_mxcc_present) {
-		while(start < end) {
-			viking_mxcc_flush_page(start);
-			start += PAGE_SIZE;
-		}
-	} else if (viking_flush) {
-		while(start < end) {
-			viking_flush_page(start);
-			start += PAGE_SIZE;
-		}
-	} else {
-		while(start < end) {
-			__flush_page_to_ram(start);
-			start += PAGE_SIZE;
-		}
+	while(start < end) {
+		__flush_page_to_ram(start);
+		start += PAGE_SIZE;
 	}
 }
 
@@ -344,12 +326,7 @@ static void *sbus_iommu_alloc(struct device *dev, size_t len,
 			pmd_t *pmdp;
 			pte_t *ptep;
 
-			if (viking_mxcc_present)
-				viking_mxcc_flush_page(page);
-			else if (viking_flush)
-				viking_flush_page(page);
-			else
-				__flush_page_to_ram(page);
+			__flush_page_to_ram(page);
 
 			pmdp = pmd_off_k(addr);
 			ptep = pte_offset_kernel(pmdp, addr);
diff --git a/arch/sparc/mm/mm_32.h b/arch/sparc/mm/mm_32.h
index ee55f1080634..2c83b8ce742d 100644
--- a/arch/sparc/mm/mm_32.h
+++ b/arch/sparc/mm/mm_32.h
@@ -9,7 +9,6 @@ void window_ret_fault(struct pt_regs *regs);
 
 /* srmmu.c */
 extern char *srmmu_name;
-extern int viking_mxcc_present;
 extern int flush_page_for_dma_global;
 
 extern void (*poke_srmmu)(void);
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 9161f55049ae..4a3778549c6f 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -40,13 +40,7 @@
 #include <asm/io.h>
 
 /* Now the cpu specific definitions. */
-#include <asm/turbosparc.h>
-#include <asm/tsunami.h>
-#include <asm/viking.h>
-#include <asm/swift.h>
 #include <asm/leon.h>
-#include <asm/mxcc.h>
-#include <asm/ross.h>
 
 #include "mm_32.h"
 
@@ -65,12 +59,6 @@ EXPORT_SYMBOL(sparc32_cachetlb_ops);
 
 #ifdef CONFIG_SMP
 const struct sparc32_cachetlb_ops *local_ops;
-
-#define FLUSH_BEGIN(mm)
-#define FLUSH_END
-#else
-#define FLUSH_BEGIN(mm) if ((mm)->context != NO_CONTEXT) {
-#define FLUSH_END	}
 #endif
 
 int flush_page_for_dma_global = 1;
@@ -80,11 +68,8 @@ char *srmmu_name;
 ctxd_t *srmmu_ctx_table_phys;
 static ctxd_t *srmmu_context_table;
 
-int viking_mxcc_present;
 static DEFINE_SPINLOCK(srmmu_context_spinlock);
 
-static int is_hypersparc;
-
 static int srmmu_cache_pagetables;
 
 /* these will be initialized in srmmu_nocache_calcsize() */
@@ -112,25 +97,6 @@ static inline void srmmu_ctxd_set(ctxd_t *ctxp, pgd_t *pgdp)
 	set_pte((pte_t *)ctxp, pte);
 }
 
-/*
- * Locations of MSI Registers.
- */
-#define MSI_MBUS_ARBEN	0xe0001008	/* MBus Arbiter Enable register */
-
-/*
- * Useful bits in the MSI Registers.
- */
-#define MSI_ASYNC_MODE  0x80000000	/* Operate the MSI asynchronously */
-
-static void msi_set_sync(void)
-{
-	__asm__ __volatile__ ("lda [%0] %1, %%g3\n\t"
-			      "andn %%g3, %2, %%g3\n\t"
-			      "sta %%g3, [%0] %1\n\t" : :
-			      "r" (MSI_MBUS_ARBEN),
-			      "i" (ASI_M_CTL), "r" (MSI_ASYNC_MODE) : "g3");
-}
-
 void pmd_set(pmd_t *pmdp, pte_t *ptep)
 {
 	unsigned long ptp = __nocache_pa(ptep) >> 4;
@@ -478,11 +444,7 @@ void switch_mm(struct mm_struct *old_mm, struct mm_struct *mm,
 		srmmu_ctxd_set(&srmmu_context_table[mm->context], mm->pgd);
 	}
 
-	if (sparc_cpu_model == sparc_leon)
-		leon_switch_mm();
-
-	if (is_hypersparc)
-		hyper_flush_whole_icache();
+	leon_switch_mm();
 
 	srmmu_set_context(mm->context);
 }
@@ -557,110 +519,6 @@ void srmmu_unmapiorange(unsigned long virt_addr, unsigned int len)
 	flush_tlb_all();
 }
 
-/* tsunami.S */
-extern void tsunami_flush_cache_all(void);
-extern void tsunami_flush_cache_mm(struct mm_struct *mm);
-extern void tsunami_flush_cache_range(struct vm_area_struct *vma, unsigned long start, unsigned long end);
-extern void tsunami_flush_cache_page(struct vm_area_struct *vma, unsigned long page);
-extern void tsunami_flush_page_to_ram(unsigned long page);
-extern void tsunami_flush_page_for_dma(unsigned long page);
-extern void tsunami_flush_sig_insns(struct mm_struct *mm, unsigned long insn_addr);
-extern void tsunami_flush_tlb_all(void);
-extern void tsunami_flush_tlb_mm(struct mm_struct *mm);
-extern void tsunami_flush_tlb_range(struct vm_area_struct *vma, unsigned long start, unsigned long end);
-extern void tsunami_flush_tlb_page(struct vm_area_struct *vma, unsigned long page);
-extern void tsunami_setup_blockops(void);
-
-/* swift.S */
-extern void swift_flush_cache_all(void);
-extern void swift_flush_cache_mm(struct mm_struct *mm);
-extern void swift_flush_cache_range(struct vm_area_struct *vma,
-				    unsigned long start, unsigned long end);
-extern void swift_flush_cache_page(struct vm_area_struct *vma, unsigned long page);
-extern void swift_flush_page_to_ram(unsigned long page);
-extern void swift_flush_page_for_dma(unsigned long page);
-extern void swift_flush_sig_insns(struct mm_struct *mm, unsigned long insn_addr);
-extern void swift_flush_tlb_all(void);
-extern void swift_flush_tlb_mm(struct mm_struct *mm);
-extern void swift_flush_tlb_range(struct vm_area_struct *vma,
-				  unsigned long start, unsigned long end);
-extern void swift_flush_tlb_page(struct vm_area_struct *vma, unsigned long page);
-
-#if 0  /* P3: deadwood to debug precise flushes on Swift. */
-void swift_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
-{
-	int cctx, ctx1;
-
-	page &= PAGE_MASK;
-	if ((ctx1 = vma->vm_mm->context) != -1) {
-		cctx = srmmu_get_context();
-/* Is context # ever different from current context? P3 */
-		if (cctx != ctx1) {
-			printk("flush ctx %02x curr %02x\n", ctx1, cctx);
-			srmmu_set_context(ctx1);
-			swift_flush_page(page);
-			__asm__ __volatile__("sta %%g0, [%0] %1\n\t" : :
-					"r" (page), "i" (ASI_M_FLUSH_PROBE));
-			srmmu_set_context(cctx);
-		} else {
-			 /* Rm. prot. bits from virt. c. */
-			/* swift_flush_cache_all(); */
-			/* swift_flush_cache_page(vma, page); */
-			swift_flush_page(page);
-
-			__asm__ __volatile__("sta %%g0, [%0] %1\n\t" : :
-				"r" (page), "i" (ASI_M_FLUSH_PROBE));
-			/* same as above: srmmu_flush_tlb_page() */
-		}
-	}
-}
-#endif
-
-/*
- * The following are all MBUS based SRMMU modules, and therefore could
- * be found in a multiprocessor configuration.  On the whole, these
- * chips seems to be much more touchy about DVMA and page tables
- * with respect to cache coherency.
- */
-
-/* viking.S */
-extern void viking_flush_cache_all(void);
-extern void viking_flush_cache_mm(struct mm_struct *mm);
-extern void viking_flush_cache_range(struct vm_area_struct *vma, unsigned long start,
-				     unsigned long end);
-extern void viking_flush_cache_page(struct vm_area_struct *vma, unsigned long page);
-extern void viking_flush_page_to_ram(unsigned long page);
-extern void viking_flush_page_for_dma(unsigned long page);
-extern void viking_flush_sig_insns(struct mm_struct *mm, unsigned long addr);
-extern void viking_flush_page(unsigned long page);
-extern void viking_mxcc_flush_page(unsigned long page);
-extern void viking_flush_tlb_all(void);
-extern void viking_flush_tlb_mm(struct mm_struct *mm);
-extern void viking_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
-				   unsigned long end);
-extern void viking_flush_tlb_page(struct vm_area_struct *vma,
-				  unsigned long page);
-extern void sun4dsmp_flush_tlb_all(void);
-extern void sun4dsmp_flush_tlb_mm(struct mm_struct *mm);
-extern void sun4dsmp_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
-				   unsigned long end);
-extern void sun4dsmp_flush_tlb_page(struct vm_area_struct *vma,
-				  unsigned long page);
-
-/* hypersparc.S */
-extern void hypersparc_flush_cache_all(void);
-extern void hypersparc_flush_cache_mm(struct mm_struct *mm);
-extern void hypersparc_flush_cache_range(struct vm_area_struct *vma, unsigned long start, unsigned long end);
-extern void hypersparc_flush_cache_page(struct vm_area_struct *vma, unsigned long page);
-extern void hypersparc_flush_page_to_ram(unsigned long page);
-extern void hypersparc_flush_page_for_dma(unsigned long page);
-extern void hypersparc_flush_sig_insns(struct mm_struct *mm, unsigned long insn_addr);
-extern void hypersparc_flush_tlb_all(void);
-extern void hypersparc_flush_tlb_mm(struct mm_struct *mm);
-extern void hypersparc_flush_tlb_range(struct vm_area_struct *vma, unsigned long start, unsigned long end);
-extern void hypersparc_flush_tlb_page(struct vm_area_struct *vma, unsigned long page);
-extern void hypersparc_setup_blockops(void);
-
 /*
  * NOTE: All of this startup code assumes the low 16mb (approx.) of
  *       kernel mappings are done with one single contiguous chunk of
@@ -747,18 +605,7 @@ static void __init srmmu_allocate_ptable_skeleton(unsigned long start,
 /* These flush types are not available on all chips... */
 static inline unsigned long srmmu_probe(unsigned long vaddr)
 {
-	unsigned long retval;
-
-	if (sparc_cpu_model != sparc_leon) {
-
-		vaddr &= PAGE_MASK;
-		__asm__ __volatile__("lda [%1] %2, %0\n\t" :
-				     "=r" (retval) :
-				     "r" (vaddr | 0x400), "i" (ASI_M_FLUSH_PROBE));
-	} else {
-		retval = leon_swprobe(vaddr, NULL);
-	}
-	return retval;
+	return leon_swprobe(vaddr, NULL);
 }
 
 /*
@@ -904,20 +751,16 @@ void __init srmmu_paging_init(void)
 	init_mm.context = (unsigned long) NO_CONTEXT;
 	sparc_iomap.start = SUN4M_IOBASE_VADDR;	/* 16MB of IOSPACE on all sun4m's. */
 
-	if (sparc_cpu_model == sun4d)
-		num_contexts = 65536; /* We know it is Viking */
-	else {
-		/* Find the number of contexts on the srmmu. */
-		cpunode = prom_getchild(prom_root_node);
-		num_contexts = 0;
-		while (cpunode != 0) {
-			prom_getstring(cpunode, "device_type", node_str, sizeof(node_str));
-			if (!strcmp(node_str, "cpu")) {
-				num_contexts = prom_getintdefault(cpunode, "mmu-nctx", 0x8);
-				break;
-			}
-			cpunode = prom_getsibling(cpunode);
+	/* Find the number of contexts on the srmmu. */
+	cpunode = prom_getchild(prom_root_node);
+	num_contexts = 0;
+	while (cpunode != 0) {
+		prom_getstring(cpunode, "device_type", node_str, sizeof(node_str));
+		if (!strcmp(node_str, "cpu")) {
+			num_contexts = prom_getintdefault(cpunode, "mmu-nctx", 0x8);
+			break;
 		}
+		cpunode = prom_getsibling(cpunode);
 	}
 
 	if (!num_contexts) {
@@ -1014,577 +857,6 @@ void destroy_context(struct mm_struct *mm)
 	}
 }
 
-/* Init various srmmu chip types. */
-static void __init srmmu_is_bad(void)
-{
-	prom_printf("Could not determine SRMMU chip type.\n");
-	prom_halt();
-}
-
-static void __init init_vac_layout(void)
-{
-	phandle nd;
-	int cache_lines;
-	char node_str[128];
-#ifdef CONFIG_SMP
-	int cpu = 0;
-	unsigned long max_size = 0;
-	unsigned long min_line_size = 0x10000000;
-#endif
-
-	nd = prom_getchild(prom_root_node);
-	while ((nd = prom_getsibling(nd)) != 0) {
-		prom_getstring(nd, "device_type", node_str, sizeof(node_str));
-		if (!strcmp(node_str, "cpu")) {
-			vac_line_size = prom_getint(nd, "cache-line-size");
-			if (vac_line_size == -1) {
-				prom_printf("can't determine cache-line-size, halting.\n");
-				prom_halt();
-			}
-			cache_lines = prom_getint(nd, "cache-nlines");
-			if (cache_lines == -1) {
-				prom_printf("can't determine cache-nlines, halting.\n");
-				prom_halt();
-			}
-
-			vac_cache_size = cache_lines * vac_line_size;
-#ifdef CONFIG_SMP
-			if (vac_cache_size > max_size)
-				max_size = vac_cache_size;
-			if (vac_line_size < min_line_size)
-				min_line_size = vac_line_size;
-			//FIXME: cpus not contiguous!!
-			cpu++;
-			if (cpu >= nr_cpu_ids || !cpu_online(cpu))
-				break;
-#else
-			break;
-#endif
-		}
-	}
-	if (nd == 0) {
-		prom_printf("No CPU nodes found, halting.\n");
-		prom_halt();
-	}
-#ifdef CONFIG_SMP
-	vac_cache_size = max_size;
-	vac_line_size = min_line_size;
-#endif
-	printk("SRMMU: Using VAC size of %d bytes, line size %d bytes.\n",
-	       (int)vac_cache_size, (int)vac_line_size);
-}
-
-static void poke_hypersparc(void)
-{
-	volatile unsigned long clear;
-	unsigned long mreg = srmmu_get_mmureg();
-
-	hyper_flush_unconditional_combined();
-
-	mreg &= ~(HYPERSPARC_CWENABLE);
-	mreg |= (HYPERSPARC_CENABLE | HYPERSPARC_WBENABLE);
-	mreg |= (HYPERSPARC_CMODE);
-
-	srmmu_set_mmureg(mreg);
-
-#if 0 /* XXX I think this is bad news... -DaveM */
-	hyper_clear_all_tags();
-#endif
-
-	put_ross_icr(HYPERSPARC_ICCR_FTD | HYPERSPARC_ICCR_ICE);
-	hyper_flush_whole_icache();
-	clear = srmmu_get_faddr();
-	clear = srmmu_get_fstatus();
-}
-
-static const struct sparc32_cachetlb_ops hypersparc_ops = {
-	.cache_all	= hypersparc_flush_cache_all,
-	.cache_mm	= hypersparc_flush_cache_mm,
-	.cache_page	= hypersparc_flush_cache_page,
-	.cache_range	= hypersparc_flush_cache_range,
-	.tlb_all	= hypersparc_flush_tlb_all,
-	.tlb_mm		= hypersparc_flush_tlb_mm,
-	.tlb_page	= hypersparc_flush_tlb_page,
-	.tlb_range	= hypersparc_flush_tlb_range,
-	.page_to_ram	= hypersparc_flush_page_to_ram,
-	.sig_insns	= hypersparc_flush_sig_insns,
-	.page_for_dma	= hypersparc_flush_page_for_dma,
-};
-
-static void __init init_hypersparc(void)
-{
-	srmmu_name = "ROSS HyperSparc";
-
-	init_vac_layout();
-
-	is_hypersparc = 1;
-	sparc32_cachetlb_ops = &hypersparc_ops;
-
-	poke_srmmu = poke_hypersparc;
-
-	hypersparc_setup_blockops();
-}
-
-static void poke_swift(void)
-{
-	unsigned long mreg;
-
-	/* Clear any crap from the cache or else... */
-	swift_flush_cache_all();
-
-	/* Enable I & D caches */
-	mreg = srmmu_get_mmureg();
-	mreg |= (SWIFT_IE | SWIFT_DE);
-	/*
-	 * The Swift branch folding logic is completely broken.  At
-	 * trap time, if things are just right, if can mistakenly
-	 * think that a trap is coming from kernel mode when in fact
-	 * it is coming from user mode (it mis-executes the branch in
-	 * the trap code).  So you see things like crashme completely
-	 * hosing your machine which is completely unacceptable.  Turn
-	 * this shit off... nice job Fujitsu.
-	 */
-	mreg &= ~(SWIFT_BF);
-	srmmu_set_mmureg(mreg);
-}
-
-static const struct sparc32_cachetlb_ops swift_ops = {
-	.cache_all	= swift_flush_cache_all,
-	.cache_mm	= swift_flush_cache_mm,
-	.cache_page	= swift_flush_cache_page,
-	.cache_range	= swift_flush_cache_range,
-	.tlb_all	= swift_flush_tlb_all,
-	.tlb_mm		= swift_flush_tlb_mm,
-	.tlb_page	= swift_flush_tlb_page,
-	.tlb_range	= swift_flush_tlb_range,
-	.page_to_ram	= swift_flush_page_to_ram,
-	.sig_insns	= swift_flush_sig_insns,
-	.page_for_dma	= swift_flush_page_for_dma,
-};
-
-#define SWIFT_MASKID_ADDR  0x10003018
-static void __init init_swift(void)
-{
-	unsigned long swift_rev;
-
-	__asm__ __volatile__("lda [%1] %2, %0\n\t"
-			     "srl %0, 0x18, %0\n\t" :
-			     "=r" (swift_rev) :
-			     "r" (SWIFT_MASKID_ADDR), "i" (ASI_M_BYPASS));
-	srmmu_name = "Fujitsu Swift";
-
-	sparc32_cachetlb_ops = &swift_ops;
-	flush_page_for_dma_global = 0;
-
-	/*
-	 * Are you now convinced that the Swift is one of the
-	 * biggest VLSI abortions of all time?  Bravo Fujitsu!
-	 * Fujitsu, the !#?!%$'d up processor people.  I bet if
-	 * you examined the microcode of the Swift you'd find
-	 * XXX's all over the place.
-	 */
-	poke_srmmu = poke_swift;
-}
-
-static void turbosparc_flush_cache_all(void)
-{
-	flush_user_windows();
-	turbosparc_idflash_clear();
-}
-
-static void turbosparc_flush_cache_mm(struct mm_struct *mm)
-{
-	FLUSH_BEGIN(mm)
-	flush_user_windows();
-	turbosparc_idflash_clear();
-	FLUSH_END
-}
-
-static void turbosparc_flush_cache_range(struct vm_area_struct *vma, unsigned long start, unsigned long end)
-{
-	FLUSH_BEGIN(vma->vm_mm)
-	flush_user_windows();
-	turbosparc_idflash_clear();
-	FLUSH_END
-}
-
-static void turbosparc_flush_cache_page(struct vm_area_struct *vma, unsigned long page)
-{
-	FLUSH_BEGIN(vma->vm_mm)
-	flush_user_windows();
-	if (vma->vm_flags & VM_EXEC)
-		turbosparc_flush_icache();
-	turbosparc_flush_dcache();
-	FLUSH_END
-}
-
-/* TurboSparc is copy-back, if we turn it on, but this does not work. */
-static void turbosparc_flush_page_to_ram(unsigned long page)
-{
-#ifdef TURBOSPARC_WRITEBACK
-	volatile unsigned long clear;
-
-	if (srmmu_probe(page))
-		turbosparc_flush_page_cache(page);
-	clear = srmmu_get_fstatus();
-#endif
-}
-
-static void turbosparc_flush_sig_insns(struct mm_struct *mm, unsigned long insn_addr)
-{
-}
-
-static void turbosparc_flush_page_for_dma(unsigned long page)
-{
-	turbosparc_flush_dcache();
-}
-
-static void turbosparc_flush_tlb_all(void)
-{
-	srmmu_flush_whole_tlb();
-}
-
-static void turbosparc_flush_tlb_mm(struct mm_struct *mm)
-{
-	FLUSH_BEGIN(mm)
-	srmmu_flush_whole_tlb();
-	FLUSH_END
-}
-
-static void turbosparc_flush_tlb_range(struct vm_area_struct *vma, unsigned long start, unsigned long end)
-{
-	FLUSH_BEGIN(vma->vm_mm)
-	srmmu_flush_whole_tlb();
-	FLUSH_END
-}
-
-static void turbosparc_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
-{
-	FLUSH_BEGIN(vma->vm_mm)
-	srmmu_flush_whole_tlb();
-	FLUSH_END
-}
-
-
-static void poke_turbosparc(void)
-{
-	unsigned long mreg = srmmu_get_mmureg();
-	unsigned long ccreg;
-
-	/* Clear any crap from the cache or else... */
-	turbosparc_flush_cache_all();
-	/* Temporarily disable I & D caches */
-	mreg &= ~(TURBOSPARC_ICENABLE | TURBOSPARC_DCENABLE);
-	mreg &= ~(TURBOSPARC_PCENABLE);		/* Don't check parity */
-	srmmu_set_mmureg(mreg);
-
-	ccreg = turbosparc_get_ccreg();
-
-#ifdef TURBOSPARC_WRITEBACK
-	ccreg |= (TURBOSPARC_SNENABLE);		/* Do DVMA snooping in Dcache */
-	ccreg &= ~(TURBOSPARC_uS2 | TURBOSPARC_WTENABLE);
-			/* Write-back D-cache, emulate VLSI
-			 * abortion number three, not number one */
-#else
-	/* For now let's play safe, optimize later */
-	ccreg |= (TURBOSPARC_SNENABLE | TURBOSPARC_WTENABLE);
-			/* Do DVMA snooping in Dcache, Write-thru D-cache */
-	ccreg &= ~(TURBOSPARC_uS2);
-			/* Emulate VLSI abortion number three, not number one */
-#endif
-
-	switch (ccreg & 7) {
-	case 0: /* No SE cache */
-	case 7: /* Test mode */
-		break;
-	default:
-		ccreg |= (TURBOSPARC_SCENABLE);
-	}
-	turbosparc_set_ccreg(ccreg);
-
-	mreg |= (TURBOSPARC_ICENABLE | TURBOSPARC_DCENABLE); /* I & D caches on */
-	mreg |= (TURBOSPARC_ICSNOOP);		/* Icache snooping on */
-	srmmu_set_mmureg(mreg);
-}
-
-static const struct sparc32_cachetlb_ops turbosparc_ops = {
-	.cache_all	= turbosparc_flush_cache_all,
-	.cache_mm	= turbosparc_flush_cache_mm,
-	.cache_page	= turbosparc_flush_cache_page,
-	.cache_range	= turbosparc_flush_cache_range,
-	.tlb_all	= turbosparc_flush_tlb_all,
-	.tlb_mm		= turbosparc_flush_tlb_mm,
-	.tlb_page	= turbosparc_flush_tlb_page,
-	.tlb_range	= turbosparc_flush_tlb_range,
-	.page_to_ram	= turbosparc_flush_page_to_ram,
-	.sig_insns	= turbosparc_flush_sig_insns,
-	.page_for_dma	= turbosparc_flush_page_for_dma,
-};
-
-static void __init init_turbosparc(void)
-{
-	srmmu_name = "Fujitsu TurboSparc";
-	sparc32_cachetlb_ops = &turbosparc_ops;
-	poke_srmmu = poke_turbosparc;
-}
-
-static void poke_tsunami(void)
-{
-	unsigned long mreg = srmmu_get_mmureg();
-
-	tsunami_flush_icache();
-	tsunami_flush_dcache();
-	mreg &= ~TSUNAMI_ITD;
-	mreg |= (TSUNAMI_IENAB | TSUNAMI_DENAB);
-	srmmu_set_mmureg(mreg);
-}
-
-static const struct sparc32_cachetlb_ops tsunami_ops = {
-	.cache_all	= tsunami_flush_cache_all,
-	.cache_mm	= tsunami_flush_cache_mm,
-	.cache_page	= tsunami_flush_cache_page,
-	.cache_range	= tsunami_flush_cache_range,
-	.tlb_all	= tsunami_flush_tlb_all,
-	.tlb_mm		= tsunami_flush_tlb_mm,
-	.tlb_page	= tsunami_flush_tlb_page,
-	.tlb_range	= tsunami_flush_tlb_range,
-	.page_to_ram	= tsunami_flush_page_to_ram,
-	.sig_insns	= tsunami_flush_sig_insns,
-	.page_for_dma	= tsunami_flush_page_for_dma,
-};
-
-static void __init init_tsunami(void)
-{
-	/*
-	 * Tsunami's pretty sane, Sun and TI actually got it
-	 * somewhat right this time.  Fujitsu should have
-	 * taken some lessons from them.
-	 */
-
-	srmmu_name = "TI Tsunami";
-	sparc32_cachetlb_ops = &tsunami_ops;
-	poke_srmmu = poke_tsunami;
-
-	tsunami_setup_blockops();
-}
-
-static void poke_viking(void)
-{
-	unsigned long mreg = srmmu_get_mmureg();
-	static int smp_catch;
-
-	if (viking_mxcc_present) {
-		unsigned long mxcc_control = mxcc_get_creg();
-
-		mxcc_control |= (MXCC_CTL_ECE | MXCC_CTL_PRE | MXCC_CTL_MCE);
-		mxcc_control &= ~(MXCC_CTL_RRC);
-		mxcc_set_creg(mxcc_control);
-
-		/*
-		 * We don't need memory parity checks.
-		 * XXX This is a mess, have to dig out later. ecd.
-		viking_mxcc_turn_off_parity(&mreg, &mxcc_control);
-		 */
-
-		/* We do cache ptables on MXCC. */
-		mreg |= VIKING_TCENABLE;
-	} else {
-		unsigned long bpreg;
-
-		mreg &= ~(VIKING_TCENABLE);
-		if (smp_catch++) {
-			/* Must disable mixed-cmd mode here for other cpu's. */
-			bpreg = viking_get_bpreg();
-			bpreg &= ~(VIKING_ACTION_MIX);
-			viking_set_bpreg(bpreg);
-
-			/* Just in case PROM does something funny. */
-			msi_set_sync();
-		}
-	}
-
-	mreg |= VIKING_SPENABLE;
-	mreg |= (VIKING_ICENABLE | VIKING_DCENABLE);
-	mreg |= VIKING_SBENABLE;
-	mreg &= ~(VIKING_ACENABLE);
-	srmmu_set_mmureg(mreg);
-}
-
-static struct sparc32_cachetlb_ops viking_ops __ro_after_init = {
-	.cache_all	= viking_flush_cache_all,
-	.cache_mm	= viking_flush_cache_mm,
-	.cache_page	= viking_flush_cache_page,
-	.cache_range	= viking_flush_cache_range,
-	.tlb_all	= viking_flush_tlb_all,
-	.tlb_mm		= viking_flush_tlb_mm,
-	.tlb_page	= viking_flush_tlb_page,
-	.tlb_range	= viking_flush_tlb_range,
-	.page_to_ram	= viking_flush_page_to_ram,
-	.sig_insns	= viking_flush_sig_insns,
-	.page_for_dma	= viking_flush_page_for_dma,
-};
-
-#ifdef CONFIG_SMP
-/* On sun4d the cpu broadcasts local TLB flushes, so we can just
- * perform the local TLB flush and all the other cpus will see it.
- * But, unfortunately, there is a bug in the sun4d XBUS backplane
- * that requires that we add some synchronization to these flushes.
- *
- * The bug is that the fifo which keeps track of all the pending TLB
- * broadcasts in the system is an entry or two too small, so if we
- * have too many going at once we'll overflow that fifo and lose a TLB
- * flush resulting in corruption.
- *
- * Our workaround is to take a global spinlock around the TLB flushes,
- * which guarentees we won't ever have too many pending.  It's a big
- * hammer, but a semaphore like system to make sure we only have N TLB
- * flushes going at once will require SMP locking anyways so there's
- * no real value in trying any harder than this.
- */
-static struct sparc32_cachetlb_ops viking_sun4d_smp_ops __ro_after_init = {
-	.cache_all	= viking_flush_cache_all,
-	.cache_mm	= viking_flush_cache_mm,
-	.cache_page	= viking_flush_cache_page,
-	.cache_range	= viking_flush_cache_range,
-	.tlb_all	= sun4dsmp_flush_tlb_all,
-	.tlb_mm		= sun4dsmp_flush_tlb_mm,
-	.tlb_page	= sun4dsmp_flush_tlb_page,
-	.tlb_range	= sun4dsmp_flush_tlb_range,
-	.page_to_ram	= viking_flush_page_to_ram,
-	.sig_insns	= viking_flush_sig_insns,
-	.page_for_dma	= viking_flush_page_for_dma,
-};
-#endif
-
-static void __init init_viking(void)
-{
-	unsigned long mreg = srmmu_get_mmureg();
-
-	/* Ahhh, the viking.  SRMMU VLSI abortion number two... */
-	if (mreg & VIKING_MMODE) {
-		srmmu_name = "TI Viking";
-		viking_mxcc_present = 0;
-		msi_set_sync();
-
-		/*
-		 * We need this to make sure old viking takes no hits
-		 * on it's cache for dma snoops to workaround the
-		 * "load from non-cacheable memory" interrupt bug.
-		 * This is only necessary because of the new way in
-		 * which we use the IOMMU.
-		 */
-		viking_ops.page_for_dma = viking_flush_page;
-#ifdef CONFIG_SMP
-		viking_sun4d_smp_ops.page_for_dma = viking_flush_page;
-#endif
-		flush_page_for_dma_global = 0;
-	} else {
-		srmmu_name = "TI Viking/MXCC";
-		viking_mxcc_present = 1;
-		srmmu_cache_pagetables = 1;
-	}
-
-	sparc32_cachetlb_ops = (const struct sparc32_cachetlb_ops *)
-		&viking_ops;
-#ifdef CONFIG_SMP
-	if (sparc_cpu_model == sun4d)
-		sparc32_cachetlb_ops = (const struct sparc32_cachetlb_ops *)
-			&viking_sun4d_smp_ops;
-#endif
-
-	poke_srmmu = poke_viking;
-}
-
-/* Probe for the srmmu chip version. */
-static void __init get_srmmu_type(void)
-{
-	unsigned long mreg, psr;
-	unsigned long mod_typ, mod_rev, psr_typ, psr_vers;
-
-	mreg = srmmu_get_mmureg(); psr = get_psr();
-	mod_typ = (mreg & 0xf0000000) >> 28;
-	mod_rev = (mreg & 0x0f000000) >> 24;
-	psr_typ = (psr >> 28) & 0xf;
-	psr_vers = (psr >> 24) & 0xf;
-
-	/* First, check for sparc-leon. */
-	if (sparc_cpu_model == sparc_leon) {
-		init_leon();
-		return;
-	}
-
-	/* Second, check for HyperSparc or Cypress. */
-	if (mod_typ == 1) {
-		switch (mod_rev) {
-		case 7:
-			/* UP or MP Hypersparc */
-			init_hypersparc();
-			break;
-		case 0:
-		case 2:
-		case 10:
-		case 11:
-		case 12:
-		case 13:
-		case 14:
-		case 15:
-		default:
-			prom_printf("Sparc-Linux Cypress support does not longer exit.\n");
-			prom_halt();
-			break;
-		}
-		return;
-	}
-
-	/* Now Fujitsu TurboSparc. It might happen that it is
-	 * in Swift emulation mode, so we will check later...
-	 */
-	if (psr_typ == 0 && psr_vers == 5) {
-		init_turbosparc();
-		return;
-	}
-
-	/* Next check for Fujitsu Swift. */
-	if (psr_typ == 0 && psr_vers == 4) {
-		phandle cpunode;
-		char node_str[128];
-
-		/* Look if it is not a TurboSparc emulating Swift... */
-		cpunode = prom_getchild(prom_root_node);
-		while ((cpunode = prom_getsibling(cpunode)) != 0) {
-			prom_getstring(cpunode, "device_type", node_str, sizeof(node_str));
-			if (!strcmp(node_str, "cpu")) {
-				if (!prom_getintdefault(cpunode, "psr-implementation", 1) &&
-				    prom_getintdefault(cpunode, "psr-version", 1) == 5) {
-					init_turbosparc();
-					return;
-				}
-				break;
-			}
-		}
-
-		init_swift();
-		return;
-	}
-
-	/* Now the Viking family of srmmu. */
-	if (psr_typ == 4 &&
-	   ((psr_vers == 0) ||
-	    ((psr_vers == 1) && (mod_typ == 0) && (mod_rev == 0)))) {
-		init_viking();
-		return;
-	}
-
-	/* Finally the Tsunami. */
-	if (psr_typ == 4 && psr_vers == 1 && (mod_typ || mod_rev)) {
-		init_tsunami();
-		return;
-	}
-
-	/* Oh well */
-	srmmu_is_bad();
-}
-
 #ifdef CONFIG_SMP
 /* Local cross-calls. */
 static void smp_flush_page_for_dma(unsigned long page)
@@ -1734,34 +1006,20 @@ static struct sparc32_cachetlb_ops smp_cachetlb_ops __ro_after_init = {
 };
 #endif
 
-/* Load up routines and constants for sun4m and sun4d mmu */
+/* Load up routines and constants for mmu */
 void __init load_mmu(void)
 {
 	/* Functions */
-	get_srmmu_type();
+	init_leon();
 
 #ifdef CONFIG_SMP
 	/* El switcheroo... */
 	local_ops = sparc32_cachetlb_ops;
 
-	if (sparc_cpu_model == sun4d || sparc_cpu_model == sparc_leon) {
-		smp_cachetlb_ops.tlb_all = local_ops->tlb_all;
-		smp_cachetlb_ops.tlb_mm = local_ops->tlb_mm;
-		smp_cachetlb_ops.tlb_range = local_ops->tlb_range;
-		smp_cachetlb_ops.tlb_page = local_ops->tlb_page;
-	}
-
-	if (poke_srmmu == poke_viking) {
-		/* Avoid unnecessary cross calls. */
-		smp_cachetlb_ops.cache_all = local_ops->cache_all;
-		smp_cachetlb_ops.cache_mm = local_ops->cache_mm;
-		smp_cachetlb_ops.cache_range = local_ops->cache_range;
-		smp_cachetlb_ops.cache_page = local_ops->cache_page;
-
-		smp_cachetlb_ops.page_to_ram = local_ops->page_to_ram;
-		smp_cachetlb_ops.sig_insns = local_ops->sig_insns;
-		smp_cachetlb_ops.page_for_dma = local_ops->page_for_dma;
-	}
+	smp_cachetlb_ops.tlb_all = local_ops->tlb_all;
+	smp_cachetlb_ops.tlb_mm = local_ops->tlb_mm;
+	smp_cachetlb_ops.tlb_range = local_ops->tlb_range;
+	smp_cachetlb_ops.tlb_page = local_ops->tlb_page;
 
 	/* It really is const after this point. */
 	sparc32_cachetlb_ops = (const struct sparc32_cachetlb_ops *)
diff --git a/arch/sparc/mm/swift.S b/arch/sparc/mm/swift.S
deleted file mode 100644
index f414bfd8d899..000000000000
--- a/arch/sparc/mm/swift.S
+++ /dev/null
@@ -1,256 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * swift.S: MicroSparc-II mmu/cache operations.
- *
- * Copyright (C) 1999 David S. Miller (davem@redhat.com)
- */
-
-#include <asm/psr.h>
-#include <asm/asi.h>
-#include <asm/page.h>
-#include <asm/pgtsrmmu.h>
-#include <asm/asm-offsets.h>
-
-	.text
-	.align	4
-
-#if 1	/* XXX screw this, I can't get the VAC flushes working
-	 * XXX reliably... -DaveM
-	 */
-	.globl	swift_flush_cache_all, swift_flush_cache_mm
-	.globl	swift_flush_cache_range, swift_flush_cache_page
-	.globl	swift_flush_page_for_dma
-	.globl	swift_flush_page_to_ram
-
-swift_flush_cache_all:
-swift_flush_cache_mm:
-swift_flush_cache_range:
-swift_flush_cache_page:
-swift_flush_page_for_dma:
-swift_flush_page_to_ram:
-	sethi	%hi(0x2000), %o0
-1:	subcc	%o0, 0x10, %o0
-	add	%o0, %o0, %o1
-	sta	%g0, [%o0] ASI_M_DATAC_TAG
-	bne	1b
-	 sta	%g0, [%o1] ASI_M_TXTC_TAG
-	retl
-	 nop
-#else
-
-	.globl	swift_flush_cache_all
-swift_flush_cache_all:
-	WINDOW_FLUSH(%g4, %g5)
-
-	/* Just clear out all the tags. */
-	sethi	%hi(16 * 1024), %o0
-1:	subcc	%o0, 16, %o0
-	sta	%g0, [%o0] ASI_M_TXTC_TAG
-	bne	1b
-	 sta	%g0, [%o0] ASI_M_DATAC_TAG
-	retl
-	 nop
-
-	.globl	swift_flush_cache_mm
-swift_flush_cache_mm:
-	ld	[%o0 + AOFF_mm_context], %g2
-	cmp	%g2, -1
-	be	swift_flush_cache_mm_out
-	WINDOW_FLUSH(%g4, %g5)
-	rd	%psr, %g1
-	andn	%g1, PSR_ET, %g3
-	wr	%g3, 0x0, %psr
-	nop
-	nop
-	mov	SRMMU_CTX_REG, %g7
-	lda	[%g7] ASI_M_MMUREGS, %g5
-	sta	%g2, [%g7] ASI_M_MMUREGS
-
-#if 1
-	sethi	%hi(0x2000), %o0
-1:	subcc	%o0, 0x10, %o0
-	sta	%g0, [%o0] ASI_M_FLUSH_CTX
-	bne	1b
-	 nop
-#else
-	clr	%o0
-	or	%g0, 2048, %g7
-	or	%g0, 2048, %o1
-	add	%o1, 2048, %o2
-	add	%o2, 2048, %o3
-	mov	16, %o4
-	add	%o4, 2048, %o5
-	add	%o5, 2048, %g2
-	add	%g2, 2048, %g3
-1:	sta	%g0, [%o0      ] ASI_M_FLUSH_CTX
-	sta	%g0, [%o0 + %o1] ASI_M_FLUSH_CTX
-	sta	%g0, [%o0 + %o2] ASI_M_FLUSH_CTX
-	sta	%g0, [%o0 + %o3] ASI_M_FLUSH_CTX
-	sta	%g0, [%o0 + %o4] ASI_M_FLUSH_CTX
-	sta	%g0, [%o0 + %o5] ASI_M_FLUSH_CTX
-	sta	%g0, [%o0 + %g2] ASI_M_FLUSH_CTX
-	sta	%g0, [%o0 + %g3] ASI_M_FLUSH_CTX
-	subcc	%g7, 32, %g7
-	bne	1b
-	 add	%o0, 32, %o0
-#endif
-
-	mov	SRMMU_CTX_REG, %g7
-	sta	%g5, [%g7] ASI_M_MMUREGS
-	wr	%g1, 0x0, %psr
-	nop
-	nop
-swift_flush_cache_mm_out:
-	retl
-	 nop
-
-	.globl	swift_flush_cache_range
-swift_flush_cache_range:
-	ld	[%o0 + VMA_VM_MM], %o0
-	sub	%o2, %o1, %o2
-	sethi	%hi(4096), %o3
-	cmp	%o2, %o3
-	bgu	swift_flush_cache_mm
-	 nop
-	b	70f
-	 nop
-
-	.globl	swift_flush_cache_page
-swift_flush_cache_page:
-	ld	[%o0 + VMA_VM_MM], %o0
-70:
-	ld	[%o0 + AOFF_mm_context], %g2
-	cmp	%g2, -1
-	be	swift_flush_cache_page_out
-	WINDOW_FLUSH(%g4, %g5)
-	rd	%psr, %g1
-	andn	%g1, PSR_ET, %g3
-	wr	%g3, 0x0, %psr
-	nop
-	nop
-	mov	SRMMU_CTX_REG, %g7
-	lda	[%g7] ASI_M_MMUREGS, %g5
-	sta	%g2, [%g7] ASI_M_MMUREGS
-
-	andn	%o1, (PAGE_SIZE - 1), %o1
-#if 1
-	sethi	%hi(0x1000), %o0
-1:	subcc	%o0, 0x10, %o0
-	sta	%g0, [%o1 + %o0] ASI_M_FLUSH_PAGE
-	bne	1b
-	 nop
-#else
-	or	%g0, 512, %g7
-	or	%g0, 512, %o0
-	add	%o0, 512, %o2
-	add	%o2, 512, %o3
-	add	%o3, 512, %o4
-	add	%o4, 512, %o5
-	add	%o5, 512, %g3
-	add	%g3, 512, %g4
-1:	sta	%g0, [%o1      ] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o0] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o2] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o3] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o4] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o5] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %g3] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %g4] ASI_M_FLUSH_PAGE
-	subcc	%g7, 16, %g7
-	bne	1b
-	 add	%o1, 16, %o1
-#endif
-
-	mov	SRMMU_CTX_REG, %g7
-	sta	%g5, [%g7] ASI_M_MMUREGS
-	wr	%g1, 0x0, %psr
-	nop
-	nop
-swift_flush_cache_page_out:
-	retl
-	 nop
-
-	/* Swift is write-thru, however it is not
-	 * I/O nor TLB-walk coherent.  Also it has
-	 * caches which are virtually indexed and tagged.
-	 */
-	.globl	swift_flush_page_for_dma
-	.globl	swift_flush_page_to_ram
-swift_flush_page_for_dma:
-swift_flush_page_to_ram:
-	andn	%o0, (PAGE_SIZE - 1), %o1
-#if 1
-	sethi	%hi(0x1000), %o0
-1:	subcc	%o0, 0x10, %o0
-	sta	%g0, [%o1 + %o0] ASI_M_FLUSH_PAGE
-	bne	1b
-	 nop
-#else
-	or	%g0, 512, %g7
-	or	%g0, 512, %o0
-	add	%o0, 512, %o2
-	add	%o2, 512, %o3
-	add	%o3, 512, %o4
-	add	%o4, 512, %o5
-	add	%o5, 512, %g3
-	add	%g3, 512, %g4
-1:	sta	%g0, [%o1      ] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o0] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o2] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o3] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o4] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %o5] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %g3] ASI_M_FLUSH_PAGE
-	sta	%g0, [%o1 + %g4] ASI_M_FLUSH_PAGE
-	subcc	%g7, 16, %g7
-	bne	1b
-	 add	%o1, 16, %o1
-#endif
-	retl
-	 nop
-#endif
-
-	.globl	swift_flush_sig_insns
-swift_flush_sig_insns:
-	flush	%o1
-	retl
-	 flush	%o1 + 4
-
-	.globl	swift_flush_tlb_mm
-	.globl	swift_flush_tlb_range
-	.globl	swift_flush_tlb_all
-swift_flush_tlb_range:
-	ld	[%o0 + VMA_VM_MM], %o0
-swift_flush_tlb_mm:
-	ld	[%o0 + AOFF_mm_context], %g2
-	cmp	%g2, -1
-	be	swift_flush_tlb_all_out
-swift_flush_tlb_all:
-	mov	0x400, %o1
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-swift_flush_tlb_all_out:
-	retl
-	 nop
-
-	.globl	swift_flush_tlb_page
-swift_flush_tlb_page:
-	ld	[%o0 + VMA_VM_MM], %o0
-	mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + AOFF_mm_context], %o3
-	andn	%o1, (PAGE_SIZE - 1), %o1
-	cmp	%o3, -1
-	be	swift_flush_tlb_page_out
-	 nop
-#if 1
-	mov	0x400, %o1
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE	
-#else
-	lda	[%g1] ASI_M_MMUREGS, %g5
-	sta	%o3, [%g1] ASI_M_MMUREGS
-	sta	%g0, [%o1] ASI_M_FLUSH_PAGE	/* rem. virt. cache. prot. */
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-	sta	%g5, [%g1] ASI_M_MMUREGS
-#endif
-swift_flush_tlb_page_out:
-	retl
-	 nop
diff --git a/arch/sparc/mm/tsunami.S b/arch/sparc/mm/tsunami.S
deleted file mode 100644
index 62b742df65dc..000000000000
--- a/arch/sparc/mm/tsunami.S
+++ /dev/null
@@ -1,132 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * tsunami.S: High speed MicroSparc-I mmu/cache operations.
- *
- * Copyright (C) 1997 David S. Miller (davem@caip.rutgers.edu)
- */
-
-#include <asm/ptrace.h>
-#include <asm/asm-offsets.h>
-#include <asm/psr.h>
-#include <asm/asi.h>
-#include <asm/page.h>
-#include <asm/pgtsrmmu.h>
-
-	.text
-	.align	4
-
-	.globl	tsunami_flush_cache_all, tsunami_flush_cache_mm
-	.globl	tsunami_flush_cache_range, tsunami_flush_cache_page
-	.globl	tsunami_flush_page_to_ram, tsunami_flush_page_for_dma
-	.globl	tsunami_flush_sig_insns
-	.globl	tsunami_flush_tlb_all, tsunami_flush_tlb_mm
-	.globl	tsunami_flush_tlb_range, tsunami_flush_tlb_page
-
-	/* Sliiick... */
-tsunami_flush_cache_page:
-tsunami_flush_cache_range:
-	ld	[%o0 + VMA_VM_MM], %o0
-tsunami_flush_cache_mm:
-	ld	[%o0 + AOFF_mm_context], %g2
-	cmp	%g2, -1
-	be	tsunami_flush_cache_out
-tsunami_flush_cache_all:
-	WINDOW_FLUSH(%g4, %g5)
-tsunami_flush_page_for_dma:
-	sta	%g0, [%g0] ASI_M_IC_FLCLEAR
-	sta	%g0, [%g0] ASI_M_DC_FLCLEAR
-tsunami_flush_cache_out:
-tsunami_flush_page_to_ram:
-	retl
-	 nop
-
-tsunami_flush_sig_insns:
-	flush	%o1
-	retl
-	 flush	%o1 + 4
-
-	/* More slick stuff... */
-tsunami_flush_tlb_range:
-	ld	[%o0 + VMA_VM_MM], %o0
-tsunami_flush_tlb_mm:
-	ld	[%o0 + AOFF_mm_context], %g2
-	cmp	%g2, -1
-	be	tsunami_flush_tlb_out
-tsunami_flush_tlb_all:
-	 mov	0x400, %o1
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-	nop
-	nop
-	nop
-	nop
-	nop
-tsunami_flush_tlb_out:
-	retl
-	 nop
-
-	/* This one can be done in a fine grained manner... */
-tsunami_flush_tlb_page:
-	ld	[%o0 + VMA_VM_MM], %o0
-	mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + AOFF_mm_context], %o3
-	andn	%o1, (PAGE_SIZE - 1), %o1
-	cmp	%o3, -1
-	be	tsunami_flush_tlb_page_out
-	 lda	[%g1] ASI_M_MMUREGS, %g5
-	sta	%o3, [%g1] ASI_M_MMUREGS
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-	nop
-	nop
-	nop
-	nop
-	nop
-tsunami_flush_tlb_page_out:
-	retl
-	 sta	%g5, [%g1] ASI_M_MMUREGS
-
-#define MIRROR_BLOCK(dst, src, offset, t0, t1, t2, t3) \
-	ldd	[src + offset + 0x18], t0; \
-	std	t0, [dst + offset + 0x18]; \
-	ldd	[src + offset + 0x10], t2; \
-	std	t2, [dst + offset + 0x10]; \
-	ldd	[src + offset + 0x08], t0; \
-	std	t0, [dst + offset + 0x08]; \
-	ldd	[src + offset + 0x00], t2; \
-	std	t2, [dst + offset + 0x00];
-
-tsunami_copy_1page:
-/* NOTE: This routine has to be shorter than 70insns --jj */
-	or	%g0, (PAGE_SIZE >> 8), %g1
-1:
-	MIRROR_BLOCK(%o0, %o1, 0x00, %o2, %o3, %o4, %o5)
-	MIRROR_BLOCK(%o0, %o1, 0x20, %o2, %o3, %o4, %o5)
-	MIRROR_BLOCK(%o0, %o1, 0x40, %o2, %o3, %o4, %o5)
-	MIRROR_BLOCK(%o0, %o1, 0x60, %o2, %o3, %o4, %o5)
-	MIRROR_BLOCK(%o0, %o1, 0x80, %o2, %o3, %o4, %o5)
-	MIRROR_BLOCK(%o0, %o1, 0xa0, %o2, %o3, %o4, %o5)
-	MIRROR_BLOCK(%o0, %o1, 0xc0, %o2, %o3, %o4, %o5)
-	MIRROR_BLOCK(%o0, %o1, 0xe0, %o2, %o3, %o4, %o5)
-	subcc	%g1, 1, %g1
-	add	%o0, 0x100, %o0
-	bne	1b
-	 add	%o1, 0x100, %o1
-
-	.globl	tsunami_setup_blockops
-tsunami_setup_blockops:
-	sethi	%hi(__copy_1page), %o0
-	or	%o0, %lo(__copy_1page), %o0
-	sethi	%hi(tsunami_copy_1page), %o1
-	or	%o1, %lo(tsunami_copy_1page), %o1
-	sethi	%hi(tsunami_setup_blockops), %o2
-	or	%o2, %lo(tsunami_setup_blockops), %o2
-	ld	[%o1], %o4
-1:	add	%o1, 4, %o1
-	st	%o4, [%o0]
-	add	%o0, 4, %o0
-	cmp	%o1, %o2
-	bne	1b
-	ld	[%o1], %o4
-	sta	%g0, [%g0] ASI_M_IC_FLCLEAR
-	sta	%g0, [%g0] ASI_M_DC_FLCLEAR
-	retl
-	 nop
diff --git a/arch/sparc/mm/viking.S b/arch/sparc/mm/viking.S
deleted file mode 100644
index 48f062de7a7f..000000000000
--- a/arch/sparc/mm/viking.S
+++ /dev/null
@@ -1,284 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * viking.S: High speed Viking cache/mmu operations
- *
- * Copyright (C) 1997  Eddie C. Dost  (ecd@skynet.be)
- * Copyright (C) 1997,1998,1999  Jakub Jelinek  (jj@ultra.linux.cz)
- * Copyright (C) 1999  Pavel Semerad  (semerad@ss1000.ms.mff.cuni.cz)
- */
-
-#include <asm/ptrace.h>
-#include <asm/psr.h>
-#include <asm/asm-offsets.h>
-#include <asm/asi.h>
-#include <asm/mxcc.h>
-#include <asm/page.h>
-#include <asm/pgtable.h>
-#include <asm/pgtsrmmu.h>
-#include <asm/viking.h>
-
-#ifdef CONFIG_SMP
-	.data
-	.align	4
-sun4dsmp_flush_tlb_spin:
-	.word	0
-#endif
-
-	.text
-	.align	4
-
-	.globl	viking_flush_cache_all, viking_flush_cache_mm
-	.globl	viking_flush_cache_range, viking_flush_cache_page
-	.globl	viking_flush_page, viking_mxcc_flush_page
-	.globl	viking_flush_page_for_dma, viking_flush_page_to_ram
-	.globl	viking_flush_sig_insns
-	.globl	viking_flush_tlb_all, viking_flush_tlb_mm
-	.globl	viking_flush_tlb_range, viking_flush_tlb_page
-
-viking_flush_page:
-	sethi	%hi(PAGE_OFFSET), %g2
-	sub	%o0, %g2, %g3
-	srl	%g3, 12, %g1		! ppage >> 12
-
-	clr	%o1			! set counter, 0 - 127
-	sethi	%hi(PAGE_OFFSET + PAGE_SIZE - 0x80000000), %o3
-	sethi	%hi(0x80000000), %o4
-	sethi	%hi(VIKING_PTAG_VALID), %o5
-	sethi	%hi(2*PAGE_SIZE), %o0
-	sethi	%hi(PAGE_SIZE), %g7
-	clr	%o2			! block counter, 0 - 3
-5:
-	sll	%o1, 5, %g4
-	or	%g4, %o4, %g4		! 0x80000000 | (set << 5)
-
-	sll	%o2, 26, %g5		! block << 26
-6:
-	or	%g5, %g4, %g5
-	ldda	[%g5] ASI_M_DATAC_TAG, %g2
-	cmp	%g3, %g1		! ptag == ppage?
-	bne	7f
-	 inc	%o2
-
-	andcc	%g2, %o5, %g0		! ptag VALID?
-	be	7f
-	 add	%g4, %o3, %g2		! (PAGE_OFFSET + PAGE_SIZE) | (set << 5)
-	ld	[%g2], %g3
-	ld	[%g2 + %g7], %g3
-	add	%g2, %o0, %g2
-	ld	[%g2], %g3
-	ld	[%g2 + %g7], %g3
-	add	%g2, %o0, %g2
-	ld	[%g2], %g3
-	ld	[%g2 + %g7], %g3
-	add	%g2, %o0, %g2
-	ld	[%g2], %g3
-	b	8f
-	 ld	[%g2 + %g7], %g3
-
-7:
-	cmp	%o2, 3
-	ble	6b
-	 sll	%o2, 26, %g5			! block << 26
-
-8:	inc	%o1
-	cmp	%o1, 0x7f
-	ble	5b
-	 clr	%o2
-
-9:	retl
-	 nop
-
-viking_mxcc_flush_page:
-	sethi	%hi(PAGE_OFFSET), %g2
-	sub	%o0, %g2, %g3
-	sub	%g3, -PAGE_SIZE, %g3		! ppage + PAGE_SIZE
-	sethi	%hi(MXCC_SRCSTREAM), %o3	! assume %hi(MXCC_SRCSTREAM) == %hi(MXCC_DESTSTREAM)
-	mov	0x10, %g2			! set cacheable bit
-	or	%o3, %lo(MXCC_SRCSTREAM), %o2
-	or	%o3, %lo(MXCC_DESSTREAM), %o3
-	sub	%g3, MXCC_STREAM_SIZE, %g3
-6:
-	stda	%g2, [%o2] ASI_M_MXCC
-	stda	%g2, [%o3] ASI_M_MXCC
-	andncc	%g3, PAGE_MASK, %g0
-	bne	6b
-	 sub	%g3, MXCC_STREAM_SIZE, %g3
-
-9:	retl
-	 nop
-
-viking_flush_cache_page:
-viking_flush_cache_range:
-#ifndef CONFIG_SMP
-	ld	[%o0 + VMA_VM_MM], %o0
-#endif
-viking_flush_cache_mm:
-#ifndef CONFIG_SMP
-	ld	[%o0 + AOFF_mm_context], %g1
-	cmp	%g1, -1
-	bne	viking_flush_cache_all
-	 nop
-	b,a	viking_flush_cache_out
-#endif
-viking_flush_cache_all:
-	WINDOW_FLUSH(%g4, %g5)
-viking_flush_cache_out:
-	retl
-	 nop
-
-viking_flush_tlb_all:
-	mov	0x400, %g1
-	retl
-	 sta	%g0, [%g1] ASI_M_FLUSH_PROBE
-
-viking_flush_tlb_mm:
-	mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + AOFF_mm_context], %o1
-	lda	[%g1] ASI_M_MMUREGS, %g5
-#ifndef CONFIG_SMP
-	cmp	%o1, -1
-	be	1f
-#endif
-	mov	0x300, %g2
-	sta	%o1, [%g1] ASI_M_MMUREGS
-	sta	%g0, [%g2] ASI_M_FLUSH_PROBE
-	retl
-	 sta	%g5, [%g1] ASI_M_MMUREGS
-#ifndef CONFIG_SMP
-1:	retl
-	 nop
-#endif
-
-viking_flush_tlb_range:
-	ld	[%o0 + VMA_VM_MM], %o0
-	mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + AOFF_mm_context], %o3
-	lda	[%g1] ASI_M_MMUREGS, %g5
-#ifndef CONFIG_SMP
-	cmp	%o3, -1
-	be	2f
-#endif
-	sethi	%hi(~((1 << PGDIR_SHIFT) - 1)), %o4
-	sta	%o3, [%g1] ASI_M_MMUREGS
-	and	%o1, %o4, %o1
-	add	%o1, 0x200, %o1
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-1:	sub	%o1, %o4, %o1
-	cmp	%o1, %o2
-	blu,a	1b
-	 sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-	retl
-	 sta	%g5, [%g1] ASI_M_MMUREGS
-#ifndef CONFIG_SMP
-2:	retl
-	 nop
-#endif
-
-viking_flush_tlb_page:
-	ld	[%o0 + VMA_VM_MM], %o0
-	mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + AOFF_mm_context], %o3
-	lda	[%g1] ASI_M_MMUREGS, %g5
-#ifndef CONFIG_SMP
-	cmp	%o3, -1
-	be	1f
-#endif
-	and	%o1, PAGE_MASK, %o1
-	sta	%o3, [%g1] ASI_M_MMUREGS
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-	retl
-	 sta	%g5, [%g1] ASI_M_MMUREGS
-#ifndef CONFIG_SMP
-1:	retl
-	 nop
-#endif
-
-viking_flush_page_to_ram:
-viking_flush_page_for_dma:
-viking_flush_sig_insns:
-	retl
-	 nop
-
-#ifdef CONFIG_SMP
-	.globl	sun4dsmp_flush_tlb_all, sun4dsmp_flush_tlb_mm
-	.globl	sun4dsmp_flush_tlb_range, sun4dsmp_flush_tlb_page
-sun4dsmp_flush_tlb_all:
-	sethi	%hi(sun4dsmp_flush_tlb_spin), %g3
-1:	ldstub	[%g3 + %lo(sun4dsmp_flush_tlb_spin)], %g5
-	tst	%g5
-	bne	2f
-	 mov	0x400, %g1
-	sta	%g0, [%g1] ASI_M_FLUSH_PROBE
-	retl
-	 stb	%g0, [%g3 + %lo(sun4dsmp_flush_tlb_spin)]
-2:	tst	%g5
-	bne,a	2b
-	 ldub	[%g3 + %lo(sun4dsmp_flush_tlb_spin)], %g5
-	b,a	1b
-
-sun4dsmp_flush_tlb_mm:
-	sethi	%hi(sun4dsmp_flush_tlb_spin), %g3
-1:	ldstub	[%g3 + %lo(sun4dsmp_flush_tlb_spin)], %g5
-	tst	%g5
-	bne	2f
-	 mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + AOFF_mm_context], %o1
-	lda	[%g1] ASI_M_MMUREGS, %g5
-	mov	0x300, %g2
-	sta	%o1, [%g1] ASI_M_MMUREGS
-	sta	%g0, [%g2] ASI_M_FLUSH_PROBE
-	sta	%g5, [%g1] ASI_M_MMUREGS
-	retl
-	 stb	%g0, [%g3 + %lo(sun4dsmp_flush_tlb_spin)]
-2:	tst	%g5
-	bne,a	2b
-	 ldub	[%g3 + %lo(sun4dsmp_flush_tlb_spin)], %g5
-	b,a	1b
-
-sun4dsmp_flush_tlb_range:
-	sethi	%hi(sun4dsmp_flush_tlb_spin), %g3
-1:	ldstub	[%g3 + %lo(sun4dsmp_flush_tlb_spin)], %g5
-	tst	%g5
-	bne	3f
-	 mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + VMA_VM_MM], %o0
-	ld	[%o0 + AOFF_mm_context], %o3
-	lda	[%g1] ASI_M_MMUREGS, %g5
-	sethi	%hi(~((1 << PGDIR_SHIFT) - 1)), %o4
-	sta	%o3, [%g1] ASI_M_MMUREGS
-	and	%o1, %o4, %o1
-	add	%o1, 0x200, %o1
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-2:	sub	%o1, %o4, %o1
-	cmp	%o1, %o2
-	blu,a	2b
-	 sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-	sta	%g5, [%g1] ASI_M_MMUREGS
-	retl
-	 stb	%g0, [%g3 + %lo(sun4dsmp_flush_tlb_spin)]
-3:	tst	%g5
-	bne,a	3b
-	 ldub	[%g3 + %lo(sun4dsmp_flush_tlb_spin)], %g5
-	b,a	1b
-
-sun4dsmp_flush_tlb_page:
-	sethi	%hi(sun4dsmp_flush_tlb_spin), %g3
-1:	ldstub	[%g3 + %lo(sun4dsmp_flush_tlb_spin)], %g5
-	tst	%g5
-	bne	2f
-	 mov	SRMMU_CTX_REG, %g1
-	ld	[%o0 + VMA_VM_MM], %o0
-	ld	[%o0 + AOFF_mm_context], %o3
-	lda	[%g1] ASI_M_MMUREGS, %g5
-	and	%o1, PAGE_MASK, %o1
-	sta	%o3, [%g1] ASI_M_MMUREGS
-	sta	%g0, [%o1] ASI_M_FLUSH_PROBE
-	sta	%g5, [%g1] ASI_M_MMUREGS
-	retl
-	 stb	%g0, [%g3 + %lo(sun4dsmp_flush_tlb_spin)]
-2:	tst	%g5
-	bne,a	2b
-	 ldub	[%g3 + %lo(sun4dsmp_flush_tlb_spin)], %g5
-	b,a	1b
-	 nop
-#endif

-- 
2.34.1

