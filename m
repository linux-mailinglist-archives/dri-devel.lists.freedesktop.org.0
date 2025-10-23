Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBEEBFF3A0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 07:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBC810E87E;
	Thu, 23 Oct 2025 05:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Huv+d9x9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B6310E887
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:10:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIf1OM032198
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sVOpM0zB9ogMep4UsRUJ6puOQkqX/C+l4ebqHw8qJuw=; b=Huv+d9x9qZmGX2fY
 T1LYTYpdJeXxWqNhtzqeaYl/yFlffczKv/uNneHwMQIMjnOlSTn0CVGxeHn6np3w
 6HcqSdWW6tHPa9uLsB2fC4MB9FAEd8URbsJ2x7e8A0+V0SgwMkaIMTOIGQrAivZK
 fp/9qYh4pfTIIm1I6h+qJGJtLOTw4TkpB0x50vU/7HAyWa71yF0N0wtXshu9iIEn
 JoW6o1GOxOL5n4KiPaErGeB0piJJnSYvnlPlT/AhFcHhQNe40Qn4ZwWKrjYl627g
 3uN8RDYjSpBwoR7v0mEaDLvEu58J1VZCR90kcvHWuf8CjPTq/J639jT0YxHvXVJo
 9RQ0xg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge71yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:10:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8a4c63182so11499201cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 22:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761196206; x=1761801006;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sVOpM0zB9ogMep4UsRUJ6puOQkqX/C+l4ebqHw8qJuw=;
 b=ck8fMV4u49TMzect1GXnf5zKoUSyUSBqrhegdsmb8OdJBgmLMCNdyTpZTYj07WjaQ6
 iS5CZZwuQ5246Z+NmaHiE37tlzTeScye5YX5WJbi1Ki+ZhkVX3ISLxQ7n1IxnTMTPxIZ
 ITimPhmLzsHIQtIpsejL3QSbj9sZPyKDcd7iKoxNHLZkAV8gEARlb1b7H6JngzKmK9H9
 ekJAl8+Du4sXAWhI8s3vXsv6X9728QBy/lVRlG8A94CJaFYraUusYFagT/1PsoJLThuW
 3DrLlY73IaViIS9KVGl8teBhrXpg0oHfeRs1pzkBfpcGZJtQtN9pmmiuXsVci5+YwJpH
 ov+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMRjwnoM8SoTBtoXdpuyvgPF6WCo9zHEdnQCC0ZmUquTBIk+ZeC9EsnNZGX69qoCN5G+j2CyQXOjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/IQi6na4EuIG6LBGw+TyIgrmAL6OjYA9hRq+vY3dWWUZevVLa
 Qz+MLoFze+c1IiflJ8j5RT3pijmNm6vCl1+eZpFS9KBAIhn+Y3eOpqANESqDlWkDVeN5DekOJsG
 TUSg7MYWpTBmw/YA9RasmsrCIybUAmBy4EGsSr9K/iM6dRrHnHzh+Me3FmUMwT+5809dzNgk=
X-Gm-Gg: ASbGncs+pL1+/epnGdvgv+ovXt7978mERveNvOo30FxbRIZ+B5msixzQa90b8ffTuXH
 9xGNjDTVKY0YubibOP/9qTS/Acc12+xbLp/04K++DF+rufkALP0dM83fP9gDl7fcadFzNAe5Irr
 tQNJjIRWtG8K0878/r4DTuJwXGHGs1UlGBRVYOTWj+igM6Oe50x+LOjaZwgyw0cZp7d+Pluz1HK
 V8XvGJQlPHGYoA1BJQLP5wGAZCHGedcVTmA3Wlw5kXlJBkRmvN+3JNMwmpwAI1HwmmbSEtUr7CJ
 HPnOTPdAL35fiRnkiM6JMsdFdv97fdafmav7170LKh2nOOdnD8KMP3SzGp96rFKNSlGGw12K6N6
 Yp3ERJw/QmBYsVaNSqvulsprhujwjRAjNTy8cTFLYJCmKaP+T3otY4nh8QH0hzEeqaKh+C8mFkT
 YLow==
X-Received: by 2002:ac8:7d14:0:b0:4e8:a6c3:4322 with SMTP id
 d75a77b69052e-4eb815ad563mr17146341cf.68.1761196206345; 
 Wed, 22 Oct 2025 22:10:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElx1ZrpuKVGYGNP7kr8DERnwquHFSi9hHuZxhw/hdjJ0rZpVP7WqU0TbMz0+PNl974FTh0fg==
X-Received: by 2002:ac8:7d14:0:b0:4e8:a6c3:4322 with SMTP id
 d75a77b69052e-4eb815ad563mr17145901cf.68.1761196205810; 
 Wed, 22 Oct 2025 22:10:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d67dc50csm1785491fa.41.2025.10.22.22.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 22:10:05 -0700 (PDT)
Message-ID: <1a787fe1-20ba-42b7-a94e-cd1bf465f16f@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 08:10:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
 <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
 <8d4184a8-4e32-43ce-a487-a195e97fa874@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8d4184a8-4e32-43ce-a487-a195e97fa874@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX/r7LebhJnafi
 Xbp4KOXF3L0sAdv6nK2mzCh3JltSYor178Zw2mu2izMDYBsatDmHROcMG2F+qBKHCmFhIs4D5ML
 WgdklGuNhNtH19WuBqm0dDOcPqcpblAX+4iVJhWxh409CnfDPn5qEDmmFyfFqRQurtQoirG7O/I
 AdtbDiLvu1Uw2XMdf7horZQ8lj+lBv1CpkzqQwfv2SJOt6H+hN8xUkb/n8QB/tABbadPoyq3JFR
 RInYBUvUc+7C+MAvLhaHwwNc0WDUjomJqEU2SpuM4aO0tEstaS3dWAbVp42tAf056GL4g0UJFxY
 JTOmUwacgRl3F2tWCGoKv3weity0dYLIauOsbqbIYKOxHiTJWoFBkmLzh03LV9VOC6LAE+JZ847
 W746d70mwhA4uCczqP3iHXhleJgFEA==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f9b8b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=yyiXTTIM6uUZdMJXhTkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 6ZCq6ZOxdGKqIMFIsf8alIHp9HT_z94-
X-Proofpoint-ORIG-GUID: 6ZCq6ZOxdGKqIMFIsf8alIHp9HT_z94-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
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

On 23/10/2025 07:50, Xiangxu Yin wrote:
> 
> On 10/22/2025 11:07 PM, Dmitry Baryshkov wrote:
>> On Tue, Oct 21, 2025 at 11:18:07AM +0800, Xiangxu Yin via B4 Relay wrote:
>>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>
>>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>>> compatible with SM8350. Add the SM6150-specific compatible string and
>>> update the binding example accordingly.
>>>
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
>>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>> @@ -51,6 +51,16 @@ patternProperties:
>>>         compatible:
>>>           const: qcom,sm6150-dpu
>>>   
>>> +  "^displayport-controller@[0-9a-f]+$":
>>> +    type: object
>>> +    additionalProperties: true
>>> +    properties:
>>> +      compatible:
>>> +        items:
>>> +          - const: qcom,sm6150-dp
>>> +          - const: qcom,sm8150-dp
>>> +          - const: qcom,sm8350-dp
>>> +
>>>     "^dsi@[0-9a-f]+$":
>>>       type: object
>>>       additionalProperties: true
>>> @@ -132,13 +142,14 @@ examples:
>>>                   port@0 {
>>>                     reg = <0>;
>>>                     dpu_intf0_out: endpoint {
>>> +                    remote-endpoint = <&mdss_dp0_in>;
>> Why?
> 
> 
> Oh, I think I misunderstood the “messed up indentation” comment from Krzysztof.
> It seems the two-space indentation under port@X and opp-x is the actual issue.
> 
> However, that part was not introduced in this patch.
> I will split a separate patch to fix the indentation there.

Note, you have two different chunks here. The first one is useless as it 
adds a graph arc to a node that is not a part of the example.

> 
> 
>>>                     };
>>>                   };
>>>   
>>>                   port@1 {
>>>                     reg = <1>;
>>>                     dpu_intf1_out: endpoint {
>>> -                      remote-endpoint = <&mdss_dsi0_in>;
>>> +                    remote-endpoint = <&mdss_dsi0_in>;
>> Why?
> 
> 
> Ack.

Use YAML coding style (two-space indentation). For DTS examples in the 
schema, preferred is four-space indentation.


-- 
With best wishes
Dmitry
