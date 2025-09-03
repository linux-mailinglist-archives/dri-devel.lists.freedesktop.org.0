Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468AAB41EE3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6468B10E7E7;
	Wed,  3 Sep 2025 12:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OET5gcK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3910E7D2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 12:26:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BFIXo023837
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 12:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OZ5GA5CDWjuk3FRi9xYTdj/A11GKAj2IoG13+xINrgA=; b=OET5gcK9yQVtfbjC
 9ljJgz5MHFvR8cDDUKF4gKMQjo/87UjlkPo4MzrVYQBaCpXIOlnzzwrBOMM/qprw
 r0jq66Rb1hI1GDKe282LJq6b0eXL4RvhxQlud9P94peY7coqbctEHF/WVByOjkb6
 Cfyzk6f/0mM7JGfbEceUa4YqYhcMXq/KUHJBTMWaJSkmvzHUlRMBy+AAfFoQwtmk
 CRj0cyYfM2NgF8iWcrIYdDtzcx83dkf9IicWVpUeio+ac/nJPVvCsCBTxbScn7kM
 vkJ5vgKDqqfOR/57NddXAKpZtCJk4UlBDoRpdSrCPgZ2p08cljodg2jeyt0Yed0d
 NV2wmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fkgj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 12:26:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b331150323so9929111cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 05:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756902395; x=1757507195;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OZ5GA5CDWjuk3FRi9xYTdj/A11GKAj2IoG13+xINrgA=;
 b=Uu9ZdYXT7NNy7awexXQGg/sEby6csTBG3Hr7yqGxMFsDGs4nb8rEdtPJCB50SdXXA4
 DY5LECJGW259rddN0XocDjexYMWeJMzUYbV0qovZpya5ZKHmffFBs34DYSzofq3hbXK+
 Bf4m2PmojsU+IxrxhTXDuQDR8NAl5iBjDA+9nUYCDLPyAm1HxDdZDdouVFOr7LZ3w2rO
 vhF77vEdzIYsN002Ie4OjAKyn8vFBGQtJB2xc59Q8AYwZAYW5lStisACQIvat87xTKwK
 xrUuILSJby6pTGT/aAQcpoLtkkZQ+ZhZlE/NyLOH6dBERGUhXRI9lhByQdZtnn1XWXXT
 jZNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHWewlV/P/uAtI0u0CmuZEFD7ngQkZOJGcrKuvBpWM6OUtxWpEFPH7opomhPrCWpKSsUm4Yo28xns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4cZ7k3NUIfB8MfC9AF5wEZDIr5/AhS0J5j2uF+UD7nQr++9a/
 Jh8CP6kKBmNcBkw7DZbkQFRsVzFbAwtpdeEoKfJz4zEgE0MbrY7rrrvIPFHIKolT43Ixg0S3HUr
 cMxjkUHnbEZgnLqPOTho34GePTnevB2oJ9MFum8sGzajGZ/zilj2ETODK6vRDb5gIaRgvMtg=
X-Gm-Gg: ASbGncsOIzovgcrBJEVwasjOtbds1lOGb1AyKFVl5UCTvXatFI14ncErtFjUg9iIAP+
 lxQkDYHV+fluDDxC4sxObyVHnRpHo509HMuKMlcwYtn7aNSt5P9HBWX0Pu2AlZ4CFPgD1pZKEqX
 S4bJ2ah1A+FOUIXZ3ozv4jnCuuxZJkyhrciIs77ZBG6+9XKlQRd2Uv2BSoBYhEF3vMqtCdTmvCi
 P+QUsGU55YZ8xB2YAbhxEjGwYnorpPiDe0Vc77/wRw1ygBKr8KdoGS009R49ccaegVoKBJLTzhx
 y+g2Gh1Wifl0jWxMBxqyBzAwnGHK1wUkmI+fQJ75M8t1b3hylCbaK7IyG0L8lKPBuih9b9ODQ7a
 PktiPfyMwvYcdk1PKX1yPFg==
X-Received: by 2002:a05:622a:3c8:b0:4ab:6e68:1186 with SMTP id
 d75a77b69052e-4b30e906341mr139109691cf.2.1756902395434; 
 Wed, 03 Sep 2025 05:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFEC6NgbGYXkQKGTNQ8MIs7PdgRHgCWkfSpaRZJd1PT0vRXtJCGBVR5vOdjk5gYSmc6YfsbA==
X-Received: by 2002:a05:622a:3c8:b0:4ab:6e68:1186 with SMTP id
 d75a77b69052e-4b30e906341mr139109331cf.2.1756902394836; 
 Wed, 03 Sep 2025 05:26:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046f888b95sm82236666b.34.2025.09.03.05.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:26:34 -0700 (PDT)
Message-ID: <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 14:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX3YybLsaB2jj3
 H0Xg+3yR5lfeJmuEYCL6pFty9lSGXmr33FniI+G2ixU+00jnhvYEBAequZZThFcecrrHxABxVlC
 lkLKuZL6nnrvv72qNEyhZhXN6NGkrN7pg5Nc4YPcH0g9Awf74H0lRfIavPH/DluWFerkNuKrZ6W
 2ocyUTH1aaODKkQ/Ix4sM4VSBgCfWijsLTDvd4e2DyhWzAh/C09aGjCcnJlvNAA0bJYBLfqnLDd
 fXsIhwvLU/pbe0cUZCuUeLqU+rvVD4HAxjOsGYHzwr+6cTo6VKx/C4NX2TuCI2O3xwtwD/iW03b
 TBsBbDB6jqLvUVRmcXQMsvYs5Ia1A18pgeAiE5oOBQWLfuaol04ZgP/m5rsOY4N0KghqOYfkGJS
 es8cFhyc
X-Proofpoint-ORIG-GUID: wsdChpmvXgWZe6h1zswcPfNanu1CWvgK
X-Proofpoint-GUID: wsdChpmvXgWZe6h1zswcPfNanu1CWvgK
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b833fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=-ORaCNUFwIs1vMjdVOkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

On 8/21/25 8:55 PM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. As of now all
> SKUs have the same GPU fmax, so there is no requirement of
> speed bin support.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>  			#mbox-cells = <2>;
>  		};
>  
> +		qfprom: efuse@784000 {
> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
> +			reg = <0x0 0x00784000 0x0 0x2410>;

len = 0x3000

[...]

> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d6a000 0x0 0x34000>,

This bleeds into GPU_CC, len should be 0x26000

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

This clock only belongs in the SMMU node

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

500 MHz @ RPMH_REGULATOR_LEVEL_SVS, 200 isn't even present in the clock driver

Konrad
