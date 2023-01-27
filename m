Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE49967E826
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 15:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83BB10E9A1;
	Fri, 27 Jan 2023 14:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE70B10E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 14:22:59 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id vw16so14041034ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 06:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ldzFZEqDhcEGgVtJre8PmwCOxuUI7/pRZAmkiQNvpI=;
 b=EwdgZzNx2hEGN7vw25sw1Rjsq80EYXivvQ+6yLDcwdsEkmgc3BlP14ymg+4s8LcJRh
 //zchkSEHl7AFZjOUkCM9bmLfEcPxta8zrNxTe9gK5aIh6vv8Pko/E+gf3JH7LNz1/Y4
 J3c7zYrEWsw5Xz39ld5GfaVqlzM2SM6tRaoQ7Ecmhtywfs8zRrMuKNklOfNyr6km9j0g
 bHs8sj+m1QPaWkFvv1zv9VmZSKpUeAkOm1DXmP4apsxmsGtwjk4ALSYU6qtSo76llPXq
 1sI1eAO07mTTL8s+VgSY1nl6+8nPkkDyJlKNTfH7bxVVuXzC/3GNQZGJ+48Z+blxh6hz
 dz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ldzFZEqDhcEGgVtJre8PmwCOxuUI7/pRZAmkiQNvpI=;
 b=DkizQoAhIpvV0Uyz7s/VopolfRKMgs6jrWpTIrvaiKEZnBJOjFRKo6pxgKN3HBi6A4
 DPPEaAblJOpKif2MjO+hTj5cZzCKqiRzow0aiz5r0rWf51YxDlO5KkuK7NYCTRvWXTyt
 KyxdOpPET0Dbyrmk8ErcdFchafQo0GAQnZUYvgSuVVwNmzZr4QOixKlrCMK6nLsI4Nod
 GdjmnkJxxbGHq59scUKGq/NR9YEJH00TwJg3EhRkmKoW2uSxJBWB4ZOWT6sjqWczhD9z
 RAy3r/Fqk9ekDjmxLJMJIJ/pdaF0cVKfK+83Rto7NZOYJE0fM24QK48UGExb2+wbe1YV
 2gow==
X-Gm-Message-State: AO0yUKW/SOkAGEIyejnVkLDK8q5TejX11E0RmrATVqtxXkSaUmcrSIsD
 0BZRLdWWQoLkaPFTasjOwPXR1g==
X-Google-Smtp-Source: AK7set/pNDqvl32J5PrSB2nSJPU5Iq8uerNs8RxzmjCRiF9JfTAGwRSHw3gNaUtK5WntivT7LlZWrw==
X-Received: by 2002:a17:906:d8b8:b0:878:b890:38bb with SMTP id
 qc24-20020a170906d8b800b00878b89038bbmr3013074ejb.67.1674829378159; 
 Fri, 27 Jan 2023 06:22:58 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170906490200b0084d1b34973dsm2327844ejq.61.2023.01.27.06.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 06:22:57 -0800 (PST)
Message-ID: <b8cfbb20-917d-2b19-b0f3-9e7092103392@linaro.org>
Date: Fri, 27 Jan 2023 15:22:55 +0100
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
> I think, we might be better to introduce "qcom,SoC-adreno" compat string instead, ignore it in the bindings
I can hear Krzysztof hiring a hitman already..

and only care about it here. This might seem an overkill thinking from the single Adreno version. However this issue also affects other revisions.
> 
> For example, for the A618 there are at least three platforms which use the same Adreno version: SC7180, SM7125 and SM7150. Only first one is supported (thus the speed_bin function is simple). However according to the vendor dts files all three platforms use different fuse values to specify the speed bin.
Or we may switch to simply matching SoCs based on platform
compatible, as it's really the SoC-specific and not GPU-specific.

Konrad> 
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
> 
>>       else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
>>           val = a619_get_speed_bin(fuse);
>>   
> 
