Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE49643A1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5DB10E657;
	Thu, 29 Aug 2024 11:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZMkf4qTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B01B10E657
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:56:58 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e16518785c2so455178276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724932617; x=1725537417; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VGKYfZEA8ueSbdLkY5s5hU0jXKcQn2uFCbYV0qNbbxA=;
 b=ZMkf4qTeUJEIhIT1XmizROQF3fQ9L3GryXUkhsS01peVc3Xht+ZUVa/Ii7q1fXwnRP
 SYJsbzZ1UsUjaPeo+rKMVUHxZv5vFq/j/VKPEMTf3LCagFk51iJ4TUxLsh4/tK5cgs5I
 WWq9XdTQdeJCvHeIVquYQrDhwvGr/UENAgbstUZBeMWA9RB0gUyiTcGtNHCAQd26DW75
 0cMuRNiFuWpESE9nWwkQfgGTJd4IA0MMGCGtI13tHDytpm84yDKngoSyBttyv4aICw8a
 glSpYosjJRcGz1j4pC2jzlMgQHll5TA3ah1iBmZtTpshpfA2G3MelFRz2j8Nmux82Bsz
 1VhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724932617; x=1725537417;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VGKYfZEA8ueSbdLkY5s5hU0jXKcQn2uFCbYV0qNbbxA=;
 b=aJFhSS2L/qEBS1t16hXcAM15Opej4Rg5bDidOnQxulcDVK33hWscjRbkBmmFG3ILgm
 sV+eDo0/w4cOoHxLzX4o9H8XOEwY6IuLDVEzt0P22xvhskAUFpLY/qfmDMZkkb/0M1gr
 KWQXwp1TyKHRPhsLZ0cW8jtUAsGDJK1AI1XQlBO3TMz1QrRy9Evo5Qh4sCdIJRQVQsuq
 WekV0gemQqpzSYfQoIA9OJl07cvNNOAFDZHxM2nbatEOYjim3dgV3l2MGCn1gEoTD9JM
 oGyOB9ZjxDub3/I/bhS6HIrIifHqFrSr5unc7iNWAbH7VKpbyHv/ICEkWLF/zscj1g0T
 5m3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6qkVFirSeePofUSzZnwLFDPN5HN5KwTfF+AYmBIov0wsPri2YAUxp1CTY39Q4+A3v4kJATg6Rfx4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOKAKlOllU9X3wPWoB2f98rNk1oymnJiNDcy1ksOL5sg3qbv4a
 JO6pRuzZXOZhHyQdsojMSIiZAV56thHq2hwwdlFFhaR9I+g8TYP0sOQG6QL9JDIY8cqKpcyzM6H
 G471+6rVz4fZUq1QALYkBkC0vl+Qoi2PPmArmJQ==
X-Google-Smtp-Source: AGHT+IHXnArOKRKkv9aDeckq+KbsCjyogedUlTLo8qkAGBwyIvTaY1QBhm0kJiL7fKWjsTr1H+Cwlshy/HqGzV5bPpI=
X-Received: by 2002:a05:6902:1002:b0:e11:7d82:9a88 with SMTP id
 3f1490d57ef6-e1a5af0b5d9mr2601279276.42.1724932617145; Thu, 29 Aug 2024
 04:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-20-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-20-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:56:46 +0300
Message-ID: <CAA8EJpoN-rWiKj37-9QGRVOJSXd0sk7kKbmO8VJEHQoyse6s3w@mail.gmail.com>
Subject: Re: [PATCH 20/21] drm/msm/dpu: support quad pipe in general operations
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
> Support quad pipe in general operations with unified method.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 87 +++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c38c1bedd40fb..c3ea97b4ce439 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -619,6 +619,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>         struct msm_drm_private *priv = plane->dev->dev_private;
>         struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>         u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
> +       int i;
>
>         DPU_DEBUG_PLANE(pdpu, "\n");
>
> @@ -632,12 +633,11 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>                 return;
>
>         /* update sspp */
> -       _dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
> -                                  fill_color, fmt);
> -
> -       if (pstate->r_pipe.sspp)
> -               _dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
> -                                          fill_color, fmt);
> +       for (i = 0; i < PIPES_PER_STAGE; i++)
> +               if (pstate->pipe[i].sspp)
> +                       _dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
> +                                                  &pstate->pipe_cfg[i].dst_rect,
> +                                                  fill_color, fmt);
>  }
>
>  static int dpu_plane_prepare_fb(struct drm_plane *plane,
> @@ -1279,8 +1279,11 @@ void dpu_plane_flush(struct drm_plane *plane)
>                 /* force 100% alpha */
>                 _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>         else {
> -               dpu_plane_flush_csc(pdpu, &pstate->pipe);
> -               dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> +               int i;
> +
> +               for (i = 0; i < PIPES_PER_STAGE; i++)
> +                       if (pstate->pipe_cfg[i].visible)
> +                               dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
>         }
>
>         /* flag h/w flush complete */
> @@ -1380,20 +1383,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
>         struct drm_plane_state *state = plane->state;
>         struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -       struct dpu_sw_pipe *pipe = &pstate->pipe;
> -       struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>         struct drm_crtc *crtc = state->crtc;
>         struct drm_framebuffer *fb = state->fb;
>         bool is_rt_pipe;
>         const struct msm_format *fmt =
>                 msm_framebuffer_format(fb);
> -       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +       struct dpu_sw_pipe_cfg *pipe_cfg;
>         struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>         struct msm_gem_address_space *aspace = kms->base.aspace;
>         struct dpu_hw_fmt_layout layout;
>         bool layout_valid = false;
> -       int ret;
> +       int ret, i;
>
>         ret = dpu_format_populate_layout(aspace, fb, &layout);
>         if (ret)
> @@ -1412,28 +1412,28 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>                         crtc->base.id, DRM_RECT_ARG(&state->dst),
>                         &fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
>
> -       dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
> -                                  drm_mode_vrefresh(&crtc->mode),
> -                                  layout_valid ? &layout : NULL);
> -
> -       if (r_pipe->sspp) {
> -               dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
> -                                          drm_mode_vrefresh(&crtc->mode),
> -                                          layout_valid ? &layout : NULL);
> +       for (i = 0; i < PIPES_PER_STAGE; i++) {
> +               if (pstate->pipe_cfg[i].visible && pstate->pipe[i].sspp)
> +                       dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
> +                                                  &pstate->pipe_cfg[i], fmt,
> +                                                  drm_mode_vrefresh(&crtc->mode),
> +                                                  layout_valid ? &layout : NULL);
>         }
>
>         if (pstate->needs_qos_remap)
>                 pstate->needs_qos_remap = false;
>
> -       pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt,
> -                                                   &crtc->mode, pipe_cfg);
> -
> -       pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
> -
> -       if (r_pipe->sspp) {
> -               pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
> +       pstate->plane_fetch_bw = 0;
> +       pstate->plane_clk = 0;
> +       for (i = 0; i < PIPES_PER_STAGE; i++) {
> +               pipe_cfg = &pstate->pipe_cfg[i];
> +               if (pipe_cfg->visible) {
> +                       pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
> +                                                                   &crtc->mode, pipe_cfg);
>
> -               pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
> +                       pstate->plane_clk = max(pstate->plane_clk,
> +                                               _dpu_plane_calc_clk(&crtc->mode, pipe_cfg));
> +               }
>         }
>  }
>
> @@ -1441,17 +1441,21 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>  {
>         struct drm_plane_state *state = plane->state;
>         struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -       struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +       struct dpu_sw_pipe *pipe;
> +       int i;
>
> -       trace_dpu_plane_disable(DRMID(plane), false,
> -                               pstate->pipe.multirect_mode);
> +       for (i = 0; i < PIPES_PER_STAGE; i++) {
> +               pipe = &pstate->pipe[i];
> +               if (pipe->multirect_index == DPU_SSPP_RECT_1) {

No, the code isn't equivalent.

> +                       trace_dpu_plane_disable(DRMID(plane), false,
> +                                               pstate->pipe[i - 1].multirect_mode);
>
> -       if (r_pipe->sspp) {
> -               r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -               r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +                       pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +                       pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>
> -               if (r_pipe->sspp->ops.setup_multirect)
> -                       r_pipe->sspp->ops.setup_multirect(r_pipe);
> +                       if (pipe->sspp && pipe->sspp->ops.setup_multirect)
> +                               pipe->sspp->ops.setup_multirect(pipe);
> +               }
>         }
>
>         pstate->pending = true;
> @@ -1607,14 +1611,17 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
>         struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>         struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +       int i;
>
>         if (!pdpu->is_rt_pipe)
>                 return;
>
>         pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -       _dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable);
> -       if (pstate->r_pipe.sspp)
> -               _dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable);
> +       for (i = 0; i < PIPES_PER_STAGE; i++) {
> +               if (!pstate->pipe_cfg[i].visible)
> +                       break;

continue, not break.

> +               _dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
> +       }
>         pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>  #endif
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
