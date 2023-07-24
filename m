Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0DB75F5AA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 14:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B8810E2DE;
	Mon, 24 Jul 2023 12:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC4D10E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 12:07:59 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-7837329a00aso187419339f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 05:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690200479; x=1690805279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nNGOJzgymf6gQYpdxd2UIkw90HSJ+oAIVzOwuAShWk=;
 b=AGnyacAtQgTQdB9sxdspjAr/0gBEbGnzHtdv9A5PSwPd8hyLTaDVdnNJ6g2z3ADHXB
 /JNWfq+M4uG9ic7piypv6CW+ZxuapLSr4BbkS/PatgJsmWY3O06tORkuMkrWFvon5Htf
 t6m6kb2RyozMDds9MU9aTX9/zR3raX/KwI5HYgEkfbjsjLXR9MM+8mnr0tPLzO5e0bv6
 xvPC6FAZuPHK2IOKyA542mpEMEOalySN04LkjrewQUBLBqmNeBRA5XYZOiMU0lZ0ZKUX
 42XYM0KqtEI60yvCHPfF0jw1maDp4TO2iNuQPhNChSDyVjbAvmZr+jnFagPF/bzx9Ion
 8nGg==
X-Gm-Message-State: ABy/qLYWjiRRa5yQ/vETcWAroe26ooLdNxkeSpupVTqdKvi+wQd9KQh7
 cyT2YyDhp5D2Htr0ZzjukBcRnacAFwSFGw==
X-Google-Smtp-Source: APBJJlEKn6JGmSeZLwx4qoWukSzPIHvEDbXg1zvbFi5735r3ByxPyE7hqk4cfzbaKx4M/0LkUxe3Vw==
X-Received: by 2002:a05:6e02:1d9a:b0:348:8b42:47c with SMTP id
 h26-20020a056e021d9a00b003488b42047cmr9480951ila.17.1690200478843; 
 Mon, 24 Jul 2023 05:07:58 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43]) by smtp.gmail.com with ESMTPSA id
 c8-20020a92c8c8000000b00342f537e3c3sm2979262ilq.2.2023.07.24.05.07.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 05:07:58 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-78358268d1bso187010539f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 05:07:58 -0700 (PDT)
X-Received: by 2002:a25:238e:0:b0:d05:abaf:9933 with SMTP id
 j136-20020a25238e000000b00d05abaf9933mr7019302ybj.36.1690200457350; Mon, 24
 Jul 2023 05:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-2-arnd@kernel.org>
 <87pm4lj1w3.fsf@mail.lhotse>
 <19631e74-415e-4dcb-b79d-33dcf03d2dfc@app.fastmail.com>
In-Reply-To: <19631e74-415e-4dcb-b79d-33dcf03d2dfc@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jul 2023 14:07:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVszR+oZi8x8L0iXx=ydTiaNUZxToBSdf=2ZH5t85+D_Q@mail.gmail.com>
Message-ID: <CAMuHMdVszR+oZi8x8L0iXx=ydTiaNUZxToBSdf=2ZH5t85+D_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] vgacon: rework Kconfig dependencies
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-efi@vger.kernel.org,
 guoren <guoren@kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
 Brian Cain <bcain@quicinc.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 loongarch@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Khalid Aziz <khalid@gonehiking.org>, Arnd Bergmann <arnd@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Fri, Jul 21, 2023 at 10:29=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Fri, Jul 21, 2023, at 06:59, Michael Ellerman wrote:
> > Arnd Bergmann <arnd@kernel.org> writes:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> The list of dependencies here is phrased as an opt-out, but this is mi=
ssing
> >> a lot of architectures that don't actually support VGA consoles, and s=
ome
> >> of the entries are stale:
> >>
> >>  - powerpc used to support VGA consoles in the old arch/ppc codebase, =
but
> >>    the merged arch/powerpc never did
> >
> > Not disputing this, but how did you come to that conclusion? I grepped
> > around and couldn't convince myself whether it can work on powerpc or
> > not. ie. currently it's possible to enable CONFIG_VGA_CONSOLE and
> > powerpc does have a struct screen_info defined which seems like it woul=
d
> > allow vgacon_startup() to complete.
>
> The VGA console needs both screen_info and vga_con to work. In arch/ppc
> we had both, but in arch/powerpc we only retained the screen_info:
>
> $ git grep vga_con v2.6.26 -- arch/ppc arch/ppc64 arch/powerpc
> v2.6.26:arch/ppc/platforms/pplus.c:     conswitchp =3D &vga_con;
> v2.6.26:arch/ppc/platforms/prep_setup.c:        conswitchp =3D &vga_con;
>
> so after arch/ppc was removed, this became impossible to use on both
> pplus and prep. These two platforms were also (as far as I can tell)
> the only ones to support vga16fb as an alternative to vgacon, but
> both platforms were removed later on.

I did use vgacon and vga16fb on CHRP on a second video card
(initialized using Gabriel Paubert's x86 BIOS emulator), but that was
definitely before the advent of arch/powerpc/.

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
