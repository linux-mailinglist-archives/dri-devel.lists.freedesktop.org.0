Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B15B509315
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 00:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D9F10EFCF;
	Wed, 20 Apr 2022 22:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1443C10F0A6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 22:42:31 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id bf11so3612009ljb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 15:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=psdP0p9BvfJFaJuBneoW7Oj5h/DJchu6/w7jeji73gc=;
 b=yxoWAlib3EYqPHHG0vaoC8+uWDL9NnamnnwrVD5sWO7/f2HSlqHeH2YNsSERTZ1oDx
 Lge0U+Tfzj8eDWrsNvpKYLNqRTYArI8op7BBwBXilzCBwPMJXzLLQPtFBBjs0PEwGE55
 edHD+qgGBYOvuGlhSL33APGFTgQnD7CEX+e0Ty+I/loUHFf48UpnVlsVmxPmfOGAjCLr
 /KAQtW6TakLzLUlVWsrAqbak8VdvPzxLzarbDDCt+Z9vTz8pw5H4RJKJh5cVbTpmcKV7
 oLwBa2M4AsGWHsablkbvqNBCYdNJkhLd9aMWMuAeyVF1eRZPQ4zlFgqX8q6ibWRadYV7
 EOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=psdP0p9BvfJFaJuBneoW7Oj5h/DJchu6/w7jeji73gc=;
 b=p5CGqjLf7ZvPDQzJ5C+HDhspppU8x5QqjPjM0ACeF3LYc4fIJviN4PBw8s7iMMu+Gr
 WxQ1cAa6X1HKiXvrCQeM6y2zXM/e6p2ipL0+htGD/nigiJRhVS5vORe2Iuvg8riEYrYF
 s6L3MEHQ4TenehIbkW/p6NXZygfbpiUT1Ds6MRxIWZ1O89UbG38JOOH19K3eUfXsNBpO
 ak9uuBFdyxtnnaEcWGyKltHMFFHG+jAJqno3JPXpEo5PWkkjAhObisEn+l3S2PSUNFo4
 JHlF9YjKM4Ree+FUtgMXkp3xflnxa+spglni/H0U2qThiVNNpPJwCk8IL5eyRXcgctHF
 1GFA==
X-Gm-Message-State: AOAM53291tNCeEbJdItp4spG6yddzaHW/fEzfAt2RLyU8ct0nCv05YRJ
 xXXXGS+lDzX9rG2MHyYyZhT1CQ==
X-Google-Smtp-Source: ABdhPJzTOL53gh6VGryB4cyaGmS1sY2eKOSRMdnqoS4/H+NM/uzw1koDsh5uQsiSCtHk9nMou4A4uQ==
X-Received: by 2002:a05:651c:88a:b0:24d:c0ea:7ea0 with SMTP id
 d10-20020a05651c088a00b0024dc0ea7ea0mr9072554ljq.6.1650494549278; 
 Wed, 20 Apr 2022 15:42:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y27-20020a056512045b00b0046bc3a9ea96sm1968315lfk.51.2022.04.20.15.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 15:42:28 -0700 (PDT)
Message-ID: <1db1e2ec-6dc9-e068-9038-f0a98dd93bb8@linaro.org>
Date: Thu, 21 Apr 2022 01:42:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 09/17] drm/msm/dpu: add an API to reset the encoder
 related hw blocks
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-10-git-send-email-quic_abhinavk@quicinc.com>
 <2f37ee8d-6b6a-3e05-cdb7-cd84d81632bf@linaro.org>
 <13fac83c-99e7-0ca6-f93d-b4e6b975abdb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <13fac83c-99e7-0ca6-f93d-b4e6b975abdb@quicinc.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2022 00:28, Abhinav Kumar wrote:
> 
> 
> On 4/20/2022 12:23 AM, Dmitry Baryshkov wrote:
>> On 20/04/2022 04:46, Abhinav Kumar wrote:
>>> Add an API to reset the encoder related hw blocks to ensure
>>> a proper teardown of the pipeline. At the moment this is being
>>> used only for the writeback encoder but eventually we can start
>>> using this for all interfaces.
>>>
>>> changes in v2:
>>>     - split the writeback part to another commit
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> A minor question: do we need to also reset the DSPP alongside 
>> resetting the LM?
> 
> So this function is mostly doing what the downstream equivalent of it 
> does which is to disable all the sspp blend stages, the ping-pong 
> binding and 3d-merge connection.
> 
> For DSPP, there is no ability to *bind* it or connect it. Its a 
> hard-wired connection. Its just a question of whether to enable it or not.
> 
> When the CTL path connections are removed, there is no need to 
> explicitly disable the DSPP.
> 
> Thats why even downstream doesnt do it today.

Ack, thanks.


> 
>>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 82 
>>> ++++++++++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  7 ++
>>>   2 files changed, 89 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 4523693..0e31ad3 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -1,5 +1,6 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>   /*
>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>>    * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All 
>>> rights reserved.
>>>    * Copyright (C) 2013 Red Hat
>>>    * Author: Rob Clark <robdclark@gmail.com>
>>> @@ -22,6 +23,7 @@
>>>   #include "dpu_hw_ctl.h"
>>>   #include "dpu_hw_dspp.h"
>>>   #include "dpu_hw_dsc.h"
>>> +#include "dpu_hw_merge3d.h"
>>>   #include "dpu_formats.h"
>>>   #include "dpu_encoder_phys.h"
>>>   #include "dpu_crtc.h"
>>> @@ -1838,6 +1840,86 @@ void dpu_encoder_kickoff(struct drm_encoder 
>>> *drm_enc)
>>>       DPU_ATRACE_END("encoder_kickoff");
>>>   }
>>> +static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys 
>>> *phys_enc)
>>> +{
>>> +    struct dpu_hw_mixer_cfg mixer;
>>> +    int i, num_lm;
>>> +    u32 flush_mask = 0;
>>> +    struct dpu_global_state *global_state;
>>> +    struct dpu_hw_blk *hw_lm[2];
>>> +    struct dpu_hw_mixer *hw_mixer[2];
>>> +    struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
>>> +
>>> +    memset(&mixer, 0, sizeof(mixer));
>>> +
>>> +    /* reset all mixers for this encoder */
>>> +    if (phys_enc->hw_ctl->ops.clear_all_blendstages)
>>> +        phys_enc->hw_ctl->ops.clear_all_blendstages(phys_enc->hw_ctl);
>>> +
>>> +    global_state = 
>>> dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
>>> +
>>> +    num_lm = dpu_rm_get_assigned_resources(&phys_enc->dpu_kms->rm, 
>>> global_state,
>>> +        phys_enc->parent->base.id, DPU_HW_BLK_LM, hw_lm, 
>>> ARRAY_SIZE(hw_lm));
>>> +
>>> +    for (i = 0; i < num_lm; i++) {
>>> +        hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
>>> +        flush_mask = phys_enc->hw_ctl->ops.get_bitmask_mixer(ctl, 
>>> hw_mixer[i]->idx);
>>> +        if (phys_enc->hw_ctl->ops.update_pending_flush)
>>> +            phys_enc->hw_ctl->ops.update_pending_flush(ctl, 
>>> flush_mask);
>>> +
>>> +        /* clear all blendstages */
>>> +        if (phys_enc->hw_ctl->ops.setup_blendstage)
>>> +            phys_enc->hw_ctl->ops.setup_blendstage(ctl, 
>>> hw_mixer[i]->idx, NULL);
>>> +    }
>>> +}
>>> +
>>> +void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>>> +{
>>> +    struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
>>> +    struct dpu_hw_intf_cfg intf_cfg = { 0 };
>>> +    int i;
>>> +    struct dpu_encoder_virt *dpu_enc;
>>> +
>>> +    dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
>>> +
>>> +    phys_enc->hw_ctl->ops.reset(ctl);
>>> +
>>> +    dpu_encoder_helper_reset_mixers(phys_enc);
>>> +
>>> +    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>> +        if (dpu_enc->phys_encs[i] && 
>>> phys_enc->hw_intf->ops.bind_pingpong_blk)
>>> +            phys_enc->hw_intf->ops.bind_pingpong_blk(
>>> +                    dpu_enc->phys_encs[i]->hw_intf, false,
>>> +                    dpu_enc->phys_encs[i]->hw_pp->idx);
>>> +
>>> +        /* mark INTF flush as pending */
>>> +        if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
>>> + phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
>>> +                    dpu_enc->phys_encs[i]->hw_intf->idx);
>>> +    }
>>> +
>>> +    /* reset the merge 3D HW block */
>>> +    if (phys_enc->hw_pp->merge_3d) {
>>> + 
>>> phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
>>> +                BLEND_3D_NONE);
>>> +        if (phys_enc->hw_ctl->ops.update_pending_flush_merge_3d)
>>> +            phys_enc->hw_ctl->ops.update_pending_flush_merge_3d(ctl,
>>> +                    phys_enc->hw_pp->merge_3d->idx);
>>> +    }
>>> +
>>> +    intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>>> +    intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>> +    if (phys_enc->hw_pp->merge_3d)
>>> +        intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>>> +
>>> +    if (ctl->ops.reset_intf_cfg)
>>> +        ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
>>> +
>>> +    ctl->ops.trigger_flush(ctl);
>>> +    ctl->ops.trigger_start(ctl);
>>> +    ctl->ops.clear_pending_flush(ctl);
>>> +}
>>> +
>>>   void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
>>>   {
>>>       struct dpu_encoder_virt *dpu_enc;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> index 706b566..544a9a4 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> @@ -1,5 +1,6 @@
>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>   /*
>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>>    * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
>>>    */
>>> @@ -350,4 +351,10 @@ int dpu_encoder_helper_wait_for_irq(struct 
>>> dpu_encoder_phys *phys_enc,
>>>           void (*func)(void *arg, int irq_idx),
>>>           struct dpu_encoder_wait_info *wait_info);
>>> +/**
>>> + * dpu_encoder_helper_phys_cleanup - helper to cleanup dpu pipeline
>>> + * @phys_enc: Pointer to physical encoder structure
>>> + */
>>> +void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys 
>>> *phys_enc);
>>> +
>>>   #endif /* __dpu_encoder_phys_H__ */
>>
>>


-- 
With best wishes
Dmitry
