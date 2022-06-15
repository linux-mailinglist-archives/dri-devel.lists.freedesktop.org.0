Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D91654CF57
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF3F112464;
	Wed, 15 Jun 2022 17:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C371124C0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:04:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id p18so19930695lfr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3Enhi9944jfJtEC9gZVUfrACSGr8QYFS7G084PHOBgw=;
 b=F862Got5Otx3bC80O6mH5Sw1Npu+Kbnf8Hn1repWJtLwPxHe2xCo6ySwX0x86aKbLO
 cKzKo/x9V+UoqpTGkCSqvSd5ESsYqvkQ3xL5lriL53iQDH7KUoRg/xFJ7sYvAGamGIUX
 HRFus808MxEh/VR3SWHoJnrI38b4Aueqg6dqc37eYhxxhsQb9BDGRlVMPO2yg6IXIuDy
 SutsJGx347AaNx3HVfBovDwwKZY9mQAPS013ZDvINhX2E9jOkSqu8msXu9wxHUo7Wgap
 njVdmkVkJUpr2Ld/xpf/q8lnrziGCIY2d+QOhi3jWmkN70WIh7YbY0ww2Vxlp53Trxut
 cPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Enhi9944jfJtEC9gZVUfrACSGr8QYFS7G084PHOBgw=;
 b=BtMJrs8UMbqsM9xkeC3h8HidqEvd37MiD71AFOYwy8Y1POhn7ZUgkMAO0gl3O8KWvs
 gjAfi0Aq22FLkL3v7RZd1S/LHV4CFvCaDWdQQWdpWEOvvkK02UJPyxv3wLWu1VAUlTL2
 1Cqg77dBkfLvHM/mxnRaX7KjakM7N4qcuNTIUh31xggRQZBxV5FUVyMI92KXBs7u2S7W
 mTlepCymKrONBULM0AjAH6iskcKxR3dcaCu3TtscW4yIYE3yGzfhih+xGUAh4MeIYuSM
 a0k6xop5D8UHqFwgM6Z6MYFaQI4XVIABwfcuv5rphbPpLZJwhQb1Qh+979NyMALRCEez
 1HNQ==
X-Gm-Message-State: AJIora+WEusEAY5xTTisn59BgqqJh2Qy79KpTVTL2eYaQmSTOPAnzNmD
 DLt7J+BkQ3VasxXC0SHf+PHp9A==
X-Google-Smtp-Source: AGRyM1tf3L6f+POLSnRlwuyYW9aUznu8n9N/rbm8pCaHSpxfQVSSdUXFdd3tgmDzTf66Zgnvjhiv8Q==
X-Received: by 2002:a05:6512:3e25:b0:478:fd30:7b7c with SMTP id
 i37-20020a0565123e2500b00478fd307b7cmr273188lfv.285.1655312670246; 
 Wed, 15 Jun 2022 10:04:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a056512238b00b0047dc967fcc4sm1602934lfv.137.2022.06.15.10.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 10:04:29 -0700 (PDT)
Message-ID: <182707ff-bff8-63f8-59ad-f727f7cfddc2@linaro.org>
Date: Wed, 15 Jun 2022 20:04:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <6ce50e83-3fbf-d97f-a4f2-0f5db389349c@linaro.org>
 <5163b520-e859-d813-46ae-91260b6230e5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5163b520-e859-d813-46ae-91260b6230e5@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/06/2022 19:40, Abhinav Kumar wrote:
> 
> 
> On 6/15/2022 5:36 AM, Dmitry Baryshkov wrote:
>> On 14/06/2022 22:32, Abhinav Kumar wrote:
>>> intf and wb resources are not dependent on the rm global
>>> state so need not be allocated during 
>>> dpu_encoder_virt_atomic_mode_set().
>>>
>>> Move the allocation of intf and wb resources to 
>>> dpu_encoder_setup_display()
>>> so that we can utilize the hw caps even during atomic_check() phase.
>>>
>>> Since dpu_encoder_setup_display() already has protection against
>>> setting invalid intf_idx and wb_idx, these checks can now
>>> be dropped as well.
>>>
>>> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual 
>>> encoder")
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 
>>> +++++++------------------
>>>   1 file changed, 7 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 3a462e327e0e..e991d4ba8a40 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -1048,24 +1048,6 @@ static void 
>>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>           phys->hw_pp = dpu_enc->hw_pp[i];
>>>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>>> -        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>>> -            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>>> phys->intf_idx);
>>> -
>>> -        if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
>>> -            phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>>> -
>>> -        if (!phys->hw_intf && !phys->hw_wb) {
>>> -            DPU_ERROR_ENC(dpu_enc,
>>> -                      "no intf or wb block assigned at idx: %d\n", i);
>>> -            return;
>>> -        }
>>> -
>>> -        if (phys->hw_intf && phys->hw_wb) {
>>> -            DPU_ERROR_ENC(dpu_enc,
>>> -                    "invalid phys both intf and wb block at idx: 
>>> %d\n", i);
>>> -            return;
>>> -        }
>>
>> Please retain these checks in dpu_encoder_setup_display().
>> It checks that we really have got the intf or wb. For example one 
>> might have specified the INTF that leads to INTF_NONE interface. Or 
>> non-existing/not supported WB.
> 
> Right, so the reason I omitted that was dpu_encoder_setup_display() 
> already has these checks:
> 
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2273 
> 
> 
> Please check lines 2273-2284.
> 
> Only if all those checks succeeded we call 
> dpu_encoder_virt_add_phys_encs which increments num_phys_encs.

As I wrote, it checks indices from phys_params, but not the acquired 
hardware instances.

> 
> Thats why I dropped those.
> 
> Let me know if you have more questions.
> 
>>
>>> -
>>>           phys->cached_mode = crtc_state->adjusted_mode;
>>>           if (phys->ops.atomic_mode_set)
>>>               phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>>> @@ -2293,7 +2275,14 @@ static int dpu_encoder_setup_display(struct 
>>> dpu_encoder_virt *dpu_enc,
>>>           struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>           atomic_set(&phys->vsync_cnt, 0);
>>>           atomic_set(&phys->underrun_cnt, 0);
>>> +
>>> +        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>>> +            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>>> phys->intf_idx);
>>> +
>>> +        if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
>>> +            phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>>>       }
>>> +
>>>       mutex_unlock(&dpu_enc->enc_lock);
>>>       return ret;
>>
>>


-- 
With best wishes
Dmitry
