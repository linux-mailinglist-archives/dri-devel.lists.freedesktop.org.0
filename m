Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F786CF995
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 05:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954D689AC3;
	Thu, 30 Mar 2023 03:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4E810ECC2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 03:30:52 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id c29so22846935lfv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 20:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680147050;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TpEsGl64X9yV+wQvujU/ooF9RN6/PZAkNl8/DEU80AQ=;
 b=reQB0gDLl93YjKra3OSa8kj0e3Ba1+a0V7BHM9QcuUO0XYhvM8X2y0VDQ0Dx9CjN8M
 C0hqTnZiDlLTdC0/tW+ia5UB1ZDL60hG1YeSLrETIN0LzHXe9O9L018B2Zck4O+7dmqU
 hj1gL5iYSX6Z6CYGKgd9dpoH70nNLGn4axm7LPY2a5VqgK6pXowqgfv1ToMcfOEgeH5m
 uEqKTRTr0d1QSnp/sgKhmCh2TysTpRGnlMBVsZplg36ppr2NEclTtncrriBJ6vNd1B7H
 bpCSTnSOBHSE1btNiOTjQ9znCmw7XSZGi2yM4kxD+rbdM3gmk373QXSuNsP1ws8FvvU4
 8JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680147050;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TpEsGl64X9yV+wQvujU/ooF9RN6/PZAkNl8/DEU80AQ=;
 b=YJmhUtXOMXI8rVQI9xZ74FnKhQPiqJR2GZ3OvJ4SZKfqqe4vq+4pDScq85N/Xbu9D3
 qrOAFhtXruJQmhY8q6WpEm7HVWrYzRnHhQ0n+DVrBq8sqq8SvnSyDhoWWHqnfkGR4/Kq
 NNru4JXJcFTFOWRdtdzpOQ8U6Mlw0TakzgVmvTjlg1UmITSC0zHpwW2srPzLpz0iz5U1
 yjEIemmyEi/gTyejjPXJqpK2uWPys532vNXRFzxMrNebjF7L/4X2VV4XQrcuCL5jhniK
 cZixz4/aSZY42L57j33NJVNTUsW8uHKKFzzTDXmL9R9CF2057eL9qxSgbhCs5JI7c3DP
 jIcg==
X-Gm-Message-State: AAQBX9e87ruFbnvSTMVtGgVZ1xwC8k3+mYDpm5DJ4wAMTx3qMfX1opZU
 abWBOPhh1A+GJ7Y5YVw7esWrjQ==
X-Google-Smtp-Source: AKy350brlYnzLxZ0XJCIyab/I7Lw2SA4SuQGzwVLfhj6Bv9d2UPcKwG0VXVJsTzyozmbpikH5QUe3A==
X-Received: by 2002:ac2:41c2:0:b0:4eb:d8d:6c11 with SMTP id
 d2-20020ac241c2000000b004eb0d8d6c11mr4345687lfi.5.1680147049868; 
 Wed, 29 Mar 2023 20:30:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n6-20020ac242c6000000b004e84896253asm5693672lfl.251.2023.03.29.20.30.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 20:30:49 -0700 (PDT)
Message-ID: <55231d21-878e-4fa2-4773-ad2931ae730a@linaro.org>
Date: Thu, 30 Mar 2023 06:30:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 27/32] drm/msm/dpu: add support for wide planes
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
 <20230316161653.4106395-28-dmitry.baryshkov@linaro.org>
 <bfdef7d6-4851-f94e-b565-19e4c90cfd99@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bfdef7d6-4851-f94e-b565-19e4c90cfd99@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 05:53, Abhinav Kumar wrote:
> 
> 
> On 3/16/2023 9:16 AM, Dmitry Baryshkov wrote:
>> It is possible to use multirect feature and split source to use the SSPP
>> to output two consecutive rectangles. This commit brings in this
>> capability to support wider screen resolutions.
>>
>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  19 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 136 +++++++++++++++++++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   4 +
>>   3 files changed, 142 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 217a8112f1a2..90b406e409d3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -481,6 +481,15 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>                          format, fb ? fb->modifier : 0,
>>                          &pstate->pipe, 0, stage_cfg);
>> +        if (pstate->r_pipe.sspp) {
>> +            set_bit(pstate->r_pipe.sspp->idx, fetch_active);
>> +            _dpu_crtc_blend_setup_pipe(crtc, plane,
>> +                           mixer, cstate->num_mixers,
>> +                           pstate->stage,
>> +                           format, fb ? fb->modifier : 0,
>> +                           &pstate->r_pipe, 1, stage_cfg);
>> +        }
>> +
>>           /* blend config update */
>>           for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
>>               _dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
>> @@ -1341,10 +1350,16 @@ static int _dpu_debugfs_status_show(struct 
>> seq_file *s, void *data)
>>           seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
>>               state->crtc_x, state->crtc_y, state->crtc_w,
>>               state->crtc_h);
>> -        seq_printf(s, "\tsspp:%s\n",
>> +        seq_printf(s, "\tsspp[0]:%s\n",
>>                  pstate->pipe.sspp->cap->name);
>> -        seq_printf(s, "\tmultirect: mode: %d index: %d\n",
>> +        seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
>>               pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
>> +        if (pstate->r_pipe.sspp) {
>> +            seq_printf(s, "\tsspp[1]:%s\n",
>> +                   pstate->r_pipe.sspp->cap->name);
>> +            seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
>> +                   pstate->r_pipe.multirect_mode, 
>> pstate->r_pipe.multirect_index);
>> +        }
>>           seq_puts(s, "\n");
>>       }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index f52120b05b6e..73db15d76059 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -701,6 +701,10 @@ static void _dpu_plane_color_fill(struct 
>> dpu_plane *pdpu,
>>       /* update sspp */
>>       _dpu_plane_color_fill_pipe(pstate, &pstate->pipe, 
>> &pstate->pipe_cfg.dst_rect,
>>                      fill_color, fmt);
>> +
>> +    if (pstate->r_pipe.sspp)
>> +        _dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, 
>> &pstate->r_pipe_cfg.dst_rect,
>> +                       fill_color, fmt);
>>   }
>>   int dpu_plane_validate_multirect_v2(struct 
>> dpu_multirect_plane_states *plane)
>> @@ -959,9 +963,12 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>       int ret = 0, min_scale;
>>       struct dpu_plane *pdpu = to_dpu_plane(plane);
>>       struct dpu_plane_state *pstate = 
>> to_dpu_plane_state(new_plane_state);
>> +    struct dpu_sw_pipe *pipe = &pstate->pipe;
>> +    struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>>       const struct drm_crtc_state *crtc_state = NULL;
>>       const struct dpu_format *fmt;
>>       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>> +    struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>>       struct drm_rect fb_rect = { 0 };
>>       uint32_t max_linewidth;
>>       unsigned int rotation;
>> @@ -985,8 +992,11 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>       if (!new_plane_state->visible)
>>           return 0;
>> -    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>> -    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>> +    pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>> +    pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>> +    r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>> +    r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>> +    r_pipe->sspp = NULL;
>>       pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>>       if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
>> @@ -1016,21 +1026,67 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>           return -E2BIG;
>>       }
>> +    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +
>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>> -    /* check decimated source width */
>>       if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>> -        DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
>> -                DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>> -        return -E2BIG;
>> -    }
>> +        /*
>> +         * In parallel multirect case only the half of the usual width
>> +         * is supported for tiled formats. If we are here, we know that
>> +         * full width is more than max_linewidth, thus each rect is
>> +         * wider than allowed.
>> +         */
>> +        if (DPU_FORMAT_IS_UBWC(fmt)) {
>> +            DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " 
>> line:%u, tiled format\n",
>> +                    DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>> +            return -E2BIG;
>> +        }
> 
> I am seeing a strange issue due to this check. Looks like Chrome 
> compositor tries to do the first frame with UBWC. When I bootup with my 
> DP monitor connected, it tries to use 2560x1440 with UBWC enabled but 
> then fails and then uses linear format and works.
> 
> I confirmed by commenting out this check that its always UBWC.
> 
> I feel this is a compositor issue. If someone can confirm this that 
> would be great because there is nothing wrong with this check.

Yes, I think it is a compositor issue (or misfeature).

> 
> I only want to report this because when this series is cherry-picked and 
> someone tries to bootup with DP connected and it if it does hit this 
> check based on which monitor they try, UBWC no longer works.
> 
> If we can move on and leave that out as compositor issue, I will add my 
> R-b once the other comment is responded to.
> 
> Rest of the testing looks fine.
> 
>> -    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +        if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
>> +            DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " 
>> line:%u\n",
>> +                    DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>> +            return -E2BIG;
>> +        }
>> -    ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, 
>> fmt);
>> +        if (drm_rect_width(&pipe_cfg->src_rect) != 
>> drm_rect_width(&pipe_cfg->dst_rect) ||
>> +            drm_rect_height(&pipe_cfg->src_rect) != 
>> drm_rect_height(&pipe_cfg->dst_rect) ||
>> +            (!test_bit(DPU_SSPP_SMART_DMA_V1, 
>> &pipe->sspp->cap->features) &&
>> +             !test_bit(DPU_SSPP_SMART_DMA_V2, 
>> &pipe->sspp->cap->features)) ||
>> +            DPU_FORMAT_IS_YUV(fmt)) {
>> +            DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " 
>> line:%u, can't use split source\n",
>> +                    DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>> +            return -E2BIG;
>> +        }
>> +
>> +        /*
>> +         * Use multirect for wide plane. We do not support dynamic
>> +         * assignment of SSPPs, so we know the configuration.
>> +         */
>> +        pipe->multirect_index = DPU_SSPP_RECT_0;
>> +        pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>> +
>> +        r_pipe->sspp = pipe->sspp;
>> +        r_pipe->multirect_index = DPU_SSPP_RECT_1;
>> +        r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>> +
>> +        *r_pipe_cfg = *pipe_cfg;
>> +        pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + 
>> pipe_cfg->src_rect.x2) >> 1;
>> +        pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + 
>> pipe_cfg->dst_rect.x2) >> 1;
>> +        r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
>> +        r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
>> +    }
>> +
>> +    ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
>>       if (ret)
>>           return ret;
>> +    if (r_pipe->sspp) {
>> +        ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, 
>> fmt);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>>       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
>>       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
>> @@ -1097,8 +1153,10 @@ void dpu_plane_flush(struct drm_plane *plane)
>>       else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>>           /* force 100% alpha */
>>           _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>> -    else
>> +    else {
>>           dpu_plane_flush_csc(pdpu, &pstate->pipe);
>> +        dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
>> +    }
>>       /* flag h/w flush complete */
>>       if (plane->state)
>> @@ -1210,13 +1268,14 @@ static void 
>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>       struct drm_plane_state *state = plane->state;
>>       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>>       struct dpu_sw_pipe *pipe = &pstate->pipe;
>> +    struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>>       struct drm_crtc *crtc = state->crtc;
>>       struct drm_framebuffer *fb = state->fb;
>>       bool is_rt_pipe;
>>       const struct dpu_format *fmt =
>>           to_dpu_format(msm_framebuffer_format(fb));
>>       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>> -
>> +    struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>>       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>>       struct msm_gem_address_space *aspace = kms->base.aspace;
>>       struct dpu_hw_fmt_layout layout;
>> @@ -1244,6 +1303,12 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>>                      drm_mode_vrefresh(&crtc->mode),
>>                      layout_valid ? &layout : NULL);
>> +    if (r_pipe->sspp) {
>> +        dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
>> +                       drm_mode_vrefresh(&crtc->mode),
>> +                       layout_valid ? &layout : NULL);
>> +    }
>> +
>>       if (pstate->needs_qos_remap)
>>           pstate->needs_qos_remap = false;
>> @@ -1251,16 +1316,31 @@ static void 
>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>                               &crtc->mode, pipe_cfg);
>>       pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
>> +
>> +    if (r_pipe->sspp) {
>> +        pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, 
>> fmt, &crtc->mode, r_pipe_cfg);
>> +
>> +        pstate->plane_clk = max(pstate->plane_clk, 
>> _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
>> +    }
>>   }
>>   static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>>   {
>>       struct drm_plane_state *state = plane->state;
>>       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>> +    struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>>       trace_dpu_plane_disable(DRMID(plane), false,
>>                   pstate->pipe.multirect_mode);
>> +    if (r_pipe->sspp) {
>> +        r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>> +        r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>> +
>> +        if (r_pipe->sspp->ops.setup_multirect)
>> +            r_pipe->sspp->ops.setup_multirect(r_pipe);
>> +    }
> 
> Dont we need to do this even for pstate->pipe?

No. pstate->pipe will be set up when we call 
dpu_plane_sspp_atomic_update() next time. It doesn't seem to matter if 
the disabled SSPP is setup for REC_SOLO or REC_0. We have to ensure that 
REC_1 is disabled so that it doesn't conflict with REC_SOLO setup.

>> +
>>       pstate->pending = true;
>>   }
>> @@ -1293,6 +1373,9 @@ static void dpu_plane_destroy(struct drm_plane 
>> *plane)
>>           pstate = to_dpu_plane_state(plane->state);
>>           _dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false, 
>> DPU_PLANE_QOS_PANIC_CTRL);
>> +        if (pstate->r_pipe.sspp)
>> +            _dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false, 
>> DPU_PLANE_QOS_PANIC_CTRL);
>> +
>>           mutex_destroy(&pdpu->lock);
>>           /* this will destroy the states as well */
>> @@ -1373,12 +1456,29 @@ static void 
>> dpu_plane_atomic_print_state(struct drm_printer *p,
>>           const struct drm_plane_state *state)
>>   {
>>       const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>> +    const struct dpu_sw_pipe *pipe = &pstate->pipe;
>> +    const struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>> +    const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>> +    const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>>       drm_printf(p, "\tstage=%d\n", pstate->stage);
>> -    drm_printf(p, "\tsspp=%s\n", pstate->pipe.sspp->cap->name);
>> -    drm_printf(p, "\tmultirect_mode=%s\n", 
>> dpu_get_multirect_mode(pstate->pipe.multirect_mode));
>> -    drm_printf(p, "\tmultirect_index=%s\n",
>> -           dpu_get_multirect_index(pstate->pipe.multirect_index));
>> +
>> +    drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
>> +    drm_printf(p, "\tmultirect_mode[0]=%s\n", 
>> dpu_get_multirect_mode(pipe->multirect_mode));
>> +    drm_printf(p, "\tmultirect_index[0]=%s\n",
>> +           dpu_get_multirect_index(pipe->multirect_index));
>> +    drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", 
>> DRM_RECT_ARG(&pipe_cfg->src_rect));
>> +    drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", 
>> DRM_RECT_ARG(&pipe_cfg->dst_rect));
>> +
>> +    if (r_pipe->sspp) {
>> +        drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
>> +        drm_printf(p, "\tmultirect_mode[1]=%s\n",
>> +               dpu_get_multirect_mode(r_pipe->multirect_mode));
>> +        drm_printf(p, "\tmultirect_index[1]=%s\n",
>> +               dpu_get_multirect_index(r_pipe->multirect_index));
>> +        drm_printf(p, "\tsrc[1]=" DRM_RECT_FMT "\n", 
>> DRM_RECT_ARG(&r_pipe_cfg->src_rect));
>> +        drm_printf(p, "\tdst[1]=" DRM_RECT_FMT "\n", 
>> DRM_RECT_ARG(&r_pipe_cfg->dst_rect));
>> +    }
>>   }
>>   static void dpu_plane_reset(struct drm_plane *plane)
>> @@ -1412,6 +1512,10 @@ static void dpu_plane_reset(struct drm_plane 
>> *plane)
>>        * This is the place where the state is allocated, so fill it 
>> fully.
>>        */
>>       pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
>> +    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>> +    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>> +
>> +    pstate->r_pipe.sspp = NULL;
>>       __drm_atomic_helper_plane_reset(plane, &pstate->base);
>>   }
>> @@ -1428,6 +1532,8 @@ void dpu_plane_danger_signal_ctrl(struct 
>> drm_plane *plane, bool enable)
>>       pm_runtime_get_sync(&dpu_kms->pdev->dev);
>>       _dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable, 
>> DPU_PLANE_QOS_PANIC_CTRL);
>> +    if (pstate->r_pipe.sspp)
>> +        _dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable, 
>> DPU_PLANE_QOS_PANIC_CTRL);
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }
>>   #endif
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> index 0ca9002015ff..7490ffd94d03 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> @@ -19,7 +19,9 @@
>>    * @base:    base drm plane state object
>>    * @aspace:    pointer to address space for input/output buffers
>>    * @pipe:    software pipe description
>> + * @r_pipe:    software pipe description of the second pipe
>>    * @pipe_cfg:    software pipe configuration
>> + * @r_pipe_cfg:    software pipe configuration for the second pipe
>>    * @stage:    assigned by crtc blender
>>    * @needs_qos_remap: qos remap settings need to be updated
>>    * @multirect_index: index of the rectangle of SSPP
>> @@ -34,7 +36,9 @@ struct dpu_plane_state {
>>       struct drm_plane_state base;
>>       struct msm_gem_address_space *aspace;
>>       struct dpu_sw_pipe pipe;
>> +    struct dpu_sw_pipe r_pipe;
>>       struct dpu_sw_pipe_cfg pipe_cfg;
>> +    struct dpu_sw_pipe_cfg r_pipe_cfg;
>>       enum dpu_stage stage;
>>       bool needs_qos_remap;
>>       bool pending;

-- 
With best wishes
Dmitry

