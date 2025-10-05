Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19494BBCE24
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 01:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1FA10E2CE;
	Sun,  5 Oct 2025 23:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="on41rkU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CF810E0F1;
 Sun,  5 Oct 2025 23:54:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Nf9G4025787;
 Sun, 5 Oct 2025 23:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Qn86KvLo5Zq5nm0mEJqPF9Wx0XnyTrU9sJXzFKCQSrE=; b=on41rkU5TKx3B6jl
 2A7gWWgxeP9l0dLzagfk0mQDhIs5fD/zk4zMTd/ppXrqjqqLn28vqqTYVA0hsRo2
 vEIu0/ssDGMxBYTUcDTMYVW+xmpsnbRH/W8HOnBYk3JTVC2k0DZOlODrBMf/opvO
 Rrdg4RGossUIKVTO7TzHBpdix+qpidc9Qj6aYmRrqHd98NUIwd+aOY27dQ11uqpM
 TfH7FZvC2u0WoPADuremGNSrJ/HGm4aqR+zxvuOVqXgPRmPxUzjdj/6N9OzFdzZN
 FGg0NKMs6kqo50YtoVZwVGatH8xochfFJXYUuoyPiKHjGbqpUOXRfCPpEpyR97pZ
 z1GIog==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ju5xan4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 05 Oct 2025 23:54:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 595Ns3bP030825
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 5 Oct 2025 23:54:03 GMT
Received: from [10.216.28.59] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Sun, 5 Oct
 2025 16:53:56 -0700
Message-ID: <d5f87af9-be76-4343-a425-fb20a9e6c6e8@quicinc.com>
Date: Mon, 6 Oct 2025 05:23:53 +0530
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
 <aaa9f760-70aa-4bee-b6ab-d6fb02ea3c78@quicinc.com>
 <CAO9ioeWHJSj74VBR=2kHJDe_p1oG9Ngs6q9+s=CySGD3KY6sPQ@mail.gmail.com>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <CAO9ioeWHJSj74VBR=2kHJDe_p1oG9Ngs6q9+s=CySGD3KY6sPQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=FooIPmrq c=1 sm=1 tr=0 ts=68e3051c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=9TVuvPmJ-SUQZ-tjHVgA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: YzWOODIdLUXruPPsViLlinqHkKmFgKmb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMiBTYWx0ZWRfX30ukWfGq3BR+
 pLInk52ZQj76yrfv11FukCoN2F1RocV7e1B5LOLgp+emm9Zhto+BCcyF9cY6Z5nPoJp1HkbmEhl
 CX7T8vJukZZLUT+WU39WOyZT6ew6i7aXL81FvC62LLY7S93e81T4E4fD47tDCwEwBF628uYptqo
 IvBnedv0qVO6I3IL7OSdIA3qjmqFrS4ow6EFxC6Zyt6xx5THs6GUwHD1dks0VwHirg5TyC0efP1
 qIX5fIaECJZGnPKj7CjgrIVRrjFaMtmPm2btq0uukzpiaKyKCwdU6ZjUq3lTM71rLcNNRJ8xSFQ
 2GB8B7nV7gMTPhcpEssJTZdXzRUSXrYXQNh3miS8SA1Wx/PXyJ6wFk3m+Qrsfxlcl9wa0LbeS58
 j4u8277uQMFUFq5JRer/U7s+VUmqrQ==
X-Proofpoint-GUID: YzWOODIdLUXruPPsViLlinqHkKmFgKmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_08,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040022
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

On 10/6/2025 3:31 AM, Dmitry Baryshkov wrote:
> On Sun, 5 Oct 2025 at 19:49, Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
>>
>> On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
>>>> Add device tree nodes for the DSI0 controller with their corresponding
>>>> PHY found on Qualcomm QCS8300 SoC.
>>>>
>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
>>>>  1 file changed, 94 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> index e0e1f63fc45b..834ae0522f2f 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> @@ -3,6 +3,7 @@
>>>>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>   */
>>>>
>>>> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>>>>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>>>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>>>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>>>> @@ -4854,6 +4855,13 @@ dpu_intf0_out: endpoint {
>>>>                                                      remote-endpoint = <&mdss_dp0_in>;
>>>>                                              };
>>>>                                      };
>>>> +
>>>> +                                    port@1 {
>>>> +                                            reg = <1>;
>>>> +                                            dpu_intf1_out: endpoint {
>>>> +                                                    remote-endpoint = <&mdss_dsi0_in>;
>>>> +                                            };
>>>> +                                    };
>>>>                              };
>>>>
>>>>                              mdp_opp_table: opp-table {
>>>> @@ -4881,6 +4889,89 @@ opp-650000000 {
>>>>                              };
>>>>                      };
>>>>
>>>> +                    mdss_dsi0: dsi@ae94000 {
>>>> +                            compatible =  "qcom,sa8775p-dsi-ctrl","qcom,mdss-dsi-ctrl";
>>>
>>> qcom,qcs8300-dsi-ctrl. You might use three compatibles (qcs8300, sa8775p
>>> and the generic one), but there should be qcs8300 one.
>>>
>>
>> Hi Dmitry,
>>
>> If I am adding three compatible string for ctrl,
>>
>> compatible = "qcom,qcs8300-dsi-ctrl",
>>              "qcom,sa8775p-dsi-ctrl",
>>              "qcom,mdss-dsi-ctrl";
>>
>> while validating dt-binding and dtsi against dt-schema. I am getting below errors
>>
>>
>> /local/mnt/workspace/amakhija/linux_next/linux/arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: dsi@ae94000: compatible: 'oneOf' conditional failed, one must be fixed:
>>         ['qcom,qcs8300-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
>>         'qcom,qcs8300-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
>>         'qcom,mdss-dsi-ctrl' was expected
>>         from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>>
>> According to the dsi-controller-main.yaml schema only two strings are allowed one is the SOC specific and other one is generic "qcom,mdss-dsi-ctrl".
>>
>> Shall I keep only two strings qcom,qcs8300-mdss.yaml and the generic one "qcom,mdss-dsi-ctrl" or if we want to support 3 strings in compatible sting we need to modify the dsi-controller-main.yaml ?
> 
> Of course.
> 
>> Similarly, I am getting error for dsi_phy compatible string only one SOC specific compatible string is allow.
> 
> So, what's the question? You are adding support for the platform. So
> yes, you need to modify the schema.
> 

Thanks Dmitry for the clarification will modify the dsi-controller-main.yaml to support more than 2 strings in the compatible and dsi-phy-7nm.yaml schema to support more than one string in the compatible.

Thanks,
Ayushi 
