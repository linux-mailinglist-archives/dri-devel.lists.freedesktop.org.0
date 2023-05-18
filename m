Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7378A708BD7
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 00:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647A610E570;
	Thu, 18 May 2023 22:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B2B10E56F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 22:40:22 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f3a873476bso1082324e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 15:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684449620; x=1687041620;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/2NH++c4VhC9XWEVE5uzOsg61iCKWgGKssQQYMJ5/Ww=;
 b=MR6PaJ7ZWCYV1Br5FE3pGCk+ymATp+bNfKKJfm8GGb6QbtwINtwtK1sMG2ugMa9UFm
 L4nqRg6spkN9FwU2dPSnv4LPqNDOp9+Rt4XAwKk5gq8gV76yfCv2zeNRwm0UkBHwTu0C
 u/PWDpMhQqNgRT9TrlB+CrPiA9zDxfVgyB8+hlrjM3GebRssjaVoZ1tqPqpeyrFm9s3D
 Wuxc7pDV58duw4BB6ZkU80vaBuo9d6wy/93i9Stm/s7eVKK5Gg14t/IwL2PqSkfQRjaB
 N1OSZ5W4Lnn6rbkXKs/gX7TfAr7TbStf4JDytS7eKMSH8WbZre06qpwJfPZd6V4z6JYJ
 wjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684449620; x=1687041620;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2NH++c4VhC9XWEVE5uzOsg61iCKWgGKssQQYMJ5/Ww=;
 b=XpaPM9OK8Qlu7pl+fUTGBJgGjeqIgnp8wnF6gxkxmIC+n6z+nm7+adyZEZzhxLYhes
 olu0ByPFJuP10OjEwQ4nu+BX2PJQxfbcu8M+eFugXMSckmh7v4MfB7idMgTQZclN+7Xd
 PVGXiGCYwewlPpXqqacV1hH0Etz/wCCQU2vu1etojV6F88CK3P7lHIAsAdrYCsAo0JBY
 4X6GAdI+LTWF3GgGMG50ntePRUzSZ4E1icB1x+WdC7nxP6lwYKdDQ5wZPQdrm8fvF33c
 IIuqPdxrYQgpySeYr0voyGxD0hwjJMlbAihuOY7qBVd3RV0aScvHrcqCE0VPAaLMgkXf
 ACsQ==
X-Gm-Message-State: AC+VfDw0O8fHg10CfG1MgU6551wJGzrGLs/InTGrZX0/htFuypfhs2mg
 MbFHmDFl1GiNBAXCLi86XYRYlw==
X-Google-Smtp-Source: ACHHUZ4rOh18fVzYdVv7xzcUnLRINIeOIj4YN1jogDWq7DlSgW85yFdMNrqXWQMZSN+vB2XLFFpJwg==
X-Received: by 2002:ac2:4315:0:b0:4d5:a689:7580 with SMTP id
 l21-20020ac24315000000b004d5a6897580mr140353lfh.47.1684449620186; 
 Thu, 18 May 2023 15:40:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u9-20020ac248a9000000b004f00189e1dasm385760lfg.143.2023.05.18.15.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 May 2023 15:40:19 -0700 (PDT)
Message-ID: <b2fcc9f5-ca11-ab87-e40b-9c6d2662325b@linaro.org>
Date: Fri, 19 May 2023 01:40:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 6/8] drm/msm/dpu: separate DSC flush update out of
 interface
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-7-git-send-email-quic_khsieh@quicinc.com>
 <evkla3rkf4tge6gln4lgtulj7q5gt6vef3i2yqupc5lj2oszfx@7ttyxzlmvet5>
 <8e9feb23-a5f0-7cd8-ebff-8e9097ff0ca1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8e9feb23-a5f0-7cd8-ebff-8e9097ff0ca1@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2023 01:09, Kuogee Hsieh wrote:
> 
> On 5/17/2023 3:31 PM, Marijn Suijten wrote:
>>
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> @@ -139,6 +139,11 @@ static inline void 
>>> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>>                   CTL_DSPP_n_FLUSH(dspp - DSPP_0),
>>>                   ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>>>           }
>>> +
>>> +    if (ctx->pending_flush_mask & BIT(DSC_IDX))
>>> +        DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
>>> +                  ctx->pending_dsc_flush_mask);
>> Again, when do we reset this mask to 0?  (v8 review)
> 
> can not find it.
> 
> let me add a separate  patch to fix this.

The pending_dsc_flush_mask was added in this patch, so the reset should 
be a part of this patch too.

> 
>>
>>> +
>>>       DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>>>   }
>>> @@ -285,6 +290,13 @@ static void 
>>> dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>>>       ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
>>>   }
>>> +static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl 
>>> *ctx,
>>> +                           enum dpu_dsc dsc_num)
>>> +{
>>> +    ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
>>> +    ctx->pending_flush_mask |= BIT(DSC_IDX);
>>> +}
>>> +
>>>   static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl 
>>> *ctx,
>>>       enum dpu_dspp dspp, u32 dspp_sub_blk)
>>>   {
>>> @@ -502,9 +514,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>>> dpu_hw_ctl *ctx,
>>>       if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
>>>           mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>>> -    if (cfg->dsc)
>>> -        DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
>>> -
>>>       if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>>>           mode_sel |= BIT(17);
>>> @@ -524,10 +533,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>>> dpu_hw_ctl *ctx,
>>>       if (cfg->merge_3d)
>>>           DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>>                     BIT(cfg->merge_3d - MERGE_3D_0));
>>> -    if (cfg->dsc) {
>>> -        DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>> Again, this bugfix of now wrapping DSC_IDX in BIT() should go in a
>> separate Fixes: patch to have this semantic change documented.  (v8
>> review)
> That will be this patch. let me add Fixes at this patch

_separate_ patch.

>>
>>> +
>>> +    if (cfg->dsc)
>>>           DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>> -    }
>>>   }
>>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>>> @@ -630,6 +638,8 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops 
>>> *ops,
>>>           ops->update_pending_flush_merge_3d =
>>>               dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>>>           ops->update_pending_flush_wb = 
>>> dpu_hw_ctl_update_pending_flush_wb_v1;
>>> +        ops->update_pending_flush_dsc =
>>> +            dpu_hw_ctl_update_pending_flush_dsc_v1;
>>>       } else {
>>>           ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>>>           ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> index 6292002..d5f3ef8 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> @@ -158,6 +158,15 @@ struct dpu_hw_ctl_ops {
>>>           enum dpu_dspp blk, u32 dspp_sub_blk);
>>>       /**
>>> +     * OR in the given flushbits to the cached pending_(dsc_)flush_mask
>>> +     * No effect on hardware
>>> +     * @ctx: ctl path ctx pointer
>>> +     * @blk: interface block index
>>> +     */
>>> +    void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
>>> +        enum dpu_dsc blk);
>>> +
>>> +    /**
>>>        * Write the value of the pending_flush_mask to hardware
>>>        * @ctx       : ctl path ctx pointer
>>>        */
>>> @@ -229,6 +238,9 @@ struct dpu_hw_ctl_ops {
>>>    * @pending_flush_mask: storage for pending ctl_flush managed via ops
>>>    * @pending_intf_flush_mask: pending INTF flush
>>>    * @pending_wb_flush_mask: pending WB flush
>> The above is all capitalized, so...:
>>
>>> + * @pending_merge_3d_flush_mask: pending merge_3d flush
>> MERGE_3D?
>>
>>> + * @pending_dspp_flush_mask: pending dspp flush
>> DSPP
>>
>>> + * @pending_dsc_flush_mask: pending dsc flush
>> DSC
>>
>> - Marijn
>>
>>>    * @ops: operation list
>>>    */
>>>   struct dpu_hw_ctl {
>>> @@ -245,6 +257,7 @@ struct dpu_hw_ctl {
>>>       u32 pending_wb_flush_mask;
>>>       u32 pending_merge_3d_flush_mask;
>>>       u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>>> +    u32 pending_dsc_flush_mask;
>>>       /* ops */
>>>       struct dpu_hw_ctl_ops ops;
>>> -- 
>>> 2.7.4
>>>

-- 
With best wishes
Dmitry

