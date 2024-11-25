Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5EE9D7CA3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 09:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D46710E5CF;
	Mon, 25 Nov 2024 08:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rT++wA23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F7D10E5CF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 08:14:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-434a2033562so378855e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 00:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732522463; x=1733127263; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=YJYq/ufVyCyQrJjMpbrUBAtwTDNfWWvkDBQ3TDITt2E=;
 b=rT++wA237mpEjxHaNFR5PpXA2fdGOwB37X2YWfWbd7ALk0oFN57ut/zDdM0QdBdivT
 n6Cqh3LshxTtRnAlu3R5F09TV1JQhauZEk1pYx+qyqhSc/zouKV4FxwR/srdHQkg5bwJ
 SxopnHZkg5AfvA2u3uWextWTuFEfgG30L0Idwv9QgCcCyPw3t/Tl+AwXBltXpEvw0B7q
 3nHYHxigcZ0/ItVrM7rrCZIK72RCKe03AzN/L2b/rEnOJcuXDM1nEhWfVJnEHGmWSA2R
 FX4W74bVl6drBCPZ69QovVOuo1hrCvwOTA9CUn6uu5nKeln6dGYsH1Szlcw7t/3rXzep
 /L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732522463; x=1733127263;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YJYq/ufVyCyQrJjMpbrUBAtwTDNfWWvkDBQ3TDITt2E=;
 b=NtFrPIY2lkc2tWPeHFFuXuLZushPbcJTe5vXgdQKwn0YAB7ajA5DHDv0U8gVAOr4fN
 AchzaursSvfT8l1gWZfcXCGz6/lyaupjbsiQNiWDBHMnoAryWQGTFeM0gZMKJpCyh4TL
 d/7NstmiZW+OGlq+Nyp9F7XIsG3rAmUcD1ILY7wnCCU9CJJ4xt96Kdzk8gaojurfUFn4
 MfqeROBW9EvcjrOUOTgEhj80FnhkUTdTjU/iMdw9nAEs9DT/beKrAPmg3O2z7LoJB93C
 ptUeG1XH720l0j9b0UkT8Y7cyEUgPJcrY/XXeDBRS5wy6TNtEOUSm1pqAQNj/11ZqWy0
 K8/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCzJr71eDVeGH6MqbCM37HsmJg8mMWluYTiOEkmOdmSL6S/V2bFmkV2kHwDOKM563CZf/d0+j0RsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqJBh0TTICow3vnaU05ZZIsJ1cOHX18Z8OqN59kQmepf5IGQhq
 zXCUictnCIqjdfqtnAp3X6yL8Uki8EQKoBa4AgmqUi4iWxzSKRqD/i5mRXKBvt4=
X-Gm-Gg: ASbGncvguuoyznEOZ9ueRFm93ELPI2rNknPt21hF43mTMqadS8inbqn9in7SbimoVFH
 FrOBjIrbc0MfDmQNgpIljiguHVeSGLthH7aeNqybnNYhPiJjIyFsZt5/mjymY7Wi7XQGPl2XWy0
 GTDujnR01R1DOAejaq8/NZFSED2qyf2k36DFRwUbIqYPJJBHDVxis/NhG4g1seb0MM5uukQLZu0
 n68QxdzhUenxc6hCRfXpejJTVBdpOL0RQIJK+GpbrTPhpABH8jf+PhDFcp5/a+C0dDjuTucotxC
 CIjRapemQG4UqYH+lFkoXQGx/54=
X-Google-Smtp-Source: AGHT+IHb8RG3CjwsMrQMRixwfeFBD1mGI+t7VoI8qc88KfSgFTabuTFgWinCCEg7/AuU3JSOkTjHJQ==
X-Received: by 2002:a05:6000:23c5:b0:37d:50e1:b3d3 with SMTP id
 ffacd0b85a97d-38260b5e4e2mr7233009f8f.20.1732522462734; 
 Mon, 25 Nov 2024 00:14:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b?
 ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434a16d96d6sm6722365e9.7.2024.11.25.00.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 00:14:22 -0800 (PST)
Message-ID: <1965cd01-7b31-4f16-82b2-27fd56fcb77e@linaro.org>
Date: Mon, 25 Nov 2024 09:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 08/11] drm/msm: adreno: request for maximum bus
 bandwidth usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-8-4deb87be2498@linaro.org>
 <20241123225954.lv3k2fxk7rxyh67z@hu-akhilpo-hyd.qualcomm.com>
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
In-Reply-To: <20241123225954.lv3k2fxk7rxyh67z@hu-akhilpo-hyd.qualcomm.com>
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

On 23/11/2024 23:59, Akhil P Oommen wrote:
> On Tue, Nov 19, 2024 at 06:56:43PM +0100, Neil Armstrong wrote:
>> When requesting a DDR bandwidth level along a GPU frequency
>> level via the GMU, we can also specify the bus bandwidth usage in a 16bit
>> quantitized value.
>>
>> For now simply request the maximum bus usage.
> 
> Why? You don't care about power efficiency?
> Lets drop this patch. We don't care about AB vote yet.

I care about functionality, without this AB vote the spillall use
case that fails on SM8650 HDK fails on the SM8650 QRD.

AB is a quantitized value of the BW voted, so yes I expect we can have
100% of the BW voted, but since we scale the BW it's perfectly fine.

Neil

> 
> -Akhil
> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index dc2d0035544e7848e5c4ea27f1ea9a191f9c4991..36c0f67fd8e109aabf09a0804bacbed3593c39d7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -134,6 +134,17 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>>   			if (bw == gmu->gpu_bw_table[bw_index])
>>   				break;
>>   		}
>> +
>> +		if (bw_index) {
>> +			/*
>> +			 * Append AB vote to the maximum bus usage.
>> +			 * AB represents a quantitized 16bit value of the
>> +			 * max ddr bandwidth we could use, let's simply
>> +			 * request the maximum for now.
>> +			 */
>> +			bw_index |= AB_VOTE(MAX_AB_VOTE);
>> +			bw_index |= AB_VOTE_ENABLE;
>> +		}
>>   	}
>>   
>>   	gmu->current_perf_index = perf_index;
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>> index 528110169398f69f16443a29a1594d19c36fb595..52ba4a07d7b9a709289acd244a751ace9bdaab5d 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>> @@ -173,6 +173,11 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
>>   	u32 bw;
>>   };
>>   
>> +#define AB_VOTE_MASK		GENMASK(31, 16)
>> +#define MAX_AB_VOTE		(FIELD_MAX(AB_VOTE_MASK) - 1)
>> +#define AB_VOTE(vote)		FIELD_PREP(AB_VOTE_MASK, (vote))
>> +#define AB_VOTE_ENABLE		BIT(8)
>> +
>>   #define HFI_H2F_MSG_PREPARE_SLUMBER 33
>>   
>>   struct a6xx_hfi_prep_slumber_cmd {
>>
>> -- 
>> 2.34.1
>>

