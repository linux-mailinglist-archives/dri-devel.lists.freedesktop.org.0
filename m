Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6BB65D05F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD94710E568;
	Wed,  4 Jan 2023 10:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAB510E56A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 10:08:29 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso26032030wmp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 02:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qWVpoQHblmDwFl1sBCobe3EL1RtatjgZTaxQDVY+onE=;
 b=ZeVEphlwDCu2OKKQwSIylb81iKaUYqLHC2OaOx5XWZ5KsDkI/M55LIqWkRhMCzngJu
 RAiJuAXSl1C3Ke7OzI+PEU8fJgAW8GycgTgSY/xYJVGgnh/mX9sV+xPV6nbRAutQfLcJ
 UXjMqYHbV62rM+L4wM6JD0BuUqwOV4HjcLcK5bNbt099XTklfejMJSLMA4lbHuY9/GqS
 60zr9ost44CL3S79xYyA/hUExW1rKdjEKXEC2S3QMMd9J7QbGcy+e2V2fz3XLi7inCqD
 mlIM23cnFO6H/8bJ0GCCgSHM2bHSBV3WVwNHRnV37YVSvnJhBRgN5xEg6dDFqVU4m0fZ
 fK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qWVpoQHblmDwFl1sBCobe3EL1RtatjgZTaxQDVY+onE=;
 b=ec7BTxoe80J8kxShspJWO5CboRilqh+kS7nDBRLjl++wVEz9M5xSIW8TLmDN0DpwNc
 Gc9ZOd8IbeqFwUzPBhsLzQ3iTpk9427RxJR2aJwxymN9IpU7RYDrCy85vmu14qpmZwRF
 p6f8lMOJ8gK63Re0f1ahrTSPNMFsXTZbtVbr52nnEY3582EWXt9es0wVnZX4QmP90nGW
 aJsnWkLBtG0VVSnD27s6AgJO1reQ06LWby9Ie+wK+UuV+7gkb14ULZzuTnQ47O1MyHqz
 3nxJ4eZr4pLafywMaWG3ZkMyDOmF0Xwk05W8RxXZRvCS62czT3ZTkXfMWS3wTZ0Lv2qF
 9Cjg==
X-Gm-Message-State: AFqh2kqZY/zk4eiatV9eqUEGED2UWsXVLXdePGQTsgdcFaqpkuo3FwjW
 4CgwGX6lOziUpICs1x25l0ObQw==
X-Google-Smtp-Source: AMrXdXtPRTRJrapRYcjS0g4PAGHwCub3tO5l2N4viWO3LyullBOoY5kSV31s6n8XAbIUP5KmHcMObw==
X-Received: by 2002:a7b:cb59:0:b0:3d3:5709:68e8 with SMTP id
 v25-20020a7bcb59000000b003d3570968e8mr33358155wmj.36.1672826907903; 
 Wed, 04 Jan 2023 02:08:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:102f:89e:4a9f:68c?
 ([2a01:e0a:982:cbb0:102f:89e:4a9f:68c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a1c5419000000b003c6c182bef9sm58991052wmb.36.2023.01.04.02.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 02:08:27 -0800 (PST)
Message-ID: <de3860ba-40f9-cdd5-097c-e015f6b19255@linaro.org>
Date: Wed, 4 Jan 2023 11:08:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] drm/msm/dpu: add support for SM8550
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-3-9ccd7e652fcd@linaro.org>
 <96ccae6f-3788-e030-480f-7aa2478ca560@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <96ccae6f-3788-e030-480f-7aa2478ca560@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 10:45, Dmitry Baryshkov wrote:
> On 04/01/2023 11:08, Neil Armstrong wrote:
>> Add definitions for the display hardware used on Qualcomm SM8550
>> platform.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 197 +++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
>>   4 files changed, 201 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index b4ca123d8e69..adf5e25269dc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

<snip>

>> @@ -776,6 +821,45 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>>       },
>>   };
>> +static const struct dpu_ctl_cfg sm8550_ctl[] = {
>> +    {
>> +    .name = "ctl_0", .id = CTL_0,
>> +    .base = 0x15000, .len = 0x290,?
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
> 
> CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY) ?

Indeed DPU_CTL_VM_CFG is missing, will switch to that.

> 
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>> +    },
>> +    {
>> +    .name = "ctl_1", .id = CTL_1,
>> +    .base = 0x16000, .len = 0x290,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>> +    },
>> +    {
>> +    .name = "ctl_2", .id = CTL_2,
>> +    .base = 0x17000, .len = 0x290,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
> 
> CTL_SC7280_MASK?

Ack

> 
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>> +    },
>> +    {
>> +    .name = "ctl_3", .id = CTL_3,
>> +    .base = 0x18000, .len = 0x290,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>> +    },
>> +    {
>> +    .name = "ctl_4", .id = CTL_4,
>> +    .base = 0x19000, .len = 0x290,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>> +    },
>> +    {
>> +    .name = "ctl_5", .id = CTL_5,
>> +    .base = 0x1a000, .len = 0x290,
>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>> +    },
>> +};
>> +
>>   static const struct dpu_ctl_cfg sc7280_ctl[] = {
>>       {
>>       .name = "ctl_0", .id = CTL_0,

<snip>

>> @@ -1268,6 +1386,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>       .len = 0x20, .version = 0x20000},
>>   };
>> +#define PP_BLK_DIPHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>> +    {\
>> +    .name = _name, .id = _id, \
>> +    .base = _base, .len = 0, \
> 
> len = 0 looks incorrect. Any particular reason why can't we use plain PP_BLK here?

The TE block has been moved to the DSI INTF blocks since SM8350 I think, or earlier.

This removes the DPU_PINGPONG_DITHER feature used downstream to enable the PP TE callbacks.

Since there's only the DIPHER sub-block remaining, this is why I set len to 0.

> 
>> +    .features = BIT(DPU_PINGPONG_DITHER), \
>> +    .merge_3d = _merge_3d, \
>> +    .sblk = &_sblk, \
>> +    .intr_done = _done, \
>> +    .intr_rdptr = _rdptr, \
>> +    }
>>   #define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>       {\
>>       .name = _name, .id = _id, \

<snip>

