Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6896F625
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 16:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E77510EA6A;
	Fri,  6 Sep 2024 14:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H8Ag3MPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A3C10EA69;
 Fri,  6 Sep 2024 14:03:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 93DB7A44FCB;
 Fri,  6 Sep 2024 14:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91935C4CEC4;
 Fri,  6 Sep 2024 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725631379;
 bh=OO0AElYeEOI3GYdUWGdnaZhtFPRBNB1P+5L7lTeyPbM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H8Ag3MPqCKd4Jai8sgogq497549hcaRLSGScDfOvrf/HAncWIfVrSLLJMqEDvV8E9
 3ABjdhDRqkmE6hdFAmbSE7tSpwSmEFfvcGSz9Tua7o/XVMs3BMXt8snQwZW92ZXFTe
 86UfhwjfRjsG0EDZv/lmRgqdsOV3R15wS9+xE+lwZQgYrxa8mIOl9IW2w9Eeb/MxPr
 bElMnnGlW1+FIgpEmLtBr74/mtZ4VXc4kruztHE4M4YfJzspEomVAElqUlyhDI4f64
 AJZwUb2vsBTmjUsxcb0zLrvyClOusruGsa48AfGUwjFil27W00qEweLjHFHOiwJiJX
 VcLytTHM+Y5Rw==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f406034874so24461081fa.1; 
 Fri, 06 Sep 2024 07:02:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUi7J2OXuw3yTl8jEVKQnD9Zz9d3KkqfzsHYlXnyzZkQ2QXD4S/T7jUk42yDZp0Yp+Y4vJdpUA4wBQ=@lists.freedesktop.org,
 AJvYcCXbV1WTt3QG3QKw4bPco3ouxaIt0erz9ttTe1u/kvV4UKmxlpae9g/BTZ6yWthT83MAxmVwR5zJAzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzm0SVZlbOSoVBHiEhOzTw5AnWHvAaxPGhTDjgvkt4EElvkbukn
 iDtzyTTwG3R6Y4X7rjYakq2LVW43dI8V8uPcnyF6PjuoB+wSitV2D+C4MqNzBbIqKAAr2oaaIa2
 EY9A9DGCRfouupEJ4w561P8JgFsE=
X-Google-Smtp-Source: AGHT+IHDPemzgtRgtIK3pe/WquzDZM64UIne/QjVdYwQNSINL5RkN2+H+MExlIZPV5kHOwbjtPDmzO7x05c0KOYPFxo=
X-Received: by 2002:a2e:868d:0:b0:2f7:4df2:6a13 with SMTP id
 38308e7fff4ca-2f751f33229mr16214701fa.25.1725631378202; Fri, 06 Sep 2024
 07:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-4-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-4-06beff418848@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Sep 2024 23:02:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNARTnJ10ABuD96U-MaYitnX3AF=GD+N-skH7VBfAmOw9RQ@mail.gmail.com>
Message-ID: <CAK7LNARTnJ10ABuD96U-MaYitnX3AF=GD+N-skH7VBfAmOw9RQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: nvhe: add bee-headers support
To: da.gomez@samsung.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
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
 Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 gost.dev@samsung.com
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

On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> endian.h header is not provided by default in macOS. Use pkg-config with
> the new development package 'bee-headers' [1] to find the path where the
> headers are installed.
>
> [1] Bee Headers Project links:
> https://github.com/bee-headers/headers
> https://github.com/bee-headers/homebrew-bee-headers
>
> It requires to install bee-headers Homebrew Tap:
>
>   brew tap bee-headers/bee-headers
>   brew install bee-headers/bee-headers/bee-headers
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  arch/arm64/kernel/pi/Makefile     | 1 +
>  arch/arm64/kernel/vdso32/Makefile | 1 +
>  arch/arm64/kvm/hyp/nvhe/Makefile  | 3 ++-
>  3 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makefil=
e
> index 4d11a8c29181..259c9a45fba0 100644
> --- a/arch/arm64/kernel/pi/Makefile
> +++ b/arch/arm64/kernel/pi/Makefile
> @@ -20,6 +20,7 @@ KBUILD_CFLAGS :=3D $(filter-out $(CC_FLAGS_SCS), $(KBUI=
LD_CFLAGS))
>  KBUILD_CFLAGS  :=3D $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
>
>  hostprogs      :=3D relacheck
> +HOSTCFLAGS_relacheck.o =3D $(shell $(HOSTPKG_CONFIG) --cflags bee-header=
s 2> /dev/null)
>
>  quiet_cmd_piobjcopy =3D $(quiet_cmd_objcopy)
>        cmd_piobjcopy =3D $(cmd_objcopy) && $(obj)/relacheck $(@) $(<)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32=
/Makefile
> index 25a2cb6317f3..6cb8a04bd829 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -107,6 +107,7 @@ VDSO_LDFLAGS +=3D --orphan-handling=3D$(CONFIG_LD_ORP=
HAN_WARN_LEVEL)
>  # $(hostprogs) with $(obj)
>  munge :=3D ../../../arm/vdso/vdsomunge
>  hostprogs :=3D $(munge)
> +HOSTCFLAGS_$(munge).o =3D $(shell $(HOSTPKG_CONFIG) --cflags bee-headers=
 2> /dev/null)
>
>  c-obj-vdso :=3D note.o
>  c-obj-vdso-gettimeofday :=3D vgettimeofday.o
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/M=
akefile
> index b43426a493df..d20a440b6964 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -15,7 +15,8 @@ ccflags-y +=3D -fno-stack-protector     \
>              $(DISABLE_STACKLEAK_PLUGIN)
>
>  hostprogs :=3D gen-hyprel
> -HOST_EXTRACFLAGS +=3D -I$(objtree)/include
> +HOST_EXTRACFLAGS +=3D -I$(objtree)/include \
> +       $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
>
>  lib-objs :=3D clear_page.o copy_page.o memcpy.o memset.o
>  lib-objs :=3D $(addprefix ../../../lib/, $(lib-objs))
>
> --
> 2.46.0
>
>

NACK.

Developers working on Linux distributions have no interest
in your homebrew setup.

For 99% of users, pkg-config does not do anything good.
It is a waste of process forks.



You need to do it outside.


 $ HOSTCFLAGS=3D$(pkg-config --cflags bee-headers) make

or

 $ export HOSTCFLAGS=3D$(pkg-config --cflags bee-headers)
 $ make





--=20
Best Regards
Masahiro Yamada
