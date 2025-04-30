Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14921AA4B1C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7D210E763;
	Wed, 30 Apr 2025 12:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h43LYJ99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8812510E763
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 12:26:48 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so66089535e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 05:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746016007; x=1746620807; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=DfJnIXMhWtJuApKPo4ttd/C2DFx961fITYNRFoaF7cw=;
 b=h43LYJ993nnKDmteWseMoG/KBqIOtRti5AL7qidxx4Eyi8jINMeOT0t5bGsmWexf0B
 PnWbkgJjRuR/RLl0WhXqsLHsfqo6xIwEhC4eK9OmKtfKWJSR0EaBF8vEcef3yfukVrkL
 lZAQMBsd6JjvEPteBCGlTIwX+Wj3gs7wZ62FKxLFZfr4NIXqXzjyedVtXCeSucINjpOy
 kgpyhftd4JDGBZbaIzvSamh1l3+UhHtO0hlEyWMt4aWwvmTwIYwPLk1ugmGHZK3EV5t9
 QWDdeI3pmh9ktmTudx3JuAyH5G9Iqwu5+4lJaall+XjytAvFeOSpcxQ5geZqGHqanBo5
 M38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746016007; x=1746620807;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DfJnIXMhWtJuApKPo4ttd/C2DFx961fITYNRFoaF7cw=;
 b=qVtHgSJif+hajR23cxkItFvjBOMV+hdqamp0PLYDWT0fhotDguIMIQ5CuEQhoVQQ0l
 tA7iFI1xauGkn203KJeds6vYy2YIvpj1b8FUGcfU0KlyBBR0dqj5/w/436zPUJfIPT4H
 bgRBWKtF4KSf+lDTDn1Gha+3bUJbAY5ztEXW/7bUyUhblEOeSLKNsB2z4NK8JNK9rLAR
 zrElAF66g5KQj/IPcgZR2h7UWs15WotO7KAP6hURWKMCVUj5Zo0A8RAS9Snxb3YI4wJs
 /yM0mN9mDmlMFAjelzbTSWwK/0WgUbwrZMKT89pNOeWC6TisiE735R6ufs4SuXuIZFeX
 ghlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr46xsvOSwEilDv6WAi54ftWOpA8aTxdggqTxWPPiMT9U9DLe5/b5P2Fe9rViB+wonMoi2xlrnYjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuUvjqCxXyVwvvix0boYyS+E2o4tVosRj3vdu6xlYlFTIwLxWH
 nWlHVe+aHC3GpHQev1B3qCfJQmPwZ9bTkTiJCUypNboOPtg7L3jN+5phpkTkKfo=
X-Gm-Gg: ASbGnctxBK6KxdUcMb1riHCzIBKtUEWKUS0tGEfwcax+KnZy/zeWYWc3IuYoLPVSnEG
 iomovg4mW38YiS2x6lah+guRrZA2RgvsMCCgo6Oetf/Gufs5W4r5iw5XVLtDglWLOKrFCu9wr5M
 mp7Bs+iGhdOP/Ms0W+ITGRId1+RoDWj+7ttSO7WNfuZE3kSReMgp4IxdCq9fnhTXkj0SSYtCrB1
 LEavWZutnAfPRay377ez3diYHRk4TjvpLkaWnGqbS/CTODRhRj19g0m/HV9afVf7+Vu4tXhGA+C
 2IW1EiQnpj653Ttu4VTSl3vzWVqArQWLLeh+eKay6n9GvhJH215DxEcwlDe34Te4ABhwTjik0xc
 GsHXtsmLx0ujFmqTzTg==
X-Google-Smtp-Source: AGHT+IG6MqGYW7/50i6ev+VZL1WzPog5uew6KG1T5nQ/er1qsC85a42modlcTSimxs2lB5RGaw7g/g==
X-Received: by 2002:a05:600c:3b8f:b0:43b:c0fa:f9cd with SMTP id
 5b1f17b1804b1-441b1f2f0c1mr27861525e9.7.1746016007016; 
 Wed, 30 Apr 2025 05:26:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785?
 ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b20aa6sm23948875e9.27.2025.04.30.05.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 05:26:46 -0700 (PDT)
Message-ID: <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
Date: Wed, 30 Apr 2025 14:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
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
In-Reply-To: <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
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

Hi,

On 30/04/2025 13:34, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Add speebin data for A740, as found on SM8550 and derivative SoCs.
> 
> For non-development SoCs it seems that "everything except FC_AC, FC_AF
> should be speedbin 1", but what the values are for said "everything" are
> not known, so that's an exercise left to the user..
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -11,6 +11,9 @@
>   #include "a6xx.xml.h"
>   #include "a6xx_gmu.xml.h"
>   
> +#include <linux/soc/qcom/smem.h>
> +#include <linux/soc/qcom/socinfo.h>
> +
>   static const struct adreno_reglist a612_hwcg[] = {
>   	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>   	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>   		},
>   		.address_space_size = SZ_16G,
>   		.preempt_record_size = 4192 * SZ_1K,
> +		.speedbins = ADRENO_SPEEDBINS(
> +			{ ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
> +			{ ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
> +			/* Other feature codes (on prod SoCs) should match to speedbin 1 */

I'm trying to understand this sentence. because reading patch 4, when there's no match
devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?

Before this change the fallback was speedbin = BIT(0), but this disappeared.

Neil

> +		),
>   	}, {
>   		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
>   		.family = ADRENO_7XX_GEN2,
> 

