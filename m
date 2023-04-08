Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA656DB77E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 02:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C59710ED48;
	Sat,  8 Apr 2023 00:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C702810ED48
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 00:08:25 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g19so43076633lfr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 17:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680912503;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q52RhaPWZYQl4qrgQRoYGqFIfkaQO5K6uQ6eIg6dVYM=;
 b=hKBMT6KzukOcErWVkPllPEGW/rUOfehuxtcQXjpqLq52YSu5vfqZbM+r1sPKzOU1ux
 9TDhNDzpyIlVt5DZKWrtGrzYVdKa2nDj5jSPB9rwwBmcuHQeiWP5brv08pf8lE0+qoQh
 60aXPNE27gFgErdkM5gz6WDGRvPk2HvIncnnuxIoQIIDMoxo0lBC6Npqw/R84YiWyCXZ
 Fi52uTBofG38PUMoqwRKST7aIQAwR9dqAlR9IqdUO0jWIVkFiNqLu7ilxxdtOW8Mv+Yw
 YRREZXLsdk5JHbAjzWCGPnXGGpZA21qEypIxnWoaVp5H/1DHeUNzYaCKt0YmhyICyf8r
 0GIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680912503;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q52RhaPWZYQl4qrgQRoYGqFIfkaQO5K6uQ6eIg6dVYM=;
 b=gl0wUGFKDDcP+z+YCplMShcIB5FE2yPGizJ+/ekDjxEosgjgj5WoPpgotvNhtGfbz3
 iyK8Vinxb6RRj3juvcPwWnYmxuk8bxguPZubfL7dbZ3QwoauonpaPvwszNO3P2+wUaI2
 TfF8ywhvKfLGSdXqNrG7ASzFkmlYhZZ6ZAmwYx+gJKe+hapKZh3vqeHPfBAmfKdeJ9ZX
 Mc2lpnV5lkZyY20euyeEn/np53V5BsMFXCOYg+EggSLgoMdaXwBFPzt7gFMiSBJ16b9D
 DE6fQ8UNcmcGRlNVH02k3GTZjCy4ZMWe1JvbnHf0Gkjznmruvb3iw7mJ2OVxseCwTEec
 NQfQ==
X-Gm-Message-State: AAQBX9eTe0p73Qs+bBr8aOyuF38r0+H7x3PzTB07HoM/0ZEu8XM7maC0
 +6AtZbxAra4LS+QKZgF4h0n1zg==
X-Google-Smtp-Source: AKy350aVAnakyPkA9Sqo+pYVuOqI/HIu9M9sQHRhhZ7x+ozfyFdwxKeRp4fRZdFHRo9tia6ByBNyIA==
X-Received: by 2002:ac2:5091:0:b0:4e0:ff8e:bbfe with SMTP id
 f17-20020ac25091000000b004e0ff8ebbfemr976597lfm.12.1680912503139; 
 Fri, 07 Apr 2023 17:08:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a19750d000000b004dab932248fsm924878lfe.180.2023.04.07.17.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 17:08:22 -0700 (PDT)
Message-ID: <5c991e32-693f-3b9a-3910-7c98e04b017a@linaro.org>
Date: Sat, 8 Apr 2023 03:08:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 34/42] drm/msm/dpu: enable DSPP and DSC on sc8180x
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-35-dmitry.baryshkov@linaro.org>
 <6b144e9f-0607-62db-05ee-58d5640807ab@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6b144e9f-0607-62db-05ee-58d5640807ab@quicinc.com>
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

On 08/04/2023 02:43, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 6:06 AM, Dmitry Baryshkov wrote:
>> Enable DSPP and DSC hardware blocks on sc8180x platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 26 +++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> index fb8cdcd6bfe9..93d303cc0dc5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> @@ -102,9 +102,9 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>>   static const struct dpu_lm_cfg sc8180x_lm[] = {
>>       LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
>> -        &sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
>> +        &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>>       LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>> -        &sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
>> +        &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>>       LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>>           &sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
>>       LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
>> @@ -115,6 +115,17 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>>           &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
>>   };
>> +static const struct dpu_dspp_cfg sc8180x_dspp[] = {
>> +    DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>> +         &sm8150_dspp_sblk),
>> +    DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
>> +         &sm8150_dspp_sblk),
>> +    DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
>> +         &sm8150_dspp_sblk),
>> +    DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
>> +         &sm8150_dspp_sblk),
>> +};

> 
> I was looking at DSPP_SC7180_MASK. This has only PCC. Today the only 
> DSPP feature we are supporting seems to be PCC as the "gc" base is not 
> used. In that aspect this is fine. Perhaps getting rid of 
> DSPP_SC7180_MASK and just using the feature mask directly is more 
> appropriate here. So BIT(DPU_DSPP_PCC). I dont know if you want to 
> handle that in a separate series to replace DSPP_SC7180_MASK with 
> BIT(DPU_DSPP_PCC)

I have not yet had time to look on the DSPP details and/or different 
features per SoC. So, I followed current approach. If anybody has time 
to take a look and cleanup DSPP handling, I'd be grateful. If not, it 
will wait for somebody to volunteer (or for you or me to have time for 
that).

> 
> So do we also need to correct the msm8998 DSPP mask because gc is really 
> not programmed today from what I can see. So that mask really is not 
> doing anything.
> 
>> +
>>   static const struct dpu_pingpong_cfg sc8180x_pp[] = {
>>       PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, 
>> sdm845_pp_sblk_te,
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>> @@ -142,6 +153,13 @@ static const struct dpu_merge_3d_cfg 
>> sc8180x_merge_3d[] = {
>>       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
>>   };
>> +static const struct dpu_dsc_cfg sc8180x_dsc[] = {
>> +    DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +    DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +    DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +    DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +};
> 
> There is also DSC_4 and DSC_5 at 0x81000 and 0x81400 resp.

Hmm. I was using sdmshrike-sde.dtsi as a reference. I'll add two more 
DSC units.

> 
> Rest LGTM.

Thanks

> 
>> +
>>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>>       INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 
>> MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>       INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, 
>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> @@ -190,6 +208,10 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>>       .sspp = sc8180x_sspp,
>>       .mixer_count = ARRAY_SIZE(sc8180x_lm),
>>       .mixer = sc8180x_lm,
>> +    .dspp_count = ARRAY_SIZE(sc8180x_dspp),
>> +    .dspp = sc8180x_dspp,
>> +    .dsc_count = ARRAY_SIZE(sc8180x_dsc),
>> +    .dsc = sc8180x_dsc,
>>       .pingpong_count = ARRAY_SIZE(sc8180x_pp),
>>       .pingpong = sc8180x_pp,
>>       .merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),

-- 
With best wishes
Dmitry

