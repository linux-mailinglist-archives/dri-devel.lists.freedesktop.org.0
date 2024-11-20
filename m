Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DCC9D3ABF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 13:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA3410E737;
	Wed, 20 Nov 2024 12:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I4IiWPbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8329E10E733
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 12:37:51 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-382378f359dso2807336f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 04:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732106270; x=1732711070; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=gziM8urKl1B9e4nzfFx9z8Wbv3rlCgU3+h1y6PGcuuI=;
 b=I4IiWPbZ4uKsWzIIJmcyCxQjUYcY979VtyoXp+W5SmTkSLI6cVkVUJfltUMBn4Mxuv
 xfK1WR7ndggEmOUPUaKnRHYlGAix4c8/ftfRTQu791sdtn+B8Ms9r5DFjHvrQ1s0H+3a
 YHC+pPfcqPyy6IL7E2y9JZ0JFhLiB+2iE1Ri1R/j15+4zwgVikK4oHpeCVGieR0HEyjV
 O/WQPHI4OV+35v7f/fm+JPYtrtnTVP4CJ9TvfFWi4tqzzIm/xqy4u5ZnMnRKZa76DZUl
 UfH6dY+DzFruCabw1iAtskHG/vTg+nL89tveV8WnoekNuRtNLTiRQ9OhTCcyh2irXG6Z
 4IjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732106270; x=1732711070;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gziM8urKl1B9e4nzfFx9z8Wbv3rlCgU3+h1y6PGcuuI=;
 b=D+hCrfqrO/QlORswMMGcIBquVBXijpUvmXiTv3q55YsXL3mvIr5UchTE0VEB8fldEv
 haJJVncOL3TH++fhKRv1gZwE2ojlyxSvuUq4dPAoQDWhEvYQUDqlfWwc8sF2LJoCjnXt
 bQICc8HonH14HPfScTEvbdKLbTlJhvXujFhpmJGi8TpadVQfOO+R+2HPqGaHYqDS61ji
 abJgBSgBqk28Ld/iyXF5ixcg8YEJv1antNxKgp7Dp4PECCZ796ULAc/vJbAu0fw8S8kZ
 lyFem9HQdHGm6T8FI/PwfS0qd4/B7atU8KxxeD86WIU+HwjRsbHsNQnw1wXJZrpiKnZH
 beBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXusP5lk0S5BhpSyKO2e1uzvIFf3bMtusToxs6Khzy5Uani5VU61zmHaXg6qxoCBZ5T93wsKi1BkBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0Lwkqz0NDGiZitz6+Msa8+34JQJKEsjsSkEareJCX4rJqazHf
 QSqw4/dOuijvtmKOGINuN2OcaeDQXjG5DP7LlWuUAxSwcGA32Ji6LL5jMf1fEYk=
X-Google-Smtp-Source: AGHT+IGdJQAc+iugPISjAUH200goFko5j0vmx0r96libdXqJlDe8aAFXpLkq1rdFGaZ45mhCCnvewg==
X-Received: by 2002:a05:6000:1a88:b0:382:30a5:c38b with SMTP id
 ffacd0b85a97d-38254b0e1d0mr1677410f8f.42.1732106269882; 
 Wed, 20 Nov 2024 04:37:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:927b:2848:1f7d:3776?
 ([2a01:e0a:982:cbb0:927b:2848:1f7d:3776])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b01e1165sm17968325e9.2.2024.11.20.04.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 04:37:49 -0800 (PST)
Message-ID: <8218a053-6b69-4e1f-adb0-4c11930412ed@linaro.org>
Date: Wed, 20 Nov 2024 13:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 04/11] drm/msm: adreno: add GMU_BW_VOTE feature flag
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
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-4-4deb87be2498@linaro.org>
 <iw75ptavkqw3vybfov2f7koz5nh5lfzxcou3wey7rdsqt2gj5n@7luy2kqrzkj5>
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
In-Reply-To: <iw75ptavkqw3vybfov2f7koz5nh5lfzxcou3wey7rdsqt2gj5n@7luy2kqrzkj5>
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

On 20/11/2024 12:19, Dmitry Baryshkov wrote:
> On Tue, Nov 19, 2024 at 06:56:39PM +0100, Neil Armstrong wrote:
>> The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
>> along the Frequency and Power Domain level, but by default we leave the
>> OPP core vote for the interconnect ddr path.
>>
>> While scaling via the interconnect path was sufficient, newer GPUs
>> like the A750 requires specific vote paremeters and bandwidth to
>> achieve full functionality.
>>
>> While the feature will require some data in a6xx_info, it's safer
>> to only enable tested platforms with this flag first.
>>
>> Add a new feature enabling DDR Bandwidth vote via GMU.
> 
> Squash into the implementation patch.

Which one ? the flag is use in the next 3 patches

> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb..394b96eb6c83354ae008b15b562bedb96cd391dd 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -58,6 +58,7 @@ enum adreno_family {
>>   #define ADRENO_FEAT_HAS_HW_APRIV		BIT(0)
>>   #define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(1)
>>   #define ADRENO_FEAT_PREEMPTION			BIT(2)
>> +#define ADRENO_FEAT_GMU_BW_VOTE			BIT(3)
>>   
>>   /* Helper for formating the chip_id in the way that userspace tools like
>>    * crashdec expect.
>>
>> -- 
>> 2.34.1
>>
> 

