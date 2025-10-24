Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BB9C069FE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 16:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FA610EA9B;
	Fri, 24 Oct 2025 14:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hf4JTpxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA1410EA9B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 14:10:45 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OC9cAs021671
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 14:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2EwzhNU0hLrCYQoy/rgZGyJrIlbbka4ufJYL4tWLm4g=; b=hf4JTpxp6ZTNoAXi
 KJP8KxE23HU7Aw7/yQWj6QU0lRdhrQ+QV1hgrZ5bIuHt//DhIHGJkztLNevie8sQ
 Alugi6oMfJhQCJCN38YNrEKZYdf7zvbsAP33Tz9Z7MqocwpWncq2c/8qkf0XBbYP
 kx01T4wZhfV1pYsywBtyfbuQOChFuEyIery3QgrAfWXXNchXCSmqSHOz++gQDWIP
 hwEkiZSFM8oJbk7Z8XAkJip2LZs2H69effn9DdKtgytwf73cK7X0OAAD/VpLDV/y
 SJcVpFbJXmKn1Z8x0nt6xhcRTHLXffW8kkol+Mnas4QjB6T2aV7dXqAr1ibn7iLM
 tI1Vag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8pefp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 14:10:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-277f0ea6ee6so19369985ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761315044; x=1761919844;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2EwzhNU0hLrCYQoy/rgZGyJrIlbbka4ufJYL4tWLm4g=;
 b=PfLCI93vKqqcYqd8yEWbKgh4/IK3HnuhcT5thqcM2A3iYdjPl3wK5UfV1inIny6eHu
 nZCsN6k/DLWSBz/ASUg8diOWqaqgo3WZBhPXr0njVXTBhNEq/hrcc+wO4/Q1AOD0jVcZ
 /QenUKKj059rv93h4RSR05gPJO45TXId7X+AlNCDhEe8qzTbtSlmYQznok2X5O/GfP61
 qSjElFMSCmV8cZ1UzEVNUFYxxWiDbL914PEKi81XGIQLoprh+7QXlQfW/1uapdO4zmab
 nTYzgsYxvNjazlfFNdVwQqZGvHeRmYBnu0L1qNjig1M7/IvoQJ+ZcNzl2AhXY/1SP2tr
 qS8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZxiG7dVO58TlMxXRN+4E6Zq2NfKmZnvg1bUOLG73suqaNMDrZcFqzU7QG0BeEbBMXYGjblgXrxqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxKY1ylkGgEXx0MMKQijI5GTiPqBvjK/eTw6HuKIPbLqwpEv2X
 tWiuu4IStPO8rCJCkyGdDEkGbp0SSgP+t6sFxMbWN6KWAT6/nppN5I/noqixqVhQkT1aJO63FM4
 4BUrt7w8cdLaztqezdutEm8l87rVSrDxu8xm2KKS7np7eeYL+OIOVdGy08xsQapAcFrtX6cA=
X-Gm-Gg: ASbGncudcMo0DRiJjw9M5O9fuNowTbFK/NZXVyvjNMZWolNhD7CU5xC6yLVIPj2z/h5
 63XSbu0iyxg9npAFrX46qauW4J0bZZUPYPD5zUKU+PhQQcp0ae/OcuU2ydqhodIW49HD2E3DFK3
 Jp0hzQvOAkl+HXolgaW4ANhT8WFU//c3wKAv7ypaAwEPRiTmYSsUqywTVwMLUuTwxG24ezFL79T
 FinACy69uH45YmrMtWK6KB2VLU9eHNxxBusHQWr4wfe4g5SODnTyAFGs5ifWAjuLr5R2BMt44DU
 JxoXZGHBHMABZc2jIK/rsP5Kf323gI23TTxxSomRCEyyzt6S+JdCSXzyC739KmwH7VZAFIQzO/L
 jvlbdtp9ZBs5163dTNL0i7A==
X-Received: by 2002:a17:902:dac3:b0:273:7d52:e510 with SMTP id
 d9443c01a7336-290cba42370mr374643255ad.58.1761315043564; 
 Fri, 24 Oct 2025 07:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCxbxbl89eRys7AEmR9vsf2AEBuj924PXVSollg/7tpRp2GR8BpHCrwzGDrKdCguLCpt+ZYA==
X-Received: by 2002:a17:902:dac3:b0:273:7d52:e510 with SMTP id
 d9443c01a7336-290cba42370mr374642585ad.58.1761315042915; 
 Fri, 24 Oct 2025 07:10:42 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6cf4e0a43asm5250189a12.27.2025.10.24.07.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 07:10:42 -0700 (PDT)
Message-ID: <c7334b38-3d6e-4fbf-a385-40551fbb7c93@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 19:40:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: display/msm/gmu: Document A612 RGMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
 <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
 <181af756-09a1-4694-98c4-53cea556e172@oss.qualcomm.com>
 <ff37b635-b3dc-4180-8eae-e798ef6ce55a@kernel.org>
 <f677f8ee-d635-4131-8ee2-8ca6ead43095@oss.qualcomm.com>
 <qcs6y22hozfmb2ipmahfw25m2xti2gr5kjn43c2woiueqe4xmd@ovnrhwibhhe2>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <qcs6y22hozfmb2ipmahfw25m2xti2gr5kjn43c2woiueqe4xmd@ovnrhwibhhe2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1wElLfp_gXyG7zRCingUBptif3Cj46z7
X-Proofpoint-GUID: 1wElLfp_gXyG7zRCingUBptif3Cj46z7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX7KP1mLEgFzaW
 4lZaw4krC1tFFgCq3shpUPQIFARqnJCrxHKmL30OgZ+fdWlgvmDdmAbmpqtLPSwhS+DelMek/nH
 z+HwP0AOrWPVbYgUiGDwwtSBCkPj4l15Ye57HMjAUzpheuEp+LKHj6jtawisu7cN/oZ+eZbvUhq
 t5aVXpsVvnvkndGxTw6X8wM3QKz/kkub1PDAYvLmlSAR/DT46ZCb3L8g6B1tXrEBLsNHLNrrez/
 fL+M9C5STbhrSPTOshiLeMfe6fMA2E2KK9p8/Y9OaykAxvFMBJ4+IrHIdndc9hmPUEutJLIG3zn
 beVv6jQ8ATsn4+n0TOvNRaKU+MC0tmCqYTKTSNcXUwcyJmbUfuVVQM7C6rveqUYBpzfReDEEJJy
 VimxxO94Q0t85o9KX6q6yheatTNuow==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fb88e5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V0jSdCJ6aHfz9AKaKsYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164
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

On 10/24/2025 2:58 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 04:33:28AM +0530, Akhil P Oommen wrote:
>> On 10/22/2025 12:49 AM, Krzysztof Kozlowski wrote:
>>> On 21/10/2025 17:51, Akhil P Oommen wrote:
>>>> On 10/19/2025 2:43 PM, Krzysztof Kozlowski wrote:
>>>>> On 17/10/2025 19:08, Akhil P Oommen wrote:
>>>>>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
>>>>>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
>>>>>> support. Compared to GMU, it doesn't manage GPU clock, voltage
>>>>>> scaling, bw voting or any other functionalities. All it does is detect
>>>>>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
>>>>>> it doesn't require iommu.
>>>>>>
>>>>>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
>>>>>> schema.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>>  .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
>>>>>>  1 file changed, 79 insertions(+), 19 deletions(-)
>>>>>>
>>>>>> @@ -313,13 +360,26 @@ allOf:
>>>>>>            items:
>>>>>>              - const: gmu
>>>>>>      else:
>>>>>> -      required:
>>>>>> -        - clocks
>>>>>> -        - clock-names
>>>>>> -        - interrupts
>>>>>> -        - interrupt-names
>>>>>> -        - iommus
>>>>>> -        - operating-points-v2
>>>>>> +      if:
>>>>>> +        properties:
>>>>>> +          compatible:
>>>>>> +            contains:
>>>>>> +              const: qcom,adreno-rgmu
>>>>>> +      then:
>>>>>> +        required:
>>>>>> +          - clocks
>>>>>> +          - clock-names
>>>>>> +          - interrupts
>>>>>> +          - interrupt-names
>>>>>> +          - operating-points-v2
>>>>>> +      else:
>>>>>
>>>>> No. Don't nest multiple ifs.
>>>>
>>>> I guess we should split this. I will add a 'required' constraint to the
>>>> rgmu constraints above. And apply the below 'required' constraint
>>>> specifically to 'qcom,adreno-gmu' instead of the 'else' fallback case.
>>>>
>>>> Please let me know if you have any suggestion.
>>>
>>> Maybe the binding is getting to complicated and RGMU should have its own.
>>
>> There is just a single chipset with RGMU and we haven't seen another one
>> in the last 8 yrs. So it is very unlikely we will see another one again.
>> So I feel it is not worth splitting this file just for RGMU.
> 
> I'd second the suggestion to split the RGMU schema. It's not about the
> number of platforms supported by the file. It's about the clarity. I
> think it would make the file easier to read.

Alright. If there is a general consensus, we can split out RGMU schema
to a new file.

-Akhil

> 
>>
>> Let me send another revision and let's take a call after that.
> 

