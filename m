Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C6AC0184
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 02:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9A010EA7A;
	Thu, 22 May 2025 00:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pX7qLKNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C93B10EA7A;
 Thu, 22 May 2025 00:49:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI33N0020978;
 Thu, 22 May 2025 00:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E4n+yY9G+hpZCjGSQSEoCecbGc77mPtuOUGmJCXO2Yk=; b=pX7qLKNifY6+G2Af
 9cJLPyPuJuA9oMBaBn/uKLlV3li8b1Y/cfjtueJymGwJRJKSCHMGly3YoZHbsSQW
 SKQoVkNqOA5hrz+f4p4DG4dM3F6FgDM/opkgkbPU8Ps9FUmjp5uN4UJmcC7TbXC9
 EdVgFdJ5RrMFP0h/p+gwI0ZblvIqZT/BTMCpSwJg/XdMVOS3NFGZ3P7F9PzJg+IQ
 wPqmHY6BsgEXFmCaJjgS+2+GSfAUD8O2P7iYHrAbEXu2ZtwqdupQ9t2I2JsJE1Do
 Ag9pYyvVg8I1NPYMo/KIgEWS5odmI2K6DyJhHs39S4fEmnHPc+X0C9aIiJL5IhMf
 uKa3SA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf04pjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 May 2025 00:49:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54M0nPLI003984
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 May 2025 00:49:25 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 17:49:24 -0700
Message-ID: <049d9ccd-f313-4eef-9694-5e805982a754@quicinc.com>
Date: Wed, 21 May 2025 17:49:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: add stream 1 pixel clock
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
 <39f8e20a-e8c3-4625-abb1-9f35f416705d@kernel.org>
 <50820e7b-b302-4f7f-baf9-778f3db6cfff@quicinc.com>
 <f7941d74-3856-4bd9-95db-0b7f09eb07fd@kernel.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <f7941d74-3856-4bd9-95db-0b7f09eb07fd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9nMS-tCBBYXoXO0ddtveeosOItY_9TEN
X-Proofpoint-ORIG-GUID: 9nMS-tCBBYXoXO0ddtveeosOItY_9TEN
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682e7496 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=fVyq4P6jECAiOkGLdwwA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAwNSBTYWx0ZWRfXwR4Ez9KSzpaB
 YxtfghaQgahK+jJ+N3iLl/bnkBqGj+zjBFqoz7I7eCjfn8LODngJAvREyKluu5lRKNvxeqqevrx
 ba7wPMVBZ165n+zgiCdeOSV5t8sQLeF3aEa3GF5zW6hH3dFrrrJljhTfbqE1QBmQav1qE27UJh4
 MK3P5GCwRoQqbBOoB9bYTrkMi+O+yij7Uir444B2YTzOmQVv73F48rdE2LWBuk83ZIh9kbEY0qv
 l7IHU6Bgis8MBQEaofvdKoFsNLJ+or98OWTDhvWv5mpd32dw5rMuQdhdFdjgIcKb2ixwqJ3lqI3
 GggHgoReyP4glIQqElzhnBxdc1PBLegush+pYf9l0acy+BMCLbYGXEELeZSJ8rwW4/uuQuYnJ42
 r9D2WUQFNHttcDFL1uqSXsnGcmiYKIf8FRNxYtA48jC1uEs3NWzWWYYZyC0R6onaK1JO8kTW
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



On 5/7/2025 11:18 PM, Krzysztof Kozlowski wrote:
> On 23/04/2025 04:46, Abhinav Kumar wrote:
>> Hi Krzysztof
>>
>> On 12/3/2024 12:04 AM, Krzysztof Kozlowski wrote:
>>> On 03/12/2024 04:31, Abhinav Kumar wrote:
>>>> On some chipsets the display port controller can support more
>>>
>>> Which chipsets?
>>>
>>
>>   From the current list of chipsets which support DP, the following can
>> support more than one stream.
>>
>> qcom,sa8775p-dp
>> qcom,sc7280-dp
>> qcom,sc8180x-dp
>> qcom,sc8280xp-dp
>> qcom,sm8350-dp
>> qcom,sm8650-dp
>> qcom,sm8550-dp
>> qcom,sm8450-dp
>> qcom,sm8250-dp
>> qcom,sm8150-dp
>>
>> So do you also want all of these to be added in the same if block as
>> qcom,sa8775p-dp?
> 
> That was talk in 2024. Entire context is gone if you reply after three
> months. I do not have even that emails in my inbox anymore.
> 
> Probably I expected commit msg to mention at least some, so everyone
> knows which chipsets are affected here and one can verify the statements
> from commit msg.
> 

Sure will do.

>>
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
>>>>    
>>>>      clocks:
>>>> +    minItems: 5
>>>>        items:
>>>>          - description: AHB clock to enable register access
>>>>          - description: Display Port AUX clock
>>>>          - description: Display Port Link clock
>>>>          - description: Link interface clock between DP and PHY
>>>>          - description: Display Port stream 0 Pixel clock
>>>> +      - description: Display Port stream 1 Pixel clock
>>>>    
>>>>      clock-names:
>>>> +    minItems: 5
>>>>        items:
>>>>          - const: core_iface
>>>>          - const: core_aux
>>>>          - const: ctrl_link
>>>>          - const: ctrl_link_iface
>>>>          - const: stream_pixel
>>>> +      - const: stream_1_pixel
>>>>    
>>>>      assigned-clocks:
>>>> +    minItems: 2
>>>>        items:
>>>>          - description: link clock source
>>>>          - description: stream 0 pixel clock source
>>>> +      - description: stream 1 pixel clock source
>>>>    
>>>>      assigned-clock-parents:
>>>> +    minItems: 2
>>>>        items:
>>>>          - description: Link clock PLL output provided by PHY block
>>>>          - description: Stream 0 pixel clock PLL output provided by PHY block
>>>> +      - description: Stream 1 pixel clock PLL output provided by PHY block
>>>>    
>>>>      phys:
>>>>        maxItems: 1
>>>> @@ -175,6 +183,30 @@ allOf:
>>>>          required:
>>>>            - "#sound-dai-cells"
>>>>    
>>>
>>> Missing if: narrowing this to 5 items for other devices.
>>>
>>
>> OR would an else be better?
> 
> Usually not, although depends how this binding is written.
> 

Ok, let me try it.

> 
>>
>> +    else:
>> +      properties:
>> +        clocks:
>> +          maxItems: 5
>> +        clock-names:
>> +          items:
>> +            - const: core_iface
>> +            - const: core_aux
>> +            - const: ctrl_link
>> +            - const: ctrl_link_iface
>> +            - const: stream_pixel
>>
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sa8775p-dp
>>>> +
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>
>>> Missing minItems, otherwise it is pointless.
>>>
>>
>> I thought that since I have already specified the minItems as 5
>> in the clocks in the section above, I need to specify only the maxItems
>> here?
> 
> No, you need explicit constraints here.
> 

Ack

> 
> 
> Best regards,
> Krzysztof

