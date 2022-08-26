Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37BE5A26E5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 13:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B19710E824;
	Fri, 26 Aug 2022 11:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9637310E824
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 11:32:27 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id n24so1275796ljc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 04:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=J+IIMRDzeOQUmvsFpcPFuxHJ3tLRpUbFCIuX7Vmx5pY=;
 b=yujZ3GH+/OBCkV0B7NfSHwhLhkthQn2Zc4tYPfTwt5s7KBxKVgHjhRZ1afdvb0nky5
 vbH1iDiChC+In301Mbhzc660y6StH01c9P3t06i0ToVPmIpM4FUqi5hG2KulqLWBqiNB
 lEd1KqLQyO1Ci+2UIegn7yjVYX9a5R723toE6JJvLjFrE6WMYY96Bhyj4iGv11DyZ5lS
 k3oo6Y8hGPj6s3MJGqIKGVqJf9dhgesVkhrnybYsop80a3UpUUKRzhU5Jk0i7tCCe1UD
 mSIJiPyo2ZKNm2wan3zUPy3CqBn4qod40rvyo0HA2wpkUsmr6/6JFTX3HVxBHxqYj3RQ
 j3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=J+IIMRDzeOQUmvsFpcPFuxHJ3tLRpUbFCIuX7Vmx5pY=;
 b=WyGwZkH7twscE/Yb17JEf4vN/iouylzeduR6Zxwh0r90UY9oR8AxNUWj7bhxARcMlU
 dnpGu6fmhBMw0EU0IYVjsiYbIowUglr0W4kJ97BnJxU5Y4+1opJ6m1hQUr9FiCSZdBrS
 OPUuEPkPyoBZS4PDU69jbOTRSSLkAzxj08PJJ2cVO2wxlrw2TDitVABmgZX95HKDQq4j
 l4MlQuFwryjC++7fCDzpg9bFJGY9bCILQD3PJFhh1n+hS8Y7B9g5JmrMMniSTzadZy8j
 /eYjag32OhkHiu5eafv7tNN2dBbTyqLPLXUMP2+xMI5ubS/PMAVLygLD74B+c8SFPu6s
 5gaQ==
X-Gm-Message-State: ACgBeo34OLujLUBRQMUEYqQfzYHYzfn+AXh1lrLmoev/aK61RLWzhgR0
 +KKoWJqZ9F+6l5blEAJS0OELsw==
X-Google-Smtp-Source: AA6agR4Or5cjF3qaAbm6qzfcPGqJioUPPnGX7E1m+3N79wQRvjUtpfZrhXK6r5CeRCgL4akruiF7TQ==
X-Received: by 2002:a2e:a551:0:b0:25f:eb63:2588 with SMTP id
 e17-20020a2ea551000000b0025feb632588mr2285415ljn.9.1661513545700; 
 Fri, 26 Aug 2022 04:32:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a0565120b1500b0048af9d2d119sm355961lfu.130.2022.08.26.04.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 04:32:25 -0700 (PDT)
Message-ID: <04d77534-e2b5-b860-a59e-e1a511ed35ae@linaro.org>
Date: Fri, 26 Aug 2022 14:32:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [v1] drm/msm/disp/dpu1: add support for hierarchical flush for
 dspp in sc7280
Content-Language: en-GB
To: Kalyan Thota <kalyant@qti.qualcomm.com>,
 "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>
References: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
 <CAA8EJpoAN4CVMKNouh3pPtX-5rnBeL3_T60M5cNhirNEmNeEkQ@mail.gmail.com>
 <BN0PR02MB8142FFB573A4D05B0560A13996639@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BN0PR02MB8142FFB573A4D05B0560A13996639@BN0PR02MB8142.namprd02.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/08/2022 13:44, Kalyan Thota wrote:
> 
> 
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Thursday, August 4, 2022 9:29 PM
>> To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>
>> Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; robdclark@gmail.com; dianders@chromium.org;
>> swboyd@chromium.org; Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>;
>> Abhinav Kumar (QUIC) <quic_abhinavk@quicinc.com>
>> Subject: Re: [v1] drm/msm/disp/dpu1: add support for hierarchical flush for dspp
>> in sc7280
>>
>> WARNING: This email originated from outside of Qualcomm. Please be wary of
>> any links or attachments, and do not enable macros.
>>
>> On Thu, 4 Aug 2022 at 13:29, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>>>
>>> Flush mechanism for DSPP blocks has changed in sc7280 family, it
>>> allows individual sub blocks to be flushed in coordination with master
>>> flush control.
>>>
>>> representation: master_flush && (PCC_flush | IGC_flush .. etc )
>>>
>>> This change adds necessary support for the above design.
>>>
>>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>>
>> I'd like to land at least patches 6-8 from [1] next cycle. They clean up the CTL
>> interface. Could you please rebase your patch on top of them?
>>
> 
> Sure I'll wait for the series to rebase. @Doug can you comment if this is okay and this patch is not needed immediately ?

The respective patches have been picked up for 6.1 and were pushed to 
https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag . Could you 
please rebase your patch on top of them?

All other comments also needs addressing.

> 
>> [1] https://patchwork.freedesktop.org/series/99909/
>>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  4 +++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 +++-
>>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 40
>> +++++++++++++++++++++++++-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  3 ++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |  7 +++++
>>>   6 files changed, 59 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index 7763558..4eca317 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -703,6 +703,10 @@ static void _dpu_crtc_setup_cp_blocks(struct
>> drm_crtc *crtc)
>>>                  mixer[i].flush_mask |= ctl->ops.get_bitmask_dspp(ctl,
>>>                          mixer[i].hw_dspp->idx);
>>>
>>> +               if(ctl->ops.set_dspp_hierarchical_flush)
>>> +                       ctl->ops.set_dspp_hierarchical_flush(ctl,
>>> +                                               mixer[i].hw_dspp->idx,
>>> + DSPP_SUB_PCC);
>>> +
>>>                  /* stage config flush mask */
>>>                  ctl->ops.update_pending_flush(ctl,
>>> mixer[i].flush_mask);
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 021eb2f..3b27a87 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -58,7 +58,10 @@
>>>          (PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>>>
>>>   #define CTL_SC7280_MASK \
>>> -       (BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) |
>> BIT(DPU_CTL_VM_CFG))
>>> +       (BIT(DPU_CTL_ACTIVE_CFG) | \
>>> +        BIT(DPU_CTL_FETCH_ACTIVE) | \
>>> +        BIT(DPU_CTL_VM_CFG) | \
>>> +        BIT(DPU_CTL_HIERARCHICAL_FLUSH))
>>>
>>>   #define MERGE_3D_SM8150_MASK (0)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index b85b24b..7922f6c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -185,6 +185,7 @@ enum {
>>>    * @DPU_CTL_SPLIT_DISPLAY:     CTL supports video mode split display
>>>    * @DPU_CTL_FETCH_ACTIVE:      Active CTL for fetch HW (SSPPs)
>>>    * @DPU_CTL_VM_CFG:            CTL config to support multiple VMs
>>> + * @DPU_CTL_HIERARCHICAL_FLUSH: CTL config to support hierarchical
>>> + flush
>>>    * @DPU_CTL_MAX
>>>    */
>>>   enum {
>>> @@ -192,6 +193,7 @@ enum {
>>>          DPU_CTL_ACTIVE_CFG,
>>>          DPU_CTL_FETCH_ACTIVE,
>>>          DPU_CTL_VM_CFG,
>>> +       DPU_CTL_HIERARCHICAL_FLUSH,
>>>          DPU_CTL_MAX
>>>   };
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> index 3584f5e..b34fc30 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> @@ -28,6 +28,8 @@
>>>   #define   CTL_INTF_FLUSH                0x110
>>>   #define   CTL_INTF_MASTER               0x134
>>>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
>>> +#define   CTL_DSPP_0_FLUSH             0x13C
>>
>> Please change to CTL_DSPP_n_FLUSH(n).
>>
>>> +
>>>
>>>   #define CTL_MIXER_BORDER_OUT            BIT(24)
>>>   #define CTL_FLUSH_MASK_CTL              BIT(17)
>>> @@ -292,6 +294,36 @@ static uint32_t dpu_hw_ctl_get_bitmask_dspp(struct
>> dpu_hw_ctl *ctx,
>>>          return flushbits;
>>>   }
>>>
>>> +static uint32_t dpu_hw_ctl_get_bitmask_dspp_v1(struct dpu_hw_ctl *ctx,
>>> +       enum dpu_dspp dspp)
>>> +{
>>> +       return BIT(29);
>>> +}
>>> +
>>> +static void dpu_hw_ctl_set_dspp_hierarchical_flush(struct dpu_hw_ctl *ctx,
>>> +       enum dpu_dspp dspp, enum dpu_dspp_sub_blk dspp_sub_blk) {
>>> +       uint32_t flushbits = 0, active = 0;
>>> +
>>> +       switch (dspp_sub_blk) {
>>> +       case DSPP_SUB_IGC:
>>> +               flushbits = BIT(2);
>>> +               break;
>>> +       case DSPP_SUB_PCC:
>>> +               flushbits = BIT(4);
>>> +               break;
>>> +       case DSPP_SUB_GC:
>>> +               flushbits = BIT(5);
>>> +               break;
>>> +       default:
>>> +               return;
>>> +       }
>>> +
>>> +       active = DPU_REG_READ(&ctx->hw, CTL_DSPP_0_FLUSH + ((dspp - 1)
>>> + * 4));
>>
>> So that this line will be simpler to read.
>>
>>> +
>>> +       DPU_REG_WRITE(&ctx->hw, CTL_DSPP_0_FLUSH + ((dspp - 1) * 4),
>>> +active | flushbits); }
>>> +
>>>   static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32
>>> timeout_us)  {
>>>          struct dpu_hw_blk_reg_map *c = &ctx->hw; @@ -600,7 +632,13 @@
>>> static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>>>          ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
>>>          ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
>>>          ops->get_bitmask_mixer = dpu_hw_ctl_get_bitmask_mixer;
>>> -       ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
>>> +       if (cap & BIT(DPU_CTL_HIERARCHICAL_FLUSH)) {
>>> +               ops->get_bitmask_dspp =
>>> + dpu_hw_ctl_get_bitmask_dspp_v1;
>>
>> We have used _v1 for active CTLs. What is the relationship between
>> CTL_HIERARCHILCAL_FLUSH and active CTLs?
> Active CTL design replaces legacy CTL_MEM_SEL, CTL_OUT_SEL registers in grouping the resources such as WB, INTF, pingpong, DSC etc into the data path
> DSPP hierarchical flush will gives us a finer control on which post processing blocks to be flushed as part of the composition ( like IGC, PCC, GC .. etc )
> These blocks are contained in DSPP package.

So, I assume that hierarchical DSPP flush does not exist on non-active 
CTL SoCs. Which supported SoCs do support the hierarchichal DSPP flush?

>>
>>> +               ops->set_dspp_hierarchical_flush =
>> dpu_hw_ctl_set_dspp_hierarchical_flush;
>>> +       } else {
>>> +               ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
>>> +       }
>>> +
>>>          if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
>>>                  ops->set_active_pipes =
>>> dpu_hw_ctl_set_fetch_pipe_active;  }; diff --git
>>> a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> index ac15444..8ecab91 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> @@ -160,6 +160,9 @@ struct dpu_hw_ctl_ops {
>>>          uint32_t (*get_bitmask_dspp)(struct dpu_hw_ctl *ctx,
>>>                  enum dpu_dspp blk);
>>>
>>> +       void (*set_dspp_hierarchical_flush)(struct dpu_hw_ctl *ctx,
>>> +               enum dpu_dspp blk, enum dpu_dspp_sub_blk
>>> + dspp_sub_blk);
>>
>> The word "hierarchical" means particular (internal) implementation.
>> Please change to something like set_dspp_block_flush().
>> Or with [2] in place, it can be hidden in the
>> update_pending_flush_dspp() function. Just pass the subblock to the function and
>> let the dpu_hw_ctl care about it.
>>
>> [2] https://patchwork.freedesktop.org/patch/473159/?series=99909&rev=1
>>
>>
>>> +
>>>          /**
>>>           * Set all blend stages to disabled
>>>           * @ctx       : ctl path ctx pointer
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>> index bb9cead..561e2ab 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>> @@ -166,6 +166,13 @@ enum dpu_dspp {
>>>          DSPP_MAX
>>>   };
>>>
>>> +enum dpu_dspp_sub_blk{
>>> +       DSPP_SUB_PCC = 1,
>>> +       DSPP_SUB_IGC,
>>> +       DSPP_SUB_GC,
>>> +       DSPP_SUB_MAX
>>> +};
>>
>> I'd prefer if we can use DPU_DSPP_* definitions instead.
>>
>>> +
>>>   enum dpu_ctl {
>>>          CTL_0 = 1,
>>>          CTL_1,
>>
>>
>>
>> --
>> With best wishes
>> Dmitry

-- 
With best wishes
Dmitry

