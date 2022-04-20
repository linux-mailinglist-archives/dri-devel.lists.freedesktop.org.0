Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85689508E43
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 19:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4A310E1F1;
	Wed, 20 Apr 2022 17:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065D510E1F1;
 Wed, 20 Apr 2022 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650474976; x=1682010976;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9el7ViATUm9sQlmFHtNu03SiQSLKn12tMGJ43N/HYLw=;
 b=O5+V1YocRYEMq1Q1PMUlzJtUnlN2/McdBUIxCR8uAnsS8AmBl8E73Zz5
 MNSpOjCD/tS1gv/YO3fyKLUzkICnOqqMqMsbvzeo03c4PtMNkaVnaOhT7
 whTqy8RrSlXm4yGDDjVfC6nBnoGr1rVYcY4k+DCnv98PeTM+xvM/VihPW Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Apr 2022 10:16:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:16:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 10:16:14 -0700
Received: from [10.111.175.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 20 Apr
 2022 10:16:12 -0700
Message-ID: <d28391b7-a5eb-d314-005f-15fa5151179f@quicinc.com>
Date: Wed, 20 Apr 2022 10:16:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 08/17] drm/msm/dpu: add changes to support writeback in
 hw_ctl
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-9-git-send-email-quic_abhinavk@quicinc.com>
 <9e89aa11-40aa-0ce9-4747-c7894ba79050@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <9e89aa11-40aa-0ce9-4747-c7894ba79050@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/19/2022 11:59 PM, Dmitry Baryshkov wrote:
> On 20/04/2022 04:46, Abhinav Kumar wrote:
>> Add changes to support writeback module in the dpu_hw_ctl
>> interface.
>>
>> changes in v2:
>>     - keep only the wb specific changes to reset_intf_cfg
>>     - use cfg->intf / cfg->wb to identify intf or wb
>>     - use bit-wise OR for the wb bits while programming
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 43 
>> +++++++++++++++++++++++++++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 15 ++++++++++-
>>   2 files changed, 53 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index 524f024..495a9cd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>> +/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>    */
>>   #include <linux/delay.h>
>> @@ -23,10 +24,12 @@
>>   #define   CTL_SW_RESET                  0x030
>>   #define   CTL_LAYER_EXTN_OFFSET         0x40
>>   #define   CTL_MERGE_3D_ACTIVE           0x0E4
>> +#define   CTL_WB_ACTIVE                 0x0EC
>>   #define   CTL_INTF_ACTIVE               0x0F4
>>   #define   CTL_MERGE_3D_FLUSH            0x100
>>   #define   CTL_DSC_ACTIVE                0x0E8
>>   #define   CTL_DSC_FLUSH                0x104
>> +#define   CTL_WB_FLUSH                  0x108
>>   #define   CTL_INTF_FLUSH                0x110
>>   #define   CTL_INTF_MASTER               0x134
>>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
>> @@ -38,6 +41,7 @@
>>   #define  MERGE_3D_IDX   23
>>   #define  DSC_IDX        22
>>   #define  INTF_IDX       31
>> +#define WB_IDX          16
>>   #define CTL_INVALID_BIT                 0xffff
>>   #define CTL_DEFAULT_GROUP_ID        0xf
>> @@ -135,6 +139,9 @@ static inline void 
>> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>       if (ctx->pending_flush_mask & BIT(INTF_IDX))
>>           DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
>>                   ctx->pending_intf_flush_mask);
>> +    if (ctx->pending_flush_mask & BIT(WB_IDX))
>> +        DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
>> +                ctx->pending_wb_flush_mask);
>>       DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>>   }
>> @@ -255,6 +262,13 @@ static void 
>> dpu_hw_ctl_update_pending_flush_intf(struct dpu_hw_ctl *ctx,
>>       }
>>   }
>> +static void dpu_hw_ctl_update_pending_flush_wb_v1(struct dpu_hw_ctl 
>> *ctx,
>> +        enum dpu_wb wb)
>> +{
>> +    ctx->pending_wb_flush_mask |= BIT(wb - WB_0);
>> +    ctx->pending_flush_mask |= BIT(WB_IDX);
>> +}
>> +
>>   static void dpu_hw_ctl_update_pending_flush_intf_v1(struct 
>> dpu_hw_ctl *ctx,
>>           enum dpu_intf intf)
>>   {
>> @@ -504,6 +518,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>> dpu_hw_ctl *ctx,
>>   {
>>       struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>       u32 intf_active = 0;
>> +    u32 wb_active = 0;
>>       u32 mode_sel = 0;
>>       /* CTL_TOP[31:28] carries group_id to collate CTL paths
>> @@ -519,11 +534,20 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>> dpu_hw_ctl *ctx,
>>       if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>>           mode_sel |= BIT(17);
>> -    intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>> -    intf_active |= BIT(cfg->intf - INTF_0);
>> +    if (cfg->intf) {
>> +        intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>> +        intf_active |= BIT(cfg->intf - INTF_0);
>> +    }
>> +
>> +    if (cfg->wb) {
>> +        wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
>> +        wb_active |= BIT(cfg->wb - WB_0);
>> +    }
>>       DPU_REG_WRITE(c, CTL_TOP, mode_sel);
>>       DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>> +    DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
> 
> This will not work as expected. If cfg->intf is not set, CTL_INTF_ACTIVE 
> will be reset to 0 (while it should have been retained). Please change 
> this to always read CTL_INTF_ACTIVE/CTL_WB_ACTIVE.

ack, and thanks for catching this.
Yes, i need to add the always read part back.

> 
>> +
>>       if (cfg->merge_3d)
>>           DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>                     BIT(cfg->merge_3d - MERGE_3D_0));
>> @@ -546,6 +570,9 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl 
>> *ctx,
>>           intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>>       }
>> +    if (cfg->wb)
>> +        intf_cfg |= (cfg->wb & 0x3) + 2;
>> +
> 
> Ugh. I see that we have the same code in downstream driver. And that we 
> do not support WB_0 at all. But maybe we should be more explicit here.

Sorry, I didnt follow this comment. Why is this related to WB_0?

All this code is doing is that its programming the lower bits of CTL_TOP 
register to be used for WB mode.

The correct value of this register for linear wb mode which we use is 0x5.

Which will still be correct now because cfg->wb will be 0x3.

Coming to other non-WB_2 values, this code is still correct.

Lets say cfg->wb was 0x1 ( for WB_0), then the register will be 
programmed to 0x3 which is the correct value to use because then we will 
be using rotation and not linear writeback.

Perhaps, you need a comment here to explain this?

> 
>>       switch (cfg->intf_mode_sel) {
>>       case DPU_CTL_MODE_SEL_VID:
>>           intf_cfg &= ~BIT(17);
>> @@ -568,12 +595,13 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct 
>> dpu_hw_ctl *ctx,
>>   {
>>       struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>       u32 intf_active = 0;
>> +    u32 wb_active = 0;
>>       u32 merge3d_active = 0;
>>       /*
>>        * This API resets each portion of the CTL path namely,
>>        * clearing the sspps staged on the lm, merge_3d block,
>> -     * interfaces etc to ensure clean teardown of the pipeline.
>> +     * interfaces , writeback etc to ensure clean teardown of the 
>> pipeline.
>>        * This will be used for writeback to begin with to have a
>>        * proper teardown of the writeback session but upon further
>>        * validation, this can be extended to all interfaces.
>> @@ -592,6 +620,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct 
>> dpu_hw_ctl *ctx,
>>           intf_active &= ~BIT(cfg->intf - INTF_0);
>>           DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>>       }
>> +
>> +    if (cfg->wb) {
>> +        wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
>> +        wb_active &= ~BIT(cfg->wb - WB_0);
>> +        DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>> +    }
>>   }
>>   static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
>> @@ -622,6 +656,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops 
>> *ops,
>>               dpu_hw_ctl_update_pending_flush_intf_v1;
>>           ops->update_pending_flush_merge_3d =
>>               dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>> +        ops->update_pending_flush_wb = 
>> dpu_hw_ctl_update_pending_flush_wb_v1;
> 
> Do we also need the update_pending_flush_wb for non-ACTIVE_CTL case? I 
> think we do.

Yes, but the bits will be different. I can update it.

> 
>>       } else {
>>           ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>>           ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> index c61a8fd..df8f8e9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>> +/* Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>    */
>>   #ifndef _DPU_HW_CTL_H
>> @@ -44,6 +45,7 @@ struct dpu_hw_stage_cfg {
>>    */
>>   struct dpu_hw_intf_cfg {
>>       enum dpu_intf intf;
>> +    enum dpu_wb wb;
>>       enum dpu_3d_blend_mode mode_3d;
>>       enum dpu_merge_3d merge_3d;
>>       enum dpu_ctl_mode_sel intf_mode_sel;
>> @@ -102,6 +104,15 @@ struct dpu_hw_ctl_ops {
>>           u32 flushbits);
>>       /**
>> +     * OR in the given flushbits to the cached pending_(wb_)flush_mask
>> +     * No effect on hardware
>> +     * @ctx       : ctl path ctx pointer
>> +     * @blk       : writeback block index
>> +     */
>> +    void (*update_pending_flush_wb)(struct dpu_hw_ctl *ctx,
>> +        enum dpu_wb blk);
>> +
>> +    /**
>>        * OR in the given flushbits to the cached 
>> pending_(intf_)flush_mask
>>        * No effect on hardware
>>        * @ctx       : ctl path ctx pointer
>> @@ -199,6 +210,7 @@ struct dpu_hw_ctl_ops {
>>    * @mixer_hw_caps: mixer hardware capabilities
>>    * @pending_flush_mask: storage for pending ctl_flush managed via ops
>>    * @pending_intf_flush_mask: pending INTF flush
>> + * @pending_wb_flush_mask: pending WB flush
>>    * @ops: operation list
>>    */
>>   struct dpu_hw_ctl {
>> @@ -212,6 +224,7 @@ struct dpu_hw_ctl {
>>       const struct dpu_lm_cfg *mixer_hw_caps;
>>       u32 pending_flush_mask;
>>       u32 pending_intf_flush_mask;
>> +    u32 pending_wb_flush_mask;
>>       u32 pending_merge_3d_flush_mask;
>>       /* ops */
> 
> 
