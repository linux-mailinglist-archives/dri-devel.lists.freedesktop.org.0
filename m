Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0053D9E95DE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499F110E72D;
	Mon,  9 Dec 2024 13:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nj6OOccX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDA910E726;
 Mon,  9 Dec 2024 13:10:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9AafGm023581;
 Mon, 9 Dec 2024 13:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xEIrlTfhnV+Y0u0AleY89FQXrZJ5wuQflXdaa+2Y57M=; b=nj6OOccXe+KpHece
 C85WnxUaqYmDOSGN+51bpq8mAh81yaDJBMASzOZArV78GnD0rU5z9c1EchdaKeGh
 9JkJ2roEXOIkJjXXe/fuTUn3bxvh3yE5CUvJ1Sivc5yc+NHdC6Eolb6KJ9+2BfgQ
 1Nims5Vah90ierwEA7uR/1d6ZA6ZtBT6+dpU3cuks9AFI3gh5EqU+EigqHeleL0B
 LCnc/kSXRSmpWbe/2g8o90+in4IV08iDmlOIbLQ/cZvO0tEMlboL5NteXm3gTnsV
 nYtni5lWWW6P8IbkCaNWP2v/yM665o8oRlWTRU+CucgWH36kV2knpXyVN9sYvYR6
 sqnQug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfhkcqu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 13:10:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9DAfeQ003008
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Dec 2024 13:10:41 GMT
Received: from [10.216.3.14] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 05:10:36 -0800
Message-ID: <1af37251-3cdf-47da-8228-2cd5622e1770@quicinc.com>
Date: Mon, 9 Dec 2024 18:40:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
 <20241205-topic-sm8x50-gpu-bw-vote-v4-6-9650d15dd435@linaro.org>
 <e56cd9bf-8fa7-44b0-b00f-45cedb73e194@quicinc.com>
Content-Language: en-US
In-Reply-To: <e56cd9bf-8fa7-44b0-b00f-45cedb73e194@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: wo6nb1-qKU0vVSzahaGu9FNOprCeZAIL
X-Proofpoint-GUID: wo6nb1-qKU0vVSzahaGu9FNOprCeZAIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090103
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

On 12/9/2024 6:32 PM, Akhil P Oommen wrote:
> On 12/5/2024 8:31 PM, Neil Armstrong wrote:
>> Each GPU OPP requires a specific peak DDR bandwidth, let's add
>> those to each OPP and also the related interconnect path.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> I haven't checked each bw value, still
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> 
> -Akhil
> 
>> ---
>>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..955f58b2cb4e4ca3fd33f1555e36a15cfc82d642 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -14,6 +14,7 @@
>>  #include <dt-bindings/firmware/qcom,scm.h>
>>  #include <dt-bindings/gpio/gpio.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/interconnect/qcom,icc.h>
>>  #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>> @@ -2114,6 +2115,10 @@ gpu: gpu@3d00000 {
>>  			qcom,gmu = <&gmu>;
>>  			#cooling-cells = <2>;
>>  
>> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "gfx-mem";
>> +
>>  			status = "disabled";
>>  
>>  			zap-shader {
>> @@ -2127,41 +2132,49 @@ gpu_opp_table: opp-table {
>>  				opp-680000000 {
>>  					opp-hz = /bits/ 64 <680000000>;
>>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>> +					opp-peak-kBps = <16500000>;
>>  				};
>>  
>>  				opp-615000000 {
>>  					opp-hz = /bits/ 64 <615000000>;
>>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
>> +					opp-peak-kBps = <16500000>;

Seems like you are using value from "qcom,bus-max" node for each opp in
downstream devicetree. Except for the highest OPP, we should use the
value from "qcom,bus-freq" node. That is supposed to give the best perf
per watt.

-Akhil.

>>  				};
>>  
>>  				opp-550000000 {
>>  					opp-hz = /bits/ 64 <550000000>;
>>  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>> +					opp-peak-kBps = <12449218>;
>>  				};
>>  
>>  				opp-475000000 {
>>  					opp-hz = /bits/ 64 <475000000>;
>>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
>> +					opp-peak-kBps = <8171875>;
>>  				};
>>  
>>  				opp-401000000 {
>>  					opp-hz = /bits/ 64 <401000000>;
>>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>> +					opp-peak-kBps = <6671875>;
>>  				};
>>  
>>  				opp-348000000 {
>>  					opp-hz = /bits/ 64 <348000000>;
>>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>> +					opp-peak-kBps = <6074218>;
>>  				};
>>  
>>  				opp-295000000 {
>>  					opp-hz = /bits/ 64 <295000000>;
>>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>> +					opp-peak-kBps = <6074218>;
>>  				};
>>  
>>  				opp-220000000 {
>>  					opp-hz = /bits/ 64 <220000000>;
>>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>> +					opp-peak-kBps = <6074218>;
>>  				};
>>  			};
>>  		};
>>
> 

