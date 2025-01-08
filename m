Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED96A068B4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDE210ECA6;
	Wed,  8 Jan 2025 22:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OUjVmmwb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5B310ECAB;
 Wed,  8 Jan 2025 22:46:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508IgkAZ007921;
 Wed, 8 Jan 2025 22:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bur4ZcCFZ2/H4vqAdIWDy5aNtTYuEzsSM7ryaZvbGH0=; b=OUjVmmwbSwwfy+gP
 TQrVN9iwLkTz+lh++h8t8cN0O1zldCRtWB2Snr6fDdBgan2Bv5p3QO6G+bRR/hv5
 KWtdiqSvuGJs8LW6yxKePGOqXHbCRUOQeS5NQ/73V/RWLqpvWEoTXR+jTjaX9FCs
 aJ5UZw1xEwBU81iK+mrCWNgOvmPEQZ3Mm1NNTkM2nyMuIcRbppmdIm6WC24pW6bP
 E05kxHTryEuwctyCK41g1Op3R5sxdI8EMXCvxWLknYIuHza0BYFy6hs7w92llaYx
 0RV4GVrbjosBdnzIv/5Bv8yuWRokaN6BlnoVJZIf4lNQzywykoHfw9sX2tiJWLjR
 ftBXxQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvnrfxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 22:45:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Mjrbe029304
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2025 22:45:53 GMT
Received: from [10.216.24.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 14:45:44 -0800
Message-ID: <aa1695ed-729a-4612-b322-3e9d6571264b@quicinc.com>
Date: Thu, 9 Jan 2025 04:15:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu
 nodes
To: Bjorn Andersson <andersson@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
 <y7rf2klosrpvr5foroilgma5rwmlyq4ux5zymxd5cen7d6yu42@xig34xs6whtg>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <y7rf2klosrpvr5foroilgma5rwmlyq4ux5zymxd5cen7d6yu42@xig34xs6whtg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AxPjlFkWxZbrL_x6PjbLuB__Y9aoFei4
X-Proofpoint-ORIG-GUID: AxPjlFkWxZbrL_x6PjbLuB__Y9aoFei4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=929 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080186
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

On 1/9/2025 4:03 AM, Bjorn Andersson wrote:
> On Fri, Dec 13, 2024 at 05:01:05PM +0530, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and gmu nodes for qcs615 chipset.
>>
> 
> Please resubmit this in a series together with the gpucc patch.

Sure. I will send a new revision.

-Akhil.

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 88 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 8df26efde3fd6c0f85b9bcddb461fae33687dc75..dee5d3be4aa34dd64864b6fe32ad589abac99bb7 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -387,6 +387,11 @@ smem_region: smem@86000000 {
>>  			no-map;
>>  			hwlocks = <&tcsr_mutex 3>;
>>  		};
>> +
>> +		pil_gpu_mem: pil-gpu@97715000 {
>> +			reg = <0x0 0x97715000 0x0 0x2000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	soc: soc@0 {
>> @@ -508,6 +513,89 @@ qup_uart0_rx: qup-uart0-rx-state {
>>  			};
>>  		};
>>  
>> +		gpu: gpu@5000000 {
>> +			compatible = "qcom,adreno-612.0", "qcom,adreno";
>> +			reg = <0x0 0x05000000 0x0 0x90000>;
>> +			reg-names = "kgsl_3d0_reg_memory";
>> +
>> +			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>;
>> +			clock-names = "core",
>> +				      "mem_iface",
>> +				      "alt_mem_iface",
>> +				      "gmu",
>> +				      "xo";
>> +
>> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "gfx-mem";
>> +
>> +			iommus = <&adreno_smmu 0x0 0x401>;
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			power-domains = <&rpmhpd RPMHPD_CX>;
>> +			qcom,gmu = <&rgmu>;
>> +
>> +			#cooling-cells = <2>;
>> +
>> +			status = "disabled";
>> +
>> +			gpu_zap_shader: zap-shader {
>> +				memory-region = <&pil_gpu_mem>;
>> +			};
>> +
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-435000000 {
>> +					opp-hz = /bits/ 64 <435000000>;
>> +					required-opps = <&rpmhpd_opp_svs>;
>> +					opp-peak-kBps = <3000000>;
>> +				};
>> +
>> +				opp-500000000 {
>> +					opp-hz = /bits/ 64 <500000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>> +					opp-peak-kBps = <3975000>;
>> +				};
>> +
>> +				opp-650000000 {
>> +					opp-hz = /bits/ 64 <650000000>;
>> +					required-opps = <&rpmhpd_opp_nom>;
>> +					opp-peak-kBps = <5287500>;
>> +				};
>> +
>> +				opp-745000000 {
>> +					opp-hz = /bits/ 64 <745000000>;
>> +					required-opps = <&rpmhpd_opp_nom_l1>;
>> +					opp-peak-kBps = <6075000>;
>> +				};
>> +
>> +				opp-845000000 {
>> +					opp-hz = /bits/ 64 <845000000>;
>> +					required-opps = <&rpmhpd_opp_turbo>;
>> +					opp-peak-kBps = <7050000>;
>> +				};
>> +			};
>> +		};
>> +
>> +		rgmu: rgmu@506a000 {
>> +			compatible = "qcom,adreno-rgmu";
>> +			reg = <0x0 0x0506a000 0x0 0x34000>;
>> +			reg-names = "gmu";
>> +			power-domains = <&gpucc CX_GDSC>,
>> +					<&gpucc GX_GDSC>;
>> +			power-domain-names = "cx", "gx";
>> +
>> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hfi", "gmu";
>> +		};
>> +
>>  		gpucc: clock-controller@5090000 {
>>  			compatible = "qcom,qcs615-gpucc";
>>  			reg = <0 0x5090000 0 0x9000>;
>>
>> -- 
>> 2.45.2
>>

