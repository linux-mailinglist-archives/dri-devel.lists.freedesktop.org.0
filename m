Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A93BFCDEB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 17:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8ED10E7EC;
	Wed, 22 Oct 2025 15:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkEZnLBu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD5710E7EC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:27:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MBamDP027488
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8k/FmEKkL858bw0NvFllXkz9skuIxCCBY/vWAZsgTMY=; b=bkEZnLBucAJH7pXS
 V2M0/a2S9dpvkoIdlZ/FDdD7fjQzTwoGURX1SaU9aggJIieHyBgV9+dZeeMsbxd2
 PTTlxlkAKVkyRlb0uP9czwXuhBqDdwK8gEs/5OCNtKGrMIakilydsLHxHGNaH20Z
 mCQcqAa7QgkEk5ydwnyLrYz93Hnd56JXjCUh8WMrHWtqmqk5TwESltvcUafv1vhp
 AK9X3pnGwNksDAbLQ8AtOEYrqbhgULbB+kmtSxUmLykYaEYE1NzID3E4ee/MleFF
 2lxZwWPqBxWRGDEall2/N2agY4Eti/189H5rifc9C39DU88mQ5cX1XermOgq5nUT
 7zOo8Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j534s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 15:27:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-87bd2dececeso23992106d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761146844; x=1761751644;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8k/FmEKkL858bw0NvFllXkz9skuIxCCBY/vWAZsgTMY=;
 b=VYvJJ6wbd2cuUZguFxDIPr1P+Tknt9X9pCgeruu8Q1bUzcmB+DsEux6cg6NXqNPEPx
 a5HQqxnrLqtXxV1RpMHi3jQNTROoTAADtwKIuK/QIQViQquiV5GggR17OTmbgeFkjUST
 Sw58MrrG15lGsyb3BygCleN6o7bp71/QlSekQlWPPKxTnTGBzKLpz9HOYd1Af97/BmPB
 /+7xnKbl/i9zAW7jBicigHG7jUyEdxenBJrzLiC1QiANNvFxBWG76QUOt2sVNWQYln79
 /lTqaE7t9Y1Jn6d/7k5A13Aa9LfJjgEgNwpxw9YuHtkp/Ag25T31DOxkHQd4dP8AfTNy
 AYMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXBrReiUuPCFCg8RldSlsfYW+AQXpBAOeIYVZaUf/EjbPCAeZ99q09m9ophtrk+NHgCvWYODKKw0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbIQP1g4k/otybAiY4i+cGgIxq0r2+AdlZc/XBZ2wFbkm1HiJA
 0fSt6wjMfEYjc/aIEHOYmZChRM5AWVLHHy7DJnGAn3gheiaBwGK/N0z4KaFHUu9Dzr9bfaoWg3O
 WflPPmPLWfzWxKYnF9jm/RlTjmfFVrX4OyNSP3kzs/0fYrM2xTyR/ktKo7y2A1kP8dMx0svE=
X-Gm-Gg: ASbGncuQrtfR4b5UyDqeh/iq8cQMfzmPWChhSJOKVttX6+ZVVpZmMTi19MRPoLgTbBF
 vQZ1npHXlsgY0s9swwDf4Jtu/SnyYagPxxCMem/qxswnV6Yrnw/6gPTv92DE1AdNfcRmQ3LP/UU
 twPVEop2DI6HJT5TWdaBR99BSW1WabJlILPR383WrPdTIOjURR+k48m2Z+W5xD5CmhEdtHf14Ep
 hhh5GKsF6v3JHu14Xxw5XgBv07lGk3sD2z6iQ7wP44V6ID5e0tAY/AdWycHPR9PTZFlC4JFXtDx
 0tuOAUa/X4uZ1zTC5dTn2Ljjvml5WK/haraMPAR9+sb6MZfhy5vNx4iB1zgcfpK7szo5Yf5PL75
 rNBke4j/XljAPxpsHUl2O1Ole8+gH0qYFC8aDjiyrue7i1KY8x4Z4AxK1
X-Received: by 2002:a05:6214:248d:b0:70d:e7e1:840f with SMTP id
 6a1803df08f44-87de714c1c7mr65707166d6.3.1761146844569; 
 Wed, 22 Oct 2025 08:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8/xeYz1XYBcdg4T4l6woigaSUVTSHt5t3v8BurU4yppUfVX2LR3sMLl0zpGaHU1+8ugjz3g==
X-Received: by 2002:a05:6214:248d:b0:70d:e7e1:840f with SMTP id
 6a1803df08f44-87de714c1c7mr65706846d6.3.1761146843645; 
 Wed, 22 Oct 2025 08:27:23 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4949beedsm11980254a12.40.2025.10.22.08.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 08:27:23 -0700 (PDT)
Message-ID: <fdec4bf0-6d88-4a9b-a81a-061476dd9e1b@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfXx552+EbOmvlT
 WQXI1TsFfjglc9PrwwfGJfCjdApNVsJOjFbIvWmdSX5UZRSKphmnUcetog0TqbwJWdLcxfBvaOp
 5cIjaa7HTquKZhEiPmC2MUxiSoEDwt1Ti1ep6ia2lVzvYadzICltcBBWrvWUHQ+E+vvMwH2TZj5
 q8YB4Xc+kDGZY3ruKdeNgsBm1Rnkc2/XKCtmmY5ltPZbgRI96j8+q15zFiguk68oQER0wFD+0Wx
 1phUxvxkWdSOVRnx8tQT2s59yg/bbEiJLfSd06c3AMmW96+HZsiqepD+26GuIoydJhy1Z6LJ1RP
 0kCObWcYAfnz0HxLmGb0K3FGn8exBnU+hdB/S4vTY8s5gXWXy9E84CbSdvYF75q3MwC5GQyFi/d
 NIaTgVGSS5T3UsXJJoPU71g0PwZU6g==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f8f7dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=e4uKRaRUJts94r9YfvAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mtt5mvOg-yO1SCXhLJYgbjAuxtDjcqvS
X-Proofpoint-ORIG-GUID: mtt5mvOg-yO1SCXhLJYgbjAuxtDjcqvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&pil_gpu_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-845000000 {
> +					opp-hz = /bits/ 64 <845000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +					opp-peak-kBps = <7050000>;

Are there speed bins?

[...]

> +		rgmu: rgmu@506a000 {
> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
> +			reg = <0x0 0x0506a000 0x0 0x34000>;
> +			reg-names = "gmu";
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> +			clock-names = "gmu",
> +				      "cxo",
> +				      "axi",
> +				      "memnoc",
> +				      "smmu_vote";
> +
> +			power-domains = <&gpucc CX_GDSC>,
> +					<&gpucc GX_GDSC>,
> +					<&rpmhpd RPMHPD_CX>;
> +			power-domain-names = "cx", "gx", "vdd_cx";

I think the gpucc node should reference _CX directly instead,
then genpd/opp should trickle the requirements up the chain

> +
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "oob", "gmu";

1 a line, please

lgtm otherwise

Konrad
