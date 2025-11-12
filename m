Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF1C51D5D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379DE10E6EF;
	Wed, 12 Nov 2025 11:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbFmXmBT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYFqgrFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307DE10E6F1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:07:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9CZw0510056
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=; b=AbFmXmBTta7gKjns
 M54/EkecUo+B6cPlccmI4n5Aj9/wqRd2an+bzFJ+ms700a4OajXZeUEs0gXWQRLc
 etsB8+PdB0dKId8+lOeFMHY7TYoDx1ABopbYg7tBtpG6H6xL3S35HNvLdVM/zgAq
 yfYjYPBDelBKRb0j2yq5sVRydVg/9Wase8IyulhN4dEeUlmoH2zYiu39rd5AJymA
 5IfH9hlH087LSQuSPibn+jT/AI985QAaVn+au/GJ6aMhUMY+rDwa++KEfRyjYwxK
 dXGbWqcERW93lnoYSWvH1QxycRclRX0ECjE89dnAtVJyZcIgPp1aXQ1KNS+XJChv
 rcbN5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqdggecx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:07:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed83a05863so2097161cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 03:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762945666; x=1763550466;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=;
 b=hYFqgrFULH4NfU0TcVpWP0dTH29AglFGEDWOUl2SCDARA7lLQMpVaE8znFL6GFqEXm
 w/4IrD/es68KF8MThA9/TMPSqoRuYBHUMIgJuEnxiRugfYKyUcIlWBKBAuWkh3mfbCXM
 E1WrdgY+39S9GZB2hvPwjRgJwZQgZXta1uYQqLTlXrJPkOgCfiw0aRLp8kdD3aHThWyG
 x/heSpbFAsk9y28Dq6SXUBxb/OKTBY6I/dYvvxzNjmS/hHPEsyoRRiU5J3yRaA2+IBMB
 Na4sl3arBEMOwC6Z8TYkEEsksVB/GftHYH8Y40YVGFyNyiEr/VxjAMADiYm+IspNpn7U
 kE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762945666; x=1763550466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fhpeU9U5S/hGeJg9f9bTT5WPcsYN6w1Wj4PWqyqzdyc=;
 b=EFumLSSPcB2kleRVtpJPFa8Z4RIbmStp3GdWyJp/kpsu1kesqrcpzv+HGfKIXWzcAM
 jMLYhUQwxTHt0s+0e+BXK0s4XkcqKp43DLuJKt9CKJPg/W9dpmX8WdiHp9fw1h9L8xr7
 WX2GRdfu2iICC76R6opsHK8OeLH6ZI0EA/sG3KkcRFnPg9qq147m4wXpqUzT5HF97t6V
 7GYvEm4e/rOphH5kB8jtPKrde/g+TEMzvZJ1/Jx4AHfpJFP8rlgvekVazcDKf9Mu0dUA
 vhgWCOFo7PPf5F8T71BHLOROi/yuUrLN3nx9M/t/RZDOdG2NHYdn9nMijkR/s32snD+8
 JrfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYKBtcFPdV+WCDD903m2m/8ddPZAla24TN78OhElQ+IxUsZsDGlZH7ruH/5QubnTwj/2j4u4hhxl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8OpKriq5f7mzeyYgWEYOrjDREQTek9tAUgFqk/LAb5veeoOof
 W86GHuGiRaquuE+RyDuzneaEOAHrPv99pXyw1c0VsvTTZPIyrKRfu1wzmfBVcHp/4JRQU+q8VD6
 0qf0JzLojUHgLPxnaIKLFtLFrmRdduoYhny6LNNGoXIXSlQMjCDBshUkK50GP3/D9eseiAFQ=
X-Gm-Gg: ASbGncuI1uN4YZ18msXzV9D/bmDXcGiKAEkE6CA9qT9Y3IVveyeUJ10qlvSmHs02kF1
 2rC5u5Z4KthQ+xPWcBrwzuFo7q5+RDL01vIOYA27JAD3opyt9vTZ4B3iLGwV/Xtr5cxLoeQpTiR
 hsK2wXHAm5B4F2hWOCDkGm97HOeqeRlmhum7RyBDZJn1mMCOxd0MErkONKbV5Hh/y7Lqkz/f7Y2
 HELGl9ORGfz09oilB/u16Z3Ft/+9olQgXe+YzmZretGuwlvoVor1TSQFG6P3LqzanWV/lDltcR9
 AvOWv6Q6T8UViwrG9BEzcUgEO5TxSDznO/UG0sIrPpfXuLTfLd24lHdoA08UL8T9Kjz4gYX5MLP
 UH3I7aA+rU5Hp5MvQeRZ+P4g3gHgEnoSsOf6aCcVnSG3fs1Ymemf36CA+
X-Received: by 2002:a05:622a:1a9a:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4eddbcc8ccbmr21834631cf.7.1762945666354; 
 Wed, 12 Nov 2025 03:07:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsThee/kJ9PQlX1eMjNVcf3pwMggayYjNqOtdauF4RKz6aTdQHNiSCZ2A6kK70/XwvxAErjQ==
X-Received: by 2002:a05:622a:1a9a:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4eddbcc8ccbmr21834301cf.7.1762945665887; 
 Wed, 12 Nov 2025 03:07:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64165b2aa03sm10031978a12.6.2025.11.12.03.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 03:07:45 -0800 (PST)
Message-ID: <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 12:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
 <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtrWylg4 c=1 sm=1 tr=0 ts=69146a83 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XSWwlsXGtsdNaMXbhvkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: lGMbZSRv0HbEwXn0htTq1Ge72mRtrI1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4OSBTYWx0ZWRfX41sn2hXQZ7Hh
 8IJi+MHbvNcceQ17iFv1kLsAarNFlCcrPVNaC+UF+LluhKbrs2YIaJODGVetLwEH7fE1iG0mvlv
 NvWZylmgfZ8RWqGJl1utv+OfEjX9k8P4ty7+p9O7rqDYLsiWAI0kXUti6/gek1aiU1cn0Ca55l9
 +ytLkFWifKXbADMCQ9wV+U9eyr9mrhaBsnzo3DQWrFloA9ewp0GIOr+RW3wNTDca31Y3e51tqQR
 uXFXjbS4g02fybsqkGhEQG5PTL8glniKwCV8a/3lB9saoQqyZDi6DfF/0CpsEvIeVgHWU54EG2n
 6TU9l6RMBvH1F3/Ti2zHvn2vTDCMEafGgIPnOCisdFqZhqs+flDHryLst4l9eAh15397qhU7YZg
 zQ1koIbnDrVg2lUSmoLzdHNjp5e9Mg==
X-Proofpoint-ORIG-GUID: lGMbZSRv0HbEwXn0htTq1Ge72mRtrI1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120089
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Side question: is the AQE fully functional on any gen7 targets?
A750?

[...]

> -		adreno_gpu->has_ray_tracing =
> -			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> +		/*
> +		 * AQE requires preemption records, so disable raytracing
> +		 * if preemption is not supported
> +		 */
> +		if (gpu->nr_rings == 1)

"nr_rings > 1"?

> +			adreno_gpu->has_ray_tracing =
> +				!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>  	} else if (adreno_is_a740(adreno_gpu)) {
>  		/* Raytracing is always enabled on a740 */
>  		adreno_gpu->has_ray_tracing = true;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index b507ff4e1756..7921b4a68937 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>  
>  	struct drm_gem_object *sqe_bo;
>  	uint64_t sqe_iova;
> +	struct drm_gem_object *aqe_bo;
> +	uint64_t aqe_iova;
>  
>  	struct msm_ringbuffer *cur_ring;
>  	struct msm_ringbuffer *next_ring;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 78dcb9bc3377..2ef69161f1d0 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
>  		goto out;
>  
>  	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
> +	if (a6xx_gpu->aqe_iova)
> +		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);

I believe you should also set CP_AQE_APRIV_CNTL per-pipe

Should we also enable AQE1 while at it, to reduce potential backwards
compatibility issues? Would that require solving the iommu woes?

Konrad
