Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 733AA6F5EA2
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 20:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D06410E338;
	Wed,  3 May 2023 18:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D70310E338
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 18:55:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so5836463e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 11:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683140114; x=1685732114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RzlKE1lmEmo/k0biH7eOIrCi/hE0/6/rGsPN37zmsG0=;
 b=NurSElMFDhqL82wNrV6GXMHEw++bZK414iS+75lKBU2Kpx9gxOF1D0Lfv1PMdclnO0
 Nk4F2n8LjCEdcQrOUnuiehyRMm0B+XgX9ScJ266OkUUh5eKZhBblh6zXQpF3HTWffLC7
 km/+DLVpnjQ0KyqRjEfjiuosJ9YijmZPU9tFvUj2UZD//d458kvckQif9AKBLCYebyzW
 l5CHluRz4PITEpAwr5b8p3q7grZ/D3fIKLxE0nonGnD72lovDS/fbN4RWjltMoqGYGWc
 SlC94wUQmB+7AsigCj9FicV1PvQNdsFvY9rp6Ak5SzGzthNFQhBsbNwyGdJ3qO/Ca14o
 TQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683140114; x=1685732114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RzlKE1lmEmo/k0biH7eOIrCi/hE0/6/rGsPN37zmsG0=;
 b=hzbyutRgZtpWAV2smzIuMoNOWXJXATKGvfkEKnjxdjWJnJvsAEQf80zw2LrZSfNkVA
 bTjZPYGphC1omu5AqayZnqIg98K1ip+B6TI7JcK47PUYQUMOlSWhfxlqbjssqsApbEE5
 e7EMYjyuC+ztbNMp2hK9i/MHiiKbA7c/+i67AI+GOm5kynZCXakOgNwAdIyfh/6i1HVX
 yrE8VjTs+o8zVUGao4t+0wOpzGrcMGLgTydyQiH1cJQBPFU135gCHuS1IKvEFocabNrr
 vqxPd//mvfhFiR9XfsgrvNhL8Ygfr/ZEVFiKMUW0UPd1GTjfn/3fQWGXvj4zjU+WsWga
 eftg==
X-Gm-Message-State: AC+VfDy+1gv9njKgjZPSUe7ddbaT8HSE5XXYkCSVvEwdkT6Nc490SC/m
 RNH28IEJJG/a9vJGIfZOoKDgZhhWK/V5bmYBJgE=
X-Google-Smtp-Source: ACHHUZ4rxBl5rTLi/7ZYdcVQkny25pwnFx5IddcnegKa7NCertIhawpcK26CEDqB2dJiczBe6pxFkQ==
X-Received: by 2002:ac2:4907:0:b0:4ed:d5ce:7dea with SMTP id
 n7-20020ac24907000000b004edd5ce7deamr816556lfi.27.1683140114314; 
 Wed, 03 May 2023 11:55:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512014600b004efd3c2b746sm5726531lfo.162.2023.05.03.11.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 11:55:13 -0700 (PDT)
Message-ID: <a40c72c2-3483-020c-907e-6c7d84e88fbd@linaro.org>
Date: Wed, 3 May 2023 21:55:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/7] drm/msm/dpu: add DPU_PINGPONG_DSC bits into PP_BLK
 and PP_BLK_TE marcos
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-4-git-send-email-quic_khsieh@quicinc.com>
 <4315e96f-ed29-92aa-9549-d6fc9d820de6@linaro.org>
 <648e7cca-8bb1-73f0-2bbb-0a6b81df3882@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <648e7cca-8bb1-73f0-2bbb-0a6b81df3882@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/05/2023 20:45, Kuogee Hsieh wrote:
> 
> On 5/2/2023 3:42 PM, Dmitry Baryshkov wrote:
>> On 03/05/2023 00:02, Kuogee Hsieh wrote:
>>> At legacy chipsets, it required DPU_PINGPONG_DSC bit be set to indicate
>>> pingpong ops functions are required to complete DSC data path setup if
>>> this chipset has DSC hardware block presented. This patch add
>>> DPU_PINGPONG_DSC bit to both PP_BLK and PP_BLK_TE marcos if it has DSC
>>> hardware block presented.
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 12 +++++-----
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  8 +++----
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 26 
>>> ++++++++++------------
>>>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 24 
>>> ++++++++++----------
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 26 
>>> ++++++++++------------
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
>>>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  8 +++----
>>>   9 files changed, 54 insertions(+), 58 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> index 17f821c..b7cd746 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> @@ -112,16 +112,16 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
>>>   };
>>>     static const struct dpu_pingpong_cfg msm8998_pp[] = {
>>> -    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 
>>> BIT(DPU_PINGPONG_DSC), 0,
>>> +            sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>> -    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
>>> -            DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 
>>> BIT(DPU_PINGPONG_DSC), 0,
>>> +            sdm845_pp_sblk_te, DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, 0, sdm845_pp_sblk,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, 0, sdm845_pp_sblk,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>
>> Just to doublecheck: why don't we have DPU_PINGPONG_DSC for PP_3/_4? 
>> We do have them on sdm845. Is it because we should not use DSC with 
>> thos PINGPONG blocks?
>>
> I think it only have two DSPP connect to pp blocks

So, can they be connected to PP3/4 or not?

>>>   };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>> index ceca741..8888bd9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>> @@ -110,16 +110,16 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>>>   };
>>>     static const struct dpu_pingpong_cfg sdm845_pp[] = {
>>> -    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
>>> +    PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 
>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>>> -    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
>>> +    PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 
>>> BIT(DPU_PINGPONG_DSC), 0, sdm845_pp_sblk_te,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
>>> -    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
>>> +    PP_BLK("pingpong_2", PINGPONG_2, 0x71000, BIT(DPU_PINGPONG_DSC), 
>>> 0, sdm845_pp_sblk,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
>>> -    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
>>> +    PP_BLK("pingpong_3", PINGPONG_3, 0x71800, BIT(DPU_PINGPONG_DSC), 
>>> 0, sdm845_pp_sblk,
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>
>>
>> [skipped the rest, looks good to me]
>>

-- 
With best wishes
Dmitry

