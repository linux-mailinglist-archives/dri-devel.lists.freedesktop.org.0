Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D632E9F2EC0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 12:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF1410E592;
	Mon, 16 Dec 2024 11:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K2RbRTd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C66710E595
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 11:03:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38634c35129so3110785f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 03:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734346999; x=1734951799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=cvKtKcX1PGSNlXT+b1lUYaOVxett0awWm9NBofHHbsM=;
 b=K2RbRTd5vfd9GzgehIDHR7NMzffQbE5Cksyj1ycS7Dn3dPgmuFeBo+xg4kgXKBzmLM
 LLA1Yq8D++moHnngKi73vBYzDV+bOlTNXtkSVAIiQ7y+9SYrZKXZoatgMBU3lBbXsIAl
 loq4JjtPD0IrjwDXTnaer23H3Kp1ZuGkiXjXeeTp/05SWjhqZw3DIDCytLb10Km0JqOe
 jsWMGSpk2ULfZjCW8UuwEDx/fAx33ztG68ejwLda1iN3DgClrCe8AdQinJifcYwiAhd7
 Tmyvnp3kTYPjwDnyxwAUTBTn/oHR+t8UMdtvGZJCfPLU/04u5/mBx0gCORZeieQHj3b2
 oCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734346999; x=1734951799;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cvKtKcX1PGSNlXT+b1lUYaOVxett0awWm9NBofHHbsM=;
 b=SSbIJo3JaxVjRG6j4/3rLN7eQA81DNzRM6ZunRIkM1BT45ziYudan6HmlFCi2VUROA
 YycNcHSpGbNm7X2We5ACMIPozRd9lgU0jT/w6B2u6lgeLtZhZEr1xGr5iX47OuCVshJB
 or8jLGN7eoBRJAPos0C1Qoy40oyu+Muzrkynj/Vvl8gkmW83E2YhTVznrWfsGmD6lPXs
 iMlOBnJootilpcRGzpUSwdYEV85DvM1wUFbN9ANk7HAxPt0orX37UV5AmghIx8ZVD5VY
 0lsmVFgh9b3Ru8cLOo4+Jq0peutVCK0KQk3njRirOnTQsEZ0yGth7HNUTKn8b7maS99j
 lPPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlhy3u4GiEcNoPrFL3dcqV4S2BOpgER+JyEhPoSrBql0O/Wfjbkh70TjN1sejBDCMEcEd0JZwEgzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhRmyWsLAiFDKCoocsCDogoOZPoMgG2tEEAOeDrT9ZMdb594bl
 ShStY/14Jf1YO6G/ImvVdbVOaVo15u85w383o2OTaynz0q2e05wcoj0Q8JsfH84=
X-Gm-Gg: ASbGncuiQgzXQmCskrLQZQ3LeUqoL9XLQaQ1xK5po3RbssCqte5ZWbxCE2DUP4I054h
 o2bZaT2HCG5oxcZb6vpFddRTCPwuOqwyF/ft/cVUzg34EwJ1F9+UhnjwS2z9N+QlyFcSNr/4dNl
 6pTwO1ytgsRlFWuQzo7G3x3EZiFESZzV/hP5h8zfz/i1RObuVle9Mkr9iBNjha+C+wW+lbmwQvQ
 CWRj3/v4fbToVA3BlG3BKZe/ecO7hXonzpkc1RMlczIAqvkwLJjnE9ZfURLTrDk6DP2jL6LkIh9
 WoA0FNKBAShfHuuNaxIjIkAM/oGtic1dag==
X-Google-Smtp-Source: AGHT+IGy2W5pNa1ih2XUUMBTIRgIZwSMaTZxIYWp6bt6/smB6KrDlitrxfBHrwQAiJNHIl0VbQtfjg==
X-Received: by 2002:a05:6000:1869:b0:385:f092:df2 with SMTP id
 ffacd0b85a97d-38880adb4e8mr9602393f8f.34.1734346998984; 
 Mon, 16 Dec 2024 03:03:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8b75:a430:7bc1:919b?
 ([2a01:e0a:982:cbb0:8b75:a430:7bc1:919b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8012105sm7764885f8f.16.2024.12.16.03.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 03:03:18 -0800 (PST)
Message-ID: <493748c0-fa2b-467f-8a21-921ce87b7866@linaro.org>
Date: Mon, 16 Dec 2024 12:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
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
 <bc1e71e3-c487-4700-869a-ed21f3633267@linaro.org>
 <6c8f7f48-1aae-4336-b66b-5b02609caa57@quicinc.com>
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
In-Reply-To: <6c8f7f48-1aae-4336-b66b-5b02609caa57@quicinc.com>
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

On 16/12/2024 11:40, Akhil P Oommen wrote:
> On 12/16/2024 3:13 PM, neil.armstrong@linaro.org wrote:
>> On 14/12/2024 00:46, Konrad Dybcio wrote:
>>> On 13.12.2024 5:55 PM, Akhil P Oommen wrote:
>>>> On 12/13/2024 10:10 PM, neil.armstrong@linaro.org wrote:
>>>>> On 13/12/2024 17:31, Konrad Dybcio wrote:
>>>>>> On 13.12.2024 5:28 PM, neil.armstrong@linaro.org wrote:
>>>>>>> On 13/12/2024 16:37, Konrad Dybcio wrote:
>>>>>>>> On 13.12.2024 2:12 PM, Akhil P Oommen wrote:
>>>>>>>>> On 12/13/2024 3:07 AM, Neil Armstrong wrote:
>>>>>>>>>> On 12/12/2024 21:21, Konrad Dybcio wrote:
>>>>>>>>>>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>>>>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale the DDR
>>>>>>>>>>>> Bandwidth
>>>>>>>>>>>> along the Frequency and Power Domain level, until now we left
>>>>>>>>>>>> the OPP
>>>>>>>>>>>> core scale the OPP bandwidth via the interconnect path.
>>>>>>>>>>>>
>>>>>>>>>>>> In order to enable bandwidth voting via the GPU Management
>>>>>>>>>>>> Unit (GMU), when an opp is set by devfreq we also look for
>>>>>>>>>>>> the corresponding bandwidth index in the previously generated
>>>>>>>>>>>> bw_table and pass this value along the frequency index to the
>>>>>>>>>>>> GMU.
>>>>>>>>>>>>
>>>>>>>>>>>> The GMU also takes another vote called AB which is a 16bit
>>>>>>>>>>>> quantized
>>>>>>>>>>>> value of the floor bandwidth against the maximum supported
>>>>>>>>>>>> bandwidth.
>>>>>>>>>>>>
>>>>>>>>>>>> The AB is calculated with a default 25% of the bandwidth like
>>>>>>>>>>>> the
>>>>>>>>>>>> downstream implementation too inform the GMU firmware the
>>>>>>>>>>>> minimal
>>>>>>>>>>>> quantity of bandwidth we require for this OPP.
>>>>>>>>>>>>
>>>>>>>>>>>> Since we now vote for all resources via the GMU, setting the OPP
>>>>>>>>>>>> is no more needed, so we can completely skip calling
>>>>>>>>>>>> dev_pm_opp_set_opp() in this situation.
>>>>>>>>>>>>
>>>>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>>>>> ---
>>>>>>>>>>>>       drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 +++++++++++++
>>>>>>>>>>>> ++++
>>>>>>>>>>>> +++++++
>>>>>>>>>>>> +++++++++--
>>>>>>>>>>>>       drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>>>>>>>>>>>       drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>>>>>>>>>>>       drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>>>>>>>>>>>       4 files changed, 46 insertions(+), 6 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/
>>>>>>>>>>>> gpu/drm/
>>>>>>>>>>>> msm/adreno/a6xx_gmu.c
>>>>>>>>>>>> index
>>>>>>>>>>>> 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>>>>>>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>>>>>>>>>> struct dev_pm_opp *opp,
>>>>>>>>>>>>                      bool suspended)
>>>>>>>>>>>>       {
>>>>>>>>>>>>           struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>>>>>>>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>>>>>>>>>>           struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>>>>>>>>>           struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>>>>>>>>>           u32 perf_index;
>>>>>>>>>>>> +    u32 bw_index = 0;
>>>>>>>>>>>>           unsigned long gpu_freq;
>>>>>>>>>>>>           int ret = 0;
>>>>>>>>>>>>       @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu
>>>>>>>>>>>> *gpu,
>>>>>>>>>>>> struct dev_pm_opp *opp,
>>>>>>>>>>>>               if (gpu_freq == gmu->gpu_freqs[perf_index])
>>>>>>>>>>>>                   break;
>>>>>>>>>>>>       +    /* If enabled, find the corresponding DDR bandwidth
>>>>>>>>>>>> index */
>>>>>>>>>>>> +    if (info->bcms && gmu->nr_gpu_bws > 1) {
>>>>>>>>>>>
>>>>>>>>>>> if (gmu->nr_gpu_bws)
>>>>>>>>>>
>>>>>>>>>> gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0
>>>>>>>>>> is the
>>>>>>>>>> "off" state)
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> +        unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>>>>>>>>>>>> +
>>>>>>>>>>>> +        for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1;
>>>>>>>>>>>> bw_index+
>>>>>>>>>>>> +) {
>>>>>>>>>>>> +            if (bw == gmu->gpu_bw_table[bw_index])
>>>>>>>>>>>> +                break;
>>>>>>>>>>>> +        }
>>>>>>>>>>>> +
>>>>>>>>>>>> +        /* Vote AB as a fraction of the max bandwidth */
>>>>>>>>>>>> +        if (bw) {
>>>>>>>>>>>
>>>>>>>>>>> This seems to only be introduced with certain a7xx too.. you
>>>>>>>>>>> should
>>>>>>>>>>> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's
>>>>>>>>>>> supported
>>>>>>>>>>
>>>>>>>>>> Good point
>>>>>>>>>
>>>>>>>>> No no. Doing this will trigger some assert in pre-A750 gmu
>>>>>>>>> firmwares. We
>>>>>>>>> learned it the hard way. No improvisation please. :)
>>>>>>>>
>>>>>>>> We shouldn't be sending that AB data to firmware that doesn't expect
>>>>>>>> it either too, though..
>>>>>>>
>>>>>>> Well we don't !
>>>>>>
>>>>>> The code in the scope that I quoted above does that
>>>>>
>>>>> No it doesn't, if the proper bcms are not declared in the gpu_info, it
>>>>> won't
>>>>
>>>> I think what Konrad meant was that IB voting is supported from a650+,
>>>> but AB voting is support only from a750+. So we can add bcm nodes to
>>>> enable IB voting, but how do we ensure AB voting via GMU is done only on
>>>> a750+.
>>>
>>> Yep, relying on incomplete data in the catalog is not a great way
>>> to ensure that
>>
>> I understood correctly, so I'll add a bool to enable AB voting, but please
>> don't ask me to remove it because it's dead code and useless if only
>> enabled on a750+...
> 
> Can't we just add ">= A7XX_GEN3" check here to decide on GMU AB VOTE?
> For older generation, AB vote should be via icc driver. And that I guess
> is out of the scope of this series.

Sure, I'll do that.

Thanks,
Neil

> 
> -Akhil.
> 
>>
>> Neil
>>
>>>
>>> Konrad
>>
> 

