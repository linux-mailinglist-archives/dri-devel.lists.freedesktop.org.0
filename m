Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE3963089
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 20:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C9310E597;
	Wed, 28 Aug 2024 18:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RzKMzJFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB01C10E594
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 18:59:16 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6c91f9fb0acso42894627b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724871556; x=1725476356; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qmcz+7+UGxQfEMaPBC8TElShVt8OVL3UlwAoYiyx/aU=;
 b=RzKMzJFwhTGG8xaVAspZXSI7H1Gy3ezydPYT8r89R4VUj9WfFpZgV0WJ7FLZc2jYIq
 jiOPdtgPj/Lqsg4ixYZfpjWlScEWnS7BsLvk/uBPGSSHyIPrbCgpw8/JS2vglybnPscd
 QMSd+DVqM+2mDJWMLDK876OkR4PTWniw5Od87ymCRAJ5mtUoGqiVJCCY+5mTOVrb8lfx
 wFicra4gPiJ9H+eJZo28uGTY3/wmfbCEmUYiJtv98apSza4hw3+9tStcnDewNfbPpVMT
 GzlnjJFQ9cwDbZ5L2LIFoB5vmTBsPFrCSCutq+VXfVZ8RWdZEJZuo0MpaxtqXVEBMhH6
 +83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724871556; x=1725476356;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qmcz+7+UGxQfEMaPBC8TElShVt8OVL3UlwAoYiyx/aU=;
 b=dLSNCcyMv8FwBHi+vmm3U8YDwF8mWURbon7rsQxo29Vq4JZbR6GZYSq8bGopGgGSQf
 uhjLlaJ9z0nf1YTnC74OITGuGR08mqjGZ1AZyWp/D8bDqHOnASb5PMNTcduVzSby4JKu
 /KCoapPkV26vB8zToYt5FCaF3BH32+0vBxsBq+647lPSuruT7TyTsTLJz3kXYQu3LoRw
 NTF/yurQnXCPPNkUgiPAYKo3M0RrYqdt7B4KsFZLLiTkoIgcCt+FhCSbMweVU2xlda9N
 YbpkwFEhcF1tOC3IrEitXTyWNVUj5MZbwaswpSQKoiaXI/BfWNt/3qMd8vtkz1MTJvZo
 WUlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0Sv8eeeiZvu4iW0x/yy52i5PtliOzlzCwmn5rX/GYJI38J5VV2XFOFCKe3ybLUrJ9SWaWYBxfN/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx90YLnQqanpdN3jg7Jp9X8qqjdscO03qdVT9bHRLDKds4ZNGb6
 gPiNLO/736Nx9/6ZJHldeHsX2IgNriXJtEweEFJxi/4Qi5dw7tmqHMGEXWNFNNmGNdXcQ+eG21W
 krHJazQ/wbC4leZrPkxs1xh9Gl7onFHwoPumgiQ==
X-Google-Smtp-Source: AGHT+IFUq92P2cDjPZ43R3Ejt1MApPBYLwyypx+rFCUZNhBlIjXtfAWoSXy+tv9q3lvlh7GVDWFBRpIvNEAiNvguYZ4=
X-Received: by 2002:a05:690c:10d:b0:6ad:bf4f:1bc3 with SMTP id
 00721157ae682-6d277c6ec56mr2918277b3.32.1724871555468; Wed, 28 Aug 2024
 11:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-8-5efb90cbb8be@linaro.org>
 <1facdd7c-b15d-4d91-b96a-5b3b72dbad66@quicinc.com>
In-Reply-To: <1facdd7c-b15d-4d91-b96a-5b3b72dbad66@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Aug 2024 21:59:04 +0300
Message-ID: <CAA8EJpr_wCAO5fw+ZbbuPUtnJFms+Q-X02ekWEGCnvuxcHKbqQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] drm/msm/dpu: split dpu_plane_atomic_check()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
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

On Wed, 28 Aug 2024 at 21:27, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/26/2024 2:46 PM, Dmitry Baryshkov wrote:
> > Split dpu_plane_atomic_check() function into two pieces:
> >
> > dpu_plane_atomic_check_nopipe() performing generic checks on the pstate,
> > without touching the associated pipe,
> >
> > and
> >
> > dpu_plane_atomic_check_pipes(), which takes into account used pipes.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 178 +++++++++++++++++++-----------
> >   1 file changed, 112 insertions(+), 66 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 115c1bd77bdd..9b9fe28052ad 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -788,49 +788,22 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> >   #define MAX_UPSCALE_RATIO   20
> >   #define MAX_DOWNSCALE_RATIO 4
> >
> > -static int dpu_plane_atomic_check(struct drm_plane *plane,
> > -                               struct drm_atomic_state *state)
> > +static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
> > +                                      struct drm_plane_state *new_plane_state,
> > +                                      const struct drm_crtc_state *crtc_state)
> >   {
> > -     struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> > -                                                                              plane);
> >       int ret = 0, min_scale, max_scale;
> >       struct dpu_plane *pdpu = to_dpu_plane(plane);
> >       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> >       u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
> >       struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > -     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > -     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > -     const struct drm_crtc_state *crtc_state = NULL;
> > -     const struct msm_format *fmt;
> >       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> >       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> >       struct drm_rect fb_rect = { 0 };
> >       uint32_t max_linewidth;
> > -     unsigned int rotation;
> > -     uint32_t supported_rotations;
> > -     const struct dpu_sspp_cfg *pipe_hw_caps;
> > -     const struct dpu_sspp_sub_blks *sblk;
> > -
> > -     if (new_plane_state->crtc)
> > -             crtc_state = drm_atomic_get_new_crtc_state(state,
> > -                                                        new_plane_state->crtc);
> > -
> > -     pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
> > -     r_pipe->sspp = NULL;
> >
> > -     if (!pipe->sspp)
> > -             return -EINVAL;
> > -
> > -     pipe_hw_caps = pipe->sspp->cap;
> > -     sblk = pipe->sspp->cap->sblk;
> > -
> > -     if (sblk->scaler_blk.len) {
> > -             min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > -             max_scale = MAX_DOWNSCALE_RATIO << 16;
> > -     } else {
> > -             min_scale = DRM_PLANE_NO_SCALING;
> > -             max_scale = DRM_PLANE_NO_SCALING;
> > -     }
> > +     min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > +     max_scale = MAX_DOWNSCALE_RATIO << 16;
> >
> >       ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> >                                                 min_scale,
> > @@ -843,11 +816,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > -     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > -     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > -     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > -     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > -
> >       pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> >       if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> >               DPU_ERROR("> %d plane stages assigned\n",
> > @@ -871,8 +839,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >               return -E2BIG;
> >       }
> >
> > -     fmt = msm_framebuffer_format(new_plane_state->fb);
> > -
> >       max_linewidth = pdpu->catalog->caps->max_linewidth;
> >
> >       drm_rect_rotate(&pipe_cfg->src_rect,
> > @@ -881,6 +847,78 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >
> >       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> >            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> > +             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > +                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > +                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > +                     return -E2BIG;
> > +             }
> > +
> > +             *r_pipe_cfg = *pipe_cfg;
> > +             pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> > +             pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> > +             r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> > +             r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> > +     } else {
> > +             memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> > +     }
> > +
>
> This is the part I am not able to fully understand. Assignment of
> r_pipe_cfg is also pipe related so why should that move to
> dpu_plane_atomic_check_nopipe(). It should be part of
> dpu_plane_atomic_check_pipe().

Because it happens before possible pipe / rectangle allocation. These
values are further used to assign resources.

>
> > +     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > +                         new_plane_state->fb->width, new_plane_state->fb->height,
> > +                         new_plane_state->rotation);
> > +     if (r_pipe_cfg->src_rect.x1 != 0)
> > +             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > +                                 new_plane_state->fb->width, new_plane_state->fb->height,
> > +                                 new_plane_state->rotation);
> > +
> > +     pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> > +
> > +     return 0;
> > +}
> > +
> > +static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
> > +                                     struct drm_atomic_state *state,
> > +                                     const struct drm_crtc_state *crtc_state)
> > +{
> > +     struct drm_plane_state *new_plane_state =
> > +             drm_atomic_get_new_plane_state(state, plane);
> > +     struct dpu_plane *pdpu = to_dpu_plane(plane);
> > +     struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > +     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > +     const struct msm_format *fmt;
> > +     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> > +     uint32_t max_linewidth;
> > +     unsigned int rotation;
> > +     uint32_t supported_rotations;
> > +     const struct dpu_sspp_cfg *pipe_hw_caps;
> > +     const struct dpu_sspp_sub_blks *sblk;
> > +     int ret = 0;
> > +
> > +     pipe_hw_caps = pipe->sspp->cap;
> > +     sblk = pipe->sspp->cap->sblk;
> > +
> > +     /*
> > +      * We already have verified scaling against platform limitations.
> > +      * Now check if the SSPP supports scaling at all.
> > +      */
> > +     if (!sblk->scaler_blk.len &&
> > +         ((drm_rect_width(&new_plane_state->src) >> 16 !=
> > +           drm_rect_width(&new_plane_state->dst)) ||
> > +          (drm_rect_height(&new_plane_state->src) >> 16 !=
> > +           drm_rect_height(&new_plane_state->dst))))
> > +             return -ERANGE;
> > +
>
> Should this part be retained under dpu_plane_atomic_check_nopipe()?
>
> This is also not pipe dependent.

No, it uses sblk->scaler_blk, so it depends on the actual SSPP being
used for this pipe.

>
> > +     fmt = msm_framebuffer_format(new_plane_state->fb);
> > +
> > +     max_linewidth = pdpu->catalog->caps->max_linewidth;
> > +
> > +     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> > +                                       &crtc_state->adjusted_mode);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> >               /*
> >                * In parallel multirect case only the half of the usual width
> >                * is supported for tiled formats. If we are here, we know that
> > @@ -894,12 +932,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >                       return -E2BIG;
> >               }
> >
> > -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > -                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > -                     return -E2BIG;
> > -             }
> > -
> >               if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> >                   drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
> >                   (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> > @@ -921,26 +953,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >               r_pipe->multirect_index = DPU_SSPP_RECT_1;
> >               r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> >
> > -             *r_pipe_cfg = *pipe_cfg;
> > -             pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> > -             pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> > -             r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> > -             r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> > -     }
> > -
> > -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > -                         new_plane_state->fb->width, new_plane_state->fb->height,
> > -                         new_plane_state->rotation);
> > -     if (r_pipe->sspp)
> > -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > -                                 new_plane_state->fb->width, new_plane_state->fb->height,
> > -                                 new_plane_state->rotation);
> > -
> > -     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
> > -     if (ret)
> > -             return ret;
> > -
> > -     if (r_pipe->sspp) {
> >               ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> >                                                 &crtc_state->adjusted_mode);
> >               if (ret)
> > @@ -963,11 +975,45 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       }
> >
> >       pstate->rotation = rotation;
>
> The dpu_plane_check_inline_rotation() is also pipe independent. So even
> that goes to dpu_plane_atomic_check_nopipe()?

It also depends on the sblk if I remember correctly. Also note that
the next patch moves it to check_pipe().

>
> > -     pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> >
> >       return 0;
> >   }
> >
>
> <snip>
>


-- 
With best wishes
Dmitry
