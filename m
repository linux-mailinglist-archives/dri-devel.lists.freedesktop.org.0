Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A41957BC08
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 18:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CEB8FE26;
	Wed, 20 Jul 2022 16:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BFB8F73B;
 Wed, 20 Jul 2022 16:53:47 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id m8so11092263edd.9;
 Wed, 20 Jul 2022 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJ8S55elQG8rT6GpyiUvZTI+ZRSSMG/MOcad0kU1mxc=;
 b=fsHG/tQ4hTj8OchDkCs08gXQinTEKkqANQIVGZu5jhS2nxVa/dLXfRrEDvqcEGfXyE
 tnXR+ggv6i6pm67wO0K5naCIiAkIaL4iq3HB1owXFBR0TBO9DzEJXdAxdJcb04p4J5UC
 C/2QyHd765C3vFaqc7P0VNDqmLXJjwIFr1wcRQ0DsXydOh+QbfreWjQwOiBkUntg6s97
 jok35PJYMERSzCG62ZArthSoxwphhsEDYj+EDK/txbYVipBhcAPS9EbYRhul40ZkknTo
 D1ejvE5QxUlXYgaGB8VSR7D63iFmwqvFDAxM2q7XZJlPdrK8SB2MjGWbM91DxYTn43Mq
 wviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJ8S55elQG8rT6GpyiUvZTI+ZRSSMG/MOcad0kU1mxc=;
 b=0XOMkMlj1YY6Qmpsz+Xw2gNYCZalkQX5/Z5wXq23Ma+Q51vNj20fzSxIFoMDLATb4x
 rRCH1aydv3S2iNHCHsrGc9Oo/E5c6b7dtUn6KzNpYEpf6/SB0LlGXWe7TY03U8Awr113
 tL9Dd7XfG37eyLs9l7U6gxEqXYlzX6/CbwTpTRhuok3gFMWl3cX8MhKFcioqhmhO5+vl
 va+tYucmLgo8NB6w6sKdfB4LHhMMs0NLdT+tVbat7PtdEnaDWWD8x9oPoTfThYY9DwEQ
 6h1emQMb1J53idnG77Atza7bccgwGv2SGzhAv/ISjNgzgt3ZEYm47V0PZ7y+Su4vh+qp
 Yqfw==
X-Gm-Message-State: AJIora8KhxDPte6LVgyY3+zyFW1I+I57ng/cZ124oiaOx2hRfbSO/z8n
 UXpdPjLWY/jH+2if9tVFZfDsnmL/1XIx/zwWI8w=
X-Google-Smtp-Source: AGRyM1uB7u0FCxKz1D9dYX/QTZ94wPS45vrIR6JXhCAzgfaN+XvDpYj5HMov9bLxiYLAehJj1UyobwdKqbQoMfQbmHM=
X-Received: by 2002:a05:6402:d0a:b0:437:f9a1:8493 with SMTP id
 eb10-20020a0564020d0a00b00437f9a18493mr52228238edb.226.1658336026370; Wed, 20
 Jul 2022 09:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-14-hdegoede@redhat.com>
In-Reply-To: <20220712193910.439171-14-hdegoede@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Jul 2022 12:53:34 -0400
Message-ID: <CADnq5_Mwri5mb5JBvRU9Spn72xKid-R83NoBp8Pc2LVGsCDttQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/29] drm/amdgpu: Register ACPI video backlight when
 skipping amdgpu backlight registration
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
> Typically the acpi_video driver will initialize before amdgpu, which
> used to cause /sys/class/backlight/acpi_video0 to get registered and then
> amdgpu would register its own amdgpu_bl# device later. After which
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
> Add a call to the new acpi_video_register_backlight() when amdgpu skips
> registering its own backlight device because of either the firmware_flags
> or the acpi_video_get_backlight_type() return value. This ensures that
> if the acpi_video backlight device should be used, it will be available
> before the amdgpu drm_device gets registered with userspace.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c    | 9 +++++++--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> index abf209e36fca..45cd9268b426 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> @@ -184,11 +184,11 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
>                 return;
>
>         if (!(adev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
> -               return;
> +               goto register_acpi_backlight;
>
>         if (!acpi_video_backlight_use_native()) {
>                 DRM_INFO("Skipping amdgpu atom DIG backlight registration\n");
> -               return;
> +               goto register_acpi_backlight;
>         }
>
>         pdata = kmalloc(sizeof(struct amdgpu_backlight_privdata), GFP_KERNEL);
> @@ -225,6 +225,11 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
>  error:
>         kfree(pdata);
>         return;
> +
> +register_acpi_backlight:
> +       /* Try registering an ACPI video backlight device instead. */
> +       acpi_video_register_backlight();
> +       return;

Can drop the return here.  Either way,
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>  }
>
>  void
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3b03a95e59a8..a667e66a9842 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4054,6 +4054,8 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
>
>         if (!acpi_video_backlight_use_native()) {
>                 DRM_INFO("Skipping amdgpu DM backlight registration\n");
> +               /* Try registering an ACPI video backlight device instead. */
> +               acpi_video_register_backlight();
>                 return;
>         }
>
> --
> 2.36.0
>
