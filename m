Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 994A368DF85
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 18:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0249910E1E9;
	Tue,  7 Feb 2023 17:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC4C10E1E9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 17:59:34 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v13so17080822eda.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iRzeaaWxRZVjverEL6a9uNWBwTzAz1eJ3mIjoZzyyYc=;
 b=u/Wo7aH01CIEJZPcXgGhse8VxpF/gGg8aRDRXpQTO42fEwQSYR6e5rCbJ7ag7skoWl
 p2cTc3PoTG/ukh+ygAPBIjRnBYf8Sl3MZWOM/+X7re0yoSnhGSuFPZaDjLwk1+dnqauz
 Nz6hi5WZ0tsHR+iaREolFtgOBlFTjbSVo2ynDtNAmlhT/HHXDZwvOLdNQ6ZchCGgWFbr
 UQvfyRmRzlIzJuzuXR+KfR7idJRG0eJO61LovFBIMn4oWLtV7cdDT1nx5DpIIBuybwD0
 UtXXDLptT4IIJU1frb3MkOPIALg15shY5zSszDZNt6NK367qrFGmMDRlijY8mNrw3C8e
 kTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iRzeaaWxRZVjverEL6a9uNWBwTzAz1eJ3mIjoZzyyYc=;
 b=SEd/TS0XAzjjx/J940pioQzVKnjdix5eBhX0xuWaSBOyQTPV02GPncPbFhPy3k8Fk/
 svFkzvJkg0RySkP4oO73ccn3Y1z7s79tCMw24KhP854qbNY8w1YswB5hvHgw+aagpANO
 gzwOjGxOVdNOqNZX/NzXHWYTGLEBO8la3zu7PE/ofdkWTGNS6g/kGF6kPorOqMcp3kXR
 gOqV7DVNuK9odG88bvbuJZykY0wkQ0R6rJNwKZqHkum1uldH5VfGtb2WVCfq+gK871kP
 NJzRuXJE8OvdsqacIbi7pS0ElXOmf45ChZVXTifBrLbJaQdMQsMB/SLqjSNaaRf2VIvE
 XBiw==
X-Gm-Message-State: AO0yUKWYEr5nIas9A+uGrTSRp3rwODczNbolVMSYw252A3E8YFdd6wdn
 qEYWP0S5xFLi1BYXAbCa66ffgA==
X-Google-Smtp-Source: AK7set9LDbRdtoR5CqLJQdxPXTMXPj5B7sy0xwIyXazs5iTrhzYQN3VPp17cW7hZlnEnL1T9VKkcvg==
X-Received: by 2002:a50:d7da:0:b0:4aa:b36a:7601 with SMTP id
 m26-20020a50d7da000000b004aab36a7601mr5214405edj.24.1675792773326; 
 Tue, 07 Feb 2023 09:59:33 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a509989000000b004aad231b316sm879163edb.40.2023.02.07.09.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 09:59:32 -0800 (PST)
Message-ID: <7c1dfaad-6596-8bac-56a5-07b6087e32b7@linaro.org>
Date: Tue, 7 Feb 2023 19:59:31 +0200
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
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0381e11f-6266-c5f1-87a0-b3050354a80b@quicinc.com>
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

On 07/02/2023 19:57, Abhinav Kumar wrote:
> 
> 
> On 2/7/2023 9:51 AM, Dmitry Baryshkov wrote:
>> On 07/02/2023 19:49, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>> Split pipe-dependent code from dpu_plane_atomic_check() into the
>>>> separate function dpu_plane_atomic_check_pipe(). This is one of
>>>
>>> Same comment as prev patch, dpu_plane_atomic_check_pipe() ---> 
>>> dpu_plane_atomic_check_sspp()
>>
>> No, it does what it does: it checks one software pipe configuration.
> 
> The concept of software pipe is only to encapsulate the hw_sspp along 
> with its params
> 
> +struct dpu_sw_pipe {
> +    struct dpu_hw_sspp *sspp;
> +    enum dpu_sspp_multirect_index multirect_index;
> +    enum dpu_sspp_multirect_mode multirect_mode;
> +};
> 
> So its a very thin differentiation there.

SSPP is a hardware thing, while the sw_pipe is a software instance. It 
can employ an SSPP or a half of SSPP. And if it employs a half of SSPP 
(rec1) than the name dpu_plane_atomic_check_sspp() doesn't make sense: 
we are not checking the SSPP itself (or its configuration). We are 
checking the parameters of SW pipe.

> 
>>
>>>
>>>> preparational steps to add r_pipe support.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 88 
>>>> ++++++++++++++---------
>>>>   1 file changed, 53 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>> index f94e132733f3..e69499490d39 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>> @@ -903,6 +903,51 @@ static int 
>>>> dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>>>>       return 0;
>>>>   }
>>>> +static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>>>> +        struct dpu_sw_pipe *pipe,
>>>> +        struct dpu_hw_sspp_cfg *pipe_cfg,
>>>
>>> pipe_cfg --> sspp_cfg
>>>
>>> Also, had a question. For function parameters spreading across 
>>> multiple lines do we want to align to one guideline? Is it going to 
>>> be two tabs more than the prev line or aligning it with the opening 
>>> brace of prev line?
>>>
>>> I am seeing a mix in the prev patch of the series and this one.
>>
>> I usually tend to keep the existing indent when adding new args and 
>> shifting to open brace when adding new functions. Maybe I failed a 
>> question in this patch, I'll doublecheck it.
>>
>>>
>>>> +        const struct dpu_format *fmt)
>>>> +{
>>>> +    uint32_t min_src_size;
>>>> +
>>>> +    min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>>>> +
>>>> +    if (DPU_FORMAT_IS_YUV(fmt) &&
>>>> +        (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
>>>> +         !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
>>>> +        DPU_DEBUG_PLANE(pdpu,
>>>> +                "plane doesn't have scaler/csc for yuv\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    /* check src bounds */
>>>> +    if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>>>> +           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>>>> +        DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>>> +                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>> +        return -E2BIG;
>>>> +    }
>>>> +
>>>> +    /* valid yuv image */
>>>> +    if (DPU_FORMAT_IS_YUV(fmt) &&
>>>> +           (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 
>>>> 0x1 ||
>>>> +            drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
>>>> +            drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>>>> +        DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
>>>> +                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    /* min dst support */
>>>> +    if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || 
>>>> drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>>>> +        DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
>>>> +                DRM_RECT_ARG(&pipe_cfg->dst_rect));
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>>                     struct drm_atomic_state *state)
>>>>   {
>>>> @@ -915,7 +960,7 @@ static int dpu_plane_atomic_check(struct 
>>>> drm_plane *plane,
>>>>       const struct dpu_format *fmt;
>>>>       struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>>>>       struct drm_rect fb_rect = { 0 };
>>>> -    uint32_t min_src_size, max_linewidth;
>>>> +    uint32_t max_linewidth;
>>>>       unsigned int rotation;
>>>>       uint32_t supported_rotations;
>>>>       const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
>>>> @@ -970,46 +1015,19 @@ static int dpu_plane_atomic_check(struct 
>>>> drm_plane *plane,
>>>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>>>> -    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>>>> -
>>>> -    min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>>>> -
>>>> -    if (DPU_FORMAT_IS_YUV(fmt) &&
>>>> -        (!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
>>>> -         !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
>>>> -        DPU_DEBUG_PLANE(pdpu,
>>>> -                "plane doesn't have scaler/csc for yuv\n");
>>>> -        return -EINVAL;
>>>> -
>>>> -    /* check src bounds */
>>>> -    } else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>>>> -           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>>>> -        DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>>> -                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>> -        return -E2BIG;
>>>> -
>>>> -    /* valid yuv image */
>>>> -    } else if (DPU_FORMAT_IS_YUV(fmt) &&
>>>> -           (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 
>>>> 0x1 ||
>>>> -            drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
>>>> -            drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>>>> -        DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
>>>> -                DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>> -        return -EINVAL;
>>>> -
>>>> -    /* min dst support */
>>>> -    } else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || 
>>>> drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>>>> -        DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
>>>> -                DRM_RECT_ARG(&pipe_cfg->dst_rect));
>>>> -        return -EINVAL;
>>>> -
>>>>       /* check decimated source width */
>>>> -    } else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>>>> +    if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>>>>           DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " 
>>>> line:%u\n",
>>>>                   DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>>>>           return -E2BIG;
>>>>       }
>>>> +    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>>>> +
>>>> +    ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, 
>>>> pipe_cfg, fmt);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>>       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
>>>>       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
>>

-- 
With best wishes
Dmitry

