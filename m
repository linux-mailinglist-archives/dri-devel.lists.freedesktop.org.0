Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6694CFE6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 14:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2344610E8E5;
	Fri,  9 Aug 2024 12:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fRN/2jYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3E410E8E5;
 Fri,  9 Aug 2024 12:15:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCA76616DC;
 Fri,  9 Aug 2024 12:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A325C4AF1A;
 Fri,  9 Aug 2024 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723205754;
 bh=YmzphMja6XXmXFsRDikB4wVg7CMV9XsA3fHfiK6varY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fRN/2jYxvxAK2rPD3+0naMbaZ/DnT37y8CwrQvdGhQ5zxh/2Z+G0bnaEdZKNDyS3l
 yBGIzBnKK5I66olifKJ+Xe3c70z15ijiIrBrEwB8qDXOFo1cXjMwLfbE1HwtSELDcr
 cr3NGFHumQf2V5oaCmKYbFErdr17fgRqOndlWO6eoZG9HF+4kHn0PRVEaR2u64sl7w
 6+nHVpfU8Y9irVsV+NuCz95HvmH+bk0DRm7Hiqr7Ca/EProf7zoSean45ouoNR9xqX
 WvQT1EfO599+KS8CWjkHm6uEsz2r2ssdlmB3ttsSVZ4xxM6fFpReUasLUCFVn8H5O8
 rE0BWb9/quglQ==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52efdf02d13so3722458e87.2; 
 Fri, 09 Aug 2024 05:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMCiQw0by48QUdhiL6V3flvtWzIIwPR/DppcIQ3NXYYm5SYUKnrNTFHF5WqiZA0N98f2ivJDKrGfwWQedvRToN0CK1/4Sm0Q365znpFHREq3NZ2kSqxpR6/vd27XII/fT0E3sca3Js1vZo/yjNI1Y=
X-Gm-Message-State: AOJu0YzZuc8QeDrCywaqneVB8F+NZ7Pl9jbp9Gvp31StZWZUBCgzVJti
 ZC8EZRxAL4/9OuRvRheEebG/qjy7tIxhc3SEASEFAbLo6hriJdwxMhljkDa1R8tzmrIaN3ldyCi
 SoWMIr4I8kEZmrlFQsFHwij007jo=
X-Google-Smtp-Source: AGHT+IGlPsd9qpxK+kaW4uaKRNj+aYSzSne6anO3DKhp0I4fJNAaAhyO1zxPErAVmUP4wrg91CYucQo7Gmyudhjr2sM=
X-Received: by 2002:a05:6512:2311:b0:52c:db76:2a7a with SMTP id
 2adb3069b0e04-530ee9b76bemr1127480e87.34.1723205752741; Fri, 09 Aug 2024
 05:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-11-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-11-4cd1ded85694@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 9 Aug 2024 21:15:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARafZ=zFMeoDdiMh=ZRU_XiJ08Naf=oAdYpOiUN02HizQ@mail.gmail.com>
Message-ID: <CAK7LNARafZ=zFMeoDdiMh=ZRU_XiJ08Naf=oAdYpOiUN02HizQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] tty/vt: conmakehash requires linux/limits.h
To: da.gomez@samsung.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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
 linux-kernel@vger.kernel.org, 
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

On Wed, Aug 7, 2024 at 8:10=E2=80=AFAM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> macOS hosts do not provide the linux/limits.h header required for
> conmakehash. To address this, ensure that usr/include is included in
> the conmakehash HOSTCFLAGS. This will provide the necessary header for
> successful compilation on macOS.
>
> Fixes error:
> HOSTCC  drivers/tty/vt/conmakehash - due to target missing
>   clang -Wp,-MMD,drivers/tty/vt/.conmakehash.d -Wall
> -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
> -std=3Dgnu11   -I ./scripts/include     -o drivers/tty/vt/conmakehash
> drivers/tty/vt/conmakehash.c
> drivers/tty/vt/conmakehash.c:15:10: fatal error: 'linux/
>    limits.h' file not found 15 | #include <linux/limits.h>    |
>    ^~~~~~~~~~~~~~~~


The error is reported at line 15 of drivers/tty/vt/conmakehash.c


The line 15 is #include <stdlib.h>:

https://github.com/torvalds/linux/blob/v6.11-rc1/drivers/tty/vt/conmakehash=
.c#L15


So, host programs cannot include <stdlib.h> on your build machine.



drivers/tty/vt/conmakehash.c has only 5 include directives:

#include <stdio.h>
#include <stdlib.h>
#include <sysexits.h>
#include <string.h>
#include <ctype.h>


You cannot build this, your build machine cannot build anything.









> 1 error generated.
> make[5]: *** [scripts/Makefile.host:116: drivers/tty/vt/conmakehash]
> Error 1
> make[4]: *** [scripts/Makefile.build:485: drivers/tty/vt] Error 2
> make[3]: *** [scripts/Makefile.build:485: drivers/tty] Error 2
> make[2]: *** [scripts/Makefile.build:485: drivers] Error 2
> make[1]: *** [/Volumes/src/kernel/linux-next/Makefile:1925: .] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  drivers/tty/vt/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/tty/vt/Makefile b/drivers/tty/vt/Makefile
> index 2c8ce8b592ed..d266895357e5 100644
> --- a/drivers/tty/vt/Makefile
> +++ b/drivers/tty/vt/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_CONSOLE_TRANSLATIONS)    +=3D consolemap.o=
 consolemap_deftbl.o
>  clean-files :=3D consolemap_deftbl.c defkeymap.c
>
>  hostprogs +=3D conmakehash
> +HOSTCFLAGS_conmakehash.o =3D -I$(srctree)/usr/include
>
>  quiet_cmd_conmk =3D CONMK   $@
>        cmd_conmk =3D $(obj)/conmakehash $< > $@
>
> --
> Git-146)
>
>


--
Best Regards
Masahiro Yamada
