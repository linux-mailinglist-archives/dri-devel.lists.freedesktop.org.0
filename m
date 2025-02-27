Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F778A48ABE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 22:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A94410EB9F;
	Thu, 27 Feb 2025 21:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="byUc7cDF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAE210EB9F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 21:45:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RL621p029716
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 21:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pPBKVO+2HKSAMc7Se1bC13bCptlwACdJvuRTzPMifj8=; b=byUc7cDFabjRDYma
 2ED9iqovTOEpSD2UVewCDm+HOWFJnTYLUgnX2puyPhPfHY3pXrB/nyl2fz3kz8Jk
 oGkDDrB0O80taq43Raf6XsMdF1ySqJthhAaHgWi0n6PchthQ/wPg+JFCvpO3aJ5+
 bhmdr2uX/lIzzgN8W4R68H10xaGt0JglEaTZm0ABT5f7AjOpLSlVY0oTHy2pCgXR
 Zbq+A4O/gcV2ha22CYHxZJkKCifo5gxez6cot/GNaavDw8gdnrakGn3o5eZyk1vS
 DWKcKpvNZbVhDL80H/XhhUDl4PjsKuXmcRNE1SU2TP8CGdqxkpkURIW7LiXjjaAe
 WpV01A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452ynwr34d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 21:45:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e88eea1af5so2404606d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 13:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740692710; x=1741297510;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pPBKVO+2HKSAMc7Se1bC13bCptlwACdJvuRTzPMifj8=;
 b=EeYiMxdxG1zVTVWIr+hph9AISqS1XGck0YxMUKRWthrhHq2LT6h7LRyYEjMlTpKhH7
 uT1h8r4hOo/wXe73yDLGC5Cy5FVFdqBaiHx/Wxg14cUR5BCByvj8k3fykRKpfp8rPYAa
 pqd+8sTgjds/Zqxg/qkmVoUI/e+M22nRHSoyf9/Yj1h5NNGpirhkf31WRnm6BklYxiky
 YJHkasy58HgvFoG6YNR9Vya92lZtBWkQztuf+aNst2DrJ49g6KUMADY/q0FaYgO/64zz
 Bklq00DVt1rWjMh48LzL6p0bSN+1pZmZiOZclLdnHxEnJw99kYk7piEGcLnJu43w3eim
 BChg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/ST71jaK0mWRA4YqTFx4NeBmrbjm/8ee31AXrBhIKSlgWbPCWpgXDjCqwoQK1nRwhoj+9ihWyg2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoesJn5Cj5fUuis36m7rD4cQFbRKr2Bggi9rAnQIfTCweelf8B
 HNc3ycMxo7mUZgjJMy2qW63E86Bpmwvwun2IpQocH10ozazfdCHTwIvYO8yGIQ+ikm/ZWO1JCrj
 7EaMHiKhQcObIJZpOIM36nrP2oydN1WPQWXPcE+1m6OEJ1QPlbGqY/kfiXNMWZSALwuI=
X-Gm-Gg: ASbGncvxdYUvfIT61+iTiKASjNkPgmQUNKuenSmTLGq8wq61nO4EYhxlfOP80orExx5
 rFimAiTBj+o9zK3gLZT00cWB6YNEfmO0GWVnWHXs6/gc+PA6mITewq+7PK9sKxaqHvAQKNKxyTp
 GhO15bB587VzHveC7z7hUznUFU46CnaqnZ98/Tpi5WiiKyBcDdONDFd0PGwAvLcw2xESjl34lKK
 IfFSOeaukhoEA0IXE7/v3Vf3GGYepfVwyIXbkMm0GAm5WNmMRwlfFY5xQshOuFknL+J9TCsd1sp
 ef9f8h+j+CHpESYLNMfjcqaWwywmez5HVW2wcdsTToY5Wa8YC4Vd3MNvHSV4t2UkzLTkSQ==
X-Received: by 2002:a05:6214:2aad:b0:6e4:2e03:c54c with SMTP id
 6a1803df08f44-6e8a0d9dac7mr6021136d6.10.1740692710396; 
 Thu, 27 Feb 2025 13:45:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHL2H3h1fXY/M+zGEyzBHinGXz7e+qU8JKuFYeji+RiUMLgw7RNmuLoI3TzZXEd8LNSaq4xjg==
X-Received: by 2002:a05:6214:2aad:b0:6e4:2e03:c54c with SMTP id
 6a1803df08f44-6e8a0d9dac7mr6020696d6.10.1740692709869; 
 Thu, 27 Feb 2025 13:45:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0dcb07sm182253466b.47.2025.02.27.13.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 13:45:09 -0800 (PST)
Message-ID: <234cfd96-04f9-416a-84ee-fe127f81f49d@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 22:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/msm/a6xx: Add support for Adreno 623
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
 <7ffcc2fc-c783-49de-b01f-9ffb442d2a72@oss.qualcomm.com>
 <70c7f4fc-137c-442a-b65e-3743d7b1b736@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <70c7f4fc-137c-442a-b65e-3743d7b1b736@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bjnd9mdVDL_6Uh69-WoEVNLM2NHRaIBG
X-Proofpoint-GUID: bjnd9mdVDL_6Uh69-WoEVNLM2NHRaIBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270160
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

On 27.02.2025 10:06 PM, Akhil P Oommen wrote:
> On 2/28/2025 1:59 AM, Konrad Dybcio wrote:
>> On 27.02.2025 9:07 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add support for Adreno 623 GPU found in QCS8300 chipsets.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>>>  4 files changed, 43 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index edffb7737a97b268bb2986d557969e651988a344..53e2ff4406d8f0afe474aaafbf0e459ef8f4577d 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -879,6 +879,35 @@ static const struct adreno_info a6xx_gpus[] = {
>>>  			{ 0, 0 },
>>>  			{ 137, 1 },
>>>  		),
>>> +	}, {
>>> +		.chip_ids = ADRENO_CHIP_IDS(0x06020300),
>>> +		.family = ADRENO_6XX_GEN3,
>>> +		.fw = {
>>> +			[ADRENO_FW_SQE] = "a650_sqe.fw",
>>> +			[ADRENO_FW_GMU] = "a623_gmu.bin",
>>> +		},
>>> +		.gmem = SZ_512K,
>>> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>> +			ADRENO_QUIRK_HAS_HW_APRIV,
>>> +		.init = a6xx_gpu_init,
>>> +		.a6xx = &(const struct a6xx_info) {
>>> +			.hwcg = a690_hwcg,
>>
>> You used the a620 table before, I'm assuming a690 is correct after all?
> 
> Correct. a690_hwcg array has the recommended values for a623.

Thanks for double checking

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
