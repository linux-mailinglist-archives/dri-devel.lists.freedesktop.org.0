Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5B0765C31
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 21:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42C110E5E9;
	Thu, 27 Jul 2023 19:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C453E10E334
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 19:35:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fe05fbe250so2377281e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690486501; x=1691091301;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5TMCkyJ1rjQTwOu5wR45ttkReRLpVL2tJ3D6bpAbz1Y=;
 b=W/Qe7L+Ycln3hbMmlsnjKqZE1kREF9lfGuCLTnxfzfJx3+Eal+cM/yj/nZAZV3ofsd
 MgY7QnaomP3GzHXKDag4okxKJlDMrIJyUIECBm0ipn8zXvyo9ULdEaaZvhj51+ojkTDo
 FS+Yt7jkoqahAStWFo4+QoXQIdxgtFuMm94tlniNK/UyqyGIB18b3SFZzyT7tPbfvQ15
 o4+nedPQQViqYDvuhyjDafodZXHtbsIWdUu6c5LiL1Vll42jaux5eVj3Qn4S56avyruX
 RnlZrFvvSrco0JYewzSdJmKbYn5h5HyifgE06N9grV1R7gyjwHeh4L5s7LBbMdBDccmI
 D5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690486501; x=1691091301;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5TMCkyJ1rjQTwOu5wR45ttkReRLpVL2tJ3D6bpAbz1Y=;
 b=gGwfXgzhkzslarqQxD4pGWrY4T0waIJCMWcb67k9SyqKG0VVWEOc5wNAPcpBu6DxfI
 U9ooxgsFsSQRHGcP8cDVBFFRlKarNjenK1L+mIJ9TXsEZzWZSMDN6TkGReab2B97h0R8
 hqOuIQ9jxZQTL+qnjbyHImEcpL4kgk5Mt/Z3Hi2s2oIpOepZuljn1I4K/KHxc50j+mk6
 ilK/GmVdcMBK0xRIYf4TTMNnBvBTrSejvl04xQUmJCQ7XGEeAyjgTA9FGbuPKJ9SBBRb
 ZeGNbeCbNnpPuJQfqYYJ+829Sg4uTHrCJ0fCv8JxUL34IsQ6f9vQ9CHlHygtAYXRMYoW
 oPpA==
X-Gm-Message-State: ABy/qLYfZsuqdOEQef6unYGdf0mwFVXz/2hQHUGLtj5p6VwuVPlrS43H
 AosnGOUnPU18CmSDQWmBU7kk0g==
X-Google-Smtp-Source: APBJJlGtBCrcM8M8K59LVMwEK93S3RofZDoHIR3W6C7+OlM6+q9nt3JL2lQ7Pw9COsyk8neHeY1RaA==
X-Received: by 2002:a05:6512:3b83:b0:4fb:8bab:48b6 with SMTP id
 g3-20020a0565123b8300b004fb8bab48b6mr106891lfv.52.1690486500957; 
 Thu, 27 Jul 2023 12:35:00 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056402044400b00521d2f7459fsm976873edw.49.2023.07.27.12.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 12:35:00 -0700 (PDT)
Message-ID: <7b7e0a8a-392c-19c3-6642-7479c28d4ed8@linaro.org>
Date: Thu, 27 Jul 2023 22:34:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: add helper to get IRQ-related data
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
 <20230727150455.1489575-4-dmitry.baryshkov@linaro.org>
 <hdenbea53reesjrin4szoq64ja63ryjznsllvmicuzdftmk5u7@lows7neacgm2>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <hdenbea53reesjrin4szoq64ja63ryjznsllvmicuzdftmk5u7@lows7neacgm2>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 22:29, Marijn Suijten wrote:
> On 2023-07-27 18:04:54, Dmitry Baryshkov wrote:
>> In preparation to reworking the IRQ indices, move irq_tbl access to
>> separate helper.
> 
> I am not seeing the advantage of the helper, but making every function
> look up dpu_kms->hw_intr->irq_tbl[irq_idx] only once and storing that in
> a local dpu_hw_intr_entry pointer is much tidier.

There was a bonus point when I tried to do a irq_idx-1 in the next 
patch. But since that code has gone, maybe I can drop this patch too.

> 
> Maybe I expected it to do extra mutations to irq_idx in 4/4?
> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 48 +++++++++++++------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 12 +++--
>>   2 files changed, 41 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> index eaae7f11f57f..ede7161ae904 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>> @@ -199,6 +199,12 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>>   
>>   #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
>>   
>> +static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *dpu_kms,
>> +							       int irq_idx)
>> +{
>> +	return &dpu_kms->hw_intr->irq_tbl[irq_idx];
>> +}
>> +
>>   /**
>>    * dpu_core_irq_callback_handler - dispatch core interrupts
>>    * @dpu_kms:		Pointer to DPU's KMS structure
>> @@ -206,17 +212,19 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>>    */
>>   static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
>>   {
>> +	struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
>> +
>>   	VERB("irq_idx=%d\n", irq_idx);
>>   
>> -	if (!dpu_kms->hw_intr->irq_tbl[irq_idx].cb)
>> +	if (!irq_entry->cb)
>>   		DRM_ERROR("no registered cb, idx:%d\n", irq_idx);
>>   
>> -	atomic_inc(&dpu_kms->hw_intr->irq_tbl[irq_idx].count);
>> +	atomic_inc(&irq_entry->count);
>>   
>>   	/*
>>   	 * Perform registered function callback
>>   	 */
>> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg);
>> +	irq_entry->cb(irq_entry->arg);
>>   }
>>   
>>   irqreturn_t dpu_core_irq(struct msm_kms *kms)
>> @@ -509,6 +517,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>>   		void (*irq_cb)(void *arg),
>>   		void *irq_arg)
>>   {
>> +	struct dpu_hw_intr_entry *irq_entry;
>>   	unsigned long irq_flags;
>>   	int ret;
>>   
>> @@ -526,15 +535,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>>   
>>   	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>>   
>> -	if (unlikely(WARN_ON(dpu_kms->hw_intr->irq_tbl[irq_idx].cb))) {
>> +	irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
>> +	if (unlikely(WARN_ON(irq_entry->cb))) {
>>   		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>>   
>>   		return -EBUSY;
>>   	}
>>   
>>   	trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
>> -	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = irq_arg;
>> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = irq_cb;
>> +	irq_entry->arg = irq_arg;
>> +	irq_entry->cb = irq_cb;
>>   
>>   	ret = dpu_hw_intr_enable_irq_locked(
>>   				dpu_kms->hw_intr,
>> @@ -551,6 +561,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>>   
>>   int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>>   {
>> +	struct dpu_hw_intr_entry *irq_entry;
>>   	unsigned long irq_flags;
>>   	int ret;
>>   
>> @@ -569,8 +580,9 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>>   		DPU_ERROR("Fail to disable IRQ for irq_idx:%d: %d\n",
>>   					irq_idx, ret);
>>   
>> -	dpu_kms->hw_intr->irq_tbl[irq_idx].cb = NULL;
>> -	dpu_kms->hw_intr->irq_tbl[irq_idx].arg = NULL;
>> +	irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
>> +	irq_entry->cb = NULL;
>> +	irq_entry->arg = NULL;
>>   
>>   	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>>   
>> @@ -583,14 +595,16 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
>>   static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
>>   {
>>   	struct dpu_kms *dpu_kms = s->private;
>> +	struct dpu_hw_intr_entry *irq_entry;
>>   	unsigned long irq_flags;
>>   	int i, irq_count;
>>   	void *cb;
>>   
>>   	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
>>   		spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
>> -		irq_count = atomic_read(&dpu_kms->hw_intr->irq_tbl[i].count);
>> -		cb = dpu_kms->hw_intr->irq_tbl[i].cb;
>> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
>> +		irq_count = atomic_read(&irq_entry->count);
>> +		cb = irq_entry->cb;
>>   		spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
>>   
>>   		if (irq_count || cb)
>> @@ -613,6 +627,7 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
>>   void dpu_core_irq_preinstall(struct msm_kms *kms)
>>   {
>>   	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>> +	struct dpu_hw_intr_entry *irq_entry;
>>   	int i;
>>   
>>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>> @@ -620,22 +635,27 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
>>   	dpu_disable_all_irqs(dpu_kms);
>>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   
>> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
>> -		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
>> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
>> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
>> +		atomic_set(&irq_entry->count, 0);
>> +	}
>>   }
>>   
>>   void dpu_core_irq_uninstall(struct msm_kms *kms)
>>   {
>>   	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>> +	struct dpu_hw_intr_entry *irq_entry;
>>   	int i;
>>   
>>   	if (!dpu_kms->hw_intr)
>>   		return;
>>   
>>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>> -	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
>> -		if (dpu_kms->hw_intr->irq_tbl[i].cb)
>> +	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
>> +		irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
>> +		if (irq_entry->cb)
>>   			DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
>> +	}
>>   
>>   	dpu_clear_irqs(dpu_kms);
>>   	dpu_disable_all_irqs(dpu_kms);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>> index 3a988a4e4f33..59bde8ab50c8 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>> @@ -40,6 +40,12 @@ enum dpu_hw_intr_reg {
>>   #define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
>>   #define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
>>   
>> +struct dpu_hw_intr_entry {
>> +	void (*cb)(void *arg);
>> +	void *arg;
>> +	atomic_t count;
>> +};
>> +
>>   /**
>>    * struct dpu_hw_intr: hw interrupts handling data structure
>>    * @hw:               virtual address mapping
>> @@ -59,11 +65,7 @@ struct dpu_hw_intr {
>>   	unsigned long irq_mask;
>>   	const struct dpu_intr_reg *intr_set;
>>   
>> -	struct {
>> -		void (*cb)(void *arg);
>> -		void *arg;
>> -		atomic_t count;
>> -	} irq_tbl[];
>> +	struct dpu_hw_intr_entry irq_tbl[];
>>   };
>>   
>>   /**
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry

