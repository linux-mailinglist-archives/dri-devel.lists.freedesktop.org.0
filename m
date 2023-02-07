Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373A68E181
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 20:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B531F10E5C5;
	Tue,  7 Feb 2023 19:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2271110E5AC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 19:51:45 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id jg8so5879062ejc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 11:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FgnUAdPucUSjhBoivxKOVdBFfxlo6zFixsvNKVemUko=;
 b=P//nh7L6up9Wn41dti4wXZxvUOTNqgpOWccUPCFfzi0Upjv/mTlqMVNFOWFLbsnExp
 dq0Itm5f6m4vqnSKZo2GK928OVEP2SiTjZbwS7grOXJVrRZmaYwQCH7ese9ClpMEuZJG
 Od9qs+Mc4/+WmYimjET4gUyld/NPVP0h82k/Yk3IzbzgQAlrFeaDyMgsNcAY8dCRdJTK
 PIXvG5GAGpDk0OACM+2XJi0OuoJ2m6GsmfWLxcStt5gQXQoHfDtDNZhI8WDjiz+LyqaO
 l+AyHH9K3rMAqWV731TBEoc4dvk+nuJG5uuJFnQEhKowZg3W5CKc1ar4YpISF49QdY4h
 /96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FgnUAdPucUSjhBoivxKOVdBFfxlo6zFixsvNKVemUko=;
 b=u95ilwJ/zOgDIfM1rLwa9oR3Vt8tONYy7psfDB3c//RB0zq8AdZLWFAWta2eU2TO7E
 F5lLctfE6pzuVGJ6QaPQ2VXu7FQnvMAaJZuJNx6im7+dMC+6ORuJxWSzxYCW/Wm0isFw
 nwj0G36MKK5T5a28CxTJ/gn5FqKliNQ7hIrw80qtNbPcLGc5iBFuhvNCZCR1NTW/NUxP
 UoisUOOliqzWTVELkZaGNtI/+irp2DvaUDVXviPKq0Bc2l8ce0gA10w2uJ/QjTktnMNG
 63vx7Gq7B5F0hJGSXbaF2ZZ1WdkE5Rn+pG1uOffSb3+eLkAXO6aQEblxK8JMQLA7Lsyr
 fj2Q==
X-Gm-Message-State: AO0yUKWlRdR+9XPENPblxK0e9iGHfbM6su1hPtdFLaZ5GIpObnInv6BF
 BmdWYQnXZGNA5Rd3bZY3ZobB7g==
X-Google-Smtp-Source: AK7set+8fzrEyMNfeKMg40zSvA4wAWXyFp14+a3l7X82mDkEpX6+ZABKOwx3yLrDOoQPelH8A2FGxA==
X-Received: by 2002:a17:907:1707:b0:877:5dbc:da84 with SMTP id
 le7-20020a170907170700b008775dbcda84mr4423138ejc.72.1675799503565; 
 Tue, 07 Feb 2023 11:51:43 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 lv3-20020a170906bc8300b00883410a786csm7181530ejb.207.2023.02.07.11.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 11:51:43 -0800 (PST)
Message-ID: <29532372-8b30-d815-36d9-e366ab31e28d@linaro.org>
Date: Tue, 7 Feb 2023 21:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 23/27] drm/msm/dpu: rework dpu_plane_atomic_check()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-24-dmitry.baryshkov@linaro.org>
 <04ab8d1e-d343-2d6c-c211-2cf0ffc713c2@quicinc.com>
 <fd2e4474-3ecb-91e1-d702-0b2dbb77f458@linaro.org>
 <0381e11f-6266-c5f1-87a0-b3050354a80b@quicinc.com>
 <7c1dfaad-6596-8bac-56a5-07b6087e32b7@linaro.org>
 <5141bef8-bd78-9419-7d2a-105778e78f03@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5141bef8-bd78-9419-7d2a-105778e78f03@quicinc.com>
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

On 07/02/2023 20:08, Abhinav Kumar wrote:
> 
> 
> On 2/7/2023 9:59 AM, Dmitry Baryshkov wrote:
>> On 07/02/2023 19:57, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/7/2023 9:51 AM, Dmitry Baryshkov wrote:
>>>> On 07/02/2023 19:49, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>>>> Split pipe-dependent code from dpu_plane_atomic_check() into the
>>>>>> separate function dpu_plane_atomic_check_pipe(). This is one of
>>>>>
>>>>> Same comment as prev patch, dpu_plane_atomic_check_pipe() ---> 
>>>>> dpu_plane_atomic_check_sspp()
>>>>
>>>> No, it does what it does: it checks one software pipe configuration.
>>>
>>> The concept of software pipe is only to encapsulate the hw_sspp along 
>>> with its params
>>>
>>> +struct dpu_sw_pipe {
>>> +    struct dpu_hw_sspp *sspp;
>>> +    enum dpu_sspp_multirect_index multirect_index;
>>> +    enum dpu_sspp_multirect_mode multirect_mode;
>>> +};
>>>
>>> So its a very thin differentiation there.
>>
>> SSPP is a hardware thing, while the sw_pipe is a software instance. It 
>> can employ an SSPP or a half of SSPP. And if it employs a half of SSPP 
>> (rec1) than the name dpu_plane_atomic_check_sspp() doesn't make sense: 
>> we are not checking the SSPP itself (or its configuration). We are 
>> checking the parameters of SW pipe.
>>
> 
> Ok, I need to check in the next couple of patches how you are handling 
> the same dpu_sw_pipe for different rects of the same sspp.

rec0 and rec1 are two different instances of dpu_sw_pipe

> 
>   struct dpu_plane_state {
>       struct drm_plane_state base;
>       struct msm_gem_address_space *aspace;
> -    struct dpu_hw_sspp *hw_sspp;
> +    struct dpu_sw_pipe pipe;
>       enum dpu_stage stage;
>       bool needs_qos_remap;
> -    uint32_t multirect_index;
> 
> So far what I saw was dpu_plane_state ---> dpu_sw_pipe ---> dpu_hw_sppp
> 
> In this chain, I couldnt get how the two rects of the DMA SSPP are 
> differentiated, perhaps there is something in the next few changes.
> 
>>>
>>>>
>>>>>
>>>>>> preparational steps to add r_pipe support.
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 88 
>>>>>> ++++++++++++++---------
>>>>>>   1 file changed, 53 insertions(+), 35 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>>> index f94e132733f3..e69499490d39 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>>> @@ -903,6 +903,51 @@ static int 
>>>>>> dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>>>>>>       return 0;
>>>>>>   }
>>>>>> +static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>>>>>> +        struct dpu_sw_pipe *pipe,
>>>>>> +        struct dpu_hw_sspp_cfg *pipe_cfg,
>>>>>
>>>>> pipe_cfg --> sspp_cfg
>>>>>
>>>>> Also, had a question. For function parameters spreading across 
>>>>> multiple lines do we want to align to one guideline? Is it going to 
>>>>> be two tabs more than the prev line or aligning it with the opening 
>>>>> brace of prev line?
>>>>>
>>>>> I am seeing a mix in the prev patch of the series and this one.
>>>>
>>>> I usually tend to keep the existing indent when adding new args and 
>>>> shifting to open brace when adding new functions. Maybe I failed a 
>>>> question in this patch, I'll doublecheck it.
>>>>
>>>>>
>>>>>> +        const struct dpu_format *fmt)
>>>>>> +{
>>>>>> +    uint32_t min_src_size;
>>>>>> +
>>>>>> +    min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>>>>>> +
>>>>>> +    if (DPU_FORMAT_IS_YUV(fmt) &&
>>>>>> +        (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
>>>>>> +         !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
>>>>>> +        DPU_DEBUG_PLANE(pdpu,
>>>>>> +                "plane doesn't have scaler/csc for yuv\n");
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* check src bounds */
>>>>>> +    if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>>>>>> +           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>>>>>> +        DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>>>>> +                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>>>> +        return -E2BIG;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* valid yuv image */
>>>>>> +    if (DPU_FORMAT_IS_YUV(fmt) &&
>>>>>> +           (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 
>>>>>> & 0x1 ||
>>>>>> +            drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
>>>>>> +            drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>>>>>> +        DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT 
>>>>>> "\n",
>>>>>> +                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* min dst support */
>>>>>> +    if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || 
>>>>>> drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>>>>>> +        DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT 
>>>>>> "\n",
>>>>>> +                DRM_RECT_ARG(&pipe_cfg->dst_rect));
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>>   static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>>>>                     struct drm_atomic_state *state)
>>>>>>   {
>>>>>> @@ -915,7 +960,7 @@ static int dpu_plane_atomic_check(struct 
>>>>>> drm_plane *plane,
>>>>>>       const struct dpu_format *fmt;
>>>>>>       struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>>>>>>       struct drm_rect fb_rect = { 0 };
>>>>>> -    uint32_t min_src_size, max_linewidth;
>>>>>> +    uint32_t max_linewidth;
>>>>>>       unsigned int rotation;
>>>>>>       uint32_t supported_rotations;
>>>>>>       const struct dpu_sspp_cfg *pipe_hw_caps = 
>>>>>> pstate->pipe.sspp->cap;
>>>>>> @@ -970,46 +1015,19 @@ static int dpu_plane_atomic_check(struct 
>>>>>> drm_plane *plane,
>>>>>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>>>>>> -    fmt = 
>>>>>> to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>>>>>> -
>>>>>> -    min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>>>>>> -
>>>>>> -    if (DPU_FORMAT_IS_YUV(fmt) &&
>>>>>> -        (!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
>>>>>> -         !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
>>>>>> -        DPU_DEBUG_PLANE(pdpu,
>>>>>> -                "plane doesn't have scaler/csc for yuv\n");
>>>>>> -        return -EINVAL;
>>>>>> -
>>>>>> -    /* check src bounds */
>>>>>> -    } else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>>>>>> -           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>>>>>> -        DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>>>>> -                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>>>> -        return -E2BIG;
>>>>>> -
>>>>>> -    /* valid yuv image */
>>>>>> -    } else if (DPU_FORMAT_IS_YUV(fmt) &&
>>>>>> -           (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 
>>>>>> & 0x1 ||
>>>>>> -            drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
>>>>>> -            drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>>>>>> -        DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT 
>>>>>> "\n",
>>>>>> -                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>>>> -        return -EINVAL;
>>>>>> -
>>>>>> -    /* min dst support */
>>>>>> -    } else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || 
>>>>>> drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>>>>>> -        DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT 
>>>>>> "\n",
>>>>>> -                DRM_RECT_ARG(&pipe_cfg->dst_rect));
>>>>>> -        return -EINVAL;
>>>>>> -
>>>>>>       /* check decimated source width */
>>>>>> -    } else if (drm_rect_width(&pipe_cfg->src_rect) > 
>>>>>> max_linewidth) {
>>>>>> +    if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>>>>>>           DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " 
>>>>>> line:%u\n",
>>>>>>                   DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>>>>>>           return -E2BIG;
>>>>>>       }
>>>>>> +    fmt = 
>>>>>> to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>>>>>> +
>>>>>> +    ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, 
>>>>>> pipe_cfg, fmt);
>>>>>> +    if (ret)
>>>>>> +        return ret;
>>>>>> +
>>>>>>       supported_rotations = DRM_MODE_REFLECT_MASK | 
>>>>>> DRM_MODE_ROTATE_0;
>>>>>>       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
>>>>
>>

-- 
With best wishes
Dmitry

