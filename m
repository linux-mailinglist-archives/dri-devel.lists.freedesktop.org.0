Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58169B9394
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 15:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB79610E2E6;
	Fri,  1 Nov 2024 14:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mqdClHgj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D2310E2E4;
 Fri,  1 Nov 2024 14:46:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A17oRcv031368;
 Fri, 1 Nov 2024 14:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vSZh/VL+eZxY4KjJ6Qd3gyTjkbotFVi8Wrc40OfL8bs=; b=mqdClHgjQ1i1X9/I
 ZrTbqWoepHTMz/9qfZXOqrp3FuKFT4fgFGiONmA+973Ra5aQpt37cLzoHYveyCPT
 oivkRml7HNRWIgxMdXcZokWfnYXHKBCvROYLBbMaJ30u7w22GDBUhRPkBzsTO56d
 LE5B9GWKC85QBdj+nhYgxHRvwDlltejQN6NCZ8H4x8vZVXW5QVQXY5JbMZPhsEuS
 N6M/hr4xPDIeY4EhdCxF/fyXuG8qo4b/djOO2vayvP25NFxs9SmaGvCOy05K2adx
 AmJxlUylF/UHe1w3gsXFHsH/cLBFmOnOhcLSJrbEYnSw90gU4GVRcDliF74F6kKf
 ifhNzg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42mtxw1b0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Nov 2024 14:46:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1EkB5f003553
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Nov 2024 14:46:11 GMT
Received: from [10.206.104.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 07:46:05 -0700
Message-ID: <bf997a81-45e9-43f6-ad65-5eff16101891@quicinc.com>
Date: Fri, 1 Nov 2024 20:16:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-1-bdf1d9ce6021@quicinc.com>
 <14a7bfdb-7106-4317-a54a-e0101c41cba1@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <14a7bfdb-7106-4317-a54a-e0101c41cba1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: iqI3yyRpzU3I5Dq18L23u_DPl-9cfksw
X-Proofpoint-ORIG-GUID: iqI3yyRpzU3I5Dq18L23u_DPl-9cfksw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411010106
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

On 11/1/2024 2:00 AM, Konrad Dybcio wrote:
> On 30.10.2024 8:02 AM, Akhil P Oommen wrote:
>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>
>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>> SKUs have the same GPU fmax, so there is no requirement of
>> speed bin support.
>>
>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 94 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 94 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index e8dbc8d820a6..c6cb18193787 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -3072,6 +3072,100 @@ tcsr_mutex: hwlock@1f40000 {
>>  			#hwlock-cells = <1>;
>>  		};
>>  
>> +		gpu: gpu@3d00000 {
>> +			compatible = "qcom,adreno-663.0", "qcom,adreno";
> 
> Is the patchlevel zero for this SKU?

Yes. There is only a single revision implemented downstream.


> 
> 
>> +			reg = <0x0 0x03d00000 0x0 0x40000>,
>> +			      <0x0 0x03d9e000 0x0 0x1000>,
>> +			      <0x0 0x03d61000 0x0 0x800>;
>> +			reg-names = "kgsl_3d0_reg_memory",
>> +				    "cx_mem",
>> +				    "cx_dbgc";
>> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +			iommus = <&adreno_smmu 0 0xc00>,
>> +				 <&adreno_smmu 1 0xc00>;
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			qcom,gmu = <&gmu>;
>> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "gfx-mem";
>> +			#cooling-cells = <2>;
> 
> You might want to hook this up to a thermal-zone right away

I am checking with our Thermal team on this. Will get back shortly.

-Akhil.

> 
> Konrad

