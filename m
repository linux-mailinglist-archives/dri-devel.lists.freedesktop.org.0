Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D885F69B436
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 21:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0756910E460;
	Fri, 17 Feb 2023 20:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3A910E460
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 20:51:39 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y29so2886767lfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 12:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vaUH39wIG4Hkyo8bl9FqmB9fhuOy8PoEQdyCTVMoWM8=;
 b=H2PHVIoEg7Q+mpHbPQ3C5IuP32zgfr4MsGuFdUJeVetNkWlguMapD0q/UNlU1Qo2NS
 fYaEjI0MCk7BFGJEX1G/Hr3LzqTVjvWjnCUHByRS8rEhpT+SNeO7+eWJcqXdVOXzUMVZ
 46nV0KopHivtGIi0G3LNCvoOu0WTHxIw9zCHjL5IOu+wH+znuM61SiG4eWGDNbI08sHL
 Nn5SiyVQBswoFT6mnS5RhPSFJ7Qah5VRdRDvg8Rfc7KM40nZDMiWKDiXow8h1RhfXb2I
 Tb+o5blmedrCJFzsADmMcpl94MDd7uu/aPD7/zbm8ndnbC4txMyKrwU1E4CyBMoHlsnW
 D62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vaUH39wIG4Hkyo8bl9FqmB9fhuOy8PoEQdyCTVMoWM8=;
 b=4fS2kTUinHTbftXq845AMjJacJxF7oa9WSL4y3tM/4lpsON+qShvOnMEN3rRdpilpG
 L8hTLu9YSVx0PysOvov8ZOHtLlBhNse0hY1MwrNXTnMMJBP4HOLe6dv47rIi7DTItBnP
 tnYN+RzWRSnRHFUBCi9JQYo5XGNGGGBQ5Oy65oHz0IFDbox/k9NMo4kf+CFhwgUPqeOt
 O39A/wAjKJyv3q5lW4TzJOKwRSHxaU+ClZzussxsIbUsQNP4cYslN0HSh/X9dJXBGqu0
 es8NEHvM0ui0+ckT0maV7ieXqMXMwLo4qMNoPBuzxdOCSpYdsuWsaAE1nfgmLC9sxXGj
 m3ig==
X-Gm-Message-State: AO0yUKVnAei/cLuGro7iOCr2r3ASZa/7PPX12/QyUdzeGic2j3t0hZ0W
 Maz2Wx4+9fa6xfxselkeo34tDg==
X-Google-Smtp-Source: AK7set9hyN2bUTZrJmbKC0oSG02HDrQK9DivB+FyC4+cNf9POowtCVs0iR3CjM2KeH3dF3jZimVQ2Q==
X-Received: by 2002:ac2:51b8:0:b0:4cb:4571:9efe with SMTP id
 f24-20020ac251b8000000b004cb45719efemr453495lfk.35.1676667097887; 
 Fri, 17 Feb 2023 12:51:37 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
 by smtp.gmail.com with ESMTPSA id
 c25-20020ac244b9000000b004d85789cef1sm780379lfm.49.2023.02.17.12.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 12:51:37 -0800 (PST)
Message-ID: <69f4a50b-9566-f892-f1b2-831cf20c6938@linaro.org>
Date: Fri, 17 Feb 2023 21:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 02/14] drm/msm/a6xx: Extend UBWC config
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-3-konrad.dybcio@linaro.org>
 <a611e63b-034d-afbd-f194-c789a9071878@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a611e63b-034d-afbd-f194-c789a9071878@linaro.org>
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



On 17.02.2023 21:46, Dmitry Baryshkov wrote:
> On 14/02/2023 19:31, Konrad Dybcio wrote:
>> Port setting min_access_length, ubwc_mode and upper_bit from downstream.
>> Values were validated using downstream device trees for SM8[123]50 and
>> left default (as per downstream) elsewhere.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 29 +++++++++++++++++++--------
>>   1 file changed, 21 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index c5f5d0bb3fdc..8855d798bbb3 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -786,17 +786,25 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>   static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>   {
>>       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> -    u32 lower_bit = 2;
>> +    u32 lower_bit = 1;
> 
> Any reason to change the default value here?
> If it is to match chipsets you are adding, it might be worth splitting this change to that patch.
Not really now that I think about it, especially since the
correct default value should be zero:

-- part of msm-4.19 --
bit = adreno_dev->highest_bank_bit ? adreno_dev->highest_bank_bit - 13 : 0;
lower_bit = bit & 0x3;
upper_bit = (bit >> 0x2) & 1;

where adreno_dev->highest_bank_bit is read from the dt property
"qcom,highest-bank-bit"

Anyway, I should be able to verify it for all the SoCs which
we support.

Konrad
> 
>> +    u32 upper_bit = 0;
>>       u32 amsbc = 0;
>>       u32 rgb565_predicator = 0;
>>       u32 uavflagprd_inv = 0;
>> +    u32 min_acc_len = 0;
>> +    u32 ubwc_mode = 0;
>>         /* a618 is using the hw default values */
>>       if (adreno_is_a618(adreno_gpu))
>>           return;
>>   -    if (adreno_is_a640_family(adreno_gpu))
>> +    if (adreno_is_a630(adreno_gpu))
>> +        lower_bit = 2;
>> +
>> +    if (adreno_is_a640_family(adreno_gpu)) {
>>           amsbc = 1;
>> +        lower_bit = 2;
>> +    }
>>         if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>>           /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>> @@ -807,18 +815,23 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>       }
>>         if (adreno_is_7c3(adreno_gpu)) {
>> -        lower_bit = 1;
>>           amsbc = 1;
>>           rgb565_predicator = 1;
>>           uavflagprd_inv = 2;
>>       }
>>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>> -        rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
>> -    gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
>> -    gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
>> -        uavflagprd_inv << 4 | lower_bit << 1);
>> -    gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
>> +          rgb565_predicator << 11 | upper_bit << 10 | amsbc << 4 |
>> +          min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
>> +
>> +    gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, upper_bit << 4 |
>> +          min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
>> +
>> +    gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, upper_bit << 10 |
>> +          uavflagprd_inv << 4 | min_acc_len << 3 |
>> +          lower_bit << 1 | ubwc_mode);
>> +
>> +    gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | lower_bit << 21);
>>   }
>>     static int a6xx_cp_init(struct msm_gpu *gpu)
> 
