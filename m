Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F606D2F6B
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 11:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F8710E0DF;
	Sat,  1 Apr 2023 09:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE0410E096
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 09:37:45 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id t14so25502113ljd.5
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 02:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680341861;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ou+x0/JGNTjCtW4P/4ZASSZXNvvBLOXDazxJnZOWUyE=;
 b=Cr3IOFs+YzLJPoz77mkb/YFRC+5fFo6lvqe5iFh1v41dqOzd1UG6lwOoSUDnVzUrmA
 83FZBpyk5Sa4oSj1m6HJ054SvXAOrj4g+2hF1LTGB+OTQgIdfkKjoG04nPmkaRX0qjBm
 YPGOw1CbE9iKQFNpoCBk4Tnh67dTH0tpKvsRZHktTwnUv9RCZn0tTLyL+KbyG4vBdA2x
 0x3cK3mDMw6VRaoWm//Tcutof7drJYlWA629K3JODEPe/Dx7gVk2mQYgeDkpm9xPEM+2
 VZwo1v9s0lnJ1eiw4HoGs6O67rSWICtBU1TM3rlZlKJViroYQ38QqO5QV/8416vHLxSQ
 MI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680341861;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ou+x0/JGNTjCtW4P/4ZASSZXNvvBLOXDazxJnZOWUyE=;
 b=pdupFtM0Y5QXtuPSFRNy1bEokXoRO/VF6rDedZcq2fJq0q2wHU2Yd2Rp0VUi2BZlBd
 qP0BPGuVlb70XfmSFid2cxsP1SJIOHpwLwOpX/+yBHP4b9PzyeH+a0noQ+RfqwTqkAO1
 JLaauZ03aD4Kgc1wSZ3oDd9AFGvS84Sqxcm8e6UhBahQ7t4bwlM5+C9LdzAMX/dSG7Id
 eSQIR8tc8Lo3+tPYW9quNIvW+30oQA8OcdB/934gYE1DnJPGNW181WZwUFp2EkNs3G1X
 y1pL4KL5s5AKyS69EbBKrW3YDRuvR5iu7xvah78fmhK4Xd/4cb5xr+c2WzSYkgFCGNvm
 tJ2g==
X-Gm-Message-State: AAQBX9clkM1KD13LEHOfSynglIXAFkBDJaKabyVF9B5pVhfOPZ/J9CpV
 7JEpz1xc0wXqg9iE7Sqmvm4VKA==
X-Google-Smtp-Source: AKy350a5Tfwqp3OhjiiZWkhvLquHcjMwwMPSbG9HdDez7N5eLlKSS6REe7TpcrEGtHP2ohHeGMYpIw==
X-Received: by 2002:a2e:7814:0:b0:29b:2527:4d0f with SMTP id
 t20-20020a2e7814000000b0029b25274d0fmr9406864ljc.18.1680341861373; 
 Sat, 01 Apr 2023 02:37:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a2e8203000000b00294692d8645sm742976ljg.17.2023.04.01.02.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 02:37:40 -0700 (PDT)
Message-ID: <d4a6d956-deaa-2a5b-0a3e-07681c321df1@linaro.org>
Date: Sat, 1 Apr 2023 12:37:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 01/38] drm/msm/dpu: Allow variable SSPP/INTF_BLK size
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
 <20230330215324.1853304-2-dmitry.baryshkov@linaro.org>
 <8ac70629-15e5-96d5-542c-8b620b8915c9@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8ac70629-15e5-96d5-542c-8b620b8915c9@quicinc.com>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2023 03:57, Abhinav Kumar wrote:
> 
> 
> On 3/30/2023 2:52 PM, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> These blocks are of variable length on different SoCs. Set the
>> correct values where I was able to retrieve it from downstream
>> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
>> intf) otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> [DB: fixed some of lengths]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Can you please split this to two changes one for SSPP and one for INTF 
> block?

Ack, of course. Thanks a lot for the comments to this patch. This is, I 
think,  what we missed from the vendor dtsi files.

> 
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 243 +++++++++---------
>>   1 file changed, 122 insertions(+), 121 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 6840b22a4159..e44e7455a56e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -1172,11 +1172,11 @@ static const struct dpu_sspp_sub_blks 
>> sdm845_dma_sblk_1 = _DMA_SBLK("9", 2);
>>   static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = 
>> _DMA_SBLK("10", 3);
>>   static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = 
>> _DMA_SBLK("11", 4);
>> -#define SSPP_BLK(_name, _id, _base, _features, \
>> +#define SSPP_BLK(_name, _id, _base, _len, _features, \
>>           _sblk, _xinid, _type, _clkctrl) \
>>       { \
>>       .name = _name, .id = _id, \
>> -    .base = _base, .len = 0x1c8, \
>> +    .base = _base, .len = _len, \
>>       .features = _features, \
>>       .sblk = &_sblk, \
>>       .xin_id = _xinid, \
>> @@ -1185,40 +1185,40 @@ static const struct dpu_sspp_sub_blks 
>> sdm845_dma_sblk_3 = _DMA_SBLK("11", 4);
>>       }
>>   static const struct dpu_sspp_cfg msm8998_sspp[] = {
>> -    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_MSM8998_MASK,
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1ac, VIG_MSM8998_MASK,
>>           msm8998_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_MSM8998_MASK,
>> +    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1ac, VIG_MSM8998_MASK,
>>           msm8998_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>> -    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_MSM8998_MASK,
>> +    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1ac, VIG_MSM8998_MASK,
>>           msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>> -    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_MSM8998_MASK,
>> +    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1ac, VIG_MSM8998_MASK,
>>           msm8998_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_MSM8998_MASK,
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1ac, DMA_MSM8998_MASK,
>>           sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> -    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_MSM8998_MASK,
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1ac, DMA_MSM8998_MASK,
>>           sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>> -    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_MSM8998_MASK,
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, 
>> DMA_CURSOR_MSM8998_MASK,
>>           sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>> -    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_MSM8998_MASK,
>> +    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, 
>> DMA_CURSOR_MSM8998_MASK,
>>           sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>>   };
>>   static const struct dpu_sspp_cfg sdm845_sspp[] = {
>> -    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1c8, VIG_SDM845_MASK_SDMA,
>>           sdm845_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1c8, VIG_SDM845_MASK_SDMA,
>>           sdm845_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>> -    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1c8, VIG_SDM845_MASK_SDMA,
>>           sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>> -    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1c8, VIG_SDM845_MASK_SDMA,
>>           sdm845_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1c8, DMA_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> -    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1c8, DMA_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>> -    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  
>> DMA_CURSOR_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1c8, 
>> DMA_CURSOR_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>> -    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  
>> DMA_CURSOR_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1c8, 
>> DMA_CURSOR_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>>   };
>> @@ -1229,13 +1229,13 @@ static const struct dpu_sspp_sub_blks 
>> sc7280_vig_sblk_0 =
>>               _VIG_SBLK_ROT("0", 4, DPU_SSPP_SCALER_QSEED4, 
>> &dpu_rot_sc7280_cfg_v2);
>>   static const struct dpu_sspp_cfg sc7180_sspp[] = {
>> -    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>>           sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>>           sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> -    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, 
>> DMA_CURSOR_SDM845_MASK,
>>           sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>> -    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, 
>> DMA_CURSOR_SDM845_MASK,
>>           sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>>   };
>> @@ -1243,9 +1243,9 @@ static const struct dpu_sspp_sub_blks 
>> sm6115_vig_sblk_0 =
>>                   _VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED4);
>>   static const struct dpu_sspp_cfg sm6115_sspp[] = {
>> -    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
>>           sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>>           sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>>   };
>> @@ -1259,21 +1259,21 @@ static const struct dpu_sspp_sub_blks 
>> sm8250_vig_sblk_3 =
>>                   _VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>>   static const struct dpu_sspp_cfg sm8250_sspp[] = {
>> -    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK_SDMA,
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK_SDMA,
>>           sm8250_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK_SDMA,
>> +    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK_SDMA,
>>           sm8250_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>> -    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK_SDMA,
>> +    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK_SDMA,
>>           sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>> -    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK_SDMA,
>> +    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK_SDMA,
>>           sm8250_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> -    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>> -    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  
>> DMA_CURSOR_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, 
>> DMA_CURSOR_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>> -    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  
>> DMA_CURSOR_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, 
>> DMA_CURSOR_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>>   };
>> @@ -1287,21 +1287,21 @@ static const struct dpu_sspp_sub_blks 
>> sm8450_vig_sblk_3 =
>>                   _VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>>   static const struct dpu_sspp_cfg sm8450_sspp[] = {
>> -    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
>> -        sm8450_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
>> -        sm8450_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>> -    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
>> +        sm8450_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> +    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
>> +        sm8450_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>> +    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
>>           sm8450_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>> -    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
>> -        sm8450_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
>> +        sm8450_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
>>           sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> -    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
>>           sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>> -    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, 
>> DMA_CURSOR_SDM845_MASK,
>>           sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>> -    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_CURSOR_SDM845_MASK,
>> +    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, 
>> DMA_CURSOR_SDM845_MASK,
>>           sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>>   };
> 
> This should be 0x32c.

Argh. waipio-sde-common has 0x328 for SSPP size. I'll fix this

> 
>> @@ -1317,36 +1317,36 @@ static const struct dpu_sspp_sub_blks 
>> sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
>>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = 
>> _DMA_SBLK("13", 6);
>>   static const struct dpu_sspp_cfg sm8550_sspp[] = {
>> -    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
>> -        sm8550_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
>> -        sm8550_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>> -    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x344, VIG_SC7180_MASK,
>> +        sm8550_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> +    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x344, VIG_SC7180_MASK,
>> +        sm8550_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>> +    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x344, VIG_SC7180_MASK,
>>           sm8550_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>> -    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
>> -        sm8550_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x344, VIG_SC7180_MASK,
>> +        sm8550_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x344, DMA_SDM845_MASK,
>>           sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> -    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x344, DMA_SDM845_MASK,
>>           sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>> -    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x344, DMA_SDM845_MASK,
>>           sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>> -    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x344, DMA_SDM845_MASK,
>>           sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>> -    SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
>> +    SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, 0x344, 
>> DMA_CURSOR_SDM845_MASK,
>>           sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
>> -    SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
>> +    SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, 0x344, 
>> DMA_CURSOR_SDM845_MASK,
>>           sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
>>   };
>>   static const struct dpu_sspp_cfg sc7280_sspp[] = {
>> -    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK_SDMA,
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK_SDMA,
>>           sc7280_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> -    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, 
>> DMA_CURSOR_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>> -    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  
>> DMA_CURSOR_SDM845_MASK_SDMA,
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, 
>> DMA_CURSOR_SDM845_MASK_SDMA,
>>           sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>>   };
>> @@ -1359,22 +1359,23 @@ static const struct dpu_sspp_sub_blks 
>> sc8280xp_vig_sblk_2 =
>>   static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
>>                   _VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>> +/* FIXME: check block length */
>>   static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>> -    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
>> -         sc8280xp_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
>> -         sc8280xp_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>> -    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x2ac, VIG_SC7180_MASK,
>> +         sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> +    SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x2ac, VIG_SC7180_MASK,
>> +         sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>> +    SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x2ac, VIG_SC7180_MASK,
>>            sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>> -    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
>> -         sc8280xp_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x2ac, VIG_SC7180_MASK,
>> +         sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x2ac, DMA_SDM845_MASK,
>>            sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>> -    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x2ac, DMA_SDM845_MASK,
>>            sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>> -    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
>> +    SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x2ac, 
>> DMA_CURSOR_SDM845_MASK,
>>            sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
>> -    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
>> +    SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x2ac, 
>> DMA_CURSOR_SDM845_MASK,
>>            sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
>>   };
>> @@ -1395,9 +1396,9 @@ static const struct dpu_sspp_sub_blks 
>> qcm2290_vig_sblk_0 = _VIG_SBLK_NOSCALE("0"
>>   static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = 
>> _DMA_SBLK("8", 1);
>>   static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>> -    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
>> +    SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_QCM2290_MASK,
>>            qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>> -    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>> +    SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
>>            qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>>   };
>> @@ -1853,10 +1854,10 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
>>   /*************************************************************
>>    * INTF sub blocks config
>>    *************************************************************/
>> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, 
>> _features, _reg, _underrun_bit, _vsync_bit) \
>> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, 
>> _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
>>       {\
>>       .name = _name, .id = _id, \
>> -    .base = _base, .len = 0x280, \
>> +    .base = _base, .len = _len, \
>>       .features = _features, \
>>       .type = _type, \
>>       .controller_id = _ctrl_id, \
>> @@ -1866,85 +1867,85 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
>>       }
>>   static const struct dpu_intf_cfg msm8998_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> -    INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -    INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> -    INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> +    INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> +    INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_HDMI, 0, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>   };
>>   static const struct dpu_intf_cfg sdm845_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> -    INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -    INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> -    INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> +    INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 0, 24, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 24, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> +    INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 1, 24, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>   };
>>   static const struct dpu_intf_cfg sc7180_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 
>> 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> -    INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_0", INTF_0, 0x6A000, 0x2b8, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>   };
>>
> 
> INTF_0 is DP and INTF_1 is DSI.
> 
> 0x2b8 comes because from offset 0 to 0x27c are the intf registers and 
> from offset 0x280 to offset 0x2c0 and INTF TE registers.
> 
> So INTF_0 will not have those.
> 
> This should be change to 0x280 for INTF_0
> and 0x2c0 for INTF_1

Ack, thanks for the explanation.

Could you please verify my summary then. For non-DSI-TE INTF blocks the 
size is always 0x280. Otherwise:

DPU | SoC      | INTF_DSI size
5.0 | sm8150   | ? 0x2bc
5.1 | sc8180x  | 0x2bc
6.0 | sm8250   | ? 0x2c0
6.2 | sc7180   | 0x2c0
6.3 | sm6115   | 0x2c0
6.5 | qcm2290  | 0x2c0
7.0 | sm8350   | 0x2c4
7.2 | sc7280   | 0x2c4
8.0 | sc8280xp | 0x300
8.1 | sm8450   | 0x300
9.0 | sm8550   | 0x300

> 
>>   static const struct dpu_intf_cfg sm8150_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> -    INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -    INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> -    INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> +    INTF_BLK("intf_0", INTF_0, 0x6A000, 0x2b8, INTF_DP, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_2", INTF_2, 0x6B000, 0x2b8, INTF_DSI, 1, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> +    INTF_BLK("intf_3", INTF_3, 0x6B800, 0x2b8, INTF_DP, 1, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>   };
> 
> I dont have access to this document but should follow the above example. 
> By the time you repost this, I should have access.

I think it should follow the drill.

> 
>>   static const struct dpu_intf_cfg sc7280_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> -    INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -    INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_1, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>> +    INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>>   };
> 
> INTF_0 and INTF_5 is DP and eDP respectively. They will only go till 0x280
> 
> INTF_1 is DSI so that goes to 0x2c4 because 0x280 to 0x2c4 are tear 
> check blocks.
> 
> In general, tear check blocks are applicable only to DSI as DP/eDP are 
> video mode panels.
> 
>>   static const struct dpu_intf_cfg sm8350_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> -    INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -    INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> -    INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> +    INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> +    INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_DP, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>   };
> 
> DP interfaces dont have tear check. Those will go till 0x280
> 
> Tear check blocks only for DSI. Those go till 0x2c4.
> 
> I am guessing the TEAR_IRQ block is separately mapped and will come part 
> of Marijn's INTF TE series.

Yes

> 
>>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 
>> 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> -    INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -    INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> +    INTF_BLK("intf_0", INTF_0, 0x6A000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x6A800, 0x280, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_2", INTF_2, 0x6B000, 0x280, INTF_DSI, 1, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>>       /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index 
>> until this is supported */
>> -    INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> -    INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 
>> 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
>> -    INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 
>> 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>> +    INTF_BLK("intf_3", INTF_3, 0x6B800, 0x280, INTF_DP, 999, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> +    INTF_BLK("intf_4", INTF_4, 0x6C000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
>> +    INTF_BLK("intf_5", INTF_5, 0x6C800, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>>   };
> 
> For this you are not mapping the intf te block for DSI at all.Otherwise 
> it goes to 0x2bc.
> 
> Just to be consistent, do we want to map intf te blocks here or not?
> 
> We could either leave out intf te block completely and reduce the 
> offsets so that Marijn's series adds that OR include them in the mapping 
> but correctly. But we should be consistent.

As it is not a separate subblock, I think we should include it. I 
trusted vendor dtsi too much for these values.

> 
>>   /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for 
>> now */
>>   static const struct dpu_intf_cfg sc8280xp_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> -    INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -    INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> -    INTF_BLK("intf_3", INTF_3, 0x37000, INTF_NONE, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> -    INTF_BLK("intf_4", INTF_4, 0x38000, INTF_DP, MSM_DP_CONTROLLER_1, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
>> -    INTF_BLK("intf_5", INTF_5, 0x39000, INTF_DP, MSM_DP_CONTROLLER_3, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>> -    INTF_BLK("intf_6", INTF_6, 0x3a000, INTF_DP, MSM_DP_CONTROLLER_2, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
>> -    INTF_BLK("intf_7", INTF_7, 0x3b000, INTF_NONE, 
>> MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
>> -    INTF_BLK("intf_8", INTF_8, 0x3c000, INTF_NONE, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
>> +    INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> +    INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_NONE, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> +    INTF_BLK("intf_4", INTF_4, 0x38000, 0x2c4, INTF_DP, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
>> +    INTF_BLK("intf_5", INTF_5, 0x39000, 0x2c4, INTF_DP, 
>> MSM_DP_CONTROLLER_3, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>> +    INTF_BLK("intf_6", INTF_6, 0x3a000, 0x2c4, INTF_DP, 
>> MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 16, 17),
>> +    INTF_BLK("intf_7", INTF_7, 0x3b000, 0x2c4, INTF_NONE, 
>> MSM_DP_CONTROLLER_2, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 18, 19),
>> +    INTF_BLK("intf_8", INTF_8, 0x3c000, 0x2c4, INTF_NONE, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 12, 13),
>>   };
> 
> Again 0x280 for non-dsi interfaces
> 
> and 0x300 for DSI including tear block otherwise 0x280.
> 
>>   static const struct dpu_intf_cfg qcm2290_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
>> -    INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_0", INTF_0, 0x00000, 0x2b8, INTF_NONE, 0, 0, 0, 0, 
>> 0, 0),
>> +    INTF_BLK("intf_1", INTF_1, 0x6A800, 0x2b8, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>   };
>>
> 
> This should be 0x2c0 including tear block otherwise 0x280.
> 
>>   static const struct dpu_intf_cfg sm8450_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> -    INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -    INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> -    INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> +    INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_1", INTF_1, 0x35000, 0x2c4, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_2", INTF_2, 0x36000, 0x2c4, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> +    INTF_BLK("intf_3", INTF_3, 0x37000, 0x2c4, INTF_DP, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>   };
> 
> This should be 0x300 for DSI including tear block otherwise 0x280.
> 
>>   static const struct dpu_intf_cfg sm8550_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> +    INTF_BLK("intf_0", INTF_0, 0x34000, 0x300, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>       /* TODO TE sub-blocks for intf1 & intf2 */
>> -    INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -    INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> -    INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 
>> 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> +    INTF_BLK("intf_1", INTF_1, 0x35000, 0x300, INTF_DSI, 0, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> +    INTF_BLK("intf_2", INTF_2, 0x36000, 0x300, INTF_DSI, 1, 24, 
>> INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> +    INTF_BLK("intf_3", INTF_3, 0x37000, 0x300, INTF_DP, 
>> MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>>   };
> 
> 0x280 for non-DSI interfaces and 0x300 for DSI ones.
> 
>>   /*************************************************************

-- 
With best wishes
Dmitry

