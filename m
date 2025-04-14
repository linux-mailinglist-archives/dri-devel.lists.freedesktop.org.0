Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BB6A87E50
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 13:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F6910E56D;
	Mon, 14 Apr 2025 11:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRH4OrXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE3510E56D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:01:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qGu016325
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AwhFYLcRsvN/5O2x/zPOJHH24568TbvM4q5YBcWwvdQ=; b=IRH4OrXjrF8UutOY
 GBf1PKgjFlk10wkDRsCWGHf9o6AaEXZhofCdVkovBaFdkTkf7yV8zu+ogEquGVb6
 ST7VZXRKJ/IA4eES2q73rqAq3+i2gHGM4HpPNpSr2wwOgPUFgZFlTR8/AL9UqiR0
 zsCWllHJyNULVJ5/Zby3sTqU1jvSX/r1Dgj16HI+b3iUr9zU48rZUitl2vWDJxOH
 aEKoQisubDdRmMvlmN/Yz9ijgsHUG+hN/qg4g4imu4XQB2VXYFCFF3zDV+/xpaCz
 3DpnO0zoJsnjLltC+ttKUCEd9BgAr1FoAluRpCJM++nTHGyE2RjGmjivlcW3RHtv
 lv2txg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjc9pk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 11:01:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c54734292aso122066685a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 04:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744628503; x=1745233303;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwhFYLcRsvN/5O2x/zPOJHH24568TbvM4q5YBcWwvdQ=;
 b=hanmsKUIwpeu7FF6T5O28JyQTGMNtZzr1wzCMYaxJJzayiBPosbeXD91ml7J+WiGZZ
 sPTEVbQCGChri3e7hDzifZu7FLfyqqbb0+ZWfgef/XwLs8YuZa6eKPSbg2kt4426sEnL
 phUrn87/dzudAFUDLr9xuvdnsre+fY2HVN4SXuSB1JuGRMWiE2kBDsqcu1PSvSNIl2+e
 2iDQndi8ZmTg9hKnUtXjzBy2jC27A1qcZDjHmHfLt+cpmY6SXPa+wQ3IRou2tyYdfdSN
 3qzT5acfJT5WCg8ylt7i0btlVTVpJwdilVDwClTtD8ZSvG/8Iabr87WJw+ZNvKSWP/Kj
 eCpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFmakfFzTv2RFl7QmvgiEv33OdRP1kGeByklnhRMv8QPKiKsYyMnbqpmBa7WSjGG15NnpVdASk1nY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN+uSGffU+tGGbD8ywKcRiAtuDMcTQR7oho2TT7RLy8Na0EgCi
 0aPI+16GidiwaeNQ+BSLIM77t1i+nmojryPNhtmuwPuyiureBaCW56VyhejaqMJOn9bIs9ME2Hw
 Dd1tFtpezS/0YbZDeNDvwai5uh47gBNFBL9DKvcwoOi7fOd267JzlBkbCia8ZvOIVAvA=
X-Gm-Gg: ASbGnctHKr67lFobc1xrSO82i51+wiZXeJN113i10aTQ1Op3OLUlW6F9FwN8X99OyYp
 XdYFoZGkPaBsfr25h+CGfQMCjj4Qqwc6QMONb7H+LBYnu7RwQRnpsiqiTbO/9xtAeKEylbi4qKs
 tnh5RL6yuZLmSbDqoNjk4zIn5c55WZo79tTIi3KOTPYUQ8GEtk6a1B3IwzOaVamkXYWW/dCAJJm
 ejSPYoVxfv9atZpR+kUv6Xdutx4QQ5HXUwQ4ALffyHYMYurPeNajOOn7ZDGa6nNboP00b2g64s3
 9OKSn5BIo987VCjytBCSGgyVzMHk7asvgXDouLsrH8w7n1sU7KLVnFIQ44BnfCJlDQ==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id
 af79cd13be357-7c7af04c112mr642841285a.0.1744628502713; 
 Mon, 14 Apr 2025 04:01:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK97vOdYIq2mdoALIGz5F0Dh2fRVfBH0Km89YvV3CijLmngOzHMeK37HY+4moc2F10MzIcDw==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id
 af79cd13be357-7c7af04c112mr642838785a.0.1744628501979; 
 Mon, 14 Apr 2025 04:01:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb42casm874884866b.88.2025.04.14.04.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 04:01:41 -0700 (PDT)
Message-ID: <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
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
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PKODk-GtnW_pNNFBmKL6gWlXzwW71mAY
X-Proofpoint-ORIG-GUID: PKODk-GtnW_pNNFBmKL6gWlXzwW71mAY
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fceb18 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=515PL6qApFHJgk_UoXMA:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=701 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140080
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

On 2/27/25 9:07 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs8300 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

[...]

> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d6a000 0x0 0x34000>,

size = 0x26000 so that it doesn't leak into GPU_CC

> +			      <0x0 0x03de0000 0x0 0x10000>,
> +			      <0x0 0x0b290000 0x0 0x10000>;
> +			reg-names = "gmu", "rscc", "gmu_pdc";
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;

This should only be bound to the SMMU

> +			clock-names = "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc",
> +				      "ahb",
> +				      "hub",
> +				      "smmu_vote";
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
> +					<&gpucc GPU_CC_GX_GDSC>;
> +			power-domain-names = "cx",
> +					     "gx";
> +			iommus = <&adreno_smmu 5 0xc00>;
> +			operating-points-v2 = <&gmu_opp_table>;
> +
> +			gmu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;

It looks like this clock only has a 500 Mhz rate 

Konrad
