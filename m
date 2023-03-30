Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DE06D049D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E144110E32B;
	Thu, 30 Mar 2023 12:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A6410E32B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:24:13 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id a44so743577ljr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680179051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1452CrR74MLGlpKnROQc0oL00+8IeTrr7peIVEjnGYs=;
 b=w/O9wzcIaDqph9naSiDyJVk5wfhV1HgAnsrS+l3IZ9i3KrI0MUHWcXbg+Dz0V1uF8d
 lFodObENP15TNLr+ObbO8/DR9+dr4TJ57LV4si+dhTEikSIbyr6fjupZYPhrIWH/bNp3
 +G5kQGcPDD5aurCgDEZuzFHMC8LmTG/mN9MRiSgYVL5UwTy3qIN8gENVYzjufPDX+9pZ
 fXiTInRHJ0rYa780WP0OGYyljkWGbfumzPv+3i/AZie1BdJI03vlOD0iqnJ0Jz2fuAVQ
 ip8au7FDcldbpayhAfuL34uLsY/N9YntfE4qDNFx6HBqGZWUzWCld7JtFQ2LJ7dtwZjv
 KmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179051;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1452CrR74MLGlpKnROQc0oL00+8IeTrr7peIVEjnGYs=;
 b=DiLB05Vky7zRSU6iN1OL5hMPEs4CIchTlZBa43rbL+SVqh39vOueWwUHwID6SdDSxb
 im/q7lCglT/UX43r6mRhyAIQBCYtVRhWsfryKmmG82UdC6qedNt9HXRkuPNzYVa3Yt5r
 jr5EQHNO8q4a3mM4miD/jCu576z4jVutixbSncVjG8OgK51AoxtHHJD9jnTRpRxsNYV4
 O0Ym4fUtWJrlxN2TRhyVFoV4nNFZVFjH2RNsiuy/xIhyvvwjvroiQfzlQpMiWz4TNRTx
 uszO5HAmXPbnvRp1yH1v9qALJOlcrHXhTLA7tfM8G3r+yczfqww4P1rdGBBmGASGSgtl
 kO2Q==
X-Gm-Message-State: AAQBX9fAUyshiEGXDNL11iRkUuOzBZkkqB9RA1gHGkPtd11IiAvPH9mW
 9QssG+IzHhBjxEHEv8M7raQivg==
X-Google-Smtp-Source: AKy350YoASw6lgVw9JSXYoBj2ZnkqZYuzNm6BsEt8qJOp+l3+rANzSxX2/xYYDqHzsJ7Iv2oU4NBJw==
X-Received: by 2002:a2e:908f:0:b0:2a6:1681:81e0 with SMTP id
 l15-20020a2e908f000000b002a6168181e0mr825763ljg.2.1680179051702; 
 Thu, 30 Mar 2023 05:24:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a2e9385000000b002959d2cc975sm5842595ljh.37.2023.03.30.05.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:24:11 -0700 (PDT)
Message-ID: <7953ad89-eb30-a7e0-1ba0-7032f2646948@linaro.org>
Date: Thu, 30 Mar 2023 15:24:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,32/50] drm/msm/dpu: duplicate sc7180 catalog entries
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-33-dmitry.baryshkov@linaro.org>
 <8b3ce350-3cd0-2712-3de5-a29a2592e440@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8b3ce350-3cd0-2712-3de5-a29a2592e440@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 15:22, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Duplicate some of sc7180 catalog entries to remove dependencies between
>> DPU major generations.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 8977878890f1..3117bb358117 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -82,6 +82,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
>>   		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
>>   };
>>   
>> +static const struct dpu_dspp_cfg sc7280_dspp[] = {
>> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>> +		 &sc7180_dspp_sblk),
> If I'm following correctly, the sc7180_dspp_sblk is still defined
> in the common hw_catalog.c and things won't explode.

Yes, I left sblk definitions in place (for now). We can consider 
splitting/moving them afterwards, as we get the overall picture.

> 
> In that case:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
>> +};
>> +
>>   static const struct dpu_pingpong_cfg sc7280_pp[] = {
>>   	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
>>   	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
>> @@ -132,8 +137,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
>>   	.ctl = sc7280_ctl,
>>   	.sspp_count = ARRAY_SIZE(sc7280_sspp),
>>   	.sspp = sc7280_sspp,
>> -	.dspp_count = ARRAY_SIZE(sc7180_dspp),
>> -	.dspp = sc7180_dspp,
>> +	.dspp_count = ARRAY_SIZE(sc7280_dspp),
>> +	.dspp = sc7280_dspp,
>>   	.mixer_count = ARRAY_SIZE(sc7280_lm),
>>   	.mixer = sc7280_lm,
>>   	.pingpong_count = ARRAY_SIZE(sc7280_pp),

-- 
With best wishes
Dmitry

