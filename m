Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE99A97CFE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 04:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BEB10E641;
	Wed, 23 Apr 2025 02:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Kp8Jqywv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49BF10E3F3;
 Wed, 23 Apr 2025 02:47:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i9Ed011506;
 Wed, 23 Apr 2025 02:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sB2whZ4o44nclF5q8WfWHEeVgqwtu7omdQQM2itCr4w=; b=Kp8Jqywv63ABfzZD
 3aozZYOzj41J1eoK0C7T2BhbxvFq2vi0TU4p5McU/IGgDMpDgIDN0ywTF5QFpx8i
 SIwpcGhTz+82szcO9YXciDVOyh0lydBgXQi8//yi20Wxe3WozqQZADEIwtb4Mr7D
 uLF3ABApcRZDuH/HWMCVtqdeKWv2n+AfOeuQpJJPCyJe/JSZD5BhjT/zEQ0nFmtF
 /XDqIDQO48ZKDe0iYPnDdJib3wiGjLPujb751eY5XvEBGrcSf1TEgdBsxf/hkdL4
 vTQd5fBNtA5SQ8C2bk+8viFLEF8qOu5KrTvn2URTOT786nFZBvdv+fYTYqennnd7
 dKIh/w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1gmvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 02:46:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N2kwlE027965
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 02:46:58 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 19:46:57 -0700
Message-ID: <0101602d-0434-47ea-8957-471c4ead100d@quicinc.com>
Date: Tue, 22 Apr 2025 19:46:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: add stream 1 pixel clock
 binding
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
 <edlw7grqy74rihy5jw5t2krcyfn24c6b2lfxht4b52wx6fvck6@pqeqrbnwtsf3>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <edlw7grqy74rihy5jw5t2krcyfn24c6b2lfxht4b52wx6fvck6@pqeqrbnwtsf3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: N6P4BI9iBoWI2e6EKSWBzyIelS0nFBu_
X-Proofpoint-ORIG-GUID: N6P4BI9iBoWI2e6EKSWBzyIelS0nFBu_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAxNiBTYWx0ZWRfX7V0xOTEPtjlF
 sEvkFxHMzaUNx5nLps0q7Tuv3zlFoXSnKrd9j5MJaIXD5oXrLyfN4o5GtduD4J2ALQuk5QmVV4b
 67ZU6yFrY5BErSWR/ExbBTC8QVusgVhX37xy0QU3vYSXuFgf3d9fqoZUto2nYWzhyPMzIW/5cLy
 ON3iowNneAIjqWRq5WLMWbBsA3IJx6eHzsnxw167FKIqCKlX9c37CQN6zEEcErPICO1gKTwYy+J
 H+HODBlzdsnv1ZPIqPEZ3gOFXqqVualKNHvL/T40HDVOscotFWih7iCTRK4vX6oR2ouH8kOV6ui
 ob4z9cOL9t+qJijDVS7IUkNtHVFHasp4/10jBZ6pjwwApA/ek5Uo9c7RN8OO5AKyF8GfoKFsmSY
 LAw63daouEbixRMN9Scf7hrD8eA+HY0Ao9B5TqD6rItoo0kSfvfIGu9XE2BaUoNMs0CCkgZd
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680854a3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=zCC9CgH-0czqcsUVom0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230016
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



On 12/3/2024 5:43 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 07:31:41PM -0800, Abhinav Kumar wrote:
>> On some chipsets the display port controller can support more
>> than one pixel stream (multi-stream transport). To support MST
>> on such chipsets, add the binding for stream 1 pixel clock for
>> display port controller. Since this mode is not supported on all
>> chipsets, add exception rules and min/max items to clearly mark
>> which chipsets support only SST mode (single stream) and which ones
>> support MST.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   .../bindings/display/msm/dp-controller.yaml        | 32 ++++++++++++++++++++++
>>   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
>>   2 files changed, 38 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 9fe2bf0484d8..650d19e58277 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -50,30 +50,38 @@ properties:
>>       maxItems: 1
>>   
>>     clocks:
>> +    minItems: 5
>>       items:
>>         - description: AHB clock to enable register access
>>         - description: Display Port AUX clock
>>         - description: Display Port Link clock
>>         - description: Link interface clock between DP and PHY
>>         - description: Display Port stream 0 Pixel clock
>> +      - description: Display Port stream 1 Pixel clock
>>   
>>     clock-names:
>> +    minItems: 5
>>       items:
>>         - const: core_iface
>>         - const: core_aux
>>         - const: ctrl_link
>>         - const: ctrl_link_iface
>>         - const: stream_pixel
>> +      - const: stream_1_pixel
>>   
>>     assigned-clocks:
>> +    minItems: 2
>>       items:
>>         - description: link clock source
>>         - description: stream 0 pixel clock source
>> +      - description: stream 1 pixel clock source
>>   
>>     assigned-clock-parents:
>> +    minItems: 2
>>       items:
>>         - description: Link clock PLL output provided by PHY block
>>         - description: Stream 0 pixel clock PLL output provided by PHY block
>> +      - description: Stream 1 pixel clock PLL output provided by PHY block
>>   
>>     phys:
>>       maxItems: 1
>> @@ -175,6 +183,30 @@ allOf:
>>         required:
>>           - "#sound-dai-cells"
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sa8775p-dp
> 
> Why do you need an extra platform conditional?
> 

I expect this list to grow and also there can be chipsets which support 
4 streams as well, so an extra platform conditional was needed.

>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 6
>> +        clock-names:
>> +          items:
>> +            - const: core_iface
>> +            - const: core_aux
>> +            - const: ctrl_link
>> +            - const: ctrl_link_iface
>> +            - const: stream_pixel
>> +            - const: stream_1_pixel
>> +        assigned-clocks:
>> +          maxItems: 3
>> +        assigned-clock-parents:
>> +          maxItems: 3
>> +
>>   additionalProperties: false
>>   
>>   examples:
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>> index 58f8a01f29c7..7f10e6ad8f63 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>> @@ -177,16 +177,19 @@ examples:
>>                        <&dispcc_dptx0_aux_clk>,
>>                        <&dispcc_dptx0_link_clk>,
>>                        <&dispcc_dptx0_link_intf_clk>,
>> -                     <&dispcc_dptx0_pixel0_clk>;
>> +                     <&dispcc_dptx0_pixel0_clk>,
>> +                     <&dispcc_dptx0_pixel1_clk>;
>>               clock-names = "core_iface",
>>                             "core_aux",
>>                             "ctrl_link",
>>                             "ctrl_link_iface",
>> -                          "stream_pixel";
>> +                          "stream_pixel",
>> +                          "stream_1_pixel";
>>   
>>               assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
>> +                              <&dispcc_mdss_dptx0_pixel1_clk_src>,
>>                                 <&dispcc_mdss_dptx0_pixel0_clk_src>;
>> -            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
>> +            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>, <&mdss0_edp_phy 1>;
>>   
>>               phys = <&mdss0_edp_phy>;
>>               phy-names = "dp";
>>
>> -- 
>> 2.34.1
>>
> 

