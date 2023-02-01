Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438336864BE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 11:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0559810E3F0;
	Wed,  1 Feb 2023 10:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6315C10E3F0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 10:51:08 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id m2so49703946ejb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 02:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9syDN6lVof2BYFuxSBHicwMUB0VPrCisO1VbIHSe+6A=;
 b=SHPXpNCRVqPweEXV0hlapMi/VQuvoK5IvsIRNK7hZ8PhKscyS7ct4IkMeIJHsbWRor
 9k32ljOamOWyTl9lhUrBJx2meuyF2/A1C7bD2hEcZ80InE9vmokiad7A8hz5KCXA2KSI
 InWKiYKeBp5rwqPR5j/zBbKXHNJiLUS2I4PWZXME2baGmG0Z2P4n7YmiSEJq25yDcYvo
 nmNFf2aWUctvcWQcJFOIcLiaCf2Rg5q+lpBtJBRPSt911V2v7wKt9SJUxMYMK6l9qvCc
 FPBzZy/hpMattSEqXyQlLZuJW4MlE6M2kC4LPF8Waij6LVkG77QzTm+kjbDHc1MoN3MO
 AQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9syDN6lVof2BYFuxSBHicwMUB0VPrCisO1VbIHSe+6A=;
 b=CoRwDyHdvIyCcoTeDAIhk3h9Hqew9ZnIFS3KdOZ1cDFpIGEtnOM4QHRh7PeFNJTG++
 ya/22JWJoQ+akPbt7i2bituSxIc5LsNucRooZW1AXHT3gt/M/sS2r80KaWZBr5NCG7K7
 AnxsYD+6A5NAAv3QSsu2tthWFw5Wx5zbBJKEEk94amdcim1026yKZS2kSkYHqzJE7xYk
 cf5U1PgcPJ4MbZoMBM8H6FInSq9vD9TJuFsM2U+cr8Q0Mdzww/oL0C1fLPuXoKE38kPt
 /d7kzzZh4DElpRErMsR4+BXmjuGTEwwyge0caO4BWBRBmYhHh4AeL/QwttWUd+EoFGdD
 XwzA==
X-Gm-Message-State: AO0yUKXLf8quERM5MBwUB/H+oCO7CNUVDgNbtu/WIFlaG54PXGh12gdG
 FGLzNe/U7xaij5z/LstxclJ4Ow==
X-Google-Smtp-Source: AK7set/ZlvzNCR642AtQEOigZkb5AINCHT4epDo5VZqT7HU14gSKMAjDoCe9mm67WxPQ9hW27+m5TA==
X-Received: by 2002:a17:907:c78a:b0:878:7349:5ce6 with SMTP id
 tz10-20020a170907c78a00b0087873495ce6mr2037849ejc.71.1675248666940; 
 Wed, 01 Feb 2023 02:51:06 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a1709066b8f00b00886faa3d569sm5484873ejr.58.2023.02.01.02.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 02:51:06 -0800 (PST)
Message-ID: <b844c47e-8ee4-8163-3888-43a06edfd1a2@linaro.org>
Date: Wed, 1 Feb 2023 11:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 02/14] drm/msm/a6xx: Extend UBWC config
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
 <20230126151618.225127-3-konrad.dybcio@linaro.org>
 <3644f111-0d69-1006-f032-782e1b00cd17@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3644f111-0d69-1006-f032-782e1b00cd17@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1.02.2023 10:30, Akhil P Oommen wrote:
> On 1/26/2023 8:46 PM, Konrad Dybcio wrote:
>> Port setting min_access_length, ubwc_mode and upper_bit from downstream.
>> Values were validated using downstream device trees for SM8[123]50 and
>> left default (as per downstream) elsewhere.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 26 ++++++++++++++++++--------
>>  1 file changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index c5f5d0bb3fdc..ad5d791b804c 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -786,17 +786,22 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>  {
>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> -	u32 lower_bit = 2;
>> +	u32 lower_bit = 1;
> Wouldn't this break a630?

// highest_bank_bit = 15 on 845, from "qcom,highest-bank-bit" in dt

bit = adreno_dev->highest_bank_bit ? adreno_dev->highest_bank_bit - 13 : 0;
// => bit = 2

lower_bit = bit & 0x3;
// => lower_bit = 2

Yes it would! Thanks for catching that, I'll add the A630 case in v2.

The 1 default value comes from the fact that highest_bank_bit is 13
when it's unset in dt, which makes lower_bit 1.


Konrad

> 
> -Akhil.
>> +	u32 upper_bit = 0;
>>  	u32 amsbc = 0;
>>  	u32 rgb565_predicator = 0;
>>  	u32 uavflagprd_inv = 0;
>> +	u32 min_acc_len = 0;
>> +	u32 ubwc_mode = 0;
>>  
>>  	/* a618 is using the hw default values */
>>  	if (adreno_is_a618(adreno_gpu))
>>  		return;
>>  
>> -	if (adreno_is_a640_family(adreno_gpu))
>> +	if (adreno_is_a640_family(adreno_gpu)) {
>>  		amsbc = 1;
>> +		lower_bit = 2;
>> +	}
>>  
>>  	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>>  		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>> @@ -807,18 +812,23 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>  	}
>>  
>>  	if (adreno_is_7c3(adreno_gpu)) {
>> -		lower_bit = 1;
>>  		amsbc = 1;
>>  		rgb565_predicator = 1;
>>  		uavflagprd_inv = 2;
>>  	}
>>  
>>  	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>> -		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
>> -	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
>> -	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
>> -		uavflagprd_inv << 4 | lower_bit << 1);
>> -	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
>> +		  rgb565_predicator << 11 | upper_bit << 10 | amsbc << 4 |
>> +		  min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
>> +
>> +	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, upper_bit << 4 |
>> +		  min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
>> +
>> +	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, upper_bit << 10 |
>> +		  uavflagprd_inv << 4 | min_acc_len << 3 |
>> +		  lower_bit << 1 | ubwc_mode);
>> +
>> +	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | lower_bit << 21);
>>  }
>>  
>>  static int a6xx_cp_init(struct msm_gpu *gpu)
> 
