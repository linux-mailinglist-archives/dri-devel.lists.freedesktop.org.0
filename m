Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A5FC54A05
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 22:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FAD10E7A8;
	Wed, 12 Nov 2025 21:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqcUSt9o";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IHoWwcxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E53F10E051
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 21:34:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ACIPWAO2087334
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 21:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 akUL7PFUD7ZtgXkGMHVEnif1hzpe+FepoSGWQH2GuzU=; b=fqcUSt9okdwq+O/A
 nofu1KSHZH1rUmDP8mvBPhnE2B/5LEJnP2vLLPI9vEF/iNvu0DyLGh50G+KEI+WM
 LRHkj9REyt/WxYPE3lDn3Gcg3uNjO3bXMOB/nc16urhbV5yAEMZ4PYdGSioWaVpn
 RKSBZosefZPp8G9k91rMLS/e9/liDN5xCLcAL/fL/ZO2TvjCCZBgtjG6wCi7Jw8k
 mH4dBfMQlPOG4+0g+SISllVJzHNXK45YBd+Tdo6YrRwfmQZhK5DJCjkN4WtZpi1F
 c4S6aYUEWrMmN/sG5crNNt1IZj94DAJcmmXVmfMTyIL7ygrj+IlEi9zKe8wbWieJ
 ANYvcg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acygm8g37-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 21:34:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b9d73d57328so103662a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 13:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762983290; x=1763588090;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=akUL7PFUD7ZtgXkGMHVEnif1hzpe+FepoSGWQH2GuzU=;
 b=IHoWwcxfIaIOarWVXf1KCsi2PR3ftNnsDmOJumHT76TW+eqYr0HgmyvHNrkeSHJHsO
 RWxDf2TpUUKyts0nc7miGDCcAujU4OEHi1M968eFk44rgSd4K8VM+ANQ2YvNnTK0z3XI
 76el71R+/zjZ0Wi6ECbsQJ+pGrvMTfauoFOg/GMEhOJEsiMvoMW48kYMiZeCkLMBD/yi
 zbonKZtbjY5N1/w0gMzNQzW2WkUenhRbhIDxFBBzPm253f3nSVnob17oXiWyVFEdjjXp
 s1poPUHoW+gi5oaaQwt/4pBr/uHvb2OsX9Cq04EYKeLY1sB6Xhf3Id6zsPqfM+czyaig
 j4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762983290; x=1763588090;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=akUL7PFUD7ZtgXkGMHVEnif1hzpe+FepoSGWQH2GuzU=;
 b=RxTFpniDGtk9zEcaTHQabpRjL1bxu7l6UsTIL61b9BpDxMv8aaQzwBYMmHKD5qfpBn
 GRgFJBDyqMEllwT8hcm8KOk3XWh34m7HEUznY+09iToGOJUN1qmjZpPyEE4nT/cwOcqn
 tFoxgGgMOuWhcnIVKPanI6fkgsAQY+zBma9bXkDlnhZIXikuGe9v29Dd+J9IrWToeBEw
 B7IY6nYnqdVjQ6wPpQ3WL5A8JjOswTgVlfVb2lsBuOtz3wVmrYRai42N1+gs29Y33bhL
 mcH9PbctxwCd+W2vMItO33Jp/SBr8XL9/6CJ+QVoWkane2kYNnQlhVfxGqgDSyHHSpDU
 w//g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX22X2oHD2n9BQ27Ei+BaIfR9h60a1NOk2ZWakMm8eOnRnZaMQcs9pk6vc1dXLtItEM08qZu8pTqeg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0v4fMWjxUlYNoki8OQSFd1sGAZzap7LOOHwVLijV1iEN9zLNq
 uOO2n36mW4lvHyblh0/n3B1j7YwiwpyMe1byyuVFs3S8N+FLuk/c3+kpb3vuLRf9MegFYa7HGCK
 WY/cZqag/1BUZcg5Zr9eVpQNXSeNxcuwvXvzWAAAnXHH4t8X6VpIf6jG4+0so6N/zcTWizapGWx
 3W+Uo=
X-Gm-Gg: ASbGncsgLEpT2XEZk6GUDU485hH/oHKR0ekeVW46SAe34FLhGxcGetx31OJ8X129S0L
 MeO/y/qvG4j5lgbfGdMGWMww2aaMUh38SRxao5ZlCkTiKXyWZi/FXfqwchNOE3todxi+a2Je/4E
 3th6zC/Ogq7GFbfryFVXL2Rywjt2/0Wdp73ZU60+RgKhee32QilGSFKCpl+5EfRRTOryD/2yntb
 J1PXu8+O/M6lWnXOC4XgXLYzZztcGoA4GCo26VKYZCV2aCohSIBiZG+Cmi1UZL8IHUSQBuIyLsb
 j1omddCky6jjmiA68LSQ0G+2y4BGYGryZfHBzBCqQANm5Kr1KB6bIzHJjjlDzXFOTvitUY2kH/6
 hY9f1KENPgj4jbTrLx13/Kg==
X-Received: by 2002:a05:6a20:7f8a:b0:340:db9b:cff7 with SMTP id
 adf61e73a8af0-359090967d7mr5549501637.5.1762983290327; 
 Wed, 12 Nov 2025 13:34:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGex9yMVhli943u5iSx/utgvoPxPJzj5p0bexquPM0bky2PiZDhb0Iyz19ikO+MPy/f/zNHCw==
X-Received: by 2002:a05:6a20:7f8a:b0:340:db9b:cff7 with SMTP id
 adf61e73a8af0-359090967d7mr5549466637.5.1762983289783; 
 Wed, 12 Nov 2025 13:34:49 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc37818885fsm46671a12.38.2025.11.12.13.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 13:34:49 -0800 (PST)
Message-ID: <13c39ab6-f054-4552-a033-819906af29d5@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 03:04:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] drm/msm/adreno: Do CX GBIF config before GMU
 start
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-16-bef18acd5e94@oss.qualcomm.com>
 <ae21a963-696a-48f3-af91-ee72aef4b60d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <ae21a963-696a-48f3-af91-ee72aef4b60d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AHQvHUfGz3njCuGhHQNcMNjXsF9idyyY
X-Authority-Analysis: v=2.4 cv=E/fAZKdl c=1 sm=1 tr=0 ts=6914fd7b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9a4g6yj39E2whjoMmyEA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: AHQvHUfGz3njCuGhHQNcMNjXsF9idyyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3MyBTYWx0ZWRfX90CG0cFpBJ1W
 lMuE3yUmS6rj3qJlLZxop/xGM+WleqQQ/5c5ABEevA2fHk20n/9tczWhNXrm3XZY8t5K4lg8Vrv
 4OtZ4tEwpij2xHdplqIcL9zxQZDFb/2le1irVbT6u7yqfBvmDZ2N0A/Pg0zSYZ3etGPJNqAtl19
 vgPhblfomRN/mK3ilQOOethicteeJwGaSm2NDJHlI12lHJNRsh09FMIu//SEExjVhf1WiXUONR4
 RKAWItirjkVkUHhwgo6AiL/wkK/kCKHf0XGI/uijh69uFAFJ23HA2fPTtScQtM4YDVVYjXSZ+aG
 pFQIvHaPRbnwtME5j5J0vMBKdUv0msrpdiPDr8uBbuJmKAGnGVv/HD5qa0URg7Vi8E6+z4humea
 kreGZpn4B1WFPxVJWhQt2H4dU1rcPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120173
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

On 11/12/2025 4:07 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
>> configurations before GMU wakes up. This was not a problem so far, but
>> A840 GPU is very sensitive to this requirement. Also, move these
>> registers to the catalog.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
>> +	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
>> +		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
> 
> We haven't been doing this a lot in the GPU driver, but adding a
> .num_entries-like field is both more memory efficient and less error-prone

Gbif config array is reused a lot. So this is more memory efficient in
this particular case. But generally I agree, we should stick to one
scheme. We can revisit this later.

> 
>> +
>> +	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
> 
> duplicate comment
> 
>> +	if (adreno_is_a8xx(adreno_gpu)) {
>> +		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
>> +		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
> 
> Either set this prio value here, or in a8xx_gpu.c

We should remove the other one.

> 
>> +	}
>> +
>>  	/* Set up the lowest idle level on the GMU */
>>  	a6xx_gmu_power_config(gmu);
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 029f7bd25baf..66771958edb2 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1265,17 +1265,20 @@ static int hw_init(struct msm_gpu *gpu)
>>  	/* enable hardware clockgating */
>>  	a6xx_set_hwcg(gpu, true);
>>  
>> -	/* VBIF/GBIF start*/
>> -	if (adreno_is_a610_family(adreno_gpu) ||
>> -	    adreno_is_a640_family(adreno_gpu) ||
>> -	    adreno_is_a650_family(adreno_gpu) ||
>> -	    adreno_is_a7xx(adreno_gpu)) {
>> +	/* For gmuwrapper implementations, do the VBIF/GBIF CX configuration here */
>> +	if (adreno_is_a610_family(adreno_gpu)) {
>>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
> 
> a640/650 family GPUs didn't receive a .gbif_cx addition in the catalog to match>

Oops, I missed that. Will fix this. Thanks.

>>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
>>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
>>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
>> -		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
>> -			  adreno_is_a7xx(adreno_gpu) ? 0x2120212 : 0x3);
>> +	}
>> +
>> +	if (adreno_is_a610_family(adreno_gpu) ||
>> +	    adreno_is_a640_family(adreno_gpu) ||
>> +	    adreno_is_a650_family(adreno_gpu)) {
>> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
>> +	} else if (adreno_is_a7xx(adreno_gpu)) {
>> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x2120212);
>>  	} else {
>>  		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
> 
> Downstream seems to set QOS_CNTL at the same time as QSB_SIDEn for
> these targets

This register is under GX power domain, so we can't configure this
early. This should be okay.

> 
> 
>>  	}
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 031ca0e4b689..cf700f7de09b 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -46,6 +46,7 @@ struct a6xx_info {
>>  	const struct adreno_protect *protect;
>>  	const struct adreno_reglist_list *pwrup_reglist;
>>  	const struct adreno_reglist_list *ifpc_reglist;
>> +	const struct adreno_reglist *gbif_cx;
>>  	const struct adreno_reglist_pipe *nonctxt_reglist;
>>  	u32 gmu_chipid;
>>  	u32 gmu_cgc_mode;
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index 2ef69161f1d0..ad140b0d641d 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -500,6 +500,9 @@ static int hw_init(struct msm_gpu *gpu)
>>  
>>  	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
>>  
>> +	/* Increase priority of GMU traffic over GPU traffic */
>> +	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
> 
> Kgsl (later) added this for A740 too - would it be beneficial to enable
> unconditionally on gen7+?
These are actually recommendations coming from HW designers for each
chipset. So we should just stick to that. I will check separately about
a740.

-Akhil.
> 
> Konrad


