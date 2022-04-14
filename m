Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA0C501DC1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 23:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A678510E36F;
	Thu, 14 Apr 2022 21:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AF810E2E4;
 Thu, 14 Apr 2022 21:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649973209; x=1681509209;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3w0TnqGNShnMXIp2cUmFsd0+kElPEzh3ZmxFR4Uf9/E=;
 b=a0R8h9SEoi5obk5BBLf6nluDmDiez3Yn35ywAlMG4vPW4OFPSE8bpMmA
 3r+1bas2afKsUN8SVNfLCLPuWeXFMt7xUMpaTJF/O/avuzrXKRgLnRW2Y
 lOhS7SrzcFWhoXIRQCTHj45dR+rccQPTOLnU66N8uvWsaWxfMYgQWfYqM M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 14 Apr 2022 14:53:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 14:53:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 14:53:28 -0700
Received: from [10.111.169.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 14:53:25 -0700
Message-ID: <056617e8-1d60-0e30-b2e6-7f29781af9e3@quicinc.com>
Date: Thu, 14 Apr 2022 14:53:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 05/12] drm/msm/dpu: add an API to reset the encoder
 related hw blocks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-6-git-send-email-quic_abhinavk@quicinc.com>
 <419b352f-6a90-f4fc-6f86-cb8629e915a2@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <419b352f-6a90-f4fc-6f86-cb8629e915a2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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



On 2/4/2022 3:46 PM, Dmitry Baryshkov wrote:
> On 05/02/2022 00:17, Abhinav Kumar wrote:
>> Add an API to reset the encoder related hw blocks to ensure
>> a proper teardown of the pipeline. At the moment this is being
>> used only for the writeback encoder but eventually we can start
>> using this for all interfaces.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 92 
>> ++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 10 +++
>>   2 files changed, 102 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 1e648db..e977c05 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All 
>> rights reserved.
>>    * Copyright (C) 2013 Red Hat
>>    * Author: Rob Clark <robdclark@gmail.com>
>> @@ -21,6 +22,7 @@
>>   #include "dpu_hw_intf.h"
>>   #include "dpu_hw_ctl.h"
>>   #include "dpu_hw_dspp.h"
>> +#include "dpu_hw_merge3d.h"
>>   #include "dpu_formats.h"
>>   #include "dpu_encoder_phys.h"
>>   #include "dpu_crtc.h"
>> @@ -1813,6 +1815,96 @@ void dpu_encoder_kickoff(struct drm_encoder 
>> *drm_enc)
>>       DPU_ATRACE_END("encoder_kickoff");
>>   }
>> +static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys 
>> *phys_enc)
>> +{
>> +    struct dpu_hw_mixer_cfg mixer;
>> +    int i, num_lm;
>> +    u32 flush_mask = 0;
>> +    struct dpu_global_state *global_state;
>> +    struct dpu_hw_blk *hw_lm[2];
>> +    struct dpu_hw_mixer *hw_mixer[2];
>> +    struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
>> +
>> +    memset(&mixer, 0, sizeof(mixer));
>> +
>> +    /* reset all mixers for this encoder */
>> +    if (phys_enc->hw_ctl->ops.clear_all_blendstages)
>> +        phys_enc->hw_ctl->ops.clear_all_blendstages(phys_enc->hw_ctl);
>> +
>> +    global_state = dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
>> +
>> +    num_lm = dpu_rm_get_assigned_resources(&phys_enc->dpu_kms->rm, 
>> global_state,
>> +        phys_enc->parent->base.id, DPU_HW_BLK_LM, hw_lm, 
>> ARRAY_SIZE(hw_lm));
>> +
>> +    for (i = 0; i < num_lm; i++) {
>> +        hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
>> +        flush_mask = phys_enc->hw_ctl->ops.get_bitmask_mixer(ctl, 
>> hw_mixer[i]->idx);
>> +        if (phys_enc->hw_ctl->ops.update_pending_flush)
>> +            phys_enc->hw_ctl->ops.update_pending_flush(ctl, flush_mask);
>> +
>> +        /* clear all blendstages */
>> +        if (phys_enc->hw_ctl->ops.setup_blendstage)
>> +            phys_enc->hw_ctl->ops.setup_blendstage(ctl, 
>> hw_mixer[i]->idx, NULL);
>> +    }
>> +}
>> +
>> +void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>> +{
>> +    struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
>> +    struct dpu_hw_intf_cfg intf_cfg = { 0 };
>> +    int i;
>> +    struct dpu_encoder_virt *dpu_enc;
>> +
>> +    dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
>> +
>> +    phys_enc->hw_ctl->ops.reset(ctl);
>> +
>> +    dpu_encoder_helper_reset_mixers(phys_enc);
>> +
>> +    if (phys_enc->hw_wb) {
>> +        /* disable the PP block */
>> +        if (phys_enc->hw_wb->ops.bind_pingpong_blk)
>> +            phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, 
>> false,
>> +                    phys_enc->hw_pp->idx);
>> +
>> +        /* mark WB flush as pending */
>> +        if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
>> +            phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl, 
>> phys_enc->hw_wb->idx);
>> +    } else {
>> +        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> +            if (dpu_enc->phys_encs[i] && 
>> phys_enc->hw_intf->ops.bind_pingpong_blk)
>> +                phys_enc->hw_intf->ops.bind_pingpong_blk(
>> +                        dpu_enc->phys_encs[i]->hw_intf, false,
>> +                        dpu_enc->phys_encs[i]->hw_pp->idx);
>> +            /* mark INTF flush as pending */
>> +            if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
>> +                
>> phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
>> +                        dpu_enc->phys_encs[i]->hw_intf->idx);
>> +        }
>> +    }
>> +
>> +    /* reset the merge 3D HW block */
>> +    if (phys_enc->hw_pp->merge_3d) {
>> +        
>> phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
>> +                BLEND_3D_NONE);
>> +        if (phys_enc->hw_ctl->ops.update_pending_flush_merge_3d)
>> +            phys_enc->hw_ctl->ops.update_pending_flush_merge_3d(ctl,
>> +                    phys_enc->hw_pp->merge_3d->idx);
>> +    }
>> +
>> +    intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>> +    intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>> +    if (phys_enc->hw_pp->merge_3d)
>> +        intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>> +
>> +    if (ctl->ops.reset_intf_cfg)
>> +        ctl->ops.reset_intf_cfg(ctl, &intf_cfg, true);
>> +
>> +    ctl->ops.trigger_flush(ctl);
>> +    ctl->ops.trigger_start(ctl);
>> +    ctl->ops.clear_pending_flush(ctl);
>> +}
>> +
>>   void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
>>   {
>>       struct dpu_encoder_virt *dpu_enc;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index e7270eb..07c3525 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -1,5 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   /*
>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>>    * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
>>    */
>> @@ -10,6 +11,7 @@
>>   #include "dpu_kms.h"
>>   #include "dpu_hw_intf.h"
>> +#include "dpu_hw_wb.h"
>>   #include "dpu_hw_pingpong.h"
>>   #include "dpu_hw_ctl.h"
>>   #include "dpu_hw_top.h"
>> @@ -189,6 +191,7 @@ struct dpu_encoder_irq {
>>    * @hw_ctl:        Hardware interface to the ctl registers
>>    * @hw_pp:        Hardware interface to the ping pong registers
>>    * @hw_intf:        Hardware interface to the intf registers
>> + * @hw_wb:             Hardware interface to the wb registers
>>    * @dpu_kms:        Pointer to the dpu_kms top level
>>    * @cached_mode:    DRM mode cached at mode_set time, acted on in 
>> enable
>>    * @enabled:        Whether the encoder has enabled and running a mode
>> @@ -218,6 +221,7 @@ struct dpu_encoder_phys {
>>       struct dpu_hw_ctl *hw_ctl;
>>       struct dpu_hw_pingpong *hw_pp;
>>       struct dpu_hw_intf *hw_intf;
>> +    struct dpu_hw_wb *hw_wb;
> 
> I'd sugges to add the reset function without the HW_WB and add HW_WB 
> support here in the next patch (drm/msm/dpu: make changes to dpu_encoder 
> to support virtual encoder).
ack
> 
>>       struct dpu_kms *dpu_kms;
>>       struct drm_display_mode cached_mode;
>>       enum dpu_enc_split_role split_role;
>> @@ -382,4 +386,10 @@ int dpu_encoder_helper_register_irq(struct 
>> dpu_encoder_phys *phys_enc,
>>   int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys 
>> *phys_enc,
>>           enum dpu_intr_idx intr_idx);
>> +/**
>> + * dpu_encoder_helper_phys_cleanup - helper to cleanup dpu pipeline
>> + * @phys_enc: Pointer to physical encoder structure
>> + */
>> +void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
>> +
>>   #endif /* __dpu_encoder_phys_H__ */
> 
> 
