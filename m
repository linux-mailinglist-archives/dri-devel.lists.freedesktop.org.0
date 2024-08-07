Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2894ACFB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 17:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066E210E579;
	Wed,  7 Aug 2024 15:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ATifhC0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FE510E577;
 Wed,  7 Aug 2024 15:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D71F611E2;
 Wed,  7 Aug 2024 15:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B564C4AF49;
 Wed,  7 Aug 2024 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723044919;
 bh=wm+VWb1rIQaode09oZdE3sEothizpQCW8kQNxXyWPUY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ATifhC0Xqq0fEe+6e3QBEUliaGC/RbH+BLtwnYSFm80CEEuXHBNyAhkdxqzD7/He2
 PwBneWqEUKypiverT0BJeASdXPA4xWYAl2Fkgm10SugKbi+AvScSanh1joAX8Lfmdz
 KNRPzst2mgF9+1hD/hVdNmv6TzqF0PgyyUodxI6txDAuQNXQBWeHjjnRiNj0hi9VFR
 4s6ZMFW5SFkhmRGf+WuQyky1G/K5ad5iSm4yfiVc+3668PKhJ6odz+5QYopqnVL/FP
 XR95KBjUkyyEZlo8paXYX4cQdTts2wfmd+JcEtHB6KS9KmZ7swK2irnC/LQ+FHdEOK
 ieljN71TadH9g==
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52ed741fe46so2014093e87.0; 
 Wed, 07 Aug 2024 08:35:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWDltbqqGrBcikkgONxvX+Mpgk7+ExMLu7MjvTphB3CVGfK2K7eagT32bJBvFy3KO4tcYfhZKLKfxcJui0P03NSsKAn21HZifCIatj+TaFtYr8+6/NIwXQdpVcU+wVn1GOyGjeah3PTxCPBtlr5/bs=
X-Gm-Message-State: AOJu0Yw1fTW5JTt63qVf3M6g3391gzfqcMjlYaPj5KNIvThFG7WxWv79
 knilA8YPO56e3mpRhCMlHg3XNSg//Si2kW3vbWIIkGUPPAbtmLut9SoskdmiyWEgx8knFrFn28G
 bbftMlt0dypvm1r7Mn722i6TfChk=
X-Google-Smtp-Source: AGHT+IE/eDS6clCryBkFSzKDJUwO/cLwR+b8LrrNB5prXOgRnnwpkLjNgCVKxPqUzynolVNIM+yIL57HzFJ8CFIwBnI=
X-Received: by 2002:a05:6512:3e1e:b0:52c:df51:20bc with SMTP id
 2adb3069b0e04-530bb3b1531mr13674055e87.16.1723044917569; Wed, 07 Aug 2024
 08:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-5-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-5-4cd1ded85694@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 8 Aug 2024 00:34:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4kTWSDuGz-EM2p5vXcu9G4_WoEa4ovAWZ95VTfbreHA@mail.gmail.com>
Message-ID: <CAK7LNAQ4kTWSDuGz-EM2p5vXcu9G4_WoEa4ovAWZ95VTfbreHA@mail.gmail.com>
Subject: Re: [PATCH 05/12] accessiblity/speakup: genmap and makemapdata
 require linux/version.h
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

genmap and makemapdata DO NOT require linux/version.h


Removing bogus "#include <linux/version.h>" is the right fix.






On Wed, Aug 7, 2024 at 8:10=E2=80=AFAM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> Both genmap and makemapdata require the linux/version.h header. To
> ensure successful builds on macOS hosts, make sure usr/include is
> included in the HOSTCFLAGS.
>
> Fixes errors:
> drivers/accessibility/speakup/genmap.c:13:10: fatal error: 'linux/version=
.h' file not found
>    13 | #include <linux/version.h>
>       |          ^~~~~~~~~~~~~~~~~
> 1 error generated.
>
> drivers/accessibility/speakup/makemapdata.c:13:10: fatal error: 'linux/ve=
rsion.h' file not found
>    13 | #include <linux/version.h>
>       |          ^~~~~~~~~~~~~~~~~
> 1 error generated.
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  drivers/accessibility/speakup/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/accessibility/speakup/Makefile b/drivers/accessibili=
ty/speakup/Makefile
> index 6f6a83565c0d..74ee0c31370f 100644
> --- a/drivers/accessibility/speakup/Makefile
> +++ b/drivers/accessibility/speakup/Makefile
> @@ -38,6 +38,7 @@ clean-files :=3D mapdata.h speakupmap.h
>  # Generate mapdata.h from headers
>  hostprogs +=3D makemapdata
>  makemapdata-objs :=3D makemapdata.o
> +HOSTCFLAGS_makemapdata.o +=3D -I$(srctree)/usr/include
>
>  quiet_cmd_mkmap =3D MKMAP   $@
>        cmd_mkmap =3D TOPDIR=3D$(srctree) \
> @@ -51,6 +52,7 @@ $(obj)/mapdata.h: $(obj)/makemapdata
>  # Generate speakupmap.h from mapdata.h
>  hostprogs +=3D genmap
>  genmap-objs :=3D genmap.o
> +HOSTCFLAGS_genmap.o +=3D -I$(srctree)/usr/include
>  $(obj)/genmap.o: $(obj)/mapdata.h
>
>  quiet_cmd_genmap =3D GENMAP  $@
>
> --
> Git-146)
>
>


--
Best Regards
Masahiro Yamada
