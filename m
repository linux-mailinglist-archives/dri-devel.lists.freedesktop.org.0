Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2188A9EE3E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 12:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EBC10E180;
	Mon, 28 Apr 2025 10:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bNS/ZROp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD7E10E0D4;
 Mon, 28 Apr 2025 10:44:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACRke025798;
 Mon, 28 Apr 2025 10:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rilsCXWAK9vi7OM2nXU4iJx4djTQbOQyhyG3UdhMzd0=; b=bNS/ZROpElA+PTY1
 rKr0lddW+wXsA6IPw96KCvTH5aTNzlAU0WwJzigIHF+0yFcHjKwjbUqY+GOq2yr3
 vRhhna2U7lrWk+LceacvD5mX4EFFMpUNLWc+h1RURdfNCOEd358LrN+F5QjBdL47
 7Mhw5gWlXQMCEPj6wlYBRhBux9NnGtW6+0WUSKZ1U+Pg8NFGJsKJQxSuHhuCYcBJ
 /VtAT1t9gklUonJ37t7u8GTxPiF3MKE2QLc2MIzpFakNgzaaq9sp/IS+KeolTvZK
 Z/Ii0cIN9RpgRIv4dB/wqCN/U+28UwXQeF1/ZP7pBOFdUm1F5+0q210tZUM4KpTD
 yKstKg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q320ufm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 10:44:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53SAijlp014497
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 10:44:45 GMT
Received: from [10.216.32.231] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 03:44:37 -0700
Message-ID: <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
Date: Mon, 28 Apr 2025 16:14:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=680f5c1e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=ICJeL3kfza5QV274o94A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WRz8n5WYy_YEjm6Lor_fkkGCisA8WlSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4OCBTYWx0ZWRfXzX04qvK3h2ns
 XrxsGaiaLUPn2KaF2xIhrqLJu3sOK9Ccv6aP8RzulL9JY5Indny16q34xu2pQzCB98eZBW9E2Kv
 JiAuBiyekyi0LK6YztG3Vxr7cMsyDKuS2uEEkzZBXrbQekTBdTteKMAkvEBaYO79HE0LzMP9pH8
 LOGFo0LlUOJ8S1/UnG3iIyWg6kohGLjE8h/w7AAXdJv2fEwSwcVMxRNgpQwi1PCZxvL05JxWjBn
 l4k6HPOmgcUAaMQkRL2Os6CwEKG4EUq1gXbg9QcAf4pz6cstDfI+r5gQNy8vQjQRcxKowsbgnp3
 beRADFu304b4ff+6CuK9PfhUHyZ1oSxHvtGXS2WqMMKTcRdzsqOWQdf8aKtjD+dfa70gBuJe9Up
 nIdX/XKbg8Ooq2fOcb1eD+ub81CHWNjyaGweZ1VpEjVQ+3ZJcsQMK8zQD+xHLLHs3oonNtUj
X-Proofpoint-ORIG-GUID: WRz8n5WYy_YEjm6Lor_fkkGCisA8WlSe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=701 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280088
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

On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and gmu nodes for qcs8300 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
> 
> [...]
> 
>> +		gmu: gmu@3d6a000 {
>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> 
> size = 0x26000 so that it doesn't leak into GPU_CC

We dump GPUCC regs into snapshot!

> 
>> +			      <0x0 0x03de0000 0x0 0x10000>,
>> +			      <0x0 0x0b290000 0x0 0x10000>;
>> +			reg-names = "gmu", "rscc", "gmu_pdc";
>> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hfi", "gmu";
>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_AHB_CLK>,
>> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> 
> This should only be bound to the SMMU

Not sure how this sneaked in. Will remove this.

> 
>> +			clock-names = "gmu",
>> +				      "cxo",
>> +				      "axi",
>> +				      "memnoc",
>> +				      "ahb",
>> +				      "hub",
>> +				      "smmu_vote";
>> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
>> +					<&gpucc GPU_CC_GX_GDSC>;
>> +			power-domain-names = "cx",
>> +					     "gx";
>> +			iommus = <&adreno_smmu 5 0xc00>;
>> +			operating-points-v2 = <&gmu_opp_table>;
>> +
>> +			gmu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-200000000 {
>> +					opp-hz = /bits/ 64 <200000000>;
> 
> It looks like this clock only has a 500 Mhz rate 

Ack.

-Akhil.
> 
> Konrad

