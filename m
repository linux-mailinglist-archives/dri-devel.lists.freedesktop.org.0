Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4604865E87F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 10:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6513610E6DD;
	Thu,  5 Jan 2023 09:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F9810E6DD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 09:59:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso1965375wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 01:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=TzUHuJF+1GtjKbGnuP0VxWAofVGSsonV8HAjRWPNYtE=;
 b=vuI5XC/ElzTz0lZgBI1+7M7TkLcYdoazvJmSS7s/KySvZKg8Xqo/F0UKxcKCsnqvKk
 hQ+bN+pWIJt0ozmieFOEO+AqGHLbZq2AKjcUZ4DAKfuAiyvTEmgd/+QN+d+LUfy8xqOW
 pdyUt70nhyPPiToCRx/FwjsjeciPCvGJadPS9KZH0i2omvLfRXZduVybqTmclWzoSBgV
 9JcElXb9LClrjpqomBtinyS5eHmmE1D7ctf5rt0GNa1SKClf+jKx3YFUTSdClpTpb0Vu
 c0klsP4V3JNpqIZ7UGy7wEd6zIABAZPZy1XGY788ZsVOA7Gg6cFuL8+uP9d5wKbGFvbj
 l49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TzUHuJF+1GtjKbGnuP0VxWAofVGSsonV8HAjRWPNYtE=;
 b=X8ZNiAeNIxYJCOA84G6Yo6jkM/S7tugG+qQ+sas09wqU+YKJK3ZCI+LtoP12ZSxauU
 LjR3Go7ej2+h5A9S+XCyu0mdskPTxyqKxqQlldKtLJVqq76FBXtgDX4X9IBLUFkFFQ1Z
 oGKSzuV++wa4Vn9g08eMzoC6Yfcf1x/13Hwb14qATXmIwUXeU8SAYxsmG4cw+rZsE6fw
 zNteEC7t/p4EEJtGd1IrPqYsjiRP8n1Eb4GVD89d8hkEkyfJIrTcCdDHXOiZS9FakoHX
 wWN8XtynAcZ6mqXDWzxMYQ3FP2wo3sazg1QYDYxVLez3YtlOqzTwzde/F+yUlqno13a1
 IeBQ==
X-Gm-Message-State: AFqh2kpXR8C0idZKmSpS2/K5hzPri0AVM09nxacAc7ZMOAwZESLQPE2q
 5Bl4moQsR35ZIqDX/QiutORXLA==
X-Google-Smtp-Source: AMrXdXsQZ0DK0v9sW/V/Gfm1iQioAHO/VQix/Tw5Y8roIvVtwON8/NprodDB8Q5coTZo2iLhNB4AVw==
X-Received: by 2002:a05:600c:1d89:b0:3d3:5cd6:781 with SMTP id
 p9-20020a05600c1d8900b003d35cd60781mr35095929wms.37.1672912771401; 
 Thu, 05 Jan 2023 01:59:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1e12:c16d:1898:607c?
 ([2a01:e0a:982:cbb0:1e12:c16d:1898:607c])
 by smtp.gmail.com with ESMTPSA id
 g41-20020a05600c4ca900b003cfd0bd8c0asm1652910wmp.30.2023.01.05.01.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 01:59:30 -0800 (PST)
Message-ID: <342119d7-87fb-2880-2729-4c173ce60d4d@linaro.org>
Date: Thu, 5 Jan 2023 10:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/6] drm/msm/dpu: add support for SM8550
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-3-9ccd7e652fcd@linaro.org>
 <96ccae6f-3788-e030-480f-7aa2478ca560@linaro.org>
 <de3860ba-40f9-cdd5-097c-e015f6b19255@linaro.org>
 <CAA8EJpoi8QFpvR0qWpNpenZKzEZAQpwp3gNpGd3RwHovgC+Odw@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJpoi8QFpvR0qWpNpenZKzEZAQpwp3gNpGd3RwHovgC+Odw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 18:48, Dmitry Baryshkov wrote:
> On Wed, 4 Jan 2023 at 12:08, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On 04/01/2023 10:45, Dmitry Baryshkov wrote:
>>> On 04/01/2023 11:08, Neil Armstrong wrote:
>>>> Add definitions for the display hardware used on Qualcomm SM8550
>>>> platform.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 197 +++++++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
>>>>    4 files changed, 201 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index b4ca123d8e69..adf5e25269dc 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>
>> <snip>
>>
>>>> @@ -776,6 +821,45 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>>>>        },
>>>>    };
>>>> +static const struct dpu_ctl_cfg sm8550_ctl[] = {
>>>> +    {
>>>> +    .name = "ctl_0", .id = CTL_0,
>>>> +    .base = 0x15000, .len = 0x290,?
>>>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
>>>
>>> CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY) ?
>>
>> Indeed DPU_CTL_VM_CFG is missing, will switch to that.
>>
>>>
>>>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>> +    },
>>>> +    {
>>>> +    .name = "ctl_1", .id = CTL_1,
>>>> +    .base = 0x16000, .len = 0x290,
>>>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
>>>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>>> +    },
>>>> +    {
>>>> +    .name = "ctl_2", .id = CTL_2,
>>>> +    .base = 0x17000, .len = 0x290,
>>>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
>>>
>>> CTL_SC7280_MASK?
>>
>> Ack
>>
>>>
>>>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>>>> +    },
>>>> +    {
>>>> +    .name = "ctl_3", .id = CTL_3,
>>>> +    .base = 0x18000, .len = 0x290,
>>>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
>>>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>>>> +    },
>>>> +    {
>>>> +    .name = "ctl_4", .id = CTL_4,
>>>> +    .base = 0x19000, .len = 0x290,
>>>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
>>>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>>>> +    },
>>>> +    {
>>>> +    .name = "ctl_5", .id = CTL_5,
>>>> +    .base = 0x1a000, .len = 0x290,
>>>> +    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE),
>>>> +    .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>>>> +    },
>>>> +};
>>>> +
>>>>    static const struct dpu_ctl_cfg sc7280_ctl[] = {
>>>>        {
>>>>        .name = "ctl_0", .id = CTL_0,
>>
>> <snip>
>>
>>>> @@ -1268,6 +1386,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>>>>        .len = 0x20, .version = 0x20000},
>>>>    };
>>>> +#define PP_BLK_DIPHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>>> +    {\
>>>> +    .name = _name, .id = _id, \
>>>> +    .base = _base, .len = 0, \
>>>
>>> len = 0 looks incorrect. Any particular reason why can't we use plain PP_BLK here?
>>
>> The TE block has been moved to the DSI INTF blocks since SM8350 I think, or earlier.
> 
> I think, 8150. Marijn has been working on adding support for INTF-based TE.
> 
>> This removes the DPU_PINGPONG_DITHER feature used downstream to enable the PP TE callbacks.
>> Since there's only the DIPHER sub-block remaining, this is why I set len to 0.
> 
> I went on with some research. Usually PP len is 0xd4. However it seems
> since 8350 (since the change of DSC block) the PP size should be 0x0),
> despite dowsnstream DTs having sde-pp-size=0xd4 for sm8350 and sm8450
> (or 0x4 for neo, DPU 9.1.0).

Perhaps neo has a single register at PP base address, on 8550 there's none.

> So, it looks like you are correct here (and we should fix 8350/8450
> patches instead).

Yes it must be because with the new DSC block, the PP DCE_DATA_XX_SWAP/DSC_MODE registers were removed,
so I expect they are still present in 8150 & 8250.

Neil

> 
>>
>>>
>>>> +    .features = BIT(DPU_PINGPONG_DITHER), \
>>>> +    .merge_3d = _merge_3d, \
>>>> +    .sblk = &_sblk, \
>>>> +    .intr_done = _done, \
>>>> +    .intr_rdptr = _rdptr, \
>>>> +    }
>>>>    #define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
>>>>        {\
>>>>        .name = _name, .id = _id, \
>>
>> <snip>
>>
> 
> 

