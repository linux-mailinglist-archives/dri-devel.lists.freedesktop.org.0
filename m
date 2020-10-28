Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573229D026
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 14:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3696E520;
	Wed, 28 Oct 2020 13:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48E56E520
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 13:49:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w14so1756031wrs.9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vjvHj8VOdd+Ln2TvA6kZ6Bc5ZMNpiz+bvO3osLa0jyg=;
 b=j8SRV+njFrYAjV/MW3jWwECzjHRajt19EME/Q2b4oYLZJ+lPm55doc4zFvi8b8qtLL
 BboD7MH2aWiNWCBGhY/+YyB9xNY80oLz16a/R0w6QR1uD9tt9r/oTZj2fbNgnvKYACRU
 5Ippe78W+vMYqGgpw/SsH3XzGgTeaQp+MvhNxZWx3M1/XKkFOJ7ffqbcBlJvzxTO2ffP
 mfLenhGcG5uNClIjR7UD5TVPaaE1XHFSWAwSdOIm+9/2cKXAXZYqvBXf+ubDPdbu+l79
 GPgZYR9GcCkEm7cKQ0M6Qbaj/6uWvHSZm87xjRe6B77nkNa5NpiFuE4F1pD4BhbArXKf
 4PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vjvHj8VOdd+Ln2TvA6kZ6Bc5ZMNpiz+bvO3osLa0jyg=;
 b=pkqAqrNNjNwQ57GzK4TmCMpeNQHzZf/lCTjPo7wHaxve3QmMSg/aKgqCWDRoXfO0ex
 KopZgt2YJ+LcOPnQZePLiyKrUEbzroNNkhBK2RbJgoEWSu/eQdBnbr3D6OZEDrNxGwhJ
 773OCF3iHi7+92O0WvrMba9Ht1aGeoe50Wu6lVxIW23E+g2hVB59wYInnZMsPzEZgO+E
 Jn5DGjIPwDpGZO81AK7OcAwHm18HlIYy6Ayzxg0Vsqq+0RLAdKyDP7Bp79v2ONQGcy75
 77MugVMCnn7V4v/KH1WrNw3Bwa/4B2FRHF5y72eV6pvjPjLRPlRGrbD1jhX3cpPXD28x
 cocQ==
X-Gm-Message-State: AOAM5327ZjqboRIou0tPUrChh2iJsWDi71ql1hRzGF47GWE+vXS51VTO
 ScsEF5u+qKk2JqRrutYb4uiH1XFR8Z+Yk2A9RMKHZg==
X-Google-Smtp-Source: ABdhPJxVvVXSu8xvMusWsch10PlGIP3dHrfKQR0hUY/HLegq0TKH3fT8DmLbEyM9TyrgMJePVVVE5g4EjiINmYK/HeE=
X-Received: by 2002:adf:edc6:: with SMTP id v6mr9045849wro.273.1603892987420; 
 Wed, 28 Oct 2020 06:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201028123752.1733242-1-maxime@cerno.tech>
In-Reply-To: <20201028123752.1733242-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 28 Oct 2020 13:49:29 +0000
Message-ID: <CAPY8ntDz_mOx8sKfOTO0zRVMiPivX7yLHDUvrk-KVVD_feAicg@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: Rework the structure convertion functions
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/convertion/conversion in subject line

On Wed, 28 Oct 2020 at 12:37, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Most of the helpers to retrieve vc4 structures from the DRM base structures
> rely on the fact that the first member of the vc4 structure is the DRM one
> and just cast the pointers between them.
>
> However, this is pretty fragile especially since there's no check to make
> sure that the DRM structure is indeed at the offset 0 in the structure, so
> let's use container_of to make it more robust.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Otherwise
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_drv.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 236dde0bb9a1..836fdca5e643 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -287,7 +287,7 @@ struct vc4_bo {
>  static inline struct vc4_bo *
>  to_vc4_bo(struct drm_gem_object *bo)
>  {
> -       return (struct vc4_bo *)bo;
> +       return container_of(to_drm_gem_cma_obj(bo), struct vc4_bo, base);
>  }
>
>  struct vc4_fence {
> @@ -300,7 +300,7 @@ struct vc4_fence {
>  static inline struct vc4_fence *
>  to_vc4_fence(struct dma_fence *fence)
>  {
> -       return (struct vc4_fence *)fence;
> +       return container_of(fence, struct vc4_fence, base);
>  }
>
>  struct vc4_seqno_cb {
> @@ -347,7 +347,7 @@ struct vc4_plane {
>  static inline struct vc4_plane *
>  to_vc4_plane(struct drm_plane *plane)
>  {
> -       return (struct vc4_plane *)plane;
> +       return container_of(plane, struct vc4_plane, base);
>  }
>
>  enum vc4_scaling_mode {
> @@ -423,7 +423,7 @@ struct vc4_plane_state {
>  static inline struct vc4_plane_state *
>  to_vc4_plane_state(struct drm_plane_state *state)
>  {
> -       return (struct vc4_plane_state *)state;
> +       return container_of(state, struct vc4_plane_state, base);
>  }
>
>  enum vc4_encoder_type {
> @@ -499,7 +499,7 @@ struct vc4_crtc {
>  static inline struct vc4_crtc *
>  to_vc4_crtc(struct drm_crtc *crtc)
>  {
> -       return (struct vc4_crtc *)crtc;
> +       return container_of(crtc, struct vc4_crtc, base);
>  }
>
>  static inline const struct vc4_crtc_data *
> @@ -537,7 +537,7 @@ struct vc4_crtc_state {
>  static inline struct vc4_crtc_state *
>  to_vc4_crtc_state(struct drm_crtc_state *crtc_state)
>  {
> -       return (struct vc4_crtc_state *)crtc_state;
> +       return container_of(crtc_state, struct vc4_crtc_state, base);
>  }
>
>  #define V3D_READ(offset) readl(vc4->v3d->regs + offset)
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
