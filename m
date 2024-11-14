Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA69C85F9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 10:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9667410E7C1;
	Thu, 14 Nov 2024 09:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cashxR9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E36910E7C2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 09:23:11 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fb5740a03bso3511941fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 01:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731576190; x=1732180990; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=pKVskJH08XCjh0dvrOvGb7Xw0ql6HSZ5m3cIUFTJUOc=;
 b=cashxR9ptbFTAE/dGs1GCcsLRVdhT2t/2EdFFUeZcv3wZmY6jP6uy/HM/yyqyt2A7w
 A6PsnIlxRaC0FN3JWRRxIlxpvw8YXRh7ztNEBd9meHETssOhAsknTVeD2vnzxnouJ0pt
 1IeEHhHU4biGw77AGOw1hTMiGDZJEi+Y3Nml9KBSknQL8nF+GprHhRafF3mjIJXKjiup
 bEuZj+YsWTYYaIauDjejXeuPXS0lRDlZzqnr4Z7aLG+5pnJ7lkY+POrDL+JhG/D4IvLQ
 biXYI+U74QqkeKCAaXzzGAeiVU/lIq1JsxDgyZchotnNh24AldQSQ1d7gBTyY2577pdS
 wtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731576190; x=1732180990;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pKVskJH08XCjh0dvrOvGb7Xw0ql6HSZ5m3cIUFTJUOc=;
 b=DwXsq9bRAl+iNmV6yX/9TPY54RPIQ5ViTgnZ5KadwIvXAZkQEGgzTTUeKmMMp4YT4P
 +laYOuqxxnPKW/Wu/dtlvWs9/kQlD7vEfLHzhRbqkFZ8kdHbuX6G0+wZVnirP4vVYqXA
 BqVkzwXoVj/QUftUGSgE38ddro8Zxl9x0KZBx4CE6AsFgOIhiM4aasfoaUccwklV6ciH
 TJTh5BLEYqlsehAnvx3Qve216Ic4HWNVQu9HSGqYBMmlAF6viieStbH/QgYkMHm+syKc
 3vDFMBKJ+kASO2GBeN4i4LGifn2apfXmmvsf7UWMKC0gWHXQFcO2/zc8cuYDil7ejjNz
 5o7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv9tpB6S9dL/XztHqSNICNIX63BZy1CyBz676566A0R0JBsx1XJAP3uJIKT69XfTVWVq3ETBa2ne4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd3H8Tao0TWnfXDYLo6PGvJ8KbyH6hy4upeJ0qsD/XdI3WMB86
 aQI0shx2Qt/hMOMz7I5+yntC3TxZU9KkHhf6v12Uh8nOym97Sd4H+mAAtUZkUq4=
X-Google-Smtp-Source: AGHT+IGErzUCoRrzEItkg1L3C/jktxdQuqW4d/nGFV/zoyOKtwAeZgerInrjMql5bO5vzmezrLU3dw==
X-Received: by 2002:a05:651c:e15:b0:2ff:53c7:a79f with SMTP id
 38308e7fff4ca-2ff53c7a8admr13442661fa.7.1731576189979; 
 Thu, 14 Nov 2024 01:23:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a62a:6bba:b737:406e?
 ([2a01:e0a:982:cbb0:a62a:6bba:b737:406e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da298c81sm16941005e9.39.2024.11.14.01.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 01:23:09 -0800 (PST)
Message-ID: <ff0ec93b-e2d0-4022-b8ae-8e4d9d1eac9f@linaro.org>
Date: Thu, 14 Nov 2024 10:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 1/8] opp: core: implement dev_pm_opp_get_bandwidth
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
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
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-1-3b8d39737a9b@linaro.org>
 <20241114041044.esfazw5mv6zfyrix@vireshk-i7>
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
In-Reply-To: <20241114041044.esfazw5mv6zfyrix@vireshk-i7>
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

On 14/11/2024 05:10, Viresh Kumar wrote:
> On 13-11-24, 16:48, Neil Armstrong wrote:
>> Add and implement the dev_pm_opp_get_bandwidth() to retrieve
>> the OPP's bandwidth in the same was as the dev_pm_opp_get_voltage()
> 
>                                    way
> 
>> helper.
>>
>> Retrieving bandwidth is required in the case of the Adreno GPU
>> where the GPU Management Unit can handle the Bandwidth scaling.
>>
>> The helper can get the peak or everage bandwidth for any of
> 
>                                   average

Aww, good catch, thanks

> 
>> the interconnect path.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/opp/core.c     | 25 +++++++++++++++++++++++++
>>   include/linux/pm_opp.h |  7 +++++++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>> index 494f8860220d97fc690ebab5ed3b7f5f04f22d73..19fb82033de26b74e9604c33b9781689df2fe80a 100644
>> --- a/drivers/opp/core.c
>> +++ b/drivers/opp/core.c
>> @@ -106,6 +106,31 @@ static bool assert_single_clk(struct opp_table *opp_table)
>>   	return !WARN_ON(opp_table->clk_count > 1);
>>   }
>>   
>> +/**
>> + * dev_pm_opp_get_bandwidth() - Gets the peak bandwidth corresponding to an opp
> 
> s/peak bandwidth/bandwidth/

Ack

> 
>> + * @opp:	opp for which voltage has to be returned for
>> + * @peak:	select peak or average bandwidth
>> + * @index:	bandwidth index
>> + *
>> + * Return: peak bandwidth in kBps, else return 0
> 
> s/peak bandwidth/bandwidth/

Ack

> 
>> + */
>> +unsigned long dev_pm_opp_get_bandwidth(struct dev_pm_opp *opp, bool peak, int index)
>> +{
>> +	if (IS_ERR_OR_NULL(opp)) {
>> +		pr_err("%s: Invalid parameters\n", __func__);
>> +		return 0;
>> +	}
>> +
>> +	if (index > opp->opp_table->path_count)
>> +		return 0;
>> +
>> +	if (!opp->bandwidth)
>> +		return 0;
>> +
>> +	return peak ? opp->bandwidth[index].peak : opp->bandwidth[index].avg;
>> +}
>> +EXPORT_SYMBOL_GPL(dev_pm_opp_get_bandwidth);
> 
> All other bandwidth APIs are named as _bw, maybe do same here too ?
> 

Sure, I wasn't sure about that, will switch to _bw.

Neil

