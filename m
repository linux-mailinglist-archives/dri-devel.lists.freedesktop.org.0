Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0A8FDA8B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 01:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B4A10E380;
	Wed,  5 Jun 2024 23:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B0Yfk0ow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A2B10E380
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 23:32:36 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-6c4f3e0e3d2so274568a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 16:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717630356; x=1718235156; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kcTxi7vXRpk6QhfkYEFpMcgHU8yMQKGob0a5GzBdgPo=;
 b=B0Yfk0ow992nXqBFI/WN5EekkOnRQQCpsvCNVAARiLf0UGXUCusCgRy0pXgzhedGSI
 v6+4DPkIPeoSLPikyIK1em+mzFs18ljM/PuI4wQ/6YAxZ6pfW+ARbx8G+TmSKEkrJYPP
 4/uB9NmgNH9dHhsdJIajj/WQUikMmJbsBtg0VqZyqaS+SS9BpufI7JzYOAP/3YtnqDWB
 NZnE/COmXCe3Xn5579qz5N0o8pk92cn+Bvs2PxwDluK6nUmr5mBWmJj8o6aebHMimOqH
 E64Ay4kRZetnPIyqcWCD9PCtKdF3LvQj+WfgBD4ygOl2tI+TuaQp0ejriS2/pQcqmErV
 EeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717630356; x=1718235156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kcTxi7vXRpk6QhfkYEFpMcgHU8yMQKGob0a5GzBdgPo=;
 b=D4Ur3eIVFG/o7LQz4c9h1swpTIrga2bDnMVJ3Mzb+G1jQuXN/zTjlClK0xSTn3OOoN
 nbwPVDJKQoxWt3FnRr5LDW8rf7ip7Y0LZAYFfuWIjQFd1DNYmyQKXTXL0l+ipBLK/FCd
 rJpupBIj82lsQHRnWGlGLhsYqm0n9sH0C9pdLnSvWMwHAA0ytF+aVugydWDBqP90nxi0
 r+DA2jSBBv3UdKqHhD4556JN676vjAfvD1fjKevna3FglyWdgO4zCip0jO/TrPp90H3b
 gPUNBJYWhJLptUmTDK8TyfYxmaq7ewCamMLPdtqdNADOkCho2aTZZ1M7iM7gIYKjfXt7
 3/Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4BIjb/+vNhNtdFzh6OHog8gySKehUVDt6EP9iLBn7/i/HkYNMYgOWn5dqAmwTa4+WcTq8nTP0lGfp/rukqnf4gKySQB4HSvqRXKdTd+hn
X-Gm-Message-State: AOJu0YyMoSxt2vO6sZSQPuR+M6lhP1xTdI0ROtGYht+b6lsnScfPdg9i
 rodNH/DKPPZtgvFZnJJlFWqvABBhU/uUITZJs2AU+yNrAuDjTDyCULgXRbPQOlYWiq8MkdiSKQ5
 IAi75ODgbIfuyMQilbe5YXnWDbYEPnm+qfZaEew==
X-Google-Smtp-Source: AGHT+IE0Ik1o959wlPTZHQGPDSzovNBFgrxoQuKeM2biwIurd8qu3eXjwVbFeCAuym46Cd1Y8cQKdbLtzEdFu1Oxes4=
X-Received: by 2002:a17:90a:c253:b0:2bf:e9cd:c858 with SMTP id
 98e67ed59e1d1-2c27db11a6fmr3676411a91.17.1717630355706; Wed, 05 Jun 2024
 16:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-7-dmitry.baryshkov@linaro.org>
 <627dd526-2b56-2ecb-9011-4ec08bab454f@quicinc.com>
In-Reply-To: <627dd526-2b56-2ecb-9011-4ec08bab454f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Jun 2024 02:32:23 +0300
Message-ID: <CAA8EJpp+NvoTMZdVNivqe0_nQd3PChSND7ojqa+Ee3nMdWcQGQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] drm/msm/dpu: split dpu_plane_atomic_check()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Thu, 6 Jun 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
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
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 184 ++++++++++++++--------
> >   1 file changed, 117 insertions(+), 67 deletions(-)
> >
>
> One thing which seemed odd to me is even dpu_plane_atomic_check_nopipe()
> does use pipe_cfg even though its named "nopipe".
>
> Perhaps were you targetting a split of SW planes vs SSPP atomic_check?
>
> I tried applying this patch on top of msm-next to more closely review
> the split up but it does not apply. So, I will review this patch a
> little better after it is re-spun. But will proceed with remaining patches.
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 6360052523b5..187ac2767a2b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -788,50 +788,22 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
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
> > -     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > -     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > -     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > -     const struct drm_crtc_state *crtc_state = NULL;
> > -     const struct dpu_format *fmt;
> >       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> >       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> >       struct drm_rect fb_rect = { 0 };
> >       uint32_t max_linewidth;
> > -     unsigned int rotation;
> > -     uint32_t supported_rotations;
> > -     const struct dpu_sspp_cfg *pipe_hw_caps;
> > -     const struct dpu_sspp_sub_blks *sblk;
> >
> > -     if (new_plane_state->crtc)
> > -             crtc_state = drm_atomic_get_new_crtc_state(state,
> > -                                                        new_plane_state->crtc);
> > -
> > -     pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > -     r_pipe->sspp = NULL;
> > -
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
> > -             min_scale = 1 << 16;
> > -             max_scale = 1 << 16;
> > -     }
> > +     min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > +     max_scale = MAX_DOWNSCALE_RATIO << 16;
> >
> >       ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> >                                                 min_scale,
> > @@ -844,11 +816,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> > @@ -872,8 +839,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >               return -E2BIG;
> >       }
> >
> > -     fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> > -
> >       max_linewidth = pdpu->catalog->caps->max_linewidth;
> >
> >       drm_rect_rotate(&pipe_cfg->src_rect,
> > @@ -882,6 +847,83 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> > +     const struct dpu_format *fmt;
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
> > +     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> > +     fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> > +
> > +     max_linewidth = pdpu->catalog->caps->max_linewidth;
> > +
> > +     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> > +                                       &crtc_state->adjusted_mode);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (r_pipe_cfg->src_rect.x1 != 0) {
> >               /*
> >                * In parallel multirect case only the half of the usual width
> >                * is supported for tiled formats. If we are here, we know that
> > @@ -895,12 +937,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> > @@ -922,26 +958,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> > @@ -964,11 +980,45 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       }
> >
> >       pstate->rotation = rotation;
> > -     pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> >
> >       return 0;
> >   }
> >
> > +static int dpu_plane_atomic_check(struct drm_plane *plane,
> > +                               struct drm_atomic_state *state)
> > +{
> > +     struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> > +                                                                              plane);
> > +     int ret = 0;
> > +     struct dpu_plane *pdpu = to_dpu_plane(plane);
> > +     struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > +     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > +     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > +     const struct drm_crtc_state *crtc_state = NULL;
> > +
> > +     if (new_plane_state->crtc)
> > +             crtc_state = drm_atomic_get_new_crtc_state(state,
> > +                                                        new_plane_state->crtc);
> > +
> > +     if (pdpu->pipe != SSPP_NONE) {
>
> This check was not present iirc, why did you have to add this?
> RM will return the same SSPP unless freed. So why this additional check?

If pdpu->pipe is not SSPP_NONE, then virtual planes are disabled and
there is a fixed 1:1 relationship between planes and SSPP blocks.

>
> > +             pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > +             r_pipe->sspp = NULL;
> > +     }
> > +
> > +     if (!pipe->sspp)
> > +             return -EINVAL;
> > +
> > +     ret = dpu_plane_atomic_check_nopipe(plane, new_plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!new_plane_state->visible)
> > +             return 0;
> > +
> > +     return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
> > +}
> > +
> >   static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> >   {
> >       const struct dpu_format *format =



-- 
With best wishes
Dmitry
