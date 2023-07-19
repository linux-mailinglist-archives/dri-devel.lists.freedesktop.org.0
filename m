Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CE75956C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 14:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8441A10E494;
	Wed, 19 Jul 2023 12:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9B510E494
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 12:40:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A82361666;
 Wed, 19 Jul 2023 12:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C1FC43395;
 Wed, 19 Jul 2023 12:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689770448;
 bh=Zj4qMdB+kdRnCA5GmyWBhlkXMmOYN6ga97/WSRarSdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CW+5Fzwl9GvF1zpGL5WabF11xRyzz4NfXJ7TLrfdCsSY7QMKWK+XFmteHNdetz5Wm
 8V/jFnCnlCzEPbd0gfjrLIMFUQ837BTflCU4yTEjvDRAAnofufXgsjx48XYlrnM5vQ
 dr/BjO5+SJPPfE/wpTPmhl+Fe6lJTcDJfqM+3et15MZQZGBahrwv5cJQVm5sKVJL41
 k5Vjy7NobNYucgsojt+CRCpbgrYD12JbOQK+uWUg9NbohhAr7lMa47HFwDezpF4JfN
 mqLANz754LA1YAvVNtkHg/HYJwzBYju5kHekQlFi3NNOxFAyOgyjWJmRE2xOUAoxGZ
 QAcGO35O87DPw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2 4/9] vgacon, arch/*: remove unused screen_info definitions
Date: Wed, 19 Jul 2023 14:39:39 +0200
Message-Id: <20230719123944.3438363-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719123944.3438363-1-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Huacai Chen <chenhuacai@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Palmer Dabbelt <palmer@rivosinc.com>,
 loongarch@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

A number of architectures either kept the screen_info definition for
historical purposes as it used to be required by the generic VT code, or
they copied it from another architecture in order to build the VGA console
driver in an allmodconfig build. The mips definition is used by some
platforms, but the initialization on jazz is not needed.

Now that vgacon no longer builds on these architectures, remove the
stale definitions and initializations.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/kernel/setup.c          | 12 ------------
 arch/hexagon/kernel/Makefile      |  2 --
 arch/hexagon/kernel/screen_info.c |  3 ---
 arch/mips/jazz/setup.c            |  9 ---------
 arch/nios2/kernel/setup.c         |  5 -----
 arch/sh/kernel/setup.c            |  5 -----
 arch/sparc/kernel/setup_32.c      | 13 -------------
 arch/sparc/kernel/setup_64.c      | 13 -------------
 arch/xtensa/kernel/setup.c        | 12 ------------
 9 files changed, 74 deletions(-)
 delete mode 100644 arch/hexagon/kernel/screen_info.c

diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
index 106fbf0b6f3b4..51012e90780d6 100644
--- a/arch/csky/kernel/setup.c
+++ b/arch/csky/kernel/setup.c
@@ -8,22 +8,10 @@
 #include <linux/of_fdt.h>
 #include <linux/start_kernel.h>
 #include <linux/dma-map-ops.h>
-#include <linux/screen_info.h>
 #include <asm/sections.h>
 #include <asm/mmu_context.h>
 #include <asm/pgalloc.h>
 
-#ifdef CONFIG_DUMMY_CONSOLE
-struct screen_info screen_info = {
-	.orig_video_lines	= 30,
-	.orig_video_cols	= 80,
-	.orig_video_mode	= 0,
-	.orig_video_ega_bx	= 0,
-	.orig_video_isVGA	= 1,
-	.orig_video_points	= 8
-};
-#endif
-
 static void __init csky_memblock_init(void)
 {
 	unsigned long lowmem_size = PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET_OFFSET);
diff --git a/arch/hexagon/kernel/Makefile b/arch/hexagon/kernel/Makefile
index e73cb321630ec..3fdf937eb572e 100644
--- a/arch/hexagon/kernel/Makefile
+++ b/arch/hexagon/kernel/Makefile
@@ -17,5 +17,3 @@ obj-y += vm_vectors.o
 obj-$(CONFIG_HAS_DMA) += dma.o
 
 obj-$(CONFIG_STACKTRACE) += stacktrace.o
-
-obj-$(CONFIG_VGA_CONSOLE) += screen_info.o
diff --git a/arch/hexagon/kernel/screen_info.c b/arch/hexagon/kernel/screen_info.c
deleted file mode 100644
index 1e1ceb18bafe7..0000000000000
--- a/arch/hexagon/kernel/screen_info.c
+++ /dev/null
@@ -1,3 +0,0 @@
-#include <linux/screen_info.h>
-
-struct screen_info screen_info;
diff --git a/arch/mips/jazz/setup.c b/arch/mips/jazz/setup.c
index ee044261eb223..23059ead773fc 100644
--- a/arch/mips/jazz/setup.c
+++ b/arch/mips/jazz/setup.c
@@ -13,7 +13,6 @@
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/console.h>
-#include <linux/screen_info.h>
 #include <linux/platform_device.h>
 #include <linux/serial_8250.h>
 #include <linux/dma-mapping.h>
@@ -76,14 +75,6 @@ void __init plat_mem_setup(void)
 
 	_machine_restart = jazz_machine_restart;
 
-#ifdef CONFIG_VT
-	screen_info = (struct screen_info) {
-		.orig_video_cols	= 160,
-		.orig_video_lines	= 64,
-		.orig_video_points	= 16,
-	};
-#endif
-
 	add_preferred_console("ttyS", 0, "9600");
 }
 
diff --git a/arch/nios2/kernel/setup.c b/arch/nios2/kernel/setup.c
index 8582ed9658447..da122a5fa43b2 100644
--- a/arch/nios2/kernel/setup.c
+++ b/arch/nios2/kernel/setup.c
@@ -19,7 +19,6 @@
 #include <linux/memblock.h>
 #include <linux/initrd.h>
 #include <linux/of_fdt.h>
-#include <linux/screen_info.h>
 
 #include <asm/mmu_context.h>
 #include <asm/sections.h>
@@ -36,10 +35,6 @@ static struct pt_regs fake_regs = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 					0, 0, 0, 0, 0, 0,
 					0};
 
-#ifdef CONFIG_VT
-struct screen_info screen_info;
-#endif
-
 /* Copy a short hook instruction sequence to the exception address */
 static inline void copy_exception_handler(unsigned int addr)
 {
diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index b3da2757faaf3..3d80515298d26 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -7,7 +7,6 @@
  *  Copyright (C) 1999  Niibe Yutaka
  *  Copyright (C) 2002 - 2010 Paul Mundt
  */
-#include <linux/screen_info.h>
 #include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/initrd.h>
@@ -69,10 +68,6 @@ EXPORT_SYMBOL(cpu_data);
 struct sh_machine_vector sh_mv = { .mv_name = "generic", };
 EXPORT_SYMBOL(sh_mv);
 
-#ifdef CONFIG_VT
-struct screen_info screen_info;
-#endif
-
 extern int root_mountflags;
 
 #define RAMDISK_IMAGE_START_MASK	0x07FF
diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
index 34ef7febf0d56..e3b72a7b46d37 100644
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -17,7 +17,6 @@
 #include <linux/initrd.h>
 #include <asm/smp.h>
 #include <linux/user.h>
-#include <linux/screen_info.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/seq_file.h>
@@ -51,18 +50,6 @@
 
 #include "kernel.h"
 
-struct screen_info screen_info = {
-	0, 0,			/* orig-x, orig-y */
-	0,			/* unused */
-	0,			/* orig-video-page */
-	0,			/* orig-video-mode */
-	128,			/* orig-video-cols */
-	0,0,0,			/* ega_ax, ega_bx, ega_cx */
-	54,			/* orig-video-lines */
-	0,                      /* orig-video-isVGA */
-	16                      /* orig-video-points */
-};
-
 /* Typing sync at the prom prompt calls the function pointed to by
  * romvec->pv_synchook which I set to the following function.
  * This should sync all filesystems and return, for now it just
diff --git a/arch/sparc/kernel/setup_64.c b/arch/sparc/kernel/setup_64.c
index 6546ca9d4d3f1..6a4797dec34b4 100644
--- a/arch/sparc/kernel/setup_64.c
+++ b/arch/sparc/kernel/setup_64.c
@@ -15,7 +15,6 @@
 #include <linux/ptrace.h>
 #include <asm/smp.h>
 #include <linux/user.h>
-#include <linux/screen_info.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/seq_file.h>
@@ -68,18 +67,6 @@
 DEFINE_SPINLOCK(ns87303_lock);
 EXPORT_SYMBOL(ns87303_lock);
 
-struct screen_info screen_info = {
-	0, 0,			/* orig-x, orig-y */
-	0,			/* unused */
-	0,			/* orig-video-page */
-	0,			/* orig-video-mode */
-	128,			/* orig-video-cols */
-	0, 0, 0,		/* unused, ega_bx, unused */
-	54,			/* orig-video-lines */
-	0,                      /* orig-video-isVGA */
-	16                      /* orig-video-points */
-};
-
 static void
 prom_console_write(struct console *con, const char *s, unsigned int n)
 {
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index aba3ff4e60d85..3f22d0537818d 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -19,7 +19,6 @@
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/proc_fs.h>
-#include <linux/screen_info.h>
 #include <linux/kernel.h>
 #include <linux/percpu.h>
 #include <linux/reboot.h>
@@ -49,17 +48,6 @@
 #include <asm/timex.h>
 #include <asm/traps.h>
 
-#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_DUMMY_CONSOLE)
-struct screen_info screen_info = {
-	.orig_x = 0,
-	.orig_y = 24,
-	.orig_video_cols = 80,
-	.orig_video_lines = 24,
-	.orig_video_isVGA = 1,
-	.orig_video_points = 16,
-};
-#endif
-
 #ifdef CONFIG_BLK_DEV_INITRD
 extern unsigned long initrd_start;
 extern unsigned long initrd_end;
-- 
2.39.2

