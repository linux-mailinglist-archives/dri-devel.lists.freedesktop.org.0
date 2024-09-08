Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13FC97049E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 03:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED25A10E03E;
	Sun,  8 Sep 2024 01:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cq9lwmXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0DD10E03E;
 Sun,  8 Sep 2024 01:18:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 402445C135F;
 Sun,  8 Sep 2024 01:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A361C4CED6;
 Sun,  8 Sep 2024 01:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725758306;
 bh=M8wGQ4W/KVkVnctgfPoNFBJOh6tq/LCaviiGYsF9L8s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cq9lwmXgWqhZPEPEknJJ6MusaNmJeXzo45ZYCP7ssXKwk+6pZEIShmFZ0bjRL2S69
 ABj7sxuwzlMeZtfiuSVujQMmsIXJkZtFQd7pHlDm6BUyiPgE+fRCrnf8beNYJuy+ji
 oQOUNrABUCQYCeiOkIaYFeDPjuOLfYgzj/2JTZK6tv2u55Q21XGQb8RQjQDXYie67v
 MdshnfSfCPObqDnnZxY2ynGVQzEQcWiGZH9lFGCcniAEiK0rSLkI2qtihQaaKcK2t3
 NSADrCgThi939DlQOQEISpxvU/bWX7VErE7YTncTlMIeCFowuYeR4y/5JWrhSOJFDa
 LlWxCtzCQOwmA==
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5365c060f47so1852200e87.2; 
 Sat, 07 Sep 2024 18:18:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTkqCO/4yUGaejgXXwpLjp0V0xrDt74/pdak/hh3b8+x5bpfc+tvtfhapow72x2kPz0F/av/NmXuY=@lists.freedesktop.org,
 AJvYcCVKl90itRmfcb+A4sS4ZtkJ0/TrmHLEwDCWmUssXRbxWHxGw12ARwIU8xIPKLADG5zIoLYlDrB9hFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIT76U0DNE7Rd5I2w2rvY5m9Bg2pkxiS2cXYPwt7p1GFGHo3AY
 efVXtE5HrJBI9Z/R6B6387DBpeqpDYdkkfEPt86VswFljKQz6PhnwAMod3Slyk0nCNnAmgbEGic
 8mfWe1fvT4OH5JCIfQR/fbHobcGo=
X-Google-Smtp-Source: AGHT+IG//4gp0E4CfR083hPUBPN1CAx4mVwnwf3ahT0xcRrWXpKuALg+jAmTZu237ZONFZpFVA24RBtvauTzOfWgMvg=
X-Received: by 2002:a05:6512:224b:b0:536:56d6:ea4f with SMTP id
 2adb3069b0e04-536587b4312mr5939673e87.29.1725758304396; Sat, 07 Sep 2024
 18:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-4-06beff418848@samsung.com>
 <CAK7LNARTnJ10ABuD96U-MaYitnX3AF=GD+N-skH7VBfAmOw9RQ@mail.gmail.com>
 <CABj0suDiPf0ySOwQx=6k+6bTZqRmq1+tjPx7=dxSTO5DVqO4nQ@mail.gmail.com>
In-Reply-To: <CABj0suDiPf0ySOwQx=6k+6bTZqRmq1+tjPx7=dxSTO5DVqO4nQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Sep 2024 10:17:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNATc8-mxNLRjLLwd6bKs9mbpo2FxhChWbJHwiGpOr_hzBg@mail.gmail.com>
Message-ID: <CAK7LNATc8-mxNLRjLLwd6bKs9mbpo2FxhChWbJHwiGpOr_hzBg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: nvhe: add bee-headers support
To: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 7, 2024 at 6:28=E2=80=AFPM Daniel Gomez (Samsung)
<d+samsung@kruces.com> wrote:
>
> On Fri, Sep 6, 2024 at 4:03=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> > <devnull+da.gomez.samsung.com@kernel.org> wrote:
> > >
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >
> > > endian.h header is not provided by default in macOS. Use pkg-config w=
ith
> > > the new development package 'bee-headers' [1] to find the path where =
the
> > > headers are installed.
> > >
> > > [1] Bee Headers Project links:
> > > https://github.com/bee-headers/headers
> > > https://github.com/bee-headers/homebrew-bee-headers
> > >
> > > It requires to install bee-headers Homebrew Tap:
> > >
> > >   brew tap bee-headers/bee-headers
> > >   brew install bee-headers/bee-headers/bee-headers
> > >
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > > ---
> > >  arch/arm64/kernel/pi/Makefile     | 1 +
> > >  arch/arm64/kernel/vdso32/Makefile | 1 +
> > >  arch/arm64/kvm/hyp/nvhe/Makefile  | 3 ++-
> > >  3 files changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Mak=
efile
> > > index 4d11a8c29181..259c9a45fba0 100644
> > > --- a/arch/arm64/kernel/pi/Makefile
> > > +++ b/arch/arm64/kernel/pi/Makefile
> > > @@ -20,6 +20,7 @@ KBUILD_CFLAGS :=3D $(filter-out $(CC_FLAGS_SCS), $(=
KBUILD_CFLAGS))
> > >  KBUILD_CFLAGS  :=3D $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
> > >
> > >  hostprogs      :=3D relacheck
> > > +HOSTCFLAGS_relacheck.o =3D $(shell $(HOSTPKG_CONFIG) --cflags bee-he=
aders 2> /dev/null)
> > >
> > >  quiet_cmd_piobjcopy =3D $(quiet_cmd_objcopy)
> > >        cmd_piobjcopy =3D $(cmd_objcopy) && $(obj)/relacheck $(@) $(<)
> > > diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vd=
so32/Makefile
> > > index 25a2cb6317f3..6cb8a04bd829 100644
> > > --- a/arch/arm64/kernel/vdso32/Makefile
> > > +++ b/arch/arm64/kernel/vdso32/Makefile
> > > @@ -107,6 +107,7 @@ VDSO_LDFLAGS +=3D --orphan-handling=3D$(CONFIG_LD=
_ORPHAN_WARN_LEVEL)
> > >  # $(hostprogs) with $(obj)
> > >  munge :=3D ../../../arm/vdso/vdsomunge
> > >  hostprogs :=3D $(munge)
> > > +HOSTCFLAGS_$(munge).o =3D $(shell $(HOSTPKG_CONFIG) --cflags bee-hea=
ders 2> /dev/null)
> > >
> > >  c-obj-vdso :=3D note.o
> > >  c-obj-vdso-gettimeofday :=3D vgettimeofday.o
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nv=
he/Makefile
> > > index b43426a493df..d20a440b6964 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> > > +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> > > @@ -15,7 +15,8 @@ ccflags-y +=3D -fno-stack-protector     \
> > >              $(DISABLE_STACKLEAK_PLUGIN)
> > >
> > >  hostprogs :=3D gen-hyprel
> > > -HOST_EXTRACFLAGS +=3D -I$(objtree)/include
> > > +HOST_EXTRACFLAGS +=3D -I$(objtree)/include \
> > > +       $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
> > >
> > >  lib-objs :=3D clear_page.o copy_page.o memcpy.o memset.o
> > >  lib-objs :=3D $(addprefix ../../../lib/, $(lib-objs))
> > >
> > > --
> > > 2.46.0
> > >
> > >
> >
> > NACK.
> >
> > Developers working on Linux distributions have no interest
> > in your homebrew setup.
> >
> > For 99% of users, pkg-config does not do anything good.
> > It is a waste of process forks.
>
> I didn't think of this, and I agree with you.
>
> >
> >
> >
> > You need to do it outside.
> >
> >
> >  $ HOSTCFLAGS=3D$(pkg-config --cflags bee-headers) make
> >
> > or
> >
> >  $ export HOSTCFLAGS=3D$(pkg-config --cflags bee-headers)
> >  $ make
>
> Would a Makefile variable be suitable for this use case to make it
> easier in the command-line?



HOSTCFLAGS is an environment variable.


See Documentation/kbuild/kbuild.rst


  HOSTCFLAGS
  ----------
  Additional flags to be passed to $(HOSTCC) when building host programs.




If you do not want to type it every time,
add the following to ~/.profile or ~/.bashrc, etc.


export HOSTCFLAGS=3D"$(pkg-config --cflags bee-headers) -D_UUID_T
-D__GETHOSTUUID_H"




Or, if you want to limit this HOSTCFLAGS definition
only to a specific kernel tree, you can add GNUmakefile
to wrap Makefile.

This is how people often add local setups without
typing a long command.



GNUmakefile:

  export HOSTCFLAGS =3D $(shell pkg-config --cflags bee-headers)
-D_UUID_T -D__GETHOSTUUID_H
  include Makefile




Then, you do not need to bother the upstream kernel.







> We can detect we are in a non-linux based environment and enable a
> Makefile <VAR> (e.g., NOLINUX=3D1) and handle the NOLINUX build case
> (with pkg-config/bee-headers) inside the Makefiles for these non-linux
> cases.


NACK.



>
> >
> >
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--
Best Regards
Masahiro Yamada
