Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9397B0B3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 15:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EF410E47F;
	Tue, 17 Sep 2024 13:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bTwHM0w3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACA110E47D;
 Tue, 17 Sep 2024 13:21:13 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2d88a8c66b7so503660a91.1; 
 Tue, 17 Sep 2024 06:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726579273; x=1727184073; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=POFr2Bd6CmH5BZIMOjewYOxEcX6ZrAvV6FajAw0VAt4=;
 b=bTwHM0w3wKaPUotRjnMVNDW2o+kfwVJvOSg1+TTUNBFsvtYRzQE8CBLaxpb5e14Nb1
 YYqZskANvQtX8LnQQuGhQtGxvt9WTCfF+BTecWsTh8UoepAEk9tlnoZc8UqVkq2GAtmw
 Z2okg0xeH2qJ6zD5wMYSCuZapIlRiHorvqJVMBTpqAxWxQc/97+vVRCYAgaD8x7qOMrI
 40guZvJ+osBvyK4318PHH6NG/tNN1HYITbR1vJwLfg+4sFAUlkhn3e0DAW/f+nQO2hja
 Vxc04zF884bjwqW2TaGuqlmGJVtol/X9r2iacjJnnS5rjrOXclj6EPcOkpw7RVEMkmI1
 QJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726579273; x=1727184073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POFr2Bd6CmH5BZIMOjewYOxEcX6ZrAvV6FajAw0VAt4=;
 b=Zwc+HDV+g8wnNWDD61H8BKWiw8LGcc59+7SRteWbm6QRXcocf35TkXPJQR530apTr0
 MM7CqjFgY8U5T+vRHCMc/QpraTHA4cBfwY1fp3DT598zdeXD/EoymwzrPnYZclfME6t6
 1aHxkKMCX83uVn9c0BSOpzQpl01NcoUeCgiQAOTAobVim3nLT+Og8c4WGN2aj2q7Sc9W
 6Q6fh36AN5X2KyoONZ6TYu9/iX35dMVv2/mjx9Y+ie1K4bQf2kPGHhS2J7BBBOqhNC86
 T0BoEuwMBdi9/u6JSRlklq0jnDkp1Y1HwqD0wOCXh4n8d09u9dsjyI7KVrF7lrBNf39h
 wlzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUPWwQSueTFNqYncciueY22VF8Dvh9u0uM39tyGYZzPm0nUyjm21PMH5ckv5+4pNbnbz57/FxX+Wvq@lists.freedesktop.org,
 AJvYcCUoj06cMilQYDFOx2+pzQSu9go7XvstzMw9S5ENCN+qjK47/zmCx6pBe4RNyv2YflkUjrDdmXfP@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs1G9QT0fidN8q33lIGQPn460WpwYxTZLbv+LpjoFwn6uerRCN
 O99m+6gHXnPCSSNrvbKZjdbTcvjF5x9h2dVrDmskBvte482/gmp6xlS5UaXf07/UqYcOJlL2qVG
 AgAwlILwCIVTcrU4dSFIt+LOPXR4=
X-Google-Smtp-Source: AGHT+IHjNWh5CNBJRCGp31ma7fmz05XPtGvBsAlfXjTLm85sqM4sDr9JcsbaQU27QweMPt9f8e0Riu0kx4R0pJ654ng=
X-Received: by 2002:a17:90a:2e8a:b0:2d8:ca39:5972 with SMTP id
 98e67ed59e1d1-2db9ff6cd70mr9076236a91.1.1726579273043; Tue, 17 Sep 2024
 06:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240802071752.116541-1-yaolu@kylinos.cn>
 <20240812060914.102614-1-yaolu@kylinos.cn>
In-Reply-To: <20240812060914.102614-1-yaolu@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Sep 2024 09:21:00 -0400
Message-ID: <CADnq5_OcUgV9dgAynDCQnm9NS+QCvhBiHvxWnhWqi2qqhh=zXg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: add dce6 drm_panic support
To: Lu Yao <yaolu@kylinos.cn>
Cc: ckoenig.leichtzumerken@gmail.com, daniel@ffwll.ch, jfalempe@redhat.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 srinivasan.shanmugam@amd.com, sunil.khatri@amd.com
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

On Mon, Aug 12, 2024 at 2:10=E2=80=AFAM Lu Yao <yaolu@kylinos.cn> wrote:
>
> Add support for the drm_panic module, which displays a pretty user
> friendly message on the screen when a Linux kernel panic occurs.
>
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>

Patch looks good to me.  Any chance you want to convert the other
non-DC dce files (dce_v8_0.c, dce_v10_0.c, dce_v11_0.c) while you are
at it?

Alex


> ---
> Changes in v2:
> 1. Drop include "drm_internal.h"
> 2. Add disabling DC tiling ops.
> Per suggestion from previous thread:
> https://patchwork.freedesktop.org/patch/606879/?series=3D136832&rev=3D1
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 48 +++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v6_0.c
> index 05c0df97f01d..ba1b7a36caa3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_panic.h>
>
>  #include "amdgpu.h"
>  #include "amdgpu_pm.h"
> @@ -2600,6 +2601,52 @@ static const struct drm_crtc_helper_funcs dce_v6_0=
_crtc_helper_funcs =3D {
>         .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
>  };
>
> +static int dce_v6_0_drm_primary_plane_get_scanout_buffer(struct drm_plan=
e *plane,
> +                                                        struct drm_scano=
ut_buffer *sb)
> +{
> +       struct drm_framebuffer *fb;
> +       struct amdgpu_bo *abo;
> +       struct amdgpu_crtc *amdgpu_crtc;
> +       struct amdgpu_device *adev;
> +       uint32_t fb_format;
> +
> +       if (!plane->fb)
> +               return -EINVAL;
> +
> +       fb =3D plane->fb;
> +
> +       abo =3D gem_to_amdgpu_bo(fb->obj[0]);
> +       amdgpu_crtc =3D to_amdgpu_crtc(plane->crtc);
> +       adev =3D drm_to_adev(fb->dev);
> +
> +       if (!abo->kmap.virtual &&
> +           ttm_bo_kmap(&abo->tbo, 0, PFN_UP(abo->tbo.base.size), &abo->k=
map)) {
> +               DRM_WARN("amdgpu bo map failed, panic won't be displayed\=
n");
> +               return -ENOMEM;
> +       }
> +
> +       if (abo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
> +               iosys_map_set_vaddr_iomem(&sb->map[0], abo->kmap.virtual)=
;
> +       else
> +               iosys_map_set_vaddr(&sb->map[0], abo->kmap.virtual);
> +
> +       sb->width =3D fb->width;
> +       sb->height =3D fb->height;
> +       sb->format =3D fb->format;
> +       sb->pitch[0] =3D fb->pitches[0];
> +
> +       /* Disable DC tiling */
> +       fb_format =3D RREG32(mmGRPH_CONTROL + amdgpu_crtc->crtc_offset);
> +       fb_format &=3D ~GRPH_ARRAY_MODE(0x7);
> +       WREG32(mmGRPH_CONTROL + amdgpu_crtc->crtc_offset, fb_format);
> +
> +       return 0;
> +}
> +
> +static const struct drm_plane_helper_funcs dce_v6_0_drm_primary_plane_he=
lper_funcs =3D {
> +       .get_scanout_buffer =3D dce_v6_0_drm_primary_plane_get_scanout_bu=
ffer
> +};
> +
>  static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
>  {
>         struct amdgpu_crtc *amdgpu_crtc;
> @@ -2627,6 +2674,7 @@ static int dce_v6_0_crtc_init(struct amdgpu_device =
*adev, int index)
>         amdgpu_crtc->encoder =3D NULL;
>         amdgpu_crtc->connector =3D NULL;
>         drm_crtc_helper_add(&amdgpu_crtc->base, &dce_v6_0_crtc_helper_fun=
cs);
> +       drm_plane_helper_add(amdgpu_crtc->base.primary, &dce_v6_0_drm_pri=
mary_plane_helper_funcs);
>
>         return 0;
>  }
> --
> 2.25.1
>
