Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF8D8C7711
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EB610ECF1;
	Thu, 16 May 2024 13:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OOcUatqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6420B10ECF7;
 Thu, 16 May 2024 13:04:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8510361735;
 Thu, 16 May 2024 13:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D34C113CC;
 Thu, 16 May 2024 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715864679;
 bh=lANF33hHhvZlC5k66NZieznEujRydEkMTcg2oIOZf+0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OOcUatqxoX1Mo/CcGPvfT3OJXCa2Q0HX4obZINi03Qk2mH4IhDoJiqR2g8tNYKOVY
 roHwMxJrBJfDzHxwQh++0N5i4M0yNC+ftPOLBCi9GJpdYxiINpufLKQTrONeQOYu+/
 btnFmOMT25BdDPUu3s15ZVw7IEsvgQ+RvZ840YzguGlF7TPpXhBqltjpSff8CQArOZ
 jVMFoAMzViKf5HQFrE/jQMD0F5/wTsRgXChGEa4zpf4NpbY8KDrSN3LhCgGOmaukCZ
 o5gCkyDdTp4dJ60JHbD8ovfstF3d29iwhCSxCoXxBp7nW9KkDH5Uif0LNlI2cbxBuH
 CsKDkXblzkkwA==
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-5b27c804765so32494eaf.3; 
 Thu, 16 May 2024 06:04:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUSdf2L1giGXSLQgk8KMENaFCLnqNffx08sEjYRYij+5wRgmHoTt2pws4qGRDF1Su6bHT2u1Y4EV5SnvsciwFCFjTxF56/AggbcUPmx08TxSlUvgLCB8CfxOsZ6km84MA/Ln+tdG67SAjuO43SmQZAx
X-Gm-Message-State: AOJu0YxRhK/2vrvr0W7s8yCDVseqPmazq11PNIMVbobB8PnbuLdzK2z1
 8oIlWaSpSWWvxsF2QgwH8Ej2U27dky+s7BBXpQlp0ErnUrOk/86QO3ksREOO5pkRzFW0Rvpw3j0
 ZgDGCV+qMwuFx3Xd4pSQczgIKY98=
X-Google-Smtp-Source: AGHT+IFemhO95rMoyxfMEhxijBJUiXX4NOCyoajz6xwWsaXxqFUkT8aIVqw1K1TJO13iN9pQ3XfqejYS9nFUxeFLCaw=
X-Received: by 2002:a05:6870:2153:b0:22e:dfbc:4aae with SMTP id
 586e51a60fabf-24172a7e835mr21408284fac.2.1715864678677; Thu, 16 May 2024
 06:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240516124317.710-1-tzimmermann@suse.de>
In-Reply-To: <20240516124317.710-1-tzimmermann@suse.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 16 May 2024 15:04:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gw620SLfxM66FfVeWMTN=dSZZtpH-=mFT_0HsumT3SsA@mail.gmail.com>
Message-ID: <CAJZ5v0gw620SLfxM66FfVeWMTN=dSZZtpH-=mFT_0HsumT3SsA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: video: Fix name collision with architecture's
 video.o
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: rafael@kernel.org, lenb@kernel.org, arnd@arndb.de, 
 chaitanya.kumar.borah@intel.com, suresh.kumar.kurmi@intel.com, 
 jani.saarinen@intel.com, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>
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

CC Hans who has been doing the majority of the ACPI video work.

On Thu, May 16, 2024 at 2:43=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Commit 2fd001cd3600 ("arch: Rename fbdev header and source files")
> renames the video source files under arch/ such that they does not
> refer to fbdev any longer. The new files named video.o conflict with
> ACPI's video.ko module.

And surely nobody knew or was unable to check upfront that there was a
video.ko already in the kernel.

> Modprobing the ACPI module can then fail with warnings about missing symb=
ols, as shown below.
>
>   (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol acpi_video_=
unregister (err -2)
>   (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol acpi_video_=
register_backlight (err -2)
>   (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol __acpi_vide=
o_get_backlight_type (err -2)
>   (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol acpi_video_=
register (err -2)
>
> Fix this problem by renaming ACPI's video.ko to acpi_video.ko. Also
> rename a related source file and clean up the Makefile.

If you insist on renaming, rename it to backlight.c (and
backlight_detect.c for consistency), because that's what it really is
about.

> Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Closes: https://lore.kernel.org/intel-gfx/9dcac6e9-a3bf-4ace-bbdc-f697f76=
7f9e0@suse.de/T/#t
> Tested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 2fd001cd3600 ("arch: Rename fbdev header and source files")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/acpi/Makefile                            | 5 +++--
>  drivers/acpi/{acpi_video.c =3D> acpi_video_core.c} | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>  rename drivers/acpi/{acpi_video.c =3D> acpi_video_core.c} (99%)
>
> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
> index 8cc8c0d9c8732..fc9e11f7afbf7 100644
> --- a/drivers/acpi/Makefile
> +++ b/drivers/acpi/Makefile
> @@ -84,7 +84,9 @@ obj-$(CONFIG_ACPI_FAN)                +=3D fan.o
>  fan-objs                       :=3D fan_core.o
>  fan-objs                       +=3D fan_attr.o
>
> -obj-$(CONFIG_ACPI_VIDEO)       +=3D video.o
> +obj-$(CONFIG_ACPI_VIDEO)       +=3D acpi_video.o
> +acpi_video-objs                        +=3D acpi_video_core.o video_dete=
ct.o
> +
>  obj-$(CONFIG_ACPI_TAD)         +=3D acpi_tad.o
>  obj-$(CONFIG_ACPI_PCI_SLOT)    +=3D pci_slot.o
>  obj-$(CONFIG_ACPI_PROCESSOR)   +=3D processor.o
> @@ -124,7 +126,6 @@ obj-$(CONFIG_ACPI_CONFIGFS) +=3D acpi_configfs.o
>
>  obj-y                          +=3D pmic/
>
> -video-objs                     +=3D acpi_video.o video_detect.o
>  obj-y                          +=3D dptf/
>
>  obj-$(CONFIG_ARM64)            +=3D arm64/
> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video_core.c
> similarity index 99%
> rename from drivers/acpi/acpi_video.c
> rename to drivers/acpi/acpi_video_core.c
> index 1fda303882973..32bf81c5773a4 100644
> --- a/drivers/acpi/acpi_video.c
> +++ b/drivers/acpi/acpi_video_core.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - *  video.c - ACPI Video Driver
> + *  acpi_video_core.c - ACPI Video Driver
>   *
>   *  Copyright (C) 2004 Luming Yu <luming.yu@intel.com>
>   *  Copyright (C) 2004 Bruno Ducrot <ducrot@poupinou.org>
> --
> 2.45.0
>
>
