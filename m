Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D33C57935
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 14:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864E310E80B;
	Thu, 13 Nov 2025 13:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOqMaBTs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YR3suPF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6484D10E807
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 13:11:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADCI5LD3336691
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 13:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DRTlfmcA5G3RNmazWc6q+mJMqfQXqWOCzTyBT64u9rM=; b=TOqMaBTsjWUqDCE5
 HDed8I/iW2bdO1rwLxiMq7m7eb87aqzdumHxxMdVgZ8/CEnauG+fKxWLkRNspXks
 bM24P6wv/5ylAbR/OnXEbcJZ7VUmCaFSW7XylRBDABE5A18wVpNvXt3wrVDCVYBu
 bBiUrn4EVnTECSgSiRVGXRESIrU8cF1oWGyYOiusBeGhnMk5aI4KyfDGHegM4eW9
 qrfjzvuYHqpAvZv0/1Mfbpr4+NOqgHVqaSKtdgRLuWHj+9sT73RLQusyIZ4BZrSu
 vOWUFz6snmp1LvuBpdCipRhcr+7aKiHKnr4DTFsv5QxC+Fv+9CLXTFzHj8P0D5gd
 LN+fBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad8sa1f5n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 13:10:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e890deecf6so1666551cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 05:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763039459; x=1763644259;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DRTlfmcA5G3RNmazWc6q+mJMqfQXqWOCzTyBT64u9rM=;
 b=YR3suPF8odmmZ0JupPX+5yPRwz5V8KemkbbWzwGm+iF4rSequuOhzU98aRhBitpvlA
 tIu94X7ZG33iyCJc5XVUbHD2xKRHYH+FOXkp0VUEOXzfum1yKnZ1WrHpWqQncItpQ2NV
 mg/sWP6HfqDo3aQtC1DQxh9ASbTs+8ZzwDbjsY2WDQAsD5tAp3kYVPSl9ztjUJ89vC3E
 r6l8/dLsAUg/9TseyhfgOV4Y06E6ucwT71FPKNEC6BNF6mauBN6apANraQtT4zykZScX
 Uiq8RQUEUw866zD4MdMp6eJCAvZYYhs8jyKWLqT1RWJjJaobmlXGpvouvIB0QPy1afBg
 hQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763039459; x=1763644259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DRTlfmcA5G3RNmazWc6q+mJMqfQXqWOCzTyBT64u9rM=;
 b=hfK8fMvH/tUOUc+fGNtm0qNrWJAgleXbciVf/KcIVGA5skIHdvsmIoDADh8QMjQqU3
 vhNPPYewnlovqkVwMq4G1jIryvGB8UCCgdBdmOE7Sc75BIawzkaeQ9yNDnfXteONv1PP
 KYJlMnfJs+RMARjY6o9CsdMrjPnLHhVDAfFA5NBJ+GJzfdeef36Gk0OKS15az8ZKP/Ga
 8W3PdkvTmFBVO1MRrslcz+b86DnOYkDGMfoweeQjebXY8/zUCDx+O2l/v+cPg6u4ua2R
 2XALC6of2AfC6FrPPnlnf2P6Gg1hqZfxAsCZWCrPxugdI1kHNMiorM43ST76MEuiscYn
 8uQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZQOhIq+bAW1qXRBYAlVRuJGvwVQqJO2o+XHp0Yh65MZ+fjEqmMQYoX/n7qA7jrkbd4Tct2PofvaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4i+g4DGe+1S5Ouw0Rg0kcHcQEQWSTp3k3313N1jCJlNvZMoo7
 hZQKm+skDqILAOGeuOX4shWF/x5H8MU9G6WXjcPp1DwfxwYAvINlvmW0P/1Beb2pWA+h7yi9nKA
 2DLn/f4wmcVw2rK6t7hks5yLXWQZc8XNvCm/MASCIwJB7bR1vMKF7y8TP1kkGpx7Nq/ReI5k=
X-Gm-Gg: ASbGncuuhYng1LGJmW5z9paPp/u5dRjjqqCi1nt5pqsF1Dl5/1mki0sAugg+JQEz7Ty
 z+r86Emh3tpnM2VmbljuUMAa8rhMI8An5KcQ8ue1C8dDpHOTSz61hfUcIHGaoiSTrXCkw+bakKI
 LsAM5adigkqbrmFh10u9qiNleRP2uYSnQRh2zr3+8ufUtVIvfIUj7Xc99zQXCt7dWwvNY3fHtax
 2s7+0V46tYRJDPsNgfOtsJLCot2wqu4Ry6XNMTFbJ7+IeY3SQrLpewlFSHVojp1wqP8QaE6TYBP
 bEaCax9UwfPRezlByxbyhuZ7VyG6vIDpjOpSxQqA3RfmFaMS7AvdjvkmDEdSUQra2f9zEYjfYNO
 MvBlaLPDXXl+lvFy1tkU1H2p1k1GUaJp2a2wZ1+2V00jPFCxa4Nusxtkq
X-Received: by 2002:a05:622a:316:b0:4b5:e4dc:1ee5 with SMTP id
 d75a77b69052e-4eddbc3b368mr66675621cf.3.1763039458842; 
 Thu, 13 Nov 2025 05:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFubAqHtUuJnDF+wjB0W9VlEiOIp1rA9oYXxjeZ4nxOglG6BzzsPMTiYzTMIQ8sTZ3z4gCpOw==
X-Received: by 2002:a05:622a:316:b0:4b5:e4dc:1ee5 with SMTP id
 d75a77b69052e-4eddbc3b368mr66675131cf.3.1763039458247; 
 Thu, 13 Nov 2025 05:10:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a498102sm1451965a12.24.2025.11.13.05.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:10:57 -0800 (PST)
Message-ID: <2a42b980-c037-4b08-85a0-07f5ca8dcc1e@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 14:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to catalogue
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
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
 <d87bea02-1a89-4854-b760-617c3655b287@oss.qualcomm.com>
 <kwf62e5l5n4pwfmetvhicupj7r6ow46dnlkkluyhl7s5wuazpw@q7vbdi7d6ul3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <kwf62e5l5n4pwfmetvhicupj7r6ow46dnlkkluyhl7s5wuazpw@q7vbdi7d6ul3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h_6hXtU8ofQ7eWoYbOSDiJLRHNqq6D3Z
X-Proofpoint-ORIG-GUID: h_6hXtU8ofQ7eWoYbOSDiJLRHNqq6D3Z
X-Authority-Analysis: v=2.4 cv=dcGNHHXe c=1 sm=1 tr=0 ts=6915d8e3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WG-851GjljAyzOMNImgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5OSBTYWx0ZWRfXzR3rqzAepljp
 V0k8ZvPY8x3kSzzCtz6HL1zxrHJDpJBea4pAK1r3cMOdVB76Alm9TH89x55oT1QmM+hbmLm5kWw
 1ZuvyV2h/H7/r51eDGTGp0hjNZksLQP9WaZmP7M/R/bl4lrEB3zc5si2sERLj21rCtUnRDBrQIi
 XlZZThmnWHzg0wRFlAIFPoerXjEQC1tf6Pq+yWzN2ZR+3Dn8+6Fhwp6l9JHdg2sn1r0tRZsILPp
 J6aH8QD6vqgKKMKUhoVhnSLlj3UjDC/cpzpQQWibjKbjWTXOUBi34mVc/wnUCf5AyHBSkScbOgq
 d2ntcoufUuyOLeqU3+78BKs3DhVSZGTH8QGjmqOJRhq9ujCf/qn6Ci65XwDTza6gX+MktZ9iNbs
 2cIo+/ExccQa8hsYlMWrjXanw/4lBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130099
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

On 11/13/25 1:22 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 13, 2025 at 10:27:09AM +0100, Konrad Dybcio wrote:
>> On 11/13/25 4:38 AM, Dmitry Baryshkov wrote:
>>> On Thu, Nov 13, 2025 at 03:32:51AM +0530, Akhil P Oommen wrote:
>>>> On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
>>>>> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>>>>>> In A6x family (which is a pretty big one), there are separate
>>>>>> adreno_func definitions for each sub-generations. To streamline the
>>>>>> identification of the correct struct for a gpu, move it to the
>>>>>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> index 44df6410bce1..9007a0e82a59 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>>>>
>>>>> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
>>>>
>>>> Could you point me to the holi's devicetree? Currently I see only a610
>>>> (sm6115) and a702 (qcm2290) uses gmu_wrapper.
>>>
>>> I don't think upstream was ported to SM4350. SM6375 should need the same
>>> hook, but I don't know why Konrad didn't enable GPU on that platform.
>>
>> I'll try to fire up -next and confirm it hasn't bitrotten.
> 
> Maybe then a patch to enable it too?

I was hoping this would be implicitly obvious

Konrad
