Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE598192ED
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5388C10E530;
	Tue, 19 Dec 2023 22:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C5F10E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7576D614E4;
 Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74334C116B3;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023396;
 bh=bLoZlXD+uyujBiI2QIHjJyBWQ7WHglpOzYi0YEMALhI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=hiFZYARLvw+cpesK+MbG5CFYiNTMuLIBzfQOKzXeuvXzZzQM1qg6OMJD5YXWDasX5
 zJdVqmsufRiCvLG67nWP0AxNoWTK+GDBOHgkKDH9k12Oxi2O9haAV8gW8NX9kdY4nH
 3ngMfjm56Ltl/gXRG67TIvkk8TPfvJTxF/h7ykgrpDbsSZYVxah5vlmrMHYGopjYlv
 72sYg21txveDBj2hC0Up40rped7bdo69Q2p3inl4mVPmNvz7p9Qb+8VTCBBhjN2+SF
 VZdAopWgK4gxmjG3GVWyer30Fy5r9oNx7WRSRfdUKeohDqGv7btdHOUP3jf4mb92lT
 7rygtWgpV4l7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA0CC41535;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:25 +0100
Subject: [PATCH 20/27] sparc32: Drop unused prom ranges support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-20-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=6494;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=JWUMPYjeM7nZeaLhzjjM6ATuORPYfX7XPb+WWflq45I=; =?utf-8?q?b=3DpeEDLnJfNsDv?=
 =?utf-8?q?bMEUyLIfk5KCN4dAImCHU1GZ0JD0n/cOF0IpbTfq7Erj+RhLDOeOO0ivzmtmiCOY?=
 w+qPEBwLCvTPNLWgyuz3ImztuQA+VjR0A01A3WxdeMxU5GIypt81
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

Drop support for prom ranges - not used anymore.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/oplib_32.h |  11 ----
 arch/sparc/prom/Makefile          |   1 -
 arch/sparc/prom/init_32.c         |   2 -
 arch/sparc/prom/ranges.c          | 114 --------------------------------------
 4 files changed, 128 deletions(-)

diff --git a/arch/sparc/include/asm/oplib_32.h b/arch/sparc/include/asm/oplib_32.h
index d1cf3a27a40d..4ef7f05978d3 100644
--- a/arch/sparc/include/asm/oplib_32.h
+++ b/arch/sparc/include/asm/oplib_32.h
@@ -163,17 +163,6 @@ int prom_setprop(phandle node, const char *prop_name, char *prop_value,
 
 phandle prom_inst2pkg(int);
 
-/* Dorking with Bus ranges... */
-
-/* Apply promlib probes OBIO ranges to registers. */
-void prom_apply_obio_ranges(struct linux_prom_registers *obioregs, int nregs);
-
-/* Apply ranges of any prom node (and optionally parent node as well) to registers. */
-void prom_apply_generic_ranges(phandle node, phandle parent,
-			       struct linux_prom_registers *sbusregs, int nregs);
-
-void prom_ranges_init(void);
-
 /* CPU probing helpers.  */
 int cpu_find_by_instance(int instance, phandle *prom_node, int *mid);
 int cpu_find_by_mid(int mid, phandle *prom_node);
diff --git a/arch/sparc/prom/Makefile b/arch/sparc/prom/Makefile
index 397b79af77f7..6d94d8b28bcf 100644
--- a/arch/sparc/prom/Makefile
+++ b/arch/sparc/prom/Makefile
@@ -10,7 +10,6 @@ lib-y                 += init_$(BITS).o
 lib-$(CONFIG_SPARC32) += memory.o
 lib-y                 += misc_$(BITS).o
 lib-$(CONFIG_SPARC32) += mp.o
-lib-$(CONFIG_SPARC32) += ranges.o
 lib-y                 += console_$(BITS).o
 lib-y                 += printf.o
 lib-y                 += tree_$(BITS).o
diff --git a/arch/sparc/prom/init_32.c b/arch/sparc/prom/init_32.c
index d20470166cb1..1681f1f980d4 100644
--- a/arch/sparc/prom/init_32.c
+++ b/arch/sparc/prom/init_32.c
@@ -67,8 +67,6 @@ void __init prom_init(struct linux_romvec *rp)
 
 	prom_meminit();
 
-	prom_ranges_init();
-
 	printk("PROMLIB: Sun Boot Prom Version %d Revision %d\n",
 	       romvec->pv_romvers, prom_rev);
 
diff --git a/arch/sparc/prom/ranges.c b/arch/sparc/prom/ranges.c
deleted file mode 100644
index 20cb828bc5f4..000000000000
--- a/arch/sparc/prom/ranges.c
+++ /dev/null
@@ -1,114 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * ranges.c: Handle ranges in newer proms for obio/sbus.
- *
- * Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
- * Copyright (C) 1997 Jakub Jelinek (jj@sunsite.mff.cuni.cz)
- */
-
-#include <linux/init.h>
-#include <linux/module.h>
-
-#include <asm/openprom.h>
-#include <asm/oplib.h>
-#include <asm/types.h>
-
-static struct linux_prom_ranges promlib_obio_ranges[PROMREG_MAX];
-static int num_obio_ranges;
-
-/* Adjust register values based upon the ranges parameters. */
-static void prom_adjust_regs(struct linux_prom_registers *regp, int nregs,
-			     struct linux_prom_ranges *rangep, int nranges)
-{
-	int regc, rngc;
-
-	for (regc = 0; regc < nregs; regc++) {
-		for (rngc = 0; rngc < nranges; rngc++)
-			if (regp[regc].which_io == rangep[rngc].ot_child_space)
-				break; /* Fount it */
-		if (rngc == nranges) /* oops */
-			prom_printf("adjust_regs: Could not find range with matching bus type...\n");
-		regp[regc].which_io = rangep[rngc].ot_parent_space;
-		regp[regc].phys_addr -= rangep[rngc].ot_child_base;
-		regp[regc].phys_addr += rangep[rngc].ot_parent_base;
-	}
-}
-
-static void prom_adjust_ranges(struct linux_prom_ranges *ranges1, int nranges1,
-			       struct linux_prom_ranges *ranges2, int nranges2)
-{
-	int rng1c, rng2c;
-
-	for (rng1c = 0; rng1c < nranges1; rng1c++) {
-		for (rng2c = 0; rng2c < nranges2; rng2c++)
-			if (ranges1[rng1c].ot_parent_space == ranges2[rng2c].ot_child_space &&
-			   ranges1[rng1c].ot_parent_base >= ranges2[rng2c].ot_child_base &&
-			   ranges2[rng2c].ot_child_base + ranges2[rng2c].or_size - ranges1[rng1c].ot_parent_base > 0U)
-			break;
-		if (rng2c == nranges2) /* oops */
-			prom_printf("adjust_ranges: Could not find matching bus type...\n");
-		else if (ranges1[rng1c].ot_parent_base + ranges1[rng1c].or_size > ranges2[rng2c].ot_child_base + ranges2[rng2c].or_size)
-			ranges1[rng1c].or_size = ranges2[rng2c].ot_child_base + ranges2[rng2c].or_size - ranges1[rng1c].ot_parent_base;
-		ranges1[rng1c].ot_parent_space = ranges2[rng2c].ot_parent_space;
-		ranges1[rng1c].ot_parent_base += ranges2[rng2c].ot_parent_base;
-	}
-}
-
-/* Apply probed obio ranges to registers passed, if no ranges return. */
-void prom_apply_obio_ranges(struct linux_prom_registers *regs, int nregs)
-{
-	if (num_obio_ranges)
-		prom_adjust_regs(regs, nregs, promlib_obio_ranges, num_obio_ranges);
-}
-EXPORT_SYMBOL(prom_apply_obio_ranges);
-
-void __init prom_ranges_init(void)
-{
-	phandle node, obio_node;
-	int success;
-
-	num_obio_ranges = 0;
-
-	/* Check for obio and sbus ranges. */
-	node = prom_getchild(prom_root_node);
-	obio_node = prom_searchsiblings(node, "obio");
-
-	if (obio_node) {
-		success = prom_getproperty(obio_node, "ranges",
-					   (char *) promlib_obio_ranges,
-					   sizeof(promlib_obio_ranges));
-		if (success != -1)
-			num_obio_ranges = (success / sizeof(struct linux_prom_ranges));
-	}
-
-	if (num_obio_ranges)
-		prom_printf("PROMLIB: obio_ranges %d\n", num_obio_ranges);
-}
-
-void prom_apply_generic_ranges(phandle node, phandle parent,
-			       struct linux_prom_registers *regs, int nregs)
-{
-	int success;
-	int num_ranges;
-	struct linux_prom_ranges ranges[PROMREG_MAX];
-
-	success = prom_getproperty(node, "ranges",
-				   (char *) ranges,
-				   sizeof(ranges));
-	if (success != -1) {
-		num_ranges = (success / sizeof(struct linux_prom_ranges));
-		if (parent) {
-			struct linux_prom_ranges parent_ranges[PROMREG_MAX];
-			int num_parent_ranges;
-
-			success = prom_getproperty(parent, "ranges",
-						   (char *) parent_ranges,
-						   sizeof(parent_ranges));
-			if (success != -1) {
-				num_parent_ranges = (success / sizeof(struct linux_prom_ranges));
-				prom_adjust_ranges(ranges, num_ranges, parent_ranges, num_parent_ranges);
-			}
-		}
-		prom_adjust_regs(regs, nregs, ranges, num_ranges);
-	}
-}

-- 
2.34.1

