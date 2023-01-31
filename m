Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F7682C60
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 13:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE8710E335;
	Tue, 31 Jan 2023 12:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E3810E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 12:15:40 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ml19so17449976ejb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 04:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mhtv0ODRBlTpxDV/APPa73s4nDJP3dDm4ZD4J8aRvNY=;
 b=UsaHUY8te724GyFULneEvRi7onjFVb0YO1+XQODuiMN+7yLJjq+v7uO6f8+3axOx+I
 ojoQdZovek893Ai1j3jmS0kIGohjbMfCWlaJCbcXNqUYRDc1zJZlQAEntfQ8vEmWUD6L
 IrE/zHap3TVVA/sbXvF1FDjq0BHB+6epO4tp2byRxdq+D04XtVjwdhlWUio7BwPMOJ0a
 EW7dSlgtofoSOHIB8HQea+5g36F4KK/92BKgIAh6m5ijvY4hc//gNh8d6dces4t3DGy5
 W5icbL+CaIdX0OPAh7ULkR+NG131IoVzBngo3bme/Y0zu0q7nMtLgy5NxViKgqRYZKVT
 pPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mhtv0ODRBlTpxDV/APPa73s4nDJP3dDm4ZD4J8aRvNY=;
 b=4Ib925wWxMX/2QHIR9ipeoDu3IcBJA+ecgq1BL1Q59vL9eE9GtkaD3qJBASwW9jSKh
 La/Y7Akf63mNOPFMsvk7Y10scgz4SfQg+UMYgrksRoIugdZPq8F3aPywW48J5xx18Jio
 NUyqSNk3plFF3m0NWAUx+jiKwFrPF5rTovhQJTOZBIuULQ/KUfY6KVaK5PYdwW4z4xvV
 iu6AhHxsQWOeO1bjVSq+ys60PykE0VXXeezPrQbYRXGhlcQyv5QeQ+IcSqkMlCvfcudQ
 uT7othFwcJPWTI/TZRytYpdjhBvrtHxu+WyMe9HwKHlR11Zg4hETDQlC7Izzz1+n9BZ4
 GUVg==
X-Gm-Message-State: AO0yUKU2nK7a2PQPtw0voePYuQNsiJjq6HpedHoec/g/FwB4MjDXzjOj
 EGl3V/ZQM6n8EMyg8zAjJoG3HA==
X-Google-Smtp-Source: AK7set/x66Cy6xuPwKUNLizlKs3jJEot0LID2oRqSrotXAnzbVteEE5qYnHHzlVkqsc/hlokOmVIfQ==
X-Received: by 2002:a17:906:9487:b0:878:8087:3b71 with SMTP id
 t7-20020a170906948700b0087880873b71mr20179854ejx.17.1675167338531; 
 Tue, 31 Jan 2023 04:15:38 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 fy15-20020a1709069f0f00b0084c62b7b7d8sm8265192ejc.187.2023.01.31.04.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 04:15:38 -0800 (PST)
Message-ID: <01a23b0b-ee27-af2e-dbf2-79de76235d48@linaro.org>
Date: Tue, 31 Jan 2023 14:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 10/27] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-11-dmitry.baryshkov@linaro.org>
 <bbb6ff43-a432-c0a6-e108-7bf8bc170f52@quicinc.com>
 <9542e211-0cab-07b4-2d58-7fa16839a187@linaro.org>
In-Reply-To: <9542e211-0cab-07b4-2d58-7fa16839a187@linaro.org>
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

On 31/01/2023 14:10, Dmitry Baryshkov wrote:
> On 31/01/2023 07:13, Abhinav Kumar wrote:
>>
>>
>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>> There is no need to pass full dpu_hw_pipe_cfg instance to
>>> _dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 7 +++----
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
>>>   3 files changed, 9 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> index f7f81ab08fa2..176cd6dc9a69 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> @@ -415,19 +415,18 @@ static void dpu_hw_sspp_setup_pe_config(struct 
>>> dpu_hw_sspp *ctx,
>>>   }
>>>   static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
>>> -        struct dpu_hw_pipe_cfg *sspp,
>>> -        void *scaler_cfg)
>>> +        struct dpu_hw_scaler3_cfg *scaler3_cfg,
>>> +        const struct dpu_format *format)
>>>   {
>>>       u32 idx;
>>> -    struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
>>> -    if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
>>> +    if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
>>>           || !scaler3_cfg)
>>
>> Do we need to check for !format ?
> 
> We don't have since the calling sequence ensures that it is not NULL, 
> but let's check for it since it's a different module.

On the other hand, dpu_hw_setup_scaler3() properly handles the !format 
case and programs the rest of the scaler setup. So in the end I'll skip 
this check.

> 
>>
>>>           return;
>>>       dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
>>>               ctx->cap->sblk->scaler_blk.version,
>>> -            sspp->layout.format);
>>> +            format);
>>>   }
>>>   static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> index f5aae563741a..c713343378aa 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> @@ -317,13 +317,12 @@ struct dpu_hw_sspp_ops {
>>>       /**
>>>        * setup_scaler - setup scaler
>>> -     * @ctx: Pointer to pipe context
>>> -     * @pipe_cfg: Pointer to pipe configuration
>>>        * @scaler_cfg: Pointer to scaler configuration
>>
>> This doc needs to be fixed from scaler_cfg to scaler3_cfg
>>
>>> +     * @format: pixel format parameters
>>>        */
>>>       void (*setup_scaler)(struct dpu_hw_sspp *ctx,
>>> -        struct dpu_hw_pipe_cfg *pipe_cfg,
>>> -        void *scaler_cfg);
>>> +        struct dpu_hw_scaler3_cfg *scaler3_cfg,
>>> +        const struct dpu_format *format);
>>>       /**
>>>        * get_scaler_ver - get scaler h/w version
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 172a2c012917..cbff4dea8662 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -677,8 +677,8 @@ static void _dpu_plane_setup_scaler(struct 
>>> dpu_sw_pipe *pipe,
>>>       if (pipe_hw->ops.setup_scaler &&
>>>               pipe->multirect_index != DPU_SSPP_RECT_1)
>>>           pipe_hw->ops.setup_scaler(pipe_hw,
>>> -                pipe_cfg,
>>> -                &scaler3_cfg);
>>> +                &scaler3_cfg,
>>> +                fmt);
>>>   }
>>>   /**
> 

-- 
With best wishes
Dmitry

