Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB67C9DE985
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 16:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5565D10E27B;
	Fri, 29 Nov 2024 15:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhPNY0Xq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE26810E4F1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 15:33:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATCbroo025069
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 15:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 shaW82SALXb2Kh8WEaB1wWyqmB0pJy4OE+cwXVqtroA=; b=mhPNY0XqQfzyWk6j
 Z71lpa2MSZLp6PGgBCT0RqH+AXWVpCpM+mbFK39YjEXA8P385s2HNEySkMkHfgjU
 eBmYQdaECTUiTjoFxAgtXPz0GjHpPNfxyzCb/69s2XvzLOGFJlwaofXG/NCRkYVO
 7YOhpb5pIPoq6NXTugLpsTY+yKJNk0c+z/ZLbhdDV2lxKo0qqr8sx88zLsyhxNPp
 TWmd0vxxG0DkCeR4pgjk5KUGlVaaozAHPE4RH9hdx6E61lUyS2GN7ZQwKMIgtGdf
 rR7JEj1p1Sts8MAQUB5hcuGNE/UwsxUNytQVbbaaH8J7J3l08gN7X0ZEtrcScaWD
 6Gupzg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437dsqgd8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 15:33:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6d880eea0a1so3475756d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 07:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732894420; x=1733499220;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=shaW82SALXb2Kh8WEaB1wWyqmB0pJy4OE+cwXVqtroA=;
 b=N+9KKPO02MIhabnMyzhD2QkujHXEN4UFsPzS/nUm6r6jUy8y00yOoD4Zifv3HKHRqA
 nD1UQc6VkCV14AKIquA3xAhf7m+Kb1NxjWICguRbuEqhTJECvxh6eJGNkxgd62/Hb7Oi
 Y3IL67TyP+hAOVEukmtnOP67/5vONOgvuVFWJUWko7U2lMskdHBzNfgaQrJgY/3ARC+k
 Py4mMFglyKyv4vnmhD/qIrBHQeezRomHt+SlXhw6ilQCO2LpfPJnfiiA7Q7FyQ70CvlT
 1OiUW1a4H8JxkM4aDAngW7MilGxOhJNorVsDVEZHDImd4r3xIYyCgJN5xTLA8HKgdH6/
 8/5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXax9INgEcdLIgz75imMMu34ZSlB67zQqv2ZcFqPBuS0mgeMICPd0hf4zDCnkSPjuDiLFJmTnzL0zA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI3QZv1ApO2FbtQAnqfII4n6iDdpuXNk2/8+BhGPmoxGcUpgMZ
 Nm7BH8SASkJiwZ+pcK3ioUbOkhn9rwp/jpv2F0omRu4vTQn8rGfq0ux7sFUcFxpex/9rV4NHXEU
 x1WUVbIzY5qJCZBLysVkaqIWA5IGuAUxj1rpQ8fjqJFT8xz9vekHGm2D/v69LomaEq8g=
X-Gm-Gg: ASbGncuRMQ3jCQBnMSfMv92Xqp+dyFFiZ82IwDSKE0/8Q68NwpINo0mlpMu3UjwJk47
 7cY1T12TbodlhvCVGd6rVIuLINlDSHsFcqMkP/FOeXLFT+PNIYb75IJ9GYupEm/0sO7oDbS20HE
 YypIfVeOLtpISDXvHQju2mXvrTn+Nn5b3+CmlAw+1UfE3yD04+EPyFAvdx9+8b0hHdRPxCRQZjt
 lHSs2TmdRkUz9vcHUwhCxxdl0pCwQxSegmoWJtdL2bCR0Z5x+HCU2neDzN1pkS+5NSKFO+MjDl6
 eDG/C24Jj5DnRhakGDXXLpHFre6E6Vk=
X-Received: by 2002:a05:620a:2447:b0:7b3:2107:2eef with SMTP id
 af79cd13be357-7b67c50621dmr664299885a.16.1732894419886; 
 Fri, 29 Nov 2024 07:33:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjvimuE9VJMKaI6/pwzXY6EhhoZkPvjvninXPgPQEWRNX1VJCXzVg7RD/kix02hgfkfKIAyg==
X-Received: by 2002:a05:620a:2447:b0:7b3:2107:2eef with SMTP id
 af79cd13be357-7b67c50621dmr664298385a.16.1732894419463; 
 Fri, 29 Nov 2024 07:33:39 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097e8dcefsm1995978a12.55.2024.11.29.07.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 07:33:38 -0800 (PST)
Message-ID: <e3bb3f66-9cad-40a4-ab55-f1d5a8e34d4d@oss.qualcomm.com>
Date: Fri, 29 Nov 2024 16:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-4-81d60c10fb73@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-4-81d60c10fb73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q6mozvo8bE5QKW-tM7JeKXgBYQbl8Q4Q
X-Proofpoint-GUID: q6mozvo8bE5QKW-tM7JeKXgBYQbl8Q4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290127
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

On 28.11.2024 11:25 AM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
> along the Frequency and Power Domain level, until now we left the OPP
> core scale the OPP bandwidth via the interconnect path.
> 
> In order to enable bandwidth voting via the GPU Management
> Unit (GMU), when an opp is set by devfreq we also look for
> the corresponding bandwidth index in the previously generated
> bw_table and pass this value along the frequency index to the GMU.
> 
> The AB pre-calculated vote is appended to the bandwidth index
> to inform the GMU firmware the quantity of bandwidth we need.
> 
> Since we now vote for all resources via the GMU, setting the OPP
> is no more needed, so we can completely skip calling
> dev_pm_opp_set_opp() in this situation.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 23 +++++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>  3 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index ee2010a01186721dd377f1655fcf05ddaff77131..c09442ecc861c4e56c81e7e775b9e57baf7d2e51 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		       bool suspended)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	u32 perf_index;
> +	u32 bw_index = 0;
>  	unsigned long gpu_freq;
>  	int ret = 0;
>  
> @@ -125,6 +127,21 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		if (gpu_freq == gmu->gpu_freqs[perf_index])
>  			break;
>  
> +	/* If enabled, find the corresponding DDR bandwidth index */
> +	if (info->bcms && gmu->nr_gpu_bws > 1) {
> +		unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
> +
> +		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
> +			if (bw == gmu->gpu_bw_table[bw_index])
> +				break;
> +		}
> +
> +		if (bw_index) {
> +			bw_index |= AB_VOTE(gmu->gpu_ab_votes[bw_index]);
> +			bw_index |= AB_VOTE_ENABLE;
> +		}
> +	}

If we couple frequency levels with bw levels (i.e. duplicate the highest
bandwidth a couple times), we can drop all this search logic..

> +
>  	gmu->current_perf_index = perf_index;
>  	gmu->freq = gmu->gpu_freqs[perf_index];
>  
> @@ -140,8 +157,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		return;
>  
>  	if (!gmu->legacy) {
> -		a6xx_hfi_set_freq(gmu, perf_index);
> -		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> +		a6xx_hfi_set_freq(gmu, perf_index, bw_index);
> +		/* With Bandwidth voting, we now vote for all resources, so skip OPP set */
> +		if (!bw_index)
> +			dev_pm_opp_set_opp(&gpu->pdev->dev, opp);

..and then it would come down to..

if (!info->bcms)

Konrad
