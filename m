Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C887FC5D05B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 13:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB76F10EA51;
	Fri, 14 Nov 2025 12:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gmy6jgL1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKKKrKVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7B910EA4F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:09:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8FgQF1745336
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 djlvIamP88uSWKSXFTFObQ/yFmQ+cxMViS2ZJbYqFJ8=; b=gmy6jgL1r3oJqfWf
 ibQa1kCUdPLuL4VMFepHhLaBfjvZpa8eMpz3v+if0kBFITxG/vNa0v+nlS0VC/6D
 /eUy+IH/zbwKRy11hMJVGRrHv+sueqZJmQ7D896lFEfzI6jKSH7tw/7ZdLWKmKtI
 zmHnqttfM8hiAZbJRfd5MlqJ1NZUq2gIBjoXqnZVtHCEu7JKJAM5QD+mq3nrSHxu
 T+zhvL3TjLPzhFtI516ZCXR0EBV1B3woKb4s/0HcnfvQOEMZsDmU3BilfIaMMT+9
 uHFgqt9EgnUKDc3yepHbQ6mDF3cK2314LqadLRjF/y9qkflqb4gaOksTe8KamJRe
 nljxiw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ej3s5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 12:09:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-295952a4dd6so37534395ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 04:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763122141; x=1763726941;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=djlvIamP88uSWKSXFTFObQ/yFmQ+cxMViS2ZJbYqFJ8=;
 b=cKKKrKVMk+7FF8MsUFAHTGhemjhvLTBBTpZYKVY7qtYNx4RaHIEoVPBzWa9bstMGNE
 +tZVYEC7IuN0C2sUqj8T5AokYJoioaGifezJGedgs3Cy22ZvoG8WfovrOk9Falc7vm3r
 W59lJTaG4L/oyyiNiXDXrq+i0RiAKhqzkWjkzI0Yt1PHE6Q0tIVCShBuSVDYRLeGfiNV
 c4QsHisMqAxI3s6mrKWVb30q605AXs4GCC4DjofFdc8vLyAVA9DnJUBnUlM5tjombib2
 zb6+uiqTVst+llIWRJFIENAMYCt4r3xPuBvXe2+QuNU2o7iSJDEUP4/hNKszueDg8M08
 o6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763122141; x=1763726941;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=djlvIamP88uSWKSXFTFObQ/yFmQ+cxMViS2ZJbYqFJ8=;
 b=fhmzJWiT9p84CL3jdQGSdYjrExAK0KN8jdjqYQ0cKUP5eEBYngPZ9m2YhUxmHd8+y6
 4vau6/Eyd3yWw6Kbde8tfG+t82paG63Fm0hBAvxZXlUTG+pq6F7ZUzFXlYrHBdCQEPtF
 SfG4p/oKfmFpD09YkxLojTj8gMyMDovbQXPC6k+Uc/UPypN+7HOXG+JtyJO4yVfVg/08
 SWjuDWQX7zujX2Kt31rKWqR5wPXMTO9mOJnFCS2ElgsCLvxwdeYD91mqsqeI/Q594Gti
 wxF0Ef+Y4NHS+ARnpMtSJT9dNB9o0RRk1NrMOv5xZ0ar48QU1iUDcJ5ljc/DE9T4Kdfp
 Ni6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcser5JhChJ2hQMhc7O2y2zWKeV7hNCxL47mpG9CZa5fbiS+IMWpUNinHtpwW16aT4+FOCxFGhz7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYMqrTLMtMAf4El98cRQAULOzR4ggRVTK3P53z37Xi41CCTqev
 fQEFEPwymh1JKRGfQJrm+5O701pq1xG0Qd5T/5QnN/LuM4mQGJEFuuoPHaWdAg1FHIh4P+mZTFC
 NP3QeUpyiAEKXezLWSo8nAFgylE4m6M99QcCFG+cTzgfYmZf1Vg1KhSeE9FfEWPCszzOcZTI=
X-Gm-Gg: ASbGncsAChMsPxgwJHOV9bmbGTKZ49P/kKWZIK0sZaxB6hp/yCVhaY6K24o96DgTixP
 Ngv17rCX5VTX+qJTXmH40g89qYjN63cD61H122y5nThHpU1bKAmR2mJR1x4EUXoMZgDULNq3ee8
 oZyUBi/o74LnmQooQeej8s5H8kvFl1SXsfqvAGtOFiCb696hc4jvgitMoBmyGYxgKMF0MhdbErz
 GLYm5smp9fjAwjEMFzrCEfFrcMPk0FtG5KnGFbU6FLFWnBDzIM1QS9A8kITGTB302tV0EdjACQe
 EGsX4qAFte38TQrKQLwGl598ctIMU052M0jZ9Q5Bwwm1J7augD8ecKqvH6FgZyHAeyiLa7QMJN9
 NXzn/02ftLkG9f53LbKQyVEU=
X-Received: by 2002:a17:903:249:b0:297:f527:885f with SMTP id
 d9443c01a7336-2985a40c7c7mr86057035ad.0.1763122140875; 
 Fri, 14 Nov 2025 04:09:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSRcXduJStRkEjpIaI8wBB1y+r2W3c+GWZP9UFC0BdilfKeLYl63dIZH4/YZaDyD3wEO6ndw==
X-Received: by 2002:a17:903:249:b0:297:f527:885f with SMTP id
 d9443c01a7336-2985a40c7c7mr86056405ad.0.1763122140280; 
 Fri, 14 Nov 2025 04:09:00 -0800 (PST)
Received: from [192.168.1.8] ([106.222.229.203])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b921cb6f44sm5156759b3a.0.2025.11.14.04.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 04:08:59 -0800 (PST)
Message-ID: <e0e82b22-ecef-4136-834b-ea4a6b00e179@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 17:38:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: display/msm/rgmu: Document A612 RGMU
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
 <f08c8707-eb72-4689-b53b-acd6e3218836@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f08c8707-eb72-4689-b53b-acd6e3218836@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5NyBTYWx0ZWRfX0f2xHnBlkFKM
 Qwp6J+nTRllbW4307233b1S7643Lu+Zs6SycVm79/OFo5N5dHtUv/WvTr9bTO4sVBzwNWzZMTxT
 u2IWW3u7oDlP9pjLj9dMyUobQgVUCh0iMPTs9Br1zJqDpuycyps+OCUAzzMSTAsjuxY6PtZGDFF
 YeBSZEsstHvNGapZdqzKDxSKBll6RMycozwab57CS3DgEXln6IEOiPAPPUAGYwD/Nko+eu0kwJP
 8cXMx0qQUroxEGhrD+hM2RkPnRooI+hQ1E1+2NTw3bSUhliH+GUTRZfGB1PihTgRKqQ6sDxATQd
 NHUAISdYg0Jl6BhMj39C0Im/OFfPOPZ1qTD7tKVinsVKwX1Lzbxcxf97aP9LzlhVvO3z1S+sj0s
 SD1i74F9W3xX7d1ooqf+dW5dYLe1wg==
X-Proofpoint-ORIG-GUID: Q17VVhH8kXWEy0DXXAQzNgKpX9hZEFc0
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=69171bdd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=UUXEStRZTiKyGgBwSCQbmw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8
 a=VxizJ4rqJv6xgcLMcuIA:9 a=QEXdDO2ut3YA:10 a=bFq2RbqkfqsA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a1s67YnXd6TbAZZNj1wK:22
 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-GUID: Q17VVhH8kXWEy0DXXAQzNgKpX9hZEFc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140097
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

On 11/14/2025 5:30 PM, Akhil P Oommen wrote:
> On 11/10/2025 1:21 PM, Krzysztof Kozlowski wrote:
>> On Fri, Nov 07, 2025 at 02:20:08AM +0530, Akhil P Oommen wrote:
>>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>>
>>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
>>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
>>> support. Compared to GMU, it doesn't manage GPU clock, voltage
>>> scaling, bw voting or any other functionalities. All it does is detect
>>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
>>> it doesn't require iommu.
>>>
>>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
>>> schema.
>>>
>>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++++
>>>  MAINTAINERS                                        |   1 +
>>>  2 files changed, 132 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/rgmu.yaml b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
>>> new file mode 100644
>>> index 000000000000..7621556477d0
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/msm/rgmu.yaml
>>
>> Filename matching compatible, so qcom,adreno-rgmu.yaml
>>
>>
>>> @@ -0,0 +1,131 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> +%YAML 1.2
>>> +---
>>> +
>>> +$id: http://devicetree.org/schemas/display/msm/rgmu.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: RGMU attached to certain Adreno GPUs
>>> +
>>> +maintainers:
>>> +  - Rob Clark <robin.clark@oss.qualcomm.com>
>>> +
>>> +description: |
>>
>> Do not need '|' unless you need to preserve formatting.
>>
>>> +  RGMU (Reduced Graphics Management Unit) IP is present in some GPUs that
>>> +  belong to Adreno A6xx family. It is a small state machine that helps to
>>> +  toggle the GX GDSC (connected to CX rail) to implement IFPC feature and save
>>> +  power.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: qcom,adreno-rgmu-612.0
>>> +      - const: qcom,adreno-rgmu
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: Core RGMU registers
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: gmu
>>
>> Drop reg-names, useless for one entry with same name as the block name.
> 
> Just to confirm, drop only reg-names, but keep 'reg'?

Wait. We should keep 'reg'.

If we remove 'reg-names' here, we cannot use reg-names in DT too because
we are setting additionalProperties to False, right?

-Akhil.

> 
> -Akhil
> 
>>
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: GMU clock
>>> +      - description: GPU CX clock
>>> +      - description: GPU AXI clock
>>> +      - description: GPU MEMNOC clock
>>> +      - description: GPU SMMU vote clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: gmu
>>> +      - const: cxo
>>> +      - const: axi
>>> +      - const: memnoc
>>> +      - const: smmu_vote
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description: CX GDSC power domain
>>> +      - description: GX GDSC power domain
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: cx
>>> +      - const: gx
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: GMU OOB interrupt
>>> +      - description: GMU interrupt
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: oob
>>> +      - const: gmu
>>> +
>>> +  operating-points-v2: true
>>> +  opp-table:
>>> +    type: object
>>> +
>>> +required:
>>
>> compatible
>>
>>> +  - reg
>>> +  - reg-names
>>> +  - clocks
>>> +  - clock-names
>>> +  - power-domains
>>> +  - power-domain-names
>>> +  - interrupts
>>> +  - interrupt-names
>>
>> Keep the same order as in properties.
>>
>>> +  - operating-points-v2
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/qcom,qcs615-gpucc.h>
>>> +    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>> +
>>> +    rgmu: rgmu@506a000 {
>>
>> Drop label.
>>
>> Node names should be generic. See also an explanation and list of
>> examples (not exhaustive) in DT specification:
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>> If you cannot find a name matching your device, please check in kernel
>> sources for similar cases or you can grow the spec (via pull request to
>> DT spec repo).
>>
>> Best regards,
>> Krzysztof
>>
> 

