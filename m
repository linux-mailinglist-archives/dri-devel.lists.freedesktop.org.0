Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 490208192CD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1FB10E2F7;
	Tue, 19 Dec 2023 22:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE1A10E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 64569614E3;
 Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6621BC4163D;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023396;
 bh=jpHwPU0gk4FHdyFw3KgXjHoqiB7e+wJP0mRdIuIuUx0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=MBAvXVLekpp934cBCMH0Cys1yiWhQ6CWj65thhlPOr175CXNEr4UTTht5SdpIVUTw
 Oghn75vgOIf83TgLicfTdxuP4qfeZ/tXwG7Thp7AraDLm8x7fxgEz6Ra+zfHfgmqT3
 X6DrvP/UuvtOWS7KKW+WuhKljTaqK0NYo2jDjq6V6Zw+BZ3ThVanJT1H1QggxjvLN7
 xe7b6Cd8qTDMOXn8zMSQZ08SghSgl5kHXJwa/M0mUUJCTx4QZ0I9DMn3zeegCH5xKR
 a6pMstfU9F+Kq42HyQ0i8G/z+fxPlkkw+cFzX1l8ftDqMUaCY9nKwmopB7zpeRxpPO
 odIYzNkcyb3aQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 53894C46CD2;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:24 +0100
Subject: [PATCH 19/27] sparc32: Drop additional sun4d bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-19-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=24568;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=WOwW/xTD5mvfxe2MXV7hahYtctLoaln6PTPy2VeVKFE=; =?utf-8?q?b=3DorF7WX438Tah?=
 =?utf-8?q?CPFGZqUUThn4ZK2sURruS/n77/D7SMZeftaqlMMCIB8ydi6w6M/mNfVT3PNnr4z0?=
 yrJuauytDSpY9masJIVU44ZzjvgHg5eggcVSYQ8gTudQs2eBE9O7
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

Drop sun4d specific support. Not used by LEON.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/io-unit.h |  59 --------
 arch/sparc/include/asm/obio.h    | 226 -------------------------------
 arch/sparc/include/asm/sbi.h     | 116 ----------------
 arch/sparc/kernel/entry.S        |   1 -
 arch/sparc/kernel/ioport.c       |   1 -
 arch/sparc/mm/Makefile           |   2 +-
 arch/sparc/mm/io-unit.c          | 283 ---------------------------------------
 arch/sparc/mm/srmmu.c            |   1 -
 8 files changed, 1 insertion(+), 688 deletions(-)

diff --git a/arch/sparc/include/asm/io-unit.h b/arch/sparc/include/asm/io-unit.h
deleted file mode 100644
index 8c38f5b9f927..000000000000
--- a/arch/sparc/include/asm/io-unit.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* io-unit.h: Definitions for the sun4d IO-UNIT.
- *
- * Copyright (C) 1997,1998 Jakub Jelinek (jj@sunsite.mff.cuni.cz)
- */
-#ifndef _SPARC_IO_UNIT_H
-#define _SPARC_IO_UNIT_H
-
-#include <linux/spinlock.h>
-#include <linux/pgtable.h>
-#include <asm/page.h>
-
-/* The io-unit handles all virtual to physical address translations
- * that occur between the SBUS and physical memory.  Access by
- * the cpu to IO registers and similar go over the xdbus so are
- * translated by the on chip SRMMU.  The io-unit and the srmmu do
- * not need to have the same translations at all, in fact most
- * of the time the translations they handle are a disjunct set.
- * Basically the io-unit handles all dvma sbus activity.
- */
- 
-/* AIEEE, unlike the nice sun4m, these monsters have 
-   fixed DMA range 64M */
- 
-#define IOUNIT_DMA_BASE	    0xfc000000 /* TOP - 64M */
-#define IOUNIT_DMA_SIZE	    0x04000000 /* 64M */
-/* We use last 1M for sparc_dvma_malloc */
-#define IOUNIT_DVMA_SIZE    0x00100000 /* 1M */
-
-/* The format of an iopte in the external page tables */
-#define IOUPTE_PAGE          0xffffff00 /* Physical page number (PA[35:12])	*/
-#define IOUPTE_CACHE         0x00000080 /* Cached (in Viking/MXCC)		*/
-/* XXX Jakub, find out how to program SBUS streaming cache on XDBUS/sun4d.
- * XXX Actually, all you should need to do is find out where the registers
- * XXX are and copy over the sparc64 implementation I wrote.  There may be
- * XXX some horrible hwbugs though, so be careful.  -DaveM
- */
-#define IOUPTE_STREAM        0x00000040 /* Translation can use streaming cache	*/
-#define IOUPTE_INTRA	     0x00000008 /* SBUS direct slot->slot transfer	*/
-#define IOUPTE_WRITE         0x00000004 /* Writeable				*/
-#define IOUPTE_VALID         0x00000002 /* IOPTE is valid			*/
-#define IOUPTE_PARITY        0x00000001 /* Parity is checked during DVMA	*/
-
-struct iounit_struct {
-	unsigned long		bmap[(IOUNIT_DMA_SIZE >> (PAGE_SHIFT + 3)) / sizeof(unsigned long)];
-	spinlock_t		lock;
-	iopte_t __iomem		*page_table;
-	unsigned long		rotor[3];
-	unsigned long		limit[4];
-};
-
-#define IOUNIT_BMAP1_START	0x00000000
-#define IOUNIT_BMAP1_END	(IOUNIT_DMA_SIZE >> (PAGE_SHIFT + 1))
-#define IOUNIT_BMAP2_START	IOUNIT_BMAP1_END
-#define IOUNIT_BMAP2_END	IOUNIT_BMAP2_START + (IOUNIT_DMA_SIZE >> (PAGE_SHIFT + 2))
-#define IOUNIT_BMAPM_START	IOUNIT_BMAP2_END
-#define IOUNIT_BMAPM_END	((IOUNIT_DMA_SIZE - IOUNIT_DVMA_SIZE) >> PAGE_SHIFT)
-
-#endif /* !(_SPARC_IO_UNIT_H) */
diff --git a/arch/sparc/include/asm/obio.h b/arch/sparc/include/asm/obio.h
deleted file mode 100644
index 1b151f738b00..000000000000
--- a/arch/sparc/include/asm/obio.h
+++ /dev/null
@@ -1,226 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * obio.h:  Some useful locations in 0xFXXXXXXXX PA obio space on sun4d.
- *
- * Copyright (C) 1997 Jakub Jelinek <jj@sunsite.mff.cuni.cz>
- */
-
-#ifndef _SPARC_OBIO_H
-#define _SPARC_OBIO_H
-
-#include <asm/asi.h>
-
-/* This weird monster likes to use the very upper parts of
-   36bit PA for these things :) */
-   
-/* CSR space (for each XDBUS)
- *  ------------------------------------------------------------------------
- *  |   0xFE  |   DEVID    |                | XDBUS ID |                   |
- *  ------------------------------------------------------------------------
- *  35      28 27        20 19            10 9        8 7                 0
- */
-   
-#define CSR_BASE_ADDR		0xe0000000
-#define CSR_CPU_SHIFT		(32 - 4 - 5)
-#define CSR_XDBUS_SHIFT		8
-
-#define CSR_BASE(cpu) (((CSR_BASE_ADDR >> CSR_CPU_SHIFT) + cpu) << CSR_CPU_SHIFT)
-
-/* ECSR space (not for each XDBUS)
- *  ------------------------------------------------------------------------
- *  |   0xF  | DEVID[7:1] |                			           |
- *  ------------------------------------------------------------------------
- *  35     32 31        25 24                 				  0
- */
-   
-#define ECSR_BASE_ADDR		0x00000000
-#define ECSR_CPU_SHIFT		(32 - 5)
-#define ECSR_DEV_SHIFT		(32 - 8)
-
-#define ECSR_BASE(cpu) ((cpu) << ECSR_CPU_SHIFT)
-#define ECSR_DEV_BASE(devid) ((devid) << ECSR_DEV_SHIFT) 
-
-/* Bus Watcher */
-#define BW_LOCAL_BASE		0xfff00000
-
-#define BW_CID			0x00000000
-#define BW_DBUS_CTRL		0x00000008
-#define BW_DBUS_DATA		0x00000010
-#define BW_CTRL			0x00001000
-#define BW_INTR_TABLE		0x00001040
-#define BW_INTR_TABLE_CLEAR	0x00001080
-#define BW_PRESCALER		0x000010c0
-#define BW_PTIMER_LIMIT		0x00002000
-#define BW_PTIMER_COUNTER2	0x00002004
-#define BW_PTIMER_NDLIMIT	0x00002008
-#define BW_PTIMER_CTRL		0x0000200c
-#define BW_PTIMER_COUNTER	0x00002010
-#define BW_TIMER_LIMIT		0x00003000
-#define BW_TIMER_COUNTER2	0x00003004
-#define BW_TIMER_NDLIMIT	0x00003008
-#define BW_TIMER_CTRL		0x0000300c
-#define BW_TIMER_COUNTER	0x00003010
-
-/* BW Control */
-#define BW_CTRL_USER_TIMER	0x00000004	/* Is User Timer Free run enabled */
-
-/* Boot Bus */
-#define BB_LOCAL_BASE		0xf0000000
-
-#define BB_STAT1		0x00100000
-#define BB_STAT2		0x00120000
-#define BB_STAT3		0x00140000
-#define BB_LEDS			0x002e0000
-
-/* Bits in BB_STAT2 */
-#define BB_STAT2_AC_INTR	0x04	/* Aiee! 5ms and power is gone... */
-#define BB_STAT2_TMP_INTR	0x10	/* My Penguins are burning. Are you able to smell it? */
-#define BB_STAT2_FAN_INTR	0x20	/* My fan refuses to work */
-#define BB_STAT2_PWR_INTR	0x40	/* On SC2000, one of the two ACs died. Ok, we go on... */
-#define BB_STAT2_MASK		(BB_STAT2_AC_INTR|BB_STAT2_TMP_INTR|BB_STAT2_FAN_INTR|BB_STAT2_PWR_INTR)
-
-/* Cache Controller */
-#define CC_BASE		0x1F00000
-#define CC_DATSTREAM	0x1F00000  /* Data stream register */
-#define CC_DATSIZE	0x1F0003F  /* Size */
-#define CC_SRCSTREAM	0x1F00100  /* Source stream register */
-#define CC_DESSTREAM	0x1F00200  /* Destination stream register */
-#define CC_RMCOUNT	0x1F00300  /* Count of references and misses */
-#define CC_IPEN		0x1F00406  /* Pending Interrupts */
-#define CC_IMSK		0x1F00506  /* Interrupt Mask */
-#define CC_ICLR		0x1F00606  /* Clear pending Interrupts */
-#define CC_IGEN		0x1F00704  /* Generate Interrupt register */
-#define CC_STEST	0x1F00804  /* Internal self-test */
-#define CC_CREG		0x1F00A04  /* Control register */
-#define CC_SREG		0x1F00B00  /* Status register */
-#define CC_RREG		0x1F00C04  /* Reset register */
-#define CC_EREG		0x1F00E00  /* Error code register */
-#define CC_CID		0x1F00F04  /* Component ID */
-
-#ifndef __ASSEMBLY__
-
-static inline int bw_get_intr_mask(int sbus_level)
-{
-	int mask;
-	
-	__asm__ __volatile__ ("lduha [%1] %2, %0" :
-			      "=r" (mask) :
-			      "r" (BW_LOCAL_BASE + BW_INTR_TABLE + (sbus_level << 3)),
-			      "i" (ASI_M_CTL));
-	return mask;
-}
-
-static inline void bw_clear_intr_mask(int sbus_level, int mask)
-{
-	__asm__ __volatile__ ("stha %0, [%1] %2" : :
-			      "r" (mask),
-			      "r" (BW_LOCAL_BASE + BW_INTR_TABLE_CLEAR + (sbus_level << 3)),
-			      "i" (ASI_M_CTL));
-}
-
-static inline unsigned int bw_get_prof_limit(int cpu)
-{
-	unsigned int limit;
-	
-	__asm__ __volatile__ ("lda [%1] %2, %0" :
-			      "=r" (limit) :
-			      "r" (CSR_BASE(cpu) + BW_PTIMER_LIMIT),
-			      "i" (ASI_M_CTL));
-	return limit;
-}
-
-static inline void bw_set_prof_limit(int cpu, unsigned int limit)
-{
-	__asm__ __volatile__ ("sta %0, [%1] %2" : :
-			      "r" (limit),
-			      "r" (CSR_BASE(cpu) + BW_PTIMER_LIMIT),
-			      "i" (ASI_M_CTL));
-}
-
-static inline unsigned int bw_get_ctrl(int cpu)
-{
-	unsigned int ctrl;
-	
-	__asm__ __volatile__ ("lda [%1] %2, %0" :
-			      "=r" (ctrl) :
-			      "r" (CSR_BASE(cpu) + BW_CTRL),
-			      "i" (ASI_M_CTL));
-	return ctrl;
-}
-
-static inline void bw_set_ctrl(int cpu, unsigned int ctrl)
-{
-	__asm__ __volatile__ ("sta %0, [%1] %2" : :
-			      "r" (ctrl),
-			      "r" (CSR_BASE(cpu) + BW_CTRL),
-			      "i" (ASI_M_CTL));
-}
-
-static inline unsigned int cc_get_ipen(void)
-{
-	unsigned int pending;
-	
-	__asm__ __volatile__ ("lduha [%1] %2, %0" :
-			      "=r" (pending) :
-			      "r" (CC_IPEN),
-			      "i" (ASI_M_MXCC));
-	return pending;
-}
-
-static inline void cc_set_iclr(unsigned int clear)
-{
-	__asm__ __volatile__ ("stha %0, [%1] %2" : :
-			      "r" (clear),
-			      "r" (CC_ICLR),
-			      "i" (ASI_M_MXCC));
-}
-
-static inline unsigned int cc_get_imsk(void)
-{
-	unsigned int mask;
-	
-	__asm__ __volatile__ ("lduha [%1] %2, %0" :
-			      "=r" (mask) :
-			      "r" (CC_IMSK),
-			      "i" (ASI_M_MXCC));
-	return mask;
-}
-
-static inline void cc_set_imsk(unsigned int mask)
-{
-	__asm__ __volatile__ ("stha %0, [%1] %2" : :
-			      "r" (mask),
-			      "r" (CC_IMSK),
-			      "i" (ASI_M_MXCC));
-}
-
-static inline unsigned int cc_get_imsk_other(int cpuid)
-{
-	unsigned int mask;
-	
-	__asm__ __volatile__ ("lduha [%1] %2, %0" :
-			      "=r" (mask) :
-			      "r" (ECSR_BASE(cpuid) | CC_IMSK),
-			      "i" (ASI_M_CTL));
-	return mask;
-}
-
-static inline void cc_set_imsk_other(int cpuid, unsigned int mask)
-{
-	__asm__ __volatile__ ("stha %0, [%1] %2" : :
-			      "r" (mask),
-			      "r" (ECSR_BASE(cpuid) | CC_IMSK),
-			      "i" (ASI_M_CTL));
-}
-
-static inline void cc_set_igen(unsigned int gen)
-{
-	__asm__ __volatile__ ("sta %0, [%1] %2" : :
-			      "r" (gen),
-			      "r" (CC_IGEN),
-			      "i" (ASI_M_MXCC));
-}
-
-#endif /* !__ASSEMBLY__ */
-
-#endif /* !(_SPARC_OBIO_H) */
diff --git a/arch/sparc/include/asm/sbi.h b/arch/sparc/include/asm/sbi.h
deleted file mode 100644
index 4d6026c1e446..000000000000
--- a/arch/sparc/include/asm/sbi.h
+++ /dev/null
@@ -1,116 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * sbi.h:  SBI (Sbus Interface on sun4d) definitions
- *
- * Copyright (C) 1997 Jakub Jelinek <jj@sunsite.mff.cuni.cz>
- */
-
-#ifndef _SPARC_SBI_H
-#define _SPARC_SBI_H
-
-#include <asm/obio.h>
-
-/* SBI */
-struct sbi_regs {
-/* 0x0000 */	u32		cid;		/* Component ID */
-/* 0x0004 */	u32		ctl;		/* Control */
-/* 0x0008 */	u32		status;		/* Status */
-		u32		_unused1;
-		
-/* 0x0010 */	u32		cfg0;		/* Slot0 config reg */
-/* 0x0014 */	u32		cfg1;		/* Slot1 config reg */
-/* 0x0018 */	u32		cfg2;		/* Slot2 config reg */
-/* 0x001c */	u32		cfg3;		/* Slot3 config reg */
-
-/* 0x0020 */	u32		stb0;		/* Streaming buf control for slot 0 */
-/* 0x0024 */	u32		stb1;		/* Streaming buf control for slot 1 */
-/* 0x0028 */	u32		stb2;		/* Streaming buf control for slot 2 */
-/* 0x002c */	u32		stb3;		/* Streaming buf control for slot 3 */
-
-/* 0x0030 */	u32		intr_state;	/* Interrupt state */
-/* 0x0034 */	u32		intr_tid;	/* Interrupt target ID */
-/* 0x0038 */	u32		intr_diag;	/* Interrupt diagnostics */
-};
-
-#define SBI_CID			0x02800000
-#define SBI_CTL			0x02800004
-#define SBI_STATUS		0x02800008
-#define SBI_CFG0		0x02800010
-#define SBI_CFG1		0x02800014
-#define SBI_CFG2		0x02800018
-#define SBI_CFG3		0x0280001c
-#define SBI_STB0		0x02800020
-#define SBI_STB1		0x02800024
-#define SBI_STB2		0x02800028
-#define SBI_STB3		0x0280002c
-#define SBI_INTR_STATE		0x02800030
-#define SBI_INTR_TID		0x02800034
-#define SBI_INTR_DIAG		0x02800038
-
-/* Burst bits for 8, 16, 32, 64 are in cfgX registers at bits 2, 3, 4, 5 respectively */
-#define SBI_CFG_BURST_MASK	0x0000001e
-
-/* How to make devid from sbi no */
-#define SBI2DEVID(sbino) ((sbino<<4)|2)
-
-/* intr_state has 4 bits for slots 0 .. 3 and these bits are repeated for each sbus irq level
- *
- *		   +-------+-------+-------+-------+-------+-------+-------+-------+
- *  SBUS IRQ LEVEL |   7   |   6   |   5   |   4   |   3   |   2   |   1   |       |
- *		   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ Reser |
- *  SLOT #         |3|2|1|0|3|2|1|0|3|2|1|0|3|2|1|0|3|2|1|0|3|2|1|0|3|2|1|0|  ved  |
- *                 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-------+
- *  Bits           31      27      23      19      15      11      7       3      0
- */
-
-
-#ifndef __ASSEMBLY__
-
-static inline int acquire_sbi(int devid, int mask)
-{
-	__asm__ __volatile__ ("swapa [%2] %3, %0" :
-			      "=r" (mask) :
-			      "0" (mask),
-			      "r" (ECSR_DEV_BASE(devid) | SBI_INTR_STATE),
-			      "i" (ASI_M_CTL));
-	return mask;
-}
-
-static inline void release_sbi(int devid, int mask)
-{
-	__asm__ __volatile__ ("sta %0, [%1] %2" : :
-			      "r" (mask),
-			      "r" (ECSR_DEV_BASE(devid) | SBI_INTR_STATE),
-			      "i" (ASI_M_CTL));
-}
-
-static inline void set_sbi_tid(int devid, int targetid)
-{
-	__asm__ __volatile__ ("sta %0, [%1] %2" : :
-			      "r" (targetid),
-			      "r" (ECSR_DEV_BASE(devid) | SBI_INTR_TID),
-			      "i" (ASI_M_CTL));
-}
-
-static inline int get_sbi_ctl(int devid, int cfgno)
-{
-	int cfg;
-	
-	__asm__ __volatile__ ("lda [%1] %2, %0" :
-			      "=r" (cfg) :
-			      "r" ((ECSR_DEV_BASE(devid) | SBI_CFG0) + (cfgno<<2)),
-			      "i" (ASI_M_CTL));
-	return cfg;
-}
-
-static inline void set_sbi_ctl(int devid, int cfgno, int cfg)
-{
-	__asm__ __volatile__ ("sta %0, [%1] %2" : :
-			      "r" (cfg),
-			      "r" ((ECSR_DEV_BASE(devid) | SBI_CFG0) + (cfgno<<2)),
-			      "i" (ASI_M_CTL));
-}
-
-#endif /* !__ASSEMBLY__ */
-
-#endif /* !(_SPARC_SBI_H) */
diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
index 078a8f7f8383..eecbe0be7bf6 100644
--- a/arch/sparc/kernel/entry.S
+++ b/arch/sparc/kernel/entry.S
@@ -24,7 +24,6 @@
 #include <asm/page.h>
 #include <asm/winmacro.h>
 #include <asm/signal.h>
-#include <asm/obio.h>
 #include <asm/thread_info.h>
 #include <asm/param.h>
 #include <asm/unistd.h>
diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
index cf0ace29704a..745579a40785 100644
--- a/arch/sparc/kernel/ioport.c
+++ b/arch/sparc/kernel/ioport.c
@@ -49,7 +49,6 @@
 #include <asm/pgalloc.h>
 #include <asm/dma.h>
 #include <asm/iommu.h>
-#include <asm/io-unit.h>
 #include <asm/leon.h>
 
 static void __iomem *_sparc_ioremap(struct resource *res, u32 bus, u32 pa, int sz);
diff --git a/arch/sparc/mm/Makefile b/arch/sparc/mm/Makefile
index 357a5816a6bf..ee33053b170a 100644
--- a/arch/sparc/mm/Makefile
+++ b/arch/sparc/mm/Makefile
@@ -8,7 +8,7 @@ ccflags-y := -Werror
 obj-$(CONFIG_SPARC64)   += ultra.o tlb.o tsb.o
 obj-y                   += fault_$(BITS).o
 obj-y                   += init_$(BITS).o
-obj-$(CONFIG_SPARC32)   += srmmu.o iommu.o io-unit.o
+obj-$(CONFIG_SPARC32)   += srmmu.o iommu.o
 obj-$(CONFIG_SPARC32)   += leon_mm.o
 
 # Only used by sparc64
diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
deleted file mode 100644
index a2cfa8757795..000000000000
--- a/arch/sparc/mm/io-unit.c
+++ /dev/null
@@ -1,283 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * io-unit.c:  IO-UNIT specific routines for memory management.
- *
- * Copyright (C) 1997,1998 Jakub Jelinek    (jj@sunsite.mff.cuni.cz)
- */
- 
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/mm.h>
-#include <linux/bitops.h>
-#include <linux/dma-map-ops.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/platform_device.h>
-
-#include <asm/io.h>
-#include <asm/io-unit.h>
-#include <asm/cacheflush.h>
-#include <asm/tlbflush.h>
-#include <asm/dma.h>
-#include <asm/oplib.h>
-
-#include "mm_32.h"
-
-/* #define IOUNIT_DEBUG */
-#ifdef IOUNIT_DEBUG
-#define IOD(x) printk(x)
-#else
-#define IOD(x) do { } while (0)
-#endif
-
-#define IOPERM        (IOUPTE_CACHE | IOUPTE_WRITE | IOUPTE_VALID)
-#define MKIOPTE(phys) __iopte((((phys)>>4) & IOUPTE_PAGE) | IOPERM)
-
-static const struct dma_map_ops iounit_dma_ops;
-
-static void __init iounit_iommu_init(struct platform_device *op)
-{
-	struct iounit_struct *iounit;
-	iopte_t __iomem *xpt;
-	iopte_t __iomem *xptend;
-
-	iounit = kzalloc(sizeof(struct iounit_struct), GFP_ATOMIC);
-	if (!iounit) {
-		prom_printf("SUN4D: Cannot alloc iounit, halting.\n");
-		prom_halt();
-	}
-
-	iounit->limit[0] = IOUNIT_BMAP1_START;
-	iounit->limit[1] = IOUNIT_BMAP2_START;
-	iounit->limit[2] = IOUNIT_BMAPM_START;
-	iounit->limit[3] = IOUNIT_BMAPM_END;
-	iounit->rotor[1] = IOUNIT_BMAP2_START;
-	iounit->rotor[2] = IOUNIT_BMAPM_START;
-
-	xpt = of_ioremap(&op->resource[2], 0, PAGE_SIZE * 16, "XPT");
-	if (!xpt) {
-		prom_printf("SUN4D: Cannot map External Page Table.");
-		prom_halt();
-	}
-	
-	op->dev.archdata.iommu = iounit;
-	iounit->page_table = xpt;
-	spin_lock_init(&iounit->lock);
-
-	xptend = iounit->page_table + (16 * PAGE_SIZE) / sizeof(iopte_t);
-	for (; xpt < xptend; xpt++)
-		sbus_writel(0, xpt);
-
-	op->dev.dma_ops = &iounit_dma_ops;
-}
-
-static int __init iounit_init(void)
-{
-	extern void sun4d_init_sbi_irq(void);
-	struct device_node *dp;
-
-	for_each_node_by_name(dp, "sbi") {
-		struct platform_device *op = of_find_device_by_node(dp);
-
-		iounit_iommu_init(op);
-		of_propagate_archdata(op);
-	}
-
-	return 0;
-}
-
-subsys_initcall(iounit_init);
-
-/* One has to hold iounit->lock to call this */
-static unsigned long iounit_get_area(struct iounit_struct *iounit, unsigned long vaddr, int size)
-{
-	int i, j, k, npages;
-	unsigned long rotor, scan, limit;
-	iopte_t iopte;
-
-        npages = ((vaddr & ~PAGE_MASK) + size + (PAGE_SIZE-1)) >> PAGE_SHIFT;
-
-	/* A tiny bit of magic ingredience :) */
-	switch (npages) {
-	case 1: i = 0x0231; break;
-	case 2: i = 0x0132; break;
-	default: i = 0x0213; break;
-	}
-	
-	IOD(("iounit_get_area(%08lx,%d[%d])=", vaddr, size, npages));
-	
-next:	j = (i & 15);
-	rotor = iounit->rotor[j - 1];
-	limit = iounit->limit[j];
-	scan = rotor;
-nexti:	scan = find_next_zero_bit(iounit->bmap, limit, scan);
-	if (scan + npages > limit) {
-		if (limit != rotor) {
-			limit = rotor;
-			scan = iounit->limit[j - 1];
-			goto nexti;
-		}
-		i >>= 4;
-		if (!(i & 15))
-			panic("iounit_get_area: Couldn't find free iopte slots for (%08lx,%d)\n", vaddr, size);
-		goto next;
-	}
-	for (k = 1, scan++; k < npages; k++)
-		if (test_bit(scan++, iounit->bmap))
-			goto nexti;
-	iounit->rotor[j - 1] = (scan < limit) ? scan : iounit->limit[j - 1];
-	scan -= npages;
-	iopte = MKIOPTE(__pa(vaddr & PAGE_MASK));
-	vaddr = IOUNIT_DMA_BASE + (scan << PAGE_SHIFT) + (vaddr & ~PAGE_MASK);
-	for (k = 0; k < npages; k++, iopte = __iopte(iopte_val(iopte) + 0x100), scan++) {
-		set_bit(scan, iounit->bmap);
-		sbus_writel(iopte_val(iopte), &iounit->page_table[scan]);
-	}
-	IOD(("%08lx\n", vaddr));
-	return vaddr;
-}
-
-static dma_addr_t iounit_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t len, enum dma_data_direction dir,
-		unsigned long attrs)
-{
-	void *vaddr = page_address(page) + offset;
-	struct iounit_struct *iounit = dev->archdata.iommu;
-	unsigned long ret, flags;
-	
-	/* XXX So what is maxphys for us and how do drivers know it? */
-	if (!len || len > 256 * 1024)
-		return DMA_MAPPING_ERROR;
-
-	spin_lock_irqsave(&iounit->lock, flags);
-	ret = iounit_get_area(iounit, (unsigned long)vaddr, len);
-	spin_unlock_irqrestore(&iounit->lock, flags);
-	return ret;
-}
-
-static int iounit_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	struct iounit_struct *iounit = dev->archdata.iommu;
-	struct scatterlist *sg;
-	unsigned long flags;
-	int i;
-
-	/* FIXME: Cache some resolved pages - often several sg entries are to the same page */
-	spin_lock_irqsave(&iounit->lock, flags);
-	for_each_sg(sgl, sg, nents, i) {
-		sg->dma_address = iounit_get_area(iounit, (unsigned long) sg_virt(sg), sg->length);
-		sg->dma_length = sg->length;
-	}
-	spin_unlock_irqrestore(&iounit->lock, flags);
-	return nents;
-}
-
-static void iounit_unmap_page(struct device *dev, dma_addr_t vaddr, size_t len,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	struct iounit_struct *iounit = dev->archdata.iommu;
-	unsigned long flags;
-	
-	spin_lock_irqsave(&iounit->lock, flags);
-	len = ((vaddr & ~PAGE_MASK) + len + (PAGE_SIZE-1)) >> PAGE_SHIFT;
-	vaddr = (vaddr - IOUNIT_DMA_BASE) >> PAGE_SHIFT;
-	IOD(("iounit_release %08lx-%08lx\n", (long)vaddr, (long)len+vaddr));
-	for (len += vaddr; vaddr < len; vaddr++)
-		clear_bit(vaddr, iounit->bmap);
-	spin_unlock_irqrestore(&iounit->lock, flags);
-}
-
-static void iounit_unmap_sg(struct device *dev, struct scatterlist *sgl,
-		int nents, enum dma_data_direction dir, unsigned long attrs)
-{
-	struct iounit_struct *iounit = dev->archdata.iommu;
-	unsigned long flags, vaddr, len;
-	struct scatterlist *sg;
-	int i;
-
-	spin_lock_irqsave(&iounit->lock, flags);
-	for_each_sg(sgl, sg, nents, i) {
-		len = ((sg->dma_address & ~PAGE_MASK) + sg->length + (PAGE_SIZE-1)) >> PAGE_SHIFT;
-		vaddr = (sg->dma_address - IOUNIT_DMA_BASE) >> PAGE_SHIFT;
-		IOD(("iounit_release %08lx-%08lx\n", (long)vaddr, (long)len+vaddr));
-		for (len += vaddr; vaddr < len; vaddr++)
-			clear_bit(vaddr, iounit->bmap);
-	}
-	spin_unlock_irqrestore(&iounit->lock, flags);
-}
-
-#ifdef CONFIG_SBUS
-static void *iounit_alloc(struct device *dev, size_t len,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
-{
-	struct iounit_struct *iounit = dev->archdata.iommu;
-	unsigned long va, addr, page, end, ret;
-	pgprot_t dvma_prot;
-	iopte_t __iomem *iopte;
-
-	/* XXX So what is maxphys for us and how do drivers know it? */
-	if (!len || len > 256 * 1024)
-		return NULL;
-
-	len = PAGE_ALIGN(len);
-	va = __get_free_pages(gfp | __GFP_ZERO, get_order(len));
-	if (!va)
-		return NULL;
-
-	addr = ret = sparc_dma_alloc_resource(dev, len);
-	if (!addr)
-		goto out_free_pages;
-	*dma_handle = addr;
-
-	dvma_prot = __pgprot(SRMMU_CACHE | SRMMU_ET_PTE | SRMMU_PRIV);
-	end = PAGE_ALIGN((addr + len));
-	while(addr < end) {
-		page = va;
-		{
-			pmd_t *pmdp;
-			pte_t *ptep;
-			long i;
-
-			pmdp = pmd_off_k(addr);
-			ptep = pte_offset_kernel(pmdp, addr);
-
-			set_pte(ptep, mk_pte(virt_to_page(page), dvma_prot));
-
-			i = ((addr - IOUNIT_DMA_BASE) >> PAGE_SHIFT);
-
-			iopte = iounit->page_table + i;
-			sbus_writel(iopte_val(MKIOPTE(__pa(page))), iopte);
-		}
-		addr += PAGE_SIZE;
-		va += PAGE_SIZE;
-	}
-	flush_cache_all();
-	flush_tlb_all();
-
-	return (void *)ret;
-
-out_free_pages:
-	free_pages(va, get_order(len));
-	return NULL;
-}
-
-static void iounit_free(struct device *dev, size_t size, void *cpu_addr,
-		dma_addr_t dma_addr, unsigned long attrs)
-{
-	/* XXX Somebody please fill this in */
-}
-#endif
-
-static const struct dma_map_ops iounit_dma_ops = {
-#ifdef CONFIG_SBUS
-	.alloc			= iounit_alloc,
-	.free			= iounit_free,
-#endif
-	.map_page		= iounit_map_page,
-	.unmap_page		= iounit_unmap_page,
-	.map_sg			= iounit_map_sg,
-	.unmap_sg		= iounit_unmap_sg,
-};
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 4a3778549c6f..949247a6896b 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -26,7 +26,6 @@
 #include <asm/mmu_context.h>
 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
-#include <asm/io-unit.h>
 #include <asm/pgalloc.h>
 #include <asm/pgtable.h>
 #include <asm/bitext.h>

-- 
2.34.1

