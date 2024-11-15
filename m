Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D067E9CDB62
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 10:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EC410E830;
	Fri, 15 Nov 2024 09:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r1oRMh26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C9510E830
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 09:20:04 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so3932995e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 01:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731662402; x=1732267202; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ues4xyA37ETlwX/C7Elrga6ZPm1K6RyzA1jQwswXoo0=;
 b=r1oRMh26iiJ/cxLAsUC0AhuW7miuQY0Zqmuh1vOtSO+XyaKV6DZ5iBGna0pcF99oAh
 FKvnK7p5xNuiaWsrtjOSqzs1m6ThOBpNV9ohIFkaLSOCXaXuI+xaHNqTacc2GUFYq5dV
 Ti+UE0JsUK1v0zqHINMbUFgw3GEGpjxUwlxzBKDuvloYlBA+cwqcfGSGi5aOsR/nKLZl
 3E1hkAT/aJSja06Es7Ir2QjwEwMcXWvxB+rPMAKdyoyvyRGbT3SqI1x/fOpwki3uz+cM
 c1n+Qqw7rJT01LxraeMoFvgPEbL0D0UVwEQqEKKoJcB/QYQsLT+VJ/ZnOEOjLvHFG9MT
 hvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731662402; x=1732267202;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ues4xyA37ETlwX/C7Elrga6ZPm1K6RyzA1jQwswXoo0=;
 b=izc6NQZ5hqHfwgmVT1xrdZfuRJLvXOMbCtZ8lpHIpIuf6IOJeO81tmaffsbODKWbiK
 cyWZIO2sJ4BoAi4B77IAZTUBaRQnPSxQZnDCqKxsZ/2ISYpzZ16qq6eyUbO3tI1cFufG
 EXc2vn4XbrGc1rYa0xILpmf3V2iix+15gQyHh1/vXoYbOsjbkv/E93R/OicqJkBkkPsB
 6kyGZFYzwQAFnmSCP6dkUiFAnxGEQRbTZhNCmHqId8zmzQ3EeV0dbUwxgQj44z2TaxHE
 Rf2gBad972aK19tWUfi89Pn/KWGnVlFiIfT5LvelqZwjHHSnRr7LrwxatwFENU6Ai9C+
 +p3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT1mmx3rRvSZKoe7j7pAp8YFk+CET3B7c6v5YMiiX8dUNCf7cnI7mP5aenYFB/8ltk/jv/cRrxX54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUPbnPL6C2Rhu+iMIZnE6mRP83Evgj5UU0OHyiYtchvPmDjBYA
 gNMvKbTiFdMVPTmEFHg/UNdf9/KT+PyObbrhFn6FoBl9LOmj6exewWe/4rzWv1A=
X-Google-Smtp-Source: AGHT+IEMRiJgHRboWeRuXToZjO5EIApbqdd7iEqOjcikGRXbe4S9dfZlcZgZ4ZTnpSBowc+60fVXEA==
X-Received: by 2002:a05:600c:4f02:b0:431:588a:44a2 with SMTP id
 5b1f17b1804b1-432df725588mr16547725e9.12.1731662402428; 
 Fri, 15 Nov 2024 01:20:02 -0800 (PST)
Received: from [192.168.7.189] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab78897sm47464945e9.16.2024.11.15.01.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 01:20:02 -0800 (PST)
Message-ID: <8df952a8-3599-4198-9ff0-f7fac6d5feaf@linaro.org>
Date: Fri, 15 Nov 2024 10:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 6/8] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-6-3b8d39737a9b@linaro.org>
 <nw2sqnxmhntvizzvygfho6nhiwfni4xfquwst5gd5g2tel6pnr@h66d4mw46jcf>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <nw2sqnxmhntvizzvygfho6nhiwfni4xfquwst5gd5g2tel6pnr@h66d4mw46jcf>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/11/2024 08:33, Dmitry Baryshkov wrote:
> On Wed, Nov 13, 2024 at 04:48:32PM +0100, Neil Armstrong wrote:
>> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
>> is in place, let's declare the Bus Control Modules (BCMs) and
> 
> s/let's //g
> 
>> it's parameters in the GPU info struct and add the GMU_BW_VOTE
>> quirk to enable it.
> 
> Can we define a function that checks for info.bcm[0].name isntead of
> adding a quirk?

Probably, I'll need ideas to how design this better, perhaps a simple
capability bitfield in a6xx_info ?
There's other feature that are lacking, like ACD or BCL which are not supported
on all a6xx/a7xx gpus.

> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..014a24256b832d8e03fe06a6516b5348a5c0474a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1379,7 +1379,8 @@ static const struct adreno_info a7xx_gpus[] = {
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>   		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>   			  ADRENO_QUIRK_HAS_HW_APRIV |
>> -			  ADRENO_QUIRK_PREEMPTION,
>> +			  ADRENO_QUIRK_PREEMPTION |
>> +			  ADRENO_QUIRK_GMU_BW_VOTE,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "a740_zap.mdt",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -1388,6 +1389,16 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.gmu_chipid = 0x7020100,
>>   			.gmu_cgc_mode = 0x00020202,
>> +			.bcm = {
>> +				[0] = { .name = "SH0", .buswidth = 16 },
>> +				[1] = { .name = "MC0", .buswidth = 4 },
>> +				[2] = {
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(3),
>> +					.perfmode_bw = 16500000,
> 
> Is it a platform property or GPU / GMU property? Can expect that there
> might be several SoCs having the same GPU, but different perfmode_bw
> entry?

I presume this is SoC specific ? But today the XXX_build_bw_table() are
already SoC specific, so where should this go ?

Downstream specifies this in the adreno-gpulist.h, which is the equivalent
here.

Neil

> 
>> +				},
>> +			},
>>   		},
>>   		.address_space_size = SZ_16G,
>>   		.preempt_record_size = 4192 * SZ_1K,
>> @@ -1424,7 +1435,8 @@ static const struct adreno_info a7xx_gpus[] = {
>>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>   		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>   			  ADRENO_QUIRK_HAS_HW_APRIV |
>> -			  ADRENO_QUIRK_PREEMPTION,
>> +			  ADRENO_QUIRK_PREEMPTION |
>> +			  ADRENO_QUIRK_GMU_BW_VOTE,
>>   		.init = a6xx_gpu_init,
>>   		.zapfw = "gen70900_zap.mbn",
>>   		.a6xx = &(const struct a6xx_info) {
>> @@ -1432,6 +1444,16 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.gmu_chipid = 0x7090100,
>>   			.gmu_cgc_mode = 0x00020202,
>> +			.bcm = {
>> +				[0] = { .name = "SH0", .buswidth = 16 },
>> +				[1] = { .name = "MC0", .buswidth = 4 },
>> +				[2] = {
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(2),
>> +					.perfmode_bw = 10687500,
>> +				},
>> +			},
>>   		},
>>   		.address_space_size = SZ_16G,
>>   		.preempt_record_size = 3572 * SZ_1K,
>>
>> -- 
>> 2.34.1
>>
> 

