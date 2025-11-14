Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DC4C5CFA7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 13:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4261110EA4B;
	Fri, 14 Nov 2025 12:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5apUv9V";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Snj1zEnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1161610EA4B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:00:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8RRUE1424135
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4DLPECZQH/khWur4rvlzIHdP5Pl0LOj0uMKvz2Ew1/w=; b=C5apUv9VaA6lpaH1
 KO30AaVi2i0EK2Nu3MG2bkJLJFrYhZqBPgoNTW7dTeN0QLQV1+I7zmfnU+SkrObE
 tV83rBGTh6JZfPPKpttbgjqraycL5QQFBV/YrMAyxppb6WmOsIQ3UtqxF7Com/np
 rcjCmz4oZq01TSFjtWOHS532BRkJBC1D6fDA2CAFnppo78C3ssV5ucdkYkeLRuLi
 tolA71IlLJcHr5myTUie/ekSebgCbLjfQ/FsNREwSL6GTZKvB45Xqkgfd/ripkg5
 Mi516ps9eFFiEI7xUwEV/RuTC+KbmdqVFafagdTboq86JZos6BGIrIpgh2vHJ5eA
 5aDuwQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g21jf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:00:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-298535ef0ccso23480915ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 04:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763121640; x=1763726440;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4DLPECZQH/khWur4rvlzIHdP5Pl0LOj0uMKvz2Ew1/w=;
 b=Snj1zEnVaJ+Y1T28qdMXtcdM5J9iBfDnuwu2HiFtAurB6JIP7DKezbOBhlf8J/4Iza
 bmKyWMs8/v2UICFpnkJBgEe7GOPQ7ifjqN0z/ezu9I+K1/NQvilxN3pKqLCO0Jgdf9Fd
 C0W90rpCrle52zpv2nGA/ZJcr9Tp/SJxQO0nMGpFCW91o9A+efBmdh7vkC5pwTYbxdLg
 xxaBDc9AlIl7+mvxWhn8xhE/vne902dacQ58VpRPRADLtIwtFtejRaAVSa+dQD8xJvZm
 FEpeUYLiyh8KAqDkMT3+RyhYUxIvAg1Fe4e2+EbLmk8KK6BHzWVFUCY1skbcxoh5TcXi
 9DgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763121640; x=1763726440;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4DLPECZQH/khWur4rvlzIHdP5Pl0LOj0uMKvz2Ew1/w=;
 b=nIbXqfWc8/uggNaYBh6DDQzfloNIZ0lUFP9T1q3SW/pc6ruazUBxpIQQsr/tAf8wA4
 5FKmVImo13gK9nO5QuRBo1FwGYi70UVtaBVgg8bk1zUEzDftR/qEyHlh1yer9aj/pjMq
 GaBSWf1VKmORrx9hVMJhhTiGUk2lTWOyoT2IZFIzXjZTr9evwpMjjZpkQwtN0J5YUSxN
 9AlwqXn2Hx4Z6bvX9zqr4X0lYBS0TGmIvziX2+hHEbNc2GTMET3wCGNag6ybNPQBK/8A
 +K8WlnE+/K93IVFpIuPcsGMtf3N/3/bu7Q5RR+cUR5YV5RiFTv/rqAQS0J4Z0tU6lA1G
 Je6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOgyIbLDiyL47jeh1Xn1V1ZUc5CdIIvRpO8zeuiW2XBLNy/pofBC+uJ/epaqKt12e0pLhEo3cXZNY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywLFUCABqQpQK5kAGfINNmtxGNO0nYqCjLGiS4YQ4IklYe/F2w
 jlaNQR/YvAj6A0qvoW/tuKDrUYeZP7yYNs+FVG/ZlBSpzAHJYB5olWxcK4l/bm0Z6DPJLGpgP/q
 SEqTTRaZANpIatAvDLXh81+nqEDockTDnj7H6L6AVgLmMI3NhhVIP1gHZMBf5ZYqTTs02k6s=
X-Gm-Gg: ASbGnctVt9AZIfHcq1AtrXH62QaVYSuRyF9G3/SYQkdJHGnZ2Zd6LnEuXQVY/rIGC/U
 rsiP1fMKIlk/robs3SYiFnSXVPecr5rmySoifbVLs70Em3Ql09EeVENsmLIc03koYaaRLkz/ZGT
 GOrrEKyBLVpPN9pQ7JAiLFR3EoGg/yP60k7IodkjfGN6kPUbj/deDgN7Alonb6btZzzOArFM3KH
 zLD1USfGotF5Quu0FuPIWV5dDKkESGgXKzVjRMZQp0BsJYpLwLwmt2de1Bx4C931K36kAQLBYCg
 xp8YSoI+Ys7K9VJG2V2DYQj1BtXynjq9bdp/PiiInpYU6PV8iN+o48fkbwKbGlBiEmcE6tiMl/g
 raEMxrDIGd1r0VH0ADVNC7U0=
X-Received: by 2002:a17:902:ccc3:b0:298:33c9:ed9e with SMTP id
 d9443c01a7336-2986a73b6f9mr29953205ad.28.1763121638533; 
 Fri, 14 Nov 2025 04:00:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzUH8leg3cJEyWmO2f9+vET2WBdZoPDLVCWtrzI/9fMABfBAcZ6WIX9qxSZRR49c9MNEZAOA==
X-Received: by 2002:a17:902:ccc3:b0:298:33c9:ed9e with SMTP id
 d9443c01a7336-2986a73b6f9mr29952675ad.28.1763121637765; 
 Fri, 14 Nov 2025 04:00:37 -0800 (PST)
Received: from [192.168.1.8] ([106.222.229.203])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c245f8asm53328455ad.37.2025.11.14.04.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 04:00:37 -0800 (PST)
Message-ID: <f08c8707-eb72-4689-b53b-acd6e3218836@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 17:30:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-3-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251110-persimmon-wombat-of-holiness-6b3f9c@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251110-persimmon-wombat-of-holiness-6b3f9c@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=691719e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=UUXEStRZTiKyGgBwSCQbmw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8
 a=9x9RmpQyoqOX9MKIOEcA:9 a=QEXdDO2ut3YA:10 a=bFq2RbqkfqsA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a1s67YnXd6TbAZZNj1wK:22
 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5NSBTYWx0ZWRfXwxfokYN770h+
 SAJ2fP+nT+81PWGJ5wTfM7s4wS0r2HExEoUzmSIWByteacgWHU841rSdZgDqZqW5iK7dakKiHWw
 +N+cv1CafK8rRLNkm0RGyDvsfRFgWqurlmIP/CJ77/Kwqc3mx3IGRnjdtVzuhelew1jk7VnhPFo
 PV57/1Nm2Wsr+pvQx/6mjEzcAkBs8EklJtZWvhcgyr9Sqv8iBu23FxZK/dVBrvdJ2EVXuruxTkB
 lJ7DHdNpdRN5uDg7B+CtBbUAXYP2s3gUtRZ8MXu9j2tf9gtHGowNOqixG7jnrHztqOjK/q3y1LI
 E4NyfqAc/u098U2gFCA1BAWJyTSJV7jKa2zcXayYCfx90genQVnD8WUozpFYMIOmqettco7vVce
 2b1/vVCiEuNq0Fg/owmqW4bwn8q1hA==
X-Proofpoint-ORIG-GUID: 5SvAq5_BpXnBs7xy2urLrPYGF5fughyo
X-Proofpoint-GUID: 5SvAq5_BpXnBs7xy2urLrPYGF5fughyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140095
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

On 11/10/2025 1:21 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 07, 2025 at 02:20:08AM +0530, Akhil P Oommen wrote:
>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>
>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
>> support. Compared to GMU, it doesn't manage GPU clock, voltage
>> scaling, bw voting or any other functionalities. All it does is detect
>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
>> it doesn't require iommu.
>>
>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
>> schema.
>>
>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
>>  MAINTAINERS                                        |   1 +
>>  2 files changed, 132 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
>> new file mode 100644
>> index 000000000000..7621556477d0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
> 
> Filename matching compatible, so qcom,adreno-rgmu.yaml
> 
> 
>> @@ -0,0 +1,131 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +%YAML 1.2
>> +---
>> +
>> +$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: RGMU attached to certain Adreno GPUs
>> +
>> +maintainers:
>> +  - Rob Clark <robin.clark@oss.qualcomm.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
>> +  belong to Adreno A6xx family. It is a small state machine that helps to
>> +  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
>> +  power.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,adreno-rgmu-612.0
>> +      - const: qcom,adreno-rgmu
>> +
>> +  reg:
>> +    items:
>> +      - description: Core RGMU registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: gmu
> 
> Drop reg-names, useless for one entry with same name as the block name.

Just to confirm, drop only reg-names, but keep 'reg'?

-Akhil

> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: GMU clock
>> +      - description: GPU CX clock
>> +      - description: GPU AXI clock
>> +      - description: GPU MEMNOC clock
>> +      - description: GPU SMMU vote clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: gmu
>> +      - const: cxo
>> +      - const: axi
>> +      - const: memnoc
>> +      - const: smmu_vote
>> +
>> +  power-domains:
>> +    items:
>> +      - description: CX GDSC power domain
>> +      - description: GX GDSC power domain
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: cx
>> +      - const: gx
>> +
>> +  interrupts:
>> +    items:
>> +      - description: GMU OOB interrupt
>> +      - description: GMU interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: oob
>> +      - const: gmu
>> +
>> +  operating-points-v2: true
>> +  opp-table:
>> +    type: object
>> +
>> +required:
> 
> compatible
> 
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +  - power-domain-names
>> +  - interrupts
>> +  - interrupt-names
> 
> Keep the same order as in properties.
> 
>> +  - operating-points-v2
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    rgmu: rgmu@506a000 {
> 
> Drop label.
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
> 
> Best regards,
> Krzysztof
> 

