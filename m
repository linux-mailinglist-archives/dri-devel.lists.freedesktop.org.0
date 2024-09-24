Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9746898472E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 16:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DE410E6F5;
	Tue, 24 Sep 2024 14:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KPSmIfwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF0510E6F2;
 Tue, 24 Sep 2024 14:02:47 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-718e0421143so1111175b3a.0; 
 Tue, 24 Sep 2024 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727186567; x=1727791367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rjn9iKxlm6Sd+6XN6DcxEA/4SLhFIMgFLjUo0PYnDM=;
 b=KPSmIfwcCpHoLCjNhgawE/V/m9JwrUE4lfZR/20+6b/ut21lZ2HohlxplLcYXbS9r2
 pz568UQtd7QawZF32oXlMNkOKnctHGy8O5eD5ljj5gp5aQVLALCUlE/BH2prJEUdvm6F
 jdOsM54faXQwTdgL7qzF9faNv2kJvyAKMZHyT1grd0JiA+akok2g73lcpWn13z9/KpAs
 FJMKMErTLAY3+4zowE0AUi5Zfwlfzu/fwBkdOCxT1uB1hNr9ms9J0VMyFdvctqPolOLJ
 CfGjFEc4gIHoFsWD89RXkZ73ngTG8fERVk/uja0VwlbBd8Hf9su4JlKMty9+LyfhCBfC
 He/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727186567; x=1727791367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4rjn9iKxlm6Sd+6XN6DcxEA/4SLhFIMgFLjUo0PYnDM=;
 b=GSyQGaiqVohEuHPrDod1yRT+6p65HZO+1bVW4BGtxjumAXHOXdG3QKAQQyq+63oO6K
 kRrkBWhErlpsJkx1xEtw+nGhCN/tyNPIY718FzpIqDSjItItnI0d3amuKF/iez2ubFsD
 Cs81b/R59XQQRWjAW2J3Y8MXKXhmYNUZrgGPC+o3uNRa5GiB8U3b+iI0kKCldnjTxqbe
 +sfsVgzoQfEK6fv4WwNc86uWfS9N52WQf59E9hAtAnYxdK6paNdu1Y5/3uz28UcL8RaN
 0j2VD6s3HUw2b9AdQzkk+10yG/sbPkGLF6+6t0GizoqCXH0VOM8uTx9m6vEvI73HDv7q
 b4AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV25cdiR3akRPVE9fiwJs2Ivy++Rnqi22z2dhTPEvejSmPTNhVTtWIPBNVn7BEcxbxntteMNAjF@lists.freedesktop.org,
 AJvYcCVh+ttPmD4Neibn77iTr32uXHu2h6P4oRSWzj9orLYjSabK/xOYMd1Ixhaww1lT7KZ8RwtAkGUf1dbe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV6FBvXYMDaH3LL6Rrw3E5qmeaePcXocl/cbFROaqAkx2TZi6f
 ahJAYHCPECsWo659cXLXC5pvZIXW/qeyvhwxVOgaGkewNt6N11UY7hzPgh1XrEFHXvkG63gSgZb
 JIGu8L1qRihaCLckUrgFQHnxNsI4=
X-Google-Smtp-Source: AGHT+IE1PcaGG5MlOA5G50BEYkhHdz226rGnVOaCdEzWbvwdrUSDzSOAA624Ed9ZJ832fNZwZpAC9edRNln7NeFRyio=
X-Received: by 2002:a05:6a00:21d3:b0:718:e49f:246f with SMTP id
 d2e1a72fcca58-71afb71496amr1767124b3a.7.1727186566728; Tue, 24 Sep 2024
 07:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240802071752.116541-1-yaolu@kylinos.cn>
 <20240812060914.102614-1-yaolu@kylinos.cn>
 <CADnq5_OcUgV9dgAynDCQnm9NS+QCvhBiHvxWnhWqi2qqhh=zXg@mail.gmail.com>
 <16352ae0-7e61-440d-8c04-7ec912f9bf9a@redhat.com>
In-Reply-To: <16352ae0-7e61-440d-8c04-7ec912f9bf9a@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Sep 2024 10:02:35 -0400
Message-ID: <CADnq5_O7njHcvu0ejvVPPKF7szsbEQ8oFfHr9GTyD+zAe2EJ8g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: add dce6 drm_panic support
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Lu Yao <yaolu@kylinos.cn>, ckoenig.leichtzumerken@gmail.com,
 daniel@ffwll.ch, 
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

On Fri, Sep 20, 2024 at 11:36=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> On 17/09/2024 15:21, Alex Deucher wrote:
> > On Mon, Aug 12, 2024 at 2:10=E2=80=AFAM Lu Yao <yaolu@kylinos.cn> wrote=
:
> >>
> >> Add support for the drm_panic module, which displays a pretty user
> >> friendly message on the screen when a Linux kernel panic occurs.
> >>
> >> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> >
> > Patch looks good to me.  Any chance you want to convert the other
> > non-DC dce files (dce_v8_0.c, dce_v10_0.c, dce_v11_0.c) while you are
> > at it?
>
> I've made a similar patch in amdgpu_dm_plane.c, and it works on a Radeon
> pro w6400.
> But it only works when I'm in a VT terminal (so the framebuffer is
> linear and CPU accessible).
> When under Gnome/Wayland, the flag AMDGPU_GEM_CREATE_NO_CPU_ACCESS is
> set, so that means I can't vmap it ?

It just means that the application does not need CPU access.  Whether
or not the CPU can access the buffer or not depends on the size of the
PCI BAR.  E.g., if the driver or bios has resized the PCI BAR, then
the CPU can access the entire BAR, but if not you are generally
limited to the first 256M of framebuffer.

>
> Also I don't know if there is a similar way to disable
> tiling/compression on this hardware.

UNP_GRPH_CONTROL on chips with DCE display hardware and
DCSURF_ADDR_CONFIG and DCSURF_TILING_CONFIG on DCN display hardware.

Alex

>
> Best regards,
>
> --
>
> Jocelyn
>
>
> >
> > Alex
> >
> >
> >> ---
> >> Changes in v2:
> >> 1. Drop include "drm_internal.h"
> >> 2. Add disabling DC tiling ops.
> >> Per suggestion from previous thread:
> >> https://patchwork.freedesktop.org/patch/606879/?series=3D136832&rev=3D=
1
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 48 +++++++++++++++++++++++++=
++
> >>   1 file changed, 48 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/a=
md/amdgpu/dce_v6_0.c
> >> index 05c0df97f01d..ba1b7a36caa3 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> >> @@ -28,6 +28,7 @@
> >>   #include <drm/drm_modeset_helper.h>
> >>   #include <drm/drm_modeset_helper_vtables.h>
> >>   #include <drm/drm_vblank.h>
> >> +#include <drm/drm_panic.h>
> >>
> >>   #include "amdgpu.h"
> >>   #include "amdgpu_pm.h"
> >> @@ -2600,6 +2601,52 @@ static const struct drm_crtc_helper_funcs dce_v=
6_0_crtc_helper_funcs =3D {
> >>          .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
> >>   };
> >>
> >> +static int dce_v6_0_drm_primary_plane_get_scanout_buffer(struct drm_p=
lane *plane,
> >> +                                                        struct drm_sc=
anout_buffer *sb)
> >> +{
> >> +       struct drm_framebuffer *fb;
> >> +       struct amdgpu_bo *abo;
> >> +       struct amdgpu_crtc *amdgpu_crtc;
> >> +       struct amdgpu_device *adev;
> >> +       uint32_t fb_format;
> >> +
> >> +       if (!plane->fb)
> >> +               return -EINVAL;
> >> +
> >> +       fb =3D plane->fb;
> >> +
> >> +       abo =3D gem_to_amdgpu_bo(fb->obj[0]);
> >> +       amdgpu_crtc =3D to_amdgpu_crtc(plane->crtc);
> >> +       adev =3D drm_to_adev(fb->dev);
> >> +
> >> +       if (!abo->kmap.virtual &&
> >> +           ttm_bo_kmap(&abo->tbo, 0, PFN_UP(abo->tbo.base.size), &abo=
->kmap)) {
> >> +               DRM_WARN("amdgpu bo map failed, panic won't be display=
ed\n");
> >> +               return -ENOMEM;
> >> +       }
> >> +
> >> +       if (abo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
> >> +               iosys_map_set_vaddr_iomem(&sb->map[0], abo->kmap.virtu=
al);
> >> +       else
> >> +               iosys_map_set_vaddr(&sb->map[0], abo->kmap.virtual);
> >> +
> >> +       sb->width =3D fb->width;
> >> +       sb->height =3D fb->height;
> >> +       sb->format =3D fb->format;
> >> +       sb->pitch[0] =3D fb->pitches[0];
> >> +
> >> +       /* Disable DC tiling */
> >> +       fb_format =3D RREG32(mmGRPH_CONTROL + amdgpu_crtc->crtc_offset=
);
> >> +       fb_format &=3D ~GRPH_ARRAY_MODE(0x7);
> >> +       WREG32(mmGRPH_CONTROL + amdgpu_crtc->crtc_offset, fb_format);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static const struct drm_plane_helper_funcs dce_v6_0_drm_primary_plane=
_helper_funcs =3D {
> >> +       .get_scanout_buffer =3D dce_v6_0_drm_primary_plane_get_scanout=
_buffer
> >> +};
> >> +
> >>   static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
> >>   {
> >>          struct amdgpu_crtc *amdgpu_crtc;
> >> @@ -2627,6 +2674,7 @@ static int dce_v6_0_crtc_init(struct amdgpu_devi=
ce *adev, int index)
> >>          amdgpu_crtc->encoder =3D NULL;
> >>          amdgpu_crtc->connector =3D NULL;
> >>          drm_crtc_helper_add(&amdgpu_crtc->base, &dce_v6_0_crtc_helper=
_funcs);
> >> +       drm_plane_helper_add(amdgpu_crtc->base.primary, &dce_v6_0_drm_=
primary_plane_helper_funcs);
> >>
> >>          return 0;
> >>   }
> >> --
> >> 2.25.1
> >>
> >
>
