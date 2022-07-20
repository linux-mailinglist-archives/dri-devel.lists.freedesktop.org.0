Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD4857BC12
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 18:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4B990D03;
	Wed, 20 Jul 2022 16:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8067890A8D;
 Wed, 20 Jul 2022 16:54:54 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id j22so34171470ejs.2;
 Wed, 20 Jul 2022 09:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KJnc07zqN8Uo4UvUaljLOYZFnviJ9P8iNPOnwTu14I4=;
 b=Y6pbjajsctFjZSoED0Cs1ua/GKW3LfgmuRNTcGPciVK3aZF8ewVtwNz+0YWkx+Sf9e
 ToPuuKyyR11/PMFju/xwZbAC03cBo0QqHATq4YglrLIRV2BMU3LhEo535+BTpmY11b9r
 88RKBUajnpyMW7HQfK/nx4J/wxm0dXptlktHxsQArH7rvMGt9SH0FgHlcWHqXQ3XMBvW
 EPLEnid12mNehX7u3fKk+jRAmDOq6oXk8T+MpCJQDogPwWIxo9FAc3SmBUnzlSiJcESh
 MbocDtjUxHUAfH5DpWsJdQ2fjXwgtizNdIiULNv6yXsO4UaJPHwRkoKlKXBx7VzGjOFS
 eRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KJnc07zqN8Uo4UvUaljLOYZFnviJ9P8iNPOnwTu14I4=;
 b=07IIkVyMyPFyE/Ag7tg0QO1RRz2BnPHCefckjF+VQYEa79Fpin0zrciHKRDWQQ/ypF
 XLjyCm6u/TQLf1EGBXoejsSQmBk3PJCYABFlnWHimyHXK9tcWhJRvacTpWSjvl0j8eoH
 RR8z2rvaUKYKthyQr/Z3RZbOx6HodyQp1ixLl+2TYmUb3jj0IBs/nscVPKwDWVTwCga6
 tzP3HLzTlIb5IAwqz944js0bA3yuD8HGthx6hUeVpMU0EbGGJ52y2aNYl59lst0rxZ1K
 i/c2rfBD20pMskE+pmZZ0132GE5eSvgJiYTl3U4VaXAeHVAFZNGU+JmYf2SUj0ISwFz/
 GZuA==
X-Gm-Message-State: AJIora9Thue16eV0pA8+QX/29rp3WAD8dZVsHIQYSalc/St2bvvWWHzP
 XQCc0jE1Q1zvrCKuBE7p8cJbJDJtQN6Oc/BK8ic=
X-Google-Smtp-Source: AGRyM1sJbnpvMcDLP+GUx8jP5LqLOrqTB40lzbLLU6RfYZJnzUHLf5CJWzlf9rtQpvcYU1jOG2hNDebloGE30lfZNeU=
X-Received: by 2002:a17:907:2e01:b0:72b:740c:1543 with SMTP id
 ig1-20020a1709072e0100b0072b740c1543mr36293825ejc.571.1658336093066; Wed, 20
 Jul 2022 09:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-15-hdegoede@redhat.com>
In-Reply-To: <20220712193910.439171-15-hdegoede@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Jul 2022 12:54:41 -0400
Message-ID: <CADnq5_NqO210gk3AxfU2wow4xqAgEaF2=5qtr29zS=K75ExQtg@mail.gmail.com>
Subject: Re: [PATCH v2 14/29] drm/radeon: Register ACPI video backlight when
 skipping radeon backlight registration
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

On Tue, Jul 12, 2022 at 3:40 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Typically the acpi_video driver will initialize before radeon, which
> used to cause /sys/class/backlight/acpi_video0 to get registered and then
> radeon would register its own radeon_bl# device later. After which
> the drivers/acpi/video_detect.c code unregistered the acpi_video0 device
> to avoid there being 2 backlight devices.
>
> This means that userspace used to briefly see 2 devices and the
> disappearing of acpi_video0 after a brief time confuses the systemd
> backlight level save/restore code, see e.g.:
> https://bbs.archlinux.org/viewtopic.php?id=269920
>
> To fix this the ACPI video code has been modified to make backlight class
> device registration a separate step, relying on the drm/kms driver to
> ask for the acpi_video backlight registration after it is done setting up
> its native backlight device.
>
> Add a call to the new acpi_video_register_backlight() when radeon skips
> registering its own backlight device because of e.g. the firmware_flags
> or the acpi_video_get_backlight_type() return value. This ensures that
> if the acpi_video backlight device should be used, it will be available
> before the radeon drm_device gets registered with userspace.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/radeon_encoders.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
> index 46549d5179ee..c1cbebb51be1 100644
> --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> @@ -30,6 +30,8 @@
>  #include <drm/drm_device.h>
>  #include <drm/radeon_drm.h>
>
> +#include <acpi/video.h>
> +
>  #include "radeon.h"
>  #include "radeon_atombios.h"
>  #include "radeon_legacy_encoders.h"
> @@ -167,7 +169,7 @@ static void radeon_encoder_add_backlight(struct radeon_encoder *radeon_encoder,
>                 return;
>
>         if (radeon_backlight == 0) {
> -               return;
> +               use_bl = false;
>         } else if (radeon_backlight == 1) {
>                 use_bl = true;
>         } else if (radeon_backlight == -1) {
> @@ -193,6 +195,13 @@ static void radeon_encoder_add_backlight(struct radeon_encoder *radeon_encoder,
>                 else
>                         radeon_legacy_backlight_init(radeon_encoder, connector);
>         }
> +
> +       /*
> +        * If there is no native backlight device (which may happen even when
> +        * use_bl==true) try registering an ACPI video backlight device instead.
> +        */
> +       if (!rdev->mode_info.bl_encoder)
> +               acpi_video_register_backlight();
>  }
>
>  void
> --
> 2.36.0
>
