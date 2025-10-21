Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D0DBF71C8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C30610E609;
	Tue, 21 Oct 2025 14:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJVCQzYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20DB10E606
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:39:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8LunH004415
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IYiRng46K/9s0YcunKwJaYrPPhduE6KoJmzcZ76VteI=; b=jJVCQzYwQGZ2K844
 iAMShQ/NzcPzQWK1iWtjhpn/v8B2BxbqzdaI46BQX8nO7+3oEImpKmQlHDN+L9pP
 zBO9E4kNaRdmEmslpv7FgUeMV9VL80gOUUwQ824W6+CRiypYnxvgzVH4brIWsOpv
 FihxEnberXZaEh9Nn8P+LxuLFpBHaeMnq0nz6dI74qjUcxP5AnFlNZMCl/MmPAdb
 QokuSTC/9XbSJFBGgd87imZFRQi3BWy6lxtgc3FNOedJEfzSUl3MU8yRrvmHIPUG
 +zKgY05LUKcdGB1T0+ZSXLaN36XB6D91LG5LcNWiMhCL/WhuffI4Qj3oSbj2vwO9
 mYDJBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfh1p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:39:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-28e538b5f23so63208785ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761057558; x=1761662358;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IYiRng46K/9s0YcunKwJaYrPPhduE6KoJmzcZ76VteI=;
 b=X0YGvYo1ES7WvMQOxCAE6/qjhXDJXmCq8YtlnRVcZPdEJENjUvautCD0aweXHBHOBq
 iiBoSYB8XWvSpcKnC1qPpsEnaWkm5A/7/q7G7gJ0as7HIjXKSKC4Gv6KJlaDQwEnFNUR
 6NKwEqLSvlamTLjoVA1TQy4SJPKTRjZ9CkVicMc7WSflu7qzzka6cGUlN6KYBA1Lvnza
 nKJEnKYsfZD1Qveuks80njdqQzWF3JKhchHoz6vGwzGoQk8/d1Hfib90saaikpbd16Mx
 nmt6u84L4mG4u1DqefdWx6YdOx69sP84nrPbsZPJ1hsFIGdIKGzO1RbF27oCb1M+M0Ty
 fjhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLXddKd7Wuyms/hBX1co3rFANjhgy1yQLfyd8OS4D/4cXNgx+Og3rZikuEd0FVHRj+QqKc+DIs7Og=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/SzWYO7hsVvhclOzxozoU7Tc+Xg1JnbwErflw4vrtUhCK8gy4
 WHWWy/Py7v5QWbzw51DAyxlAo1rG9CYjebrNo8pckNYeCgxhHJuf4BLBZ5RKouZl79UKb6Lo2Bx
 h7iwqZC+oYn9Z1CKXxEiG8ABP0TzD9+nia2J+lBJAmAfbfTn6s8kR7lGt0q3Q1AEX1Ix2hQk=
X-Gm-Gg: ASbGncuFg1rIBJTkU7xbE8V/5ob5cHEHSY6PymJaUFr9KfozOd3diOQrHayNbuDmC/4
 j5u/viG+vuTG7TgrRxun6OoBBTGQkIbOJT6L2h0yE6aZJogiO3KuzWd3tkdM2Q042vwcbUqcioO
 gFKw02Ul+cy7Y66kngyiI6/ef2L4/fnsv8FkpgJvC8eRiK1VbMGTZGxaSBxtckc39qC2KtG6fOF
 6L+D+J3As3RBBNPKZkSbbmfXTpCZ1uJ/IptnYuH8h7fVQMZjiaRaSMwc5vQLBfg/vZAnUz9RUfe
 agG2IQOGBxqJmxPeeFUDVT0PYH4ltQdGnfCtr04xeTWHpDgHJ/COBjRVUeRo9g5TJaIixmCBxOz
 fsRWhn3noCZ95vepfWtd3ZQ==
X-Received: by 2002:a17:902:e88e:b0:267:cdb8:c683 with SMTP id
 d9443c01a7336-290c9cf1785mr209130705ad.27.1761057558264; 
 Tue, 21 Oct 2025 07:39:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7Xu3yqvqq7tM2Hj4ax162jdVvcEgPtgB391HBWPwgMC3PxAc2yK/s89219b9zTLDa4YQfTA==
X-Received: by 2002:a17:902:e88e:b0:267:cdb8:c683 with SMTP id
 d9443c01a7336-290c9cf1785mr209130335ad.27.1761057557695; 
 Tue, 21 Oct 2025 07:39:17 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29246ebcdefsm111879115ad.16.2025.10.21.07.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 07:39:17 -0700 (PDT)
Message-ID: <769b0fb2-75b3-45ef-b798-02ae5982b736@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 20:09:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-2-0baa44f80905@oss.qualcomm.com>
 <811c728c-e2c9-462d-9c7a-dd79a683e301@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <811c728c-e2c9-462d-9c7a-dd79a683e301@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ORHMNF8YRuPMByaKJ1QKueqItoNcMsAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX4ttLwzf7RE4s
 KhDDckiUtOIdbrvUb1W/3kEJGfa0f7ipm637X0Y9K9PM0oa86Q9S2jRTFx4c21leerHPv6xhZFn
 PlDkXWWHbh9A41HhIE5kAkyWo7/pXPxJAAz2VaWvXvVUxnO2hdKcWqeBCSiKrmsS84S2gbQtHnj
 byC394wK8RTRaVprO6AOcG6NfpFDKAIp0/oxgsh5syaTsfzFiHQAqRBpS8/7YgDje8s1J/bWq1a
 brotCM2Wu3iv5vzxvOR+/ZWNcnRkF9ezItBqW9dI+CbEKDXlp1y8wrcyvs/MqCU6D8V3sdF3OgJ
 xZUfCXkn3C3c7SRDAXgHaGhEC53I1E/CHcbPVABoTncjp4A0q8G3F7m/Bhgdx764evJYFmvcc26
 GwhQ+Ve2zZeRSVeadmr905xTQETQ2w==
X-Proofpoint-GUID: ORHMNF8YRuPMByaKJ1QKueqItoNcMsAT
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f79b17 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PLUc99ambSscJNFV4OcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027
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

On 10/19/2025 2:40 PM, Krzysztof Kozlowski wrote:
> On 17/10/2025 19:08, Akhil P Oommen wrote:
>> A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
>> which replaces GMU. But it doesn't do clock or voltage scaling. So we
>> need the gpu core clock in the GPU node along with the power domain to
>> do clock and voltage scaling from the kernel. Update the bindings to
>> describe this GPU.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/gpu.yaml       | 31 ++++++++++++++++++++--
>>  1 file changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index 3696b083e353031a496a1f299d8f373270ca562d..efc529e82bc198e7c3c89a5eecb6f929960a8de9 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -45,11 +45,11 @@ properties:
>>            - const: amd,imageon
>>  
>>    clocks:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    clock-names:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    reg:
>> @@ -388,6 +388,33 @@ allOf:
>>        required:
>>          - clocks
>>          - clock-names
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-612.0
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 1
> 
> Drop, it's implied.
> 
> 
>> +          maxItems: 1
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +              description: GPU Core clock
>> +
> 
> Missing constraint for 'reg'.

I suppose we should add reg property with a list of (items:) reg
descriptions. No need for 'min/minxItems constraints as it is not flexible.

> 
>> +        reg-names:
>> +          minItems: 1
> 
> Drop. MMIO range is not flexible.

Ack.

-Akhil

> 
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
>> +            - const: cx_dbgc
>> +
> Best regards,
> Krzysztof

