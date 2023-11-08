Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959AE7E56FE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF0210E73F;
	Wed,  8 Nov 2023 13:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C120010E73F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:00:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9D321CE10D2;
 Wed,  8 Nov 2023 13:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32BFC433C7;
 Wed,  8 Nov 2023 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699448446;
 bh=AsWQYHzG9sipb7sEr1JLntaPFi93f1pC9EyAKGQfMYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IVsQ8P2dntVCqOp290JiIjSeAiJc+VMO2pw8M5wXect2MBBRk+jOoldL7GU96ZMeA
 HuTE9Cemzwdgusy0jqMNAGrkZljxwDe/bga3g2m7k9eEuDPGq3KBsmaI6dmPkl/wlE
 2sJ8x5zpsds68NNoBAImql8aGu/sRESukQSJx2yQtofDYlD6qoDUcqJIsRbgMEAgD5
 pBWkZwSHNGyEjrYKkBLIDiDk/X/C6tnjuGAPAvyQxIP+Clu91AntgrZdhbNIFgmOBm
 NDqic6B3ehDAmy+JcPX7W+ZFcv2EJF1l6Qv/grGtIBAqxH+1Q7icIKEapV1+6GP4HA
 hAP9sw3MNsZDA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: [PATCH 07/22] [RESEND] sched: fair: move unused stub functions to
 header
Date: Wed,  8 Nov 2023 13:58:28 +0100
Message-Id: <20231108125843.3806765-8-arnd@kernel.org>
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

These four functions have a normal definition for CONFIG_FAIR_GROUP_SCHED,
and empty one that is only referenced when FAIR_GROUP_SCHED is disabled
but CGROUP_SCHED is still enabled. If both are turned off, the functions
are still defined but the misisng prototype causes a W=1 warning:

kernel/sched/fair.c:12544:6: error: no previous prototype for 'free_fair_sched_group'
kernel/sched/fair.c:12546:5: error: no previous prototype for 'alloc_fair_sched_group'
kernel/sched/fair.c:12553:6: error: no previous prototype for 'online_fair_sched_group'
kernel/sched/fair.c:12555:6: error: no previous prototype for 'unregister_fair_sched_group'

Move the alternatives into the header as static inline functions with
the correct combination of #ifdef checks to avoid the warning without
adding even more complexity.

[A different patch with the same description got applied by accident
 and was later reverted, but the original patch is still missing]

Fixes: 7aa55f2a5902 ("sched/fair: Move unused stub functions to header")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
A patch with the same commit log has
---
 kernel/sched/fair.c  | 13 -------------
 kernel/sched/sched.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2048138ce54b..82b82fa1d81b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12927,19 +12927,6 @@ int sched_group_set_idle(struct task_group *tg, long idle)
 	return 0;
 }
 
-#else /* CONFIG_FAIR_GROUP_SCHED */
-
-void free_fair_sched_group(struct task_group *tg) { }
-
-int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
-{
-	return 1;
-}
-
-void online_fair_sched_group(struct task_group *tg) { }
-
-void unregister_fair_sched_group(struct task_group *tg) { }
-
 #endif /* CONFIG_FAIR_GROUP_SCHED */
 
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 2e5a95486a42..8f5df5250b8d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -436,10 +436,21 @@ static inline int walk_tg_tree(tg_visitor down, tg_visitor up, void *data)
 
 extern int tg_nop(struct task_group *tg, void *data);
 
+#ifdef CONFIG_FAIR_GROUP_SCHED
 extern void free_fair_sched_group(struct task_group *tg);
 extern int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent);
 extern void online_fair_sched_group(struct task_group *tg);
 extern void unregister_fair_sched_group(struct task_group *tg);
+#else
+static inline void free_fair_sched_group(struct task_group *tg) { }
+static inline int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
+{
+       return 1;
+}
+static inline void online_fair_sched_group(struct task_group *tg) { }
+static inline void unregister_fair_sched_group(struct task_group *tg) { }
+#endif
+
 extern void init_tg_cfs_entry(struct task_group *tg, struct cfs_rq *cfs_rq,
 			struct sched_entity *se, int cpu,
 			struct sched_entity *parent);
-- 
2.39.2

