Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D3854B49C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 17:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968361126D1;
	Tue, 14 Jun 2022 15:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619CA1126CE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 15:27:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g7so12168070eda.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QP9HmNcRWJ078nc1zuJ5cDS/R1eO7qL/qL6vLTwqeH8=;
 b=rgZJVBjN5NHC7M5ilbimFa8Cv5+XwTxDQr+wE2Y3I3eQ7OPT8PYpz0LtgHxdLEhyEl
 EQ0R0eLzoJzYJlfYttAG+Z4dyB7T1bpYCRanOwaZ/hNthuhunApAnKdPaN3AW07CU4hj
 1b52VKszeSXfnE96gMJ32IwThIm98n/D+9DpXrgYfP44QG58Xo41OUJoBZk3ilglzg9D
 rng9U56Fqh7zEDv4IaamC/BMedu15fwO6sM171QTylRbIPBsnq79aFvxkdPQ9bSHDFTP
 h+0KojLUzeiMCer5KRUpNtHgi+sOcVDMBeXaYXoCNy5/wfXMKGrqUJ5vY5C4OCV1XuJK
 F/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QP9HmNcRWJ078nc1zuJ5cDS/R1eO7qL/qL6vLTwqeH8=;
 b=Ea+uda+hQGm+EmwIdxNZ1CtgQtIZeI/WWrTH9BnfcQy21oR2dHrO9fj6z/epP8s2Tr
 qrT8JHnOdIuEL9s1rfAUsDYWbJ9ST9v5YjReIcqH/3Gtd46U5BbixetruAPLzEi/v/KP
 yFf9Er1o+Kc57/Gr4dgG8YpW3t7N2H9zR87FqTc5In9mu6Oo8XxzaiJ1sWvQJ/irxH71
 arIdl2C0yvSWCxfwLL6yapyY1C6PfaUUou7iSNnjXghsQZ/hdYQSQ91OupbhiTKi4wWz
 SgVgC5N8BDRVVBmwIWo6Tt32EUQ8r/XzDnu9tlJWkTy+m3Oxi7iLdBFqwq7SYO9yqzjj
 Popg==
X-Gm-Message-State: AJIora/+CJF0q24KBpoVoPgHNP0litBqmgeNSQMabqOlJloXi5QAIJLS
 Ge1DzdgGXOeGsROGu++D5Q2DTuaHmwAAfJkx9JEFEw==
X-Google-Smtp-Source: AGRyM1v6ItTn2juVlWYmI5s8h9uxlvBQhkaPRKwYqfhDsZJWKd76NajyAPDbjURnzI7B7b/myW4JT65IN1Wy30FAFmQ=
X-Received: by 2002:a05:6402:61a:b0:433:406a:8d25 with SMTP id
 n26-20020a056402061a00b00433406a8d25mr6796387edv.276.1655220473823; Tue, 14
 Jun 2022 08:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-16-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-16-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 16:27:38 +0100
Message-ID: <CAPY8ntDTFd7oT6hv6FA0+kX50=ir5oOybgn6kiu+yt0MTKkovA@mail.gmail.com>
Subject: Re: [PATCH 15/64] drm/vc4: plane: Take possible_crtcs as an argument
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> vc4_plane_init() currently initialises the plane with no possible CRTCs,
> and will expect the caller to set it up by itself.
>
> Let's change that logic a bit to follow the syntax of
> drm_universal_plane_init() and pass the possible CRTCs bitmask as an
> argument to the function instead.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c  |  2 +-
>  drivers/gpu/drm/vc4/vc4_drv.h   |  3 ++-
>  drivers/gpu/drm/vc4/vc4_plane.c | 15 +++++++--------
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 59b20c8f132b..840a93484bb1 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -1138,7 +1138,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
>          * requirement of the plane configuration, and reject ones
>          * that will take too much.
>          */
> -       primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY);
> +       primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY, 0);
>         if (IS_ERR(primary_plane)) {
>                 dev_err(drm->dev, "failed to construct primary plane\n");
>                 return PTR_ERR(primary_plane);
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 080deae55f64..5125ca1a8158 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -952,7 +952,8 @@ int vc4_kms_load(struct drm_device *dev);
>
>  /* vc4_plane.c */
>  struct drm_plane *vc4_plane_init(struct drm_device *dev,
> -                                enum drm_plane_type type);
> +                                enum drm_plane_type type,
> +                                unsigned int possible_crtcs);

A nit pick.
possible_crtcs in struct drm_plane is a uint32_t , not an unsigned int.
It would never matter on a Pi as unsigned int will never be 16bit, but
avoids the oddity.

Otherwise:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>  int vc4_plane_create_additional_planes(struct drm_device *dev);
>  u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist);
>  u32 vc4_plane_dlist_size(const struct drm_plane_state *state);
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index b3438f4a81ce..17dab470ecdf 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -1451,7 +1451,8 @@ static const struct drm_plane_funcs vc4_plane_funcs = {
>  };
>
>  struct drm_plane *vc4_plane_init(struct drm_device *dev,
> -                                enum drm_plane_type type)
> +                                enum drm_plane_type type,
> +                                unsigned int possible_crtcs)
>  {
>         struct drm_plane *plane = NULL;
>         struct vc4_plane *vc4_plane;
> @@ -1483,7 +1484,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
>         }
>
>         plane = &vc4_plane->base;
> -       ret = drm_universal_plane_init(dev, plane, 0,
> +       ret = drm_universal_plane_init(dev, plane, possible_crtcs,
>                                        &vc4_plane_funcs,
>                                        formats, num_formats,
>                                        modifiers, type, NULL);
> @@ -1528,13 +1529,11 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
>          */
>         for (i = 0; i < 16; i++) {
>                 struct drm_plane *plane =
> -                       vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
> +                       vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY,
> +                                      GENMASK(drm->mode_config.num_crtc - 1, 0));
>
>                 if (IS_ERR(plane))
>                         continue;
> -
> -               plane->possible_crtcs =
> -                       GENMASK(drm->mode_config.num_crtc - 1, 0);
>         }
>
>         drm_for_each_crtc(crtc, drm) {
> @@ -1542,9 +1541,9 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
>                  * since we overlay planes on the CRTC in the order they were
>                  * initialized.
>                  */
> -               cursor_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_CURSOR);
> +               cursor_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_CURSOR,
> +                                             drm_crtc_mask(crtc));
>                 if (!IS_ERR(cursor_plane)) {
> -                       cursor_plane->possible_crtcs = drm_crtc_mask(crtc);
>                         crtc->cursor = cursor_plane;
>                 }
>         }
> --
> 2.36.1
>
