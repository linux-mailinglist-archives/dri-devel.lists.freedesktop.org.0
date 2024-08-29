Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE8964339
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A40E10E64C;
	Thu, 29 Aug 2024 11:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k1CU6QQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0413A10E644
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:38:20 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e03caab48a2so412114276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724931499; x=1725536299; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5xrA5JIScAJNAxNi++FV2D+NsqZDXM2fowkG+0TvI+Y=;
 b=k1CU6QQXZYTCHW2z3t31XIHqookOTIYMVpTZ45LVmNZZ6UMv9OudwUjs2fOSeXfAri
 T5nJAkDeXz3iQ6ZvY1WRYuZ5AUgIxULZ7J5j82OeUSKM2l3uMeDe+zhogtCilRrOk7bW
 SYDG2U/kzCT9cnZrG5kTu78lC9byJIEWJ3VM5V3OnDRUspxtjPhhlHw3rEBDQWzEmsaJ
 7gGNcb2jJDaaMHuX/0dAzhkgSbjNZeF9rZF51EoTH0SLHYv8u+GHNfHYDeUradTeNpDb
 qtoDy7O/xxuRxXIKUlbRNXls5K7fLJ3TaUoOCtlIEZrxb5loo3oiufF5kl0DOlwOu2Af
 XKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724931499; x=1725536299;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5xrA5JIScAJNAxNi++FV2D+NsqZDXM2fowkG+0TvI+Y=;
 b=UMm46NIJLOhyieaJVL3K4fVzMx6z0+xIGEAqDSyxtEewOp7Tsvj4PML/FQm6as+hGN
 uUKrK9HZqceI7WFLxpvF1sDEybQ5t7hv6bOfKcJ1WW63w6OzdTwYoTjo9fqW055DlKie
 s4Z0zPwnQT1XJT0qiSOUACf/ZfwVuDYe30j3SDFyBCyWU4B+2IDCRCuwO49Lgd79vwB0
 i9ZK/HCLuO5qJjq/xyYUhTjrIm705WlnJleiyvTw3VSA7bik4ABGPMBZULaIqlnnvu+q
 6U3FJ+88zd8BB6dvH9nL+BR+mxy86RkqIUgFQAsbVKpRE9rmWBxo5RoFs8P6L6hFoIAd
 sb2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNkTEeNw6Hu/R7kH+aAUUAhPbCbmIBbkG74wEtwj0wH95ok9MhUuBaxKPiqkMecEPyyPNaBbU+ko8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUIEMibqAxMTd/FCQICDGHKmUBWgeM7JweKsCpaexcRDpMaq/r
 gRUjs8jPCwfAzp4QhXix1npDk0/dg5QAv/EFCMNJnEStqKkB7btQS/6KHEyWlHnBwkPf0GBsnf/
 wKUq/WFDX77SSiCe0HKegvRVpDCX/qZBjrdXMlQ==
X-Google-Smtp-Source: AGHT+IE8ArmNS0unbJoKUInpYCOA6IvrbcNO0CGeVhh4esEWs6+xbLygq4z4qqnuCJH4Ls1bO6F0PfxgRxlJ6R41Gdc=
X-Received: by 2002:a05:6902:707:b0:e11:446b:d43b with SMTP id
 3f1490d57ef6-e1a5c667cedmr2047797276.16.1724931498789; Thu, 29 Aug 2024
 04:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-14-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-14-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:38:07 +0300
Message-ID: <CAA8EJpp5TwzCZ6bpQQzzVBpEwhi28s-fX9wwOtrasCAGDBdykA@mail.gmail.com>
Subject: Re: [PATCH 14/21] drm/msm/dpu: Support quad-pipe in SSPP checking
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Aug 2024 at 13:21, Jun Nie <jun.nie@linaro.org> wrote:
>
> Support quad-pipe in SSPP checking with unified method
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 108 ++++++++++++++----------------
>  1 file changed, 51 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 4df7cfed4d230..78bf8f0292f62 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -738,12 +738,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>  static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>                 struct dpu_sw_pipe *pipe,
>                 struct dpu_sw_pipe_cfg *pipe_cfg,
> -               const struct msm_format *fmt,
> -               const struct drm_display_mode *mode)
> +               const struct drm_display_mode *mode,
> +               struct drm_plane_state *new_plane_state)
>  {
>         uint32_t min_src_size;
>         struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>         int ret;
> +       const struct msm_format *fmt;
> +       uint32_t supported_rotations;
> +       const struct dpu_sspp_cfg *pipe_hw_caps;
> +       const struct dpu_sspp_sub_blks *sblk;
> +
> +       pipe_hw_caps = pipe->sspp->cap;
> +       sblk = pipe->sspp->cap->sblk;
> +
> +       /*
> +        * We already have verified scaling against platform limitations.
> +        * Now check if the SSPP supports scaling at all.
> +        */
> +       if (!sblk->scaler_blk.len &&
> +           ((drm_rect_width(&new_plane_state->src) >> 16 !=
> +             drm_rect_width(&new_plane_state->dst)) ||
> +            (drm_rect_height(&new_plane_state->src) >> 16 !=
> +             drm_rect_height(&new_plane_state->dst))))
> +               return -ERANGE;
> +
> +       fmt = msm_framebuffer_format(new_plane_state->fb);
> +
> +       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +
> +       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +               supported_rotations |= DRM_MODE_ROTATE_90;
> +
> +       pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> +                                                  supported_rotations);
>
>         min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
>
> @@ -886,8 +914,7 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>         return 0;
>  }
>
> -static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> -                                                  struct dpu_sw_pipe_cfg *pipe_cfg,
> +static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
>                                                    const struct msm_format *fmt,
>                                                    uint32_t max_linewidth)
>  {
> @@ -916,49 +943,19 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>                 drm_atomic_get_new_plane_state(state, plane);
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
>         struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -       struct dpu_sw_pipe *pipe = &pstate->pipe;
> -       struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -       const struct msm_format *fmt;
> -       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> -       uint32_t supported_rotations;
> -       const struct dpu_sspp_cfg *pipe_hw_caps;
> -       const struct dpu_sspp_sub_blks *sblk;
> -       int ret = 0;
> -
> -       pipe_hw_caps = pipe->sspp->cap;
> -       sblk = pipe->sspp->cap->sblk;
> -
> -       /*
> -        * We already have verified scaling against platform limitations.
> -        * Now check if the SSPP supports scaling at all.
> -        */
> -       if (!sblk->scaler_blk.len &&
> -           ((drm_rect_width(&new_plane_state->src) >> 16 !=
> -             drm_rect_width(&new_plane_state->dst)) ||
> -            (drm_rect_height(&new_plane_state->src) >> 16 !=
> -             drm_rect_height(&new_plane_state->dst))))
> -               return -ERANGE;
> -
> -       fmt = msm_framebuffer_format(new_plane_state->fb);
> -
> -       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> -
> -       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> -               supported_rotations |= DRM_MODE_ROTATE_90;
> -
> -       pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> -                                                  supported_rotations);
> -       r_pipe_cfg->rotation = pipe_cfg->rotation;
> -
> -       ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> -                                         &crtc_state->adjusted_mode);
> -       if (ret)
> -               return ret;
> +       struct dpu_sw_pipe *pipe;
> +       struct dpu_sw_pipe_cfg *pipe_cfg;
> +       int ret = 0, i;
>
> -       if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -               ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> -                                                 &crtc_state->adjusted_mode);
> +       for (i = 0; i < PIPES_PER_STAGE; i++) {
> +               pipe = &pstate->pipe[i];
> +               pipe_cfg = &pstate->pipe_cfg[i];
> +               if (!pipe_cfg->visible || !pipe->sspp)
> +                       break;
> +               DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
> +               ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> +                                                 &crtc_state->adjusted_mode,
> +                                                 new_plane_state);
>                 if (ret)
>                         return ret;
>         }
> @@ -975,10 +972,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
>         struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>         struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> -       struct dpu_sw_pipe *pipe = &pstate->pipe;
> -       struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +       struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> +       struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> +       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> +       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
>         const struct drm_crtc_state *crtc_state = NULL;
>
>         if (new_plane_state->crtc)
> @@ -1033,13 +1030,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                         return -E2BIG;
>                 }
>
> -               /*
> -                * Use multirect for wide plane. We do not support dynamic
> -                * assignment of SSPPs, so we know the configuration.
> -                */
>                 pipe->multirect_index = DPU_SSPP_RECT_0;
>                 pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>
> +               r_pipe->sspp = pipe->sspp;

NAK

>                 r_pipe->multirect_index = DPU_SSPP_RECT_1;
>                 r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>         }
> @@ -1056,7 +1050,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>                 drm_atomic_get_old_plane_state(state, plane);
>         struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
>         struct drm_crtc_state *crtc_state;
> -       int ret;
> +       int ret, i;
>
>         if (plane_state->crtc)
>                 crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1071,8 +1065,8 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>                  * resources are freed by dpu_crtc_assign_plane_resources(),
>                  * but clean them here.
>                  */
> -               pstate->pipe.sspp = NULL;
> -               pstate->r_pipe.sspp = NULL;
> +               for (i = 0; i < PIPES_PER_STAGE; i++)
> +                       pstate->pipe[i].sspp = NULL;
>
>                 return 0;
>         }
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
