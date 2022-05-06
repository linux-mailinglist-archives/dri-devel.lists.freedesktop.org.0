Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8D51E000
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 22:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8126410E30D;
	Fri,  6 May 2022 20:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BD810E30D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 20:14:12 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id w1so14360459lfa.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=huY0RdPJ3s6Frosuyg21lQiWCdcQbrs35322C4ajgKw=;
 b=bgXlwelKT4gyjvZu8P6G8/eNeCy9uK5vbJ3f2/7sdtjcosqp2wryzgwNZQXD5RYBFU
 bdonf7zP3YvQXsxapTOCpavc+pduZ8JiD2diPNJmVJKduzkQjhEaoURLN9Uyy7gnfGvc
 4zdxIWMuNglpO3j5ZXV9vPF2+z8QJstjf9qy/4skX9pVMvWBEN78bzSt+gqxIl2fhXzD
 jM9U9j2EtTZO9xOQlw653TsoilYUbVig0LS5VrVIFM3c4LUERshAKxWihWT5YbSIJipG
 fULYp7D29LgayFYiwItwGaTD1KS8XdYCtXSQdh3GLcvoy/cD7rZq23x35qwYCCv3T6sI
 yhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=huY0RdPJ3s6Frosuyg21lQiWCdcQbrs35322C4ajgKw=;
 b=dP/UqF9r9BJ/ZJv3cYP3yE/E1S2NlOKT1ofoddw0sTgnLq12QxCnuPYrrpTlJMagpv
 io0yE2JzWtrfc9oWn13L6ZR2Cg076EP076zxrxGA+8IobC48l7s33cVtwZBefJOqAiYU
 /0eVfWNTXWa6E92qez2P5TdT1GMi3Itr+TP6NaflOz9AZkxagwLTWYQI0D3Tf/UFbN4y
 2RRFvp9ARJmWpRWfvSm7XSwnk8EQCSWYB2ha9w7NJeJHeU16HeSbIl/g2mpBC1TA2sts
 j4WM4HEzmIGBdPBk7ffMwMJGSZdn8yfxaoYZ0Vw6/nG6FXGkOO8qbwOvVnyCMX1moNar
 dKoA==
X-Gm-Message-State: AOAM532+x0zvqULgdDViGOItPsJXfIvkyR0EVnzCaRfyMKZAbgW70rxs
 CFXfjZlrRojL80pn4IsNnDyH6g==
X-Google-Smtp-Source: ABdhPJw+QzRZ5AFjCDMIQdNsW/mCwRDdeyJOVnLTXBnIIepKlwczd8/bK9ADHeGEFE8xbHRJ1eCQwA==
X-Received: by 2002:a05:6512:39c1:b0:471:b37e:fe5a with SMTP id
 k1-20020a05651239c100b00471b37efe5amr3557247lfu.527.1651868051159; 
 Fri, 06 May 2022 13:14:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056512110d00b0047255d210f5sm807361lfg.36.2022.05.06.13.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 13:14:10 -0700 (PDT)
Message-ID: <cbb13481-093f-54e2-13aa-1021a30f7fae@linaro.org>
Date: Fri, 6 May 2022 23:14:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 09/25] drm/msm/dpu: dpu_crtc_blend_setup: split mixer and
 ctl logic
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-10-dmitry.baryshkov@linaro.org>
 <2568f72d-3f2c-056e-185f-30bd85b84705@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2568f72d-3f2c-056e-185f-30bd85b84705@quicinc.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/05/2022 21:56, Abhinav Kumar wrote:
> 
> 
> On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
>> The funcitons _dpu_crtc_blend_setup() and _dpu_crtc_blend_setup_mixer()
>> have an intertwined mixture of CTL and LM-related code. Split these two
>> functions into LM-specific and CTL-specific parts, making both code
>> paths clean and observable.
>>
> 
> I do see the intention of this change, but there are two things to 
> consider here.
> 
> Let me know what you think of those:
> 
> 1) Agreed that we are able to split it out but at what cost? We are 
> repeating some of the loops such as
> 
> a) for (i = 0; i < cstate->num_mixers; i++) {
> b) drm_atomic_crtc_for_each_plane(

Maybe we should invert these loops, so that we'll through the planes and 
only then loop over the mixers.

> 
> 2) The intertwining is "somewhat" logical here because we are 
> programming the LMs for which we are staging the planes so it somewhat 
> goes together

I'll revisit this for v2. I'll move this towards the end of the series, 
so it would be more obvious if patch 25/25 is better with this change or 
w/o it.

> 
> 3) dropping sspp idx from this trace removes some useful informatio of 
> which sspp is staged to which stage of blend

I can add this back to the dpu_crtc_blend_setup_ctl

> 
>  >           trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
>  >                          state, pstate, stage_idx,
>  > -                       sspp_idx - SSPP_VIG0,
>  >                          format->base.pixel_format,
>  >                          fb ? fb->modifier : 0);
> 
> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 101 +++++++++++++---------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h |  10 +--
>>   2 files changed, 63 insertions(+), 48 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index e6c33022d560..ada7d5750536 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -336,27 +336,23 @@ static void 
>> _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>>       }
>>   }
>> -static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>> -    struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
>> -    struct dpu_hw_stage_cfg *stage_cfg)
>> +static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc)
>>   {
>> +    struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>> +    struct dpu_crtc_mixer *mixer = cstate->mixers;
>>       struct drm_plane *plane;
>>       struct drm_framebuffer *fb;
>>       struct drm_plane_state *state;
>> -    struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>>       struct dpu_plane_state *pstate = NULL;
>>       struct dpu_format *format;
>> -    struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>> -
>> +    int i;
>>       uint32_t stage_idx, lm_idx;
>> -    int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
>>       bool bg_alpha_enable = false;
>> -    DECLARE_BITMAP(fetch_active, SSPP_MAX);
>> -    memset(fetch_active, 0, sizeof(fetch_active));
>> -    drm_atomic_crtc_for_each_plane(plane, crtc) {
>> -        enum dpu_sspp sspp_idx;
>> +    for (i = 0; i < cstate->num_mixers; i++)
>> +        mixer[i].mixer_op_mode = 0;
>> +    drm_atomic_crtc_for_each_plane(plane, crtc) {
>>           state = plane->state;
>>           if (!state)
>>               continue;
>> @@ -364,14 +360,10 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>           pstate = to_dpu_plane_state(state);
>>           fb = state->fb;
>> -        sspp_idx = pstate->pipe_hw->idx;
>> -        set_bit(sspp_idx, fetch_active);
>> -
>> -        DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
>> +        DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d fb %d\n",
>>                   crtc->base.id,
>>                   pstate->stage,
>>                   plane->base.id,
>> -                sspp_idx - SSPP_VIG0,
>>                   state->fb ? state->fb->base.id : -1);
>>           format = 
>> to_dpu_format(msm_framebuffer_format(pstate->base.fb));
>> @@ -379,15 +371,8 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>           if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>>               bg_alpha_enable = true;
>> -        stage_idx = zpos_cnt[pstate->stage]++;
>> -        stage_cfg->stage[pstate->stage][stage_idx] =
>> -                    sspp_idx;
>> -        stage_cfg->multirect_index[pstate->stage][stage_idx] =
>> -                    pstate->multirect_index;
>> -
>>           trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
>>                          state, pstate, stage_idx,
>> -                       sspp_idx - SSPP_VIG0,
>>                          format->base.pixel_format,
>>                          fb ? fb->modifier : 0);
>> @@ -396,8 +381,6 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>               _dpu_crtc_setup_blend_cfg(mixer + lm_idx,
>>                           pstate, format);
>> -            
>> mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, 
>> sspp_idx);
>> -
>>               if (bg_alpha_enable && !format->alpha_enable)
>>                   mixer[lm_idx].mixer_op_mode = 0;
>>               else
>> @@ -406,17 +389,22 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>           }
>>       }
>> -    if (ctl->ops.set_active_pipes)
>> -        ctl->ops.set_active_pipes(ctl, fetch_active);
>> -
>>        _dpu_crtc_program_lm_output_roi(crtc);
>> +
>> +    for (i = 0; i < cstate->num_mixers; i++) {
>> +        struct dpu_hw_mixer *lm;
>> +
>> +        lm = mixer[i].hw_lm;
>> +
>> +        lm->ops.setup_alpha_out(lm, mixer[i].mixer_op_mode);
>> +
>> +        DRM_DEBUG_ATOMIC("lm %d, op_mode 0x%X\n",
>> +            mixer[i].hw_lm->idx - LM_0,
>> +            mixer[i].mixer_op_mode);
>> +    }
>>   }
>> -/**
>> - * _dpu_crtc_blend_setup - configure crtc mixers
>> - * @crtc: Pointer to drm crtc structure
>> - */
>> -static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>> +static void _dpu_crtc_blend_setup_ctl(struct drm_crtc *crtc)
>>   {
>>       struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>> @@ -425,34 +413,62 @@ static void _dpu_crtc_blend_setup(struct 
>> drm_crtc *crtc)
>>       struct dpu_hw_mixer *lm;
>>       struct dpu_hw_stage_cfg stage_cfg;
>>       int i;
>> +    struct drm_plane *plane;
>> +    struct drm_plane_state *state;
>> +    struct dpu_plane_state *pstate = NULL;
>> +
>> +    uint32_t stage_idx, lm_idx;
>> +    int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
>> +    DECLARE_BITMAP(fetch_active, SSPP_MAX);
>>       DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
>> -    for (i = 0; i < cstate->num_mixers; i++) {
>> -        mixer[i].mixer_op_mode = 0;
>> +    for (i = 0; i < cstate->num_mixers; i++)
>>           if (mixer[i].lm_ctl->ops.clear_all_blendstages)
>>               mixer[i].lm_ctl->ops.clear_all_blendstages(
>>                       mixer[i].lm_ctl);
>> -    }
>>       /* initialize stage cfg */
>>       memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
>> -    _dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
>> +    memset(fetch_active, 0, sizeof(fetch_active));
>> +    drm_atomic_crtc_for_each_plane(plane, crtc) {
>> +        enum dpu_sspp sspp_idx;
>> +
>> +        state = plane->state;
>> +        if (!state)
>> +            continue;
>> +
>> +        pstate = to_dpu_plane_state(state);
>> +
>> +        sspp_idx = pstate->pipe_hw->idx;
>> +        set_bit(sspp_idx, fetch_active);
>> +
>> +        stage_idx = zpos_cnt[pstate->stage]++;
>> +        stage_cfg.stage[pstate->stage][stage_idx] =
>> +                    sspp_idx;
>> +        stage_cfg.multirect_index[pstate->stage][stage_idx] =
>> +                    pstate->multirect_index;
>> +
>> +        /* blend config update */
>> +        for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++)
>> +            
>> mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, 
>> sspp_idx);
>> +    }
>> +
>> +    ctl = mixer->lm_ctl;
>> +    if (ctl->ops.set_active_pipes)
>> +        ctl->ops.set_active_pipes(ctl, fetch_active);
>>       for (i = 0; i < cstate->num_mixers; i++) {
>>           ctl = mixer[i].lm_ctl;
>>           lm = mixer[i].hw_lm;
>> -        lm->ops.setup_alpha_out(lm, mixer[i].mixer_op_mode);
>> -
>>           /* stage config flush mask */
>>           ctl->ops.update_pending_flush_mixer(ctl,
>>               mixer[i].hw_lm->idx);
>> -        DRM_DEBUG_ATOMIC("lm %d, op_mode 0x%X, ctl %d\n",
>> +        DRM_DEBUG_ATOMIC("lm %d, ctl %d\n",
>>               mixer[i].hw_lm->idx - LM_0,
>> -            mixer[i].mixer_op_mode,
>>               ctl->idx - CTL_0);
>>           ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
>> @@ -731,7 +747,8 @@ static void dpu_crtc_atomic_begin(struct drm_crtc 
>> *crtc,
>>       if (unlikely(!cstate->num_mixers))
>>           return;
>> -    _dpu_crtc_blend_setup(crtc);
>> +    _dpu_crtc_blend_setup_mixer(crtc);
>> +    _dpu_crtc_blend_setup_ctl(crtc);
>>       _dpu_crtc_setup_cp_blocks(crtc);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> index 54d74341e690..ecd2f371374d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> @@ -632,9 +632,9 @@ TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
>>   TRACE_EVENT(dpu_crtc_setup_mixer,
>>       TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
>>            struct drm_plane_state *state, struct dpu_plane_state *pstate,
>> -         uint32_t stage_idx, enum dpu_sspp sspp, uint32_t pixel_format,
>> +         uint32_t stage_idx, uint32_t pixel_format,
>>            uint64_t modifier),
>> -    TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx, sspp,
>> +    TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
>>           pixel_format, modifier),
>>       TP_STRUCT__entry(
>>           __field(    uint32_t,        crtc_id        )
>> @@ -644,7 +644,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>>           __field_struct(    struct drm_rect,    dst_rect    )
>>           __field(    uint32_t,        stage_idx    )
>>           __field(    enum dpu_stage,        stage        )
>> -        __field(    enum dpu_sspp,        sspp        )
>>           __field(    uint32_t,        multirect_idx    )
>>           __field(    uint32_t,        multirect_mode    )
>>           __field(    uint32_t,        pixel_format    )
>> @@ -658,20 +657,19 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>>           __entry->dst_rect = drm_plane_state_dest(state);
>>           __entry->stage_idx = stage_idx;
>>           __entry->stage = pstate->stage;
>> -        __entry->sspp = sspp;
>>           __entry->multirect_idx = pstate->multirect_index;
>>           __entry->multirect_mode = pstate->multirect_mode;
>>           __entry->pixel_format = pixel_format;
>>           __entry->modifier = modifier;
>>       ),
>>       TP_printk("crtc_id:%u plane_id:%u fb_id:%u src:" DRM_RECT_FP_FMT
>> -          " dst:" DRM_RECT_FMT " stage_idx:%u stage:%d, sspp:%d "
>> +          " dst:" DRM_RECT_FMT " stage_idx:%u stage:%d, "
>>             "multirect_index:%d multirect_mode:%u pix_format:%u "
>>             "modifier:%llu",
>>             __entry->crtc_id, __entry->plane_id, __entry->fb_id,
>>             DRM_RECT_FP_ARG(&__entry->src_rect),
>>             DRM_RECT_ARG(&__entry->dst_rect),
>> -          __entry->stage_idx, __entry->stage, __entry->sspp,
>> +          __entry->stage_idx, __entry->stage,
>>             __entry->multirect_idx, __entry->multirect_mode,
>>             __entry->pixel_format, __entry->modifier)
>>   );


-- 
With best wishes
Dmitry
