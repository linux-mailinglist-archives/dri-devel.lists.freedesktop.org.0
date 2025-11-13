Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37609C5694C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 10:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D01710E7F1;
	Thu, 13 Nov 2025 09:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ2znY/d";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9YbKVVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D4C10E7F1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 09:27:16 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD6hcB33801307
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 09:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hBQHZTyCsz2E3OEb1ZqiRZ3GGm1s7VIXPos3wQ/Oo+o=; b=DZ2znY/dexHHqMHq
 9UkWyfkyA6sxniXfSVzQ3mjIGhqO9rwCQKTW75wPB3nlkpUsS0OtYu8UxJQXenRk
 pcC/7jHqrzkDz1W3+4SVTQy5RvEhR1a1BLews3b1dTMnuu5k0dQ020YVVJy2DVN5
 sZMi3oF9NrfocKv5ItoZdY74rweVMQxLL2DnVYQHV/b9nofgv98w5BqsQjFYHz4L
 iDylQbuQi84kF6BdGMY6P+BalSzQ5+T0zJ6ubsI91moQLfbQiSMla/AmjbyqcdGf
 5NG/PtPFaRkLM+oxZm3TV4c2B5cWISuXHS5uwwv0W++sQfpde37Bk9ymdiBQgomD
 05IFsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaam8g8c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 09:27:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edaa289e0dso1870131cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 01:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763026035; x=1763630835;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hBQHZTyCsz2E3OEb1ZqiRZ3GGm1s7VIXPos3wQ/Oo+o=;
 b=i9YbKVVVkaOnkg63jUbn6o1lMGJmtGjs0I8TdrJ7ojJxyLRy9xDKUYnR/gMVJLTy+b
 Y319d76WtZXYurQiFf5rYB5y9t4BxalOWbckxonN/8ShSkOhKcmEQoWI3mQ+wiYxb+u/
 53rhXebKuMaGdqdKkpxnzBBaJdK4TZ002oS9lxut6ieBO2Zly7I/nVmWitPVcto0E4QN
 McjynbUbloz9Kb3oOLWqhlIhaq99LjZYUfKOcDTQJLtPdng0chhTedSKSKH4FLqH1XWW
 mOc5nGQMuXWaUM1LRlnGqNuokJbKI5cUTh4MG7JN5lPRsmUsd1zNcizEvI+r5+PkyXS7
 k8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763026035; x=1763630835;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hBQHZTyCsz2E3OEb1ZqiRZ3GGm1s7VIXPos3wQ/Oo+o=;
 b=hGLVQCEwUm5GASXusPujPGog35ikMBveeE5sJHUJGd9aA78P2x1fUCA8wDNq2a3reD
 ERlvTLpoMeFps1aYOpbe6HEF201i4/qytv7sl7bcLMdqmvITufgpMavmYhfW1xqk4GeW
 se4YEvPd8hIH/XPEuonH4IqQC/Zf0nsE9s4d+vc0MSycmmsYWgp6WuJElbY66LGsfk7X
 INcjp5KAS7fyUUSUum34IPcjZlidQs6NYoRZBxUzXEVIkW5yWJBKaOHN9u1CZNbvfPZW
 IfYTf4wpMEVQ91NwKFsLBxDyllNGrHOWjj0KKcRH5rsVH/Bf4YV+QFTr/NFLRtElxPCo
 wb8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDgFzCCnqHLCTpP8sfrP+eDc1oYmWGxzHTowbmjK9MT9RTpIq1SfkTe9ionvC6NCPvOtOBgeS+4BE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3wrkj0oNScRJuMU8sUZXxugnVecbCJjhMC2GGyDQFfPU70G8S
 GSoLEUIn2raIapEJ8EutEy5meU9fozPXyEw8VJa9T0OqQ5aKpmdJHFujr8J8p9oC/G2zzCq/p9g
 qF5DK/mhfYmtE3gR63W33ZLmJb63YwdIUA53GoBWzorGS/jcWoB3ZkJVXOydX1E1/oFf3LMA=
X-Gm-Gg: ASbGnctGYqVcTKNkkUUJHFxElB2CZSQMEzPwJ5eDhaG1Umguip7hvehMpcm5O9NOxxO
 8ngRJaTI5Y9AdgUT0HL3VSuA4koaRb9SxQJAgD+++UTlLjL+vka/V3nPSbTJG7uZbJJ6bK9082y
 aTulslpSDJ+T4iUUzvKKyVxq4MSrFOecS9g2orI5Ul8RGG1px/Ba6Pxz7Ktpxlrpo8S0DqDMNVL
 19BbSlnm6DZhVCPI4AiXqK8INLADF/opFM9Z7QkNt+GJL2Zogp/AASBz85NOTbewb8t6GkRu6Zb
 ON+JSjr+YbWx8hwZNtoUjGQQ1/VUCsIWzxUbG/7zsifDSn4HGwIf9wdASNki1T+mqXntPoi+kod
 cwvgK54HXUYt3SKMZ1Ziiro4fPdkPdvmmPdbwNXvg8qtKi8KqzvolU60G
X-Received: by 2002:ac8:57d6:0:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4eddbd957bemr55093291cf.11.1763026034632; 
 Thu, 13 Nov 2025 01:27:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoZxoEy/JmKlmxIOPZpqL8nflJ1JnawU4oD4ovv9bKA6hPgIGxSwD69qSzkbCaaUf89Ywfyg==
X-Received: by 2002:ac8:57d6:0:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4eddbd957bemr55092921cf.11.1763026034164; 
 Thu, 13 Nov 2025 01:27:14 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4ce83dsm1028106a12.34.2025.11.13.01.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 01:27:13 -0800 (PST)
Message-ID: <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to catalogue
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
 <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
 <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <os7rpbynyoeolwvbrocx3yrrxzhextx3srywal2i54jj6dw3mw@n6fbt3pzjvj6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2OCBTYWx0ZWRfX0bB/eBAHKO/h
 0GmuJUYlZzUbJP/hzrGrIWV4mqGOpFIpqBh9dtZwqtWhSWz/ryVhGwnwNAfahEe7WRn9XbVI/qY
 kVS4IYsOi/uoyM/TzmZwNrHhVyUN1zN/ydxWBnx05tGJR4QS/DApfUmywZJzPX9e4GsnZupF2Y0
 mGsKJCtP1q1dTZsKGZHeKkss0036spxNm3WX9d3qDltqZwXzPgxjypcOknlKJVf/uxjNfiadU8T
 duztMJ7iwgd5bJHkbrdKGWpbg4TobxlcsS+NjBClHNUJvK40wi69dgoHtRF0vq9OeY8W9aYJJEv
 n79YQ23X76IWXW4L216hEHBv1h+6yZdLChPtLrPNeajSJEYMZ4Hm6OqDxrHxGngKKmLRCYgEv4l
 syJLV08VIrKjdM/awE0guLQH+a6Mlg==
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6915a473 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pBDOg7y053Z06RvWvLkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ImAeOe0OzDTaCpfd0oJyQrbem_dXu9lD
X-Proofpoint-GUID: ImAeOe0OzDTaCpfd0oJyQrbem_dXu9lD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130068
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

On 11/13/25 4:38 AM, Dmitry Baryshkov wrote:
> On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
>> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
>>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>>>> In A6x family (which is a pretty big one), there are separate
>>>> adreno_func definitions for each sub-generations. To streamline the
>>>> identification of the correct struct for a gpu, move it to the
>>>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 44df6410bce1..9007a0e82a59 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>>
>>> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
>>
>> Could you point me to the holi's devicetree? Currently I see only a610
>> (sm6115) and a702 (qcm2290) uses gmu_wrapper.
> 
> I don't think upstream was ported to SM4350. SM6375 should need the same
> hook, but I don't know why Konrad didn't enable GPU on that platform.

I'll try to fire up -next and confirm it hasn't bitrotten.

Konrad
