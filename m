Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5416C832E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 18:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E851E88E45;
	Fri, 24 Mar 2023 17:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8A988E45
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 17:17:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 065D5B825BA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 17:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA909C433A0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679678240;
 bh=KmSfXdEEtRPWIg8aHZWk7gFtvIFI0DHuqd2HhimJHc0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R0lEktCgBc8EG37i4wAbrLcl1GzInxGxrCGdHha/gRoQQh/uJMgalK12rwQtj+ZZo
 KssuehV+OnZIsTAi8o0ngk7amQtTjupdNXCQQI0ZWqLVzga/dI9GlRdbPRaawMz48q
 gXOKgg69/afOnre16n2PTESOjY0bT1FO1+w5fTVMc6BlNWxx+igvS37l9uLRqz9tJ6
 rJJzYuu2wxMxXzieBZMFtWwY9axG4jE8rcGKKQQ1BPSoQ3phngqcyjaOs+cICxG79E
 oMWKxjJWg6KLb8SDewgQV5xIaEAErfr0hBzghXd2ice90RXWILqEOpdfV0o/GqtzjS
 PkIOthzPavi9g==
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-17786581fe1so2377844fac.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 10:17:20 -0700 (PDT)
X-Gm-Message-State: AO0yUKXuwzvo++cs1jl/r8GN7AqAVZlLvYDVXa23Eub56konyvFchNwd
 vd0zKkv5yThZbueOc07NsFjtLvU/aUJNqWHF3LI=
X-Google-Smtp-Source: AK7set+Rp7jlNa6FWUy1sUZZkxLmIopnDGqdEdKdmnthNH3QcLbxw1D65GCIkIW5HcvEqMsRsF8Q844K1hcUrthOiCc=
X-Received: by 2002:a05:6870:df8d:b0:17a:a5a2:62a6 with SMTP id
 us13-20020a056870df8d00b0017aa5a262a6mr1236076oab.11.1679678239821; Fri, 24
 Mar 2023 10:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X> <87pm91uf9c.fsf@kernel.org>
 <CA+icZUUYyqhV2HFzVtpi_KjBoYxjk7OB0UBVd2mX6abjmYhDjg@mail.gmail.com>
 <CAHk-=whdrvCkSWh=BRrwZwNo3=yLBXXM88NGx8VEpP1VTgmkyQ@mail.gmail.com>
In-Reply-To: <CAHk-=whdrvCkSWh=BRrwZwNo3=yLBXXM88NGx8VEpP1VTgmkyQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 25 Mar 2023 02:16:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNATe7Ah-ow9wYGrtL9i4z-VD=MCo=sJjbC_S0ofEoH6CFQ@mail.gmail.com>
Message-ID: <CAK7LNATe7Ah-ow9wYGrtL9i4z-VD=MCo=sJjbC_S0ofEoH6CFQ@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: linux-toolchains@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 llvm@lists.linux.dev, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 sedat.dilek@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Linus,


Thanks for giving me some more homeworks.


On Thu, Mar 23, 2023 at 1:56=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Mar 22, 2023 at 9:40=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.co=
m> wrote:
> >
> > You have to pass `make LLVM=3D1` in any case... to `oldconfig` or when
> > adding any MAKEFLAGS like -j${number-of-available-cpus}.
>
> I actually think we should look (again) at just making the compiler
> choice (and the prefix) be a Kconfig option.
>
> That would simplify *so* many use cases.
>
> It used to be that gcc was "THE compiler" and anything else was just
> an odd toy special case, but that's clearly not true any more.
>
> So it would be lovely to make the kernel choice a Kconfig choice - so
> you'd set it only at config time, and then after that a kernel build
> wouldn't need special flags any more, and you'd never need to play
> games with GNUmakefile or anything like that.


Presumably, this is the right direction.

To achieve it, Kconfig needs to have some mechanism to evaluate
shell commands dynamically.

If a user switches the toolchain set between GCC and LLVM
while running the Kconfig, $(cc-option) in Kconfig files must
be re-calculated.

Currently, Kconfig cannot do it. All macros are static - they are
expanded in the parse stage, and become constant strings.

Ulf Magnusson and I discussed the dynamic approach a few years back,
but I adopted the static way since it is much simpler.
We need to reconsider the dynamic approach to do this correctly.
I do not think it is too difficult technically.
We just need to come up with a decent syntax.



> Yes, you'd still use environment variables (or make arguments) for
> that initial Kconfig, but that's no different from the other
> environment variables we already have, like KCONFIG_SEED that kconfig
> uses internally, but also things like "$(ARCH)" that we already use
> *inside* the Kconfig files themselves.
>
> I really dislike how you have to set ARCH and CROSS_COMPILE etc
> externally, and can't just have them *in* the config file.
>
> So when you do cross-compiles, right now you have to do something like
>
>     make ARCH=3Di386 allmodconfig
>
> to build the .config file, but then you have to *repeat* that
> ARCH=3Di386 when you actually build things:
>
>     make ARCH=3Di386
>
> because the ARCH choice ends up being in the .config file, but the
> makefiles themselves always take it from the environment.
>
> There are good historical reasons for our behavior (and probably a
> number of extant practical reasons too), but it's a bit annoying, and
> it would be lovely if we could start moving away from this model.
>
>             Linus


Moving ARCH into the .config file needs careful thoughts, I think.

Not all targets include the .config file.
For example, "make clean", "make help", etc.

It is unclear which targets require explicit ARCH=3D option.

One solution is to move "archhelp", "CLEAN_FILES" etc.
from arch/*/Makefile to the top Makefile.
We will lose per-arch splitting in several places, though.


U-Boot adopts this model - 'ARCH' is determined in the Kconfig time,
so users do not need to give ARCH=3D option from the command line.

https://github.com/u-boot/u-boot/blob/v2023.01/arch/Kconfig#L44

You may get a quick idea of what it will look like.



I will take a look at this direction (the compiler choice in Kconfig first)=
,
but it will not happen soonish due to the limited time for upstream work.


--
Best Regards

Masahiro Yamada
