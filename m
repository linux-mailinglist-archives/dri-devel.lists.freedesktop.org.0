Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4269E9853
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 15:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587A810E793;
	Mon,  9 Dec 2024 14:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zFKKbsZ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C7110E79E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 14:07:02 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so2804861f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 06:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733753221; x=1734358021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8TL2MbMVS0LA1fcrVHWeYCb3ppOpM6kJxBQgdxTKNEc=;
 b=zFKKbsZ9Y5V73poezbGj91hZWJtFiLYVgAlvJrmyYgUANR8O1TKEuJNQqmXtr8BjZr
 WIGMV3YsbQf+vzDeqK0++gHVnwMqKZCX4C0PqgsbvzWyn/KU5FChcCA6AbO2lbO78Aka
 g2UeJHoUyvCgYjIFwHLS65sqKeMRDQ8PsicTAaLYqSdvIZi83sCAmsbbJXgOKRSFMEyW
 VjEeo/CSfFOlN/FB6iQvdxjTyoXoSM1iqE+bQMt7cjZg/4+H9STbrEkwKKoyksw90qQj
 I/YdgC1P679E+GRMUSBUNsTi0d+O/9mIDbMFAbBH/sXHvhBZCjEF6QF9q4Rt2De1Omsa
 /mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733753221; x=1734358021;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8TL2MbMVS0LA1fcrVHWeYCb3ppOpM6kJxBQgdxTKNEc=;
 b=FZn9wUkI8SDRQC3xEDnf5YvS+MOUr+T1bawCd31hL2JGH8VV9Ncw4K5GRNmMT4/4mJ
 SZmsuaAmwrF2fGb/FclGe/HAUfD3Tui+0oq08iDwl+B8avGnDigZ07e/MZcDzRQDpJa2
 r5NycZ6KYIfSIIfljZES6RlW8ZdXnMTwwo8aSWNbNvQQUZ10xb2ws5zDNQMFoMxXZcYa
 zuRNAr3RpcTMFcm1tz1hIhXhwtdfnrzDxj6ynQkxbWhH/fw2GkylqJd554DKGYqGHX5v
 1bP/mtE53SjcfD76Tdz/kZ/thxep1Dpv9mmkgbRZcrI7ts1QL91aIIqU30JK9/ycN8U9
 FllQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSdvUGH6b12eVxf6pQNEe9zgohoKmwqpXCqkbyzVg9YmyYMJ3Q9DoGFElQbKl1iFOVuGW5h46wsmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhSjw1tJlwdR0m8RKBM1TYqftHyBLnD1tnOXeDHHaumqPazr0j
 4Ga4sih4Lczo5DDdenjNTy3iuiQF516jKxj6ud+mj1cr28MZiKCcmOrCisouIVY=
X-Gm-Gg: ASbGncsOYW+RUbl6UR7WvjZYwqfOazI3cIeftivC5eKqG4/kBtCEpc4DqDKXf+cmUoW
 bhm4O53U4WFDP61fatHy+O/wnu3h8jCgFQp7tLJJNjLQNLnzkg76nPSLv2u6O+pCdTmTQOeKKIu
 7KX7dCZwdKauKPq5EUpeOZU9dzvyO2qeYSEoG7x4ylQILY+2gtJ4LJdrz8uDEeFgPdxGNWRgf3U
 qnklopPMlIjwB08fENu4vpoekyxZHJ8YQGoixY+b5tZqUNWXEZdjSfeR/viC0uG31wdKcOi/yg+
 nPIIj8S/YH6xJghEMK/0D61F0k0=
X-Google-Smtp-Source: AGHT+IGucCc+D0VX2jp79Smo7afxqpLhOYHKy/vpIQDIDF/vHEETnS6x9UlrTj3Drk16mX0zQ4F1EQ==
X-Received: by 2002:a05:6000:400c:b0:386:3560:477f with SMTP id
 ffacd0b85a97d-386356049e3mr6090376f8f.23.1733753220814; 
 Mon, 09 Dec 2024 06:07:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7546:6147:f006:709b?
 ([2a01:e0a:982:cbb0:7546:6147:f006:709b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434eb775350sm85048115e9.5.2024.12.09.06.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 06:07:00 -0800 (PST)
Message-ID: <c1eacaa5-f51f-4e6b-8848-3fdb065aab19@linaro.org>
Date: Mon, 9 Dec 2024 15:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/7] drm/msm: adreno: dynamically generate GMU bw table
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
 <20241205-topic-sm8x50-gpu-bw-vote-v4-3-9650d15dd435@linaro.org>
 <93ed4511-55b5-42a9-a3fe-32f29bd01bab@quicinc.com>
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
In-Reply-To: <93ed4511-55b5-42a9-a3fe-32f29bd01bab@quicinc.com>
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

On 09/12/2024 13:11, Akhil P Oommen wrote:
> On 12/5/2024 8:31 PM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale the ddr
>> bandwidth along the frequency and power domain level, but for
>> now we statically fill the bw_table with values from the
>> downstream driver.
>>
>> Only the first entry is used, which is a disable vote, so we
>> currently rely on scaling via the linux interconnect paths.
>>
>> Let's dynamically generate the bw_table with the vote values
>> previously calculated from the OPPs.
>>
>> Those entries will then be used by the GMU when passing the
>> appropriate bandwidth level while voting for a gpu frequency.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 41 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index cb8844ed46b29c4569d05eb7a24f7b27e173190f..fc4bfad51de9a3b6617fbbd03471a5851d43ce88 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -5,7 +5,10 @@
>>   #include <linux/circ_buf.h>
>>   #include <linux/list.h>
>>   
>> +#include <dt-bindings/interconnect/qcom,icc.h>
>> +
>>   #include <soc/qcom/cmd-db.h>
>> +#include <soc/qcom/tcs.h>
>>   
>>   #include "a6xx_gmu.h"
>>   #include "a6xx_gmu.xml.h"
>> @@ -259,6 +262,39 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>>   		NULL, 0);
>>   }
>>   
>> +static void a6xx_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
>> +				   struct a6xx_hfi_msg_bw_table *msg)
>> +{
>> +	unsigned int i, j;
>> +
>> +	msg->ddr_wait_bitmask = QCOM_ICC_TAG_ALWAYS;
> 
> Why this is QCOM_ICC_TAG_ALWAYS?
> 
> IIRC, this bitmask informs RPMH whether it should wait for previous BCM
> vote to complete. Can we implement the same logic from kgsl to create
> this bitmask?

Ack, Let me check

> 
> 
>> +
>> +	for (i = 0; i < GMU_MAX_BCMS; i++) {
>> +		if (!info->bcms[i].name)
>> +			break;
>> +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);
>> +	}
>> +	msg->ddr_cmds_num = i;
>> +
>> +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
>> +		for (j = 0; j < msg->ddr_cmds_num; j++)
>> +			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
>> +	msg->bw_level_num = gmu->nr_gpu_bws;
>> +
>> +	/*
>> +	 * These are the CX (CNOC) votes - these are used by the GMU
>> +	 * The 'CN0' BCM is used on all targets, and votes are basically
>> +	 * 'off' and 'on' states with first bit to enable the path.
>> +	 */
>> +
>> +	msg->cnoc_cmds_num = 1;
>> +	msg->cnoc_wait_bitmask = QCOM_ICC_TAG_AMC;
> 
> Same here.
> 
> Rest looks fine to me.

Thanks,
Neil

> 
> -Akhil
> 
>> +
>> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
>> +	msg->cnoc_cmds_data[0][0] = BCM_TCS_CMD(true, false, 0, 0);
>> +	msg->cnoc_cmds_data[1][0] = BCM_TCS_CMD(true, true, 0, BIT(0));
>> +}
>> +
>>   static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>   {
>>   	/* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
>> @@ -664,6 +700,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>   	struct a6xx_hfi_msg_bw_table *msg;
>>   	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>   
>>   	if (gmu->bw_table)
>>   		goto send;
>> @@ -672,7 +709,9 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>   	if (!msg)
>>   		return -ENOMEM;
>>   
>> -	if (adreno_is_a618(adreno_gpu))
>> +	if (info->bcms && gmu->nr_gpu_bws > 1)
>> +		a6xx_generate_bw_table(info, gmu, msg);
>> +	else if (adreno_is_a618(adreno_gpu))
>>   		a618_build_bw_table(msg);
>>   	else if (adreno_is_a619(adreno_gpu))
>>   		a619_build_bw_table(msg);
>>
> 

