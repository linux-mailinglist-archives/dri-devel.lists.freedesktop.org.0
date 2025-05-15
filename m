Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313CBAB8B75
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C6210E900;
	Thu, 15 May 2025 15:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="leUOTINV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ADC10E8FC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:51:36 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFLOo002029
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +e+5/dGFTBvTUJTFnStarpjY0VEAdmkaML06k5ujGeE=; b=leUOTINVq/54ZUdU
 vQv4+xzg3M/uywuo6dM2OpTinZku8k8A8Xp/jSUkY1bCs0Ae0cEwExkXVVNacxX7
 lHzVX5oFrpO4fmvNs08fms/IF0t9EoxIeswc2x5BBPSNknLJeIF1M9cTDCrS+hOW
 eR6w+nK3rd9zwJsmDIVoFD95zI96i8YZ8Uxg/9joylQeSAGZHjzlnKR/YGQg7KOs
 NBJS2XBih/4MwNbs/OdSVjlDPCdjNBrxntKbnrKzZmPGdVUEcORkcLUiRctOfdgO
 w0QtZ7fQHW/3jjeuZj1bIS0qLWvRtU3p8GKp0oJze8Py+hUAEaGu1NkaDyhawm0C
 /xWYdg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrem4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:51:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8ac35546eso373776d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 08:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747324295; x=1747929095;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+e+5/dGFTBvTUJTFnStarpjY0VEAdmkaML06k5ujGeE=;
 b=m+X6hWbV40U/UKHOd6AAwF7ZPgs7cDEydDplZMpq6LkSAjjlkX1SuxBAWyaIHy9iuJ
 F7rRYmT76ZgQIREBbXJbEMD8rJkXxkr+J3Nyav0vKNhXXruUTVINgHxhkiENSJZg2n5r
 IRvgXiWWWtqHLUnobsvikYE2dmhjGUP/Bm0AecOzE9IZ4KBc7sZMo/ba21Fx7GHfkt9S
 wX6hyTQjrSKBwnE5qi4SXi0KabHrfXuR5SsEASdicFAoEAHn5yEmt5lkvO3L5h2qYTth
 KR3AzksiEAYUmbzgpBfDbyGvcGR6EEF1temvzHmsJKRc/XiOANG8uyuw4k15v1e+LV47
 b29g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO8LzWZvooRPcuDH636T7gW7jZ+l2A6rMqRR8Vaa635U9+Fvs83FGhCs/7APS9Chbr0Zdq8ZLsev4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0D3lHhmqTMwSUTh/tBTWCop1kCCBNMC4V2ZPb0S4PGwKqrbFg
 LsFyqWo3QvT6h6AIhMFaH8wQYZkjPebAJpsikn7TGRa7JlC4pQ+xJHbesKSOWWngcLpmD1//9l3
 juCyxgmqU8r3BnF4UX0vGwxXMm8jfxDhDAxXJMnLZAmO1JRnDP/3Ax5fza3KgGZTHVbQEzgM=
X-Gm-Gg: ASbGncsC8Ol50FJqLPUmIQJzd3+nMu7QwkXmeedQ3/bbqkEtWJ6zWcT9YWnsDDwJWlR
 0tmTp5JqfNB0Q6BeePDTwqedxVJw8gG5kl7vqapnXS8Abfu4hLRBgT84qElxb3Hbald92nUQRnn
 +Y6YZbULo9ffqGm3m8TkH12A5cXY3Uav8hAXM4lqX/FpgVR/W30bZAFuswj0Xd6PuOhqGvpe3UK
 dp3B/5ZTsSmy8k6xDSz+HI4rnAxCML+53rnpiuBrIcd7WV9AGBpuBloaB8nMQWwrQzQd1Lq/Whd
 zcqsvKPdKl+MXJhN3JCPowh6AA/hL7KApJ3xDSDlovMnS4BCZTfxgYxf/yvD/MXlQw==
X-Received: by 2002:a05:6214:20ab:b0:6f8:95ee:9da2 with SMTP id
 6a1803df08f44-6f8b08ab968mr1250156d6.10.1747324294902; 
 Thu, 15 May 2025 08:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfaZCHStwDbGBnyL2BR4sz8v/EdIJECgWgLt80+ba9IIvBZ4s0JC+YbhOTKTK6PxxUotlxYA==
X-Received: by 2002:a05:6214:20ab:b0:6f8:95ee:9da2 with SMTP id
 6a1803df08f44-6f8b08ab968mr1249956d6.10.1747324294537; 
 Thu, 15 May 2025 08:51:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ca2bfsm6455966b.157.2025.05.15.08.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 08:51:34 -0700 (PDT)
Message-ID: <503932a8-3124-4448-b18a-e25554745488@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 11/15] drm/msm/adreno: Switch to the common UBWC
 config struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-11-09ecbc0a05ce@oss.qualcomm.com>
 <qhmayxvlyz2txum5rs5vaf3iqzniz6nktr4zatru6bhgp6tdah@uq24obw2ro5f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qhmayxvlyz2txum5rs5vaf3iqzniz6nktr4zatru6bhgp6tdah@uq24obw2ro5f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eUlb5GpUJWd1fTqZMno8P_CgdceeLhZ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NyBTYWx0ZWRfX9WchoVdU76pN
 nCFrB9RsbLoKVkEDK3HU35me59XhluIB6p+NqeP0m9IdwMnl8w30b1EPPvJVOS2K91eyoMNgMGF
 nIYVyRw1DZuG6iD3XKyHRBi1hej2GmNZKP8/AYAwX1Rtqm5bqtvkOCN3zRHeiwX4zOUclGB+ATM
 jDpbUGKWOG6WT9u1uMJyuSqwnuYC1hWwVUSzsdgYd7sdYgrdWOkcvnfVNbClqKbfURmejg3c96h
 Itvw8IwPurmlUD7JmMqNHEIv1azft/Ln4cgF3bMeNQqkgnqi5GnClisLGHrKlZAttd/NiJYMDLG
 zqCoX/zko/4nB1Nc5P9p+gBw/tubT8y1//Aa2+p8rpD5ZmHG8yqSel/A0TRc4spKJUOPXxeKXVo
 TxcrRmLUZf2HxA65uMrDgHtgeUNOnbfCG54b7HNbCX1Lfo+f6gyObQJvZrCxjg05UGK0LgzK
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68260d87 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hON3piRNd2u2ny3NyMoA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: eUlb5GpUJWd1fTqZMno8P_CgdceeLhZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150157
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

On 5/14/25 9:22 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:31PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Now that Adreno specifics are out of the way, use the common config
>> (but leave the HBB hardcoding in place until that is wired up on the
>> other side).
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 +++++------
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 ++++++++++++++++-----------------
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 ++++-------------------
>>  4 files changed, 50 insertions(+), 85 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index 650e5bac225f372e819130b891f1d020b464f17f..611e0eb26d0e19d431673d08e042162375fd400f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -833,8 +833,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>>  
>>  	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
>>  
>> -	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>> -	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
>> +	BUG_ON(adreno_gpu->ubwc_config->highest_bank_bit < 13);
>> +	hbb = adreno_gpu->ubwc_config->highest_bank_bit - 13;
>>  
>>  	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
>>  	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
>> @@ -1754,6 +1754,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>  	struct msm_drm_private *priv = dev->dev_private;
>>  	struct platform_device *pdev = priv->gpu_pdev;
>>  	struct adreno_platform_config *config = pdev->dev.platform_data;
>> +	const struct qcom_ubwc_cfg_data *common_cfg;
>>  	struct a5xx_gpu *a5xx_gpu = NULL;
>>  	struct adreno_gpu *adreno_gpu;
>>  	struct msm_gpu *gpu;
>> @@ -1790,15 +1791,14 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>  	/* Set up the preemption specific bits and pieces for each ringbuffer */
>>  	a5xx_preempt_init(gpu);
>>  
>> -	/* Set the highest bank bit */
>> -	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
>> -		adreno_gpu->ubwc_config.highest_bank_bit = 15;
>> -	else
>> -		adreno_gpu->ubwc_config.highest_bank_bit = 14;
>> +	/* Inherit the common config and make some necessary fixups */
>> +	common_cfg = qcom_ubwc_config_get_data();
>> +	if (IS_ERR(common_cfg))
>> +		return ERR_PTR(-EINVAL);
>>  
>> -	/* a5xx only supports UBWC 1.0, these are not configurable */
>> -	adreno_gpu->ubwc_config.macrotile_mode = 0;
>> -	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
>> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
>> +	adreno_gpu->_ubwc_config = *common_cfg;
>> +	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
> 
> Ugh. I'd rather keep the ubwc config r/o.
> 
>>  
>>  	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index fdc843c47c075a92ec8305217c355e4ccee876dc..ae0bb7934e7ed203aa3b81e28767de204f0a4d60 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -587,64 +587,62 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>  
>>  static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  {
>> +	const struct qcom_ubwc_cfg_data *common_cfg;
>> +	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
>> +
>>  	/* Inherit the common config and make some necessary fixups */
>> -	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
>> -	if (IS_ERR(gpu->common_ubwc_cfg))
>> +	common_cfg = qcom_ubwc_config_get_data();
>> +	if (IS_ERR(common_cfg))
>>  		return -EINVAL;
>>  
>> -	gpu->ubwc_config.ubwc_swizzle = 0x6;
>> -	gpu->ubwc_config.macrotile_mode = 0;
>> -	gpu->ubwc_config.highest_bank_bit = 15;
>> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
>> +	*cfg = *common_cfg;
>> +
>> +	cfg->ubwc_swizzle = 0x6;
>> +	cfg->highest_bank_bit = 15;
>>  
> 
> This begs for WARN_ON(cfg->ubwc_swizzle !=
> gpu->common_ubwc_cfg->ubwc_swizzle) and similar change for HBB. Then
> after testing we should be able to drop r/w part of the config.

I'd rather put the warn in ubwc_config.c

Konrad
