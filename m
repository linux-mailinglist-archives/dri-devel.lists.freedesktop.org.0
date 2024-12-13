Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0A9F111E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 16:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEBC10F04F;
	Fri, 13 Dec 2024 15:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+u0Nmmb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774EA10F05D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:37:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9nsqB017550
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IAuh6gAzIOcOgoebHEWrPvAFfOUQNYFpwXM6Ek66GNU=; b=U+u0NmmbKWyZD2Dt
 1lbbcqrilk1jbDbG6Y5HxoXcjGYEZCtn6P+KrzbKcq/7rIfwBeNFKIHdmqTnEJjd
 8i3uPNHsCqggMQbknOnfh4NeeAZylI2cGY03YYOC55Lak07ON8McgVxpKjPLt4+u
 XP/j+jvMrR9mzEEaTMg7UTKnRhpWV0k9rOl70EhrsRXpvn+XmWB4weewT1Lmg+4J
 sbHDYlVxDU2+5iZiE1S9CwjAE5htcXBgRwY6q3Z9DA6bvkbyadmpEsvNg0GBSIAj
 cUuf6mt1YwRak+s7GrsDjGvraa+C9qZOBORDvDJ6/2DDaHmgHMQp/E3WJ/A5IQ8e
 XqFaEg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjmt0yqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:37:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d88fe63f21so4911656d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 07:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734104270; x=1734709070;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IAuh6gAzIOcOgoebHEWrPvAFfOUQNYFpwXM6Ek66GNU=;
 b=w5TCKUhskq9ELjc1JKs/lxdbg/ZDqcbufpqzqlV1fZ33nUDuAyEwvTDuXaM8DJf00l
 qhjds3B/NYbRu67ey8kVtMUgHtdWzMYuRATpI4bXmoXLkTYdF+jtAQkzJEpklAdNIbIQ
 ShqBvgPrpDyeFneNKOjuhfFCKK3g/qLBqErAFHBmpOD1DPHUV0zokpLEYMT9q/xGSTf8
 jgSPEzjD/fdq/2iF2hOy5vK11piks8ljlXIADRlc5wR9BbdA5Vf5HvmKm3ThUJ2wivGg
 dZfmXmKa7hdZRTSny0CvYWyzHlPkpnPA+Yu/OTwKxaUN+NNrazOq1fnZDzuIg8FscLr8
 j0sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW76NpjZKW4Jg3z+EmzhNwH+r8Ch1jfj+Wxqjf7BfE80QPLNuOuKkJdmbTH9ck38GSd8z380freb58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz08KZy9cl06L4Zgg8rbLS/dorrW7zSW36T+Qw1CgCyANAUB/9D
 vwlsY31x872Ftw80Yf061yyC3JivG+2Dtqb8ZacJX4+6eT+wQ9eBU3s8Xbriv/XqTXUfwvKVU6w
 5M//v4KOG9Qcs51J8bl4KK/Ar0yyJn4UPqrIejtHy/DORGWWoUBKIhfGQKTQK9h2MjEk=
X-Gm-Gg: ASbGncukPp2mqvx8nYSKCF3XDXW6qGj6ArsShXWEf63F0x2pUwI5thlBuPziOuhNocm
 f4KVvU8RhUmkoSKuDKC8JvO4Qv+Wv/bl8ICAwnIuAdUb7IjDX5XezRsXpr77bMt6qK6u0lUkSOc
 D3KEHo/I2cJhb1yag2o7ukhHuZL4lgtsSZ+jun6zvhyJAZJx9vKz4jIX19HImdcBfRtKpTHfe9m
 jYThbOaIwgl8f9br3J9lIrDkh2la0xshL7vSrm7MDw1pMVeroDThkna91Q9OObib+G/1JyGe0ep
 yfPYtQ04j5RB1drevkorGj+xNlQkW2pAu2SS
X-Received: by 2002:a05:620a:19a6:b0:7b6:ea67:72e0 with SMTP id
 af79cd13be357-7b6fbee6f78mr152569785a.4.1734104270598; 
 Fri, 13 Dec 2024 07:37:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf/CW5ZuciDywJGCmdtNJG8VLca/dJqdwL5fK5+1TZgYmvE4Jg2xI8dXYsCHD3ZxplcGHEaA==
X-Received: by 2002:a05:620a:19a6:b0:7b6:ea67:72e0 with SMTP id
 af79cd13be357-7b6fbee6f78mr152567485a.4.1734104270201; 
 Fri, 13 Dec 2024 07:37:50 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa699618041sm615380666b.81.2024.12.13.07.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 07:37:49 -0800 (PST)
Message-ID: <c2d8f443-5876-4293-8d2b-ecd13eaf8285@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 16:37:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, neil.armstrong@linaro.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
 <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
 <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
 <80bed70e-7802-4555-a15e-e06fe46214c6@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <80bed70e-7802-4555-a15e-e06fe46214c6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Lfy1rgpGWWPD6I7ICrZLK04hrDEO_1Ys
X-Proofpoint-ORIG-GUID: Lfy1rgpGWWPD6I7ICrZLK04hrDEO_1Ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130111
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.12.2024 2:12 PM, Akhil P Oommen wrote:
> On 12/13/2024 3:07 AM, Neil Armstrong wrote:
>> On 12/12/2024 21:21, Konrad Dybcio wrote:
>>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>>> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
>>>> along the Frequency and Power Domain level, until now we left the OPP
>>>> core scale the OPP bandwidth via the interconnect path.
>>>>
>>>> In order to enable bandwidth voting via the GPU Management
>>>> Unit (GMU), when an opp is set by devfreq we also look for
>>>> the corresponding bandwidth index in the previously generated
>>>> bw_table and pass this value along the frequency index to the GMU.
>>>>
>>>> The GMU also takes another vote called AB which is a 16bit quantized
>>>> value of the floor bandwidth against the maximum supported bandwidth.
>>>>
>>>> The AB is calculated with a default 25% of the bandwidth like the
>>>> downstream implementation too inform the GMU firmware the minimal
>>>> quantity of bandwidth we require for this OPP.
>>>>
>>>> Since we now vote for all resources via the GMU, setting the OPP
>>>> is no more needed, so we can completely skip calling
>>>> dev_pm_opp_set_opp() in this situation.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 ++++++++++++++++++++++++
>>>> +++++++++--
>>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>>>   4 files changed, 46 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/
>>>> msm/adreno/a6xx_gmu.c
>>>> index
>>>> 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>> struct dev_pm_opp *opp,
>>>>                  bool suspended)
>>>>   {
>>>>       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>>       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>       u32 perf_index;
>>>> +    u32 bw_index = 0;
>>>>       unsigned long gpu_freq;
>>>>       int ret = 0;
>>>>   @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>> struct dev_pm_opp *opp,
>>>>           if (gpu_freq == gmu->gpu_freqs[perf_index])
>>>>               break;
>>>>   +    /* If enabled, find the corresponding DDR bandwidth index */
>>>> +    if (info->bcms && gmu->nr_gpu_bws > 1) {
>>>
>>> if (gmu->nr_gpu_bws)
>>
>> gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0 is the
>> "off" state)
>>
>>>
>>>> +        unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>>>> +
>>>> +        for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index+
>>>> +) {
>>>> +            if (bw == gmu->gpu_bw_table[bw_index])
>>>> +                break;
>>>> +        }
>>>> +
>>>> +        /* Vote AB as a fraction of the max bandwidth */
>>>> +        if (bw) {
>>>
>>> This seems to only be introduced with certain a7xx too.. you should
>>> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported
>>
>> Good point
> 
> No no. Doing this will trigger some assert in pre-A750 gmu firmwares. We
> learned it the hard way. No improvisation please. :)

We shouldn't be sending that AB data to firmware that doesn't expect
it either too, though..

Konrad
