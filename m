Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F357E5888
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 15:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EA910E768;
	Wed,  8 Nov 2023 14:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD3A10E768
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=oPbIgwC0BijVgGIquFkJt/4vZ7saVONMlD6xtHIWlpI=; b=Ce8QxVd4WKG0h9ztVM/Vn/nozc
 8DRtZ9C1JiuIIVlzxZxS+Ui3PxxM3jqb/akrMqXYO3WvQUBJmaQyrGweyeK/v/2+8fZJtis97EdQ/
 Z2OUj+WkOgKAiPwjdTmxLpAN/0e+qc+yEGVcCGOKaE6IPc3x5sP1qOZYrVD/iYkmeJ7ckobeBHTNA
 IarXDpeU/s6fQAOkNZdunXkH+NJj5F0m3DXdHv+wbdxzqwV/TXUawSYG3lJPeRoYipVWG2Yq80nQd
 BOosblKbS23sgiPA/jNunjiRIP4lrtzpk4Tekhmsx6ugm9zT+y/qPe6q2ru9aKlrV+bDPpPIT9NHA
 JfjaNGoA==;
Received: from [2001:8a0:6c72:c100:c7fb:dbc0:2c8e:ab9a]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r0jNp-001S65-JA; Wed, 08 Nov 2023 14:18:18 +0000
Message-ID: <1b3ccc4a-41f7-46ad-9c5c-5ef44a96426e@infradead.org>
Date: Wed, 8 Nov 2023 14:18:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/22] powerpc: ps3: move udbg_shutdown_ps3gelic prototype
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-18-arnd@kernel.org>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20231108125843.3806765-18-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 linux-csky@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Andy Lutomirski <luto@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Timur Tabi <timur@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

Hi Arnd,

On 11/8/23 12:58, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Allmodconfig kernels produce a missing-prototypes warning:
> 
> arch/powerpc/platforms/ps3/gelic_udbg.c:239:6: error: no previous prototype for 'udbg_shutdown_ps3gelic' [-Werror=missing-prototypes]
> 
> Move the declaration from a local header to asm/ps3.h where it can be
> seen from both the caller and the definition.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/powerpc/include/asm/ps3.h               | 6 ++++++
>  arch/powerpc/platforms/ps3/gelic_udbg.c      | 1 +
>  drivers/net/ethernet/toshiba/ps3_gelic_net.h | 6 ------
>  3 files changed, 7 insertions(+), 6 deletions(-)

Seems good to me.  I'll test it next chance I get.

Signed-off-by: Geoff Levand <geoff@infradead.org>


