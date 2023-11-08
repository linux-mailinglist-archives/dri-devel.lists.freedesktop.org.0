Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97D7E5F57
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 21:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC80C10E19C;
	Wed,  8 Nov 2023 20:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A3D10E19C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 20:42:54 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5845a94dae1so86520eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 12:42:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699476173; x=1700080973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dYbfzdavLbBO2X96qC9Jj/xBig9KkpEQ+EQytSx8qtw=;
 b=SJyASw3tL/XTcBYher1ZGkx4R78o/khyK6gheFfDuLSukxzC6XpIUhcaFLFEwwYUqy
 VWr8I0nAJPtpr2h5GKjX3ufTxtN392zKTbw/DUWo4FnccN76RyWkXz87X1wjxqGka1QO
 o7SnslCrMkgbHq1R04rdhOsw4He5Y/TKMn0v2eN90fDIJ2lj3eQLnEMkMGYcxHxnr12z
 V0+8aq6TdQD5nb+nBL4/5qOxoRtJKkQSegjBxy2uy+hboVEhEDKUqZynoiDxeSaD0ATg
 rEo2PGJqsA2Vi9qsjyBDFsDYkk2FAZOQLacfX4UBCzgcD4BxCvRACaJBk5xnW9zGfy/g
 uVUw==
X-Gm-Message-State: AOJu0YySioaC9qEjWzJ82DC5t6KNuP4fdNk3408oVVwn7667iIENM3Gy
 MxxUWN2Pqxb5a5xd/T1RlEyjuugpHxXDCg==
X-Google-Smtp-Source: AGHT+IG6S7WWU1bqDPZcOHgSYxac3Nft4hSPN2DnpQMky3aJuK82kaCvwMN0oPA+890b2KdSk2kINg==
X-Received: by 2002:a4a:d10c:0:b0:581:3f2b:ca53 with SMTP id
 k12-20020a4ad10c000000b005813f2bca53mr1651195oor.1.1699476173501; 
 Wed, 08 Nov 2023 12:42:53 -0800 (PST)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
 [209.85.210.50]) by smtp.gmail.com with ESMTPSA id
 64-20020a4a0943000000b0057b43a25deasm2605811ooa.3.2023.11.08.12.42.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 12:42:52 -0800 (PST)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6d3260385b5so89097a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 12:42:51 -0800 (PST)
X-Received: by 2002:a81:4756:0:b0:59f:699b:c3b3 with SMTP id
 u83-20020a814756000000b0059f699bc3b3mr5987326ywa.0.1699476150732; Wed, 08 Nov
 2023 12:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-11-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-11-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Nov 2023 21:42:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Message-ID: <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init()
 prototype
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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

Hi Arnd,

On Wed, Nov 8, 2023 at 2:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Microblaze runs into a single -Wmissing-prototypes warning when that is
> enabled:
>
> arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype for '=
trap_init' [-Wmissing-prototypes]
>
> Include the right header to avoid this.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

>  arch/alpha/kernel/traps.c      | 1 +
>  arch/csky/include/asm/traps.h  | 2 --
>  arch/csky/kernel/traps.c       | 1 +
>  arch/m68k/coldfire/vectors.c   | 3 +--
>  arch/m68k/coldfire/vectors.h   | 3 ---

Ah, so this is where the m68k changes listed in the cover letter are
hiding ;-)

>  arch/microblaze/kernel/traps.c | 1 +
>  arch/sparc/kernel/traps_32.c   | 1 +
>  arch/sparc/kernel/traps_64.c   | 1 +
>  arch/x86/include/asm/traps.h   | 1 -
>  arch/x86/kernel/traps.c        | 1 +
>  10 files changed, 7 insertions(+), 8 deletions(-)
>  delete mode 100644 arch/m68k/coldfire/vectors.h

Obviously the non-microblaze changes should be spun off in separate
patches.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
