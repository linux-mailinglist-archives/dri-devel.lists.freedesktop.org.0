Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F3B501DB1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 23:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C43310E324;
	Thu, 14 Apr 2022 21:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239CF10E22B;
 Thu, 14 Apr 2022 21:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649973034; x=1681509034;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a6lbWc5qwlAXTxyV5Nk+34gMYySqSwTZ/6I8qcu1Z9k=;
 b=kRWGdzRQuX3khGnRYFUwKTPiaGZNAQCQJU4soTsBu2UQK27x8e+7A3v4
 5KlXI5bXvRsFLqdX+hPcnesaGQpRzMU8PBaW85AZWC0K1J/EZ5/sDl2v/
 GQwqx/hbMnNsA/J5ChxZ+hl0+kS9ykPEkyK1vG3oZjD3dyGd4Zn142/Gd Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Apr 2022 14:50:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 14:50:32 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 14:50:31 -0700
Received: from [10.111.169.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 14:50:29 -0700
Message-ID: <9448c67f-efd2-ea61-a4aa-35073359d8f2@quicinc.com>
Date: Thu, 14 Apr 2022 14:50:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 04/12] drm/msm/dpu: add changes to support writeback in
 hw_ctl
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-5-git-send-email-quic_abhinavk@quicinc.com>
 <7743d896-7727-3e27-d436-9212a247961f@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <7743d896-7727-3e27-d436-9212a247961f@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/4/2022 2:19 PM, Dmitry Baryshkov wrote:
> On 05/02/2022 00:17, Abhinav Kumar wrote:
>> Add changes to support writeback module in the dpu_hw_ctl
>> interface. In addition inroduce a reset_intf_cfg op to reset
>> the interface bits for the currently active interfaces in
>> the ctl path.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  3 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  6 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 65 
>> ++++++++++++++++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 27 ++++++++-
>>   4 files changed, 91 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index 34a6940..4cb72fa 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>    * Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All 
>> rights reserved.
>>    */
>> @@ -70,7 +71,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>       intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>>       intf_cfg.stream_sel = cmd_enc->stream_sel;
>>       intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>> -    ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>> +    ctl->ops.setup_intf_cfg(ctl, &intf_cfg, false);
>>   }
>>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index ddd9d89..950fcd6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -1,5 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>> -/* Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All 
>> rights reserved.
>> +/*
>> + *  Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + *  Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All 
>> rights reserved.
>>    */
>>   #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>> @@ -290,7 +292,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>>       spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>>       phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
>>               &timing_params, fmt);
>> -    phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
>> +    phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg, 
>> false);
>>       /* setup which pp blk will connect to this intf */
>>       if (phys_enc->hw_intf->ops.bind_pingpong_blk)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>> index 02da9ec..a2069af 100644
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
>> @@ -23,8 +24,10 @@
>>   #define   CTL_SW_RESET                  0x030
>>   #define   CTL_LAYER_EXTN_OFFSET         0x40
>>   #define   CTL_MERGE_3D_ACTIVE           0x0E4
>> +#define   CTL_WB_ACTIVE                 0x0EC
>>   #define   CTL_INTF_ACTIVE               0x0F4
>>   #define   CTL_MERGE_3D_FLUSH            0x100
>> +#define   CTL_WB_FLUSH                  0x108
>>   #define   CTL_INTF_FLUSH                0x110
>>   #define   CTL_INTF_MASTER               0x134
>>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
>> @@ -35,6 +38,7 @@
>>   #define DPU_REG_RESET_TIMEOUT_US        2000
>>   #define  MERGE_3D_IDX   23
>>   #define  INTF_IDX       31
>> +#define WB_IDX          16
>>   #define CTL_INVALID_BIT                 0xffff
>>   #define CTL_DEFAULT_GROUP_ID        0xf
>> @@ -128,6 +132,9 @@ static inline void 
>> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>       if (ctx->pending_flush_mask & BIT(INTF_IDX))
>>           DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
>>                   ctx->pending_intf_flush_mask);
>> +    if (ctx->pending_flush_mask & BIT(WB_IDX))
>> +        DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
>> +                ctx->pending_wb_flush_mask);
>>       DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>>   }
>> @@ -248,6 +255,13 @@ static void 
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
>> @@ -493,10 +507,11 @@ static void dpu_hw_ctl_setup_blendstage(struct 
>> dpu_hw_ctl *ctx,
>>   static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>> -        struct dpu_hw_intf_cfg *cfg)
>> +        struct dpu_hw_intf_cfg *cfg, bool is_wb)
>>   {
>>       struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>       u32 intf_active = 0;
>> +    u32 wb_active = 0;
>>       u32 mode_sel = 0;
>>       /* CTL_TOP[31:28] carries group_id to collate CTL paths
>> @@ -509,18 +524,25 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>> dpu_hw_ctl *ctx,
>>       if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>>           mode_sel |= BIT(17);
>> -    intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>> -    intf_active |= BIT(cfg->intf - INTF_0);
>> +    if (!is_wb) {
> 
> I think we can judge if it is an INTF of WB by checking the cfg->intf 
> and cfg->wb, thus the is_wb argument is not needed.

cfg->intf and cfg->wb are enums storing what is the index of the current 
WB being used.

If both intf and wb are used (which is possible) and if both have been 
configured before calling this function cfg->intf and cfg->wb will be 
valid so we cannot distinguish for which one we called this function for 
and can end up programming both.

intf calls its own dpu_hw_ctl_intf_cfg_v1 and wb calls its own.

So i thought its better to check who is the caller of this before 
configuring the block for the caller.

Let me know if now it makes sense to have a "is_wb" or this can be 
covered differently.

> 
>> +        intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>> +        intf_active |= BIT(cfg->intf - INTF_0) > +    } else {
>> +        wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
>> +        wb_active = BIT(cfg->wb - WB_0);
> 
> wb_active |= BIT(...) ?
ack
> 
>> +    }
>>       DPU_REG_WRITE(c, CTL_TOP, mode_sel);
>>       DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>> +    DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>> +
>>       if (cfg->merge_3d)
>>           DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>                     BIT(cfg->merge_3d - MERGE_3D_0));
>>   }
>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>> -        struct dpu_hw_intf_cfg *cfg)
>> +        struct dpu_hw_intf_cfg *cfg, bool is_wb)
>>   {
>>       struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>       u32 intf_cfg = 0;
>> @@ -532,6 +554,9 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl 
>> *ctx,
>>           intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>>       }
>> +    if (is_wb)
>> +        intf_cfg |= (cfg->wb & 0x3) + 2;
>> +
>>       switch (cfg->intf_mode_sel) {
>>       case DPU_CTL_MODE_SEL_VID:
>>           intf_cfg &= ~BIT(17);
>> @@ -549,6 +574,34 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl 
>> *ctx,
>>       DPU_REG_WRITE(c, CTL_TOP, intf_cfg);
>>   }
>> +static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>> +    struct dpu_hw_intf_cfg *cfg, bool is_wb)
> 
> Could you please be more specific here (or in the documentation comment 
> bellow), what exactly is reset? For example the merge3d config is left 
> intact.

Looks like I have made some mistake in the reset logic. we should have 
reset the merge_3d block. The goal is the reset the WB related pipeline.
Let me fix this code in the next version and it will be more clear.
Will update the doc too.

> 
>> +{
>> +    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>> +    u32 intf_active = 0;
>> +    u32 wb_active = 0;
>> +    u32 merge3d_active = 0;
>> +
>> +    if (cfg->merge_3d) {
>> +        merge3d_active = DPU_REG_READ(c, CTL_MERGE_3D_ACTIVE);
>> +        DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>> +                  BIT(cfg->merge_3d - MERGE_3D_0));
>> +    }
>> +
>> +    dpu_hw_ctl_clear_all_blendstages(ctx);
>> +
>> +    if (!is_wb) {
>> +        intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>> +        intf_active &= ~BIT(cfg->intf - INTF_0);
>> +        DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>> +    } else {
>> +        wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
>> +        wb_active &= ~BIT(cfg->wb - WB_0);
>> +        DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>> +    }
> 
> The same comment as for the setup_intf_cfg(). Also can we just write 
> both CTL_INTF_ACTIVE and CTL_WB_ACTIVE to 0?

We want to clear only the INTF OR WB for which this cfg was called with.
So we should only clear that bit.

> 
>> +}
>> +
>> +
>>   static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
>>       unsigned long *fetch_active)
>>   {
>> @@ -572,10 +625,12 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops 
>> *ops,
>>       if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
>>           ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
>>           ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
>> +        ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
>>           ops->update_pending_flush_intf =
>>               dpu_hw_ctl_update_pending_flush_intf_v1;
>>           ops->update_pending_flush_merge_3d =
>>               dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>> +        ops->update_pending_flush_wb = 
>> dpu_hw_ctl_update_pending_flush_wb_v1;
>>       } else {
>>           ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>>           ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>> index 806c171..fb4baca 100644
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
>> @@ -43,6 +44,7 @@ struct dpu_hw_stage_cfg {
>>    */
>>   struct dpu_hw_intf_cfg {
>>       enum dpu_intf intf;
>> +    enum dpu_wb wb;
>>       enum dpu_3d_blend_mode mode_3d;
>>       enum dpu_merge_3d merge_3d;
>>       enum dpu_ctl_mode_sel intf_mode_sel;
>> @@ -93,6 +95,15 @@ struct dpu_hw_ctl_ops {
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
>> @@ -127,9 +138,19 @@ struct dpu_hw_ctl_ops {
>>        * Setup ctl_path interface config
>>        * @ctx
>>        * @cfg    : interface config structure pointer
>> +     * @is_wb  : to indicate wb mode for programming the ctl path
>>        */
>>       void (*setup_intf_cfg)(struct dpu_hw_ctl *ctx,
>> -        struct dpu_hw_intf_cfg *cfg);
>> +        struct dpu_hw_intf_cfg *cfg, bool is_wb);
>> +
>> +    /**
>> +     * reset ctl_path interface config
>> +     * @ctx
>> +     * @cfg    : interface config structure pointer
>> +     * @is_wb  : to indicate wb mode for programming the ctl path
>> +     */
>> +    void (*reset_intf_cfg)(struct dpu_hw_ctl *ctx,
>> +        struct dpu_hw_intf_cfg *cfg, bool is_wb);
>>       int (*reset)(struct dpu_hw_ctl *c);
>> @@ -182,6 +203,7 @@ struct dpu_hw_ctl_ops {
>>    * @mixer_hw_caps: mixer hardware capabilities
>>    * @pending_flush_mask: storage for pending ctl_flush managed via ops
>>    * @pending_intf_flush_mask: pending INTF flush
>> + * @pending_wb_flush_mask: pending WB flush
>>    * @ops: operation list
>>    */
>>   struct dpu_hw_ctl {
>> @@ -195,6 +217,7 @@ struct dpu_hw_ctl {
>>       const struct dpu_lm_cfg *mixer_hw_caps;
>>       u32 pending_flush_mask;
>>       u32 pending_intf_flush_mask;
>> +    u32 pending_wb_flush_mask;
>>       u32 pending_merge_3d_flush_mask;
>>       /* ops */
> 
> 
