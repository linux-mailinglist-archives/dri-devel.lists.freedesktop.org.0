Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B651E1AA
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 00:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EC010E3DB;
	Fri,  6 May 2022 22:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00F710E33D;
 Fri,  6 May 2022 22:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651877206; x=1683413206;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LbEu3qEDxYW+gS8TfKdT2woydHqPMrh6LSyRaU2lLFo=;
 b=YJyJ/vTwS/FV9byYnHX2dPAg11Fyg6Gz0H03JdnDk/oKIB6e3XblnVi+
 KHndEObzPk5+cgrkZruwQXMFkk4iFguZraIXw0k9BK9lxnyOnXzuEiLPC
 nTsYR2p1AWIsfgS4YMMdkD0xrbvh3CumeH5vUcADAjJ0Dqcx6UqUqJYEF U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 May 2022 15:46:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 15:46:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 15:46:45 -0700
Received: from [10.111.168.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 6 May 2022
 15:46:42 -0700
Message-ID: <1857d35c-0ef0-9d0d-e310-6780497fed76@quicinc.com>
Date: Fri, 6 May 2022 15:46:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH 10/25] drm/msm/dpu: introduce struct
 dpu_sw_pipe
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-11-dmitry.baryshkov@linaro.org>
 <667a1dbe-5640-a92e-a9f8-a55935005083@quicinc.com>
 <27cccd15-080e-0610-09e0-e0cfc3b85f55@linaro.org>
 <8c70db5b-4b05-5a23-c87f-ead3c4838dd1@quicinc.com>
 <bcd1ba6c-0782-7a51-ab7b-ed43e629b4c9@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <bcd1ba6c-0782-7a51-ab7b-ed43e629b4c9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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



On 5/6/2022 3:29 PM, Dmitry Baryshkov wrote:
> On 07/05/2022 00:48, Abhinav Kumar wrote:
>>
>>
>> On 5/6/2022 2:39 PM, Dmitry Baryshkov wrote:
>>> On 07/05/2022 00:30, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
>>>>> Wrap SSPP and multirect index/mode into a single structure that
>>>>> represents software view on the pipe used.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |   8 +-
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  16 ++-
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 136 
>>>>> ++++++++++----------
>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |   4 +-
>>>>>   4 files changed, 86 insertions(+), 78 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> index ada7d5750536..751c64012058 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> @@ -441,14 +441,14 @@ static void _dpu_crtc_blend_setup_ctl(struct 
>>>>> drm_crtc *crtc)
>>>>>           pstate = to_dpu_plane_state(state);
>>>>> -        sspp_idx = pstate->pipe_hw->idx;
>>>>> +        sspp_idx = pstate->pipe.sspp->idx;
>>>>>           set_bit(sspp_idx, fetch_active);
>>>>>           stage_idx = zpos_cnt[pstate->stage]++;
>>>>>           stage_cfg.stage[pstate->stage][stage_idx] =
>>>>>                       sspp_idx;
>>>>>           stage_cfg.multirect_index[pstate->stage][stage_idx] =
>>>>> -                    pstate->multirect_index;
>>>>> +                    pstate->pipe.multirect_index;
>>>>>           /* blend config update */
>>>>>           for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++)
>>>>> @@ -1118,7 +1118,7 @@ static int dpu_crtc_atomic_check(struct 
>>>>> drm_crtc *crtc,
>>>>>           pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
>>>>>           pstates[cnt].drm_pstate = pstate;
>>>>>           pstates[cnt].stage = pstate->normalized_zpos;
>>>>> -        pstates[cnt].pipe_id = 
>>>>> to_dpu_plane_state(pstate)->pipe_hw->idx;
>>>>> +        pstates[cnt].pipe_id = 
>>>>> to_dpu_plane_state(pstate)->pipe.sspp->idx;
>>>>>           if (pipe_staged[pstates[cnt].pipe_id]) {
>>>>>               multirect_plane[multirect_count].r0 =
>>>>> @@ -1389,7 +1389,7 @@ static int _dpu_debugfs_status_show(struct 
>>>>> seq_file *s, void *data)
>>>>>               state->crtc_x, state->crtc_y, state->crtc_w,
>>>>>               state->crtc_h);
>>>>>           seq_printf(s, "\tmultirect: mode: %d index: %d\n",
>>>>> -            pstate->multirect_mode, pstate->multirect_index);
>>>>> +            pstate->pipe.multirect_mode, 
>>>>> pstate->pipe.multirect_index);
>>>>>           seq_puts(s, "\n");
>>>>>       }
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>>>> index 674f311f99b4..0af2bc6e5df8 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>>>> @@ -159,15 +159,11 @@ struct dpu_hw_pixel_ext {
>>>>>    * @src_rect:  src ROI, caller takes into account the different 
>>>>> operations
>>>>>    *             such as decimation, flip etc to program this field
>>>>>    * @dest_rect: destination ROI.
>>>>> - * @index:     index of the rectangle of SSPP
>>>>> - * @mode:      parallel or time multiplex multirect mode
>>>>>    */
>>>>>   struct dpu_hw_pipe_cfg {
>>>>>       struct dpu_hw_fmt_layout layout;
>>>>>       struct drm_rect src_rect;
>>>>>       struct drm_rect dst_rect;
>>>>> -    enum dpu_sspp_multirect_index index;
>>>>> -    enum dpu_sspp_multirect_mode mode;
>>>>>   };
>>>>>   /**
>>>>> @@ -218,6 +214,18 @@ struct dpu_hw_pipe_ts_cfg {
>>>>>       u64 time;
>>>>>   };
>>>>> +/**
>>>>> + * struct dpu_sw_pipe - software pipe description
>>>>> + * @sspp:      backing SSPP pipe
>>>>> + * @index:     index of the rectangle of SSPP
>>>>> + * @mode:      parallel or time multiplex multirect mode
>>>>> + */
>>>>> +struct dpu_sw_pipe {
>>>>> +    struct dpu_hw_pipe *sspp;
>>>>> +    enum dpu_sspp_multirect_index multirect_index;
>>>>> +    enum dpu_sspp_multirect_mode multirect_mode;
>>>>> +};
>>>>> +
>>>>>   /**
>>>>>    * struct dpu_hw_sspp_ops - interface to the SSPP Hw driver 
>>>>> functions
>>>>>    * Caller must call the init function to get the pipe context for 
>>>>> each pipe
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> index d1f9b4bc10ac..51b5e8a3182b 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> @@ -247,7 +247,7 @@ static int _dpu_plane_calc_fill_level(struct 
>>>>> drm_plane *plane,
>>>>>                   ((src_width + 32) * fmt->bpp);
>>>>>           }
>>>>>       } else {
>>>>> -        if (pstate->multirect_mode == DPU_SSPP_MULTIRECT_PARALLEL) {
>>>>> +        if (pstate->pipe.multirect_mode == 
>>>>> DPU_SSPP_MULTIRECT_PARALLEL) {
>>>>>               total_fl = (fixed_buff_size / 2) * 2 /
>>>>>                   ((src_width + 32) * fmt->bpp);
>>>>>           } else {
>>>>> @@ -331,7 +331,7 @@ static void _dpu_plane_set_qos_lut(struct 
>>>>> drm_plane *plane,
>>>>>               fmt ? (char *)&fmt->base.pixel_format : NULL,
>>>>>               pdpu->is_rt_pipe, total_fl, qos_lut);
>>>>> -    pstate->pipe_hw->ops.setup_creq_lut(pstate->pipe_hw, qos_lut);
>>>>> +    pstate->pipe.sspp->ops.setup_creq_lut(pstate->pipe.sspp, 
>>>>> qos_lut);
>>>>>   }
>>>>>   /**
>>>>> @@ -383,7 +383,7 @@ static void _dpu_plane_set_danger_lut(struct 
>>>>> drm_plane *plane,
>>>>>           danger_lut,
>>>>>           safe_lut);
>>>>> -    pstate->pipe_hw->ops.setup_danger_safe_lut(pstate->pipe_hw,
>>>>> +    pstate->pipe.sspp->ops.setup_danger_safe_lut(pstate->pipe.sspp,
>>>>>               danger_lut, safe_lut);
>>>>>   }
>>>>> @@ -403,9 +403,9 @@ static void _dpu_plane_set_qos_ctrl(struct 
>>>>> drm_plane *plane,
>>>>>       memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
>>>>>       if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
>>>>> -        pipe_qos_cfg.creq_vblank = 
>>>>> pstate->pipe_hw->cap->sblk->creq_vblank;
>>>>> +        pipe_qos_cfg.creq_vblank = 
>>>>> pstate->pipe.sspp->cap->sblk->creq_vblank;
>>>>>           pipe_qos_cfg.danger_vblank =
>>>>> -                pstate->pipe_hw->cap->sblk->danger_vblank;
>>>>> +                pstate->pipe.sspp->cap->sblk->danger_vblank;
>>>>>           pipe_qos_cfg.vblank_en = enable;
>>>>>       }
>>>>> @@ -431,7 +431,7 @@ static void _dpu_plane_set_qos_ctrl(struct 
>>>>> drm_plane *plane,
>>>>>           pipe_qos_cfg.danger_vblank,
>>>>>           pdpu->is_rt_pipe);
>>>>> -    pstate->pipe_hw->ops.setup_qos_ctrl(pstate->pipe_hw,
>>>>> +    pstate->pipe.sspp->ops.setup_qos_ctrl(pstate->pipe.sspp,
>>>>>               &pipe_qos_cfg);
>>>>>   }
>>>>> @@ -450,14 +450,14 @@ static void _dpu_plane_set_ot_limit(struct 
>>>>> drm_plane *plane,
>>>>>       struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>>>>>       memset(&ot_params, 0, sizeof(ot_params));
>>>>> -    ot_params.xin_id = pstate->pipe_hw->cap->xin_id;
>>>>> -    ot_params.num = pstate->pipe_hw->idx - SSPP_NONE;
>>>>> +    ot_params.xin_id = pstate->pipe.sspp->cap->xin_id;
>>>>> +    ot_params.num = pstate->pipe.sspp->idx - SSPP_NONE;
>>>>>       ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
>>>>>       ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
>>>>>       ot_params.is_wfd = !pdpu->is_rt_pipe;
>>>>>       ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
>>>>>       ot_params.vbif_idx = VBIF_RT;
>>>>> -    ot_params.clk_ctrl = pstate->pipe_hw->cap->clk_ctrl;
>>>>> +    ot_params.clk_ctrl = pstate->pipe.sspp->cap->clk_ctrl;
>>>>>       ot_params.rd = true;
>>>>>       dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
>>>>> @@ -476,9 +476,9 @@ static void _dpu_plane_set_qos_remap(struct 
>>>>> drm_plane *plane)
>>>>>       memset(&qos_params, 0, sizeof(qos_params));
>>>>>       qos_params.vbif_idx = VBIF_RT;
>>>>> -    qos_params.clk_ctrl = pstate->pipe_hw->cap->clk_ctrl;
>>>>> -    qos_params.xin_id = pstate->pipe_hw->cap->xin_id;
>>>>> -    qos_params.num = pstate->pipe_hw->idx - SSPP_VIG0;
>>>>> +    qos_params.clk_ctrl = pstate->pipe.sspp->cap->clk_ctrl;
>>>>> +    qos_params.xin_id = pstate->pipe.sspp->cap->xin_id;
>>>>> +    qos_params.num = pstate->pipe.sspp->idx - SSPP_VIG0;
>>>>>       qos_params.is_rt = pdpu->is_rt_pipe;
>>>>>       DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, 
>>>>> clk_ctrl:%d\n",
>>>>> @@ -505,12 +505,12 @@ static void _dpu_plane_set_scanout(struct 
>>>>> drm_plane *plane,
>>>>>           DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
>>>>>       else if (ret)
>>>>>           DPU_ERROR_PLANE(pdpu, "failed to get format layout, 
>>>>> %d\n", ret);
>>>>> -    else if (pstate->pipe_hw->ops.setup_sourceaddress) {
>>>>> -        trace_dpu_plane_set_scanout(pstate->pipe_hw->idx,
>>>>> +    else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
>>>>> +        trace_dpu_plane_set_scanout(pstate->pipe.sspp->idx,
>>>>>                           &pipe_cfg->layout,
>>>>> -                        pstate->multirect_index);
>>>>> -        pstate->pipe_hw->ops.setup_sourceaddress(pstate->pipe_hw, 
>>>>> pipe_cfg,
>>>>> -                        pstate->multirect_index);
>>>>> +                        pstate->pipe.multirect_index);
>>>>> + pstate->pipe.sspp->ops.setup_sourceaddress(pstate->pipe.sspp, 
>>>>> pipe_cfg,
>>>>> +                        pstate->pipe.multirect_index);
>>>>>       }
>>>>>   }
>>>>> @@ -553,7 +553,7 @@ static void _dpu_plane_setup_scaler3(struct 
>>>>> dpu_plane *pdpu,
>>>>>               scale_cfg->src_height[i] /= chroma_subsmpl_v;
>>>>>           }
>>>>> -        if (pstate->pipe_hw->cap->features &
>>>>> +        if (pstate->pipe.sspp->cap->features &
>>>>>               BIT(DPU_SSPP_SCALER_QSEED4)) {
>>>>>               scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
>>>>>               scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
>>>>> @@ -624,7 +624,7 @@ static const struct dpu_csc_cfg 
>>>>> *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
>>>>>       if (!DPU_FORMAT_IS_YUV(fmt))
>>>>>           return NULL;
>>>>> -    if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe_hw->cap->features)
>>>>> +    if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe.sspp->cap->features)
>>>>>           csc_ptr = &dpu_csc10_YUV2RGB_601L;
>>>>>       else
>>>>>           csc_ptr = &dpu_csc_YUV2RGB_601L;
>>>>> @@ -659,8 +659,8 @@ static void _dpu_plane_setup_scaler(struct 
>>>>> dpu_plane *pdpu,
>>>>>               &scaler3_cfg, &pixel_ext, fmt,
>>>>>               info->hsub, info->vsub);
>>>>> -    if (pstate->pipe_hw->ops.setup_pe)
>>>>> -        pstate->pipe_hw->ops.setup_pe(pstate->pipe_hw,
>>>>> +    if (pstate->pipe.sspp->ops.setup_pe)
>>>>> +        pstate->pipe.sspp->ops.setup_pe(pstate->pipe.sspp,
>>>>>                   &pixel_ext);
>>>>>       /**
>>>>> @@ -668,9 +668,9 @@ static void _dpu_plane_setup_scaler(struct 
>>>>> dpu_plane *pdpu,
>>>>>        * bypassed. Still we need to update alpha and bitwidth
>>>>>        * ONLY for RECT0
>>>>>        */
>>>>> -    if (pstate->pipe_hw->ops.setup_scaler &&
>>>>> -            pstate->multirect_index != DPU_SSPP_RECT_1)
>>>>> -        pstate->pipe_hw->ops.setup_scaler(pstate->pipe_hw,
>>>>> +    if (pstate->pipe.sspp->ops.setup_scaler &&
>>>>> +            pstate->pipe.multirect_index != DPU_SSPP_RECT_1)
>>>>> +        pstate->pipe.sspp->ops.setup_scaler(pstate->pipe.sspp,
>>>>>                   pipe_cfg,
>>>>>                   &scaler3_cfg);
>>>>>   }
>>>>> @@ -699,10 +699,10 @@ static int _dpu_plane_color_fill(struct 
>>>>> dpu_plane *pdpu,
>>>>>       fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>>>>>       /* update sspp */
>>>>> -    if (fmt && pstate->pipe_hw->ops.setup_solidfill) {
>>>>> -        pstate->pipe_hw->ops.setup_solidfill(pstate->pipe_hw,
>>>>> +    if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
>>>>> +        pstate->pipe.sspp->ops.setup_solidfill(pstate->pipe.sspp,
>>>>>                   (color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
>>>>> -                pstate->multirect_index);
>>>>> +                pstate->pipe.multirect_index);
>>>>>           /* override scaler/decimation if solid fill */
>>>>>           pipe_cfg.dst_rect = pstate->base.dst;
>>>>> @@ -714,15 +714,15 @@ static int _dpu_plane_color_fill(struct 
>>>>> dpu_plane *pdpu,
>>>>>           pipe_cfg.src_rect.y2 =
>>>>>               drm_rect_height(&pipe_cfg.dst_rect);
>>>>> -        if (pstate->pipe_hw->ops.setup_format)
>>>>> -            pstate->pipe_hw->ops.setup_format(pstate->pipe_hw,
>>>>> +        if (pstate->pipe.sspp->ops.setup_format)
>>>>> +            pstate->pipe.sspp->ops.setup_format(pstate->pipe.sspp,
>>>>>                       fmt, DPU_SSPP_SOLID_FILL,
>>>>> -                    pstate->multirect_index);
>>>>> +                    pstate->pipe.multirect_index);
>>>>> -        if (pstate->pipe_hw->ops.setup_rects)
>>>>> -            pstate->pipe_hw->ops.setup_rects(pstate->pipe_hw,
>>>>> +        if (pstate->pipe.sspp->ops.setup_rects)
>>>>> +            pstate->pipe.sspp->ops.setup_rects(pstate->pipe.sspp,
>>>>>                       &pipe_cfg,
>>>>> -                    pstate->multirect_index);
>>>>> +                    pstate->pipe.multirect_index);
>>>>>           _dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
>>>>>       }
>>>>> @@ -734,8 +734,8 @@ void dpu_plane_clear_multirect(const struct 
>>>>> drm_plane_state *drm_state)
>>>>>   {
>>>>>       struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
>>>>> -    pstate->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> -    pstate->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> +    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> +    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>>   }
>>>>>   int dpu_plane_validate_multirect_v2(struct 
>>>>> dpu_multirect_plane_states *plane)
>>>>> @@ -817,8 +817,8 @@ int dpu_plane_validate_multirect_v2(struct 
>>>>> dpu_multirect_plane_states *plane)
>>>>>       /* Prefer PARALLEL FETCH Mode over TIME_MX Mode */
>>>>>       if (parallel_fetch_qualified) {
>>>>> -        pstate[R0]->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>>>>> -        pstate[R1]->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>>>>> +        pstate[R0]->pipe.multirect_mode = 
>>>>> DPU_SSPP_MULTIRECT_PARALLEL;
>>>>> +        pstate[R1]->pipe.multirect_mode = 
>>>>> DPU_SSPP_MULTIRECT_PARALLEL;
>>>>>           goto done;
>>>>>       }
>>>>> @@ -828,8 +828,8 @@ int dpu_plane_validate_multirect_v2(struct 
>>>>> dpu_multirect_plane_states *plane)
>>>>>       if (dst[R1].y1 >= dst[R0].y2 + buffer_lines ||
>>>>>           dst[R0].y1 >= dst[R1].y2 + buffer_lines) {
>>>>> -        pstate[R0]->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
>>>>> -        pstate[R1]->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
>>>>> +        pstate[R0]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
>>>>> +        pstate[R1]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
>>>>>       } else {
>>>>>           DPU_ERROR(
>>>>>               "No multirect mode possible for the planes (%d - %d)\n",
>>>>> @@ -839,13 +839,13 @@ int dpu_plane_validate_multirect_v2(struct 
>>>>> dpu_multirect_plane_states *plane)
>>>>>       }
>>>>>   done:
>>>>> -    pstate[R0]->multirect_index = DPU_SSPP_RECT_0;
>>>>> -    pstate[R1]->multirect_index = DPU_SSPP_RECT_1;
>>>>> +    pstate[R0]->pipe.multirect_index = DPU_SSPP_RECT_0;
>>>>> +    pstate[R1]->pipe.multirect_index = DPU_SSPP_RECT_1;
>>>>>       DPU_DEBUG_PLANE(dpu_plane[R0], "R0: %d - %d\n",
>>>>> -        pstate[R0]->multirect_mode, pstate[R0]->multirect_index);
>>>>> +        pstate[R0]->pipe.multirect_mode, 
>>>>> pstate[R0]->pipe.multirect_index);
>>>>>       DPU_DEBUG_PLANE(dpu_plane[R1], "R1: %d - %d\n",
>>>>> -        pstate[R1]->multirect_mode, pstate[R1]->multirect_index);
>>>>> +        pstate[R1]->pipe.multirect_mode, 
>>>>> pstate[R1]->pipe.multirect_index);
>>>>>       return 0;
>>>>>   }
>>>>> @@ -937,6 +937,7 @@ static int dpu_plane_atomic_check(struct 
>>>>> drm_plane *plane,
>>>>>       int ret = 0, min_scale;
>>>>>       struct dpu_plane *pdpu = to_dpu_plane(plane);
>>>>>       struct dpu_plane_state *pstate = 
>>>>> to_dpu_plane_state(new_plane_state);
>>>>> +    struct dpu_sw_pipe *pipe = &pstate->pipe;
>>>>>       const struct drm_crtc_state *crtc_state = NULL;
>>>>>       const struct dpu_format *fmt;
>>>>>       struct drm_rect src, dst, fb_rect = { 0 };
>>>>> @@ -946,10 +947,10 @@ static int dpu_plane_atomic_check(struct 
>>>>> drm_plane *plane,
>>>>>           crtc_state = drm_atomic_get_new_crtc_state(state,
>>>>>                                  new_plane_state->crtc);
>>>>> -    min_scale = FRAC_16_16(1, 
>>>>> pstate->pipe_hw->cap->sblk->maxupscale);
>>>>> +    min_scale = FRAC_16_16(1, pipe->sspp->cap->sblk->maxupscale);
>>>>>       ret = drm_atomic_helper_check_plane_state(new_plane_state, 
>>>>> crtc_state,
>>>>>                             min_scale,
>>>>> -                          pstate->pipe_hw->cap->sblk->maxdwnscale 
>>>>> << 16,
>>>>> +                          pipe->sspp->cap->sblk->maxdwnscale << 16,
>>>>>                             true, true);
>>>>>       if (ret) {
>>>>>           DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", 
>>>>> ret);
>>>>> @@ -975,8 +976,8 @@ static int dpu_plane_atomic_check(struct 
>>>>> drm_plane *plane,
>>>>>       min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>>>>>       if (DPU_FORMAT_IS_YUV(fmt) &&
>>>>> -        (!(pstate->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
>>>>> -         !(pstate->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
>>>>> +        (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
>>>>> +         !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
>>>>>           DPU_DEBUG_PLANE(pdpu,
>>>>>                   "plane doesn't have scaler/csc for yuv\n");
>>>>>           return -EINVAL;
>>>>> @@ -1037,12 +1038,12 @@ void dpu_plane_flush(struct drm_plane *plane)
>>>>>       else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>>>>>           /* force 100% alpha */
>>>>>           _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>>>>> -    else if (pstate->pipe_hw && pstate->pipe_hw->ops.setup_csc) {
>>>>> +    else if (pstate->pipe.sspp && pstate->pipe.sspp->ops.setup_csc) {
>>>>>           const struct dpu_format *fmt = 
>>>>> to_dpu_format(msm_framebuffer_format(plane->state->fb));
>>>>>           const struct dpu_csc_cfg *csc_ptr = 
>>>>> _dpu_plane_get_csc(pdpu, fmt);
>>>>>           if (csc_ptr)
>>>>> -            pstate->pipe_hw->ops.setup_csc(pstate->pipe_hw, csc_ptr);
>>>>> +            pstate->pipe.sspp->ops.setup_csc(pstate->pipe.sspp, 
>>>>> csc_ptr);
>>>>>       }
>>>>>       /* flag h/w flush complete */
>>>>> @@ -1072,6 +1073,7 @@ static void 
>>>>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>>>>       struct dpu_plane *pdpu = to_dpu_plane(plane);
>>>>>       struct drm_plane_state *state = plane->state;
>>>>>       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>>>>> +    struct dpu_sw_pipe *pipe = &pstate->pipe;
>>>>>       struct drm_crtc *crtc = state->crtc;
>>>>>       struct drm_framebuffer *fb = state->fb;
>>>>>       bool is_rt_pipe, update_qos_remap;
>>>>> @@ -1109,21 +1111,21 @@ static void 
>>>>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>>>>           return;
>>>>>       }
>>>>> -    if (pstate->pipe_hw->ops.setup_rects) {
>>>>> -        pstate->pipe_hw->ops.setup_rects(pstate->pipe_hw,
>>>>> +    if (pipe->sspp->ops.setup_rects) {
>>>>> +        pipe->sspp->ops.setup_rects(pipe->sspp,
>>>>>                   &pipe_cfg,
>>>>> -                pstate->multirect_index);
>>>>> +                pipe->multirect_index);
>>>>>       }
>>>>>       _dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
>>>>> -    if (pstate->pipe_hw->ops.setup_multirect)
>>>>> -        pstate->pipe_hw->ops.setup_multirect(
>>>>> -                pstate->pipe_hw,
>>>>> -                pstate->multirect_index,
>>>>> -                pstate->multirect_mode);
>>>>> +    if (pipe->sspp->ops.setup_multirect)
>>>>> +        pipe->sspp->ops.setup_multirect(
>>>>> +                pipe->sspp,
>>>>> +                pipe->multirect_index,
>>>>> +                pipe->multirect_mode);
>>>>> -    if (pstate->pipe_hw->ops.setup_format) {
>>>>> +    if (pipe->sspp->ops.setup_format) {
>>>>>           unsigned int rotation;
>>>>>           src_flags = 0x0;
>>>>> @@ -1140,10 +1142,10 @@ static void 
>>>>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>>>>               src_flags |= DPU_SSPP_FLIP_UD;
>>>>>           /* update format */
>>>>> -        pstate->pipe_hw->ops.setup_format(pstate->pipe_hw, fmt, 
>>>>> src_flags,
>>>>> -                pstate->multirect_index);
>>>>> +        pipe->sspp->ops.setup_format(pipe->sspp, fmt, src_flags,
>>>>> +                pipe->multirect_index);
>>>>> -        if (pstate->pipe_hw->ops.setup_cdp) {
>>>>> +        if (pipe->sspp->ops.setup_cdp) {
>>>>>               struct dpu_hw_pipe_cdp_cfg cdp_cfg;
>>>>>               memset(&cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
>>>>> @@ -1157,7 +1159,7 @@ static void 
>>>>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>>>>                       DPU_FORMAT_IS_TILE(fmt);
>>>>>               cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
>>>>> -            pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, 
>>>>> &cdp_cfg, pstate->multirect_index);
>>>>> +            pipe->sspp->ops.setup_cdp(pipe->sspp, &cdp_cfg, 
>>>>> pipe->multirect_index);
>>>>>           }
>>>>>       }
>>>>> @@ -1191,7 +1193,7 @@ static void _dpu_plane_atomic_disable(struct 
>>>>> drm_plane *plane)
>>>>>       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>>>>>       trace_dpu_plane_disable(DRMID(plane), false,
>>>>> -                pstate->multirect_mode);
>>>>> +                pstate->pipe.multirect_mode);
>>>>>       pstate->pending = true;
>>>>>   }
>>>>> @@ -1305,9 +1307,9 @@ static void 
>>>>> dpu_plane_atomic_print_state(struct drm_printer *p,
>>>>>       const struct dpu_plane_state *pstate = 
>>>>> to_dpu_plane_state(state);
>>>>>       drm_printf(p, "\tstage=%d\n", pstate->stage);
>>>>> -    drm_printf(p, "\tsspp=%s\n", pstate->pipe_hw->cap->name);
>>>>> -    drm_printf(p, "\tmultirect_mode=%s\n", 
>>>>> dpu_get_multirect_mode(pstate->multirect_mode));
>>>>> -    drm_printf(p, "\tmultirect_index=%s\n", 
>>>>> dpu_get_multirect_index(pstate->multirect_index));
>>>>> +    drm_printf(p, "\tsspp=%s\n", pstate->pipe.sspp->cap->name);
>>>>> +    drm_printf(p, "\tmultirect_mode=%s\n", 
>>>>> dpu_get_multirect_mode(pstate->pipe.multirect_mode));
>>>>> +    drm_printf(p, "\tmultirect_index=%s\n", 
>>>>> dpu_get_multirect_index(pstate->pipe.multirect_index));
>>>>>   }
>>>>>   static void dpu_plane_reset(struct drm_plane *plane)
>>>>> @@ -1336,7 +1338,7 @@ static void dpu_plane_reset(struct drm_plane 
>>>>> *plane)
>>>>>           return;
>>>>>       }
>>>>> -    pstate->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pdpu->pipe 
>>>>> - SSPP_NONE]);
>>>>> +    pstate->pipe.sspp = 
>>>>> to_dpu_hw_pipe(kms->rm.sspp_blks[pdpu->pipe - SSPP_NONE]);
>>>>>       __drm_atomic_helper_plane_reset(plane, &pstate->base);
>>>>>   }
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>>> index d745cde4ea77..b6fd6f856d6a 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>>>> @@ -31,11 +31,9 @@ struct dpu_plane_state {
>>>>>       struct msm_gem_address_space *aspace;
>>>>>       enum dpu_stage stage;
>>>>>       bool needs_qos_remap;
>>>>> -    uint32_t multirect_index;
>>>>> -    uint32_t multirect_mode;
>>>>>       bool pending;
>>>>> -    struct dpu_hw_pipe *pipe_hw;
>>>>> +    struct dpu_sw_pipe pipe;
>>>>
>>>> Are you sure we dont need this to be a pointer?
>>>>
>>>> Since this is now part of plane_state, its possible that across 
>>>> commits, the hw pipe can change for this plane's state. So might be 
>>>> better if this is pointer in that case ....
>>>
>>> A pointer means that it is allocated and deallocated by somebody. 
>>> Probably you meant that it is a pointer into the dpu_hw_pipe member 
>>> (with dpu_hw_pipe having sw_pipe's for rect0 and rect1).
>>>
>>> I thought about this. And ended up with the dpu_sw_pipe having a 
>>> dpu_hw_pipe pointer inside, but itself being a member of plane state. 
>>> This way the plane state contains such data as multirect mode and 
>>> rectangle.
>>
>> Right, so what I meant was, previously pipe_hw was a pointer but it 
>> was not changed dynamically because it was assigned once in 
>> dpu_plane_init() but after that was not updated to point to a 
>> different pipe_hw.
>>
>> Now, pipe_hw is part of the plane state which means the actual 
>> hardware which the plane state is using can change across commits with 
>> virtual plane support.
>>
>> So it made more sense to me that this was "struct dpu_sw_pipe *pipe" 
>> because looking at it from a top level it tells me that the 
>> dpu_sw_pipe can point to a different pipe. Just little more intuitive.
>>
>> With it being just a member, sure it still means the same thing 
>> because internal to it, pipe_hw is still a pointer.
>>
>> Just felt it was more logical to have the whole dpu_sw_pipe as a pointer.
> 
> If it would have been possible to allocate REC0 and REC1 to different 
> LMs, then the dpu_sw_pipe would be definitely a pointer into the 
> rm-managed resource. However as REC0 and REC1 are not going to be 
> handled by the RM, making dpu_sw_pipe a pointer would just complicate 
> the design. It will be a pointer to the dpu_hw_pipe's sub-struct. With 
> this struct having a back-pointer to the dpu_hw_pipe. And some state 
> which we should always clear when reassigning the pipes, etc. So it 
> landed naturally as a part of pstate.
> 

Alright, understood. Lets see if this has to evolve further, but at the 
moment this is fine with me.

>>
>> But its just a thought not a strong inclination against current patch.
> 
> R-b?
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>>
>>>
>>>
>>>>
>>>>>       u64 plane_fetch_bw;
>>>>>       u64 plane_clk;
>>>
>>>
> 
> 
