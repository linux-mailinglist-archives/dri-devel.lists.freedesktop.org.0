Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7425FA0770D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5A910EDD1;
	Thu,  9 Jan 2025 13:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BcWLRure";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D5F10EDD1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:18:38 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D8ERM010437
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Jan 2025 13:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pAinXbrU54YDWSX+TXddpuW5K6ve1Twi3iiA/2chiCM=; b=BcWLRurexoqUrzil
 CGrFm5ROVN8ieMEH5KtvzD14VWbPC9F/MFgpZA3SFpXoyEQjsa5DOK8dLHFXfZFH
 ESpck5PSTXWnCKGtcgbNRfmqYsYugqscLL9ZH58LZPJMMPU88MQsIMWjNmSTyQdA
 9+xAbz1fASA71qbd46FSVUQYPFgcYO0yztOUj/8O8aUVFL1rJYuc4uqgIcLRF1a4
 BDXTQbcDOi347zK6J5gVivAjkHRfQe2Dd6MUZgesPBFgTh9avZtmCdH/HC+RfuH7
 xzkJBOFWRVLyZDBMzji5CqyQx9PcfgN32LFVhxn09r3MaIVU1IzgqHMDVRCJjECx
 mXGClg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2kr0ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 13:18:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4679d6f9587so764381cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428716; x=1737033516;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pAinXbrU54YDWSX+TXddpuW5K6ve1Twi3iiA/2chiCM=;
 b=iLUMaajd28Cu0wswYA+BruJzakCYNOFrlDzxIas8C2gotFOrmBmnPwh/n6LEy7ZZA8
 c+gjtLjE1SvGeChAnzx4HML2MJy3SpZRFPlQuqjVoiGL8QYR/gjGXvsx1fuM2zlHZqOq
 SZaJcPpTeFul8ekjhIEnZQtkBz7gj/oKaDT4zYV5aN7R3EkmQ8WlvL6PTgvu0KhSApdx
 nZsZSu3VQ63S6faRuT50VBqBN1eY7GtPKE7lgnhbZELTTbIBkysYsRyfHiMbhAtN4mr9
 HeqjVrN+yBf1emN4MoY32WkZzU3WCAwid3JKjXqZ/g2jnKCCX9JbGmb7IxPInC9gEjn6
 eKFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWexbX7up8PMddojrEXsS8LRwgKn1RnGtXQXgSIV8TwUblM4NVNn4oQvK8H4vtrN5sakFdqAhjF+SQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwefG+1eLOPNhciBJ7MkQsLHOV+nh1hVsLUdnrSY+vkpZB7GNQD
 g5k8z27RFAgdnP3XlJsaSawC3pcLQXuvsOlNI7ECYP2TLnehf//SbGS2MDOyZRZEwvWULhPqlTi
 sUF4Z1Okfp9X4P3c5ZfplmXURt2wOphqLsZoNzXMqlazBlADrnSwQ2NH3h/lwxGxXgtw=
X-Gm-Gg: ASbGnctA3uKqs3ZcefZGRu4XPanCCyN3bS0m+YqXL33pBjYo6Q+VPiXye8csrlbs9AP
 sKjm4pMavL43Xqw/DSNOSKVdDOLAxozVLqWGXSGrSR0jvRx6IOJcWhmNmStt2qlyE/8gVhKzrRF
 cWc724Le/bj7Yr9lq1MQQLWKVYmaz8gIvSUYwrtRZvpRndcEgHcmL6ErL6BXsmYe2K8r5r6ww+M
 zlcEtSmILkgpiHcn75if/ajzS3CocTombwmbMUop5meX+b7W8bsdU1rmmh1RqTFp9709i3+ZeNn
 7pzOkzF4d+dHXWQAw4Z3K/p6ewpuSFN+Ipo=
X-Received: by 2002:a05:622a:1210:b0:467:5eaf:7d22 with SMTP id
 d75a77b69052e-46c7107d773mr39278001cf.10.1736428716449; 
 Thu, 09 Jan 2025 05:18:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6kvir4x6bXBZGJQpNMnh+xnivzaxOEAhM6X+eUDPYvw1UTSVFnpcbtAmlt9R06v1GvxWRsQ==
X-Received: by 2002:a05:622a:1210:b0:467:5eaf:7d22 with SMTP id
 d75a77b69052e-46c7107d773mr39277661cf.10.1736428716024; 
 Thu, 09 Jan 2025 05:18:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046ddabsm573823a12.68.2025.01.09.05.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 05:18:35 -0800 (PST)
Message-ID: <e934d116-f8ab-4efd-947c-e5c34b102409@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 14:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/msm/adreno: Add module param to disable ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <20250109-gpu-acd-v4-4-08a5efaf4a23@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250109-gpu-acd-v4-4-08a5efaf4a23@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qmW7HiistRzFASnrarm3C3iWoVidMvQJ
X-Proofpoint-ORIG-GUID: qmW7HiistRzFASnrarm3C3iWoVidMvQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090106
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

On 8.01.2025 9:40 PM, Akhil P Oommen wrote:
> Add a module param to disable ACD which will help to quickly rule it
> out for any GPU issues.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 7 +++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 1f213a0fc61b..ce08eed572c8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1475,6 +1475,13 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	int ret, i, cmd_idx = 0;
> +	extern bool disable_acd;
> +
> +	/* Skip ACD probe if requested via module param */
> +	if (disable_acd) {
> +		DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD probe\n");
> +		return 0;
> +	}
>  
>  	cmd->version = 1;
>  	cmd->stride = 1;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 236b25c094cd..f4552b8c6767 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -24,6 +24,10 @@ int enable_preemption = -1;
>  MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
>  module_param(enable_preemption, int, 0600);
>  
> +bool disable_acd;
> +MODULE_PARM_DESC(disable_acd, "Forcefully disable GPU ACD");
> +module_param_unsafe(disable_acd, bool, 0600);

IIUC 0600 makes it sysfs-writeable, which we don't want, as it takes
effect during probe (meaning booting with =0 and writing 1 later on
has no effect)

Konrad
