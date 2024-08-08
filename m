Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859694C3A5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 19:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D0A10E7A9;
	Thu,  8 Aug 2024 17:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SBPkIINs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97A010E7A7;
 Thu,  8 Aug 2024 17:25:09 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-7b396521ff6so983375a12.1; 
 Thu, 08 Aug 2024 10:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723137909; x=1723742709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R3iZ7fcb1MmjyjW9t+2rUZPHz66g5ifDib2eiW/PAao=;
 b=SBPkIINsoak0NiGg2zTO7f1QPVGTUQOAKWzXfgxo1noJaJcN3fxiPOFP+DCfC1IOzu
 KCxbZGlxMYzfA4z6iCrnzEuCqv43c0RxxFvQ7GxWnELfG/6jOcFmgH7S5CTLHKmbysye
 I3Ngcoa5G+APs93uXiNStXT5B1h9iHElPVJNkyA4M+F39ziCZv+RuwK5pfs/2fp4vYgL
 djnfzqYQdC87bS+XmRv/aMD2eFatBzlNbUFm/8qO9c25fCxPeSvu4hrwGx3SOeZBH+5y
 Sdm/eyR/h0dAdHH7JTvTr6Ui2Rz3S///Ti48WvGmBKFkfvbhcc84W3mjfBlM5M4ahfMS
 wcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723137909; x=1723742709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R3iZ7fcb1MmjyjW9t+2rUZPHz66g5ifDib2eiW/PAao=;
 b=eWT2seM28CrJtwbIz/CkJUmCAn2HIKVL/5pucfwFpPfuvK9DXwrNHv5WkfRKl4ZtRB
 S2pe5ZPtaGeVdmAUbNjdbbUKUcH2NLK/HVT/jdJXFvUT3q/G7bklbI2+gbEHyfyskesy
 hnceyT/DqTJInYjayZi1i9HtdfCSbPFHXQ5zEz9Z02hGDhuldmdDJZ/ZCO71I8jC3dth
 CT4T+q5ZLTMZKuaqWeluLnzHyHxu2hf0gKbonot9JC8SqnQwBGeYmWmZ17Z6ITIWler0
 7IuNBX+lkzKgCiSuyC6mnHmps+/UrJJ6CWFX9k8iLAd1MP8oXnRFQE32Spse7X/w0dUt
 BwSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUah+nP7kH/KH/X/xjQuuz+pXiD2Fs0NhNdNeb7ERifGmQKvSenrCGjQHIByFp2ITodbyJ3a1mvNyK2E8InrsNmIhPzvDfaY5rJ8qlXYui/pgL87uJjb4hUfEU/BaJDnUuR0ngMgqm9DXzyGXEjqA==
X-Gm-Message-State: AOJu0YyAVZ0wMsLnmUEs0m/PElE22x5WL8zCOXUh76E608hgdqu9rdLs
 OKIf7rG/0kZ00+sK8xDXKNXqIx8YJp3VSSgS1LXO8hESOshRNupb2jlJLV3aS7Y2ID2swYWgeAo
 6Yyv90Z0vPAKZKvIsmcdsInilUEo=
X-Google-Smtp-Source: AGHT+IFK10v9qSl1uG5G5L2+ylqJz2dYSvp5UB5lkFU4pz5Lh0Xi9t+TEluxdykFf+f8QXkF5YuF/Eful1fKeNGkda0=
X-Received: by 2002:a05:6a20:2450:b0:1c3:a760:9757 with SMTP id
 adf61e73a8af0-1c6fcfb1aa2mr3203319637.49.1723137909222; Thu, 08 Aug 2024
 10:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240802071752.116541-1-yaolu@kylinos.cn>
 <20240808061538.502762-1-yaolu@kylinos.cn>
 <CADnq5_NH9hB4v4iyU8r8WB_bDYJGdoeYK4K8gb8ukP-=votW-A@mail.gmail.com>
In-Reply-To: <CADnq5_NH9hB4v4iyU8r8WB_bDYJGdoeYK4K8gb8ukP-=votW-A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Aug 2024 13:24:57 -0400
Message-ID: <CADnq5_PDBZ9APfCpSMOSMPQWzcOeLqw_LngE2BBSOxv__7miGA@mail.gmail.com>
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

On Thu, Aug 8, 2024 at 12:43=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Thu, Aug 8, 2024 at 2:35=E2=80=AFAM Lu Yao <yaolu@kylinos.cn> wrote:
> >
> > On 2024/8/5 17:25, Jocelyn Falempe wrote:
> > >
> > >
> > > On 02/08/2024 11:39, Christian K=C3=B6nig wrote:
> > >> Am 02.08.24 um 09:17 schrieb Lu Yao:
> > >>> Add support for the drm_panic module, which displays a pretty user
> > >>> friendly message on the screen when a Linux kernel panic occurs.
> > >>>
> > >>> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> > >>> ---
> > >>>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 32
> > >>> +++++++++++++++++++++++++++
> > >>>   1 file changed, 32 insertions(+)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > >>> b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > >>> index 05c0df97f01d..12c3801c264a 100644
> > >>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > >>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > >>> @@ -28,6 +28,8 @@
> > >>>   #include <drm/drm_modeset_helper.h>
> > >>>   #include <drm/drm_modeset_helper_vtables.h>
> > >>>   #include <drm/drm_vblank.h>
> > >>> +#include <drm/drm_panic.h>
> > >>
> > >>> +#include "../../drm_internal.h"
> > >>
> > >> Well that this file is named "internal" and not in a common include
> > >> directory is a strong indicator that you should absolutely *not*
> > >> include it in a driver.
> > >>
> > >>>   #include "amdgpu.h"
> > >>>   #include "amdgpu_pm.h"
> > >>> @@ -2600,6 +2602,35 @@ static const struct drm_crtc_helper_funcs
> > >>> dce_v6_0_crtc_helper_funcs =3D {
> > >>>       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
> > >>>   };
> > >>> +static int dce_v6_0_drm_primary_plane_get_scanout_buffer(struct
> > >>> drm_plane *plane,
> > >>> +                             struct drm_scanout_buffer *sb)
> > >>> +{
> > >>> +    struct drm_framebuffer *fb;
> > >>> +    struct drm_gem_object *obj;
> > >>> +    struct amdgpu_bo *abo;
> > >>> +    int ret =3D 0;
> > >>> +
> > >>> +    if (!plane->fb || plane->fb->modifier !=3D DRM_FORMAT_MOD_LINE=
AR)
> > >>> +        return -ENODEV;
> > >>> +
> > >>> +    fb =3D plane->fb;
> > >>> +    sb->width =3D fb->width;
> > >>> +    sb->height =3D fb->height;
> > >>> +    sb->format =3D fb->format;
> > >>> +    sb->pitch[0] =3D fb->pitches[0];
> > >>> +
> > >>> +    obj =3D fb->obj[0];
> > >>> +    abo =3D gem_to_amdgpu_bo(obj);
> > >>> +    if (!abo || abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
> > >>> +        return -EINVAL;
> > >>> +
> > >>> +    return drm_gem_vmap(obj, &sb->map[0]);
> > >>
> > >> Yeah that will almost always not work. Most display buffers are
> > >> tilled and not CPU accessible.
> > >
> > > For the CPU accessible issue, Christian mentioned there was a debug
> > > interface on AMD GPU that can be used, to work around this:
> > >
> > > https://lore.kernel.org/dri-devel/0baabe1f-8924-2c9a-5cd4-59084a37dbb=
2@gmail.com/
> > > and
> > > https://lore.kernel.org/dri-devel/d233c376-ed07-2127-6084-8292d313dac=
7@amd.com/
> > >
> > > And you will need to use the scanout_buffer->set_pixel() callback to
> > > write the pixels one by one, similar to what I've tried for nouveau w=
ith
> > > https://patchwork.freedesktop.org/series/133963/
> > >
> > > For the tiling format, the problem is that it is internal to the GPU,
> > > and currently the driver don't know which tiling format is being used=
.
> > >
> > > It might be possible to disable tiling and compression, but it
> > > requires some internal DC knowledge:
> > > https://lore.kernel.org/dri-devel/f76a3297-7d63-8615-45c5-47f02b64a1d=
5@amd.com/
> > >
> > >
> > > Best regards,
> >
> > From the discussion provided, it is difficult to implement this feature=
 without the relevant data book and knowledge.(Whether how tiled memory sto=
rage, or how to disable tiling of DC)
>
> For DCE 6, the GRPH_ARRAY_MODE field in mmGRPH_CONTROL controls the
> display tiling.  Set that field to GRPH_ARRAY_LINEAR_GENERAL (0) to
> disable tiling.

For clarity that register is instanced so use mmGRPH_CONTROL +
amdgpu_crtc->crtc_offset to get the right instance.

Alex

>
> Alex
