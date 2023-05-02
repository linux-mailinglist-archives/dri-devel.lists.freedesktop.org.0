Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AD96F4C42
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 23:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A6410E105;
	Tue,  2 May 2023 21:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A68410E04E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 21:36:36 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f137dbaa4fso17357e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 14:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683063394; x=1685655394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/F9stWnryyDEvTY0q1e7rvJ9qoAyrBecPAfM0EAXwhE=;
 b=WbkSWeeO8iSa8RWQsrepDagnj85Pr54Vxf/qTVPXSxOCGxKIyeiOauIL1+7g4ZX1Me
 5v16vSi2Fh4Gpxy+pTulaqcV2X+DkkjbDy3/USXJVUCoJkE6OCI/mQREIyofyOriuU4N
 BGz7F425/0jC26tw0JtWOO+aHXFoY3N99jR3U3G8N8gzYVzIBYNghP23n0Q0yNYAf8z0
 mCDmZ31wqhBXK1IGFJWJu5VMSqJavBpFV8a1D0DV/2LO13QCOy9K/yXHQG9cUIu2bUmU
 7tm9Vt2AcySSbgXrHcAcY7Jil7zJHZPNc51SzkNmY5HiecHUSw0L3Jy2V++UMY8dwCvY
 kCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683063394; x=1685655394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/F9stWnryyDEvTY0q1e7rvJ9qoAyrBecPAfM0EAXwhE=;
 b=PXVKDqbIEjL2T8lUWjcGqhFb7ShzuCA6Oem7Vs71SCG6dNqTYg7JQFz+kh9xIYbDyQ
 WH7KQVaHhDPVss65FiyA2YjhpQ9yWWSsZtXT2HThB872oyftsL9sZS4rsj3Mlm/Y2A0M
 LZu5Aszfbp9yFgLV7XQMdpxsbGriHyusVajaxEBPmdNGekYyJWIqJAXrzq24hHj9bZEu
 UvsMwTvhiYimSkTl9R1BpStjlSZ8zPdIrGVq4oh+w8LRkCGjXawtLrpxVOgn+uhm2uXT
 I/C2lcnq01ZiYfYigQULMfXgdjCh7uj1ExMq0dQ2jj870GLtPrkXJr30Qs7Rk+9IjLFO
 ubuA==
X-Gm-Message-State: AC+VfDw5X+hijZj4AwkETiaBnYggTAgYsay7K+B3K1wYuocQnNRatt8m
 QX0BL3SozgBfWQ9BLFQSd9TOFg==
X-Google-Smtp-Source: ACHHUZ7B0yuehkKT21mswvQBmcHfB3YX1tmRMrnBIMy5m/0QbEht9xXwfu7siu3Gq8T1v0/w1ygMHA==
X-Received: by 2002:ac2:548f:0:b0:4d8:75f8:6963 with SMTP id
 t15-20020ac2548f000000b004d875f86963mr322736lfk.38.1683063394076; 
 Tue, 02 May 2023 14:36:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a19f70b000000b004edc6067affsm5570682lfe.8.2023.05.02.14.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 14:36:33 -0700 (PDT)
Message-ID: <d157c6e8-c737-9a39-910a-fcb6a165e634@linaro.org>
Date: Wed, 3 May 2023 00:36:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/7] drm/msm/dpu: separate common function to init
 physical encoder
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-4-dmitry.baryshkov@linaro.org>
 <851cacad-dd8e-46c9-31c7-bc1b946024f9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <851cacad-dd8e-46c9-31c7-bc1b946024f9@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/05/2023 00:33, Abhinav Kumar wrote:
> 
> 
> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>> Move common DPU physical encoder initialization code to the new function
>> dpu_encoder_phys_init().
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 31 +++++++++++++++++--
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 ++
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 19 +++---------
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 20 +++---------
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 19 +++---------
>>   5 files changed, 46 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 8c45c949ec39..c60dce5861e2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -2303,8 +2303,6 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>           struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>> -        atomic_set(&phys->vsync_cnt, 0);
>> -        atomic_set(&phys->underrun_cnt, 0);
>>           if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>>               phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>> phys->intf_idx);
>> @@ -2505,3 +2503,32 @@ unsigned int dpu_encoder_helper_get_dsc(struct 
>> dpu_encoder_phys *phys_enc)
>>       return dpu_enc->dsc_mask;
>>   }
>> +
>> +int dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
>> +              struct dpu_enc_phys_init_params *p)
>> +{
>> +    int i;
>> +
>> +    phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
>> +    phys_enc->intf_idx = p->intf_idx;
>> +    phys_enc->wb_idx = p->wb_idx;
>> +    phys_enc->parent = p->parent;
>> +    phys_enc->dpu_kms = p->dpu_kms;
>> +    phys_enc->split_role = p->split_role;
>> +    phys_enc->enc_spinlock = p->enc_spinlock;
>> +    phys_enc->enable_state = DPU_ENC_DISABLED;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
>> +        phys_enc->irq[i] = -EINVAL;
>> +
>> +    atomic_set(&phys_enc->vblank_refcount, 0);
>> +    atomic_set(&phys_enc->pending_kickoff_cnt, 0);
>> +    atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
>> +
>> +    atomic_set(&phys_enc->vsync_cnt, 0);
>> +    atomic_set(&phys_enc->underrun_cnt, 0);
>> +
>> +    init_waitqueue_head(&phys_enc->pending_kickoff_wq);
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index 1d434b22180d..7019870215c0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -405,4 +405,7 @@ void dpu_encoder_frame_done_callback(
>>           struct drm_encoder *drm_enc,
>>           struct dpu_encoder_phys *ready_phys, u32 event);
>> +int dpu_encoder_phys_init(struct dpu_encoder_phys *phys,
>> +              struct dpu_enc_phys_init_params *p);
>> +
>>   #endif /* __dpu_encoder_phys_H__ */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index 74470d068622..ce86b9ef6bf1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -759,7 +759,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>>   {
>>       struct dpu_encoder_phys *phys_enc = NULL;
>>       struct dpu_encoder_phys_cmd *cmd_enc = NULL;
>> -    int i, ret = 0;
>> +    int ret = 0;
>>       DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
>> @@ -770,25 +770,16 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>>           return ERR_PTR(ret);
>>       }
>>       phys_enc = &cmd_enc->base;
>> -    phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
>> -    phys_enc->intf_idx = p->intf_idx;
>> +
>> +    ret = dpu_encoder_phys_init(phys_enc, p);
>> +    if (ret)
>> +        return ERR_PTR(ret);
> 
> dpu_encoder_phys_init() seems to always return 0, so we can make that 
> void and drop ret and return here?

I had in mind a possible error from INTF_n/WB_n -> hw_intf/hw_wb lookup, 
but at the end I got rid of that. So, yes, why not.

> 
>>       dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
>> -    phys_enc->parent = p->parent;
>> -    phys_enc->dpu_kms = p->dpu_kms;
>> -    phys_enc->split_role = p->split_role;
>>       phys_enc->intf_mode = INTF_MODE_CMD;
>> -    phys_enc->enc_spinlock = p->enc_spinlock;
>>       cmd_enc->stream_sel = 0;
>> -    phys_enc->enable_state = DPU_ENC_DISABLED;
>> -    for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
>> -        phys_enc->irq[i] = -EINVAL;
>> -    atomic_set(&phys_enc->vblank_refcount, 0);
>> -    atomic_set(&phys_enc->pending_kickoff_cnt, 0);
>> -    atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
>>       atomic_set(&cmd_enc->pending_vblank_cnt, 0);
>> -    init_waitqueue_head(&phys_enc->pending_kickoff_wq);
>>       init_waitqueue_head(&cmd_enc->pending_vblank_wq);
>>       DPU_DEBUG_CMDENC(cmd_enc, "created\n");
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index 3a374292f311..aca3849621e2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -699,7 +699,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>>           struct dpu_enc_phys_init_params *p)
>>   {
>>       struct dpu_encoder_phys *phys_enc = NULL;
>> -    int i;
>> +    int ret;
>>       if (!p) {
>>           DPU_ERROR("failed to create encoder due to invalid 
>> parameter\n");
>> @@ -712,24 +712,14 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>>           return ERR_PTR(-ENOMEM);
>>       }
>> -    phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
>> -    phys_enc->intf_idx = p->intf_idx;
>> -
>>       DPU_DEBUG_VIDENC(phys_enc, "\n");
>> +    ret = dpu_encoder_phys_init(phys_enc, p);
>> +    if (ret)
>> +        return ERR_PTR(ret);
> 
> same here.
> 
>> +
>>       dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
>> -    phys_enc->parent = p->parent;
>> -    phys_enc->dpu_kms = p->dpu_kms;
>> -    phys_enc->split_role = p->split_role;
>>       phys_enc->intf_mode = INTF_MODE_VIDEO;
>> -    phys_enc->enc_spinlock = p->enc_spinlock;
>> -    for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
>> -        phys_enc->irq[i] = -EINVAL;
>> -
>> -    atomic_set(&phys_enc->vblank_refcount, 0);
>> -    atomic_set(&phys_enc->pending_kickoff_cnt, 0);
>> -    init_waitqueue_head(&phys_enc->pending_kickoff_wq);
>> -    phys_enc->enable_state = DPU_ENC_DISABLED;
>>       DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->intf_idx);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index f879d006de21..c252127552c6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -683,7 +683,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
>>       struct dpu_encoder_phys *phys_enc = NULL;
>>       struct dpu_encoder_phys_wb *wb_enc = NULL;
>>       int ret = 0;
>> -    int i;
>>       DPU_DEBUG("\n");
>> @@ -701,28 +700,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
>>       }
>>       phys_enc = &wb_enc->base;
>> -    phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
>> -    phys_enc->wb_idx = p->wb_idx;
>> +
>> +    ret = dpu_encoder_phys_init(phys_enc, p);
>> +    if (ret)
>> +        return ERR_PTR(ret);
> 
> same here
> 
>>       dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
>> -    phys_enc->parent = p->parent;
>> -    phys_enc->dpu_kms = p->dpu_kms;
>> -    phys_enc->split_role = p->split_role;
>>       phys_enc->intf_mode = INTF_MODE_WB_LINE;
>> -    phys_enc->wb_idx = p->wb_idx;
>> -    phys_enc->enc_spinlock = p->enc_spinlock;
>>       atomic_set(&wb_enc->wbirq_refcount, 0);
>> -    for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
>> -        phys_enc->irq[i] = -EINVAL;
>> -
>> -    atomic_set(&phys_enc->pending_kickoff_cnt, 0);
>> -    atomic_set(&phys_enc->vblank_refcount, 0);
>>       wb_enc->wb_done_timeout_cnt = 0;
>> -    init_waitqueue_head(&phys_enc->pending_kickoff_wq);
>> -    phys_enc->enable_state = DPU_ENC_DISABLED;
>>       DPU_DEBUG("Created dpu_encoder_phys for wb %d\n",
>>               phys_enc->wb_idx);

-- 
With best wishes
Dmitry

