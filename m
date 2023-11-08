Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED78D7E5FBD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 22:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0900710E85C;
	Wed,  8 Nov 2023 21:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A5610E85C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 21:10:38 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3b2ea7cc821so83295b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 13:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699477837; x=1700082637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bav5/FGayyEQonBNC4kdS6ICDtnFE4p01QngumR4dg4=;
 b=SO9de9FGMvN/dBqn3FIQlbdrEOqV2W4EmSNGHjn49GOuHgt6oliXfzkE6A6tuWbVvO
 8yVcjYry6rRK6rw/3BVcyhRGmGkcuQx5lDKFOzAz29btCJMOjtSjNWxskXr/n0+6ytbl
 pO1HLbrPbIyPi9dg2Oj1MXrY/zE1i8p4jt9fL/Ww68pLDW0bSscmOF5OXSzUu0jAP2EG
 oBs/N4qHbuROpPP43v8Dd7KeCnJOTBXTC9++GPMqpFC1qU2TCeV4xyyxHw2jOs630FSc
 qF27QFOjlR5IWdrdP3j5n+IT/evPqydsGjUjztJbLfODnnXzlcyVabvqHogOqNqzVCQd
 hajA==
X-Gm-Message-State: AOJu0Yzm5uNyT5VHTfLgxcVDk15F/+cgZdPHHxUf2OhiF/wg/vxgHYuB
 pwvJN29UoikfZwmZOt+pr+Ia6Wi4UIOXyA==
X-Google-Smtp-Source: AGHT+IEue5g5O3yxejP8FvyBGqrOl8tfafWFIw0m+6B0VYfWQipVhTwi9hyIw04NTEy9E0e6YcVP4Q==
X-Received: by 2002:a05:6808:1a18:b0:3ae:16b6:6346 with SMTP id
 bk24-20020a0568081a1800b003ae16b66346mr3904140oib.7.1699477837180; 
 Wed, 08 Nov 2023 13:10:37 -0800 (PST)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
 [209.85.210.47]) by smtp.gmail.com with ESMTPSA id
 14-20020aca0f0e000000b003b2f3fb081csm2019204oip.51.2023.11.08.13.10.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 13:10:36 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6cd09f51fe0so56804a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 13:10:36 -0800 (PST)
X-Received: by 2002:a0d:f3c2:0:b0:59b:54b5:7d66 with SMTP id
 c185-20020a0df3c2000000b0059b54b57d66mr2960037ywf.34.1699477816210; Wed, 08
 Nov 2023 13:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-11-arnd@kernel.org>
 <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
 <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
In-Reply-To: <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Nov 2023 22:10:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7VfiSA9+wSJYYQkBN2=4E9HsFJRV6j8ffioe0=MFd8A@mail.gmail.com>
Message-ID: <CAMuHMdV7VfiSA9+wSJYYQkBN2=4E9HsFJRV6j8ffioe0=MFd8A@mail.gmail.com>
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init()
 prototype
To: Arnd Bergmann <arnd@arndb.de>
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
 linux-mips@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 guoren <guoren@kernel.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Ard Biesheuvel <ardb@kernel.org>,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>,
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
 David Woodhouse <dwmw2@infradead.org>,
 "David S . Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Wed, Nov 8, 2023 at 10:07=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Wed, Nov 8, 2023, at 21:42, Geert Uytterhoeven wrote:
> > On Wed, Nov 8, 2023 at 2:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> =
wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> Microblaze runs into a single -Wmissing-prototypes warning when that i=
s
> >> enabled:
> >>
> >> arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype fo=
r 'trap_init' [-Wmissing-prototypes]
> >>
> >> Include the right header to avoid this.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Thanks for your patch!
> >
> >>  arch/alpha/kernel/traps.c      | 1 +
> >>  arch/csky/include/asm/traps.h  | 2 --
> >>  arch/csky/kernel/traps.c       | 1 +
> >>  arch/m68k/coldfire/vectors.c   | 3 +--
> >>  arch/m68k/coldfire/vectors.h   | 3 ---
> >
> > Ah, so this is where the m68k changes listed in the cover letter are
> > hiding ;-)
> >
> >>  arch/microblaze/kernel/traps.c | 1 +
> >>  arch/sparc/kernel/traps_32.c   | 1 +
> >>  arch/sparc/kernel/traps_64.c   | 1 +
> >>  arch/x86/include/asm/traps.h   | 1 -
> >>  arch/x86/kernel/traps.c        | 1 +
> >>  10 files changed, 7 insertions(+), 8 deletions(-)
> >>  delete mode 100644 arch/m68k/coldfire/vectors.h
> >
> > Obviously the non-microblaze changes should be spun off in separate
> > patches.
>
> I messed up one of my rebases here and accidentally sent
> the wrong changelog text. My intention was to have the
> combined patch but with this text:
>
>     arch: include linux/cpu.h for trap_init() prototype
>
>     some architectures run into a -Wmissing-prototypes warning
>     for trap_init()
>
>     arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype f=
or 'trap_init' [-Wmissing-prototypes]
>
>     Include the right header to avoid this consistently, removing
>     the extra declarations on m68k and x86 that were added as local
>     workarounds already.
>
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>

That makes sense, although it's hard to combine this with "my preference
would be for the patches to make it through the respective subsystem
maintainer trees"...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
