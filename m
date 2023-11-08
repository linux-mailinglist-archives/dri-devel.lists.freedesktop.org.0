Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7CA7E5E67
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 20:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191A910E829;
	Wed,  8 Nov 2023 19:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [46.30.211.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F5110E829
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 19:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=t0PhdPpL9ITFkVHWShkqwebGTKveq1EAqYCULbPtu5I=;
 b=HOH6miiY3B+TPoRIYH1MiG21R2R+dh1yYG8FVwEQyDXIhn1Ao3kJLxPWfeHQZl9v5C+Z5Chab0l7C
 HikW4LWGdU4we9PVHZJww6fDwD1yj+77Jj5I/65wiERNQSINaBzToUrUeOoJSPC/FGkywpiTFZYc/w
 G5VUedzBJU7HvjvKlrHVnE6S2n/CsFEdiawBE7NIbof73jQYss2IVV4HvlcVLH+T8ZX3pzF6bx9t1o
 bMg34L0eMDuXbRC6rLKy6PjcIUoJKPRTeePAKA2fUAAx68YXNhrJFCda5nk8ULj+i07dneXw+hSXiH
 JNZyftfJd+q/T1+u1UqHapE9CdUwJnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=t0PhdPpL9ITFkVHWShkqwebGTKveq1EAqYCULbPtu5I=;
 b=xWIbuz4e/7unjVoPKeu7dePVTkZEjAQgGTQa2oJ1BHdQOZexDAZtyLcvnX3YqDagH5rAul9U45aVe
 EhYmmucCA==
X-HalOne-ID: 87baf6c1-7e6a-11ee-909c-a34c9b1f9040
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 87baf6c1-7e6a-11ee-909c-a34c9b1f9040;
 Wed, 08 Nov 2023 19:10:52 +0000 (UTC)
Date: Wed, 8 Nov 2023 20:10:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 09/22] [v2] arch: fix asm-offsets.c building with
 -Wmissing-prototypes
Message-ID: <20231108191050.GA171153@ravnborg.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108125843.3806765-10-arnd@kernel.org>
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
 linux-mips@vger.kernel.org, netdev@vger.kernel.org,
 Guo Ren <guoren@kernel.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-bcachefs@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 linux-csky@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 08, 2023 at 01:58:30PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When -Wmissing-prototypes is enabled, the some asm-offsets.c files fail
> to build, even when this warning is disabled in the Makefile for normal
> files:
> 
> arch/sparc/kernel/asm-offsets.c:22:5: error: no previous prototype for 'sparc32_foo' [-Werror=missing-prototypes]
> arch/sparc/kernel/asm-offsets.c:48:5: error: no previous prototype for 'foo' [-Werror=missing-prototypes]
> 
> Address this by making use of the same trick as x86, marking these
> functions as 'static __used' to avoid the need for a prototype
> by not drop them in dead-code elimination.
> 
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Link: https://lore.kernel.org/lkml/CAK7LNARfEmFk0Du4Hed19eX_G6tUC5wG0zP+L1AyvdpOF4ybXQ@mail.gmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Looks good. I sometimes looks at sparc patches so I looked at this one.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
