Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEB66907AD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 12:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA4F10E9C5;
	Thu,  9 Feb 2023 11:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845FF10E9C5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 11:45:14 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-52ec329dc01so1898387b3.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 03:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1Dpxep27GI6mS7lbMVKnhNov0c74EduC+eDFF4l8QKo=;
 b=JaiVGaTWM1TOQp0sn9CG0PHxTrkkqmIzTNbXRRLMENR93DO0EERtO+QqxdnxT2+rz2
 Pz0Svwm4v14xiybyKrK+uJfUbsc8z9yKY0QsDdmkwPU3SF6o8Ly93cBBu1/uo14ypwLJ
 i4Ix0WeFb9KAyR+XelRI1yMwBAKGGBz0W1gzir6Fon5cqKGyu9uSuqpOYSGn5uR/oYUF
 qSw1uuiLnUh9vOL9yJPgOIuVKUwAV8/XYvlIOcG1GECX6DR4JhGiylyzcwh4NHcA9dnK
 5l41uW2R6ftvTehxwyRgbngEZGd4x67478koJYzHChEIX7JvhZmtDChSrEMjbQi4jt6L
 3pTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Dpxep27GI6mS7lbMVKnhNov0c74EduC+eDFF4l8QKo=;
 b=3XXC9v/zIVLoaJaCkX5JHTfJL9yRieeihk6yiknuhMmw3gfcYps8l5hcVSQIQhNss2
 Hwc5hcHy9vO9tICTFPwECtHKV1J80sGUuqtyuzbZz48cW45k/SOnySv2zpdwpmF+/y2A
 i71p/3Nz65v7TmNJ6rhPrTYrB+HLYctigJ9ZVrR7lCqPL3ItDujM+GA8pWoQd7iWgwHY
 0nvIJ+feFgKOGomlq6WalkhAhNOsMYBmWcLZKteB96GIaBP8YRHQAdvj0MujxtgFro//
 JuLxLNSYw9DEQ/OS5YIwra87uNLK0WVKou7F0JGsVZ81uCZVXbgTZhdv9YIDF+oi5ojz
 6cBw==
X-Gm-Message-State: AO0yUKUwqeDqWT/3b7n6X1TzvMLZ0rJ1BRUElSLzjEh0dCDhlWIMRJ9E
 HRYGbUe6nv+MXelGbZcB3mpM2Jfyh+ijzPrDsKIqdA==
X-Google-Smtp-Source: AK7set9wSqlkBVFtjhindvNq34ZnlroJihED6vQLci0/yNQN48kMpfdf8JCeyllUcK9Ph3bs+66Ph3WXjuZ0wRfZZVw=
X-Received: by 2002:a0d:ea09:0:b0:52e:c4d8:53ee with SMTP id
 t9-20020a0dea09000000b0052ec4d853eemr17576ywe.378.1675943113385; Thu, 09 Feb
 2023 03:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-28-dmitry.baryshkov@linaro.org>
 <fd654e2e-4cc0-29bf-374d-beed0bada0bc@quicinc.com>
In-Reply-To: <fd654e2e-4cc0-29bf-374d-beed0bada0bc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 Feb 2023 13:45:02 +0200
Message-ID: <CAA8EJpocfk2bY0fGaGrzcho-NmHyam3NR-=W3L0E9M7nrY_wVw@mail.gmail.com>
Subject: Re: [PATCH v3 27/27] drm/msm/dpu: add support for wide planes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 9 Feb 2023 at 04:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> > Typically SSPP can support rectangle with width up to 2560. However it's
>
> Not always 2560. Depends on the chipset.

_typically_

>
> > possible to use multirect feature and split source to use the SSPP to
> > output two consecutive rectangles. This commit brings in this capability
> > to support wider screen resolutions.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   6 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 116 +++++++++++++++++++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   4 +
> >   3 files changed, 114 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 0ca3bc38ff7e..867832a752b2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -485,6 +485,12 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >                                          fetch_active,
> >                                          &pstate->pipe);
> >
> > +             _dpu_crtc_blend_setup_pipe(crtc, plane,
> > +                                        mixer, cstate->num_mixers,
> > +                                        stage_cfg, pstate->stage, 1,
> > +                                        fetch_active,
> > +                                        &pstate->r_pipe);
> > +
> >               /* blend config update */
> >               for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
> >                       _dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index e2e85688ed3c..401ead64c6bd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -365,6 +365,9 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
> >       struct dpu_plane *pdpu = to_dpu_plane(plane);
> >       struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
> >
> > +     if (!pipe->sspp)
> > +             return;
> > +
> >       memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
> >
> >       if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
> > @@ -647,6 +650,9 @@ static int _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
> >   {
> >       struct dpu_hw_sspp_cfg pipe_cfg;
> >
> > +     if (!pipe->sspp)
> > +             return 0;
>
> instead of checking if sspp was present, is it not better for the caller
> to check if the rpipe is valid before calling this?
>
> > +
> >       /* update sspp */
> >       if (!pipe->sspp->ops.setup_solidfill)
> >               return 0;
> > @@ -701,6 +707,8 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
> >
> >       /* update sspp */
> >       _dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg, fill_color, fmt);
> > +
> > +     _dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg, fill_color, fmt);
> >   }
>
> So cant we do
>
> if (pstate->r_pipe.sspp)
>         _dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe,
>                 &pstate->r_pipe_cfg, fill_color, fmt);
>
> It just seems better to me as the caller would already know if the sspp
> was assigned.

 I think I had this kind of code earlier, but then I found it more
logical to move the check to the called function. I'll move it back.

>
> >
> >   int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
> > @@ -911,6 +919,9 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> >   {
> >       uint32_t min_src_size;
> >
> > +     if (!pipe->sspp)
> > +             return 0;
> > +
> >       min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
> >
> >       if (DPU_FORMAT_IS_YUV(fmt) &&
> > @@ -957,9 +968,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       int ret = 0, min_scale;
> >       struct dpu_plane *pdpu = to_dpu_plane(plane);
> >       struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > +     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> >       const struct drm_crtc_state *crtc_state = NULL;
> >       const struct dpu_format *fmt;
> >       struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
> > +     struct dpu_hw_sspp_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> >       struct drm_rect fb_rect = { 0 };
> >       uint32_t max_linewidth;
> >       unsigned int rotation;
> > @@ -983,8 +997,11 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > -     pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> > -     pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +     r_pipe->sspp = NULL;
> >
> >       pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> >       if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> > @@ -1016,16 +1033,53 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >
> >       max_linewidth = pdpu->catalog->caps->max_linewidth;
> >
> > -     /* check decimated source width */
> >       if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> > -             DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > -                             DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > -             return -E2BIG;
> > +             /* struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state); */
> > +
> > +             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > +                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > +                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > +                     return -E2BIG;
> > +             }
>
> This is where I am a bit concerned enabling it for all chipsets in one go.

As I wrote earlier, I'd prefer the opt-out rather than opt-in here. It
is much easier to handle the reports "I have a device with sm6543,
where the display worked before 6.4, but started failing afterwards"
rather than trying to find a person with sm6543 and asking him if he
can enable this and that on his device. And even a lower chance of a
person with sm6543 coming up with a patch 'hey, I enabled this for my
phone and it works!'.

If we find any issues during or close to the end of the development
cycle, we can add a 'don't enable wide plane here' switch and enable
it for failing platforms. But each enablement of this switch should
come with a reason (wide planes not working here because ....). In the
end this switch should be gone and transformed into proper HW
limitation checks.

> As you are aware,  we have an open bug today that we do not filter out
> the modes which we do not support.
>
> https://gitlab.freedesktop.org/drm/msm/-/issues/21

I thought that with the link-frequencies in place and with the DSI
checking the OPP tables this issue is mostly handled. Isn't it?
Is a mode check in the DPU driver itself the last missing piece?

>
> Due to this, on all chipsets we will end up trying to do a 4K on
> external display which we dont know what bugs it will expose.

If we do not expose bugs, we do not have a way to fix them. And I
definitely think that all the bugs should be listed as early as
possible, while both of us still remember the code under the question.

>
> So lets say if we test it on sc7280 fully but not on sc7180, we will
> still hit this condition on sc7180 too but on that chipset we did not
> advertise 4K as a capability in the product spec.

Is it 'not advertised' or 'not supported by hw'?

>
> With the max_linewidth check relaxed nothing prevents us from doing 4K
> on a chipset which doesnt support 4K.

What prevents sc7180 from supporting 4k? Does it support Smart DMA?
Does it support having two LMs per INTF/CRTC? Is there a limitation on
the linewidth of two LMs or two SSPPs?

I see that sm7125 (which has the same DPU revision) even contains
"qcom,sde-vig-sspp-linewidth = <4096>;" in the DTS, despite official
'product brief' advertising only 2520x1080 output resolution.

>
> > +
> > +             /*
> > +              * FIXME: it's not possible to check if sourcesplit is supported,
> > +              * LMs is not assigned yet. It happens in dpu_encoder_virt_mode_set
> > +              */
> > +             if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> > +                        drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
> > +                        (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> > +                         !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
> > +                        /* cstate->num_mixers < 2 ||
> > +                        !test_bit(DPU_MIXER_SOURCESPLIT, &cstate->mixers[0].hw_lm->cap->features) || */
> > +                        DPU_FORMAT_IS_YUV(fmt)) {
> > +                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
> > +                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > +                     return -E2BIG;
> > +             }
> > +
> > +             /* Use multirect for wide plane. We do not support dynamic assignment of SSPPs, so we know the configuration. */
> > +             pipe->multirect_index = DPU_SSPP_RECT_0;
> > +             pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > +
> > +             r_pipe->sspp = pipe->sspp;
> > +             r_pipe->multirect_index = DPU_SSPP_RECT_1;
> > +             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>
>
> > +
> > +             *r_pipe_cfg = *pipe_cfg;
> > +             pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> > +             pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> > +             r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> > +             r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> >       }
> >
>
> As you requested just wanted to summarize the condition in the email.
>
> In parallel fetch mode, the downstream driver for UBWC formats, we check
> whether the src width of each rectangle is > maxlinewidth/2
>
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/DISPLAY.LA.2.0.r3-00500-WAIPIO.0/msm/sde/sde_plane.c#L1835

Thanks. Please double check my understanding: If the rectangle is used
for the tiled format, then it's max_linewidth is effectively halved.
So we can use rect_solo with full width, but for rect_0/rect_1 we
should halve it, even if two rectangles are used in the time split?

>
> For sc7280, maxlinewidth is 2400
>
> static const struct dpu_caps sc7280_dpu_caps = {
>          .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>          .max_mixer_blendstages = 0x7,
>          .qseed_type = DPU_SSPP_SCALER_QSEED4,
>          .smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
>          .ubwc_version = DPU_HW_UBWC_VER_30,
>          .has_dim_layer = true,
>          .has_idle_pc = true,
>          .max_linewidth = 2400,
>          .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> };
>
> Hence for UBWC formats which are by default used on the sc7280
> chromebook, each rectangle should be < 1200
>
> SmartDMA is therefore not enough to support 4K on sc7280 and we need
> true virtual planes ( using two SSPPs to display the 4K layer )
>
> Also, probably worth commenting that time multiplex mode support is not
> added in this series.

Ack.

>
> >       fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> >
> > -     ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, fmt);
> > +     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt);
> >       if (ret)
> >               return ret;
> >
> > @@ -1094,8 +1148,10 @@ void dpu_plane_flush(struct drm_plane *plane)
> >       else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> >               /* force 100% alpha */
> >               _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> > -     else
> > +     else {
> >               dpu_plane_flush_csc(pdpu, &pstate->pipe);
> > +             dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> > +     }
> >
> >       /* flag h/w flush complete */
> >       if (plane->state)
> > @@ -1130,6 +1186,9 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
> >       struct drm_plane_state *state = plane->state;
> >       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> >
> > +     if (!pipe->sspp)
> > +             return;
> > +
> >       if (layout && pipe->sspp->ops.setup_sourceaddress) {
> >               trace_dpu_plane_set_scanout(pipe, layout);
> >               pipe->sspp->ops.setup_sourceaddress(pipe, layout);
> > @@ -1207,13 +1266,14 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
> >       struct drm_plane_state *state = plane->state;
> >       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> >       struct dpu_sw_pipe *pipe = &pstate->pipe;
> > +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> >       struct drm_crtc *crtc = state->crtc;
> >       struct drm_framebuffer *fb = state->fb;
> >       bool is_rt_pipe;
> >       const struct dpu_format *fmt =
> >               to_dpu_format(msm_framebuffer_format(fb));
> >       struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
> > -
> > +     struct dpu_hw_sspp_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> >       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> >       struct msm_gem_address_space *aspace = kms->base.aspace;
> >       struct dpu_hw_fmt_layout layout;
> > @@ -1241,12 +1301,22 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
> >                                  drm_mode_vrefresh(&crtc->mode),
> >                                  layout_valid ? &layout: NULL);
> >
> > +     dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
> > +                                drm_mode_vrefresh(&crtc->mode),
> > +                                layout_valid ? &layout: NULL);
> > +
> >       if (pstate->needs_qos_remap)
> >               pstate->needs_qos_remap = false;
> >
> >       pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, pipe_cfg);
> >
> >       pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
> > +
> > +     if (r_pipe->sspp) {
> > +             pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
> > +
> > +             pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
> > +     }
> >   }
> >
> >   static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> > @@ -1289,6 +1359,8 @@ static void dpu_plane_destroy(struct drm_plane *plane)
> >               pstate = to_dpu_plane_state(plane->state);
> >               _dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
> >
> > +             _dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
> > +
> >               mutex_destroy(&pdpu->lock);
> >
> >               /* this will destroy the states as well */
> > @@ -1369,11 +1441,26 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
> >               const struct drm_plane_state *state)
> >   {
> >       const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> > +     const struct dpu_sw_pipe *pipe = &pstate->pipe;
> > +     const struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
> > +     const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > +     const struct dpu_hw_sspp_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> >
> >       drm_printf(p, "\tstage=%d\n", pstate->stage);
> > -     drm_printf(p, "\tsspp=%s\n", pstate->pipe.sspp->cap->name);
> > -     drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->pipe.multirect_mode));
> > -     drm_printf(p, "\tmultirect_index=%s\n", dpu_get_multirect_index(pstate->pipe.multirect_index));
> > +
> > +     drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> > +     drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
> > +     drm_printf(p, "\tmultirect_index[0]=%s\n", dpu_get_multirect_index(pipe->multirect_index));
> > +     drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> > +     drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> > +
> > +     if (r_pipe->sspp) {
> > +             drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
> > +             drm_printf(p, "\tmultirect_mode[1]=%s\n", dpu_get_multirect_mode(r_pipe->multirect_mode));
> > +             drm_printf(p, "\tmultirect_index[1]=%s\n", dpu_get_multirect_index(r_pipe->multirect_index));
> > +             drm_printf(p, "\tsrc[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> > +             drm_printf(p, "\tdst[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->dst_rect));
> > +     }
> >   }
>
> Do you think that changing the atomic_print_state to print the r_pipe
> sspp can be moved to a separate patch? So that way we only keep the core
> logic of atomic check of smartDMA in this patch.
>
> >
> >   static void dpu_plane_reset(struct drm_plane *plane)
> > @@ -1407,6 +1494,10 @@ static void dpu_plane_reset(struct drm_plane *plane)
> >        * This is the place where the state is allocated, so fill it fully.
> >        */
> >       pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > +     pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> > +     pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> > +     pstate->r_pipe.sspp = NULL;
> >
> >       __drm_atomic_helper_plane_reset(plane, &pstate->base);
> >   }
> > @@ -1423,6 +1514,7 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
> >
> >       pm_runtime_get_sync(&dpu_kms->pdev->dev);
> >       _dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
> > +     _dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable, DPU_PLANE_QOS_PANIC_CTRL);
> >       pm_runtime_put_sync(&dpu_kms->pdev->dev);
> >   }
> >   #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > index 079dad83eb37..183c95949885 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > @@ -19,7 +19,9 @@
> >    * @base:   base drm plane state object
> >    * @aspace: pointer to address space for input/output buffers
> >    * @pipe:   software pipe description
> > + * @r_pipe:  software pipe description of the second pipe
> >    * @pipe_cfg:       software pipe configuration
> > + * @r_pipe_cfg:      software pipe configuration for the second pipe
> >    * @stage:  assigned by crtc blender
> >    * @needs_qos_remap: qos remap settings need to be updated
> >    * @multirect_index: index of the rectangle of SSPP
> > @@ -34,7 +36,9 @@ struct dpu_plane_state {
> >       struct drm_plane_state base;
> >       struct msm_gem_address_space *aspace;
> >       struct dpu_sw_pipe pipe;
> > +     struct dpu_sw_pipe r_pipe;
> >       struct dpu_hw_sspp_cfg pipe_cfg;
> > +     struct dpu_hw_sspp_cfg r_pipe_cfg;
> >       enum dpu_stage stage;
> >       bool needs_qos_remap;
> >       bool pending;



-- 
With best wishes
Dmitry
