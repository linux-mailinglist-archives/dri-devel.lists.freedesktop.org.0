Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F126A9723
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8577410E5D7;
	Fri,  3 Mar 2023 12:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E9910E5D2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:18:29 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bi9so3359836lfb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qp1OBL5Cz0Ky5RTqOAyRuAgYI/cQ60LL2lG7hCVsIvM=;
 b=J5c5LE7QEUvOLp+LMUaHl3PMSsIZmuZw79W4eaPAEJzVMsjdikb4DMNGUItMCQKWZl
 0ORQaj9I4sN9xdrjM4P6kC8gv4Tbitf5GJg7/PnPXlITbcILm4ie9THiYKZKtFP1lhsS
 SWQ03GyHcMCZBoWPMMLWgmurpzHS9OiEEzQZDzrNK5GxhLRqtMdVM2exoZ/2oyTuDL5u
 uklyzrsIrzaBzoFmLnqTWRY3e6pZthnkNNvHo085hk49sy+WT+E2lJZezSQ69FNjc80R
 An6XXfTltlyTfePsg3+exmJl6f1t5XVoPQ2W9mjHaqB+yxID8iMKrRmfW0LLTmCNeALk
 qAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qp1OBL5Cz0Ky5RTqOAyRuAgYI/cQ60LL2lG7hCVsIvM=;
 b=sHY5H79pGXvWBYY+XM4za8XSTmEFHJqcHMfM19/3tTX5c/eqMOrS63rrkTQmd0onVw
 IFTP88RU1WVSm9IftTeOdtE+SBkyZJNOlI7OI6C2n/TiH81ztAkvCjkuVT4kzgo/TQgu
 9Rt6kwS3zdsFbkeARj/7s+fsg6Sj4HvcuXpq1z4i9m/s/O0DeZVhKsxHjiVyGUIXBmR5
 f6+gu6LMLQ6SDScREcixOW2ox3dBpy5hNaAKMyrvTizgsEGshOeG32tmGZz4wOJsWFfm
 wmhju6i8nn3Bm5omEHv2SSVuV9zvAsuJp6kbMz7/QyX/QctXR8RegNDucSNXcfnqWO0t
 5XbQ==
X-Gm-Message-State: AO0yUKUrdtC+BLkJ7R9pnW9inKSYRfn1EAFckuM3M5SLapltzeORyAgj
 NcbkfCCgUAeGySj6xphNAF6lrg==
X-Google-Smtp-Source: AK7set+ukyhb920Gs8QsMCwXXqCDiY8Z8+7Wn0if2jbCcvuraPORjOA3FtOjrnBF2hEWLa3ibBBFFA==
X-Received: by 2002:a05:6512:505:b0:4b5:688e:ee10 with SMTP id
 o5-20020a056512050500b004b5688eee10mr483013lfb.16.1677845907229; 
 Fri, 03 Mar 2023 04:18:27 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a19701a000000b004b7033da2d7sm368094lfc.128.2023.03.03.04.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 04:18:26 -0800 (PST)
Message-ID: <e7423df3-12d4-7f76-7ac4-53c8179aa442@linaro.org>
Date: Fri, 3 Mar 2023 14:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 26/27] drm/msm/dpu: split pipe handling from
 _dpu_crtc_blend_setup_mixer
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-27-dmitry.baryshkov@linaro.org>
 <133ba8d8-f52f-42a5-712c-039f225d61fa@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <133ba8d8-f52f-42a5-712c-039f225d61fa@quicinc.com>
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

On 09/02/2023 01:44, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Rework _dpu_crtc_blend_setup_mixer() to split away pipe handling to a
>> separate functon. This is a preparation for the r_pipe support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 86 ++++++++++++++++-------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 ++-
>>   2 files changed, 63 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 73e1a8c69ef0..0ca3bc38ff7e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -400,6 +400,47 @@ static void 
>> _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>>       }
>>   }
>> +static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>> +                       struct drm_plane *plane,
>> +                       struct dpu_crtc_mixer *mixer,
>> +                       u32 num_mixers,
>> +                       struct dpu_hw_stage_cfg *stage_cfg,
>> +                       enum dpu_stage stage,
>> +                       unsigned int stage_idx,
>> +                       unsigned long *fetch_active,
>> +                       struct dpu_sw_pipe *pipe
>> +                      )
>> +{
>> +    uint32_t lm_idx;
>> +    enum dpu_sspp sspp_idx;
>> +    struct drm_plane_state *state;
>> +
>> +    if (!pipe->sspp)
>> +        return;
>> +
>> +    sspp_idx = pipe->sspp->idx;
>> +
>> +    state = plane->state;
>> +
>> +    DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
>> +             crtc->base.id,
>> +             stage,
>> +             plane->base.id,
>> +             sspp_idx - SSPP_NONE,
>> +             state->fb ? state->fb->base.id : -1);
>> +
>> +    set_bit(sspp_idx, fetch_active);
>> +
>> +    stage_cfg->stage[stage][stage_idx] = sspp_idx;
>> +    stage_cfg->multirect_index[stage][stage_idx] =
>> +                pipe->multirect_index;
>> +
>> +    /* blend config update */
>> +    for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
>> +        
>> mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
>> +                                    sspp_idx);
> 
> If you just pass the format to this function you can move rest of the 
> for loop also to this function.

As a second thought, this would defeat the purpose of the split. We 
don't have to call _dpu_crtc_setup_blend_cfg() or setup mixer_op_mode 
for the second pipe separately. So, I'd leave the loops as is.

> 
> Also, you will be able to add the trace_dpu_crtc_setup_mixer() with 
> complete information.
> 
> trace_dpu_crtc_setup_mixer is currently missing te stage_idx which is 
> important to debug blend issues.
> 
>> +}
>> +
>>   static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>>       struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
>>       struct dpu_hw_stage_cfg *stage_cfg)
>> @@ -412,15 +453,12 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>       struct dpu_format *format;
>>       struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>> -    uint32_t stage_idx, lm_idx;
>> -    int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
>> +    uint32_t lm_idx;
>>       bool bg_alpha_enable = false;
>>       DECLARE_BITMAP(fetch_active, SSPP_MAX);
>>       memset(fetch_active, 0, sizeof(fetch_active));
>>       drm_atomic_crtc_for_each_plane(plane, crtc) {
>> -        enum dpu_sspp sspp_idx;
>> -
>>           state = plane->state;
>>           if (!state)
>>               continue;
>> @@ -431,39 +469,25 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>           pstate = to_dpu_plane_state(state);
>>           fb = state->fb;
>> -        sspp_idx = pstate->pipe.sspp->idx;
>> -        set_bit(sspp_idx, fetch_active);
>> -
>> -        DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
>> -                crtc->base.id,
>> -                pstate->stage,
>> -                plane->base.id,
>> -                sspp_idx - SSPP_VIG0,
>> -                state->fb ? state->fb->base.id : -1);
>> -
>>           format = 
>> to_dpu_format(msm_framebuffer_format(pstate->base.fb));
>>           if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>>               bg_alpha_enable = true;
>> -        stage_idx = zpos_cnt[pstate->stage]++;
>> -        stage_cfg->stage[pstate->stage][stage_idx] =
>> -                    sspp_idx;
>> -        stage_cfg->multirect_index[pstate->stage][stage_idx] =
>> -                    pstate->pipe.multirect_index;
>> -
>>           trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
>> -                       state, pstate, stage_idx,
>> +                       state, pstate,
>>                          format->base.pixel_format,
>>                          fb ? fb->modifier : 0);
>> +        _dpu_crtc_blend_setup_pipe(crtc, plane,
>> +                       mixer, cstate->num_mixers,
>> +                       stage_cfg, pstate->stage, 0,
>> +                       fetch_active,
>> +                       &pstate->pipe);
>> +
>>           /* blend config update */
>>           for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
>> -            _dpu_crtc_setup_blend_cfg(mixer + lm_idx,
>> -                        pstate, format);
>> -
>> -            
>> mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
>> -                                        sspp_idx);
>> +            _dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
>>               if (bg_alpha_enable && !format->alpha_enable)
>>                   mixer[lm_idx].mixer_op_mode = 0;
>> @@ -1297,8 +1321,16 @@ static int _dpu_debugfs_status_show(struct 
>> seq_file *s, void *data)
>>           seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
>>               state->crtc_x, state->crtc_y, state->crtc_w,
>>               state->crtc_h);
>> -        seq_printf(s, "\tmultirect: mode: %d index: %d\n",
>> +        seq_printf(s, "\tsspp[0]:%d\n",
>> +               pstate->pipe.sspp->idx - SSPP_NONE);
>> +        seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
>>               pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
>> +        if (pstate->r_pipe.sspp) {
>> +            seq_printf(s, "\tsspp[1]:%d\n",
>> +                   pstate->r_pipe.sspp->idx - SSPP_NONE);
>> +            seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
>> +                   pstate->r_pipe.multirect_mode, 
>> pstate->r_pipe.multirect_index);
>> +        }
>>           seq_puts(s, "\n");
>>       }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> index 0ad148cc2fb8..5ec4f89e8814 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> @@ -633,9 +633,9 @@ TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
>>   TRACE_EVENT(dpu_crtc_setup_mixer,
>>       TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
>>            struct drm_plane_state *state, struct dpu_plane_state *pstate,
>> -         uint32_t stage_idx, uint32_t pixel_format,
>> +         uint32_t pixel_format,
>>            uint64_t modifier),
>> -    TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
>> +    TP_ARGS(crtc_id, plane_id, state, pstate,
>>           pixel_format, modifier),
>>       TP_STRUCT__entry(
>>           __field(    uint32_t,        crtc_id        )
>> @@ -643,7 +643,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>>           __field(    uint32_t,        fb_id        )
>>           __field_struct(    struct drm_rect,    src_rect    )
>>           __field_struct(    struct drm_rect,    dst_rect    )
>> -        __field(    uint32_t,        stage_idx    )
>>           __field(    enum dpu_stage,        stage        )
>>           __field(    enum dpu_sspp,        sspp        )
>>           __field(    uint32_t,        multirect_idx    )
>> @@ -657,7 +656,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>>           __entry->fb_id = state ? state->fb->base.id : 0;
>>           __entry->src_rect = drm_plane_state_src(state);
>>           __entry->dst_rect = drm_plane_state_dest(state);
>> -        __entry->stage_idx = stage_idx;
>>           __entry->stage = pstate->stage;
>>           __entry->sspp = pstate->pipe.sspp->idx;
>>           __entry->multirect_idx = pstate->pipe.multirect_index;
>> @@ -666,13 +664,13 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>>           __entry->modifier = modifier;
>>       ),
>>       TP_printk("crtc_id:%u plane_id:%u fb_id:%u src:" DRM_RECT_FP_FMT
>> -          " dst:" DRM_RECT_FMT " stage_idx:%u stage:%d, sspp:%d "
>> +          " dst:" DRM_RECT_FMT " stage:%d, sspp:%d "
>>             "multirect_index:%d multirect_mode:%u pix_format:%u "
>>             "modifier:%llu",
>>             __entry->crtc_id, __entry->plane_id, __entry->fb_id,
>>             DRM_RECT_FP_ARG(&__entry->src_rect),
>>             DRM_RECT_ARG(&__entry->dst_rect),
>> -          __entry->stage_idx, __entry->stage, __entry->sspp,
>> +          __entry->stage, __entry->sspp,
>>             __entry->multirect_idx, __entry->multirect_mode,
>>             __entry->pixel_format, __entry->modifier)
>>   );

-- 
With best wishes
Dmitry

