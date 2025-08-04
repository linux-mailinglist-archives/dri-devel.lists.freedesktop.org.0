Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABFDB19AC0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 06:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEB210E28F;
	Mon,  4 Aug 2025 04:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fkurjv3v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984C410E126;
 Mon,  4 Aug 2025 04:31:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573No1f3011168;
 Mon, 4 Aug 2025 04:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vssEbq0+ZIxOehsdS4FA8hybmmmRjis7q0tY5Oxpr/s=; b=fkurjv3vyIeeS8Eg
 jnGGX0ijMXRBKcqizFKUfx4akpuBKoOr9A+s+hM3QqsO4AJVtloomxlEGfCUmcU9
 o59l8HiQJr1mMeOHlswnvTe7PAwYxBljQ0Gf/cdjHTAQRkvj0l9bMO3fLWroaaR8
 9hh+Tq45G1N5YoWKcEPwopBwbVUUqmaXLSyxZYyZGlPrcAnzRAqTyJsNS4G74k94
 fJHHAeIWY8r24/brYl2D4a5b9Aqb5Mhkx6zRp3yeT7SDc5483UTU8SRW1LzmrIvo
 YfXpQl3MFbGjVjGhmvFwLm3jdt1HeuDoKQnxo4StyxNMNVOVqmzOa6xidTso5km4
 /dDOfQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a3dqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Aug 2025 04:31:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5744Ve7x010663
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 4 Aug 2025 04:31:40 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 3 Aug
 2025 21:31:34 -0700
Message-ID: <477bebcc-2d1a-4183-8e3d-d792e876c63a@quicinc.com>
Date: Mon, 4 Aug 2025 12:31:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
 <deefg7w3ot6cd3woexfwagetmkg4nvu37f66h4ulbdqegdgi3u@plj6puxcsil4>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <deefg7w3ot6cd3woexfwagetmkg4nvu37f66h4ulbdqegdgi3u@plj6puxcsil4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=689037ad cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=bNVB-QMxkSv05INpNXEA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kMsO4wlwWm10GvYRcOrHi36Gavl3yD2N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyMCBTYWx0ZWRfX6tB76TrhnJEn
 sP5HiVh0Zks8N8JMcAKLf6pLtUNFXBx1Y3Z6KuE3HFkYDl0Hlm2NXohu+uA+eWcXtTzAQPqecpL
 RFYCSO8qae40tx61epe/qeDiQ1rMzazejCfCExOAdQNChhpflGHGzTlqP0Nf5eiWlqrxSJwz/3L
 Yve62LFi9i2tcpY0N3oI6ueioyAvmEHmdrzSRq6nPG1FKtfBblTHqYzrVax5P2o3jQq0upqJVJi
 ToP8sVv0gxT/MSxcIXoHzF0hTpVG/va6K5TWboe6ovkDKJkVRE0LN+IDNZev13hgfhxpSn3pBiW
 9/925dJo1wEPlMmzwbtrJnNQ1+hqER5fE9erk/e9y2LHsdG0OvvXfu8bag662imA32Q8OL8kYcT
 q0nUaX8kelQYsUs+4k14v0sx6qrvxcI12qm+lcHl6Y2COlmYjjDVh9cZO5kEQykTDv+QA6bw
X-Proofpoint-GUID: kMsO4wlwWm10GvYRcOrHi36Gavl3yD2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040020
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



On 2025/8/2 17:56, Dmitry Baryshkov wrote:
> On Wed, Jul 30, 2025 at 05:42:28PM +0800, Yongxing Mou wrote:
>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
>>   1 file changed, 284 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ae4bc16395326bffd6c9eff92778d9f207209526
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
>> @@ -0,0 +1,284 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,qcs8300-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies, Inc. QCS8300 Display MDSS
>> +
>> +maintainers:
>> +  - Yongxing Mou <quic_yongmou@quicinc.com>
>> +
>> +description:
>> +  QCS8300 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
>> +  DPU display controller, DP interfaces and EDP etc.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qcs8300-mdss
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB
>> +      - description: Display hf AXI
>> +      - description: Display core
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 3
>> +
>> +  interconnect-names:
>> +    maxItems: 3
>> +
>> +patternProperties:
>> +  "^display-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,qcs8300-dpu
>> +          - const: qcom,sa8775p-dpu
> 
> Use contains: instead of listing both of them
> 
Got it, thanks~ here we want to fallback qcs8300 to sa8775p.
Should we update it to :
+        contains:
+          enum:
+            - qcom,qcs8300-dpu
+            - qcom,sa8775p-dpu

  above method can be validated using dt_binding_check.
>> +
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,qcs8300-dp
>> +
>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,qcs8300-edp-phy
>> +          - const: qcom,sa8775p-edp-phy
> 
> Use contains: instead of listing both of them
> 
Same as above
>> +
>> +required:
>> +  - compatible
>> +
>> +unevaluatedProperties: false
>> +
> 

