Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B8AB75DB
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D6710E6F2;
	Wed, 14 May 2025 19:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCUubKSw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FDB10E700
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:25:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJAC11003112
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=guHnDjTo7eaE/yughOao688D
 Svp7ZoZj4rGyk6Vz4vg=; b=BCUubKSwIOu6HQnrADk5Mgq6zf5I997Ecg93/dmd
 xd1QBGAMiLWOXQ1bqg/HCb24sbvcH+e9XL7EU38I7WpU4Nir5OBKVfE4pOi3fY6d
 du7y5imUF/1Q/Q25GZt3Qr4hWnb9idQAu+vUT51+yoryQ8QAPxd8p4qX6iLnLNnI
 BbVc9HIiTqReQ/R0PfLN+0D8f8VSdfG579608VqC9EWvsUMFfQ2Qp/muTlahieWg
 nAoIbPnEGB5puSTqSF9xeiVrBQbuPUGVNUJ+nvyNBvhkpgKAlAfRtYub1ZS2T5Bi
 dGlKA20ShaX/St5TEZyci0yr4FyBD5YWDGITJdQA44ACdQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrbt9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:25:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so14238385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250722; x=1747855522;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=guHnDjTo7eaE/yughOao688DSvp7ZoZj4rGyk6Vz4vg=;
 b=f0um/7Y9mkS3nmqrc+VvvcLp/1V5BG8QoHfqbRyEgEtTP7T4kMQ5Q/uCZe+APujpXy
 /1hq+vfbnL1KLhj9QcGGGnSNV/BKicpwtlmRZlNsuEMHgsf4ejEz7UcKOgMg80pqr5rP
 ATGZQpuOjQEgQU9/Bn14G7vX3x+iEsWASCJQL76j+yNPUZu0Mw2tAqVBVABWIxkH+C7z
 EDKeq9+x4pp2/yaxewtyWhwt6nlKHf6tXOm9I+PVxJkX5zWZu8a7jx+SqgLsbmAMPn+r
 CNeC4wzep/V4k8pFRVsPVlcVflAHELXbkD1ROGffoqRFNdFN82zVBlhvAZ+6pGzDHOR5
 wXtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFtidKsCZ0W1b2CexLLEWrARXt55zKdZ8i04RSKgZMjc8CGED0yFX3foXRwQLzqqpMRHKroczi5X4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIn3kaxcDKMr2tX/dR9aktkKKKEb1cLlvF8DUvSCnMQbd4++kX
 nTg6MEap7LMCirQnXVKIwKta6yIA2/8xPlPwrEP85yamOOhc5lipBXpnmnlZFcxSsQdPy4bKlqw
 E4Chrz4Y4czpSc/2GQB6OKJdkicPabR/TjL4RswqmDYD2ViPBRi4M35dNxG/m06AKeIE=
X-Gm-Gg: ASbGncumPrNLfDv3zC/dscqRS3kPzawkN0wVS7RrJ1JbHJ/ja+9kXm6TTT9aQIkaWIZ
 WQWSjIsM2VI8hexXDXFJ6u/ANIxjT1FYipnJ6c+Guonk6oRhB35Txm8EAIj2P0OZjH2+rya5AbP
 ifU5Ha4h7g5stvIBeIP6iR2LSP1naE+7SpN76qUuO+ioOZoI14WP0ownX4LbZgoWQi5m4StJEXC
 akUtvCVZ6GeIvHbTtaVNU4R9XcABzcApBDYRCeaH5eM9Yjnkw5k4vix8VY+cVpIpAjf1ANeuAWN
 9/65mkXqG9YQ2izODij4u2FJJHutkTcbsdunCCRAyj6QAG2xWMAX6dvDLZyDU+wtMTlh23y4V9w
 =
X-Received: by 2002:a05:620a:1a8f:b0:7c5:a25a:f0f3 with SMTP id
 af79cd13be357-7cd287defa6mr638172085a.8.1747250722296; 
 Wed, 14 May 2025 12:25:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqYspBX7D3lylLVnQVlBe+b6tLYtEGKb07awj3O663BvMry8yeZxkF53c9zpzvl/w4Clu/Ag==
X-Received: by 2002:a05:620a:1a8f:b0:7c5:a25a:f0f3 with SMTP id
 af79cd13be357-7cd287defa6mr638167385a.8.1747250721720; 
 Wed, 14 May 2025 12:25:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64cbf3fsm2333073e87.211.2025.05.14.12.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:25:19 -0700 (PDT)
Date: Wed, 14 May 2025 22:25:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC RFT v2 15/15] drm/msm/a6xx: Warn if the
 highest_bank_bit value is overwritten
Message-ID: <wb46vfuegw2d4mj6pqx6o5my7ii4fhkrzrgte4hvey5ywiszpt@oe3qsptmanuu>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-15-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-15-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vKdmrMp5zqllGd7_Rx72-Ft-M-oFknnS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfXxOOcQecz4a9n
 /wMslY9BGUKTIwegBxKGAGgR9bg89yrqsl91GgpxsI2aNKI3xAVKPcVVai3YZkRcZ7x7H8M2Ojh
 A7MqegLKE4pyJIS0KGI9yB9a1ssSTQBkPqUeE/4zXAST4O304EylX79NwxmNkvE5gIJYwrxFLlW
 a28sAzlKIr3Vc1SB8asi8QalXQKSLw3hATalCAXHUM/uk1Y4LJAngOHDajHljUNVmA96piNOFGV
 8ubDUSRGmlsw0lsV3TSTS5k7kbPqWMds4E2vRBJPcjKQHbxNDfp6rjCw2jctkL/4CMbmPGkDFf2
 AS8R53zr4mkiDLzvRkuuKUxJNB3pvshSpUjOqgBV02nJ/O16W2LGPDmr6blTzR1nyjZlKipe0Aa
 Y7mNZ29oA9Q2uIQOLpMczrzFOBVd5ETPNQyR0s7Ac3iMR1o+AqJLe5AICvNyA+ZyWNdfUpzw
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6824ee23 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hUL5GJU7K_37AAI6negA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vKdmrMp5zqllGd7_Rx72-Ft-M-oFknnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140177
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

On Wed, May 14, 2025 at 05:10:35PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In preparation to resolve the issue of hardcoding HBB, throw a warning
> if the value is being overwritten in the GPU driver.
> 
> The HBB value is directly correlated with the memory configuration.
> On platforms where more than one is supported, the value must differ
> for proper functioning of the hardware, but it also must be consistent
> across all UBWC producers/consumers.
> 
> On platforms supporting only a single DRAM setup, the value may still
> be wrong, or at least inconsistent.
> 
> Print a warning to help catch such cases, until we declare full trust
> to the central database.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index eaf468b67f97ff153e92a73a45581228fcf75e46..ab812338739568d5908ca439e5c53e230a02de5d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -637,6 +637,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  	if (adreno_is_a702(gpu))
>  		cfg->highest_bank_bit = 14;
>  
> +	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
> +		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
> +			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
> +

This really should come in an earlier patch...

>  	gpu->ubwc_config = &gpu->_ubwc_config;
>  
>  	return 0;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
