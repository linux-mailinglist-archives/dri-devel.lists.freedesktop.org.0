Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC60B6E99BC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 18:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8735110E0AE;
	Thu, 20 Apr 2023 16:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B22A10E0C4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 16:41:33 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4ec817735a7so654302e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682008891; x=1684600891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Xkt+7x4DFMfvlPFqBYddaezWfldLilzaYhMnOd3cnc=;
 b=HNoBEubiUabYTEV5IbhUNgFP/QYUAxyxCXIYxRqt9x3bhsx3/xyqVFCJ7ztx4MLOTl
 yXGKrlw5QSjgXWJLBd0rAju6w2nvtNr8xQUhOws/B8i2KElfMW+U2H4e/Q9rOTWlGQmc
 xsahAWRuUj0jft37XWpsGiUtXMfH73cR7RthCNlwgncmgmFjRpg/5iuaaDmUo4DWVZvU
 YZgij8z/YgRL0FVewGxekO8y6Mgmphw03MGSKxBmxfErszSnHIkHwICFKk+iHaDXKCBh
 Y5+g7jbU+IGlXyZzjsbB0QRyuLvc4o9q3EG5ANq8/tmBO3ACfl7NVfevnWJT02qKP2n/
 nr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682008891; x=1684600891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Xkt+7x4DFMfvlPFqBYddaezWfldLilzaYhMnOd3cnc=;
 b=dQKDLAk/rEHxNBCa6gEFFGJVQXMtzU4yrOcO68sd95AA+mMd3jSLI4RwGTWzXv+6H7
 RoZBdYRA3Gxf7xZ9zO2YCCgaqFosWfD0H+0gjd6X9LqAUyaCTLoGOajWmNSa67zPmJBe
 LbgEafq/kxwcw/lax10Sj48aobAWl/TP9DlK8uM3RNI0WYnDzHYh8FYM/HJZjSkUU6gB
 58LfgexbjaHv75fpKJ3zHJKxnFM1TPwMNvULnIawURsfkH7osAXbKTl0WXDJN6S5wq3i
 N5JMM+y3WT3jlA6pEHpPr3fYFc1PzViktPp/gDgTewdNl5ULAS4PE8hxMGUe1rmEep/h
 /l2A==
X-Gm-Message-State: AAQBX9cIcUO08FRMm8QuCsHmsICYelVIMYeHZlx3QCQjXqGdIcuCo2jI
 Yjh7T5D6KYzr4P566kFixPjg0g==
X-Google-Smtp-Source: AKy350ZJGvpZGpqqpI0D88XA/fQx1PlTZaDZlGYh6HhRDuOG2CimDS/aMEswoaYw5U9GRNT31Zg2bQ==
X-Received: by 2002:ac2:5d25:0:b0:4d5:a689:7580 with SMTP id
 i5-20020ac25d25000000b004d5a6897580mr589859lfb.47.1682008891187; 
 Thu, 20 Apr 2023 09:41:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g6-20020ac25386000000b004edb2cb3500sm261298lfh.279.2023.04.20.09.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 09:41:30 -0700 (PDT)
Message-ID: <51d953d0-bd7f-1154-0241-89a2f62967e4@linaro.org>
Date: Thu, 20 Apr 2023 19:41:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dpu: always program DSC active bits
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1681490777-15351-1-git-send-email-quic_khsieh@quicinc.com>
 <zs762prrzv2geulwa7ztlolmxgldiyynk22m5ak4ejbyzbctrp@jprtanslko7c>
 <c2c0567a-8205-510d-bc0d-35b28dd64f70@linaro.org>
 <29df3564-ade2-fda2-1843-8438e7d01669@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <29df3564-ade2-fda2-1843-8438e7d01669@quicinc.com>
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
Cc: sean@poorly.run, vkoul@kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, andersson@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2023 19:40, Abhinav Kumar wrote:
> Hi Dmitry / Marijn
> 
> On 4/20/2023 7:03 AM, Dmitry Baryshkov wrote:
>> On 15/04/2023 02:02, Marijn Suijten wrote:
>>> On 2023-04-14 09:46:17, Kuogee Hsieh wrote:
>>>> In current code, the dsc active bits are set only if the cfg->dsc is 
>>>> set.
>>>
>>> This is the old sentence from v1 again, did you accidentally send the
>>> wrong patch as the improvements from v2 are missing?
>>>
>>>> However, for displays which are hot-pluggable, there can be a use-case
>>>> of disconnecting a DSC supported sink and connecting a non-DSC sink.
>>>>
>>>> For those cases we need to clear DSC active bits during teardown.
>>>
>>> At least teardown is one word again, v2 had "tear down" which is wrong.
>>>
>>>> As discuss at [1], clear DSC active bit will handled at 
>>>> reset_intf_cfg()
>>>
>>> discussed* as pointed out by Dmitry, and make it clear that this is
>>> about clearing CTL_DSC_ACTIVE (and CTL_DSC_FLUSH?) specifically.  Once
>>> that is moved to reset_intf_cfg(), this patch should be reverted as
>>> there is no need to write the registers once again when cfg->dsc equals
>>> 0.
>>
>> Kuogee, can we please get a proper v4? With all the relevant changes 
>> from v2, with the changelog, etc.
>>
>> Otherwise the present Reviewed-by tags are just incorrect.
>>
> 
> After looking into the DPU DSC changes internally which will be posted 
> today/tomm, that piece of code is again touching this block, so I am now 
> also not convinced this change should be made right now because it was 
> again touching flush programming, so that again leaves only the active 
> bits which as Marijn mentioned will be applicable for a use-case only 
> with hot-pluggable display which we dont have till we land DP DSC.
> 
> I think this is what we will do:
> 
> -> post DPU DSC changes
> -> post the patch to improve reset_intf_cfg() to handle DSC
> -> post rest of DP DSC changes
> -> post rest of DSI DSC changes
> 
> I think that way, we all are aligned.
> 
> Apologies for posting this patch a bit ahead of time but if i had 
> foreseen that DPU DSC changes will again touch the flush code, i would 
> have held this patch back too.

Ack, sounds good. Thank you.

> 
>>>
>>> - Marijn
>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
>>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>
>>>> [1] 
>>>> https://lore.kernel.org/linux-arm-msm/ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com/
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 +++----
>>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>> index bbdc95c..88e4efe 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>> @@ -541,10 +541,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>>>> dpu_hw_ctl *ctx,
>>>>       if (cfg->merge_3d)
>>>>           DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>>>                     BIT(cfg->merge_3d - MERGE_3D_0));
>>>> -    if (cfg->dsc) {
>>>> -        DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>>>> -        DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>>> -    }
>>>> +
>>>> +    DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>>>> +    DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>>>   }
>>>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>>>> -- 
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>>>> Forum,
>>>> a Linux Foundation Collaborative Project
>>>>
>>

-- 
With best wishes
Dmitry

