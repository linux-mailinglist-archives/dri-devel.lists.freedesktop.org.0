Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6D39B4C0E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 15:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56BF8876A;
	Tue, 29 Oct 2024 14:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="To4CsD2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DC58876A;
 Tue, 29 Oct 2024 14:28:22 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-7c3d415f85eso711424a12.0; 
 Tue, 29 Oct 2024 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730212102; x=1730816902; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFVCo6tWC/3dzlDBM+Awij2EzTHybBWBHz3nkZlsvGg=;
 b=To4CsD2qDg0HnqFTJbWXRqZeOLmYADfFtV3nJM0wE5IgCga4z8wnlzy9Fwz2h+ndUi
 bmOhL0am5BEVkkXhqinGDvFFrDbRDG3LFV5Vz5M5hpVzBBja8319KAojVqYT5VCJeV3W
 AC7nQaTu9cGVaDFmdmOSu4g1nugtaa1nrWrzD8fZmCcTTXY40ce2NGiHou1mzFJzv8Gk
 6WAOfK5+TSiCXc45HdfBJHdBm7xNyHhruGrOgVbPoDkhL9H8IRTHJlWMk46ttkbIh4io
 b6JhPipAqN0ClqXD7/HOcuEqm4ZT3Cwg6k9YQc7WaIJ0xSWWLSp0kaKtFN+tcd+/Q00s
 UbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730212102; x=1730816902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFVCo6tWC/3dzlDBM+Awij2EzTHybBWBHz3nkZlsvGg=;
 b=twh7oKVnOpze/42tyxDkTP2ouAqjKNeFiNDOpZ1jwhTgz5ndxP/lVZ4Ptl2BqCpyMZ
 Xd7cEIN3JOe+bfUznz1JaohyGMHjAel9/KxRrA3YmF08aR36AVw9gWVC0wLR9NTPaYBK
 LESfN62Jfszh7u7HFIuxcrDnRkITZmjw/txi00VXuLUz+x5hE7IxEGOq8Ohkf68X4eHT
 GlLx8Klf0A8s++Zb2zqQ5dFAQ88yhjRa30C0IjenwNDMsoIElXUf7vNVBfpPTbsPJsOB
 wRQ1Nc97fI5JQvjftLesGbMTyi2BpKEvAdqt5/FlwfnfOArVf6O5EEc8toonURL2aRS8
 hc6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzZ9z3/TJ04l11zl7fv0ipdzT68GtYkd34r7ryKwU5ZMA4Y+PLToTLNzZTnr6h1ietsZSOt4UrjfEq@lists.freedesktop.org,
 AJvYcCX2dE0+R3akFLwCaw1ddTlVLUT6JP/vICI3wlhzyakYmodyARNgM09BpfhcHzb8AEIId293d4Na@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/KIS/CTOQaOfa4+Hqtlttf2Ds0gUa+hFNpMgSQlDVlMRaqarZ
 2KGX2h6sx6j5iKr3QJucYRvzRFWq/xm++OeImqfIKi9BxTdAERvSTwY9Alb/oLh91Q8wP+jrZyn
 O3kf4kC2ASu8bHaMXiTU5eUavyMI=
X-Google-Smtp-Source: AGHT+IEkvqBI3/8hjp2lXdJldAQa5W4d+W9G1Kztg7vJK+yd1OAuMPKaKKLTKVqReRuM6aM7DSmUwP26lIzj8z+eLDI=
X-Received: by 2002:a05:6a21:6d9d:b0:1cf:3a64:cd5c with SMTP id
 adf61e73a8af0-1d9a83aec36mr7473552637.1.1730212101750; Tue, 29 Oct 2024
 07:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240802071752.116541-1-yaolu@kylinos.cn>
 <20240812060914.102614-1-yaolu@kylinos.cn>
In-Reply-To: <20240812060914.102614-1-yaolu@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Oct 2024 10:28:10 -0400
Message-ID: <CADnq5_MR1p+Q2cM9wQNQ8xmfDsX=O1sTBUASiBaueFhyfZE6-Q@mail.gmail.com>
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

Applied.  Thanks.

Alex

On Mon, Aug 12, 2024 at 2:10=E2=80=AFAM Lu Yao <yaolu@kylinos.cn> wrote:
>
> Add support for the drm_panic module, which displays a pretty user
> friendly message on the screen when a Linux kernel panic occurs.
>
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
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
