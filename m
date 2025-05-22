Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D1FAC017F
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 02:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6E110F0B8;
	Thu, 22 May 2025 00:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eIw8SLTF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0DC10F0B8;
 Thu, 22 May 2025 00:48:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHSSrF020937;
 Thu, 22 May 2025 00:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DmPhszqiCtYUTkb9Ey+ul5DFwAmk4oVD18bJnHmknaI=; b=eIw8SLTFHFH6Bo72
 LUNfhty0JapqnLWo2675dlyvG6xNk/8O06NiASqNYo4uYH9DaQzEvWXo5foNQt1+
 skB9XOvrCp8QGqPMUCAdC9rX8JQnhvoI1jcrHsJbiGOVm6Y9dqK/l3S9DUUP6dJI
 sWgGuCCcE2YJBmSHptLIjWGQV73NR6Z1H2z9UyMAV0A/Zf0opSJzarmyfpSjKNj7
 1dGHgcgkMfIY/2QU9vPiHC9jftBJSrIYZtvPJhjWeCWYkSaIP/jpvLBMjAeJxZMU
 dlNm0ZCuX+H3rEVbbzvsQpae2Ons9qf08x0uiG0Lw+UdqYAF0mWtEN/5a785gv/F
 us32jg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf04pha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 May 2025 00:48:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54M0mXWh029404
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 May 2025 00:48:33 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 17:48:32 -0700
Message-ID: <930881ab-99ec-44de-92fb-09273d061677@quicinc.com>
Date: Wed, 21 May 2025 17:48:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: add stream 1 pixel clock
 binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
 <edlw7grqy74rihy5jw5t2krcyfn24c6b2lfxht4b52wx6fvck6@pqeqrbnwtsf3>
 <0101602d-0434-47ea-8957-471c4ead100d@quicinc.com>
 <2m5fq7whbvaq4sbbxittxhbksw6erfotlwalrfevujq4mrt3kk@ctbgwinz2o72>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <2m5fq7whbvaq4sbbxittxhbksw6erfotlwalrfevujq4mrt3kk@ctbgwinz2o72>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 67-OQHAA8IBtzG_dlKxEtcqD81q5kJGc
X-Proofpoint-ORIG-GUID: 67-OQHAA8IBtzG_dlKxEtcqD81q5kJGc
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682e746c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=mvoR8rSpNx2g5lO-hroA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAwNSBTYWx0ZWRfX5SSP9xgBQ2ow
 g1Lw7abSueQtZgB/BphEPNCDCSm6WBJXh9aflLeZP/JoDKeA+ne0J71noS89tA8yrEv8KZU05PI
 OuYLnvPGcxq/2y0+etpV4/fiWTl+bWGvOrJ14RGtTolm1a26Z1Sz4iygMGPnHJe3PKwnWX1n3QZ
 3OIf2Jq77pZ7E8EQYh9UKmjVz6ao2NSkSUEhwAECIkFS1+GvzwSFvS5At0bnCs2VZNE8CgMUoiM
 9f6ww5K8MfnpkEYbODAVkKqqgj9cMyG/Y2klMrebaRLwFhKxoEKdgTz1k666Q9cUHiA9eoNXsSJ
 077aX6Y9fadh88NgNp3oZ0zWt6Lx1bqBox2PFOFg3cS7P7SDNMZCUWOTpMlFfNmaOobdaNNUy0i
 jZhIpwB1pXj+eV5nWHwg9ruD4mVDuSS21jSSkvYPFYTjL+nDgBcmjnLV3ICoDcptyu7VsSQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220005
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



On 4/23/2025 7:23 AM, Dmitry Baryshkov wrote:
> On Tue, Apr 22, 2025 at 07:46:57PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 12/3/2024 5:43 AM, Dmitry Baryshkov wrote:
>>> On Mon, Dec 02, 2024 at 07:31:41PM -0800, Abhinav Kumar wrote:
>>>> On some chipsets the display port controller can support more
>>>> than one pixel stream (multi-stream transport). To support MST
>>>> on such chipsets, add the binding for stream 1 pixel clock for
>>>> display port controller. Since this mode is not supported on all
>>>> chipsets, add exception rules and min/max items to clearly mark
>>>> which chipsets support only SST mode (single stream) and which ones
>>>> support MST.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>    .../bindings/display/msm/dp-controller.yaml        | 32 ++++++++++++++++++++++
>>>>    .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
>>>>    2 files changed, 38 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 9fe2bf0484d8..650d19e58277 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -50,30 +50,38 @@ properties:
>>>>        maxItems: 1
>>>>      clocks:
>>>> +    minItems: 5
>>>>        items:
>>>>          - description: AHB clock to enable register access
>>>>          - description: Display Port AUX clock
>>>>          - description: Display Port Link clock
>>>>          - description: Link interface clock between DP and PHY
>>>>          - description: Display Port stream 0 Pixel clock
>>>> +      - description: Display Port stream 1 Pixel clock
>>>>      clock-names:
>>>> +    minItems: 5
>>>>        items:
>>>>          - const: core_iface
>>>>          - const: core_aux
>>>>          - const: ctrl_link
>>>>          - const: ctrl_link_iface
>>>>          - const: stream_pixel
>>>> +      - const: stream_1_pixel
>>>>      assigned-clocks:
>>>> +    minItems: 2
>>>>        items:
>>>>          - description: link clock source
>>>>          - description: stream 0 pixel clock source
>>>> +      - description: stream 1 pixel clock source
>>>>      assigned-clock-parents:
>>>> +    minItems: 2
>>>>        items:
>>>>          - description: Link clock PLL output provided by PHY block
>>>>          - description: Stream 0 pixel clock PLL output provided by PHY block
>>>> +      - description: Stream 1 pixel clock PLL output provided by PHY block
>>>>      phys:
>>>>        maxItems: 1
>>>> @@ -175,6 +183,30 @@ allOf:
>>>>          required:
>>>>            - "#sound-dai-cells"
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sa8775p-dp
>>>
>>> Why do you need an extra platform conditional?
>>>
>>
>> I expect this list to grow and also there can be chipsets which support 4
>> streams as well, so an extra platform conditional was needed.
> 
> Ack
> 
>>
>>>> +
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          maxItems: 6
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: core_iface
>>>> +            - const: core_aux
>>>> +            - const: ctrl_link
>>>> +            - const: ctrl_link_iface
>>>> +            - const: stream_pixel
>>>> +            - const: stream_1_pixel
> 
> You don't need to ducplicate the list. Just specify min/maxItems.
> 

Ack

>>>> +        assigned-clocks:
>>>> +          maxItems: 3
>>>> +        assigned-clock-parents:
>>>> +          maxItems: 3
>>>> +
>>>>    additionalProperties: false
>>>>    examples:
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>>>> index 58f8a01f29c7..7f10e6ad8f63 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>>>> @@ -177,16 +177,19 @@ examples:
>>>>                         <&dispcc_dptx0_aux_clk>,
>>>>                         <&dispcc_dptx0_link_clk>,
>>>>                         <&dispcc_dptx0_link_intf_clk>,
>>>> -                     <&dispcc_dptx0_pixel0_clk>;
>>>> +                     <&dispcc_dptx0_pixel0_clk>,
>>>> +                     <&dispcc_dptx0_pixel1_clk>;
>>>>                clock-names = "core_iface",
>>>>                              "core_aux",
>>>>                              "ctrl_link",
>>>>                              "ctrl_link_iface",
>>>> -                          "stream_pixel";
>>>> +                          "stream_pixel",
>>>> +                          "stream_1_pixel";
>>>>                assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
>>>> +                              <&dispcc_mdss_dptx0_pixel1_clk_src>,
>>>>                                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
>>>> -            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
>>>> +            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>, <&mdss0_edp_phy 1>;
>>>>                phys = <&mdss0_edp_phy>;
>>>>                phy-names = "dp";
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 

