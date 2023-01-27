Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4BE67E80A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 15:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F182B10E997;
	Fri, 27 Jan 2023 14:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2A310E997
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 14:20:55 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x7so1641071edr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 06:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s1mMOgOAUczPiRdH6XCgg9V9JLsmma56WmhiUpM4dfA=;
 b=hYBaOruFI14ltOb8P+C731dFIXvnBH5xYO2UGG5apyjFRSh2LbfUvZjFkrzgRpFnnk
 lUkYdct5EGEoiBHg79czlY72qVp3ZD10mY6Xi3gkgdNW7W9WlSdzcK93yVotezI4Y83A
 kiIOMkbKII7r+/xv4WMneecGHC+ggQU/WTed+9ksZpRiA/9aShl29mBEU8OeavwRa7Ve
 qLBi7PJ/fa402uq8Jxi1i47giTqUeXVfzLjVqbE2v4lstuIA/QALp8ptDLZC/Oo9gmjN
 asNAzcHHBmg41+SfmXzh4yrRVvAfUuLpVoOf5ln047Z6C7nka0Yit37cY/pYsOci3PGi
 0l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s1mMOgOAUczPiRdH6XCgg9V9JLsmma56WmhiUpM4dfA=;
 b=FNRfjgesTLub+IxucGphaB+bk0e72a/ZM+xUV9qrXa8E30+99D6734QHOzSK/9TPtM
 x9wM1UkpKOje6h5HYYhFQPIDEbDobNSNgvSoQPvWGZg4o2gly3kb3vQs6UmkGzKfCqN4
 P1cV5NXK7gnbNwPEO7yJqLT0+eB6GgTyYwicA+UOFJgYjL/9danlCDKSjGa6LZt8eprX
 bQGDio1KsJJKibVuHG9vwFnMCSoWzN0xSxMB2Z13QHLTAwPR9Bl6x+VYfwxCnoY7xVse
 g4Zhft00cczV8OLYEICREh/CSOz/0s6vJb7Pi8DIgCuUOxuIT2tW96f342Uf0TAp2kn7
 s/uw==
X-Gm-Message-State: AFqh2koe6qv/s/OvvzRgqeEYvvJj4B1jwp0vDcqDhYqBA+RtwzJrNRK/
 M4+TMGTsIyFvJCT6BJ4lorMFMA==
X-Google-Smtp-Source: AMrXdXvN9nzYJ7tRCLEzVs0mhMBMiEU22SiCe0tmNjgYzRK1+B0pxIrdNhOhuHXmjcmFvbxLVWHW1A==
X-Received: by 2002:a05:6402:4d6:b0:46c:6ed1:83ac with SMTP id
 n22-20020a05640204d600b0046c6ed183acmr41820400edw.9.1674829253644; 
 Fri, 27 Jan 2023 06:20:53 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a056402255300b00488abbbadb3sm2362546edb.63.2023.01.27.06.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 06:20:53 -0800 (PST)
Message-ID: <18aad46a-b3d5-dadd-0e22-7b2f5938b761@linaro.org>
Date: Fri, 27 Jan 2023 15:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 13/14] drm/msm/a6xx: Add A619_holi speedbin support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
 <20230126151618.225127-14-konrad.dybcio@linaro.org>
 <c8d9d5f0-dab8-4dca-5a32-1f4e11ecc964@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c8d9d5f0-dab8-4dca-5a32-1f4e11ecc964@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27.01.2023 15:19, Dmitry Baryshkov wrote:
> On 26/01/2023 17:16, Konrad Dybcio wrote:
>> A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
>> (blair). This is what seems to be a first occurrence of this happening,
>> but it's easy to overcome by guarding the SoC-specific fuse values with
>> of_machine_is_compatible(). Do just that to enable frequency limiting
>> on these SoCs.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 452ba32699b2..89990bec897f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -2091,6 +2091,34 @@ static u32 a618_get_speed_bin(u32 fuse)
>>       return UINT_MAX;
>>   }
>>   +static u32 a619_holi_get_speed_bin(u32 fuse)
>> +{
>> +    /*
>> +     * There are (at least) two SoCs implementing A619_holi: SM4350 (holi)
>> +     * and SM6375 (blair). Limit the fuse matching to the corresponding
>> +     * SoC to prevent bogus frequency setting (as improbable as it may be,
>> +     * given unexpected fuse values are.. unexpected! But still possible.)
>> +     */
>> +
>> +    if (fuse == 0)
>> +        return 0;
>> +
>> +    if (of_machine_is_compatible("qcom,sm4350")) {
>> +        if (fuse == 138)
>> +            return 1;
>> +        else if (fuse == 92)
>> +            return 2;
>> +    } else if (of_machine_is_compatible("qcom,sm6375")) {
>> +        if (fuse == 190)
>> +            return 1;
>> +        else if (fuse == 177)
>> +            return 2;
>> +    } else
>> +        pr_warn("Unknown SoC implementing A619_holi!\n");
> 
> I think, we might be better to introduce "qcom,SoC-adreno" compat string instead, ignore it in the bindings and only care about it here. This might seem an overkill thinking from the single Adreno version. However this issue also affects other revisions.
> 
> For example, for the A618 there are at least three platforms which use the same Adreno version: SC7180, SM7125 and SM7150. Only first one is supported (thus the speed_bin function is simple). However according to the vendor dts files all three platforms use different fuse values to specify the speed bin.
> 
>> +
>> +    return UINT_MAX;
>> +}
>> +
>>   static u32 a619_get_speed_bin(u32 fuse)
>>   {
>>       if (fuse == 0)
>> @@ -2150,6 +2178,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>>       if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
>>           val = a618_get_speed_bin(fuse);
>>   +    else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), rev))
>> +        val = a619_holi_get_speed_bin(fuse);
>> +
> 
> Are we sure that SM6350, the unholi A619 user, doesn't use patchid .1? (note I do not know a thing about Adreno patch ids and its usage between different platforms).
Yes

Konrad
> 
>>       else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
>>           val = a619_get_speed_bin(fuse);
>>   
> 
