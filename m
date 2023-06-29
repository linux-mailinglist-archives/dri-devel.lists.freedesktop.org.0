Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A66377426EF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 15:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D40110E3C6;
	Thu, 29 Jun 2023 13:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F88D10E3C6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1688043306; bh=qlzO1nAzqPvB+Hzmr0HgbCqGg7RmBSNwRMReUr64bck=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jUu9zRsEygCOa39ZCgxRiLbKjXTQyAk3/vq1UdG1rNhZGoBj1lnigTzep51CpGxAI
 Bi14AsqbPSnMerzIsKznCyRo9Sr6o9nEuXrSMeAlj3HQr2VxpcMMRF4Ii1rtyOqAct
 kG/wvCT5WHvifhVE0+KGx6hx6hBDjd766/gHEM8M=
Received: from [100.100.34.13] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D6696600AE;
 Thu, 29 Jun 2023 20:55:02 +0800 (CST)
Message-ID: <6906281a-baa8-a960-e679-69d1e714e713@xen0n.name>
Date: Thu, 29 Jun 2023 20:55:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 06/12] arch: Declare screen_info in <asm/screen_info.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-7-tzimmermann@suse.de>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230629121952.10559-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Rich Felker <dalias@libc.org>, Guo Ren <guoren@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 linux-staging@lists.linux.dev, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Juerg Haefliger <juerg.haefliger@canonical.com>,
 Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Chris Zankel <chris@zankel.net>,
 Frederic Weisbecker <frederic@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Zi Yan <ziy@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Brian Cain <bcain@quicinc.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, linux-alpha@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/6/29 19:45, Thomas Zimmermann wrote:
> The variable screen_info does not exist on all architectures. Declare
> it in <asm-generic/screen_info.h>. All architectures that do declare it
> will provide it via <asm/screen_info.h>.
> 
> Add the Kconfig token ARCH_HAS_SCREEN_INFO to guard against access on
> architectures that don't provide screen_info.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Brian Cain <bcain@quicinc.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Juerg Haefliger <juerg.haefliger@canonical.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Zi Yan <ziy@nvidia.com>
> ---
>   arch/Kconfig                      |  6 ++++++
>   arch/alpha/Kconfig                |  1 +
>   arch/arm/Kconfig                  |  1 +
>   arch/arm64/Kconfig                |  1 +
>   arch/csky/Kconfig                 |  1 +
>   arch/hexagon/Kconfig              |  1 +
>   arch/ia64/Kconfig                 |  1 +
>   arch/loongarch/Kconfig            |  1 +
>   arch/mips/Kconfig                 |  1 +
>   arch/nios2/Kconfig                |  1 +
>   arch/powerpc/Kconfig              |  1 +
>   arch/riscv/Kconfig                |  1 +
>   arch/sh/Kconfig                   |  1 +
>   arch/sparc/Kconfig                |  1 +
>   arch/x86/Kconfig                  |  1 +
>   arch/xtensa/Kconfig               |  1 +
>   drivers/video/Kconfig             |  3 +++
>   include/asm-generic/Kbuild        |  1 +
>   include/asm-generic/screen_info.h | 12 ++++++++++++
>   include/linux/screen_info.h       |  2 +-
>   20 files changed, 38 insertions(+), 1 deletion(-)
>   create mode 100644 include/asm-generic/screen_info.h
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 205fd23e0cada..2f58293fd7bcb 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1466,6 +1466,12 @@ config ARCH_HAS_NONLEAF_PMD_YOUNG
>   	  address translations. Page table walkers that clear the accessed bit
>   	  may use this capability to reduce their search space.
>   
> +config ARCH_HAS_SCREEN_INFO
> +	bool
> +	help
> +	  Selected by architectures that provide a global instance of
> +	  screen_info.
> +
>   source "kernel/gcov/Kconfig"
>   
>   source "scripts/gcc-plugins/Kconfig"
> [snip]
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index d38b066fc931b..6aab2fb7753da 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -13,6 +13,7 @@ config LOONGARCH
>   	select ARCH_HAS_FORTIFY_SOURCE
>   	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>   	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_SCREEN_INFO
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_INLINE_READ_LOCK if !PREEMPTION
>   	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
> [snip]

Acked-by: WANG Xuerui <git@xen0n.name> # loongarch

Thanks!

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

