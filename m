Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEE88FBA8F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CD310E594;
	Tue,  4 Jun 2024 17:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wpyHlq2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D41610E591
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 17:35:10 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a626919d19dso12449366b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 10:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717522508; x=1718127308; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vCsbwFVhaLIbM7WR4Y1tBA9sw9ajFsgDjNJvygL98eI=;
 b=wpyHlq2B5cYopYM6jQcCogzKYviZKT4d0mo3ChUKACcM7nw4rJnfm0GGtHAnS9+rz7
 9o141b79YdT2Mdr8305SHWizufwRDoWUbo1Uy/vJ8Xudy7ozJWITO72q3SXmK+VlXbtc
 QoZXfhKfJT2fN25FIyKZGsUJwTpu56A1fr9cvNvHyB2tQ7WwupgoEkrB9MmjqWFQ0ikk
 xfKTUfq9yf+SS/klvdXMo5znBynM5weF3GRhJ8+rE9wy6fTBUZ+jaKMYb41ADowyFrNb
 G6e0DoPwiaUDujQ19EsEpNGL7m5WBuG6oxcmii0c/JHr34tWhqNj29FRjgBuCYm1zmaV
 C5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717522508; x=1718127308;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vCsbwFVhaLIbM7WR4Y1tBA9sw9ajFsgDjNJvygL98eI=;
 b=s4lyZUGZXvCnk2KRSKplDtlWWG6s3LiLthwGrvWEi7e/yhKwmfWkxnI0Tcpnvp++40
 imQNpQwQLaDpwwKLf1DjtfcvQEX5OuLP8cYiZN/rQH2Rp4G/cQrGFM5ewmEDmgdDLP8V
 EWyGXiI7dUwzxHb50d1JIEjVL0xAAi7WgB2EwxQbSZ1gwa+uQ3nt5bUFmXurq4R+ATSe
 XCr9lFj/OJgGWqkJ5FdCmSN6E5SUt8ez4TFQzFaabr2odtckld75aKvHSJG4rApcdwzX
 RJdwTnjrTXRjCSAWs29NBzkawnQzQ2dr2Cu04p8EXr6D8WY9mTdCo9ux/Wu8gFU5cL5o
 zwEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB4mXpFg9QSqStRSaZT0d9i2rjiHqaYrX3RCotkDTqYleFU48IQuDpPvOMThNdP6Mdn5gkOM0pU1kPxeqcFdf9BfsR8eyCiz7c/x9kLujb
X-Gm-Message-State: AOJu0YxGWp3zMvihoPyyJuMzzJOYHvy2rAHsb5NxUr2CFW3giy15BW9/
 TB11lcipFRmMbuWsRRmdNjSSGYJDCbgnOM4CcRl2FNC3dTm7P881LQELhwJrF1Q=
X-Google-Smtp-Source: AGHT+IEjcOF9+M6MP95PhiB5Ty/rvfO3P6Z5ngoFQ7Ttj8s1F/LJ0uoAhwyd0wUEzTYOq5frGLeA+A==
X-Received: by 2002:a17:906:6951:b0:a68:fe44:91f7 with SMTP id
 a640c23a62f3a-a6954bb13bfmr237231866b.31.1717522508091; 
 Tue, 04 Jun 2024 10:35:08 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8?
 ([2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a685b935b5csm614209666b.206.2024.06.04.10.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 10:35:07 -0700 (PDT)
Message-ID: <5ff40fba-e45a-4a5c-b5a7-7ef5a799a008@linaro.org>
Date: Tue, 4 Jun 2024 19:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/14/24 20:38, Akhil P Oommen wrote:
> On Wed, May 08, 2024 at 07:46:31PM +0200, Konrad Dybcio wrote:
>> Memory barriers help ensure instruction ordering, NOT time and order
>> of actual write arrival at other observers (e.g. memory-mapped IP).
>> On architectures employing weak memory ordering, the latter can be a
>> giant pain point, and it has been as part of this driver.
>>
>> Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
>> readl/writel, which include r/w (respectively) barriers.
>>
>> Replace the barriers with a readback that ensures the previous writes
>> have exited the write buffer (as the CPU must flush the write to the
>> register it's trying to read back) and subsequently remove the hack
>> introduced in commit b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt
>> status in hw_init").
>>
>> Fixes: b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 ++---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++----------
>>   2 files changed, 6 insertions(+), 13 deletions(-)
> 
> I prefer this version compared to the v2. A helper routine is
> unnecessary here because:
> 1. there are very few scenarios where we have to read back the same
> register.
> 2. we may accidently readback a write only register.

Which would still trigger an address dependency on the CPU, no?

> 
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 0e3dfd4c2bc8..4135a53b55a7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -466,9 +466,8 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
>>   	int ret;
>>   	u32 val;
>>   
>> -	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
>> -	/* Wait for the register to finish posting */
>> -	wmb();
>> +	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
>> +	gmu_read(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ);
> 
> This is unnecessary because we are polling on a register on the same port below. But I think we
> can replace "wmb()" above with "mb()" to avoid reordering between read
> and write IO instructions.

Ok on the dropping readback part

+ AFAIU from Will's response, we can drop the barrier as well

> 
>>   
>>   	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
>>   		val & (1 << 1), 100, 10000);
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 973872ad0474..0acbc38b8e70 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1713,22 +1713,16 @@ static int hw_init(struct msm_gpu *gpu)
>>   	}
>>   
>>   	/* Clear GBIF halt in case GX domain was not collapsed */
>> +	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> 
> We need a full barrier here to avoid reordering. Also, lets add a
> comment about why we are doing this odd looking sequence.
> 
>> +	gpu_read(gpu, REG_A6XX_GBIF_HALT);
>>   	if (adreno_is_a619_holi(adreno_gpu)) {
>> -		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
>>   		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
>> -		/* Let's make extra sure that the GPU can access the memory.. */
>> -		mb();
> 
> We need a full barrier here.
> 
>> +		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
>>   	} else if (a6xx_has_gbif(adreno_gpu)) {
>> -		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
>>   		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
>> -		/* Let's make extra sure that the GPU can access the memory.. */
>> -		mb();
> 
> We need a full barrier here.

Not sure we do between REG_A6XX_GBIF_HALT & REG_A6XX_RBBM_(GBIF_HALT/GPR0_CNTL),
but I suppose keeping the one after REG_A6XX_RBBM_(GBIF_HALT/GPR0_CNTL) makes
sense to avoid the possibility of configuring the GPU before it can access DRAM..

> 
>> +		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
>>   	}
>>   
>> -	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
>> -	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
>> -		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
>> -
> 
> Why is this removed?

Because it was a hack in the first place and the enforcement of GBIF
unhalt requests coming through before proceeding further removes the
necessity to check this (unless there's some hw-mandated delay we should
keep in mind, but kgsl doesn't have that and there doesn't seem to be
any from testing on 8[456]50).

Konrad
