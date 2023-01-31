Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C5E682C4C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 13:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2B610E32C;
	Tue, 31 Jan 2023 12:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DA610E322
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 12:10:22 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hx15so21420438ejc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 04:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q6vNkQkRAfZ8ZXn+K0FDupRPyKmh1q7SvMI6rLCb7XQ=;
 b=x96o0nlLQmb/BvCxfcIRCUbI08kLEW3pIYBb9gXXUf395dQqB4gnjHIUNOLfRagwEX
 G2fF9fKV2XvFLY6URIlslJiqYfhuYHpNZol4L0kdz4l604bX86G0qsV/P1YWv4LTcvJW
 gfu3Tu1q3F9BoakJXvYDvoT0xnfwT4Qtu+gapfYXyZS3+zGoHLfkVTmmS0rGqMUAHZAd
 RiRaIe1/zy7VnoUe4VsaxCCPtxCi9jroB4V5yMr2aLAhP7jurvmQE/qTMmfYka8uaB9H
 oRjCKn4hpdUW1voa7m5kiJR4DR5gzLwy6KUs3wH/z13oPBKHI13zxiwqXjqWFIOmzdaH
 pwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q6vNkQkRAfZ8ZXn+K0FDupRPyKmh1q7SvMI6rLCb7XQ=;
 b=es7JmeRMagKLYdY/nnKz9D436Vju0jyOkY3pz1HNPrl7FONtbdvhw/hJscIdWcIU3A
 n6aRZggcyO7mwcrsyH4pprD+NAmDysiObSQVqTzUOUfUJl/iaVQzCGGrOkt0nCo5p/30
 epE5Bg92qsTiKEE/XeO5dNs2Uzhw9CaYZS9pAv14Aza5Lm2QKq77Yd5nvQTNF9xV/z9L
 PzCj9gua0AxotrVNvsxWd6P5nNPN5zfYrdr/JiVHcxh/W1USd+PgDBxOq7nw3wK8fKX4
 4GUuqEqnuuMZkv4R9XE5OoH1g8klKo4xh59kqGOJlMpT4WwUzZWeZcOSB2e9gLKNnUcD
 OuMA==
X-Gm-Message-State: AO0yUKWj/TVb3g2dUHloIvlG/vKhbZFwZkKAO/F+/BXvliI8o0/ErXXw
 yxRFLhrI1a9eV5rjfvxrMix6MQ==
X-Google-Smtp-Source: AK7set/N9vBHPojgSmzk3E0a8x1HOtSECSEvXIiQWU3MEye7rK4b6yKY2n71jb+BCO1kQgi5mA8scg==
X-Received: by 2002:a17:907:8e9b:b0:87a:542e:53b4 with SMTP id
 tx27-20020a1709078e9b00b0087a542e53b4mr18860566ejc.64.1675167021251; 
 Tue, 31 Jan 2023 04:10:21 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a1709067b5200b00878530f5324sm8395674ejo.90.2023.01.31.04.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 04:10:20 -0800 (PST)
Message-ID: <9542e211-0cab-07b4-2d58-7fa16839a187@linaro.org>
Date: Tue, 31 Jan 2023 14:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 10/27] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-11-dmitry.baryshkov@linaro.org>
 <bbb6ff43-a432-c0a6-e108-7bf8bc170f52@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bbb6ff43-a432-c0a6-e108-7bf8bc170f52@quicinc.com>
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

On 31/01/2023 07:13, Abhinav Kumar wrote:
> 
> 
> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>> There is no need to pass full dpu_hw_pipe_cfg instance to
>> _dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 7 +++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
>>   3 files changed, 9 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> index f7f81ab08fa2..176cd6dc9a69 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> @@ -415,19 +415,18 @@ static void dpu_hw_sspp_setup_pe_config(struct 
>> dpu_hw_sspp *ctx,
>>   }
>>   static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
>> -        struct dpu_hw_pipe_cfg *sspp,
>> -        void *scaler_cfg)
>> +        struct dpu_hw_scaler3_cfg *scaler3_cfg,
>> +        const struct dpu_format *format)
>>   {
>>       u32 idx;
>> -    struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
>> -    if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
>> +    if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
>>           || !scaler3_cfg)
> 
> Do we need to check for !format ?

We don't have since the calling sequence ensures that it is not NULL, 
but let's check for it since it's a different module.

> 
>>           return;
>>       dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
>>               ctx->cap->sblk->scaler_blk.version,
>> -            sspp->layout.format);
>> +            format);
>>   }
>>   static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> index f5aae563741a..c713343378aa 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> @@ -317,13 +317,12 @@ struct dpu_hw_sspp_ops {
>>       /**
>>        * setup_scaler - setup scaler
>> -     * @ctx: Pointer to pipe context
>> -     * @pipe_cfg: Pointer to pipe configuration
>>        * @scaler_cfg: Pointer to scaler configuration
> 
> This doc needs to be fixed from scaler_cfg to scaler3_cfg
> 
>> +     * @format: pixel format parameters
>>        */
>>       void (*setup_scaler)(struct dpu_hw_sspp *ctx,
>> -        struct dpu_hw_pipe_cfg *pipe_cfg,
>> -        void *scaler_cfg);
>> +        struct dpu_hw_scaler3_cfg *scaler3_cfg,
>> +        const struct dpu_format *format);
>>       /**
>>        * get_scaler_ver - get scaler h/w version
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 172a2c012917..cbff4dea8662 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -677,8 +677,8 @@ static void _dpu_plane_setup_scaler(struct 
>> dpu_sw_pipe *pipe,
>>       if (pipe_hw->ops.setup_scaler &&
>>               pipe->multirect_index != DPU_SSPP_RECT_1)
>>           pipe_hw->ops.setup_scaler(pipe_hw,
>> -                pipe_cfg,
>> -                &scaler3_cfg);
>> +                &scaler3_cfg,
>> +                fmt);
>>   }
>>   /**

-- 
With best wishes
Dmitry

