Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3BD9D3AB7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 13:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251AC10E727;
	Wed, 20 Nov 2024 12:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SeHY9zFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6940D10E733
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 12:37:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so46370915e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 04:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732106238; x=1732711038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=29+F59TCX2oWN8H3D9tvKo2oVb7iFDjyrRDf38+/OfY=;
 b=SeHY9zFyPbJ69LMmREkxVp/JrY/xxiya7Wlb/tUcD7PXzkcqm/rAQM7KueFgYKIHoe
 +8zXNUEOcgTDF539RVZreKNbaguQ2K2AZcsYVjoJuAQ5IwsdrWAu3Pp8dsg6htqG7uwb
 ZM0Jbfn5HGg81vY2nLMPmuN0BbJEm5B7dKmCU/0xutaTfZ3+NKMDkUFasRk4aXGIph0j
 566cE6BOIrK3h3c7gehh3sc6VvPi8+Dc94tQa2sLD9U/w8FI/PplEw2tcTvX1cZqWUKW
 59MrW+g07VsLmdw4FJv/LFiQGOQn7Ru/tkCjnMLtUvd6nf/cuqGqxrUz16TRoxfEk3d7
 Y+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732106238; x=1732711038;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=29+F59TCX2oWN8H3D9tvKo2oVb7iFDjyrRDf38+/OfY=;
 b=d/eLfJIec/s3ZqWWeu3PDCdaLHcqKZze57mR8+37y1kWecx+4VJI9TFRuW18NBwcP2
 N75wxvKRV8Sy2bhxblqoEgxTF3BqRaZiYtzmX14nCP7sPBVUehn3i+yPxN+yvvZX/CIk
 EFH05vM76xF30CLtvgtcmapHDV3NCrkWY6NHu6/MM/qHCHIE8XHd3wCurDZNbXLvugmy
 u+rcqxnsZ6CezSn3h6p9UvDSYq4cduEViAWMj9VQ/gImdX1KmkL63DGxfAbjm5kCV6sl
 E949Yv+vzZg8w0FlappXky7q4TIti6vhcQOsJu8ApdzpBcj8L25CPEqw+6U/Yt5Wt+T/
 kU5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWFTZIMn1rfjG7g8U0jV6rFAwuJQBgUQhP4olANDxiw3/eegq78sAgkBsLrH6nTX+iq7ehvCPo7PU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziUf1CMJlLB+yA5Xj3bXOf+42SdyRYN8gRCi7TQSdmTm/XyWwv
 Z6edQTkUOFOlCrvdekSjIUVNVE+BoID9+bL1LsxYPEsq7g3GflMAqQzVjDG5Wao=
X-Google-Smtp-Source: AGHT+IE1cTIXKuvyTa+VfNMnZORUxk9RDxl7wgCCFVWN0Cp7P+TTaqVCRjbi64l1BhQOLHPU1KVmvg==
X-Received: by 2002:a05:600c:4447:b0:42c:bd4d:e8ba with SMTP id
 5b1f17b1804b1-433489b1a20mr22697215e9.8.1732106238208; 
 Wed, 20 Nov 2024 04:37:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:927b:2848:1f7d:3776?
 ([2a01:e0a:982:cbb0:927b:2848:1f7d:3776])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45fb5f6sm17738025e9.15.2024.11.20.04.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 04:37:17 -0800 (PST)
Message-ID: <a1aa497f-3be9-4870-a09a-d91f10091308@linaro.org>
Date: Wed, 20 Nov 2024 13:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 05/11] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
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
 <20241119-topic-sm8x50-gpu-bw-vote-v2-5-4deb87be2498@linaro.org>
 <stifp2gtqxmegysrewfuwdsxpqin6zznvqndw7rj5nysi6rq4g@543stomenpvf>
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
In-Reply-To: <stifp2gtqxmegysrewfuwdsxpqin6zznvqndw7rj5nysi6rq4g@543stomenpvf>
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

On 20/11/2024 12:42, Dmitry Baryshkov wrote:
> On Tue, Nov 19, 2024 at 06:56:40PM +0100, Neil Armstrong wrote:
>> The Adreno GMU Management Unit (GMU) can also scale DDR Bandwidth along
>> the Frequency and Power Domain level, but by default we leave the
>> OPP core scale the interconnect ddr path.
>>
>> In order to calculate vote values used by the GPU Management
>> Unit (GMU), we need to parse all the possible OPP Bandwidths and
>> create a vote value to be sent to the appropriate Bus Control
>> Modules (BCMs) declared in the GPU info struct.
>>
>> The vote array will then be used to dynamically generate the GMU
>> bw_table sent during the GMU power-up.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> LGTM, two minor nits below.
> 
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 153 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  14 ++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>>   3 files changed, 168 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 14db7376c712d19446b38152e480bd5a1e0a5198..f6814d92a4edb29ba8a34a34aabb8b2324e9c6a4 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_opp.h>
>>   #include <soc/qcom/cmd-db.h>
>> +#include <soc/qcom/tcs.h>
>>   #include <drm/drm_gem.h>
>>   
>>   #include "a6xx_gpu.h"
>> @@ -1287,6 +1288,109 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * struct bcm_db - Auxiliary data pertaining to each Bus Clock Manager (BCM)
>> + * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
>> + * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
>> + * @vcd: virtual clock domain that this bcm belongs to
>> + * @reserved: reserved field
>> + */
>> +struct bcm_db {
>> +	__le32 unit;
>> +	__le16 width;
>> +	u8 vcd;
>> +	u8 reserved;
>> +};
>> +
>> +static u64 bcm_div(u64 num, u32 base)
>> +{
>> +	/* Ensure that small votes aren't lost. */
>> +	if (num && num < base)
>> +		return 1;
>> +
>> +	do_div(num, base);
>> +
>> +	return num;
>> +}
>> +
>> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
>> +				       struct a6xx_gmu *gmu)
>> +{
>> +	const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
>> +	unsigned int bcm_index, bw_index;
>> +
>> +	/* Retrieve BCM data from cmd-db */
>> +	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
>> +		size_t count;
>> +
>> +		/* Skip unconfigured BCM */
>> +		if (!info->bcm[bcm_index].name)
>> +			continue;
>> +
>> +		bcm_data[bcm_index] = cmd_db_read_aux_data(
>> +						info->bcm[bcm_index].name,
>> +						&count);
>> +		if (IS_ERR(bcm_data[bcm_index]))
>> +			return PTR_ERR(bcm_data[bcm_index]);
>> +
>> +		if (!count)
>> +			return -EINVAL;
>> +	}
>> +
>> +	/* Generate BCM votes values for each bandwidth & BCM */
>> +	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
>> +		u32 *data = gmu->gpu_bw_votes[bw_index];
>> +		u32 bw = gmu->gpu_bw_table[bw_index];
>> +
>> +		/* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */
>> +		for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
>> +			bool commit = false;
>> +			u64 peak, vote;
>> +			u16 width;
>> +			u32 unit;
>> +
>> +			/* Skip unconfigured BCM */
>> +			if (!info->bcm[bcm_index].name || !bcm_data[bcm_index])
>> +				continue;
> 
> Nit: you don't care about the .name anymore, the first check can be
> dropped.

Right

> 
>> +
>> +			if (bcm_index == GMU_MAX_BCMS - 1 ||
>> +			    (bcm_data[bcm_index + 1] &&
>> +			     bcm_data[bcm_index]->vcd != bcm_data[bcm_index + 1]->vcd))
>> +				commit = true;
>> +
>> +			if (!bw) {
>> +				data[bcm_index] = BCM_TCS_CMD(commit, false, 0, 0);
>> +				continue;
>> +			}
>> +
>> +			if (info->bcm[bcm_index].fixed) {
>> +				u32 perfmode = 0;
>> +
>> +				if (bw >= info->bcm[bcm_index].perfmode_bw)
>> +					perfmode = info->bcm[bcm_index].perfmode;
>> +
>> +				data[bcm_index] = BCM_TCS_CMD(commit, true, 0, perfmode);
>> +				continue;
>> +			}
>> +
>> +			/* Multiply the bandwidth by the width of the connection */
>> +			width = le16_to_cpu(bcm_data[bcm_index]->width);
>> +			peak = bcm_div((u64)bw * width, info->bcm[bcm_index].buswidth);
>> +
>> +			/* Input bandwidth value is in KBps, scale the value to BCM unit */
>> +			unit = le32_to_cpu(bcm_data[bcm_index]->unit);
>> +			vote = bcm_div(peak * 1000ULL, unit);
>> +
>> +			if (vote > BCM_TCS_CMD_VOTE_MASK)
>> +				vote = BCM_TCS_CMD_VOTE_MASK;
>> +
>> +			data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /* Return the 'arc-level' for the given frequency */
>>   static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
>>   					   unsigned long freq)
>> @@ -1390,12 +1494,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>>    * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
>>    * to construct the list of votes on the CPU and send it over. Query the RPMh
>>    * voltage levels and build the votes
>> + * The GMU can also vote for DDR interconnects, use the OPP bandwidth entries
>> + * and BCM parameters to build the votes.
>>    */
>>   
>>   static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>>   {
>>   	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>   	struct msm_gpu *gpu = &adreno_gpu->base;
>>   	int ret;
>>   
>> @@ -1407,6 +1514,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>>   	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
>>   		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
>>   
>> +	/* Build the interconnect votes */
>> +	if (adreno_gpu->info->features & ADRENO_FEAT_GMU_BW_VOTE)
>> +		ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -1442,6 +1553,38 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
>>   	return index;
>>   }
>>   
>> +static int a6xx_gmu_build_bw_table(struct device *dev, unsigned long *bandwidths,
>> +		u32 size)
>> +{
>> +	int count = dev_pm_opp_get_opp_count(dev);
>> +	struct dev_pm_opp *opp;
>> +	int i, index = 0;
>> +	unsigned int bandwidth = 1;
>> +
>> +	/*
>> +	 * The OPP table doesn't contain the "off" bandwidth level so we need to
>> +	 * add 1 to the table size to account for it
>> +	 */
>> +
>> +	if (WARN(count + 1 > size,
>> +		"The GMU bandwidth table is being truncated\n"))
>> +		count = size - 1;
>> +
>> +	/* Set the "off" bandwidth */
>> +	bandwidths[index++] = 0;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		opp = dev_pm_opp_find_bw_ceil(dev, &bandwidth, 0);
>> +		if (IS_ERR(opp))
>> +			break;
>> +
>> +		dev_pm_opp_put(opp);
>> +		bandwidths[index++] = bandwidth++;
>> +	}
>> +
>> +	return index;
>> +}
>> +
>>   static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>   {
>>   	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>> @@ -1472,6 +1615,16 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>   
>>   	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>>   
>> +	/*
>> +	 * The GMU also handles GPU Interconnect Votes so build a list
>> +	 * of DDR bandwidths from the GPU OPP table
>> +	 */
>> +	if (adreno_gpu->info->features & ADRENO_FEAT_GMU_BW_VOTE)
>> +		gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
>> +			gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
>> +
>> +	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>> +
>>   	/* Build the list of RPMh votes that we'll send to the GMU */
>>   	return a6xx_gmu_rpmh_votes_init(gmu);
>>   }
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..03603eadc0f9ed866899c95e99f333a511ebc3c1 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>> @@ -19,6 +19,16 @@ struct a6xx_gmu_bo {
>>   	u64 iova;
>>   };
>>   
>> +#define GMU_MAX_BCMS	3
>> +
>> +struct a6xx_bcm {
>> +	char *name;
>> +	unsigned int buswidth;
>> +	bool fixed;
>> +	unsigned int perfmode;
>> +	unsigned int perfmode_bw;
>> +};
>> +
>>   /*
>>    * These define the different GMU wake up options - these define how both the
>>    * CPU and the GMU bring up the hardware
>> @@ -82,6 +92,10 @@ struct a6xx_gmu {
>>   	unsigned long gpu_freqs[16];
>>   	u32 gx_arc_votes[16];
>>   
>> +	int nr_gpu_bws;
>> +	unsigned long gpu_bw_table[16];
>> +	u32 gpu_bw_votes[16][GMU_MAX_BCMS];
> 
> We still have magic 16 here. GPU_MAX_FREQUENCIES? GPU_FREQ_TABLE_SIZE?

Yeah it would be max frequencies.

I tried to replace this 16, but it's used as ARRAY_SIZE(gmu->gpu_bw_table)
like the other gx_arc_votes & gpu_freqs.

So I don't know what do define and where, and how, a separate patch ?

The define would only be used in the struct, not in the code, or whould I
drop the ARRAY_SIZE and use this define ?

> 
>> +
>>   	int nr_gmu_freqs;
>>   	unsigned long gmu_freqs[4];
>>   	u32 cx_arc_votes[4];
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..5b80919e595fa1ba0a3afcca55feb89e60870cb1 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -44,6 +44,7 @@ struct a6xx_info {
>>   	u32 gmu_chipid;
>>   	u32 gmu_cgc_mode;
>>   	u32 prim_fifo_threshold;
>> +	const struct a6xx_bcm bcm[GMU_MAX_BCMS];
>>   };
>>   
>>   struct a6xx_gpu {
>>
>> -- 
>> 2.34.1
>>
> 

Thanks,
Neil

