Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CEA7BF899
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 12:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F42110E1CA;
	Tue, 10 Oct 2023 10:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A2010E1CA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 10:26:26 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-59f4db9e11eso64637627b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 03:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696933585; x=1697538385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbmON3xp7LlIs9AFrDaNfaYi2KFfIcOVngy3VzyA1Hk=;
 b=dKUCopleFHdMZt9EtDHyMb39OdJ9sUcbq0I27754KW3WsSQNoYpxt9YCbMnn2gkm/G
 Wr96c9QZSWmRU1uGQkHGuJY9iE7uhq63Om//+JQDj/0RxnfKkkkTM+uquV575KL8O6EK
 ACSP9SacqWW+W1D5whWs/I/+YzwKMCpVioZxGfjgA2DzkYfLFzl7h4zwdNuUAILhPsHy
 yeKiy9QgWLazcPyGA8gNy+JHtIvtojt8A3ZeOXwgqtH0WDcH0m6Y5HGHuSJdG46DBzSF
 a50phw79KejLDyy+2n+BGog/6cQqDaUdoFqkHkalZHTL1aEYOrIyQprPfoxEipThjlxR
 qRQQ==
X-Gm-Message-State: AOJu0YwzGHJPtB30LmrHvwtwLYtJHitVMc0AMJ3WJrweCGtbY9ziepB/
 uoQdH+irBJOvcsoCVkhh6NrhyGozjMQpqA==
X-Google-Smtp-Source: AGHT+IFl6SZgXYyqew0kA+SCCrgLs4nfjzbc2q1z+0zOtjKX8D2lnyrMH8O1rHOtCgkPXOixd4nCEg==
X-Received: by 2002:a81:9bd2:0:b0:5a7:af7d:cee7 with SMTP id
 s201-20020a819bd2000000b005a7af7dcee7mr2675209ywg.6.1696933585502; 
 Tue, 10 Oct 2023 03:26:25 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 r32-20020a814420000000b005a7afc19e8dsm690112ywa.28.2023.10.10.03.26.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 03:26:24 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5a7af52ee31so13934997b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 03:26:24 -0700 (PDT)
X-Received: by 2002:a81:8647:0:b0:595:89b0:6b56 with SMTP id
 w68-20020a818647000000b0059589b06b56mr20014839ywf.28.1696933584327; Tue, 10
 Oct 2023 03:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231009211845.3136536-1-arnd@kernel.org>
 <20231009211845.3136536-2-arnd@kernel.org>
In-Reply-To: <20231009211845.3136536-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Oct 2023 12:26:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6MFLCOe4BSWr5oVC4JcLpBS+2PvQsoSEWMLRAFpvaGA@mail.gmail.com>
Message-ID: <CAMuHMdU6MFLCOe4BSWr5oVC4JcLpBS+2PvQsoSEWMLRAFpvaGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] vgacon: rework Kconfig dependencies
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>,
 linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
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

Hi Arnd,

On Mon, Oct 9, 2023 at 11:19=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The list of dependencies here is phrased as an opt-out, but this is missi=
ng
> a lot of architectures that don't actually support VGA consoles, and some
> of the entries are stale:
>
>  - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>    the merged arch/powerpc never did
>
>  - arm lists footbridge, integrator and netwinder, but netwinder is actua=
lly
>    part of footbridge, and integrator does not appear to have an actual
>    VGA hardware, or list it in its ATAG or DT.
>
>  - mips has a few platforms (malta, sibyte, and sni) that initialize
>    screen_info, on everything else the console is selected but cannot
>    actually work.
>
>  - csky, hexgagon, loongarch, nios2, riscv and xtensa are not listed
>    in the opt-out table and declare a screen_info to allow building
>    vga_con, but this cannot work because the console is never selected.
>
> Replace this with an opt-in table that lists only the platforms that
> remain. This is effectively x86, plus a couple of historic workstation
> and server machines that reused parts of the x86 system architecture.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Khalid Aziz <khalid@gonehiking.org>
> Acked-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

A few suggestions for simplification below...

> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -7,9 +7,9 @@ menu "Console display driver support"
>
>  config VGA_CONSOLE
>         bool "VGA text console" if EXPERT || !X86
> -       depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SU=
PERH && \
> -               (!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWI=
NDER) && \
> -               !ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !U=
ML
> +       depends on ALPHA || IA64 || X86 || \
> +               (ARM && ARCH_FOOTBRIDGE) || \

You can drop "ARM &&", as it is implied by ARCH_FOOTBRIDGE.

> +               (MIPS && (MIPS_MALTA || SIBYTE_BCM112X || SIBYTE_SB1250 |=
| SIBYTE_BCM1x80 || SNI_RM))

Likewise for "MIPS &&".

The 3 SIBYTE dependencies can be replaced by SIBYTE_SB1xxx_SOC.

>         select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
>         default y
>         help

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
