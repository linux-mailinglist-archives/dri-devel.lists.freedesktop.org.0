Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795AB6DE815
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 01:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ECE10E1FF;
	Tue, 11 Apr 2023 23:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E8A10E1FF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 23:36:54 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i6so750037lfp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681256211; x=1683848211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ag98VDnesjpE6B2VMaKVp7ad/hfCE90TCy19DFDfwkE=;
 b=kbGMG6dbKpVTDvyMyxAoTI0I+HcDn/bdbe/1sPPtRDDNd+KXWWXdQ1jwtSeIf9Cg1n
 /4tZDwU+/g0pMM7SrTadQItmj2L42pVyy+SfAo7hJTFykpIjxz2zyz0HZMEk5d+s0BL1
 qQIUe0OtM+TEum2SENwGGa0MlJkrjR3Xx9z/znHanyT457MNsd+UOR0jYK5cpPrmHnm8
 eR2ykjAylyuJNwvtL6V8Qk1jen4eroIMHuykDhtznfzAQdmZHDfTeKLinU6ZI3FlxllZ
 xLllS9dQit+MnNv6/qM5NhSkG7a7A3Q4HuPPaTc/emRHKSigfe+ayr+pNBErEcywlHFP
 WyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681256211; x=1683848211;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ag98VDnesjpE6B2VMaKVp7ad/hfCE90TCy19DFDfwkE=;
 b=xGL+uBPdTf/J3PwRmf5/qwK09lA48+xkeIxNkCklsF0rzyN3LT8/jYOi9P7oeTJL0V
 hbbqa2P+6Qi7itfeteFoMJgpN2AJtFBXcKquISMvZKsnhoiuOoCod7a7bjHnheaRW1KW
 UEUThuUEI9yh5cS+fLzqIjtQGDeDqCKfmJaS7Z49GX1G8GzRSTZDf2RQ6K8urq8OSrTl
 zjMEH2AerGE8P7P0qTYWvniOErtTU+XROdcB0ixlLuAepPbCcZ6cQbzsjBADyXlBI3nC
 2IvDgwdRAyK9hnC5hHz4bnEDera6dqjikox5Uj6zkBbSohPjG2BXAFasS7OObIQPEYO9
 5M/Q==
X-Gm-Message-State: AAQBX9ee28+2KtREB1x4tQcV2rbPQCsa/jHFvKnoPYxh2wH6GAwBQBUX
 EeOytzmpJwu0zbPNbMBnKRIWLA==
X-Google-Smtp-Source: AKy350ZEQ4Aav596NSo121H1kTUDKoj9CskwA1FOrLea+Zo3UABdxx/BQnXIEZuqTOoK3Ve8a8v7LQ==
X-Received: by 2002:ac2:561b:0:b0:4ea:e628:356f with SMTP id
 v27-20020ac2561b000000b004eae628356fmr65661lfd.48.1681256211037; 
 Tue, 11 Apr 2023 16:36:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l12-20020ac2430c000000b004eb0c51780bsm2742297lfh.29.2023.04.11.16.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 16:36:50 -0700 (PDT)
Message-ID: <c0161f2b-b8cb-4dd3-8cec-a2dba40ff924@linaro.org>
Date: Wed, 12 Apr 2023 02:36:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/msm/dpu: always program dsc active bits
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org
References: <1681247095-1201-1-git-send-email-quic_khsieh@quicinc.com>
 <30585d08-88ca-e3a9-6f83-128d49d1d1fc@linaro.org>
 <ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 02:32, Abhinav Kumar wrote:
> 
> 
> On 4/11/2023 3:17 PM, Dmitry Baryshkov wrote:
>> On 12/04/2023 00:04, Kuogee Hsieh wrote:
>>> In current code, the dsc active bits are set only if the cfg->dsc is 
>>> set.
>>> However, for displays which are hot-pluggable, there can be a use-case
>>> of disconnecting a DSC supported sink and connecting a non-DSC sink.
>>>
>>> For those cases we need to clear DSC active bits during teardown.
>>
>> Please correct me if I'm wrong here, shouldn't we start using 
>> reset_intf_cfg() during teardown / unplug?
>>
> 
> This is actually a good point. Since PSR landed this cycle, we are doing 
> dpu_encoder_helper_phys_cleanup() even for video mode path,
> 
> 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine 
> disable")
> 
> I was doing it only for writeback path as I had not validated video mode 
> enough with the dpu_encoder_helper_phys_cleanup() API.
> 
> But looking closely, I think there is an issue with the flush logic in 
> that API for video mode.
> 
> The reset API, calls a ctl->ops.trigger_flush(ctl); but its getting 
> called after timing engine turns off today so this wont take any effect.
> 
> We need to improve that API and add the missing pieces for it to work 
> correctly with video mode and re-validate the issue for which PSR made 
> that change. So needs more work there.
> 
> This change works because the timing engine is enabled right after this 
> call and will trigger the flush with it.
> 
> The only drawback of this change is DSC_ACTIVE will always get written 
> to either with 0 or the right value but only once during enable.
> 
> I think this change is fine till we finish the rest of the pieces. We 
> can add the if (cfg->dsc) back to this when we fix the reset_intf_cfg() 
> to handle DSC and dpu_encoder_helper_phys_cleanup() to handle flush 
> correctly.

I'd agree here. Then a FIXME comment would be nice.

> 
> I will take up that work.
> 
>>>
>>> Fixes: ede3c6bb00c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 +++----
>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> index bbdc95c..88e4efe 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> @@ -541,10 +541,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
>>> dpu_hw_ctl *ctx,
>>>       if (cfg->merge_3d)
>>>           DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>>>                     BIT(cfg->merge_3d - MERGE_3D_0));
>>> -    if (cfg->dsc) {
>>> -        DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>>> -        DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>> -    }
>>> +
>>> +    DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
>>> +    DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>>>   }
>>>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>>

-- 
With best wishes
Dmitry

