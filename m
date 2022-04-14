Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9189501F02
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 01:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0476A10E882;
	Thu, 14 Apr 2022 23:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AD110E882
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 23:25:37 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id bj36so1972423ljb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9ZvEYU0vxJvz9uqzPh/tUGMPI5vXR1B+mizjBt8OEwU=;
 b=aTG+OjHs7hU3a4mId+AywvEJ9TqkL63HP0t9dF9uJIcSUDa4kBnNz3PRt3ix1h+T7I
 SAVbZybJhBHUvfyVFehDsErfd5/LSE90PIX1Kukh08aKicqHN2NFA9MBKQQ+/Vt/F83n
 dFi3Pwu/lFZsJrcX35dfaJsFWm2i+r6TFamLyKLkAq8iqXdXBP+rNn6Ztq9fgrfAZOns
 aUvIfGsW8jcy4k2ml3jQ60LEZdFAAiS1pVwkCi1zK9xTRIBuBxh0LJidXdgCStY1yeMq
 HIh7JadCZp/asi6WUDt3jSNjXbJGmFkXUaWkbznSLoulM3BWAIISeyZHLIaouV0Wc40X
 G8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9ZvEYU0vxJvz9uqzPh/tUGMPI5vXR1B+mizjBt8OEwU=;
 b=BHeGC3otnlJgB3+Gp5eiNfcgBHt5RmGdDYv++g8CKxdo8PVpt+/hkXkim/6K1uFiKS
 n+7umpewTbMpwfYtCZDxrpjZkJ8gElqSMJnuiVYgW8u4CLOjmuYHATZv01aULjuFjsl2
 TmIjizfI2nqKw4f4B2Xyf3yxlx1jjmeIv9voTWe1AQh5/D2gRO38idR0iQqGLeDbvLvm
 tjUGVIo/benRTk07QWKRkuy1Bq7JGoQHS6im/SuCAzLlP9AHXC/ptrLNNkW6Wug9eGwV
 8FTCHXdgrmiMnizX0mj/WpZ3p+9ibvbTZBYI2cX+ghQhkTino6yULTfH3VyyuxSQA79K
 JnWg==
X-Gm-Message-State: AOAM533fV77PMrxERT0ju1dOez520XXVBBRwYyXo2xR+tBFQeMW22S60
 AvpcIL2W3sNniA3W4Ypfgsr2+Q==
X-Google-Smtp-Source: ABdhPJwX85Wrfw1tJKe72qGT6n+Boplsm2TRWwotdryjFFiMXURn8WKtYe6tUIMcpRMOCX/8VL/SbA==
X-Received: by 2002:a2e:9e10:0:b0:24b:5cb5:867c with SMTP id
 e16-20020a2e9e10000000b0024b5cb5867cmr2980675ljk.401.1649978735042; 
 Thu, 14 Apr 2022 16:25:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a0565123b9000b0044aa30cb30bsm137605lfv.285.2022.04.14.16.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 16:25:34 -0700 (PDT)
Message-ID: <3ab5d831-29d1-9ea8-27d7-877cf6411227@linaro.org>
Date: Fri, 15 Apr 2022 02:25:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 04/12] drm/msm/dpu: add changes to support writeback in
 hw_ctl
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-5-git-send-email-quic_abhinavk@quicinc.com>
 <7743d896-7727-3e27-d436-9212a247961f@linaro.org>
 <9448c67f-efd2-ea61-a4aa-35073359d8f2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9448c67f-efd2-ea61-a4aa-35073359d8f2@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/04/2022 00:50, Abhinav Kumar wrote:
> 
> 
> On 2/4/2022 2:19 PM, Dmitry Baryshkov wrote:
>> On 05/02/2022 00:17, Abhinav Kumar wrote:
>>> Add changes to support writeback module in the dpu_hw_ctl
>>> interface. In addition inroduce a reset_intf_cfg op to reset
>>> the interface bits for the currently active interfaces in
>>> the ctl path.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  3 +-
>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  6 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 65 
>>> ++++++++++++++++++++--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 27 ++++++++-
>>>   4 files changed, 91 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index 34a6940..4cb72fa 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -1,5 +1,6 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>   /*
>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>>    * Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All 
>>> rights reserved.
>>>    */
>>> @@ -70,7 +71,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>       intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>>>       intf_cfg.stream_sel = cmd_enc->stream_sel;
>>>       intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>> -    ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>>> +    ctl->ops.setup_intf_cfg(ctl, &intf_cfg, false);
>>>   }
>>>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int 
>>> irq_idx)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> index ddd9d89..950fcd6 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> @@ -1,5 +1,7 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>> -/* Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All 
>>> rights reserved.
>>> +/*
>>> + *  Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + *  Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All 
>>> rights reserved.
>>>    */
>>>   #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>>> @@ -290,7 +292,7 @@ static void 
>>> dpu_encoder_phys_vid_setup_timing_engine(
>>>       spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>>>       phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
>>>               &timing_params, fmt);
>>> -    phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
>>> +    phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, 
>>> &intf_cfg, false);
>>>       /* setup which pp blk will connect to this intf */
>>>       if (phys_enc->hw_intf->ops.bind_pingpong_blk)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> index 02da9ec..a2069af 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> @@ -1,5 +1,6 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>> +/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>    */
>>>   #include <linux/delay.h>
>>> @@ -23,8 +24,10 @@
>>>   #define   CTL_SW_RESET                  0x030
>>>   #define   CTL_LAYER_EXTN_OFFSET         0x40
>>>   #define   CTL_MERGE_3D_ACTIVE           0x0E4
>>> +#define   CTL_WB_ACTIVE                 0x0EC
>>>   #define   CTL_INTF_ACTIVE               0x0F4
>>>   #define   CTL_MERGE_3D_FLUSH            0x100
>>> +#define   CTL_WB_FLUSH                  0x108
>>>   #define   CTL_INTF_FLUSH                0x110
>>>   #define   CTL_INTF_MASTER               0x134
>>>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
>>> @@ -35,6 +38,7 @@
>>>   #define DPU_REG_RESET_TIMEOUT_US        2000
>>>   #define  MERGE_3D_IDX   23
>>>   #define  INTF_IDX       31
>>> +#define WB_IDX          16
>>>   #define CTL_INVALID_BIT                 0xffff
>>>   #define CTL_DEFAULT_GROUP_ID        0xf
>>> @@ -128,6 +132,9 @@ static inline void 
>>> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>>       if (ctx->pending_flush_mask & BIT(INTF_IDX))
>>>           DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
>>>                   ctx->pending_intf_flush_mask);
>>> +    if (ctx->pending_flush_mask & BIT(WB_IDX))
>>> +        DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
>>> +                ctx->pending_wb_flush_mask);
>>>       DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>>>   }
>>> @@ -248,6 +255,13 @@ static void 
>>> dpu_hw_ctl_update_pending_flush_intf(struct dpu_hw_ctl *ctx,
>>>       }
>>>   }
>>> +static void dpu_hw_ctl_update_pending_flush_wb_v1(struct dpu_hw_ctl 
>>> *ctx,
>>> +        enum dpu_wb wb)
>>> +{
>>> +    ctx->pending_wb_flush_mask |= BIT(wb - WB_0);
>>> +    ctx->pending_flush_mask |= BIT(WB_IDX);
>>> +}
>>> +
>>>   static void dpu_hw_ctl_update_pending_flush_intf_v1(struct 
>>> dpu_hw_ctl *ctx,
>>>           enum dpu_intf intf)
>>>   {
>>> @@ -493,10 +507,11 @@ static void dpu_hw_ctl_setup_blendstage(struct 
>>> dpu_hw_ctl *ctx,
>>>   static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>> -        struct dpu_hw_intf_cfg *cfg)
>>> +        struct dpu_hw_intf_cfg *cfg, bool is_wb)
>>>   {
>>>       struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>>       u32 intf_active = 0;
>>> +    u32 wb_active = 0;
>>>       u32 mode_sel = 0;
>>>       /* CTL_TOP[31:28] carries group_id to collate CTL paths
>>> @@ -509,18 +524,25 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>>> dpu_hw_ctl *ctx,
>>>       if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>>>           mode_sel |= BIT(17);
>>> -    intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>>> -    intf_active |= BIT(cfg->intf - INTF_0);
>>> +    if (!is_wb) {
>>
>> I think we can judge if it is an INTF of WB by checking the cfg->intf 
>> and cfg->wb, thus the is_wb argument is not needed.
> 
> cfg->intf and cfg->wb are enums storing what is the index of the current 
> WB being used.
> 
> If both intf and wb are used (which is possible) and if both have been 
> configured before calling this function cfg->intf and cfg->wb will be 
> valid so we cannot distinguish for which one we called this function for 
> and can end up programming both.

First of all, I think cloning CRTCs is not supported by the msm driver 
at this moment (yet), so it's not possible to share the same crtc (and 
so the same ctl) between INTF and WB.

Next, for each encoder the cfg is recreated from the empty struct. Thus 
INTF's encoder will pass a struct with only cfg->intf being set and WB's 
encoder will pass a struct with cfg->wb being set.

> 
> intf calls its own dpu_hw_ctl_intf_cfg_v1 and wb calls its own.
> 
> So i thought its better to check who is the caller of this before 
> configuring the block for the caller.
> 
> Let me know if now it makes sense to have a "is_wb" or this can be 
> covered differently.
> 
>>
>>> +        intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>>> +        intf_active |= BIT(cfg->intf - INTF_0) > +    } else {
>>> +        wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
>>> +        wb_active = BIT(cfg->wb - WB_0);
>>
>> wb_active |= BIT(...) ?
> ack
>>
>>> +    }
>>>       DPU_REG_WRITE(c, CTL_TOP, mode_sel);
>>>       DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>>> +    DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>>> +
>>>       if (cfg->merge_3d)
>>>           DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>>                     BIT(cfg->merge_3d - MERGE_3D_0));
>>>   }
>>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>>> -        struct dpu_hw_intf_cfg *cfg)
>>> +        struct dpu_hw_intf_cfg *cfg, bool is_wb)
>>>   {
>>>       struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>>       u32 intf_cfg = 0;
>>> @@ -532,6 +554,9 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl 
>>> *ctx,
>>>           intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>>>       }
>>> +    if (is_wb)
>>> +        intf_cfg |= (cfg->wb & 0x3) + 2;
>>> +
>>>       switch (cfg->intf_mode_sel) {
>>>       case DPU_CTL_MODE_SEL_VID:
>>>           intf_cfg &= ~BIT(17);
>>> @@ -549,6 +574,34 @@ static void dpu_hw_ctl_intf_cfg(struct 
>>> dpu_hw_ctl *ctx,
>>>       DPU_REG_WRITE(c, CTL_TOP, intf_cfg);
>>>   }
>>> +static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>>> +    struct dpu_hw_intf_cfg *cfg, bool is_wb)
>>
>> Could you please be more specific here (or in the documentation 
>> comment bellow), what exactly is reset? For example the merge3d config 
>> is left intact.
> 
> Looks like I have made some mistake in the reset logic. we should have 
> reset the merge_3d block. The goal is the reset the WB related pipeline.
> Let me fix this code in the next version and it will be more clear.
> Will update the doc too.
> 
>>
>>> +{
>>> +    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>> +    u32 intf_active = 0;
>>> +    u32 wb_active = 0;
>>> +    u32 merge3d_active = 0;
>>> +
>>> +    if (cfg->merge_3d) {
>>> +        merge3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
>>> +        DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>> +                  BIT(cfg->merge_3d - MERGE_3D_0));
>>> +    }
>>> +
>>> +    dpu_hw_ctl_clear_all_blendstages(ctx);
>>> +
>>> +    if (!is_wb) {
>>> +        intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>>> +        intf_active &= ~BIT(cfg->intf - INTF_0);
>>> +        DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>>> +    } else {
>>> +        wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
>>> +        wb_active &= ~BIT(cfg->wb - WB_0);
>>> +        DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>>> +    }
>>
>> The same comment as for the setup_intf_cfg(). Also can we just write 
>> both CTL_INTF_ACTIVE and CTL_WB_ACTIVE to 0?
> 
> We want to clear only the INTF OR WB for which this cfg was called with.
> So we should only clear that bit.

Then it would be better to call this function "disable" rather than 
reset. Because I'd assume that reset_ would reset the whole CTL 
configuration.

And last, but not least, I think you should also clear INTF_MASTER if it 
is set to be equal to the cfg->intf.


> 
>>
>>> +}
>>> +
>>> +
>>>   static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
>>>       unsigned long *fetch_active)
>>>   {
>>> @@ -572,10 +625,12 @@ static void _setup_ctl_ops(struct 
>>> dpu_hw_ctl_ops *ops,
>>>       if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
>>>           ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
>>>           ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
>>> +        ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
>>>           ops->update_pending_flush_intf =
>>>               dpu_hw_ctl_update_pending_flush_intf_v1;
>>>           ops->update_pending_flush_merge_3d =
>>>               dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>>> +        ops->update_pending_flush_wb = 
>>> dpu_hw_ctl_update_pending_flush_wb_v1;
>>>       } else {

Do we also need to provide reset_intf_cfg for non-active CTLs?

I think the whole reset_intf_cfg warrants a separate commit (or series 
of commits). Then this patch would have just the "add a touch of WB" to 
existing function.

>>>           ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>>>           ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> index 806c171..fb4baca 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> @@ -1,5 +1,6 @@
>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>> +/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>    */
>>>   #ifndef _DPU_HW_CTL_H
>>> @@ -43,6 +44,7 @@ struct dpu_hw_stage_cfg {
>>>    */
>>>   struct dpu_hw_intf_cfg {
>>>       enum dpu_intf intf;
>>> +    enum dpu_wb wb;
>>>       enum dpu_3d_blend_mode mode_3d;
>>>       enum dpu_merge_3d merge_3d;
>>>       enum dpu_ctl_mode_sel intf_mode_sel;
>>> @@ -93,6 +95,15 @@ struct dpu_hw_ctl_ops {
>>>           u32 flushbits);
>>>       /**
>>> +     * OR in the given flushbits to the cached pending_(wb_)flush_mask
>>> +     * No effect on hardware
>>> +     * @ctx       : ctl path ctx pointer
>>> +     * @blk       : writeback block index
>>> +     */
>>> +    void (*update_pending_flush_wb)(struct dpu_hw_ctl *ctx,
>>> +        enum dpu_wb blk);
>>> +
>>> +    /**
>>>        * OR in the given flushbits to the cached 
>>> pending_(intf_)flush_mask
>>>        * No effect on hardware
>>>        * @ctx       : ctl path ctx pointer
>>> @@ -127,9 +138,19 @@ struct dpu_hw_ctl_ops {
>>>        * Setup ctl_path interface config
>>>        * @ctx
>>>        * @cfg    : interface config structure pointer
>>> +     * @is_wb  : to indicate wb mode for programming the ctl path
>>>        */
>>>       void (*setup_intf_cfg)(struct dpu_hw_ctl *ctx,
>>> -        struct dpu_hw_intf_cfg *cfg);
>>> +        struct dpu_hw_intf_cfg *cfg, bool is_wb);
>>> +
>>> +    /**
>>> +     * reset ctl_path interface config
>>> +     * @ctx
>>> +     * @cfg    : interface config structure pointer
>>> +     * @is_wb  : to indicate wb mode for programming the ctl path
>>> +     */
>>> +    void (*reset_intf_cfg)(struct dpu_hw_ctl *ctx,
>>> +        struct dpu_hw_intf_cfg *cfg, bool is_wb);
>>>       int (*reset)(struct dpu_hw_ctl *c);
>>> @@ -182,6 +203,7 @@ struct dpu_hw_ctl_ops {
>>>    * @mixer_hw_caps: mixer hardware capabilities
>>>    * @pending_flush_mask: storage for pending ctl_flush managed via ops
>>>    * @pending_intf_flush_mask: pending INTF flush
>>> + * @pending_wb_flush_mask: pending WB flush
>>>    * @ops: operation list
>>>    */
>>>   struct dpu_hw_ctl {
>>> @@ -195,6 +217,7 @@ struct dpu_hw_ctl {
>>>       const struct dpu_lm_cfg *mixer_hw_caps;
>>>       u32 pending_flush_mask;
>>>       u32 pending_intf_flush_mask;
>>> +    u32 pending_wb_flush_mask;
>>>       u32 pending_merge_3d_flush_mask;
>>>       /* ops */
>>
>>


-- 
With best wishes
Dmitry
