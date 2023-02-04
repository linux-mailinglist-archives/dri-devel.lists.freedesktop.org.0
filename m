Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EED68A818
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 05:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A778D10E0B7;
	Sat,  4 Feb 2023 04:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298FD10E0B7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Feb 2023 04:10:07 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so20560432ejc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 20:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0XuIYWGnt6N0JMIBoSlf0QRupfCBoPGj9XyjPzrYxuQ=;
 b=snyvldDPyCqOsaJpgklyn+egeUjwQ1QeUKxCvPyEAbztMyvDgJaM0iNfeyJgZ3blN3
 TAWJzZShr0I0EzvxZROywODZgh7XD7j8o3L9u6La4OmAiNwDUMEkrhn8EdzIZXmZEI3X
 yQlk4CSZgJJh7w0/yEOpO+IqDU9fUEHPa1MwoV8VJNkhSZ3yKW6ipPJ3bqRvxO9Nlf90
 3hQbpT2cjx1I2kP7aI69MwBPNlaxpuH04H+6Qb159eML3ik6sb8IDzaivOHGwr4as4t5
 IHrlJQ6XDK3KVqLO7JnmFQonIWTdl+z0dO4DjWTDG4d2HoxIfAct31QK9egvf7LQN5HI
 hWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0XuIYWGnt6N0JMIBoSlf0QRupfCBoPGj9XyjPzrYxuQ=;
 b=ZQEN+Eo7t+ZvV1ZcW6BsrzPMspt7lotiBrrBSPvxlLEu4WH/WU0TH1w0D55cpk6efy
 NUUzLHDFawqcFRWM71TbnyAfQVQseFY725feUdyclbCKGRaRGo/lekhDkNvjk2xYOjRS
 evv4xVndd1MCmJKspYBQdkLUDQtM2SEb8+pRgymkHRCnJTyC/KJTcoYSSXOvPhnPzmOT
 Lks3WbrjGQEcldEJq9jh8eZjQVXLF2qK9+m1HtxmzgBjnMAMKS6kiKfKxit6NeXIJYAh
 k6enDGmd0By9IaUkVwOoOLYR7C6F4u2U7oRoFJ1lFMLDrbJY33i1SjcTlPI8nIxks9hZ
 Akyw==
X-Gm-Message-State: AO0yUKU+9zsHtn7RLVMLbhsrt5QNCOyq2uctOJxoeCEbb88C6Rppz3Eb
 FYlJ5eYs9AHR6fAlU5GpC6hF7Q==
X-Google-Smtp-Source: AK7set8j7GQGcOQNEd3iG+9+Rgx8mN5H+fCtqkCAJSCnmXJYmARwyXgoQosXxqdkiYv5ty6xo3q9Qg==
X-Received: by 2002:a17:906:6a24:b0:87b:da77:eec2 with SMTP id
 qw36-20020a1709066a2400b0087bda77eec2mr17225917ejc.19.1675483805418; 
 Fri, 03 Feb 2023 20:10:05 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 lv3-20020a170906bc8300b00883410a786csm2235115ejb.207.2023.02.03.20.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 20:10:04 -0800 (PST)
Message-ID: <42e6237d-9fae-0679-1354-7df74594a9db@linaro.org>
Date: Sat, 4 Feb 2023 06:10:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA features in hw
 catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
 <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
 <3754a9a9-8b64-62ae-0b0d-f379debefa16@linaro.org>
 <ddb0de30-9e29-f6f0-028c-48530bee4a6b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ddb0de30-9e29-f6f0-028c-48530bee4a6b@quicinc.com>
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

On 04/02/2023 04:43, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 6:29 PM, Dmitry Baryshkov wrote:
>> On 04/02/2023 01:35, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>> Downstream driver uses dpu->caps->smart_dma_rev to update
>>>> sspp->cap->features with the bit corresponding to the supported 
>>>> SmartDMA
>>>> version. Upstream driver does not do this, resulting in SSPP subdriver
>>>> not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
>>>> feature bits to dpu hw catalog.
>>>>
>>>
>>> While reviewing this patch, I had a first hand experience of how we 
>>> are reusing SSPP bitmasks for so many chipsets but I think overall 
>>> you got them right here :)
>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index cf053e8f081e..fc818b0273e7 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> @@ -21,13 +21,16 @@
>>>>       (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>>>>   #define VIG_SDM845_MASK \
>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>> BIT(DPU_SSPP_SCALER_QSEED3) |\
>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>   #define VIG_SC7180_MASK \
>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>> BIT(DPU_SSPP_SCALER_QSEED4) |\
>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>   #define VIG_SM8250_MASK \
>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>>> @@ -42,6 +45,7 @@
>>>>   #define DMA_SDM845_MASK \
>>>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | 
>>>> BIT(DPU_SSPP_QOS_8LVL) |\
>>>>       BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>>>> +    BIT(DPU_SSPP_SMART_DMA_V2) |\
>>>>       BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>>>>   #define DMA_CURSOR_SDM845_MASK \
>>>
>>> VIG_SDM845_MASK and DMA_SDM845_MASK are used for many other chipsets 
>>> like 8250, 8450, 8550.
>>>
>>> At the moment, for visual validation of this series, I only have 
>>> sc7180/sc7280. We are leaving the rest for CI.
>>>
>>> Was that an intentional approach?
>>>
>>> If so, we will need tested-by tags from folks having 
>>> 8350/8450/8550/sc8280x,qcm2290?
>>>
>>> I am only owning the visual validation on sc7280 atm.
>>
>> I'm not quite sure what is your intent here. Are there any SoCs after 
>> 845 that do not have SmartDMA 2.5? Or do you propose to enable 
>> SmartDMA only for the chipsets that we can visually test? That sounds 
>> strange.
>>
> 
> Yes I was thinking to enable smartDMA at the moment on chipsets which we 
> can validate visually that display comes up. But I am not sure if thats 
> entirely practical.
> 
> But the intent was I just want to make sure basic display does come up 
> with smartDMA enabled if we are enabling it for all chipsets.

I don't think it is practical or logical. We don't require validating 
other changes on all possible chipsets, so what is so different with 
this one?

-- 
With best wishes
Dmitry

