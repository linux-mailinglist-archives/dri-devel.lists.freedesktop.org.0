Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E2526E5A
	for <lists+dri-devel@lfdr.de>; Sat, 14 May 2022 08:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F0210E0EC;
	Sat, 14 May 2022 06:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B040010E155
 for <dri-devel@lists.freedesktop.org>; Sat, 14 May 2022 06:53:48 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id m23so12631668ljc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 23:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ciHaTW4QmcB9Nf4b17y74gIK8Tw0vceON1u43PlkIBA=;
 b=TALugFfhC9/EZ+7pIQhJ/xTqmtQg7w9GxsNGAvYc+3dBg0jjvgzAqfDUgFWqhm4X2H
 x5YXR+hxL5mFsy94fv3OCkPyw2IfdDFz8YfToRqG0tWMjE1996N5Rjh6vzRPei4FEMb9
 8VUMLES/0M8Kkwy5+9zkJO52KevC4b36AV1mTNGuorFhorkUo4SYY/lDjLflOwmbU9lF
 be6ffJHvfJw1q8tXOA4mmfkf/1i9eAZcyp6Jh+jzzOsaepdkPjkwOp/Dgp5mDVEKUrmv
 c+XwFTTCteurGz2ZIRV5Tz6pc9VVQwhLOlUnMd+gBflYuRK6IyWsWZ8k3gIktfUSCYpH
 AofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ciHaTW4QmcB9Nf4b17y74gIK8Tw0vceON1u43PlkIBA=;
 b=I1+ph3FMm/qs8/Kf7mVxZ6ZlS15v3xk8FZyGZXDMwDHSJzPftuDBSzCC7NCwGLzxfs
 PPXBFI6yRTffpmhIAxd+pblC9kSyt/H7x4zDDh+RcsgaGgsYcZ/joRPnuFZow3Rkl4oU
 rvdZjzWiGYC5otyYk6BrEmxubZdUhdCRua6UwaTQTqQwwQuEaKvKVwQftS4vqLOE+4WR
 dzntCvXaJwQZbrOvHiCQKfEkZUBzZpZKtoH7FkJtfqo9qf550n2UtEi8fW0UX5MFvo4a
 GCJrQEdgxqdYTFpZsemFsPRQ8ahMZXYi0XfmcXIC2fLLzvrrOmUG+pKe19UdwJ7Al2nG
 /jzA==
X-Gm-Message-State: AOAM532cXdnHG1rZrWEoXfpdKK3/jZUhUlusBwTx5aod1hM5n/HhZDVL
 ja+DmUMonISOuqsMsNESKUgaVg==
X-Google-Smtp-Source: ABdhPJw+1hP9Ewqebt0y+gLgHhPDfHFmKsnDjPo6bVEe7TYQY7oIOv9+rFIels25jzDId4MOQTofDA==
X-Received: by 2002:a2e:91d8:0:b0:24f:1656:eaa0 with SMTP id
 u24-20020a2e91d8000000b0024f1656eaa0mr5226645ljg.444.1652511226999; 
 Fri, 13 May 2022 23:53:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b3-20020ac25e83000000b0047255d210e8sm620591lfq.23.2022.05.13.23.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 23:53:46 -0700 (PDT)
Message-ID: <d0819b51-1f8c-2cbf-fd46-c63f64d8292f@linaro.org>
Date: Sat, 14 May 2022 09:53:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 15/25] drm/msm/dpu: remove dpu_hw_fmt_layout from struct
 dpu_hw_pipe_cfg
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-16-dmitry.baryshkov@linaro.org>
 <9dbc62ba-2170-8f60-fb47-d8aff77c35d3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9dbc62ba-2170-8f60-fb47-d8aff77c35d3@quicinc.com>
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

On 13/05/2022 21:58, Abhinav Kumar wrote:
> 
> 
> On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
>> Remove dpu_hw_fmt_layout instance from struct dpu_hw_fmt_layout, leaving
>> only src_rect and dst_rect.
> 
> I believe you meant "remove dpu_hw_fmt_layout instance from struct 
> dpu_hw_pipe_cfg" ?.
> 
> Otherwise nothing wrong with the change as such, but other than making 
> struct dpu_hw_pipe_cfg lighter, is there any other motivation behind 
> this change?
> 
> Dont you think that dpu_hw_fmt_layout remaining to be a part of the 
> struct dpu_hw_pipe_cfg is better and they are indeed tied closely.

The main motivation was to allow using dpu_hw_pipe_cfg for either of 
plane SSPPs while keeping the layout intact. See the patches 20 and 25.
Without this change the layout will be duplicated between both configs.

> 
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 30 ++++++++++-----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  7 ++---
>>   3 files changed, 21 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> index 2186506e6315..df6698778b6d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> @@ -486,7 +486,7 @@ static void dpu_hw_sspp_setup_rects(struct 
>> dpu_sw_pipe *pipe,
>>   }
>>   static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>> -        struct dpu_hw_pipe_cfg *cfg)
>> +        struct dpu_hw_fmt_layout *layout)
>>   {
>>       struct dpu_hw_pipe *ctx = pipe->sspp;
>>       u32 ystride0, ystride1;
>> @@ -497,41 +497,41 @@ static void 
>> dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>>           return;
>>       if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>> -        for (i = 0; i < ARRAY_SIZE(cfg->layout.plane_addr); i++)
>> +        for (i = 0; i < ARRAY_SIZE(layout->plane_addr); i++)
>>               DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx + i * 0x4,
>> -                    cfg->layout.plane_addr[i]);
>> +                    layout->plane_addr[i]);
>>       } else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>>           DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
>> -                cfg->layout.plane_addr[0]);
>> +                layout->plane_addr[0]);
>>           DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
>> -                cfg->layout.plane_addr[2]);
>> +                layout->plane_addr[2]);
>>       } else {
>>           DPU_REG_WRITE(&ctx->hw, SSPP_SRC1_ADDR + idx,
>> -                cfg->layout.plane_addr[0]);
>> +                layout->plane_addr[0]);
>>           DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
>> -                cfg->layout.plane_addr[2]);
>> +                layout->plane_addr[2]);
>>       }
>>       if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>> -        ystride0 = (cfg->layout.plane_pitch[0]) |
>> -            (cfg->layout.plane_pitch[1] << 16);
>> -        ystride1 = (cfg->layout.plane_pitch[2]) |
>> -            (cfg->layout.plane_pitch[3] << 16);
>> +        ystride0 = (layout->plane_pitch[0]) |
>> +            (layout->plane_pitch[1] << 16);
>> +        ystride1 = (layout->plane_pitch[2]) |
>> +            (layout->plane_pitch[3] << 16);
>>       } else {
>>           ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
>>           ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
>>           if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>>               ystride0 = (ystride0 & 0xFFFF0000) |
>> -                (cfg->layout.plane_pitch[0] & 0x0000FFFF);
>> +                (layout->plane_pitch[0] & 0x0000FFFF);
>>               ystride1 = (ystride1 & 0xFFFF0000)|
>> -                (cfg->layout.plane_pitch[2] & 0x0000FFFF);
>> +                (layout->plane_pitch[2] & 0x0000FFFF);
>>           } else {
>>               ystride0 = (ystride0 & 0x0000FFFF) |
>> -                ((cfg->layout.plane_pitch[0] << 16) &
>> +                ((layout->plane_pitch[0] << 16) &
>>                    0xFFFF0000);
>>               ystride1 = (ystride1 & 0x0000FFFF) |
>> -                ((cfg->layout.plane_pitch[2] << 16) &
>> +                ((layout->plane_pitch[2] << 16) &
>>                    0xFFFF0000);
>>           }
>>       }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> index eee8501ea80d..93b60545ba98 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> @@ -155,13 +155,11 @@ struct dpu_hw_pixel_ext {
>>   /**
>>    * struct dpu_hw_pipe_cfg : Pipe description
>> - * @layout:    format layout information for programming buffer to 
>> hardware
>>    * @src_rect:  src ROI, caller takes into account the different 
>> operations
>>    *             such as decimation, flip etc to program this field
>>    * @dest_rect: destination ROI.
>>    */
>>   struct dpu_hw_pipe_cfg {
>> -    struct dpu_hw_fmt_layout layout;
>>       struct drm_rect src_rect;
>>       struct drm_rect dst_rect;
>>   };
>> @@ -260,10 +258,10 @@ struct dpu_hw_sspp_ops {
>>       /**
>>        * setup_sourceaddress - setup pipe source addresses
>>        * @pipe: Pointer to software pipe context
>> -     * @cfg: Pointer to pipe config structure
>> +     * @layout: format layout information for programming buffer to 
>> hardware
>>        */
>>       void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
>> -            struct dpu_hw_pipe_cfg *cfg);
>> +            struct dpu_hw_fmt_layout *layout);
>>       /**
>>        * setup_csc - setup color space coversion
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index e9421fa2fb2e..a521c0681af6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -1052,6 +1052,7 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>>       const struct dpu_format *fmt =
>>           to_dpu_format(msm_framebuffer_format(fb));
>>       struct dpu_hw_pipe_cfg pipe_cfg;
>> +    struct dpu_hw_fmt_layout layout;
>>       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>>       struct msm_gem_address_space *aspace = kms->base.aspace;
>>       bool update_src_addr = true;
>> @@ -1059,7 +1060,7 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>>       memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>> -    ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg.layout);
>> +    ret = dpu_format_populate_layout(aspace, fb, &layout);
>>       if (ret == -EAGAIN) {
>>           DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
>>           update_src_addr = false;
>> @@ -1070,8 +1071,8 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>>       if (update_src_addr &&
>>           pipe->sspp->ops.setup_sourceaddress) {
>> -        trace_dpu_plane_set_scanout(pipe, &pipe_cfg.layout);
>> -        pipe->sspp->ops.setup_sourceaddress(pipe, &pipe_cfg);
>> +        trace_dpu_plane_set_scanout(pipe, &layout);
>> +        pipe->sspp->ops.setup_sourceaddress(pipe, &layout);
>>       }
>>       pstate->pending = true;


-- 
With best wishes
Dmitry
