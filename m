Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D3A97CF9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 04:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E1310E3EE;
	Wed, 23 Apr 2025 02:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TUfww8r0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754A710E3EE;
 Wed, 23 Apr 2025 02:46:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i967022454;
 Wed, 23 Apr 2025 02:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QBc17faKJ6K4p30O50hPngB5CgYgGlP1byWsT9B2+Qk=; b=TUfww8r0ko4vf7hv
 iFWiR49J+7FsjAIZz7vQ7jIw03LT8vAI2SnEvSWQ2ZL20zhzJwQTcN6mDwMW9Xl0
 ab4nmuul7vN38I5ckHn05Sn5yHtbssp+3rQjZ21ZnM5gQPg72ZmGspYGilFmm6hf
 B9yCZKgfldZQPnlfr1ymTRO8uPvtNHPDNsUDhc+gOYD2KD2WhlBP2LNMDLwzH5e4
 Tb56DwpvO/4WR3dNCtixn/CMzTOZgS51/xTeDoy/kMOOvPLRklgvYY0F9og+bnTh
 vP12hasaYwZp5doqVOa43EoVtLmG6SXMas3iqbbB7oSOVMRDS+KdfaZb2yG3tJdk
 dUm9bA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh28mca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 02:46:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N2k3Zg017681
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 02:46:03 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 19:46:02 -0700
Message-ID: <50820e7b-b302-4f7f-baf9-778f3db6cfff@quicinc.com>
Date: Tue, 22 Apr 2025 19:46:02 -0700
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
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <39f8e20a-e8c3-4625-abb1-9f35f416705d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lBwNcjcylZDbjD8EfwL_FZS4-ICwBrUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAxNiBTYWx0ZWRfX4gRa0S9TyEKU
 oQVc68NTqZD/zhXuakzKjeXb9PcBb6WiPDfayGpjrWXSSN5366IsNo6hUuMrL3B691zRwvNh/fz
 xhoC0BR0MMaPxZnKWqaux1Sc0Lik3/KvpZ4vqrPvY1JRnKbUhyX4zVmdTVSx2qXL6Cw1E/TcA3z
 5GpWYgAahDtg6heEtZv94S1znVGykJ8gHENp3Jv9Jyo/6di9hTGVfQbFd07GNNQXy/o1+70rRdO
 ZVwpZs559+Ye/ULt6nCtIl/tF0s7LsFRm07PxG/qFxAq2rjrEIwgypjEZIwj+A5sGc7vGxMmxHE
 N/YKX9Muqw29cCaX2zZXQ/1q+zJFFLyH567vbYf6IIwZ+/YqsXAQfYOugdGuZNrNKvCOLHK0qyh
 GcypY6SAy07+dsWL5BAz6lBJGhPUn+TdHQ/srl9T/wgBBuIHi+VIV4H2dqV9TtCoGd07Y3jm
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6808546c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=Cgba1VvLZV1IDEsvZ-UA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lBwNcjcylZDbjD8EfwL_FZS4-ICwBrUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
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

Hi Krzysztof

On 12/3/2024 12:04 AM, Krzysztof Kozlowski wrote:
> On 03/12/2024 04:31, Abhinav Kumar wrote:
>> On some chipsets the display port controller can support more
> 
> Which chipsets?
> 

 From the current list of chipsets which support DP, the following can 
support more than one stream.

qcom,sa8775p-dp
qcom,sc7280-dp
qcom,sc8180x-dp
qcom,sc8280xp-dp
qcom,sm8350-dp
qcom,sm8650-dp
qcom,sm8550-dp
qcom,sm8450-dp
qcom,sm8250-dp
qcom,sm8150-dp

So do you also want all of these to be added in the same if block as
qcom,sa8775p-dp?

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
> 
> Missing if: narrowing this to 5 items for other devices.
> 

OR would an else be better?

+    else:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: core_iface
+            - const: core_aux
+            - const: ctrl_link
+            - const: ctrl_link_iface
+            - const: stream_pixel

>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sa8775p-dp
>> +
>> +    then:
>> +      properties:
>> +        clocks:
> 
> Missing minItems, otherwise it is pointless.
> 

I thought that since I have already specified the minItems as 5
in the clocks in the section above, I need to specify only the maxItems 
here?

    clocks:
+    minItems: 5
      items:
        - description: AHB clock to enable register access
        - description: Display Port AUX clock
        - description: Display Port Link clock
        - description: Link interface clock between DP and PHY
        - description: Display Port stream 0 Pixel clock
+      - description: Display Port stream 1 Pixel clock


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
> 
> Missing minItems... or just drop, it's not accurate or not even correct.
> I can assign 4 clocks, why not? Or rather: why do you stop users from
> assigning 4 clocks?
> 

Sure, I can drop this.

> 
>> +        assigned-clock-parents:
>> +          maxItems: 3
>> +
>>   additionalProperties: false
> 
> 
> 
> Best regards,
> Krzysztof

