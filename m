Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8652970157
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 11:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF9A10E0FD;
	Sat,  7 Sep 2024 09:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="tmDLUO1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F88810E0FD
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 09:28:17 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a8a7929fd64so316230966b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Sep 2024 02:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1725701296; x=1726306096;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLjcQZPs76go0Vfx5eTZL9J6PO34NT3+t7m9ovsvig4=;
 b=tmDLUO1qiqZkA4ZmIVHzOj41nkEAG2kzmVsYyTjFCFPg1ZyQXb+WIXGMsOs4OmUSbF
 nWKYxD+1lBKXGOJ/VWO3lHIVXSsCKlqBk+5XftVAfLWi2JzRi0FPHEe4fkLfzWCpRG6Y
 ux4p+sHmEiYkHbLzNbbJXNGFpKjVvBNPEUQbJSQXu6H4NBKKCZA5nWYJeB5UZDT1CeqS
 Syv9b1TugVhxubmblpBj2HuRK//7tXOeW+foB8gh/HOiyQq/zQ46q0OPHlLc6Ex5xLbM
 ijdddqjB9k1al9fCj2/HKig6X+uzi9tPXd2L6b6uYkgg+0eJj3EOMrmy7YSQbCE9lS3X
 IjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725701296; x=1726306096;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLjcQZPs76go0Vfx5eTZL9J6PO34NT3+t7m9ovsvig4=;
 b=vwEJQ9zgysHSPuIwLCO+BGLW3PkwEyjc8ENPZ1kdfCpnVJ25PrCrWOTWShYY9L49qi
 FRGOxbz2ydTVLTWzizOeyxsWLJuEwFS06RHbqMDf+OMXhh3RUTD+vwrwAlhR/j43GPug
 bAhn1IqGsllCiVVYDCABZLzsDuqv7iCrMLsbosjAbrMrxFIHltE+w5LtAy7YMY/m5kOD
 p2QgEmfazEOOkHdgqRvYPqOwKdducYwt4h5VTP7dpSlkCLJ4Bw9T0fjBc3kiLnj/jHRn
 S5jXQ61EcDZxwFytmG0k1ChWPloPGaItZcZnLmxagwiXmLPpaAkYbLvJxlD6njzSSM7Q
 XsCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXncNxGsWrSwouHKqJRP+dyyL3vL2bhjDsAEIIuqsWOJ6CxMz/wRU6uYa47rmxWg5rxokK2zzeyR3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYuF+hx7z9+pZxbvp453/STeUui00fh3uS4WigSnfuXlx9Z59C
 2hbgxHBe0mluGrXdnxTEO2/otL8hPSjx+KgIcUqsfyWPj5mjIY7LwN8bWWoKa0pOvQCGPNg5GqG
 l4xCo15rjUsBk3RvxeR5wvxfe1zneOr5YUEZemg==
X-Google-Smtp-Source: AGHT+IHhXXnbhoNhhw+Ovt49rejZC3sVAmWR3HQdOoxj8Eoar6lFd6KvmW+TQT/o1AMvFsui8ZDqx+Trbs/ZtjaLt7Y=
X-Received: by 2002:a17:906:730a:b0:a86:721d:3021 with SMTP id
 a640c23a62f3a-a8a885faa78mr441611866b.24.1725701295453; Sat, 07 Sep 2024
 02:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-4-06beff418848@samsung.com>
 <CAK7LNARTnJ10ABuD96U-MaYitnX3AF=GD+N-skH7VBfAmOw9RQ@mail.gmail.com>
In-Reply-To: <CAK7LNARTnJ10ABuD96U-MaYitnX3AF=GD+N-skH7VBfAmOw9RQ@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Sat, 7 Sep 2024 11:27:49 +0200
Message-ID: <CABj0suDiPf0ySOwQx=6k+6bTZqRmq1+tjPx7=dxSTO5DVqO4nQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: nvhe: add bee-headers support
To: Masahiro Yamada <masahiroy@kernel.org>
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

On Fri, Sep 6, 2024 at 4:03=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Daniel Gomez <da.gomez@samsung.com>
> >
> > endian.h header is not provided by default in macOS. Use pkg-config wit=
h
> > the new development package 'bee-headers' [1] to find the path where th=
e
> > headers are installed.
> >
> > [1] Bee Headers Project links:
> > https://github.com/bee-headers/headers
> > https://github.com/bee-headers/homebrew-bee-headers
> >
> > It requires to install bee-headers Homebrew Tap:
> >
> >   brew tap bee-headers/bee-headers
> >   brew install bee-headers/bee-headers/bee-headers
> >
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> >  arch/arm64/kernel/pi/Makefile     | 1 +
> >  arch/arm64/kernel/vdso32/Makefile | 1 +
> >  arch/arm64/kvm/hyp/nvhe/Makefile  | 3 ++-
> >  3 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makef=
ile
> > index 4d11a8c29181..259c9a45fba0 100644
> > --- a/arch/arm64/kernel/pi/Makefile
> > +++ b/arch/arm64/kernel/pi/Makefile
> > @@ -20,6 +20,7 @@ KBUILD_CFLAGS :=3D $(filter-out $(CC_FLAGS_SCS), $(KB=
UILD_CFLAGS))
> >  KBUILD_CFLAGS  :=3D $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
> >
> >  hostprogs      :=3D relacheck
> > +HOSTCFLAGS_relacheck.o =3D $(shell $(HOSTPKG_CONFIG) --cflags bee-head=
ers 2> /dev/null)
> >
> >  quiet_cmd_piobjcopy =3D $(quiet_cmd_objcopy)
> >        cmd_piobjcopy =3D $(cmd_objcopy) && $(obj)/relacheck $(@) $(<)
> > diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso=
32/Makefile
> > index 25a2cb6317f3..6cb8a04bd829 100644
> > --- a/arch/arm64/kernel/vdso32/Makefile
> > +++ b/arch/arm64/kernel/vdso32/Makefile
> > @@ -107,6 +107,7 @@ VDSO_LDFLAGS +=3D --orphan-handling=3D$(CONFIG_LD_O=
RPHAN_WARN_LEVEL)
> >  # $(hostprogs) with $(obj)
> >  munge :=3D ../../../arm/vdso/vdsomunge
> >  hostprogs :=3D $(munge)
> > +HOSTCFLAGS_$(munge).o =3D $(shell $(HOSTPKG_CONFIG) --cflags bee-heade=
rs 2> /dev/null)
> >
> >  c-obj-vdso :=3D note.o
> >  c-obj-vdso-gettimeofday :=3D vgettimeofday.o
> > diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe=
/Makefile
> > index b43426a493df..d20a440b6964 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> > +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> > @@ -15,7 +15,8 @@ ccflags-y +=3D -fno-stack-protector     \
> >              $(DISABLE_STACKLEAK_PLUGIN)
> >
> >  hostprogs :=3D gen-hyprel
> > -HOST_EXTRACFLAGS +=3D -I$(objtree)/include
> > +HOST_EXTRACFLAGS +=3D -I$(objtree)/include \
> > +       $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
> >
> >  lib-objs :=3D clear_page.o copy_page.o memcpy.o memset.o
> >  lib-objs :=3D $(addprefix ../../../lib/, $(lib-objs))
> >
> > --
> > 2.46.0
> >
> >
>
> NACK.
>
> Developers working on Linux distributions have no interest
> in your homebrew setup.
>
> For 99% of users, pkg-config does not do anything good.
> It is a waste of process forks.

I didn't think of this, and I agree with you.

>
>
>
> You need to do it outside.
>
>
>  $ HOSTCFLAGS=3D$(pkg-config --cflags bee-headers) make
>
> or
>
>  $ export HOSTCFLAGS=3D$(pkg-config --cflags bee-headers)
>  $ make

Would a Makefile variable be suitable for this use case to make it
easier in the command-line?

We can detect we are in a non-linux based environment and enable a
Makefile <VAR> (e.g., NOLINUX=3D1) and handle the NOLINUX build case
(with pkg-config/bee-headers) inside the Makefiles for these non-linux
cases.


>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
