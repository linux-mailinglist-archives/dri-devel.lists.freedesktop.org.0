Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA0808826
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 13:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCDB10E894;
	Thu,  7 Dec 2023 12:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C4810E894
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 12:44:29 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVL0kpKz4xGR;
 Thu,  7 Dec 2023 23:44:10 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH 00/22] -Wmissing-prototype warning fixes
Message-Id: <170195271155.2310221.7822619081586355844.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org,
	x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Ard Biesheuvel <ardb@kernel.org>, linux-bcachefs@vger.kernel.org,
	Ingo Molna r <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
	linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Lutomirski <luto@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, l.org@freedesktop.org,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kerne, linux-parisc@vger.kernel.org,
	Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Al Viro <viro@zeniv.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Nov 2023 13:58:21 +0100, Arnd Bergmann wrote:
> I slightly dropped the ball on this since last sending the series in
> August, but a number of warning fixes have made it into the kernel in
> the meantime, both from my earlier submission and from architecture
> maintainers.
> 
> I have none patches that remain from the previous submission, with
> two of them reworked according to comments. The additional patches
> are from more testing across architectures and configurations that
> I had previously missed.
> 
> [...]

Applied to powerpc/next.

[17/22] powerpc: ps3: move udbg_shutdown_ps3gelic prototype
        https://git.kernel.org/powerpc/c/04c40eed3f7ac48ddaf20104489510e743a53c47
[18/22] powerpc: pasemi: mark pas_shutdown() static
        https://git.kernel.org/powerpc/c/0c9a768de64d24e38e27652b8c273725ccc31916
[19/22] powerpc: powermac: mark smp_psurge_{give,take}_timebase static
        https://git.kernel.org/powerpc/c/afb36ac386783d2ef2ed839293c03fd06f470be0

cheers
