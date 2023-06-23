Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A5773B61A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 13:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C7710E038;
	Fri, 23 Jun 2023 11:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0B610E06C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 11:25:19 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b474dac685so8760661fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687519516; x=1690111516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bgUU4kvAWecThTaVy7iKimbNi3/uDtCuo4ZewB7tiTc=;
 b=kaX5kXkyDwwuO+WvzfTRq8TZhvC0S7824aUsuyaTm1w50bfBpLmxQRAxNJemjzBo1y
 k4Xi0CkdmN7IHac5iaAZIKbzJBYsDB1Aoy6hmQwn9GN3t32gijbw/lmiYAg56+AGt8vI
 ZO+HZmMKf4YYAfx7rW3GxL2e7p3ftE8OEReRFO8SQLGj+iTO2pJpPwj+8+iR9z3qvEgt
 Ox6YX8bshivrWzXBLRJdkKoZ+bzb8ISybhjf/cP+PEopTkErBxQlqqPTE/moGjsBgB2H
 sePpgZVqBTIHG7cQAsLtoWovQYiN3lfaZLMGnUV4zOmEOEziKXc6b+shyYsVXKG0xPX7
 ch4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687519516; x=1690111516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bgUU4kvAWecThTaVy7iKimbNi3/uDtCuo4ZewB7tiTc=;
 b=D1t9K+yqrGcxqY927HWwlYNA3dp6kkYEtuvgu8MsYjYPMah3ibtSdG9IQJ19s24BjO
 6tMPPhYMQoi/yaSxC7XD2XIOPWepWvRp/5bJf1PZ3z55hWh1e8QCvvTc19chzZ4mqtle
 cSbuP0o+YmI7Z8oTgX22BYdCFvkCaxETFTttkWfqWd2k+mSj3QIOfBOJMRFf2Zf1lJ5g
 jWZVrOf/yzH/8onBrvsgyBuXRQpkZhoj76yIzNW6A3TnL5u6EjndNWDZ/j/HYyqJ9SIG
 ag3yikR3GXdHxswsEvPzn0sXN0LJfRWhCKmKOrU5CdIxnUqcb/SiHZNdAi9p/ksde2EM
 0Vkg==
X-Gm-Message-State: AC+VfDzaLi/9HmmQripqNx0shirO0SGySZVTI4zqmvdr62u3ARaar17d
 AVfaoWFiO/fBdH6l0dG2ndUP8Q==
X-Google-Smtp-Source: ACHHUZ56os1dzwaBZbEzRw6FhwI6ogZcRqVZVDGqw3GI2eal3+2tbgJZWSCRzaK8MCvvqA90QcwYhQ==
X-Received: by 2002:a2e:95c2:0:b0:2ae:db65:2d01 with SMTP id
 y2-20020a2e95c2000000b002aedb652d01mr14522612ljh.23.1687519516113; 
 Fri, 23 Jun 2023 04:25:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h27-20020a2eb0fb000000b002b3e5794516sm1689893ljl.26.2023.06.23.04.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 04:25:15 -0700 (PDT)
Message-ID: <d98ddf40-c4b5-56a4-c444-2d87712a6ebd@linaro.org>
Date: Fri, 23 Jun 2023 14:25:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
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

On 23/06/2023 08:47, Abhinav Kumar wrote:
> 
> 
> On 6/22/2023 6:37 PM, Dmitry Baryshkov wrote:
>> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
>> This includes the common block itself, enc subblocks and some empty
>> space around. Change that to pass 0x4 instead, the length of common
>> register block itself.
>>
>> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant 
>> chipsets")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> There is no need of a fixes tag for this.
> 
> This is not a bug but was intentional.

We have other subblocks which are not dumped withoyt Ryan's patchset. So 
this declaration should be corrected.

> 
> Till we added sub-block parsing support we had to dump the whole block.
> 
> And hence I would suggest this change should be merged after the 
> sub-block parsing change otherwise we wont have full register dumps for 
> DSC.

No, the order should be opposite: this is merged first, then subblocks 
dumping can use block->len in all the cases.

> 
> Also, please add :
> 
> Suggested-by: Ryan McCann <quic_rmccann@quicinc.com>

More likely:

Reported-by: Ryan McCann <quic_rmccann@quicinc.com>

> 
> 
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  8 ++++----
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  8 ++++----
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  8 ++++----
>>   5 files changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index 8da424eaee6a..6edf323f381f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -159,10 +159,10 @@ static const struct dpu_merge_3d_cfg 
>> sm8350_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sm8350_dsc[] = {
>> -    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>   };
>>   static const struct dpu_intf_cfg sm8350_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 900fee410e11..5354003aa8be 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -104,7 +104,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>>   /* NOTE: sc7280 only has one DSC hard slice encoder */
>>   static const struct dpu_dsc_cfg sc7280_dsc[] = {
>> -    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>>   };
>>   static const struct dpu_wb_cfg sc7280_wb[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index f6ce6b090f71..1d374abec1fd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -148,12 +148,12 @@ static const struct dpu_merge_3d_cfg 
>> sc8280xp_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>> -    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> -    DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x29c, 0, dsc_sblk_0),
>> -    DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x29c, 0, dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x4, 0, dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x4, 0, dsc_sblk_1),
>>   };
>>   /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for 
>> now */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> index 8d13c369213c..79447d8cab05 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> @@ -167,10 +167,10 @@ static const struct dpu_merge_3d_cfg 
>> sm8450_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sm8450_dsc[] = {
>> -    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>   };
>>   static const struct dpu_intf_cfg sm8450_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index f17b9a7fee85..26e3c28003f7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -171,10 +171,10 @@ static const struct dpu_merge_3d_cfg 
>> sm8550_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sm8550_dsc[] = {
>> -    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
>> +    DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> +    DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, 
>> BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>>   };
>>   static const struct dpu_intf_cfg sm8550_intf[] = {

-- 
With best wishes
Dmitry

