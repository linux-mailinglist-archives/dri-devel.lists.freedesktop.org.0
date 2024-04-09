Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368289E24D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 20:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D01E10F70C;
	Tue,  9 Apr 2024 18:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wDaj1eT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B30112E94
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 18:13:18 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso74893721fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712686396; x=1713291196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SVvL2F1G6X1zePnKsaGHFi1ccfudklq9eqO3sqLfMAg=;
 b=wDaj1eT/BTvIbTYzUqy9wqs3sJGiTWQaHuQfNAQcLcYYNqwegXhjSdCcXJHDf7Oi+7
 q6sP+lGUsxV3JR1IRgMVuMwMF9FeGHbXXhuusIewEjK5CRhscFpjlTrlyXZs2748R0Yu
 BKZMDSMsMbLiYYLDENCxNxJyYM97MulyIu2OyHU0GZJrnuC38M3ycHYmrCV2Pt5eKuN7
 oNxqr4HPaxPzRrTm+eKWtG8uO4oXAfqSgXpUamo8ZDYJMUhKhUq8QWWImm55nFTkIDSl
 OSQ5uoM75JxK9Cu3BZ5o1bSfMFGmdaW4twcY3+Eqf0QhF8QrsUu/Eg8pH0Qcm7IcZSh4
 IeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712686396; x=1713291196;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SVvL2F1G6X1zePnKsaGHFi1ccfudklq9eqO3sqLfMAg=;
 b=FxzFBKrTGfgtPFrZhvWee96SIiFo2kZitZy2cCWgmGWkr2ohWNavzmBbGO6tqVpYeV
 3IaXF/qfoUqaos8ZJIDUBwxS+kQJ8zY4Dpsg30nlc68g2CBkeRmqIytqAif2ceOGR7n+
 lUn+JbHNJ1EfK+VWeMqtZhi4nlFAfBwmmWN7XfYiv6PmcyqZKCjI0KIK544xWR2CD9rW
 Ct4nvDDAsRkheYAuvMyHslHlYJdY4DlYKl6ezjANgKOX8aTq6VDKmrepGgZaYNxiGsRk
 9Fvgko9YlsOycjQPpq4P8xeESnjTHwvL20/9pg18Gw4dD9g9gzxYSnw9RNGh31gc+vlv
 4Rqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHalNOKiq2OkMKRwGZNk86lh4R8BDNEZlsdZY9Hdk6t0x2gAX2vsu5Bx+UnPnbdyTh7O+DaFUOLpg2BmqWwzKnVIEpdngT08apNb7tpPlo
X-Gm-Message-State: AOJu0YwLU6DDSyOopLlcVT5U4Md0hWWiHASyIM2T9JtkE2GP0Zb9JEJA
 hBSqd6/lJUbrpExya/gkyEQJDK9AL3U3xCl7/beXM2wpibgKj/FMSRrnFGj+AJQ=
X-Google-Smtp-Source: AGHT+IE9IkoN4MIEa62W5SDOs6R2IZNM/Lb7/qVpQfgom65bemgoHxP7/c5kJNTK3D/ZbevsozDIkg==
X-Received: by 2002:a2e:6e06:0:b0:2d8:63a2:50dc with SMTP id
 j6-20020a2e6e06000000b002d863a250dcmr374922ljc.48.1712686396194; 
 Tue, 09 Apr 2024 11:13:16 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 z25-20020a2e9b99000000b002d869fec5ebsm1535892lji.79.2024.04.09.11.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 11:13:15 -0700 (PDT)
Message-ID: <fbfc2d7e-2120-428f-bb1f-60aa606b261b@linaro.org>
Date: Tue, 9 Apr 2024 20:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/adreno: Add speedbin data for SM8550 / A740
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-5-ce2b864251b1@linaro.org>
 <nek4paofg3hturvjwpa2bnsvmicwmvwixzr6e6iuqstemgrqyo@cagcrnzjsne2>
 <0955cabc-fc4e-4790-a82c-7f6f807fe36b@linaro.org>
 <4ghhtxjtkfjzxeyrajn26get4d6xiq57swwsjmyialcyfivui6@se3ukxxukspt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4ghhtxjtkfjzxeyrajn26get4d6xiq57swwsjmyialcyfivui6@se3ukxxukspt>
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



On 4/9/24 17:24, Dmitry Baryshkov wrote:
> On Tue, Apr 09, 2024 at 05:13:15PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 4/6/24 05:25, Dmitry Baryshkov wrote:
>>> On Fri, Apr 05, 2024 at 10:41:33AM +0200, Konrad Dybcio wrote:
>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> index 901ef767e491..c976a485aef2 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>>> @@ -570,6 +570,20 @@ static const struct adreno_info gpulist[] = {
>>>>    		.zapfw = "a740_zap.mdt",
>>>>    		.hwcg = a740_hwcg,
>>>>    		.address_space_size = SZ_16G,
>>>> +		.speedbins = ADRENO_SPEEDBINS(
>>>
>>> I think this deserves either a comment or some info in the commit
>>> message.
>>
>> "this" = ?
> 
> I see two types of speedbins here, it would be nice to understand at
> least some reason or some defailts for that (if you know them).

"one is slightly faster"

sorry, qcom downstream has been getting increasingly cryptic lately..

Konrad
