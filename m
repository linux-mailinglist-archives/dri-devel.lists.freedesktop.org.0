Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63AA34BAC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DED410EB52;
	Thu, 13 Feb 2025 17:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCfTb9B8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A30310EB56
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:21:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DA2835001831
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FbuXiVVzDaeS+xX9GP61rxfDPpXPI4a6eC/HT3/7Z38=; b=HCfTb9B8m92OhwOh
 Ei0ZTfJLaAOyjhyN6pPVNira3u0j926HVdpNTjKhl/yAD1kcwiWzoXjhLgTim1NT
 4AI095az/Iv+rYBN+ZReunWCBCdp0qau/cNWeh+NM41OmuiROarHp+dEhX5Lw2pp
 2iid9candxGUYXg+9Ylfv/8QgCqcRhaR8z8F88UBq8KNsy6Nh7z3YgX8KsbPEMUx
 KkIHx5AjbYHjT8zNJCxAQb3Y/xjcwJa/5Xb+avxKdfcM+/EVB4irAnH1lTtyTwQs
 N27ECfOaMW8JzprSX1+wCUzGdYwKimnbLbzbxqk3iI+4CzMXmAYu/MjMHGFwFEfG
 Fo5uZA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44semp94ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:21:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e19bfc2025so3110576d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739467309; x=1740072109;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FbuXiVVzDaeS+xX9GP61rxfDPpXPI4a6eC/HT3/7Z38=;
 b=EV2g9AzBg1xRamxfwq9FK8ONKGys0v2sb5cZN3hoftdabjxS8jwRT13dPeCM6K5OZO
 68cIMy9S6K72S+oQ4aHrRTE26v20cjAF2uo6hf/pNDkiqW74LJz0F6fPtULkQYeE8xRT
 wMBXB4UGhKs/Ax1Vf3BYbgsdOXhsIm8fVnd9CXHhrAxMk6iTb1183IEdliIovNDlYvG8
 aVyRK/FaNNlZIgAM/6nL32LPJ/zrzbynISlikr7P3BrZTdEB259VxC0Kls8US900Weru
 0iSJNFKDpGO+0jwbi1iSW52TNSmc4wFZ7mr3lkQ069L3AYm2xI8XODwth2nzxxdgefL1
 TfCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQYT9z6gve652QmiqMXUMVKTuSdM1aiPGu42FBVr8A9r1gD/6CbCNmWRKGdn89MajioQM0XDWiwu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPeZtYfpCafIhPP8+o+5Hdor8wgydiqafGH/jvY47K244kM094
 sEwVwUi//6ZMGGwTS0NwdBIw7ig5pvr4tvlXq48IZg87sTBEkmhfeDkaEUm56GRxWB/JEOp+ZDp
 VbpqeeW+6fZmo9yo2UXpVnXEMY+6Ef5yw2RPISGTN5VXBWViT4wNdLLW8NT6T7Xu2QZU=
X-Gm-Gg: ASbGncslN4mIKS1uCuHn9we4JIzuQ3Y/Ymums4A/5iyW9I6eYuoTqQEBXfsRF0o3YGs
 uAWqiSrrt8LOBpnHpszN/XkpV01AijXamrUxQZvKfqiPsbyXlK4RA0AS2UHYffhiqxBZUShlYZy
 vabgQRJrN1SmjLlHNms5UKcmszbPvCfuphXDWZU+Hwr8OgBs3E+ej+yEL5TMzSUie88qhH8yeAl
 qIuO3NMJM9q+LUgBVe6otNyFrIV1lpjRS98SwjLGWbb8KWmMgDeRfnl1hRLkabMhi9foJtLqVZu
 SDYMnAo/rO2W//8OIEfUs/QGh8End2FB2gK2laA3/LeXUYhvI05vYB8gfhY=
X-Received: by 2002:a05:6214:48c:b0:6da:dbf0:9645 with SMTP id
 6a1803df08f44-6e46f886c88mr43339076d6.3.1739467308698; 
 Thu, 13 Feb 2025 09:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFY/XCimTxvjm84xoncA2p+VwjKdnzksODuhc+qDaYGL+fpJgnRW7IaJN9QBFnX0LV+tfedg==
X-Received: by 2002:a05:6214:48c:b0:6da:dbf0:9645 with SMTP id
 6a1803df08f44-6e46f886c88mr43338756d6.3.1739467308127; 
 Thu, 13 Feb 2025 09:21:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c4687sm1498611a12.22.2025.02.13.09.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 09:21:46 -0800 (PST)
Message-ID: <4a3eec8a-4f71-4ac7-a6e6-0e8490c020bc@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 18:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/a6xx: Add support for Adreno 623
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Hcy9CGAhDFkBe1sibCGdKPnU5ZjgP3Dy
X-Proofpoint-GUID: Hcy9CGAhDFkBe1sibCGdKPnU5ZjgP3Dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130124
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

On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 623 GPU found in QCS8300 chipsets.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>  4 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index edffb7737a97..ac156c8b5af9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -879,6 +879,35 @@ static const struct adreno_info a6xx_gpus[] = {
>  			{ 0, 0 },
>  			{ 137, 1 },
>  		),
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x06020300),
> +		.family = ADRENO_6XX_GEN3,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a650_sqe.fw",
> +			[ADRENO_FW_GMU] = "a623_gmu.bin",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
> +		.init = a6xx_gpu_init,
> +		.a6xx = &(const struct a6xx_info) {
> +			.hwcg = a620_hwcg,

On downstream a663 hwcg table is used, with the following differences:

< A620
> A663

< {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
> {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},

< {REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000777},
> {REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000}

Konrad
