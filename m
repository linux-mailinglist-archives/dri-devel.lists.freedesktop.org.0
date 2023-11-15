Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B217E5767
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFCC10E745;
	Wed,  8 Nov 2023 13:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4605810E74B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:03:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F2379B81C63;
 Wed,  8 Nov 2023 13:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF2DC433B7;
 Wed,  8 Nov 2023 13:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699448578;
 bh=IRNty8bJM+niG8y7TBztVYxFiP9MOAPlR8MjQa49+Bw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tmkBSJz3VYamotMcUSRYyVTJpKvyfH4SHq0C7FsCwyVNJ4KSrjVdqRD1v6Vxxe82p
 MDc+Ta93r+CP7Di/Lj3tgf4btUtVcvWpA5v1wYl+QZ79Q5M8Wxv+Nw37+wWUZQ0Ko+
 HwJSB2Gx0RTGQ5mb+Isxh4TM28m0294JSbD9RIqZp4BVElmbGaNHuRy/I5r+moeoP1
 jCPaRo+RI83CtzxivdPD9wuzUbwRYtugqoZQvm3FEgnbzPIOJkizQnk58xDA/6Fp2d
 /ZO83W53G1V8AJ7fPeSVog3x78qsVn62ZKg1xrU4i9wzYrO9YJLHj3O6H5fDNPp6Ge
 1WoDxE5NsDvGw==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: [PATCH 16/22] bcachefs: mark bch2_target_to_text_sb() static
Date: Wed,  8 Nov 2023 13:58:37 +0100
Message-Id: <20231108125843.3806765-17-arnd@kernel.org>
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

bch2_target_to_text_sb() is only called in the file it is defined in,
and it has no extern prototype:

fs/bcachefs/disk_groups.c:583:6: error: no previous prototype for 'bch2_target_to_text_sb' [-Werror=missing-prototypes]

Mark it static to avoid the warning and have the code better optimized.

Fixes: bf0d9e89de2e ("bcachefs: Split apart bch2_target_to_text(), bch2_target_to_text_sb()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/bcachefs/disk_groups.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/disk_groups.c b/fs/bcachefs/disk_groups.c
index d613695abf9f..1f334124055b 100644
--- a/fs/bcachefs/disk_groups.c
+++ b/fs/bcachefs/disk_groups.c
@@ -580,7 +580,7 @@ void bch2_target_to_text(struct printbuf *out, struct bch_fs *c, unsigned v)
 	}
 }
 
-void bch2_target_to_text_sb(struct printbuf *out, struct bch_sb *sb, unsigned v)
+static void bch2_target_to_text_sb(struct printbuf *out, struct bch_sb *sb, unsigned v)
 {
 	struct target t = target_decode(v);
 
-- 
2.39.2

