Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A31B492DA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 17:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C912810E54F;
	Mon,  8 Sep 2025 15:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0WGRrFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED6B10E54D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 15:18:17 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889a9tT012487
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 15:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /9G8YIX33m2SGtXUdjDCf/RB5vwDmC7O7BN/b342XFs=; b=O0WGRrFxyvZuZZ2T
 RfklNROy07xaXL3a+3GKtYslpD6widCTQ/LzeF4k4bsWd3umfIBWcIqPFKgSJgKE
 ZEIPm67WccjAAaK56vDSiNn2EIQ6XtMeZgpKM0pqTPhNFo3QT38B2LwU28kMNhJ+
 AZSpCkqDoCPmJsbjYX+wvIkltw8hkUJEDBbw4udQo7iFrH5UIoEkyQPuFAvfg6qc
 FOfcLIN7uOS9DvG+ChT4Azfo9ugB0PJqMmlnD2qlhwrUjWtigV+8zzkVnKdj/9iX
 4NA0IZHycYnFvPbgmMtyHD8AAnXZiYhEjW1ZKQZrE0EaR4cJ9MUs/OXYFWZ3+BV1
 fs+OYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8w2vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 15:18:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b613a54072so1740791cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 08:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757344696; x=1757949496;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/9G8YIX33m2SGtXUdjDCf/RB5vwDmC7O7BN/b342XFs=;
 b=Ix3goME1ipt8Xl01FhmooLgQ9r0sdDP7aEwXVpJ4lml6xJVwHdwjyviceOAcdfXE27
 j9NrMeAySugSb3at4Gv06QUEAWhu8jOr+XNXRhniRBC48UM2jh9fTlOt9TSWZ9a8w2R/
 Of/5iCOIbGuVXjhh50tHNJS7d6i0/2Jky9b48/6L+r49OiI/BvWy35nyOroPMN1mWn9J
 AoNo6SNqy9ThQz51A5kjuqZ4jmPywraXzWbKu8wXlcBKf4kGh3ZOK7r+pB+3lJO3IpSB
 6DkmTrjMhd7/A3iNHw2V8LSLgkx1mEtxWRGKhpVNLwHYHnzCh2dBpsPsNxMF/grIvX0+
 eE5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLCiQZzk64PcSKIBpttcarM7O8zvjSiPRKnUeWHgWRGqvHXqfFYLbONtEANC3CN4yHj2SlDV3NBXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYCKtDdd5M6e/D5hpNXuLpQBgaebynFxF/FVyIXXnrI/a+5/F+
 yz6aI5KbrFcA8USxaUehqN53kV6oLRMZCeLa+lTPZILOHug0fde/M/TNXVxM91n+ho7vo7kTqN8
 3BB9gQoyfOBF0FTLinZ7G3XyrhdhjFpCbrtTKb/YBF3xeBOF2d4AI5v2buw/38ouCbuu54JI=
X-Gm-Gg: ASbGncvhTaZ2mp/vUcl89e4Za205sKBCv9KRnTVrUGtq7GCi2A5dw83g1J7SAfcmPOd
 4Dh2I8dsUEzdOoMosUiktOKSgIxVYSeV6ho5dbaI85L+9aWtxBTgi03e3YD0har0SSON7LVFWP/
 rVUTWmkIMnhPAxgMbkHp4YhzYZmrY4Y79OaWPODJrFUnX1br9LVHunpr6HLtSp1tEWnjN8gbs7/
 8uRh6ChcGaL8nz6djYfzC0Op2jidxQwgYln5xXTCe8La7PoBU3NZLOB48PkYbqh1oC9mCF3bJXA
 m5Jib5tiibyVhy3pEaoXcpZGhdec8f0J/u5zbBEjI+VktDbhroPQTLgcWFZiWf22100WZzxcMBs
 /4kue3ayfwOMCwEIBIHrung==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id
 d75a77b69052e-4b5f84608a1mr53837941cf.11.1757344695741; 
 Mon, 08 Sep 2025 08:18:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv3mcsIkkBXMP29rwffS5CTfl5UUIWU9i9fBerRPfpgMIylwxkbElL5PVh9knG1HqQmUlAXg==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id
 d75a77b69052e-4b5f84608a1mr53837521cf.11.1757344695047; 
 Mon, 08 Sep 2025 08:18:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b043fd772bcsm1761417666b.14.2025.09.08.08.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:18:14 -0700 (PDT)
Message-ID: <77cfd9d7-c3f1-4e0b-8cf4-8567611c3a9d@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] drm/msm/a6xx: Poll additional DRV status
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bef3b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DmgBUSfskXSfToJwqCEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: o4wPN72sZdUKXcHw1zEHXCGEeYKMU64I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXx1Edhv+MQOEh
 x+PFmw0aREebO5V7ItCGCDX2UlT0SPHZNjxqUA0nvFtLdQZnOEDjgtSVzmX9k6jq/Y7xEiCCX0A
 aTUz5YE4n7MK6IiMe3Rj6CcYiL1ak8BqRn/dyWGkL0P2RXPb+LUwZVHOL/KH5WUuOcRtxuVE3FF
 xRk9GxEcwbBpdwu0YgkhMDGkDPmGqqHhyEvwdiEcLWqqAvJFOXk5oKATf3yHGNztpIExREt1wtE
 WN8h8XnfeVT7DDkpWW+z9GxHth2MPJUeCz+sUOQ2fzbmX7dFYKr2x95F91govvYnsmQqWgnAzl4
 JSTwY+do1g/Tl1EwBl3ag1Rkhrui4/H2VBbeM52ZfdSV1Ck287AI5QmW7SjSiWWrBhAdJR0lnPa
 pHf6AOY0
X-Proofpoint-ORIG-GUID: o4wPN72sZdUKXcHw1zEHXCGEeYKMU64I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On 9/8/25 10:26 AM, Akhil P Oommen wrote:
> A7XX_GEN2 generation has additional TCS slots. Poll the respective
> DRV status registers before pm suspend.
> 
> Fixes: 1f8c29e80066 ("drm/msm/a6xx: Add A740 support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index bb30b11175737e04d4bfd6bfa5470d6365c520fa..06870f6596a7cb045deecaff3c95fba32ee84d52 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  		val, (val & 1), 100, 10000);
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
> +
> +	if (!adreno_is_a740_family(adreno_gpu))
> +		return;
> +
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);

https://lore.kernel.org/linux-arm-msm/002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com/

Konrad
