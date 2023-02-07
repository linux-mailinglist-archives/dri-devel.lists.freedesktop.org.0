Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F44F68DF64
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 18:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3D410E55B;
	Tue,  7 Feb 2023 17:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0907110E1EE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 17:51:48 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id c13so2886106ejz.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 09:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YJLohgBBelS1kaNNmWKRDdSV+9WDB1MthdEHDQiW00o=;
 b=mhiJZRuQ+hdD2O69brE7nmsjknfYZ4chVoOoXwBq8jhyHrBCrwwCGrjesI7xp2eBuH
 mqgtdyaMhgWvEJog6lTbdmIN4KIOwaH38CRUx71CE1poeT9qrJxvLdfpecXzzpvPo4t3
 6CeiZrMSP+2+GTKK6yVJ1LjHLNkPbs7TNVG/brTPGsT0nqEfzLrDKopK6fS0aFmAJxpJ
 9DHNY0h9vnBndDVTyP0JqvWq7pIYcedfZD0wgUfn3pm9TrM2s2Al1FR09wLookXGdBjE
 SU8OXJSCiyVgQzPGTX9sq4ZR54j5C0laxr64S4PWWDbGHlsXwcMJ8vGurkRkjWnqzk0r
 t0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YJLohgBBelS1kaNNmWKRDdSV+9WDB1MthdEHDQiW00o=;
 b=PPBifF/tYIJdmOWx1C/Lthu829YKHmJDXnZiXHeuIizzIwRu8wuRlm2Slmp3Ez4kKy
 F9TBPMcYfpt0eC566mqLIUiMDhu1szaT8d04TEGRWI0Y27oPpuP17jfsJ3mTjXzV6x0R
 gTAvOZTPY3sHLd1vRwq6u8J4egTfPgJssvbaWB/2EqgzEkNYQiaMmE0sJix/QItPpQkC
 bl3EeY2bnVs3B/90SAoiPOHFWHqO0ekTBDm3M/Y68FOH2ype3yHQP+7xk6c9z9VQ8EQA
 6xQsU9sMi22xV5OAOesOTY2Bemix/ZCzc4vCBMM8m6lUGZKlSudad+MSPdJCoTcGDqhQ
 E0Zw==
X-Gm-Message-State: AO0yUKVU4Jc23KWbk8o7kyZlc1E7BbahFcMcbtSC8b9JCs01j+B39xuv
 t+y/+vJnryQ9dPlhd7jSDOb7sQ==
X-Google-Smtp-Source: AK7set+OgG+hF0Nl3LjR/rT3qQ3ARctaUFKp1f0bbC3iPZ3P4C0oLTAxivF39/PO833ejPKymx50xg==
X-Received: by 2002:a17:906:2da9:b0:878:5bce:291a with SMTP id
 g9-20020a1709062da900b008785bce291amr4809533eji.36.1675792306544; 
 Tue, 07 Feb 2023 09:51:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 uz12-20020a170907118c00b0084cb4d37b8csm7223659ejb.141.2023.02.07.09.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 09:51:46 -0800 (PST)
Message-ID: <fd2e4474-3ecb-91e1-d702-0b2dbb77f458@linaro.org>
Date: Tue, 7 Feb 2023 19:51:44 +0200
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
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <04ab8d1e-d343-2d6c-c211-2cf0ffc713c2@quicinc.com>
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

On 07/02/2023 19:49, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Split pipe-dependent code from dpu_plane_atomic_check() into the
>> separate function dpu_plane_atomic_check_pipe(). This is one of
> 
> Same comment as prev patch, dpu_plane_atomic_check_pipe() ---> 
> dpu_plane_atomic_check_sspp()

No, it does what it does: it checks one software pipe configuration.

> 
>> preparational steps to add r_pipe support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 88 ++++++++++++++---------
>>   1 file changed, 53 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index f94e132733f3..e69499490d39 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -903,6 +903,51 @@ static int dpu_plane_check_inline_rotation(struct 
>> dpu_plane *pdpu,
>>       return 0;
>>   }
>> +static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>> +        struct dpu_sw_pipe *pipe,
>> +        struct dpu_hw_sspp_cfg *pipe_cfg,
> 
> pipe_cfg --> sspp_cfg
> 
> Also, had a question. For function parameters spreading across multiple 
> lines do we want to align to one guideline? Is it going to be two tabs 
> more than the prev line or aligning it with the opening brace of prev line?
> 
> I am seeing a mix in the prev patch of the series and this one.

I usually tend to keep the existing indent when adding new args and 
shifting to open brace when adding new functions. Maybe I failed a 
question in this patch, I'll doublecheck it.

> 
>> +        const struct dpu_format *fmt)
>> +{
>> +    uint32_t min_src_size;
>> +
>> +    min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>> +
>> +    if (DPU_FORMAT_IS_YUV(fmt) &&
>> +        (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
>> +         !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
>> +        DPU_DEBUG_PLANE(pdpu,
>> +                "plane doesn't have scaler/csc for yuv\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* check src bounds */
>> +    if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>> +           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>> +        DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>> +                DRM_RECT_ARG(&pipe_cfg->src_rect));
>> +        return -E2BIG;
>> +    }
>> +
>> +    /* valid yuv image */
>> +    if (DPU_FORMAT_IS_YUV(fmt) &&
>> +           (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 
>> 0x1 ||
>> +            drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
>> +            drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>> +        DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
>> +                DRM_RECT_ARG(&pipe_cfg->src_rect));
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* min dst support */
>> +    if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || 
>> drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>> +        DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
>> +                DRM_RECT_ARG(&pipe_cfg->dst_rect));
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int dpu_plane_atomic_check(struct drm_plane *plane,
>>                     struct drm_atomic_state *state)
>>   {
>> @@ -915,7 +960,7 @@ static int dpu_plane_atomic_check(struct drm_plane 
>> *plane,
>>       const struct dpu_format *fmt;
>>       struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>>       struct drm_rect fb_rect = { 0 };
>> -    uint32_t min_src_size, max_linewidth;
>> +    uint32_t max_linewidth;
>>       unsigned int rotation;
>>       uint32_t supported_rotations;
>>       const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
>> @@ -970,46 +1015,19 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>> -    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> -
>> -    min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>> -
>> -    if (DPU_FORMAT_IS_YUV(fmt) &&
>> -        (!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
>> -         !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
>> -        DPU_DEBUG_PLANE(pdpu,
>> -                "plane doesn't have scaler/csc for yuv\n");
>> -        return -EINVAL;
>> -
>> -    /* check src bounds */
>> -    } else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>> -           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>> -        DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>> -                DRM_RECT_ARG(&pipe_cfg->src_rect));
>> -        return -E2BIG;
>> -
>> -    /* valid yuv image */
>> -    } else if (DPU_FORMAT_IS_YUV(fmt) &&
>> -           (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 
>> 0x1 ||
>> -            drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
>> -            drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>> -        DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
>> -                DRM_RECT_ARG(&pipe_cfg->src_rect));
>> -        return -EINVAL;
>> -
>> -    /* min dst support */
>> -    } else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || 
>> drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>> -        DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
>> -                DRM_RECT_ARG(&pipe_cfg->dst_rect));
>> -        return -EINVAL;
>> -
>>       /* check decimated source width */
>> -    } else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>> +    if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>>           DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
>>                   DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>>           return -E2BIG;
>>       }
>> +    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +
>> +    ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, 
>> fmt);
>> +    if (ret)
>> +        return ret;
>> +
>>       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
>>       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))

-- 
With best wishes
Dmitry

