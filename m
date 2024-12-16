Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDD19F2D28
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AC110E56D;
	Mon, 16 Dec 2024 09:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WN0Khw4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC0110E56C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:43:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso897336f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734342226; x=1734947026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=LqU5vYBELVt/Nw/KToRPXSprTAyscafpf0VwqEOHv/E=;
 b=WN0Khw4b+1TnCd1/v/CtmUgFBd2HnReb3XehZEM2YrApzAZ4uq9folc0qAyv/to9Hn
 4ev2lmlVZjV6flkiN0lX728Jj1A4KZDgHL9hMRpLtnpRCnEfkFh2cDFSJSY9tJr8KzK5
 kurDwcwM8RGq+USfwBkPUYciNWPmkxqo4IQoX4WnfWlRR8c79OEcB3tzs8MqvAyXFa3w
 Mu8k/c/wgH7jPRnBQ3/oP6bQEXHS2O8PkpY01qoeyRJlpJzwsJeIiR93gLBeCCB6D1o3
 eaotwSJkwDSlbs5rolOnz5ezwTa8R6aHo+gi0CY0/RCHyu3K/BF3REkpJwShBt4BB8XH
 tXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734342226; x=1734947026;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LqU5vYBELVt/Nw/KToRPXSprTAyscafpf0VwqEOHv/E=;
 b=qgnrmNiFecnrlJCXRKcMFIJ5iDWe7+A/xSemmXqfhX7Ou8F4K+VcNrR0D6oI6eqMFI
 JWDYvYVhu5yUYWURE0j3o7W2T9LntE9wzVBBmq59CseRTTmt3Zh5XgZx5d8QQC9tZGKC
 yEGc/CzNMpTYzjIrqI7pCeK3S0w7fjlCwrvpUECAcX6S07795ayZYJDUDq+4L6KfycJr
 /Ool5sUlAsmkBX9vF9PFdwxqqQ+UJtCuEIDbPquFhvjupk+i71eXd+M9fa8xBffMg2Ae
 bMxcSk5oK8iLEya+P/cGkwFMlq1cV5OlZK8ESDiK6DzhpCQKk7bW5LWu3j5JVme/Qv1e
 DPvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKxye7TU1vJKH8Ll3MXCW833plmTVLL1WGfQaxa45N8pFFEcJZhrVPQrGTjCM9tRVEOwBhqsShjxQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPnhPBVierYSo++qz6LkaPqkIeWQyPbxgF6vffCoumtFZzJgq8
 RI/Pts1nRaR1EUHSPWAilEVLwa3yQWsmF2QywGdakUgdZyvZmfh0JClT/XuXYSQ=
X-Gm-Gg: ASbGncshdIU7XRjo/RN5BSxLiHpxWi6h/Bc7sJnZn9Ui7eSuCd+vnwYkX9bI2tS0i10
 TBKYSZSwU727UVW+1a38K1GVltphV0TrVaRA1nT6MefU1zUPK9Rho5zERnzfe+6aqXLJXVuD2tw
 +ZsiRwel8Bw71ZJh2EWMU22hYwcZYsqIEAiInLF/eyHuicrb+x2G6vrOj4BdhZbLQlDILhfrvxr
 zljnu68OE7D7IQhMUh+0iCtLzuK/BhpMsJcg9J/PCJzeygKosE28AlSEOm6CmwEpJGAQAlpR7Bt
 GBigo1smpqWlq9V9DUAlL2YNSuo7RkQxpA==
X-Google-Smtp-Source: AGHT+IGgDSYxyzrzTRmeC/QEF8znt6B6ADQf/ynduMm5l01yHzHIUbSi3NLRBJnYO8Eayia2oBpfnw==
X-Received: by 2002:a05:6000:2ad:b0:385:f19f:5a8f with SMTP id
 ffacd0b85a97d-38880ac6108mr9897963f8f.4.1734342225837; 
 Mon, 16 Dec 2024 01:43:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8b75:a430:7bc1:919b?
 ([2a01:e0a:982:cbb0:8b75:a430:7bc1:919b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559ec46sm135533095e9.20.2024.12.16.01.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 01:43:45 -0800 (PST)
Message-ID: <bc1e71e3-c487-4700-869a-ed21f3633267@linaro.org>
Date: Mon, 16 Dec 2024 10:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
 <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
 <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
 <80bed70e-7802-4555-a15e-e06fe46214c6@quicinc.com>
 <c2d8f443-5876-4293-8d2b-ecd13eaf8285@oss.qualcomm.com>
 <268d67c0-efdf-4ad4-b5fe-5b4f04e73131@linaro.org>
 <0d4d3ca3-ec8a-4e85-9838-a2bf1e07e872@oss.qualcomm.com>
 <9dcf26e5-1c25-4a18-ab01-58ddf3fbd607@linaro.org>
 <cf298ca5-e2fe-4e0e-a0e7-a2cdad3c657b@quicinc.com>
 <f730135f-b952-4f5c-bcb8-dc725e7db336@oss.qualcomm.com>
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
In-Reply-To: <f730135f-b952-4f5c-bcb8-dc725e7db336@oss.qualcomm.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/12/2024 00:46, Konrad Dybcio wrote:
> On 13.12.2024 5:55 PM, Akhil P Oommen wrote:
>> On 12/13/2024 10:10 PM, neil.armstrong@linaro.org wrote:
>>> On 13/12/2024 17:31, Konrad Dybcio wrote:
>>>> On 13.12.2024 5:28 PM, neil.armstrong@linaro.org wrote:
>>>>> On 13/12/2024 16:37, Konrad Dybcio wrote:
>>>>>> On 13.12.2024 2:12 PM, Akhil P Oommen wrote:
>>>>>>> On 12/13/2024 3:07 AM, Neil Armstrong wrote:
>>>>>>>> On 12/12/2024 21:21, Konrad Dybcio wrote:
>>>>>>>>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale the DDR
>>>>>>>>>> Bandwidth
>>>>>>>>>> along the Frequency and Power Domain level, until now we left
>>>>>>>>>> the OPP
>>>>>>>>>> core scale the OPP bandwidth via the interconnect path.
>>>>>>>>>>
>>>>>>>>>> In order to enable bandwidth voting via the GPU Management
>>>>>>>>>> Unit (GMU), when an opp is set by devfreq we also look for
>>>>>>>>>> the corresponding bandwidth index in the previously generated
>>>>>>>>>> bw_table and pass this value along the frequency index to the GMU.
>>>>>>>>>>
>>>>>>>>>> The GMU also takes another vote called AB which is a 16bit
>>>>>>>>>> quantized
>>>>>>>>>> value of the floor bandwidth against the maximum supported
>>>>>>>>>> bandwidth.
>>>>>>>>>>
>>>>>>>>>> The AB is calculated with a default 25% of the bandwidth like the
>>>>>>>>>> downstream implementation too inform the GMU firmware the minimal
>>>>>>>>>> quantity of bandwidth we require for this OPP.
>>>>>>>>>>
>>>>>>>>>> Since we now vote for all resources via the GMU, setting the OPP
>>>>>>>>>> is no more needed, so we can completely skip calling
>>>>>>>>>> dev_pm_opp_set_opp() in this situation.
>>>>>>>>>>
>>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>>> ---
>>>>>>>>>>      drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 +++++++++++++++++
>>>>>>>>>> +++++++
>>>>>>>>>> +++++++++--
>>>>>>>>>>      drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>>>>>>>>>      drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>>>>>>>>>      drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>>>>>>>>>      4 files changed, 46 insertions(+), 6 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/
>>>>>>>>>> gpu/drm/
>>>>>>>>>> msm/adreno/a6xx_gmu.c
>>>>>>>>>> index
>>>>>>>>>> 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>>>>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>>>>>>>> struct dev_pm_opp *opp,
>>>>>>>>>>                     bool suspended)
>>>>>>>>>>      {
>>>>>>>>>>          struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>>>>>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>>>>>>>>          struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>>>>>>>          struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>>>>>>>          u32 perf_index;
>>>>>>>>>> +    u32 bw_index = 0;
>>>>>>>>>>          unsigned long gpu_freq;
>>>>>>>>>>          int ret = 0;
>>>>>>>>>>      @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu
>>>>>>>>>> *gpu,
>>>>>>>>>> struct dev_pm_opp *opp,
>>>>>>>>>>              if (gpu_freq == gmu->gpu_freqs[perf_index])
>>>>>>>>>>                  break;
>>>>>>>>>>      +    /* If enabled, find the corresponding DDR bandwidth
>>>>>>>>>> index */
>>>>>>>>>> +    if (info->bcms && gmu->nr_gpu_bws > 1) {
>>>>>>>>>
>>>>>>>>> if (gmu->nr_gpu_bws)
>>>>>>>>
>>>>>>>> gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0 is the
>>>>>>>> "off" state)
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> +        unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>>>>>>>>>> +
>>>>>>>>>> +        for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1;
>>>>>>>>>> bw_index+
>>>>>>>>>> +) {
>>>>>>>>>> +            if (bw == gmu->gpu_bw_table[bw_index])
>>>>>>>>>> +                break;
>>>>>>>>>> +        }
>>>>>>>>>> +
>>>>>>>>>> +        /* Vote AB as a fraction of the max bandwidth */
>>>>>>>>>> +        if (bw) {
>>>>>>>>>
>>>>>>>>> This seems to only be introduced with certain a7xx too.. you should
>>>>>>>>> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported
>>>>>>>>
>>>>>>>> Good point
>>>>>>>
>>>>>>> No no. Doing this will trigger some assert in pre-A750 gmu
>>>>>>> firmwares. We
>>>>>>> learned it the hard way. No improvisation please. :)
>>>>>>
>>>>>> We shouldn't be sending that AB data to firmware that doesn't expect
>>>>>> it either too, though..
>>>>>
>>>>> Well we don't !
>>>>
>>>> The code in the scope that I quoted above does that
>>>
>>> No it doesn't, if the proper bcms are not declared in the gpu_info, it
>>> won't
>>
>> I think what Konrad meant was that IB voting is supported from a650+,
>> but AB voting is support only from a750+. So we can add bcm nodes to
>> enable IB voting, but how do we ensure AB voting via GMU is done only on
>> a750+.
> 
> Yep, relying on incomplete data in the catalog is not a great way
> to ensure that

I understood correctly, so I'll add a bool to enable AB voting, but please
don't ask me to remove it because it's dead code and useless if only
enabled on a750+...

Neil

> 
> Konrad

