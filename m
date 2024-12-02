Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB39DFC62
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 09:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2244410E666;
	Mon,  2 Dec 2024 08:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uGRRCUPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E583B10E666
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 08:47:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4349e1467fbso33896355e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 00:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733129267; x=1733734067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=868g4RybWVTONYV+5WNJ4Psz8+PDv8VmyMXOni0Et/E=;
 b=uGRRCUPHydQ8UP/0FvhEfgQ0Qh71Vd31AStbm82/snNCZ7H0PTr2YNAnZc7GmcvIAl
 A+f9gM4zc7De2rDDnFVF7AgJ5lvCRD+LVBA3wM1963NHftha0ZZ6tndJDn3sRh1Pp+eV
 qPL1iT+JP0i0H8qLmGxfoMilNVw8o4w4Uo2mLkMKA5vliJJke4kwzDPdf1gFosn8eUzb
 lbyGCWQZdBHnXwayDxBKKlHaqPoXwqJyAHmPFbTQXFdhUjnc1tpnFmMBZA9dV1puaSzf
 QE8P13IrGMuFaiBF8Ogee9r5aeqMnAKRI3w1aAUtkuwjuHFihOnI49ZPZ1rihRQU8+LP
 Uj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733129267; x=1733734067;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=868g4RybWVTONYV+5WNJ4Psz8+PDv8VmyMXOni0Et/E=;
 b=u1Su94jCWGBodulAkQ1trByZoRPiBcpCAY9qLaNyfeDzrnD8FitVDguHB2v7fNZVgq
 LrtD2WZDF79Lj5xDYVH/dnZw6SqANBCRnxeIEZ1grzdBuomgVq6FcS1404C8C4q1S/kq
 WvE8jCgyCrgOJljRWd6amrUCaqzJMkenHX0CfMKNZaRqftLsW26/fFOzQqaBeot4IDrj
 jHOEZkqpc6oyzz7XDJEPjHX8F/H0peRNSGOG7m09jK3DEQAXplocQ2TUVulHVSUHqVsC
 XGcGRkBg3l4xuCM6rMLZcFB8TWWjF2DD7dS4jYhMTkR5YC5ak/ate2e9B9Ug02PdqyF7
 98Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUybPx6FHIO2VtEMVgQ7eD8yu/q7a1Tu05m86jKdZr8N8WXEuv2OxdsPdklewASPt49FDyQRn1lkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx04UGNo1nvFVBMtIlkquBYEIQA92Qi5/j7oU0jrpLSM2W/JGKY
 Q5yt6yNhSaFInwJMcBGS0PzLfyBGvZ+ixp1vPangvctJBPzCKzhP4g4PhvB3Pm8=
X-Gm-Gg: ASbGncs6XgGxb7Sj1l5hT4QXxKq7HrcquNTlzT2D81sBEM+nJSIfBk439/DcG6E2Exr
 LZTHEvqMeuXxQjsP03wO2lzhD0rDsoY1CGztbrwkIF8JmK4eKNAY+zqbtd7NMJtAfuqpkFsMh9b
 Q7dDxSKGWL2DBDCWVs0vomG6zV4I+jgN4xqZ13BonM+5+rKCekQHSAmb0vKVhampOrW98KwNb8z
 nbHTMrr4OtqDHI5zVwqv228FYqZ9wXxeqkRNis+wGvMEJO0VnYR40pPUypx/58+otjYrzaj3emM
 BvpU5wYiypSdOZkZXO8vMS8IubA=
X-Google-Smtp-Source: AGHT+IGJHbzNJoBprBMkButUw4pIj5gIiLHg+0YoFuF1r/DNY4OA1vmPgg66dYl398uyPtEYyLRRXg==
X-Received: by 2002:a05:600c:1d9c:b0:434:9ef2:f6e3 with SMTP id
 5b1f17b1804b1-434a9dbf66bmr188026545e9.8.1733129267215; 
 Mon, 02 Dec 2024 00:47:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1485:2a78:787c:c669?
 ([2a01:e0a:982:cbb0:1485:2a78:787c:c669])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385f0056637sm3156494f8f.15.2024.12.02.00.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 00:47:46 -0800 (PST)
Message-ID: <9add2288-36eb-43cd-a591-68f1819fb911@linaro.org>
Date: Mon, 2 Dec 2024 09:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
 <5fc71011-7a67-47b9-b372-b5e52ffea757@oss.qualcomm.com>
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
In-Reply-To: <5fc71011-7a67-47b9-b372-b5e52ffea757@oss.qualcomm.com>
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

On 29/11/2024 16:25, Konrad Dybcio wrote:
> On 28.11.2024 11:25 AM, Neil Armstrong wrote:
>> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
>> is in place, declare the Bus Control Modules (BCMs) and the
>> corresponding parameters in the GPU info struct and add the
>> GMU_BW_VOTE feature bit to enable it.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.gmu_chipid = 0x7020100,
>>   			.gmu_cgc_mode = 0x00020202,
>> +			.bcms = (const struct a6xx_bcm[]) {
>> +				{ .name = "SH0", .buswidth = 16 },
>> +				{ .name = "MC0", .buswidth = 4 },
>> +				{
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(3),
>> +					.perfmode_bw = 16500000,
>> +				},
>> +				{ /* sentinel */ },
>> +			},
> 
> This is not going to fly the second there's two SoCs implementing the
> same GPU with a difference in bus topology. I think we could add
> something like drvdata to ICC nodes and use it for BCMs on icc-rpmh.
> Then, we could retrieve it from the interconnect path we get from the
> dt node. It would also reduce duplication.

I don't want to go into that, we can optimize this when adding topologies
for other GPUs later, as-is this is a pointer so we can already share the
same table between GPUs.

> 
> Konrad

