Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA527C57C77
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 14:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A51210E812;
	Thu, 13 Nov 2025 13:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I3FB/24+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF5610E812
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 13:49:24 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-297ea4c2933so613265ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 05:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763041764; x=1763646564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aLKGPNzt1bjDg/D6dxAyKgass6iN27pyUqXiA1Nrl84=;
 b=I3FB/24++/jbFd6MBJO3SxPQhWUuRTu8ckdjl/uZ2R/nWVFo17jG0nTx6utQRdYxEX
 V9XVVK3qRqtSadeuWJEbJsMTqs14Bl66IwXdvK5WbrsoyqRFfe4Zi0zMGKlO7puuyKg9
 jej+xD6mmPx7KJkf2bVjIwBDUgeGGOyiPX01lhInXAGAkHCcKy1Km7g5vhJA0GZiFDv+
 KKHfW+ilzHKema7XIOl3qGq5hm4/v8XYSLLj3Ptdygwv1bbKO40aQQpyugUrL30N60A6
 zwU6zbubMIMlTpxbykYzW8WZ+Src7jz8ULLCredcFsYDMawcyDCkNroG0/XCYVm90BjO
 0Qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763041764; x=1763646564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aLKGPNzt1bjDg/D6dxAyKgass6iN27pyUqXiA1Nrl84=;
 b=nzza5pdxErdzxGLqanQpJpdqipzndhoWKaVwf8s3q/pPEAG7+FkNmVm831BgpnrNLU
 f+sNrHI08qAuPVSkZWnIGZEyB8bNZRZkGqWqUt7O+6X0+3minu2dicoVt/DF9GC53Bbe
 2rf5hBr65+rljroTpNbTWfQnyCVzSqvEL5slOZXLK/GslJ4rxDgBUBwx1wsdyISG0/DY
 92+jSELAfFKXzPCZlvGHma9t3StZzPH3EOAUijpQZCMa5D2e/T8VBJtqePvxmw6vuAEx
 EarR/DH4Dz4jRkF9DuXiKf1W3vkGHQB1VGjkkA6WjuX2Vtuv3sFjvv2g1ZlQwQ85FCPq
 rdUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWNWU+7kdrR5g0cDKJd2nCDuC0YSFxwDZNdASlrSZhHEKhtR7Y3Qls1VFTprY0mT7hiYnUyia1RJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDYIomf3VWsz8i4dT1JiodPYaZ3SF5Jkk6TNhLbP90TdmShZ7Y
 F+f5a2mNNs3TTkI/8A1dDFJjk9G+7NHfDhpbMM+SRw0SazhIk2fYbvvRYulHUz6OcVckvkx1uSi
 5876tJNVq/imtTxnBxk45hYsgO32SwPw=
X-Gm-Gg: ASbGncvth81lCOBhBG4pBW9jhTbZmW/ldTvUtLrmVjVJS9DcNmyrRNwxQHb67zlXbGY
 rribZCfdNtKdvcBdsLXdxDcvXaTlLkm2peJBYk1dj8Z8HU1dKeTTAPfaDvsI9kZbw3YyNk2YanK
 XCyB/tgy7vo+A2ApvUqhLOWLbA7s98PUdkDf516fBAm69ocZz11ktX2/gyUIWOV0Bicf0Uv0m6o
 NEDNBuRIhmLNuolSRzAH96ytu3q3qfZezWRm7gqvGcnp5uv0+taoe3DjKKT
X-Google-Smtp-Source: AGHT+IFEF+G/nGjr+gpgGHcDd0cvg5S8s9i9f8BE1cswaPgSfctEy6nLDMcoZwwQ3XOo9a+zxxN/E/WrFouXaRVnntA=
X-Received: by 2002:a17:903:41d0:b0:297:fe6a:d27b with SMTP id
 d9443c01a7336-2985b9e0643mr18605775ad.8.1763041763519; Thu, 13 Nov 2025
 05:49:23 -0800 (PST)
MIME-Version: 1.0
References: <20251112222646.495189-1-mario.limonciello@amd.com>
In-Reply-To: <20251112222646.495189-1-mario.limonciello@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Nov 2025 08:49:10 -0500
X-Gm-Features: AWmQ_bm_vBkJZw1dIRsXw0s70Qo3lc5tHxhjF75P0p5XflHPTxzsoR7DqKWNjLQ
Message-ID: <CADnq5_M5qryDL0thczE1YKBEQc2JToAkh_zr=TphB6YwPwYfgQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Move adaptive backlight modulation property to
 drm core
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Harry Wentland <Harry.Wentland@amd.com>
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

On Wed, Nov 12, 2025 at 5:27=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> The adaptive backlight modulation property is supported on AMD hardware b=
ut
> compositors should be aware of it in standard DRM property documentation.
>
> Move the helper to create the property and documentation into DRM.
>
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 69 +++------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h |  7 ---
>  drivers/gpu/drm/drm_connector.c             | 63 +++++++++++++++++++
>  include/drm/drm_connector.h                 |  8 +++
>  4 files changed, 80 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_display.c
> index f8b35c487b6c..3d840bef77bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1363,67 +1363,9 @@ static const struct drm_prop_enum_list amdgpu_dith=
er_enum_list[] =3D {
>         { AMDGPU_FMT_DITHER_ENABLE, "on" },
>  };
>
> -/**
> - * DOC: property for adaptive backlight modulation
> - *
> - * The 'adaptive backlight modulation' property is used for the composit=
or to
> - * directly control the adaptive backlight modulation power savings feat=
ure
> - * that is part of DCN hardware.
> - *
> - * The property will be attached specifically to eDP panels that support=
 it.
> - *
> - * The property is by default set to 'sysfs' to allow the sysfs file 'pa=
nel_power_savings'
> - * to be able to control it.
> - * If set to 'off' the compositor will ensure it stays off.
> - * The other values 'min', 'bias min', 'bias max', and 'max' will contro=
l the
> - * intensity of the power savings.
> - *
> - * Modifying this value can have implications on color accuracy, so trea=
d
> - * carefully.
> - */
> -static int amdgpu_display_setup_abm_prop(struct amdgpu_device *adev)
> -{
> -       const struct drm_prop_enum_list props[] =3D {
> -               { ABM_SYSFS_CONTROL, "sysfs" },
> -               { ABM_LEVEL_OFF, "off" },
> -               { ABM_LEVEL_MIN, "min" },
> -               { ABM_LEVEL_BIAS_MIN, "bias min" },
> -               { ABM_LEVEL_BIAS_MAX, "bias max" },
> -               { ABM_LEVEL_MAX, "max" },
> -       };
> -       struct drm_property *prop;
> -       int i;
> -
> -       if (!adev->dc_enabled)
> -               return 0;
> -
> -       prop =3D drm_property_create(adev_to_drm(adev), DRM_MODE_PROP_ENU=
M,
> -                               "adaptive backlight modulation",
> -                               6);
> -       if (!prop)
> -               return -ENOMEM;
> -
> -       for (i =3D 0; i < ARRAY_SIZE(props); i++) {
> -               int ret;
> -
> -               ret =3D drm_property_add_enum(prop, props[i].type,
> -                                               props[i].name);
> -
> -               if (ret) {
> -                       drm_property_destroy(adev_to_drm(adev), prop);
> -
> -                       return ret;
> -               }
> -       }
> -
> -       adev->mode_info.abm_level_property =3D prop;
> -
> -       return 0;
> -}
> -
>  int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>  {
> -       int sz;
> +       int ret, sz;
>
>         adev->mode_info.coherent_mode_property =3D
>                 drm_property_create_range(adev_to_drm(adev), 0, "coherent=
", 0, 1);
> @@ -1467,7 +1409,14 @@ int amdgpu_display_modeset_create_props(struct amd=
gpu_device *adev)
>                                          "dither",
>                                          amdgpu_dither_enum_list, sz);
>
> -       return amdgpu_display_setup_abm_prop(adev);
> +       adev->mode_info.abm_level_property =3D drm_create_abm_property(ad=
ev_to_drm(adev));
> +       if (IS_ERR(adev->mode_info.abm_level_property)) {
> +               ret =3D PTR_ERR(adev->mode_info.abm_level_property);
> +               adev->mode_info.abm_level_property =3D NULL;
> +               return ret;
> +       }
> +
> +       return 0;
>  }
>
>  void amdgpu_display_update_priority(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_display.h
> index 2b1536a16752..dfa0d642ac16 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
> @@ -54,11 +54,4 @@ int amdgpu_display_resume_helper(struct amdgpu_device =
*adev);
>  int amdgpu_display_get_scanout_buffer(struct drm_plane *plane,
>                                       struct drm_scanout_buffer *sb);
>
> -#define ABM_SYSFS_CONTROL      -1
> -#define ABM_LEVEL_OFF          0
> -#define ABM_LEVEL_MIN          1
> -#define ABM_LEVEL_BIAS_MIN     2
> -#define ABM_LEVEL_BIAS_MAX     3
> -#define ABM_LEVEL_MAX          4
> -
>  #endif
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 272d6254ea47..376169dac247 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2603,6 +2603,69 @@ static int drm_mode_create_colorspace_property(str=
uct drm_connector *connector,
>         return 0;
>  }
>
> +/**
> + * DOC: integrated panel properties
> + *
> + * adaptive backlight modulation:
> + *     Adaptive backlight modulation (ABM) is a power savings feature th=
at
> + *     dynamically adjusts the backlight brightness based on the content
> + *     displayed on the screen. By reducing the backlight brightness for
> + *     darker images and increasing it for brighter images, ABM helps to
> + *     conserve energy and extend battery life on devices with integrate=
d
> + *     displays.  This feature is part of AMD DCN hardware.
> + *
> + *     sysfs
> + *             The ABM property is exposed to userspace via sysfs interf=
ace
> + *             located at 'amdgpu/panel_power_savings' under the DRM dev=
ice.
> + *     off
> + *             Adaptive backlight modulation is disabled.
> + *     min
> + *             Adaptive backlight modulation is enabled at minimum inten=
sity.
> + *     bias min
> + *             Adaptive backlight modulation is enabled at a more intens=
e
> + *             level than 'min'.
> + *     bias max
> + *             Adaptive backlight modulation is enabled at a more intens=
e
> + *             level than 'bias min'.
> + *     max
> + *             Adaptive backlight modulation is enabled at maximum inten=
sity.
> + */
> +struct drm_property *drm_create_abm_property(struct drm_device *dev)
> +{
> +       const struct drm_prop_enum_list props[] =3D {
> +               { ABM_SYSFS_CONTROL, "sysfs" },
> +               { ABM_LEVEL_OFF, "off" },
> +               { ABM_LEVEL_MIN, "min" },
> +               { ABM_LEVEL_BIAS_MIN, "bias min" },
> +               { ABM_LEVEL_BIAS_MAX, "bias max" },
> +               { ABM_LEVEL_MAX, "max" },
> +       };
> +       struct drm_property *prop;
> +       int i;
> +
> +       prop =3D drm_property_create(dev, DRM_MODE_PROP_ENUM,
> +                               "adaptive backlight modulation",
> +                               6);
> +       if (!prop)
> +               return ERR_PTR(-ENOMEM);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(props); i++) {
> +               int ret;
> +
> +               ret =3D drm_property_add_enum(prop, props[i].type,
> +                                               props[i].name);
> +
> +               if (ret) {
> +                       drm_property_destroy(dev, prop);
> +
> +                       return ERR_PTR(ret);
> +               }
> +       }
> +
> +       return prop;
> +}
> +EXPORT_SYMBOL(drm_create_abm_property);
> +
>  /**
>   * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace pro=
perty
>   * @connector: connector to create the Colorspace property on.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..644c0d49500f 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2454,6 +2454,7 @@ int drm_connector_attach_hdr_output_metadata_proper=
ty(struct drm_connector *conn
>  bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state =
*old_state,
>                                              struct drm_connector_state *=
new_state);
>  int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
> +struct drm_property *drm_create_abm_property(struct drm_device *dev);
>  int drm_mode_create_hdmi_colorspace_property(struct drm_connector *conne=
ctor,
>                                              u32 supported_colorspaces);
>  int drm_mode_create_dp_colorspace_property(struct drm_connector *connect=
or,
> @@ -2563,4 +2564,11 @@ const char *drm_get_colorspace_name(enum drm_color=
space colorspace);
>         drm_for_each_encoder_mask(encoder, (connector)->dev, \
>                                   (connector)->possible_encoders)
>
> +#define ABM_SYSFS_CONTROL      -1
> +#define ABM_LEVEL_OFF          0
> +#define ABM_LEVEL_MIN          1
> +#define ABM_LEVEL_BIAS_MIN     2
> +#define ABM_LEVEL_BIAS_MAX     3
> +#define ABM_LEVEL_MAX          4
> +
>  #endif
> --
> 2.51.2
>
