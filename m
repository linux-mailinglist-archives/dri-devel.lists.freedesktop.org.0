Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C89904ECA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 11:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616A810E7E1;
	Wed, 12 Jun 2024 09:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XA6jkEWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C030810E7E4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:08:59 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-627e3368394so72955047b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718183338; x=1718788138; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XI078nOkCuDbWjZgJ67kNrzuEHbAr9c/mYic+hmE7QA=;
 b=XA6jkEWwDFzs3keG0rXURYV1no06HWA4uGsbn7mdZM9pBp+mHTDVn0i4FD+YS7uN69
 CW1FGjWhEaqVqRbiFgjjv32duDcIoeYpo0d2RkX0i2MCdAuMAuzfP4bivkApRU4s0nM0
 zFvBfhm84RzpReqASuTi6tkCoq8ifXLQ7JlvIFHRHdsLjTYBDDfDbRCyxpl5H9N40swJ
 /Yx7YItQ2oFRJQOlZuM4ewXUTwN6tiDa1BmbaaZgJdPPhCkigySzAmi2G/YivuKHPCpH
 J6IqjMS1jeYyNRUsJsR0trt01wqhQMgyR5Fc0WHLoWRs3rUKBYt68npjohF5w7s+Yvt1
 AG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718183338; x=1718788138;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XI078nOkCuDbWjZgJ67kNrzuEHbAr9c/mYic+hmE7QA=;
 b=qS3VDWgpaglxP7Nx808saJkGZtkeTc0agKxcUFTQtcMUG0kOO5V9f2spVBtU50QT33
 /GIJru0qyHK9TmLiKoswvqg3SNyiH5R8E772R+sOyZWxwUPNC+JGtyBAJ1niBkiVZMG3
 Mgmafo7oAIs2flO9pGcAriIa33Qcqooplo4Qsqjv+fM1a+dkfW28DS7Ogj932AOxPhAn
 ROoI7ugk12bdcbz45PwAgysWUUZXgKo3NRuem/PgJUsuT1ENSCuNQl6Q/cGT1G4WlI6w
 C+mhbSmXEGY6IgyG2wiRWILk9248OY68j2vTFjGooaAkdy0iTNT9YdJ9jV9fGag56n0F
 dxvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzrp17D07N2aK2Sj1v0/nSBEGoRhrs14wBU2YhCiyEoD+GkILueXM6MsS6+aMBOdYh8sfvvYQKBcVy1bHbvhZ0Y6tSk9ISgUZLppANNtYH
X-Gm-Message-State: AOJu0YyLywQnrX694IV5JiIL04QAnxFKpixw8tICgA1zg5UJB/K2j9GZ
 dvJ7U/5nKgTZvTAqtuY4HBUz5xh+UxYyzyCi5JWYA3KTEN1yKSlaZyf/IbfdtH65L0Ko9gTVk2N
 r5UHw05YX0X3vUMCBnchtQW8XnKS0OZwuYcLkxw==
X-Google-Smtp-Source: AGHT+IGnZ761wTEHFozATVwFW9kyTg+myXMsmp3BrF+/X6OgkKpM6SV4oepQOo6dmgKVE1knPGf506hu7cJByEHDkZM=
X-Received: by 2002:a05:690c:7247:b0:627:8616:4de with SMTP id
 00721157ae682-62fb7f9ab9bmr14005707b3.5.1718183338526; Wed, 12 Jun 2024
 02:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-11-dmitry.baryshkov@linaro.org>
 <68dc0d98-9830-d71d-ec65-71890fb2986e@quicinc.com>
In-Reply-To: <68dc0d98-9830-d71d-ec65-71890fb2986e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 12:08:47 +0300
Message-ID: <CAA8EJpop48--yTyyWs+3b=sgHgjV6-7akp7mJX007aMaaKteJA@mail.gmail.com>
Subject: Re: [PATCH v4 10/13] drm/msm/dpu: allow sharing SSPP between planes
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

On Wed, 12 Jun 2024 at 02:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> > Since SmartDMA planes provide two rectangles, it is possible to use them
> > to drive two different DRM planes, first plane getting the rect_0,
> > another one using rect_1 of the same SSPP. The sharing algorithm is
> > pretty simple, it requires that each of the planes can be driven by the
> > single rectangle and only consequetive planes are considered.
> >
>
> consequetive - > consecutive
>
> Can you please explain why only consecutive planes are considered for this?
>
> So lets say we have 4 virtual planes : 0, 1, 2, 3
>
> It will try 0-1, 1-2, 2-3
>
> Because all planes are virtual, there are only 3 unique pairs to be
> considered? Otherwise technically 6 pairs are possible.

An implementation that tries all 6 pairs taking the zpos and the
overlapping into account is appreciated. I cared for the simplest case
here. Yes, further optimizations can be implemented.

>
>
> General request:
>
> Patches 1-9 : Add support for using 2 SSPPs in one plane
> Patches 10-12 : Add support for using two rectangles of the same SSPP as
> two virtual planes
> Patch 13 : Can be pushed along with the first set.
>
> Can we break up this series in this way to make it easier to test and
> land the bulk of it in this cycle?

Sure.

>
> I have some doubts on patches 10-12 and would like to spend more time
> reviewing and testing this. So I am trying to reduce the debt of patches
> we have been carrying as this is a tricky feature to simulate and test
> the cases.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 128 +++++++++++++++++++---
> >   1 file changed, 112 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index cde20c1fa90d..2e1c544efc4a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -886,10 +886,9 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
> >       return 0;
> >   }
> >
> > -static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> > -                                                struct dpu_sw_pipe_cfg *pipe_cfg,
> > -                                                const struct dpu_format *fmt,
> > -                                                uint32_t max_linewidth)
> > +static int dpu_plane_is_multirect_capable(struct dpu_sw_pipe *pipe,
> > +                                       struct dpu_sw_pipe_cfg *pipe_cfg,
> > +                                       const struct dpu_format *fmt)
> >   {
> >       if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> >           drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
> > @@ -901,6 +900,13 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> >       if (DPU_FORMAT_IS_YUV(fmt))
> >               return false;
> >
> > +     return true;
> > +}
> > +
> > +static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
> > +                                      const struct dpu_format *fmt,
> > +                                      uint32_t max_linewidth)
> > +{
> >       if (DPU_FORMAT_IS_UBWC(fmt) &&
> >           drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
> >               return false;
> > @@ -908,6 +914,82 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> >       return true;
> >   }
> >
> > +static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> > +                                                struct dpu_sw_pipe_cfg *pipe_cfg,
> > +                                                const struct dpu_format *fmt,
> > +                                                uint32_t max_linewidth)
> > +{
> > +     return dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) &&
> > +             dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> > +}
> > +
> > +
> > +static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
> > +                                struct dpu_plane_state *prev_pstate,
> > +                                const struct dpu_format *fmt,
> > +                                uint32_t max_linewidth)
> > +{
> > +     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > +     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> > +     struct dpu_sw_pipe *prev_pipe = &prev_pstate->pipe;
> > +     struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_pstate->pipe_cfg;
> > +     const struct dpu_format *prev_fmt =
> > +             to_dpu_format(msm_framebuffer_format(prev_pstate->base.fb));
> > +     u16 max_tile_height = 1;
> > +
> > +     if (prev_pstate->r_pipe.sspp != NULL ||
> > +         prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
> > +             return false;
> > +
> > +     if (!dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) ||
> > +         !dpu_plane_is_multirect_capable(prev_pipe, prev_pipe_cfg, prev_fmt) ||
> > +         !(test_bit(DPU_SSPP_SMART_DMA_V1, &prev_pipe->sspp->cap->features) ||
> > +           test_bit(DPU_SSPP_SMART_DMA_V2, &prev_pipe->sspp->cap->features)))
>
> This test_bit check should be absorbed into
> dpu_plane_is_multirect_capable()?

Yep.

>
> > +             return false;
> > +
> > +     if (DPU_FORMAT_IS_UBWC(fmt))
> > +             max_tile_height = max(max_tile_height, fmt->tile_height);
> > +
> > +     if (DPU_FORMAT_IS_UBWC(prev_fmt))
> > +             max_tile_height = max(max_tile_height, prev_fmt->tile_height);
> > +
> > +     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> > +     r_pipe->sspp = NULL;
> > +
> > +     if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
> > +         dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
> > +         (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> > +          prev_pipe_cfg->dst_rect.x1 >= pipe_cfg->dst_rect.x2)) {
>
> Even if y1 > y2 or y2 > y1 but the separation is less than the  2 *
> max_tile_height, it can qualify for parallel fetch.
>
> So parallel fetch is possible not only in x direction but y direction as
> well as it will be fetched by different SSPPs.

I think that's now what I see in the SDE driver.

>
> > +             pipe->sspp = prev_pipe->sspp;
> > +
> > +             pipe->multirect_index = DPU_SSPP_RECT_1;
> > +             pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > +
> > +             prev_pipe->multirect_index = DPU_SSPP_RECT_0;
> > +             prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > +
> > +             return true;
> > +     }
> > +
> > +     if (pipe_cfg->dst_rect.y1 >= prev_pipe_cfg->dst_rect.y2 + 2 * max_tile_height ||
> > +         prev_pipe_cfg->dst_rect.y1 >= pipe_cfg->dst_rect.y2 + 2 * max_tile_height) {
> > +             pipe->sspp = prev_pipe->sspp;
> > +
> > +             pipe->multirect_index = DPU_SSPP_RECT_1;
> > +             pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
> > +
> > +             prev_pipe->multirect_index = DPU_SSPP_RECT_0;
> > +             prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
> > +
> > +             return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +
> >   static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
> >                                       struct drm_atomic_state *state,
> >                                       const struct drm_crtc_state *crtc_state)
> > @@ -1098,13 +1180,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> >   static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >                                             struct dpu_global_state *global_state,
> >                                             struct drm_atomic_state *state,
> > -                                           struct drm_plane_state *plane_state)
> > +                                           struct drm_plane_state *plane_state,
> > +                                           struct drm_plane_state *prev_plane_state)
> >   {
> >       const struct drm_crtc_state *crtc_state = NULL;
> >       struct drm_plane *plane = plane_state->plane;
> >       struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> >       struct dpu_rm_sspp_requirements reqs;
> > -     struct dpu_plane_state *pstate;
> > +     struct dpu_plane_state *pstate, *prev_pstate;
> >       struct dpu_sw_pipe *pipe;
> >       struct dpu_sw_pipe *r_pipe;
> >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > @@ -1117,6 +1200,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >                                                          plane_state->crtc);
> >
> >       pstate = to_dpu_plane_state(plane_state);
> > +     prev_pstate = prev_plane_state ? to_dpu_plane_state(prev_plane_state) : NULL;
> >       pipe = &pstate->pipe;
> >       r_pipe = &pstate->r_pipe;
> >       pipe_cfg = &pstate->pipe_cfg;
> > @@ -1137,19 +1221,27 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >
> >       max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> >
> > -     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > -     if (!pipe->sspp)
> > -             return -ENODEV;
> > -
> >       if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> > -             pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > -             pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +             if (!prev_pstate ||
> > +                 !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
>
> This is a bit confusing to check esp since i am unable to apply this
> patch and check .... but...

It was posted several months ago. No surprise that the source code has
evolved. Getting the patches reviewed in time would have helped them
to be applicable.

> dpu_plane_atomic_check_nopipe() will set r_pipe_cfg if we are going to
> do multirect with two rectangles of the same sspp. Right?

No. It sets r_pipe_cfg in all the cases.

> Which means r_pipe_cfg will be 0 if multirect is not possible with same
> SSPP. Thats why the else case of this either uses two SSPPs.

No. It means that the plane can use a single rectangle of the SSPP.

>
> So why are we trying multirect with again with the two rectangles of the
> same SSPP as different planes? The result will be same right?

No, if the width of r_pipe_cfg is 0, it means that this plane doesn't
need a second rectangle to be displayed. So we can try reusing the
SSPP from the previous plane.

>
>
> > +                     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > +                     if (!pipe->sspp)
> > +                             return -ENODEV;
> >
> > -             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > -             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +                     r_pipe->sspp = NULL;
> > +
> > +                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> > +                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +             }
> >
> > -             r_pipe->sspp = NULL;
> >       } else {
> > +             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > +             if (!pipe->sspp)
> > +                     return -ENODEV;
> > +
>
> Unless I am missing something, you are assigning pipe->sspp in both if
> and else cases, so why dont you keep the allocation if pipe->sspp
> outside the conditionals.

You missed the conditional in the previous chunk. We need to reserve
SSPP if the plane uses two rectangles. We don't need to reserve an
SSPP if the old SSPP is going to be used.

>
> >               if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
> >                   dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
> >                   (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
> > @@ -1186,6 +1278,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >   {
> >       unsigned int i;
> >       int ret;
> > +     struct drm_plane_state *prev_plane_state = NULL;
> >
>
> This naming is a bit confusing. prev_plane_state could mean the plane's
> previous state but here you are implying the state of the previous plane
> in the list of planes.
>
> Maybe prev_adjacent_plane_state?

Ack.

>
> >       for (i = 0; i < num_planes; i++) {
> >               struct drm_plane_state *plane_state = states[i];
> > @@ -1195,9 +1288,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >                       continue;
> >
> >               ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > -                                                      state, plane_state);
> > +                                                      state, plane_state,
> > +                                                      prev_plane_state);
> >               if (ret)
> >                       break;
> > +
> > +             prev_plane_state = plane_state;
> >       }
> >
> >       return ret;



-- 
With best wishes
Dmitry
