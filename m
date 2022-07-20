Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5285C57BBB4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 18:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA5210F6AA;
	Wed, 20 Jul 2022 16:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF7F18BA4F;
 Wed, 20 Jul 2022 16:45:41 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bp15so34124470ejb.6;
 Wed, 20 Jul 2022 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/lhjBvCngZcD3eYFG+VgqvQKBCFQwBVHGg9SXj+Md1w=;
 b=iFtYsHMenhSIDlABmUAS1jjiPCkj6FzGXekJRXlKLKIzXe8Q5D8GuZulZJfSgJBY5N
 Tt/uLOhTwJXmS2uI4Pc4uwYLcFKvgca9EkV1516SJjuQHhJTpq/z7OIG5116BlqAS5zc
 eqIu+0ufdIas6MxB9jTCkhbpoNMvVt6Bc/c0S13HV4XjUFlAf9LRZLtHxog/U57adcwQ
 fzDJ5tD83uKE3ko1Fw/CA/9TE6E3kp2Y/XC/BqjYonDk5/Wu9bJL8bcVsfgzcUzh9lV6
 pVWtLxIfNmjdr+Cobf9roof271taWKKTTtGpp3UQnPuKYLzAkARHXel5awt2cdndCfHf
 T1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/lhjBvCngZcD3eYFG+VgqvQKBCFQwBVHGg9SXj+Md1w=;
 b=QvEkof0eG12NWaHJX5v9fvdgadsO7lMRqhB0YHyChBVeva4Gneqa0BMOkhxcIO6fU+
 6zyU0YlrfDaPQ308rJgrIp4uwZlaF7tOZ5R0yrazGlxM1qPYTyVxQ89ZPLUHI8ffR0Ku
 SCk2KJ4/hycGetaKf4PaF9wsV3irSXXW2bKkp4nWjIVQdy3Lcko1xmN5fxNz2w9U5MeR
 hfhIROzG0EaUo0uwKUSnGYeGXY+gzGctgjsya8MN1BiDh3br5FSGuoXD9gE/tu9R1l2q
 9YizGLAa96tl5BPf+he7cRqIb+jvlYG6tkTTpCa+zfhlFsQUxKGMNOEiHe/OgBuLGwFZ
 j+0A==
X-Gm-Message-State: AJIora+J/LPKLxzbhw4C30jhAj31fYwIBn6p7gb2J6hp4dK/jcjzV9Dz
 x2r8JaRMmPuR89KiL3GzIXnawN2Of+eqqpoJ43o=
X-Google-Smtp-Source: AGRyM1sbtpOtX80WQvwwZef1d+CM4RjDZajsDZMmd7hJfZaiFaw7wTsx/omatuR7Pjdjkf0cfNc3ld06CqoTYICwqFY=
X-Received: by 2002:a17:907:a427:b0:72b:8cc5:5487 with SMTP id
 sg39-20020a170907a42700b0072b8cc55487mr35782199ejc.354.1658335539501; Wed, 20
 Jul 2022 09:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-5-hdegoede@redhat.com>
In-Reply-To: <20220712193910.439171-5-hdegoede@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Jul 2022 12:45:27 -0400
Message-ID: <CADnq5_NGqboyz_eav09R7+oHyfOT656s9O+b_EvZ-tHSSmp2oQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/29] drm/radeon: Don't register backlight when
 another backlight should be used
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Len Brown <lenb@kernel.org>, Daniel Dadap <ddadap@nvidia.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 3:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Before this commit when we want userspace to use the acpi_video backlight
> device we register both the GPU's native backlight device and acpi_video's
> firmware acpi_video# backlight device. This relies on userspace preferring
> firmware type backlight devices over native ones.
>
> Registering 2 backlight devices for a single display really is
> undesirable, don't register the GPU's native backlight device when
> another backlight device should be used.
>
> Changes in v2:
> - To avoid linker errors when radeon is builtin and video_detect.c is in
>   a module, select ACPI_VIDEO and its deps if ACPI && X86 are enabled.
>   When these are not set, ACPI_VIDEO is disabled, ensuring the stubs
>   from acpi/video.h will be used.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/Kconfig                         | 6 ++++++
>  drivers/gpu/drm/radeon/atombios_encoders.c      | 7 +++++++
>  drivers/gpu/drm/radeon/radeon_legacy_encoders.c | 7 +++++++
>  3 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index d65119860760..a07b76e06f84 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -234,6 +234,12 @@ config DRM_RADEON
>         select HWMON
>         select BACKLIGHT_CLASS_DEVICE
>         select INTERVAL_TREE
> +       # radeon depends on ACPI_VIDEO when X86 and ACPI are both enabled
> +       # for select to work, ACPI_VIDEO's dependencies must also be selected
> +       select INPUT if ACPI && X86
> +       select X86_PLATFORM_DEVICES if ACPI && X86
> +       select ACPI_WMI if ACPI && X86
> +       select ACPI_VIDEO if ACPI && X86
>         help
>           Choose this option if you have an ATI Radeon graphics card.  There
>           are both PCI and AGP versions.  You don't need to choose this to
> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
> index c93040e60d04..958920230d6f 100644
> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
> @@ -32,6 +32,8 @@
>  #include <drm/drm_file.h>
>  #include <drm/radeon_drm.h>
>
> +#include <acpi/video.h>
> +
>  #include "atom.h"
>  #include "radeon_atombios.h"
>  #include "radeon.h"
> @@ -209,6 +211,11 @@ void radeon_atom_backlight_init(struct radeon_encoder *radeon_encoder,
>         if (!(rdev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
>                 return;
>
> +       if (!acpi_video_backlight_use_native()) {
> +               DRM_INFO("Skipping radeon atom DIG backlight registration\n");
> +               return;
> +       }
> +
>         pdata = kmalloc(sizeof(struct radeon_backlight_privdata), GFP_KERNEL);
>         if (!pdata) {
>                 DRM_ERROR("Memory allocation failed\n");
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> index 1a66fb969ee7..d24cedf20c47 100644
> --- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> @@ -33,6 +33,8 @@
>  #include <drm/drm_util.h>
>  #include <drm/radeon_drm.h>
>
> +#include <acpi/video.h>
> +
>  #include "radeon.h"
>  #include "radeon_asic.h"
>  #include "radeon_legacy_encoders.h"
> @@ -387,6 +389,11 @@ void radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
>                 return;
>  #endif
>
> +       if (!acpi_video_backlight_use_native()) {
> +               DRM_INFO("Skipping radeon legacy LVDS backlight registration\n");
> +               return;
> +       }
> +
>         pdata = kmalloc(sizeof(struct radeon_backlight_privdata), GFP_KERNEL);
>         if (!pdata) {
>                 DRM_ERROR("Memory allocation failed\n");
> --
> 2.36.0
>
