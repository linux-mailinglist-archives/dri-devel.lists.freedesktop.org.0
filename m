Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F444FB150
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 03:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965EF10E455;
	Mon, 11 Apr 2022 01:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB55410E455
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 01:20:15 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d40so16472639lfv.11
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 18:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=05X/pQBV2MI76IjGX7fSWAPTcXgd+Vfg/z1tUXGVcQc=;
 b=HL6xtEPacsZ6zEKa4xgS6WpIIMLbpOvanq1tH1R7pc6+fIzJsqF2GEV5pG2IK8elON
 hsvsroTmMu2x5m6FPVW5qBKhOYyboosL2EwPqiYVFTS0jKuLzouTo1KtofUzvDfkD4cs
 xL4TYxCEuMsVT4bKCXdH+iC0gQLvWGlE8UbgE/VycNqIfEchp1SI7lntYmR437jI/5qy
 PkYk45rDiQT6d9iXs7Ub/EwEvcr3AmZ8U60Qn8oScXCXO00MkqUaTkU0MRXRw1mygVbw
 QjrFj7UF2xCBo+z2qiy9CNBAqj9VWhvR7o0CcSEuWatpe88mc5YfMKKWYZ9/DaVqB5d7
 KWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=05X/pQBV2MI76IjGX7fSWAPTcXgd+Vfg/z1tUXGVcQc=;
 b=cwQ13nNqBA1VEU5bJk3BeC7zAA1T4kvgKX0wcD7wPJj2kkZbAlaQ8d0dM30KGxwyqk
 daL0aXiX0AkzMXSoojgI32b6bf8aPmx5VcliNCjdQ6TCh6Kl6UXzVHq6EdthX15mCOT0
 XQKqL/7tVVjQuf2FCFIDDD59OYVeXqpVadUb7dDAIoDtPp7PZEmhdmuoxFRv6hqyAOW0
 Eok7dk0qBnE9LRINQbn/FO8770YTvKmOQI0+ynfu2pZQRAAeGCzjMMDPBBAZK6D+nlA9
 DQZcnW0VZbFhtKZD3PCj6NVYtzI/xvZgi311U1F8rD3IyxZxKjtsAN3M6mLnTSnaBmo2
 XDog==
X-Gm-Message-State: AOAM530QvJOPjVjZ4YIAa5CaB0Y9z8aDRlSmiJFfFuo4U9ZcIiY+ouvC
 ZBfRdjvTg7PF/5H+OnkTJz2SdQ==
X-Google-Smtp-Source: ABdhPJwgOvDStoVkU5PcymcKMDfs/8Fh2oeLos5hkTOAv/lK50CRFRy3NioQSwXdvc/8q7VUKZrx6g==
X-Received: by 2002:a05:6512:3994:b0:44a:7125:c689 with SMTP id
 j20-20020a056512399400b0044a7125c689mr20002136lfu.166.1649640014132; 
 Sun, 10 Apr 2022 18:20:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a2ebc10000000b0024b63f0da2csm154707ljf.13.2022.04.10.18.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 18:20:13 -0700 (PDT)
Message-ID: <7e0592bc-1e8f-0981-cea2-f74402ab5886@linaro.org>
Date: Mon, 11 Apr 2022 04:20:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dpu1: dpu_encoder: fix a missing check on list iterator
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
References: <20220327073252.10871-1-xiam0nd.tong@gmail.com>
 <0788b245-ee8f-25de-dde3-7ff10f6c688c@linaro.org>
In-Reply-To: <0788b245-ee8f-25de-dde3-7ff10f6c688c@linaro.org>
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
Cc: quic_kalyant@quicinc.com, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 stable@vger.kernel.org, jsanka@codeaurora.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2022 03:56, Dmitry Baryshkov wrote:
> On 27/03/2022 10:32, Xiaomeng Tong wrote:
>> The bug is here:
>>      cstate = to_dpu_crtc_state(drm_crtc->state);
>>
>> For the drm_for_each_crtc(), just like list_for_each_entry(),
>> the list iterator 'drm_crtc' will point to a bogus position
>> containing HEAD if the list is empty or no element is found.
>> This case must be checked before any use of the iterator,
>> otherwise it will lead to a invalid memory access.
>>
>> To fix this bug, use a new variable 'iter' as the list iterator,
>> while use the origin variable 'drm_crtc' as a dedicated pointer
>> to point to the found element.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: b107603b4ad0f ("drm/msm/dpu: map mixer/ctl hw blocks in encoder 
>> modeset")
>> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On the other hand, this code has been removed in 5.18-rc1 in the commit 
764332bf96244cbc8baf08aa35844b29106da312.

> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 1e648db439f9..d3fdb18e96f9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -965,7 +965,7 @@ static void dpu_encoder_virt_mode_set(struct 
>> drm_encoder *drm_enc,
>>       struct dpu_kms *dpu_kms;
>>       struct list_head *connector_list;
>>       struct drm_connector *conn = NULL, *conn_iter;
>> -    struct drm_crtc *drm_crtc;
>> +    struct drm_crtc *drm_crtc = NULL, *iter;
>>       struct dpu_crtc_state *cstate;
>>       struct dpu_global_state *global_state;
>>       struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>> @@ -1007,9 +1007,14 @@ static void dpu_encoder_virt_mode_set(struct 
>> drm_encoder *drm_enc,
>>           return;
>>       }
>> -    drm_for_each_crtc(drm_crtc, drm_enc->dev)
>> -        if (drm_crtc->state->encoder_mask & drm_encoder_mask(drm_enc))
>> +    drm_for_each_crtc(iter, drm_enc->dev)
>> +        if (iter->state->encoder_mask & drm_encoder_mask(drm_enc)) {
>> +            drm_crtc = iter;
>>               break;
>> +        }
>> +
>> +    if (!drm_crtc)
>> +        return;
>>       /* Query resource that have been reserved in atomic check step. */
>>       num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> 
> 


-- 
With best wishes
Dmitry
