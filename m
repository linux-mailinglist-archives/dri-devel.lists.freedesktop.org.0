Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F542B4AB93
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25F210E22F;
	Tue,  9 Sep 2025 11:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="isSJbq0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FE710E22F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:21:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LS0Y030478
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 11:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HIY+rDS/Ojh2ctDZQPuEjHteQ4Q9hFu4Pzq36e8Lb/g=; b=isSJbq0uSQPg7bI1
 J++DRhdfA1wMOKF8wC6+yo/pPFQu3k4CDwUcXSoc5ObmLQXl9E70sk4RKnMFIGOc
 olmaXQZVPuuXBaefCSMrROSjUV7kmskNtYCTgigLdAtrq6xWYz9LRwOH3HSrvZWQ
 4GHVfkxuzav8yKD9+689rK8hMQ/0DMmNoZXAzq/q55n02/QZU/qq71qqFispxdQL
 IRa/n2AkajKGlR/tHHG6ujXwZ5E4dkK1o8DgnvnxLHk3D9kklXWlPfRldA34IBkU
 vVXxSS5eoIDnNoBlexLLMQexZ4T61Z2+ZRJx2JSxwPv3GKtpCN5adCIrsTLxN+Cj
 d+oCNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j83vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 11:21:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8047fa66c98so135060385a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 04:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757416883; x=1758021683;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HIY+rDS/Ojh2ctDZQPuEjHteQ4Q9hFu4Pzq36e8Lb/g=;
 b=xKHsJvwzpte4LLapsnsm2/vpRqpZ5FIRnuzvOBXj3Ic+wRkwt+AZu68QbfYSLEPcSU
 Wrei3zOL1lkoJfx9evi+O6J+zQcgdHknxzKiTCM6U937RbwTNLhnKPNRNDp/1D6j/E0z
 VKCEOSptV7l6izDnSBvGFwfQ/7UYJfrFQpr92G1gPPI+HLwI8NGZboOvz2VzH6ZvSNCX
 K/+IyKrOA7phsRkJgqB+1UZJylZOhz1w9ubCuditOsGxzx8b9vMYeFbybepIMsyygcwi
 hlxXJyGxFFrCPz/bnUkfUXgQjrqzA6Unc/hP4BhETXub0MYv0GCYqMKvhhF7cJX8KAit
 A9TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiFwTWfzpEUOhPnGeiyz1axbh4AC2Yos9A8Icy/m9srLk9Ghx3i4Xwo6hwuiP/7eChSkkDoppUE2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzwa3+M99CoxHmAb1Z8cM9mZoYllSGuhExiyLESQyaAKd2l3S+0
 yD6Wzd9m4g+CI5M5T/62FqgIC2uSyWCSh8O4BX0OJiL9Q1JyKaIcp1kNU1LnB3NwnD+ICouMBRn
 EeupsSL+zcZ8/DKae5PYJNSClUVw4tUELJ2muEVf4cApeEPQHKAAiLYNIC1QJDEYbsZf8Dpo=
X-Gm-Gg: ASbGncu20FVi8X1SzpZrtMjQNnRx3kWgjlvnZSvwCRhejFwFoqEwBGCB6R42CGzK7CQ
 IyNPFBCLG5YD3QPVrHErUyF42w4acFZO9qHGGt766D1q8KJcWunyKMLwPs9iVuU4T229dvKFIyz
 8YhWtnMP8dWsu4rnofQudJuBDx/NWaWJvB4qIzJwE8K4thZ19ZgJE4ZQKLr4GYWi/RcEWtI6t1o
 VI62fm3n+LixeIYG/DOaEdogsLWbC80XjcssG2Q/0iuRPQ6lBmcn61k3Ag5O6nroWfxtARUIOEp
 v83xn8FFWDT5KIQFYQlwJ8gxMykU8hLjhUIof29skk9kLxVcn6sg7hqjnz2zozlo8GUAsNmWRIU
 RIcNsPHzlEYtxeHCt9jYMbA==
X-Received: by 2002:a05:622a:488:b0:4b5:f0d8:c265 with SMTP id
 d75a77b69052e-4b5f83570d6mr84969831cf.2.1757416882872; 
 Tue, 09 Sep 2025 04:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqTKupwZi6BVen7gNsper3VxyomXaAVS6ZWiqIWE5W+J094ukf4dWiZ+B5kiS4EVU2QEVOjQ==
X-Received: by 2002:a05:622a:488:b0:4b5:f0d8:c265 with SMTP id
 d75a77b69052e-4b5f83570d6mr84969561cf.2.1757416882146; 
 Tue, 09 Sep 2025 04:21:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff08b86833sm2622560666b.48.2025.09.09.04.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 04:21:21 -0700 (PDT)
Message-ID: <da984d8f-85ae-44cf-8de4-208bfc9e292d@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 13:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
 <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
 <14d58c6d-ca20-4349-8031-9906a4539fef@linaro.org>
 <c25kbb65aijgolxjzunydvhupt774pfmbcz5lvfvl5f74rrxtr@vboh347gdvdp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c25kbb65aijgolxjzunydvhupt774pfmbcz5lvfvl5f74rrxtr@vboh347gdvdp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX1WEU2s3iCV/M
 tWXYHLlT3Io11Npuw74sZTybYZQotGXxaTsK3bW0u4QAdG+y4QRWkx8pBqxQ1amT53iXV0k037v
 Enu5Rl2Bp7QjwRXus9Zv3m2jL/vhX+gR5U2N8mRb8emFF615nBeuZgBgK3+CJ47Fdq3pOKHE7LW
 Y3VzrO3vlspiIbbFFkyEl9LcRGf7cC65JPqQLJXaIxki4yC4uqRgI4wvitLZOgGCUr8n+1B33LK
 2i3aWazGIQeGigvYKlGuzHirX91ZJtr2PFc4VJS5HU41SFgx2CB1TfjpQITQkP3bW6OPB5wk9KT
 UJ/5Zs5a5WaNoq6CltQhoph5AxhMm4CRE2gSWNeT46ZJwtzJkaUVNgm0ZCllB4WeekIm+emfwRZ
 QQb482ys
X-Proofpoint-ORIG-GUID: nsS_NhH0JxB2eZ_kbnW4YGl4iTMSk8zW
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c00db3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=iAPsCBKfci-S516yzPgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nsS_NhH0JxB2eZ_kbnW4YGl4iTMSk8zW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
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

On 9/9/25 1:16 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 09, 2025 at 09:14:49AM +0200, Neil Armstrong wrote:
>> On 08/09/2025 23:14, Dmitry Baryshkov wrote:
>>> On Mon, Sep 08, 2025 at 03:04:20PM +0200, Neil Armstrong wrote:
>>>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>>>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>>>
>>>> The routing of the lanes can be:
>>>> - 2 DP + 2 USB3
>>>> - 4 DP
>>>> - 2 USB3
>>>>
>>>> The layout of the lanes was designed to be mapped and swapped
>>>> related to the USB-C Power Delivery negociation, so it supports
>>>> a finite set of mappings inherited by the USB-C Altmode layouts.
>>>>
>>>> Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
>>>> connector, DP->HDMI bridge, USB3 A Connector, etc... without
>>>> an USB-C connector and no PD events.
>>>>
>>>> Document the data-lanes on numbered port@0 out endpoints,
>>>> allowing us to document the lanes mapping to DisplayPort
>>>> and/or USB3 connectors/peripherals.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
>>>>   1 file changed, 58 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>>> index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
>>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>>> @@ -81,10 +81,67 @@ properties:
>>>>     ports:
>>>>       $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>>       properties:
>>>>         port@0:
>>>> -        $ref: /schemas/graph.yaml#/properties/port
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>           description: Output endpoint of the PHY
>>>> +        unevaluatedProperties: false
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +          endpoint@0:
>>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>>>> +            description: Display Port Output lanes of the PHY when used with static mapping
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +            properties:
>>>> +              data-lanes:
>>>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +                minItems: 2
>>>
>>> Nit: DP can work in a 1-lane mode. Do we nned to support that in the PHY?
>>
>> So the PHY already supports 1-lane, but the QMP Combo only supports
>> mapping 2+2 or 4, but nevetheless we can still decscribe 1 lane in DT
>> int both in & out endpoint and still should work fine.
>>
>> Do you think this should be done now ?
> 
> Do we support it in the PHY hardware?

I don't think the PHY cares if it's 1 or 2 lanes

Konrad
