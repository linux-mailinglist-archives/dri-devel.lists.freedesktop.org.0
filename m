Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08149707F2
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 16:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A3910E113;
	Sun,  8 Sep 2024 14:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AcHlyBuY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C51510E113;
 Sun,  8 Sep 2024 14:06:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A62D5C455A;
 Sun,  8 Sep 2024 14:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B7BC4CED0;
 Sun,  8 Sep 2024 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725804362;
 bh=Ad4/7XPxi3RBCcpnHNdup/IntXAmdAiFzCqV31ZrC8E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AcHlyBuYBPCOQ7jIB2rntkKpQdPTJ/l7pcHdzNcGFkTWTjYHnFM6WJ5nTP0MW6Caa
 Zt1ox1IDu3uaP3//4TeYKuDih3pmV8U8zAjj2LN9kHSvhu7Ky/HxAxH61fOdiEzhP6
 sHgCRPF0qzcgHokT3S6LiNsJko5TbcQWTLxoVP+jp5ddJgH6gx/p4T4ZpzV0sAxAHC
 1aj4cTK1GRUM95sVNf+RtsMbnQv9lHcE3eQPkpEXfh1bppFpjnQhY3S5iMKvAe0fAU
 88/sCANnEpsaLV1/cQgcuGTU1kEml3J60TeVpU2uRsvi2qwExQvCPXOQIU7UQ4+1ea
 4fGxipFZjEfDA==
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f75aa08a96so16773391fa.1; 
 Sun, 08 Sep 2024 07:06:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkyBmISYXR2XfqceWmlQyXz23SGyqWZHSVgcZeX1tEU+LX9gnu0/NEZ+RJFxTgR73f7sqxiVAv4JE=@lists.freedesktop.org,
 AJvYcCX5enSk35Th/FQvgJehPel7U8WrjvKpfwioZr9dt+E1JNXjOswCElZ3wE5cYrPKOZd2AI1khKEQ/vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNNBeDHObA3DomaUmirMyRCYhh2Usc8BMWuMZHRPfrzaiubm11
 5xh2BKIeqZr1bThlG/396iDLoawXJYzyxagQj+KUMWBY3QsxQLchdutln0vec4m6a+vT3CpJHcA
 /PjyjThGhcPp5OYKX2V9SwxhShHI=
X-Google-Smtp-Source: AGHT+IEekyXzzy8xWmAgDNhgqelhya4e5VFx9Ykjsgx5+vTZUqkhDQk7X/hDch9ahgJlF6RSlE5QnOyvMXW2LHKx9EA=
X-Received: by 2002:a05:6512:138f:b0:536:53f0:2f8e with SMTP id
 2adb3069b0e04-536587fcc5fmr4978005e87.37.1725804360702; Sun, 08 Sep 2024
 07:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-1-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-1-06beff418848@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Sep 2024 23:05:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNASdvtkSgTGip=Q5gmx5x8X_EYarjkEum+HMtFC83sSnXg@mail.gmail.com>
Message-ID: <CAK7LNASdvtkSgTGip=Q5gmx5x8X_EYarjkEum+HMtFC83sSnXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] scripts: subarch.include: fix SUBARCH on macOS
 hosts
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
 gost.dev@samsung.com, Nick Desaulniers <nick.desaulniers@gmail.com>
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
> From: Nick Desaulniers <nick.desaulniers@gmail.com>
>
> When building the Linux kernel on an aarch64 macOS based host, if we don'=
t
> specify a value for ARCH when invoking make, we default to arm and thus
> multi_v7_defconfig rather than the expected arm64 and arm64's defconfig.
>
> This is because subarch.include invokes `uname -m` which on MacOS hosts
> evaluates to `arm64` but on Linux hosts evaluates to `aarch64`,
>
> This allows us to build ARCH=3Darm64 natively on macOS (as in ARCH need
> not be specified on an aarch64-based system).
>
> Avoid matching arm64 by excluding it from the arm.* sed expression.
>
> Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---


Applied to linux-kbuild with
Suggested-by: Nicolas Schier <nicolas@fjasle.eu>

Thanks.



>  scripts/subarch.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/subarch.include b/scripts/subarch.include
> index 4bd327d0ae42..c4592d59d69b 100644
> --- a/scripts/subarch.include
> +++ b/scripts/subarch.include
> @@ -6,7 +6,7 @@
>
>  SUBARCH :=3D $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
>                                   -e s/sun4u/sparc64/ \
> -                                 -e s/arm.*/arm/ -e s/sa110/arm/ \
> +                                 -e /^arm64$$/!s/arm.*/arm/ -e s/sa110/a=
rm/ \
>                                   -e s/s390x/s390/ \
>                                   -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
>                                   -e s/sh[234].*/sh/ -e s/aarch64.*/arm64=
/ \
>
> --
> 2.46.0
>
>


--=20
Best Regards
Masahiro Yamada
