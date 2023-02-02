Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABFD688810
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 21:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514D510E619;
	Thu,  2 Feb 2023 20:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D67E10E619
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 20:10:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id p26so9220892ejx.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 12:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G3jd1sb+9O9q6eNZBCUJgDHH+IoxIlmN3aa5m00o5S8=;
 b=v5M2Z7qzVp6fkJqt5ZIWLEP7NqOcSJI5/Dkn57qPwwVbTCR3uk1mjNw+9EL8boV61Z
 hY9su62bPAX1SQ5D6jW/S3OMZEyY3HOyuwNwn/c4+gqVwFkAP873uvc5RJVvNgERpJ0U
 gCerHOO8LIac7KVLQ6wi/BTET7qs76iERQzVn5W4aiCaPWgWOlkehYRaqwoakMAksMZA
 IDui6NNoJlrE4e4k2K+hF93zAZiKtFlKKXX9oJTAD+7zpmTW99X40vQ9r+0Xuo8O7kR3
 sRxakaACkTjV1/8jBaYQ+VOdR7+Ya6bnaomY9j4rhdTXmRgb6pqH8GKQqEkeatSaFRsM
 uo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G3jd1sb+9O9q6eNZBCUJgDHH+IoxIlmN3aa5m00o5S8=;
 b=hno88tNNX/5iSHfid478RjH+xMxLdljVeyWoNb8kPSPCN4ZtZuxg/a5P8c4iXUKlZR
 +q6NunwRILpLcEgTgtCQhNID2Cnp4nuLz/eHyrQVUhyMTNkxVJrmV2c2fW87e8TqKg50
 YOy2StzrP26qxyw1x55XhHE04QuyNgvkGs05KSzRxAgyWn/CcqXz7BHiqCBeTA95YPMJ
 Nf0By97wTpQWzPrLXjOV0nya/gdegO5GwABhb6l5eOPIYNhRbhdoqaj0qtktX6vuFDdh
 ui1aUveYNui/+YRVCllz6vQB8pVqlo28NiawXjrEdjw5SWJbpp5Coq1GQFIt3zCT/+ZE
 +1ug==
X-Gm-Message-State: AO0yUKXHfGeLXtfLdVw08ZTve6Hd/+XQezus6HL4dGVX2nte3gaOw3sZ
 7EUriLODzIlDOcvBm3f0bxopgfp3yaKXWHiK
X-Google-Smtp-Source: AK7set8sEd2FuK0adsFb+9f/ny1rurRxWxmvrgI0Gl2AJHyc/0uDyGRqmakCvLWTmm87lhdwSmhbWw==
X-Received: by 2002:a17:907:9916:b0:88b:ce27:f51e with SMTP id
 ka22-20020a170907991600b0088bce27f51emr8005920ejc.29.1675368640776; 
 Thu, 02 Feb 2023 12:10:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 la3-20020a170906ad8300b0084d381d0528sm234298ejb.180.2023.02.02.12.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 12:10:40 -0800 (PST)
Message-ID: <c6eb252e-fdff-8e17-4acb-cdb3ba850887@linaro.org>
Date: Thu, 2 Feb 2023 22:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 12/27] drm/msm/dpu: remove dpu_hw_fmt_layout from
 struct dpu_hw_pipe_cfg
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-13-dmitry.baryshkov@linaro.org>
 <77764494-8a74-8450-ac75-33d6de0b2f8d@quicinc.com>
 <CAA8EJpq4ybOQg-Mb5RM+dcrBbR+3WrWSgvd4d20C6NKa90C15Q@mail.gmail.com>
 <62ace381-2c59-9096-2b4f-412b329ad78e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <62ace381-2c59-9096-2b4f-412b329ad78e@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/02/2023 21:54, Abhinav Kumar wrote:
> 
> 
> On 2/2/2023 11:45 AM, Dmitry Baryshkov wrote:
>> On Thu, 2 Feb 2023 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> 
>> wrote:
>>>
>>>
>>>
>>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>>> Remove dpu_hw_fmt_layout instance from struct dpu_hw_pipe_cfg, leaving
>>>> only src_rect and dst_rect. This way right and left pipes will have
>>>> separate dpu_hw_pipe_cfg isntances, while the layout is common to both
>>>> of them.
>>>>
>>>
>>> Sorry for not responding to this comment earlier.
>>>
>>> https://patchwork.freedesktop.org/patch/473168/?series=99909&rev=1#comment_875370
>>>
>>>   From the perspective of wide planes you are right that the layout is
>>> common but not true from smart DMA point of view.
>>>
>>> For wide planes, yes, its usually the same buffer with just the src_x
>>> being different but conceptually and even HW wise each rectangle of the
>>> smart DMA is capable of fetching from a different buffer.
>>>
>>>   From the pov, this decision of not having the dpu_hw_fmt_layout as 
>>> part
>>> of dpu_hw_pipe_cfg seems incorrect to me.
>>
>> Yes, each rectangle/pipe can fetch from a different buffer. However in
>> our use case the layout is not defined for each pipe. It is defined
>> for a plane, no matter how many pipes are used for the plane, since
>> the buffer is also defined per plane.
>>
> Even if the layout is defined per plane.
> 
> So lets say
> 
> plane A with layout A maps to rect 1 of DMA0
> plane B with layout B maps to rect 2 of DMA0
> 
> How can layout be assumed to be duplicated in this case?
> 
> This is not a wide plane use-case but just smartDMA case of two 
> different layers.
> 
> Maybe I am missing something but this is the example i am interested about.

PlaneA has layoutA. So dpu_plane_sspp_update_pipe() will program layoutA 
using (DMA0, rect1)->setup_sourceaddress(layoutA).

PlaneB has layoutB, so (DMA0, rect2)->setup_sourceaddress(layoutB).

Maybe the commit message is misleading. The layout is not common to 
rect1 and rect2. It is common to all pipes/rectangles driving a single 
plane.

> 
>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 30 
>>>> ++++++++++-----------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ++---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 10 +++----
>>>>    3 files changed, 22 insertions(+), 24 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>> index 2bd39c13d54d..400d043f37fa 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>> @@ -486,7 +486,7 @@ static void dpu_hw_sspp_setup_rects(struct 
>>>> dpu_sw_pipe *pipe,
>>>>    }
>>>>
>>>>    static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe 
>>>> *pipe,
>>>> -             struct dpu_hw_pipe_cfg *cfg)
>>>> +             struct dpu_hw_fmt_layout *layout)
>>>>    {
>>>>        struct dpu_hw_sspp *ctx = pipe->sspp;
>>>>        u32 ystride0, ystride1;
>>>> @@ -497,41 +497,41 @@ static void 
>>>> dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>>>>                return;
>>>>
>>>>        if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>>>> -             for (i = 0; i < ARRAY_SIZE(cfg->layout.plane_addr); i++)
>>>> +             for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
>>>>                        DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx 
>>>> + i * 0x4,
>>>> -                                     cfg->layout.plane_addr[i]);
>>>> +                                     layout->plane_addr[i]);
>>>>        } else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>>>>                DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
>>>> -                             cfg->layout.plane_addr[0]);
>>>> +                             layout->plane_addr[0]);
>>>>                DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
>>>> -                             cfg->layout.plane_addr[2]);
>>>> +                             layout->plane_addr[2]);
>>>>        } else {
>>>>                DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR + idx,
>>>> -                             cfg->layout.plane_addr[0]);
>>>> +                             layout->plane_addr[0]);
>>>>                DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
>>>> -                             cfg->layout.plane_addr[2]);
>>>> +                             layout->plane_addr[2]);
>>>>        }
>>>>
>>>>        if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>>>> -             ystride0 = (cfg->layout.plane_pitch[0]) |
>>>> -                     (cfg->layout.plane_pitch[1] << 16);
>>>> -             ystride1 = (cfg->layout.plane_pitch[2]) |
>>>> -                     (cfg->layout.plane_pitch[3] << 16);
>>>> +             ystride0 = (layout->plane_pitch[0]) |
>>>> +                     (layout->plane_pitch[1] << 16);
>>>> +             ystride1 = (layout->plane_pitch[2]) |
>>>> +                     (layout->plane_pitch[3] << 16);
>>>>        } else {
>>>>                ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + 
>>>> idx);
>>>>                ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + 
>>>> idx);
>>>>
>>>>                if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>>>>                        ystride0 = (ystride0 & 0xFFFF0000) |
>>>> -                             (cfg->layout.plane_pitch[0] & 
>>>> 0x0000FFFF);
>>>> +                             (layout->plane_pitch[0] & 0x0000FFFF);
>>>>                        ystride1 = (ystride1 & 0xFFFF0000)|
>>>> -                             (cfg->layout.plane_pitch[2] & 
>>>> 0x0000FFFF);
>>>> +                             (layout->plane_pitch[2] & 0x0000FFFF);
>>>>                } else {
>>>>                        ystride0 = (ystride0 & 0x0000FFFF) |
>>>> -                             ((cfg->layout.plane_pitch[0] << 16) &
>>>> +                             ((layout->plane_pitch[0] << 16) &
>>>>                                 0xFFFF0000);
>>>>                        ystride1 = (ystride1 & 0x0000FFFF) |
>>>> -                             ((cfg->layout.plane_pitch[2] << 16) &
>>>> +                             ((layout->plane_pitch[2] << 16) &
>>>>                                 0xFFFF0000);
>>>>                }
>>>>        }
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>>> index c713343378aa..8dad52eb2a90 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>>> @@ -154,13 +154,11 @@ struct dpu_hw_pixel_ext {
>>>>
>>>>    /**
>>>>     * struct dpu_hw_pipe_cfg : Pipe description
>>>> - * @layout:    format layout information for programming buffer to 
>>>> hardware
>>>>     * @src_rect:  src ROI, caller takes into account the different 
>>>> operations
>>>>     *             such as decimation, flip etc to program this field
>>>>     * @dest_rect: destination ROI.
>>>>     */
>>>>    struct dpu_hw_pipe_cfg {
>>>> -     struct dpu_hw_fmt_layout layout;
>>>>        struct drm_rect src_rect;
>>>>        struct drm_rect dst_rect;
>>>>    };
>>>> @@ -243,10 +241,10 @@ struct dpu_hw_sspp_ops {
>>>>        /**
>>>>         * setup_sourceaddress - setup pipe source addresses
>>>>         * @pipe: Pointer to software pipe context
>>>> -      * @cfg: Pointer to pipe config structure
>>>> +      * @layout: format layout information for programming buffer 
>>>> to hardware
>>>>         */
>>>>        void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
>>>> -                                 struct dpu_hw_pipe_cfg *cfg);
>>>> +                                 struct dpu_hw_fmt_layout *layout);
>>>>
>>>>        /**
>>>>         * setup_csc - setup color space coversion
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>> index cbff4dea8662..0d2a7170e0ab 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>> @@ -471,21 +471,21 @@ static void _dpu_plane_set_qos_remap(struct 
>>>> drm_plane *plane)
>>>>
>>>>    static void _dpu_plane_set_scanout(struct drm_plane *plane,
>>>>                struct dpu_plane_state *pstate,
>>>> -             struct dpu_hw_pipe_cfg *pipe_cfg,
>>>>                struct drm_framebuffer *fb)
>>>>    {
>>>>        struct dpu_plane *pdpu = to_dpu_plane(plane);
>>>>        struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>>>>        struct msm_gem_address_space *aspace = kms->base.aspace;
>>>> +     struct dpu_hw_fmt_layout layout;
>>>>        int ret;
>>>>
>>>> -     ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
>>>> +     ret = dpu_format_populate_layout(aspace, fb, &layout);
>>>>        if (ret)
>>>>                DPU_ERROR_PLANE(pdpu, "failed to get format layout, 
>>>> %d\n", ret);
>>>>        else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
>>>>                trace_dpu_plane_set_scanout(&pstate->pipe,
>>>> -                                         &pipe_cfg->layout);
>>>> -             
>>>> pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
>>>> +                                         &layout);
>>>> +             
>>>> pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, &layout);
>>>>        }
>>>>    }
>>>>
>>>> @@ -1134,7 +1134,7 @@ static void 
>>>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>>>
>>>>        memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>>>>
>>>> -     _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
>>>> +     _dpu_plane_set_scanout(plane, pstate, fb);
>>>>
>>>>        pstate->pending = true;
>>>>
>>
>>
>>

-- 
With best wishes
Dmitry

