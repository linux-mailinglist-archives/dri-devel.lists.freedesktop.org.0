Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C673E0D1A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 06:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5652A89D7F;
	Thu,  5 Aug 2021 04:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0D489D77;
 Thu,  5 Aug 2021 04:24:30 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id o20so5713625oiw.12;
 Wed, 04 Aug 2021 21:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mx4Kord6zTXQ2AHtUR9gYl7dYZ7Wm3q9Z8baSsaWGGk=;
 b=tx3oPsKCPCGoYBND6Nhy63gACxEMsk32s07E9h3lw+/pYBIuBPplIfUFkXFlI4au6p
 gP1u2FR7KqdUcBmv9n1wNQWri5wwnDAJqHNj4FI+J5BNooAHLc06cHGN+OD/+xGSsjWz
 lycXhkXl5KW81Y9GUzTlscc2Ru5j8SN0tLRHRn6xcQkZEOxlwNrA10mL0dZaZw3OuKJV
 +ePLlKaXbPXTVpoiUvNXZy/1z8VE1ofpExczaMVlzzyvDM1BL3yE0ohmlErmAiA6vgP9
 G1gQlEgbMcPuzOlP4EmuJCxpn/XhkhSop1px/nFqDO8C5vO3sh/DG06qBXfKLy19AOTa
 +PqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mx4Kord6zTXQ2AHtUR9gYl7dYZ7Wm3q9Z8baSsaWGGk=;
 b=Upj/bsyAkifnkPir2oX5cPppt+GKyUvIZ5dnSSHcT0KZCIhtUVdNB6RrOqOHqjxY5O
 nsWmb6An7vwK12UDCY4+eqERVX+S4mqGzmWlMpdd3E8hpTQzfi3AeVMhSKzVrrlurei2
 ViPrEoneCL1cWJsKsBlkon2C1TsbAQtZ7uohQGlVdmNqvPeWtQ6plApIk9fYx5aLBJKT
 nCye7NahA0NMTZKKkjvLxRKkbtf64qhPT1LJzUEydWsqHWOBqjbGXjIxSO12KjtPFRC7
 +gcKe9J/rwxYCpcKiMtr7uS3NcvuvnUrAxafgJpjXOkznjr/Pp4vH3DI8TtIGIZ0WzgP
 ir2w==
X-Gm-Message-State: AOAM532dxSeSodybLLMnzUpHZXwhmUxMYCeA2yGb4TtmmFNsLR6pmbu3
 u9mVLqnDr4GrXR2qcBjzHNndi5hpEsMQmz8dmSU=
X-Google-Smtp-Source: ABdhPJzjbm3lm2cdyTcXr/QdAdYMm09SzmciQV1kx6z/cMRGFL/YK5/2sBJ8IyV2aJ0QMeVuU3dLOnceKtvVqt3ZBN0=
X-Received: by 2002:a05:6808:6d2:: with SMTP id
 m18mr2034781oih.120.1628137469637; 
 Wed, 04 Aug 2021 21:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210804023842.1996299-1-lizhenneng@kylinos.cn>
In-Reply-To: <20210804023842.1996299-1-lizhenneng@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Aug 2021 00:24:18 -0400
Message-ID: <CADnq5_N349bj0OrNTHRZuWDrHSRanCRJqhMb0NS97o3rNfCiiw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon: Update pitch for page flip
To: Zhenneng Li <lizhenneng@kylinos.cn>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Tue, Aug 3, 2021 at 10:39 PM Zhenneng Li <lizhenneng@kylinos.cn> wrote:
>
>
> When primary bo is updated, crtc's pitch may
> have not been updated, this will lead to show
> disorder content when user changes display mode,
> we update crtc's pitch in page flip to avoid
> this bug.
> This refers to amdgpu's pageflip.
>
> v1->v2:
> Update all of the pitch in all of the page_flip functions
> in radeon rather than just the evergreen one.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> ---
>  drivers/gpu/drm/radeon/evergreen.c | 8 +++++++-
>  drivers/gpu/drm/radeon/r100.c      | 5 +++++
>  drivers/gpu/drm/radeon/rs600.c     | 8 +++++++-
>  drivers/gpu/drm/radeon/rv770.c     | 8 +++++++-
>  4 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/=
evergreen.c
> index 36a888e1b179..eeb590d2dec2 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -28,6 +28,7 @@
>
>  #include <drm/drm_vblank.h>
>  #include <drm/radeon_drm.h>
> +#include <drm/drm_fourcc.h>
>
>  #include "atom.h"
>  #include "avivod.h"
> @@ -1414,10 +1415,15 @@ void evergreen_page_flip(struct radeon_device *rd=
ev, int crtc_id, u64 crtc_base,
>                          bool async)
>  {
>         struct radeon_crtc *radeon_crtc =3D rdev->mode_info.crtcs[crtc_id=
];
> +       struct drm_framebuffer *fb =3D radeon_crtc->base.primary->fb;
>
> -       /* update the scanout addresses */
> +       /* flip at hsync for async, default is vsync */
>         WREG32(EVERGREEN_GRPH_FLIP_CONTROL + radeon_crtc->crtc_offset,
>                async ? EVERGREEN_GRPH_SURFACE_UPDATE_H_RETRACE_EN : 0);
> +       /* update pitch */
> +       WREG32(EVERGREEN_GRPH_PITCH + radeon_crtc->crtc_offset,
> +              fb->pitches[0] / fb->format->cpp[0]);
> +       /* update the scanout addresses */
>         WREG32(EVERGREEN_GRPH_PRIMARY_SURFACE_ADDRESS_HIGH + radeon_crtc-=
>crtc_offset,
>                upper_32_bits(crtc_base));
>         WREG32(EVERGREEN_GRPH_PRIMARY_SURFACE_ADDRESS + radeon_crtc->crtc=
_offset,
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.=
c
> index ba724198b72e..1268854552ff 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -162,6 +162,7 @@ void r100_wait_for_vblank(struct radeon_device *rdev,=
 int crtc)
>  void r100_page_flip(struct radeon_device *rdev, int crtc_id, u64 crtc_ba=
se, bool async)
>  {
>         struct radeon_crtc *radeon_crtc =3D rdev->mode_info.crtcs[crtc_id=
];
> +       struct drm_framebuffer *fb =3D radeon_crtc->base.primary->fb;
>         u32 tmp =3D ((u32)crtc_base) | RADEON_CRTC_OFFSET__OFFSET_LOCK;
>         int i;
>
> @@ -169,6 +170,10 @@ void r100_page_flip(struct radeon_device *rdev, int =
crtc_id, u64 crtc_base, bool
>         /* update the scanout addresses */
>         WREG32(RADEON_CRTC_OFFSET + radeon_crtc->crtc_offset, tmp);
>
> +       /* update pitch */
> +       WREG32(RADEON_CRTC_PITCH + radeon_crtc->crtc_offset,
> +              fb->pitches[0] / fb->format->cpp[0]);
> +

This needs the follow formatting (from radeon_legacy_crtc.c):
        pitch_pixels =3D fb->pitches[0] / fb->format->cpp[0];
        crtc_pitch =3D DIV_ROUND_UP(pitch_pixels * fb->format->cpp[0] * 8,
                              fb->format->cpp[0] * 8 * 8);
        crtc_pitch |=3D crtc_pitch << 16;
WREG32(RADEON_CRTC_PITCH + radeon_crtc->crtc_offset, crtc_pitch);

With that fixed,
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>         /* Wait for update_pending to go high. */
>         for (i =3D 0; i < rdev->usec_timeout; i++) {
>                 if (RREG32(RADEON_CRTC_OFFSET + radeon_crtc->crtc_offset)=
 & RADEON_CRTC_OFFSET__GUI_TRIG_OFFSET)
> diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs60=
0.c
> index b2d22e25eee1..b87dd551e939 100644
> --- a/drivers/gpu/drm/radeon/rs600.c
> +++ b/drivers/gpu/drm/radeon/rs600.c
> @@ -41,6 +41,7 @@
>
>  #include <drm/drm_device.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_fourcc.h>
>
>  #include "atom.h"
>  #include "radeon.h"
> @@ -118,6 +119,7 @@ void avivo_wait_for_vblank(struct radeon_device *rdev=
, int crtc)
>  void rs600_page_flip(struct radeon_device *rdev, int crtc_id, u64 crtc_b=
ase, bool async)
>  {
>         struct radeon_crtc *radeon_crtc =3D rdev->mode_info.crtcs[crtc_id=
];
> +       struct drm_framebuffer *fb =3D radeon_crtc->base.primary->fb;
>         u32 tmp =3D RREG32(AVIVO_D1GRPH_UPDATE + radeon_crtc->crtc_offset=
);
>         int i;
>
> @@ -125,9 +127,13 @@ void rs600_page_flip(struct radeon_device *rdev, int=
 crtc_id, u64 crtc_base, boo
>         tmp |=3D AVIVO_D1GRPH_UPDATE_LOCK;
>         WREG32(AVIVO_D1GRPH_UPDATE + radeon_crtc->crtc_offset, tmp);
>
> -       /* update the scanout addresses */
> +       /* flip at hsync for async, default is vsync */
>         WREG32(AVIVO_D1GRPH_FLIP_CONTROL + radeon_crtc->crtc_offset,
>                async ? AVIVO_D1GRPH_SURFACE_UPDATE_H_RETRACE_EN : 0);
> +       /* update pitch */
> +       WREG32(AVIVO_D1GRPH_PITCH + radeon_crtc->crtc_offset,
> +              fb->pitches[0] / fb->format->cpp[0]);
> +       /* update the scanout addresses */
>         WREG32(AVIVO_D1GRPH_SECONDARY_SURFACE_ADDRESS + radeon_crtc->crtc=
_offset,
>                (u32)crtc_base);
>         WREG32(AVIVO_D1GRPH_PRIMARY_SURFACE_ADDRESS + radeon_crtc->crtc_o=
ffset,
> diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv77=
0.c
> index 74499307285b..e592e57be1bb 100644
> --- a/drivers/gpu/drm/radeon/rv770.c
> +++ b/drivers/gpu/drm/radeon/rv770.c
> @@ -32,6 +32,7 @@
>
>  #include <drm/drm_device.h>
>  #include <drm/radeon_drm.h>
> +#include <drm/drm_fourcc.h>
>
>  #include "atom.h"
>  #include "avivod.h"
> @@ -809,6 +810,7 @@ u32 rv770_get_xclk(struct radeon_device *rdev)
>  void rv770_page_flip(struct radeon_device *rdev, int crtc_id, u64 crtc_b=
ase, bool async)
>  {
>         struct radeon_crtc *radeon_crtc =3D rdev->mode_info.crtcs[crtc_id=
];
> +       struct drm_framebuffer *fb =3D radeon_crtc->base.primary->fb;
>         u32 tmp =3D RREG32(AVIVO_D1GRPH_UPDATE + radeon_crtc->crtc_offset=
);
>         int i;
>
> @@ -816,9 +818,13 @@ void rv770_page_flip(struct radeon_device *rdev, int=
 crtc_id, u64 crtc_base, boo
>         tmp |=3D AVIVO_D1GRPH_UPDATE_LOCK;
>         WREG32(AVIVO_D1GRPH_UPDATE + radeon_crtc->crtc_offset, tmp);
>
> -       /* update the scanout addresses */
> +       /* flip at hsync for async, default is vsync */
>         WREG32(AVIVO_D1GRPH_FLIP_CONTROL + radeon_crtc->crtc_offset,
>                async ? AVIVO_D1GRPH_SURFACE_UPDATE_H_RETRACE_EN : 0);
> +       /* update pitch */
> +       WREG32(AVIVO_D1GRPH_PITCH + radeon_crtc->crtc_offset,
> +              fb->pitches[0] / fb->format->cpp[0]);
> +       /* update the scanout addresses */
>         if (radeon_crtc->crtc_id) {
>                 WREG32(D2GRPH_SECONDARY_SURFACE_ADDRESS_HIGH, upper_32_bi=
ts(crtc_base));
>                 WREG32(D2GRPH_PRIMARY_SURFACE_ADDRESS_HIGH, upper_32_bits=
(crtc_base));
> --
> 2.25.1
>
> Content-type: Text/plain
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
