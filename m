Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41804A489DE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 21:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A832C10EB84;
	Thu, 27 Feb 2025 20:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrECWy27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352C210EB84
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:29:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RJi2UG017273
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rdz3BwWFGxS8sRJ2eAc3H5jI9A0FhVUYuzt3xIUmMfE=; b=DrECWy27O4CoUQ6B
 8yywe+p6u1m2G7Ee3kmUUCSZCqZ2Iw/rxM8Y0/M3zLlbv9Ifdc3QDvSEv8DxJzSe
 vuJ9A0SlzgpfUDrQ1Jt8lldC4QT2lQVeNEGET5d91FJrtAvvdXomkMPSe2/RA1bi
 zXOu1T+r2WabLv8uLZMjsFAPZE+PAj5U2pa8L1d4sLKNSVDfKDYrHpcMA9+goivA
 VGcQheO511LEgT8l7NgJr0Y8DkSnhy2MfSsyZwJIJ62fNzku1jefr9+hVxiC9eBf
 x8T5geQgLuTTtHJuZY5XYg6ckeiMpXWvJv0MpdpKjFqi5Ns8s/tNJ84o4sv4cjtj
 6ZojJw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452nqkhukv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:29:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e422f1ceadso2723946d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740688172; x=1741292972;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rdz3BwWFGxS8sRJ2eAc3H5jI9A0FhVUYuzt3xIUmMfE=;
 b=fHO0IKGw9RGCZqurrSSFPS9JwzkqpIeRR6+MCR43PQ2QptcHYu+vH/dY2d5ByEIQ6p
 nH5ta+x6mQEns1+FmpKt5QiGJTpSgzsvpWtKToEhQTk5//1PRw1MeqBHkmrXaBQzI7Tk
 HU/hdJjPMuunzqyIdEm5EmeunZts+n2H3ARrWT6qaZfx0FGE/bVdGOYURbTs7ziZWpzA
 w4cBHbudRS6PFf7Ww5+bZ9THNMgiJvxqg/EEavfRd7TB1FlO9MQ/CP6W+gbNS51hQbsE
 y9uuIHYwdhvxfySMYHULSiZeaG5vSdx3/3Ac/+1fX1NPXZEE/Xu8G2cWv0mBB+hk1iIW
 MyIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1QO19avt/Z19gexTLj4pUGQPLJGIqGksVlz9Q+K8V6Xx72RVFKp13O7dzXe18ETR9li29ZIVxWHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe0/sD+JiJSsxm30X6EUPi3g/KRDiHBJJd2DNIHafJG6HS6Nju
 dxsPFMfDiFna26fvETINCABQBIR/JmFhHWD6g6N3uCao4NP/7m92ZLr5p+Z71Gwpcrd6E5Zv3z2
 7NWS3fehS8UMR/Zpl3RYpGZ1MHg0Gyx9ttE+oY4f01u7gDAfJjSk1vACYqG6J/VRkmAM=
X-Gm-Gg: ASbGncvHg04jNE06Ge7Tj7pIKC4Mqbx/N5iwOBYz2j2rSl2o/pqnqpzhQW1lxq9bz2R
 FiaWIBH6VpEFJLHgWFokvdsah5eZ5wndRZvZhB8mNyultbdXvmnWMgOTKN2wpYNc6dt9FFfJrUB
 XVZwQBjhOoqIrvNyvrsChULqGBu+PQAA9xeSIQXcTXwn7EgjLg+NQqrb1wS12EaR3Csue9y/kF+
 ObP9+ItV39rhZDosMC1iFFuvkS6/wfiKndBEhCUHr6M/Kl2DS9MqVhuLylIvoupsmu3+h/4T8DW
 l2MGiGj4p+cjOLWFjbYAqpfNYZwQBQqPsl+Ss3bJsq+ItxAgukfwyaA+HsNPSrTJKMoKSQ==
X-Received: by 2002:a05:6214:5006:b0:6e8:9ac9:55b8 with SMTP id
 6a1803df08f44-6e8a0c7d646mr4995886d6.2.1740688172105; 
 Thu, 27 Feb 2025 12:29:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFp08iDf7beYh6+dvjAc+g6WR7kEIPaDwueuBvEdPQwdhLWHvqK0vAhDkPw7V5LNXpNIx57xQ==
X-Received: by 2002:a05:6214:5006:b0:6e8:9ac9:55b8 with SMTP id
 6a1803df08f44-6e8a0c7d646mr4995516d6.2.1740688171740; 
 Thu, 27 Feb 2025 12:29:31 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c7bc015sm173071666b.164.2025.02.27.12.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 12:29:30 -0800 (PST)
Message-ID: <7ffcc2fc-c783-49de-b01f-9ffb442d2a72@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 21:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/msm/a6xx: Add support for Adreno 623
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
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y90dV4p-Y_9RxHjxN8i_ktYVZ_16npJl
X-Proofpoint-GUID: y90dV4p-Y_9RxHjxN8i_ktYVZ_16npJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270152
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

On 27.02.2025 9:07 PM, Akhil P Oommen wrote:
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
> index edffb7737a97b268bb2986d557969e651988a344..53e2ff4406d8f0afe474aaafbf0e459ef8f4577d 100644
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
> +			.hwcg = a690_hwcg,

You used the a620 table before, I'm assuming a690 is correct after all?

Konrad
