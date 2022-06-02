Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6056053C0D3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 00:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89D8113A5C;
	Thu,  2 Jun 2022 22:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B402D113A5B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 22:31:21 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id u23so9999308lfc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 15:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QLsdHvNPdGjzenCAtFB5+kLc32Fh43hJrVp78U5dd3c=;
 b=Wz1iGqTiwfrpxiLgj73tACgYI4BZVcJYk6xYLmo2gm/LpmOedLdVP4XWDNR2zVjy05
 9u1vxfJAM+XDC54WK5mJ42X5MNshZ1CrkQ0aQa0ehL4i/bTdyLgGqddLzdZUI18y+2wf
 R4/VzQcIWCwkcDYQOgleJWsmbx8SYWg3f0OatRAXYksol2IBxOk22Ebs6R19D+8Px2Mp
 UdWyk91DSjyqcF6OEv48DZnzAmPBidetBnXnqPYwGojRbXNWhp43SOw5+cWpTgFZgdhr
 WRT2pCp96IwU4Inzupp0Aj3WrHsH8oQ8d5hR1BVmH8s8Axggh5t0zOKh4CE+rPGFMc9c
 Tnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QLsdHvNPdGjzenCAtFB5+kLc32Fh43hJrVp78U5dd3c=;
 b=0Iu7otagtCtOKIDr6rrVwfEJcd9JT3eShKeP7uKHpbL2YFcPJWrg9jnRjArTmZq4w5
 5eZ5OU2xmmIiKMQK0Y/8Y/xPGmEG6l+ZLgxxKKKW6yRRObFXYRM5NBQc3voNToWlOjWX
 xV4+uS557IQXla2UZclOPxG3e8ZRrytbDGbS+FMyW7ivOWofHRTULXhOWDCJlWYJmFxp
 ew/EUUhwZuIWkMSs8UyIZ/CY4Q0PEH4HHPks0VBOZt4wcwEqra8XsPstbO3LxdeNjtjo
 LBQkqIxO2T8k4BNKJilQUOvo1Nidhov0FQVR7+KXvvffcyF2TOQyHiES4LF9P04ZuZq1
 5wLg==
X-Gm-Message-State: AOAM530qnjU+6KsIz+ZL0+bsVgszHUvLBzoKAWma47FU66as8ourMn7G
 07B5sIP9stSbp6lWQSO7IHKdjA==
X-Google-Smtp-Source: ABdhPJzwbMjPrGwXzXbOAq9OydlJhxlH6xaJmrXSlr6XxT//Z90jNDPRcdqXo24vOZtjsM1wmqypAA==
X-Received: by 2002:a05:6512:3187:b0:478:5b6b:2a18 with SMTP id
 i7-20020a056512318700b004785b6b2a18mr5043224lfe.30.1654209079912; 
 Thu, 02 Jun 2022 15:31:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v10-20020ac2558a000000b00478df9f4d64sm996844lfg.227.2022.06.02.15.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 15:31:19 -0700 (PDT)
Message-ID: <0b3574a3-1dfb-842f-e147-c6522fa30f11@linaro.org>
Date: Fri, 3 Jun 2022 01:31:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: Add MISR register support for interface
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-3-quic_jesszhan@quicinc.com>
 <d72845af-f444-af2e-b834-6e4c754a1094@linaro.org>
 <f81a64fc-c80c-2bc9-a9e3-8eb4a1eccf03@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f81a64fc-c80c-2bc9-a9e3-8eb4a1eccf03@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/05/2022 23:11, Jessica Zhang wrote:
> 
> 
> On 5/27/2022 12:38 PM, Dmitry Baryshkov wrote:
>> On 27/05/2022 21:54, Jessica Zhang wrote:
>>> Add support for setting MISR registers within the interface
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 55 ++++++++++++++++++++-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  8 ++-
>>>   2 files changed, 61 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> index 3f4d2c6e1b45..29aaeff9eacd 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> @@ -1,5 +1,7 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>> +/*
>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>    */
>>>   #include "dpu_hwio.h"
>>> @@ -67,6 +69,14 @@
>>>   #define INTF_CFG2_DATABUS_WIDEN    BIT(0)
>>>   #define INTF_CFG2_DATA_HCTL_EN    BIT(4)
>>> +#define INTF_MISR_CTRL            0x180
>>> +#define INTF_MISR_SIGNATURE        0x184
>>> +#define INTF_MISR_FRAME_COUNT_MASK    0xFF
>>> +#define INTF_MISR_CTRL_ENABLE        BIT(8)
>>> +#define INTF_MISR_CTRL_STATUS        BIT(9)
>>> +#define INTF_MISR_CTRL_STATUS_CLEAR    BIT(10)
>>> +#define INTF_MISR_CTRL_FREE_RUN_MASK    BIT(31)
>>
>> I'm tempted to ask to move these bits to some common header. Is there 
>> any other hardware block which uses the same bitfields to control MISR?
> 
> dpu_hw_lm.c has similar macros here [1] for _ENABLE, _STATUS, 
> _STATUS_CLEAR, and _FREE_RUN_MASK
> 
> [1] 
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c#L31 

Please move bit definitions to dpu_hw_util.h. According to what I 
observe, this might be useful.

>>> +
>>>   static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>>>           const struct dpu_mdss_cfg *m,
>>>           void __iomem *addr,
>>> @@ -319,6 +329,47 @@ static u32 dpu_hw_intf_get_line_count(struct 
>>> dpu_hw_intf *intf)
>>>       return DPU_REG_READ(c, INTF_LINE_COUNT);
>>>   }
>>> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool 
>>> enable, u32 frame_count)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *c = &intf->hw;
>>> +    u32 config = 0;
>>> +
>>> +    DPU_REG_WRITE(c, INTF_MISR_CTRL, INTF_MISR_CTRL_STATUS_CLEAR);
>>> +
>>> +    /* Clear old MISR value (in case it's read before a new value is 
>>> calculated)*/
>>> +    wmb();
>>> +
>>> +    if (enable) {
>>> +        config = (frame_count & INTF_MISR_FRAME_COUNT_MASK) |
>>> +                INTF_MISR_CTRL_ENABLE | INTF_MISR_CTRL_FREE_RUN_MASK;
>>> +
>>> +        DPU_REG_WRITE(c, INTF_MISR_CTRL, config);
>>> +    } else {
>>> +        DPU_REG_WRITE(c, INTF_MISR_CTRL, 0);
>>> +    }

This should also be abstracted. Please merge these functions with LM's 
and add corresponding helpers to dpu_hw_util.c

>>> +}
>>> +
>>> +static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 
>>> *misr_value)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *c = &intf->hw;
>>> +    u32 ctrl = 0;
>>> +
>>> +    if (!misr_value)
>>> +        return -EINVAL;
>>> +
>>> +    ctrl = DPU_REG_READ(c, INTF_MISR_CTRL);
>>> +
>>> +    if (!(ctrl & INTF_MISR_CTRL_ENABLE))
>>> +        return -ENODATA;

As the users of collect_misr() are going to ignore the -ENODATA, I think 
it would be worth changing this to set *misr_value to 0 and return 0 
here. It would reduce the amount of boilerplate code.

>>> +
>>> +    if (!(ctrl & INTF_MISR_CTRL_STATUS))
>>> +        return -EINVAL;
>>> +
>>> +    *misr_value = DPU_REG_READ(c, INTF_MISR_SIGNATURE);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>>>           unsigned long cap)
>>>   {
>>> @@ -329,6 +380,8 @@ static void _setup_intf_ops(struct 
>>> dpu_hw_intf_ops *ops,
>>>       ops->get_line_count = dpu_hw_intf_get_line_count;
>>>       if (cap & BIT(DPU_INTF_INPUT_CTRL))
>>>           ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
>>> +    ops->setup_misr = dpu_hw_intf_setup_misr;
>>> +    ops->collect_misr = dpu_hw_intf_collect_misr;
>>>   }
>>>   struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>> index 7b2d96ac61e8..8d0e7b509260 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>> @@ -1,5 +1,7 @@
>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>> +/*
>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>    */
>>>   #ifndef _DPU_HW_INTF_H
>>> @@ -57,6 +59,8 @@ struct intf_status {
>>>    * @ get_line_count: reads current vertical line counter
>>>    * @bind_pingpong_blk: enable/disable the connection with pingpong 
>>> which will
>>>    *                     feed pixels to this interface
>>> + * @setup_misr: enable/disable MISR
>>> + * @collect_misr: read MISR signature
>>>    */
>>>   struct dpu_hw_intf_ops {
>>>       void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>>> @@ -77,6 +81,8 @@ struct dpu_hw_intf_ops {
>>>       void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
>>>               bool enable,
>>>               const enum dpu_pingpong pp);
>>> +    void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 
>>> frame_count);
>>> +    int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
>>>   };
>>>   struct dpu_hw_intf {
>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
