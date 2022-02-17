Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306504B9543
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 02:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D727D10E6DB;
	Thu, 17 Feb 2022 01:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D4E10E6D2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 01:13:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id bx31so6036530ljb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 17:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Tmtpl0AbZecSHMm8IZEt8YMKXM9Alo4sDPM/uRA5w+s=;
 b=nNzxrNdphUe3vVZTvMJ0kuHImuYO2Yqu2lu87JgDF/CYKZZYO94Wr90QxHat/+P8KT
 3Z0H/R4OqKrxk41H60i2FH1Fdo76VTz9aGewj8MiIVNpxHclSNZRHWuyqehZWIYUDE3L
 BdGgoUZvEBPU1werIb6BuO4tgULRODaphQUrUm+YVAtRt2AKwQiUEAFUPrcUhBCBrC0R
 mO1SIl38GSFx55ZppXKGS+V4AC/ohvzCEMiZAplIixnNmXgQpHwd442QDeH+y7RMNsdx
 xLa9sFWeOhSmo3ODETzKjyBHceVZCq7gtQf1i9nbV+Fa2CPvbTWAymf1NVfCGBkPopzP
 G9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tmtpl0AbZecSHMm8IZEt8YMKXM9Alo4sDPM/uRA5w+s=;
 b=f9v/JOB/mYgsefPiz8/jU57YrhPYtzZI1/Ore+09vVW6wJWFJd5M0lfOllTjqmIYXS
 xG9J89RCo06eIwnr5YYf/gpjjes9zkm1lFqRzlmE8X6GzXIyGmUBNBwpsYkZZ+aYPWnh
 xChCPA3/NbavYBvGQnOkbmILRV2HUJHZvhx+VohjomG4dQnY4NOtoyiwuvz8bhrjT5Qu
 ARDcpF3NZ+dmfaSmOdPAYWMFPOzEuHi9YdDDMUNMk6biumPQr2mQKE2xR4r2DLh4oD70
 7Wcvl4AaMQmj9EFYGo3jtAwFzRSWKbkd94z99Hqkyfx/kk3D1UgMZUJCzYw8CM+45uuk
 rChw==
X-Gm-Message-State: AOAM5308ht6fj79+C2ZchITGELEenTbyJjO9Xwy8SSjRjCwBHXLc+L7/
 ZU0CH4O/d8xjTR28Tz3SmnuoUw==
X-Google-Smtp-Source: ABdhPJxw6LYAVH39y4cXLHEacyNL7bI+7n7CZ9QWjggY3M6duuviy5HpyWy9LlF45ErbUgKI86Uf1Q==
X-Received: by 2002:a05:651c:311:b0:246:1250:d6f with SMTP id
 a17-20020a05651c031100b0024612500d6fmr499834ljp.455.1645060378553; 
 Wed, 16 Feb 2022 17:12:58 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s21sm654434lfs.37.2022.02.16.17.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 17:12:57 -0800 (PST)
Message-ID: <064a42eb-bdeb-a689-de25-07c393cb6580@linaro.org>
Date: Thu, 17 Feb 2022 04:12:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/msm/dpu: Disable boot loader configured data paths
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20220215043708.1256854-1-bjorn.andersson@linaro.org>
 <460e0036-74b5-bccd-c11c-2573290012ae@linaro.org> <YgvDrXoK4a0+HLpz@yoga>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YgvDrXoK4a0+HLpz@yoga>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/02/2022 18:15, Bjorn Andersson wrote:
> On Tue 15 Feb 08:44 CST 2022, Dmitry Baryshkov wrote:
> 
>> On 15/02/2022 07:37, Bjorn Andersson wrote:
>>> It's typical for the bootloader to configure CTL_0 for the boot splash
>>> or EFIFB, but for non-DSI use cases the DPU driver tend to pick another
>>> CTL and the system might end up with two configured data paths producing
>>> data on the same INTF. In particular as the IOMMU configuration isn't
>>> retained from the bootloader one of the data paths will push underflow
>>> color, resulting in screen flickering.
>>>
>>> Naturally the end goal would be to inherit the bootloader's
>>> configuration and provide the user with a glitch-free handover from the
>>> boot configuration to a running DPU.
>>>
>>> But such effort will affect clocks, regulators, power-domains etc, and
>>> will take time to implement. So in the meantime this patch simply
>>> disables all the data paths, on platforms that has CTL_FETCH_ACTIVE, to
>>> avoid the graphical artifacts.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 13 +++++++++++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  6 ++++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  2 ++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c     | 17 +++++++++++++++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h     |  8 ++++++++
>>>    5 files changed, 46 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> index 02da9ecf71f1..69d4849484fa 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> @@ -357,6 +357,18 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
>>>    	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
>>>    }
>>> +static void dpu_hw_ctl_disable_boot_config(struct dpu_hw_ctl *ctx)
>>> +{
>>> +	if (ctx->caps->features & BIT(DPU_CTL_FETCH_ACTIVE)) {
>>
>> I see that you are changing only CTL_FETCH_PIPE_ACTIVE. However it still
>> seems like a hack.
> 
> You're not wrong, it certainly seems a little bit hacky.
> 
> I think that it would be more appropriate to try to inherit the
> bootloader configuration. So the proposal here is, in my view, a
> stop-gap until we start to look at "continuous splash".
> 
>> What if instead we always disable boot config for all paths except CTL_0 (or
>> CTL_0 and CTL_1)?
>>
> 
> On my laptop the bootloader sets up efifb using CTL_0. When Linux brings
> up the eDP interface it seems to skip DPU_CTL_SPLIT_DISPLAY ctls and
> picks CTL_2.
> 
> As mentioned in the message, I now have both CTL_0 and CTL_2 pushing
> data to the one interface; resulting in flickering.

Ah, I thought, it's the other way.

Yep, the SPLIT_DISPLAY CTLs are precious, ideally they should be used 
only when required.

> 
>>> +		/*
>>> +		 * Disable the pipe fetch and trigger a start, to disable the
>>> +		 * data path
>>> +		 */
>>> +		DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, 0);
>>> +		DPU_REG_WRITE(&ctx->hw, CTL_START, 0x1);
>>
>> What about video vs cmd modes?
>>
> 
> Initially I was resetting a whole bunch of properties in the CTL, but
> all I want to do is stop the data flow. It's my expectation that the
> steps to follow will reset the interfaces and configure the actual data
> paths anew.
> 
> Perhaps I'm missing some steps here, the documentation is not clear and
> this has the expected visual outcome...

CTL_START is used only for WB and DSI command mode. Thus I'm surprised 
that you need it for the eDP (which should be using video mode).

> 
> Regards,
> Bjorn
> 
>>> +	}
>>> +}
>>> +
>>>    static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>>>    	enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
>>>    {
>>> @@ -590,6 +602,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>>>    	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
>>>    	ops->reset = dpu_hw_ctl_reset_control;
>>>    	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
>>> +	ops->disable_boot_config = dpu_hw_ctl_disable_boot_config;
>>>    	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
>>>    	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
>>>    	ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> index 806c171e5df2..c2734f6ab760 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>> @@ -159,6 +159,12 @@ struct dpu_hw_ctl_ops {
>>>    	 */
>>>    	void (*clear_all_blendstages)(struct dpu_hw_ctl *ctx);
>>> +	/**
>>> +	 * Disable the configuration setup by the bootloader
>>> +	 * @ctx	      : ctl path ctx pointer
>>> +	 */
>>> +	void (*disable_boot_config)(struct dpu_hw_ctl *ctx);
>>> +
>>>    	/**
>>>    	 * Configure layer mixer to pipe configuration
>>>    	 * @ctx       : ctl path ctx pointer
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index cedc631f8498..eef2f017031a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1107,6 +1107,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>    	dpu_kms->rm_init = true;
>>> +	dpu_rm_clear_boot_config(&dpu_kms->rm, dpu_kms->catalog);
>>> +
>>>    	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
>>>    					     dpu_kms->catalog);
>>>    	if (IS_ERR(dpu_kms->hw_mdp)) {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> index f9c83d6e427a..3365c5e41e28 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> @@ -4,6 +4,7 @@
>>>     */
>>>    #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
>>> +#include <linux/delay.h>
>>>    #include "dpu_kms.h"
>>>    #include "dpu_hw_lm.h"
>>>    #include "dpu_hw_ctl.h"
>>> @@ -229,6 +230,22 @@ int dpu_rm_init(struct dpu_rm *rm,
>>>    	return rc ? rc : -EFAULT;
>>>    }
>>> +void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat)
>>> +{
>>> +	struct dpu_hw_ctl *ctl;
>>> +	int i;
>>> +
>>> +	for (i = CTL_0; i < CTL_MAX; i++) {
>>> +		if (!rm->ctl_blks[i - CTL_0])
>>> +			continue;
>>> +
>>> +		DPU_DEBUG("disabling ctl%d boot configuration\n", i - CTL_0);
>>> +
>>> +		ctl = to_dpu_hw_ctl(rm->ctl_blks[i - CTL_0]);
>>> +		ctl->ops.disable_boot_config(ctl);
>>> +	}
>>> +}
>>> +
>>>    static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
>>>    {
>>>    	return top->num_intf > 1;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> index 1f12c8d5b8aa..d3e084541e67 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> @@ -88,5 +88,13 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>>>    int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>>    	struct dpu_global_state *global_state, uint32_t enc_id,
>>>    	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
>>> +
>>> +/**
>>> + * dpu_rm_clear_boot_config() - Tear down any data paths configured by boot
>>> + * @rm: DPU Resource Manager handle
>>> + * @cat: Pointer to hardware catalog
>>> + */
>>> +void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat);
>>> +
>>>    #endif /* __DPU_RM_H__ */
>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
