Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D37BBA3213
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F306710E314;
	Fri, 26 Sep 2025 09:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="l3//ZCHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415E789C93;
 Fri, 26 Sep 2025 09:25:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vZjR030515;
 Fri, 26 Sep 2025 09:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5TS5AtqdYm2HDDLZWKnMEWSVhW1X2rXyp/0PxVYWGtY=; b=l3//ZCHjTzZwkw82
 6awUR7tI+gJhfdVe5fYoaBD3ZUazzIiROwjaS2GUalUq1OFCiZNoqAa9PxDtlms/
 HO5ei79TGR0EUPjgLvR4MMb2F0zZ0ObfN4ZwCWfgO5ZHYc35sdoIqyhXikGu+1Pp
 wXOmSskJXvJRJ5mZ2hwtuUab6PABjnv59ORcl2Iyb9ZNR/QRYO2qKphEKPEus2Mv
 Cg6xeXcCyDGRAEv5ZJPiUGvfOwoADjT/owlcYVbTsUK9CMS79l/g/t6hivdRqUKV
 HOdy6QFb7bpb3axI6x6zTQzbeUnd6uqIft5ttfKBgCaRyP+5MrqAUZJm4UjtwsV5
 jWbDVA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u29fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Sep 2025 09:25:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58Q9Plrp006298
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Sep 2025 09:25:47 GMT
Received: from [10.206.97.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 26 Sep
 2025 02:25:41 -0700
Message-ID: <8c248bf8-2f25-443d-a08f-6504c349b72b@quicinc.com>
Date: Fri, 26 Sep 2025 14:55:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <marijn.suijten@somainline.org>,
 <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
 <quic_jesszhan@quicinc.com>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com>
 <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ePYSTuK6cAO9qr2ehXibnVVYJb-MCPtk
X-Proofpoint-GUID: ePYSTuK6cAO9qr2ehXibnVVYJb-MCPtk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX8MLVqHkJkWcV
 Mgr9b3zMkKMizTSiChfQSNttbqOt+XrxAmYt3x2s2OPPG6Ypdto7w2crKQhojspbUNEktUaDnxf
 klFdPDVoLvW1L3GS8gxja70MbRB7/iKh+wIdySMQSfnQCRlVbRhExMGwjmiFHnT6/lh0Kjgnvft
 sVyAhi31MdbpTfHAhbqP/2xinbmRsxpH9+1I+71bo+6melgLYVlLIM2+u8TyUptSg3mpMaRNGF8
 wfKI1hF3ySMHi0QHcMykEUYqlXQaXsz781uWKHXSKOQmdHitnK5BH66KyKtQE2sRw2RDr8uPnAm
 rxNG+QUzQwVtslV12peqous1p3ToYRgTjMSUVuZZVKEZ1zbj5LlK9VE+P86mhQRr1WBPsoAm97T
 xnZnd6G9xoZL2xfoThdozy+NUcuI7A==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d65c1d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=A_RCIHCzRNtrZjO7i9kA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
>> Add device tree nodes for the DSI0 controller with their corresponding
>> PHY found on Qualcomm QCS8300 SoC.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
>>  1 file changed, 94 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index e0e1f63fc45b..834ae0522f2f 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -3,6 +3,7 @@
>>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>> @@ -4854,6 +4855,13 @@ dpu_intf0_out: endpoint {
>>  							remote-endpoint = <&mdss_dp0_in>;
>>  						};
>>  					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						dpu_intf1_out: endpoint {
>> +							remote-endpoint = <&mdss_dsi0_in>;
>> +						};
>> +					};
>>  				};
>>  
>>  				mdp_opp_table: opp-table {
>> @@ -4881,6 +4889,89 @@ opp-650000000 {
>>  				};
>>  			};
>>  
>> +			mdss_dsi0: dsi@ae94000 {
>> +				compatible =  "qcom,sa8775p-dsi-ctrl","qcom,mdss-dsi-ctrl";
> 
> qcom,qcs8300-dsi-ctrl. You might use three compatibles (qcs8300, sa8775p
> and the generic one), but there should be qcs8300 one.
> 
> Also please add a whitespace after comma or (even better), keep one
> compat per line (align on opening quote).
> 
>> +				reg = <0x0 0x0ae94000 0x0 0x400>;
>> +				reg-names = "dsi_ctrl";
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <4>;
>> +
>> +				clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_ESC0_CLK>,
>> +					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
>> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
>> +				clock-names = "byte",
>> +					      "byte_intf",
>> +					      "pixel",
>> +					      "core",
>> +					      "iface",
>> +					      "bus";
>> +
>> +				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
>> +						  <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
>> +							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
>> +
>> +				phys = <&mdss_dsi0_phy>;
>> +
>> +				operating-points-v2 = <&mdss_dsi_opp_table>;
>> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						mdss_dsi0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf1_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						mdss_dsi0_out: endpoint {
>> +						};
>> +					};
>> +				};
>> +
>> +				mdss_dsi_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-358000000 {
>> +						opp-hz = /bits/ 64 <358000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +				};
>> +			};
>> +
>> +			mdss_dsi0_phy: phy@ae94400 {
>> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
> 
> Add qcs8300-specific compatible and use sa8775p as a fallback
> 

Hi Dmitry,

I have one doubt, even though the ctrl and phy versions for sa8775p(LeMans) and qcs8300(Monaco) are same.
Why can't we use the same compatible string that we have used for LeMans ctrl and phy ? what is the need to define a separate
compatible string for monaco ctrl and phy ?

Thanks,
Ayushi

