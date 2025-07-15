Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF530B065EB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 20:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A14E10E626;
	Tue, 15 Jul 2025 18:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UILQVPFA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8523910E626;
 Tue, 15 Jul 2025 18:22:16 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-234d3103237so9931505ad.0; 
 Tue, 15 Jul 2025 11:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752603736; x=1753208536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3i0d7K/m1ivRJS+25k3JtFXmbsF3WLLGXFW/EO7+BSc=;
 b=UILQVPFAtJvT4QRSzWTmbUrdYdWvBBaG6Yz5dDefwjDDRJxsbBStApORB40dp+A1zq
 HYja/qi/oObS7mAMRpSoPO0wMnUBI8YhsRR3OwREoI5JBJfBVH7QvoYthsW4cDfSZeI3
 pUZMWM4gBDe/fYbYQqaEHl9FE9V9BK6+HVD008d4gTIzGELy7XHm5N17CEiRzrLEAAoU
 OZbZ3dw9GZX9tQjyewRyQ363xuziEtumFajkvsEQE2NpTlLWbWYdH6bC4OAJ8kMMZzir
 w1Cj2fG9bTY/v/V5ecZkcIFG2i4nKpGDKCMIffBNuSRH4yiNp8HM6Z7Im4xh8bPSe4je
 3hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752603736; x=1753208536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3i0d7K/m1ivRJS+25k3JtFXmbsF3WLLGXFW/EO7+BSc=;
 b=RDAzANRserbDtMiaZRnbWK+VIk2E3DUG13BuzSWvwgjqakXRaCbOwS0/CrOnBxalBk
 jPA9ZsLRsnTYJEmLPNbilIVquPDKDSzJDN5pJGoLYBpzyTKF1vCHeLcqeJsp79sZ8WAX
 XHDpPQ20joECm4tFDlj+qd1E3FghpKQriJGC/41mhJ72hS6eYsU2mq98oZ38lodywGtq
 nmmWYwRCapUEcG41GPS/elY3QPjEMPjPkiOb1vf3cZrtP4rB77ADqROamHksJMWr2VVQ
 0J/5UXDKSBsLMgjfy/sFQlE2rpBfYXjikHf10JXalQrKaQHjBoBDSEjnUGgK8CVCzy1y
 b2Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHOQfMS839Aiqpd4BshN871pABes3Uswdwbi/XXd/bvyZ4GBU5jx1YNv7skcFDA6Z/C+Gj4DxzK78=@lists.freedesktop.org,
 AJvYcCXsV07nAs94+LkNXl42FPPk+uvyZItOOO2Q1BknlAYT4Ww66F71gBDqofJXpVpzqSu1BN/ubFXpzaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6vxE/amfAWxNa/OZgMHoazpL2LuzuQQkP5bUTnHSM0owt28I6
 SawOE/J1GrTTidHS8/QikZL8SiKEMaOkOpVFItjWM3adEhWGaga9LiMccrkHHiT8kUR4jpFUCK5
 Rm6oxaP/87+3YLJTp14rgOKKCeTNH1w0Abw==
X-Gm-Gg: ASbGncvu/FARpf7ZawxuhhI87ERRcKhLFDUAqMD6MqcjqHXTkrl2bKowbcrx/HYgfDs
 e8f3TnZwSRqR8sHg84Rq/3LxZPO+rvlwOhNLA9CwS1nkgScj2B++ilOnruev40wMUsFi4/TopC3
 Q9cbjNqF9ndYij+a9zTycADK9EQS/Vmh4mJgtTmmjH2GbDqD6HCmms/+N40o8/6J0rF4+GPfK+c
 DOHE1vL
X-Google-Smtp-Source: AGHT+IGhBA71++U3RqR2GbtbwwGX3MQRe8yIO168jiIAz8UjCxvsxCv8c4f0Uuqw4T73LDGi7cUgwuAN53oUQIwYpTY=
X-Received: by 2002:a17:90a:da8d:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-31c9e75ef95mr95073a91.3.1752603735927; Tue, 15 Jul 2025
 11:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <CADnq5_Nu1aguqutQsRZZ3TMgWTzTdsR69Ysht9FP5GRQ8JA5pg@mail.gmail.com>
In-Reply-To: <CADnq5_Nu1aguqutQsRZZ3TMgWTzTdsR69Ysht9FP5GRQ8JA5pg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Jul 2025 14:22:04 -0400
X-Gm-Features: Ac12FXw_KGUMycc48MboGthk1mttTBArUQt1TRqXWjC8YL8Fr7Y6enP0x3OTHFk
Message-ID: <CADnq5_MP5ED7+25qNWwTZB-1YZj_CYeR09w_ovKkXeMS0Cz_6A@mail.gmail.com>
Subject: Re: [PATCH 00/19] drm: Eliminate redundant drm_format_info lookups
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
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

On Tue, Jul 15, 2025 at 2:21=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Thu, Apr 10, 2025 at 12:44=E2=80=AFPM Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> >
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >
> > I noticed a bunch of redundant (and rather expensive) drm_format_info
> > lookups in some traces recently. This series is an attempt to eliminate
> > them.
>
> Series is:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Feel free to take the amdgpu/radeon bits through drm-misc.

Sorry, I replied to the wrong thread.  Ignore.

Alex

>
> Alex
>
> >
> > Ville Syrj=C3=A4l=C3=A4 (19):
> >   drm: Pass pixel_format+modifier to .get_format_info()
> >   drm: Pass pixel_format+modifier directly to drm_get_format_info()
> >   drm: Look up the format info earlier
> >   drm: Pass the format info to .fb_create()
> >   drm: Allow the caller to pass in the format info to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/malidp: Pass along the format info from .fb_create()
> >     malidp_verify_afbc_framebuffer_size()
> >   drm/gem: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/gem/afbc: Eliminate redundant drm_get_format_info()
> >   drm/amdgpu: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/armada: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/exynos: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/gma500: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/i915: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/komeda: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/msm: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/tegra: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/virtio: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm/vmwgfx: Pass along the format info from .fb_create() to
> >     drm_helper_mode_fill_fb_struct()
> >   drm: Make passing of format info to drm_helper_mode_fill_fb_struct()
> >     mandatory
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |  1 +
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  4 +-
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |  2 +-
> >  .../arm/display/komeda/komeda_framebuffer.c   |  3 +-
> >  .../arm/display/komeda/komeda_framebuffer.h   |  1 +
> >  drivers/gpu/drm/arm/malidp_drv.c              | 12 +++---
> >  drivers/gpu/drm/armada/armada_fb.c            | 12 +++---
> >  drivers/gpu/drm/armada/armada_fb.h            |  4 +-
> >  drivers/gpu/drm/armada/armada_fbdev.c         |  5 ++-
> >  drivers/gpu/drm/drm_fourcc.c                  |  7 ++--
> >  drivers/gpu/drm/drm_framebuffer.c             | 27 ++++++-------
> >  drivers/gpu/drm/drm_gem_framebuffer_helper.c  | 38 ++++++++-----------
> >  drivers/gpu/drm/drm_modeset_helper.c          |  4 +-
> >  drivers/gpu/drm/exynos/exynos_drm_fb.c        |  7 ++--
> >  drivers/gpu/drm/exynos/exynos_drm_fb.h        |  1 +
> >  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  5 ++-
> >  drivers/gpu/drm/gma500/fbdev.c                |  5 ++-
> >  drivers/gpu/drm/gma500/framebuffer.c          | 14 ++++---
> >  drivers/gpu/drm/gma500/psb_drv.h              |  1 +
> >  drivers/gpu/drm/i915/display/intel_fb.c       | 18 +++++----
> >  drivers/gpu/drm/i915/display/intel_fb.h       |  5 ++-
> >  drivers/gpu/drm/i915/display/intel_fbdev_fb.c |  6 ++-
> >  .../drm/i915/display/intel_plane_initial.c    |  3 +-
> >  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  5 ++-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +--
> >  drivers/gpu/drm/msm/msm_drv.h                 |  3 +-
> >  drivers/gpu/drm/msm/msm_fb.c                  | 18 +++++----
> >  drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  9 +----
> >  drivers/gpu/drm/nouveau/nouveau_display.c     |  6 ++-
> >  drivers/gpu/drm/nouveau/nouveau_display.h     |  1 +
> >  drivers/gpu/drm/omapdrm/omap_fb.c             | 10 ++---
> >  drivers/gpu/drm/omapdrm/omap_fb.h             |  3 +-
> >  drivers/gpu/drm/qxl/qxl_display.c             |  3 +-
> >  drivers/gpu/drm/radeon/radeon_display.c       |  3 +-
> >  drivers/gpu/drm/radeon/radeon_fbdev.c         |  3 +-
> >  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  3 +-
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  3 +-
> >  .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  |  3 +-
> >  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    | 11 ++----
> >  drivers/gpu/drm/tegra/drm.h                   |  2 +
> >  drivers/gpu/drm/tegra/fb.c                    |  7 ++--
> >  drivers/gpu/drm/tegra/fbdev.c                 |  4 +-
> >  drivers/gpu/drm/tests/drm_framebuffer_test.c  |  1 +
> >  drivers/gpu/drm/vc4/vc4_kms.c                 |  3 +-
> >  drivers/gpu/drm/virtio/virtgpu_display.c      |  6 ++-
> >  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 +++++---
> >  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  1 +
> >  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  6 ++-
> >  drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
> >  drivers/gpu/drm/xen/xen_drm_front_kms.c       |  3 +-
> >  drivers/gpu/drm/xlnx/zynqmp_kms.c             |  3 +-
> >  include/drm/drm_fourcc.h                      |  2 +-
> >  include/drm/drm_gem_framebuffer_helper.h      |  6 +++
> >  include/drm/drm_mode_config.h                 |  3 +-
> >  include/drm/drm_modeset_helper.h              |  2 +
> >  56 files changed, 207 insertions(+), 139 deletions(-)
> >
> > --
> > 2.49.0
> >
