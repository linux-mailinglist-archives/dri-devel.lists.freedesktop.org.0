Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DD894C2F1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 18:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A330210E791;
	Thu,  8 Aug 2024 16:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O89ZHlOE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5420010E78E;
 Thu,  8 Aug 2024 16:43:50 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-70d1cbbeeaeso953496b3a.0; 
 Thu, 08 Aug 2024 09:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723135430; x=1723740230; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BncAidYttaXwWTJrXVRaT/JdaRkWy8ih2u+dDbnusos=;
 b=O89ZHlOENkFCyPn5ltrMLqBNfWIRqHR3krXh674hTAggb0PvMufwZoT0JD7ava671J
 MRsqGIzm6g3fWiNNJeTHyldAsH9uYBEK18TpAYOQVhGQOZpHJ7rOrBxIToLELKLZxLoQ
 b6MSIKmbrCLY+wVbjOI+5YNRu1w02GVmOIQNpT8IjLhhBoY23/EUQ2DSbqTHE/Oyxk26
 KxIx1vOMIVrLXOfn73BaroD3o3cawTO5JWs51wiQrWEWdvKD9rO+X/fsup3dJJpbK12u
 fSpL7SjdVNugrgMtbws2+HJ9MjH+eZzYBqQ0WVlPHGeBxRE2stWTbcahhwtwKPYglywP
 C7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723135430; x=1723740230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BncAidYttaXwWTJrXVRaT/JdaRkWy8ih2u+dDbnusos=;
 b=c8PVEo21mD5npwzG9zm/8ZieDW7PndG6KtIpuD/+W7DI9c9YvbXr5U82sPUkp+WLwG
 Ts4TjunMq8oupjkGQVPU7YLW2IvrSG/jMqHl/rps2NjgDR7Ua5eBdTyXniLImZADHtF6
 223hM8FN/Zr3ifWGBKeez04dGpVuKh18Mt4riqV39MTfSyF/yu8ESoZufuBGdsqDZPY5
 LjgBiWaGFm1fTmFhDmY0N7bIyg5m/+TFZv3C114IYONmbJBZidbFEQDjGh1f/CORhMxK
 y7njvmtnbxX99DKJ6G9aj9q+OMcFsCASCpT5Yh20Mawy3ECiqp5Q+FTfHJZYqWWgWpL8
 aomQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLl3v4HOse2wLx6RajBqJG+BW+lOBnwsl4Y6NxiYOrGQN+HfDZmP5nH+SYyEA1nnXMRvh/6sXnkiiXg4aiRkZ8hzbNQnPbx73PztjzWL7wTT8x408Ow3RK8d3DrNtb5k5ljktp+Lvt1Yts0XEUVw==
X-Gm-Message-State: AOJu0Yxm2vSVBUMH93hX3oBkw9vxD5e/FK9vhqLi3Iq/+KNl0NsrEDYB
 nmid0o8FuZprCuAPwDJ+mt6VOCSkDpcWySVC5GahReC/U/rGdz3Xk6X64WQoKEuKLsj4hPwgwwG
 +V9Mlff1azKBK28k7068TaQOJVvw=
X-Google-Smtp-Source: AGHT+IHmwzgpU9ZIK7iJG45Xt+sTotIFrBcVrRJ/Q05dToUmheju3DBdj5rzaGq4Jys4eXNsEjDxlZf5yoTgyq8ffIQ=
X-Received: by 2002:a05:6a20:a11b:b0:1c6:a825:8bc1 with SMTP id
 adf61e73a8af0-1c6fcf623e8mr2951527637.29.1723135429712; Thu, 08 Aug 2024
 09:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240802071752.116541-1-yaolu@kylinos.cn>
 <20240808061538.502762-1-yaolu@kylinos.cn>
In-Reply-To: <20240808061538.502762-1-yaolu@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Aug 2024 12:43:37 -0400
Message-ID: <CADnq5_NH9hB4v4iyU8r8WB_bDYJGdoeYK4K8gb8ukP-=votW-A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add dce6 drm_panic support
To: Lu Yao <yaolu@kylinos.cn>
Cc: jfalempe@redhat.com, ckoenig.leichtzumerken@gmail.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 srinivasan.shanmugam@amd.com, sunil.khatri@amd.com, airlied@gmail.com, 
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Aug 8, 2024 at 2:35=E2=80=AFAM Lu Yao <yaolu@kylinos.cn> wrote:
>
> On 2024/8/5 17:25, Jocelyn Falempe wrote:
> >
> >
> > On 02/08/2024 11:39, Christian K=C3=B6nig wrote:
> >> Am 02.08.24 um 09:17 schrieb Lu Yao:
> >>> Add support for the drm_panic module, which displays a pretty user
> >>> friendly message on the screen when a Linux kernel panic occurs.
> >>>
> >>> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 32
> >>> +++++++++++++++++++++++++++
> >>>   1 file changed, 32 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> >>> b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> >>> index 05c0df97f01d..12c3801c264a 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> >>> @@ -28,6 +28,8 @@
> >>>   #include <drm/drm_modeset_helper.h>
> >>>   #include <drm/drm_modeset_helper_vtables.h>
> >>>   #include <drm/drm_vblank.h>
> >>> +#include <drm/drm_panic.h>
> >>
> >>> +#include "../../drm_internal.h"
> >>
> >> Well that this file is named "internal" and not in a common include
> >> directory is a strong indicator that you should absolutely *not*
> >> include it in a driver.
> >>
> >>>   #include "amdgpu.h"
> >>>   #include "amdgpu_pm.h"
> >>> @@ -2600,6 +2602,35 @@ static const struct drm_crtc_helper_funcs
> >>> dce_v6_0_crtc_helper_funcs =3D {
> >>>       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
> >>>   };
> >>> +static int dce_v6_0_drm_primary_plane_get_scanout_buffer(struct
> >>> drm_plane *plane,
> >>> +                             struct drm_scanout_buffer *sb)
> >>> +{
> >>> +    struct drm_framebuffer *fb;
> >>> +    struct drm_gem_object *obj;
> >>> +    struct amdgpu_bo *abo;
> >>> +    int ret =3D 0;
> >>> +
> >>> +    if (!plane->fb || plane->fb->modifier !=3D DRM_FORMAT_MOD_LINEAR=
)
> >>> +        return -ENODEV;
> >>> +
> >>> +    fb =3D plane->fb;
> >>> +    sb->width =3D fb->width;
> >>> +    sb->height =3D fb->height;
> >>> +    sb->format =3D fb->format;
> >>> +    sb->pitch[0] =3D fb->pitches[0];
> >>> +
> >>> +    obj =3D fb->obj[0];
> >>> +    abo =3D gem_to_amdgpu_bo(obj);
> >>> +    if (!abo || abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
> >>> +        return -EINVAL;
> >>> +
> >>> +    return drm_gem_vmap(obj, &sb->map[0]);
> >>
> >> Yeah that will almost always not work. Most display buffers are
> >> tilled and not CPU accessible.
> >
> > For the CPU accessible issue, Christian mentioned there was a debug
> > interface on AMD GPU that can be used, to work around this:
> >
> > https://lore.kernel.org/dri-devel/0baabe1f-8924-2c9a-5cd4-59084a37dbb2@=
gmail.com/
> > and
> > https://lore.kernel.org/dri-devel/d233c376-ed07-2127-6084-8292d313dac7@=
amd.com/
> >
> > And you will need to use the scanout_buffer->set_pixel() callback to
> > write the pixels one by one, similar to what I've tried for nouveau wit=
h
> > https://patchwork.freedesktop.org/series/133963/
> >
> > For the tiling format, the problem is that it is internal to the GPU,
> > and currently the driver don't know which tiling format is being used.
> >
> > It might be possible to disable tiling and compression, but it
> > requires some internal DC knowledge:
> > https://lore.kernel.org/dri-devel/f76a3297-7d63-8615-45c5-47f02b64a1d5@=
amd.com/
> >
> >
> > Best regards,
>
> From the discussion provided, it is difficult to implement this feature w=
ithout the relevant data book and knowledge.(Whether how tiled memory stora=
ge, or how to disable tiling of DC)

For DCE 6, the GRPH_ARRAY_MODE field in mmGRPH_CONTROL controls the
display tiling.  Set that field to GRPH_ARRAY_LINEAR_GENERAL (0) to
disable tiling.

Alex
