Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B863E1CD8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9918E6EB38;
	Thu,  5 Aug 2021 19:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE946EB33;
 Thu,  5 Aug 2021 19:38:03 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 f20-20020a9d6c140000b02904bb9756274cso6322440otq.6; 
 Thu, 05 Aug 2021 12:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qGql2kP6u0F1T/OSF5hOTtfIvp5kLuaP39PZG9Vm0a8=;
 b=iHMg5xHLcIWWgdMmvA90FpZskd1g0rl92Kkl3iFTit4W1uvQ7Ps4MQSdkYsiAxaFzI
 dq+GMsxOBHa3OXW7w3fSQCVKiuFG9ne+6Qkb23E5OnwGcK5TxdnfKvUjqRIOJZfiEf+/
 Gmhw092n2OW/9Y7v6HbRIWoAByoR/bZcvxoewaGotdiFFQjf4iYi/THde5YggMtun5gU
 nyRbTZjvUAYY10MbtEx8od598Y1tfyKXMFpfoaFiz/wb4q5JCDa3XR4wt8X/OMQ0CsiA
 Q6fdK9WpZgUoaOaXFPYIVOKhEFwBSGa6LBYEpM7EmE+VgBwHWrA4n0J3kUFX2bey5hhF
 +fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qGql2kP6u0F1T/OSF5hOTtfIvp5kLuaP39PZG9Vm0a8=;
 b=sPmARztPLmcrJEdUA/Sj/cY2KW01uuD6NMzeA7aHWygLCj3FNtozyACpS/A0nmXPmI
 Lqm5Cs4GivBNYLMPWX+PDuALvmR7c+uH50selbrbseXwBUm0noR1uPu13ZAhmcqmGQTP
 MWZqa/kJYV0J13keNne0+h/8+BO03QLKtRQTLfDZlxYnVWaYcfwo4mJdqIIYSYAPFn0y
 e6OTwvnyHb9dsQdI43rj8oaMfwho3c+CYY++eeCFp5oUfUxZQgPlrGznDwdfX/TFfDwv
 vI/EYY20MidD5knv76s0Ru64mgcrXpcN9PNOI38pjDJYm8SnNMjW9mPF0FmksAOGIZ+g
 5K+g==
X-Gm-Message-State: AOAM532TQA+Z2m0SFaDoLHuhu7qC/guHOd0LgyM9VDx7cm/5fIxCgBIB
 1A9FdEKChxq5KPrFO9pMa385lDWWyKfym9f9I+I=
X-Google-Smtp-Source: ABdhPJxHYEUD7KngGDlFf1Q1mnFx7ICgoirNnqFRFnDghNSxd0dQ6DKoBMxhtzCGOaFO56Xg3PP2Ct7TawVzIOxpBsE=
X-Received: by 2002:a05:6830:1c2f:: with SMTP id
 f15mr4905393ote.23.1628192283004; 
 Thu, 05 Aug 2021 12:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104557.306886-1-lizhenneng@kylinos.cn>
In-Reply-To: <20210805104557.306886-1-lizhenneng@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Aug 2021 15:37:51 -0400
Message-ID: <CADnq5_O9No8kH9ss-OoqW7tpQ_2MjXzHWS3uEtq2q7viOeBemg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/radeon: Update pitch for page flip
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

On Thu, Aug 5, 2021 at 6:46 AM Zhenneng Li <lizhenneng@kylinos.cn> wrote:
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
> v2->v3:
> Update pitch set method for r100 according to
> radeon_legacy_crtc.c
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

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/radeon/evergreen.c | 8 +++++++-
>  drivers/gpu/drm/radeon/r100.c      | 9 +++++++++
>  drivers/gpu/drm/radeon/rs600.c     | 8 +++++++-
>  drivers/gpu/drm/radeon/rv770.c     | 8 +++++++-
>  4 files changed, 30 insertions(+), 3 deletions(-)
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
> index ba724198b72e..2dd85ba1faa2 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -162,6 +162,8 @@ void r100_wait_for_vblank(struct radeon_device *rdev,=
 int crtc)
>  void r100_page_flip(struct radeon_device *rdev, int crtc_id, u64 crtc_ba=
se, bool async)
>  {
>         struct radeon_crtc *radeon_crtc =3D rdev->mode_info.crtcs[crtc_id=
];
> +       uint32_t crtc_pitch, pitch_pixels;
> +       struct drm_framebuffer *fb =3D radeon_crtc->base.primary->fb;
>         u32 tmp =3D ((u32)crtc_base) | RADEON_CRTC_OFFSET__OFFSET_LOCK;
>         int i;
>
> @@ -169,6 +171,13 @@ void r100_page_flip(struct radeon_device *rdev, int =
crtc_id, u64 crtc_base, bool
>         /* update the scanout addresses */
>         WREG32(RADEON_CRTC_OFFSET + radeon_crtc->crtc_offset, tmp);
>
> +       /* update pitch */
> +       pitch_pixels =3D fb->pitches[0] / fb->format->cpp[0];
> +       crtc_pitch =3D DIV_ROUND_UP(pitch_pixels * fb->format->cpp[0] * 8=
,
> +                                 fb->format->cpp[0] * 8 * 8);
> +       crtc_pitch |=3D crtc_pitch << 16;
> +       WREG32(RADEON_CRTC_PITCH + radeon_crtc->crtc_offset, crtc_pitch);
> +
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
