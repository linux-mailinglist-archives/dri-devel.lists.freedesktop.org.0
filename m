Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE617E56F6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392B110E73D;
	Wed,  8 Nov 2023 13:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A57C10E73D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:00:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F15ACE109D;
 Wed,  8 Nov 2023 13:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3C9C43395;
 Wed,  8 Nov 2023 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699448431;
 bh=K9YdPzoARD4njnEo80jUrY+DZkb+0aAdqYzClA8UgAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HyUdTwUXtZOlnyvxdNKc+kj+jb0JvSjpSyNuNfinD/hOMX3R5j5WCRvrkFeKCIoaK
 dck1LhuXouzgxrjEZ+GfXmwACWuIHu7Z5T4tv5Ur3mBUern292mV3o4hHeM6goJmTl
 07hDeR7Iqhwa3/f+qzmGQajf1dFdpx/z/q8jYxJI4nnayQSqsNQMlgpL0fthML/+e1
 RUA1p/Ek88IwoPkFfFrEZT9/Y2MOyc8v/2srZE3JErq77d73XQLbdWL9p5SFFwRzqp
 V4Zk/JhktD/mAeNqOSIIMV3pGJDyvfJKmq7usGaEaG4ltRDerYT+4+zq3kRGWGhqoG
 rX6LOl910Dk3Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: [PATCH 06/22] [RESEND] stackleak: add declarations for global
 functions
Date: Wed,  8 Nov 2023 13:58:27 +0100
Message-Id: <20231108125843.3806765-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>,
 linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Ard Biesheuvel <ardb@kernel.org>, linux-bcachefs@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 linux-csky@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Andy Lutomirski <luto@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-mips@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

With -Wmissing-prototypes enabled, the stackleak code produces a couple of
warnings that have no declarations because they are only called from assembler:

stackleak.c:127:25: error: no previous prototype for 'stackleak_erase' [-Werror=missing-prototypes]
stackleak.c:139:25: error: no previous prototype for 'stackleak_erase_on_task_stack' [-Werror=missing-prototypes]
stackleak.c:151:25: error: no previous prototype for 'stackleak_erase_off_task_stack' [-Werror=missing-prototypes]
stackleak.c:159:49: error: no previous prototype for 'stackleak_track_stack' [-Werror=missing-prototypes]

Add declarations to the stackleak header to shut up the warnings.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/stackleak.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/stackleak.h b/include/linux/stackleak.h
index c36e7a3b45e7..3be2cb564710 100644
--- a/include/linux/stackleak.h
+++ b/include/linux/stackleak.h
@@ -14,6 +14,7 @@
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 #include <asm/stacktrace.h>
+#include <linux/linkage.h>
 
 /*
  * The lowest address on tsk's stack which we can plausibly erase.
@@ -76,6 +77,11 @@ static inline void stackleak_task_init(struct task_struct *t)
 # endif
 }
 
+asmlinkage void noinstr stackleak_erase(void);
+asmlinkage void noinstr stackleak_erase_on_task_stack(void);
+asmlinkage void noinstr stackleak_erase_off_task_stack(void);
+void __no_caller_saved_registers noinstr stackleak_track_stack(void);
+
 #else /* !CONFIG_GCC_PLUGIN_STACKLEAK */
 static inline void stackleak_task_init(struct task_struct *t) { }
 #endif
-- 
2.39.2

