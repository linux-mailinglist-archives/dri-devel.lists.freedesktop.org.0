Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C088BB1E7C
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 00:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0861E10E0C4;
	Wed,  1 Oct 2025 22:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxrmdRFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0782A10E0C4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 22:03:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcQRS024114
 for <dri-devel@lists.freedesktop.org>; Wed, 1 Oct 2025 22:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xujcu6su7xsGlY8taylppAEs36Y3vIRtnieSXdVrg20=; b=ZxrmdRFGxgETCxR2
 KDET9JmODW6PupEOkcuQFKC0hHOo2JvLm5agcGHLLk9DJzxXD7EjI+NocnNB8Trv
 y2qTIXBY7hG+59YyTrpGUWIZ97AwGd1ndFdNiuLQc5sBSRB05yBjZlwemER/JW6f
 eKFSogMw5WY2GSPp91KaR2+EI6k/Itmu4+hUHsMPWrHu9GXR77eRwkdwoALRFDg2
 O6CKJBmMaHUX2nwQdo/33wBAE6Bad6XdNG34oiemZSXvzxneXS8kxAR7dAO5ch5h
 lo8R6+6G/NGLPzpge9CdK4ExhZFhnZhJjhI6Reyfyh/UccS2gA8LhXhfOMqR+op1
 AjMrUQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a660n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 22:03:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b5b3715102fso213530a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 15:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759356203; x=1759961003;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xujcu6su7xsGlY8taylppAEs36Y3vIRtnieSXdVrg20=;
 b=be/dpiXeWW1+CoFNVhBlR/XoaYSm7YcUT5nqJjDXDcAkn+3eWgWl9jmLtTbnK0+ca0
 C+iDOwCKl3q0WUzP3Ci04x34sNFEOvhGNw2TdEN9KAbOjkTqforkPHVaz5vX05TEnPDc
 U60ULlhr6ICHdTVX7bSw6GpfGApUPVqH/vJ2CtCzZ56tcbvZpX1DA31swMZ4RXy750V5
 fkGdaasjrr/qn3sIml4iHeTbTzU1QTKdOiLnZTjKC2Tth3Go0Eo7g0rKaWv4MOXSAWQ/
 6IYpnx41+X2PI8lmdUZOt3Bxc/UpEmT2a0f+MKk8FP7iV60q00oNsh+UYCILbYnAI3v8
 v1qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDjp5bJFZKrFBRB2cyFDdy4gIoy+QGKEe6t5hbrqeDRnN9ts6TWbpWScrcqWT32fpKJYWs8OidFdM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDVgxGLakyYDwduT+7FYFmIs3UWNs9lTVaCj/9BzahW2cXpT1g
 AR3Hn4v0Q1OCo7TvnIXTczd5xKJG0Vs4hex5omVLxCgyCabvAWRv6fXRMRWWuEmirZ10GxlKcfr
 ObUVFMtYQ3TwsclB4E1TZtee+oQTRt52UO6NGpN5pVQjqg3nv05r0Uk68KoGTNEin/zN8ZsA=
X-Gm-Gg: ASbGncuZorDxWy2TbimQCAQDrCCO/AZajH9NJBquPSCdBwFaclDSpGEmJjwRMG9Le9/
 gvJCjVDNJzuCnoMG6ApP+r1r/sWw6Q+Q8vCkQy7FTHvpDfeRQ3YRg2SDa02Q+zhQjsF222nSkL5
 OUuJZOXATm37gwYQo7V7kFp/odLcmB3JG8HwoUWpzxFVfVtc706ZQAxhY8cXvhEgWZ8eEcG45G/
 tAKa34BWIBcFXqhaN6HlQvbQrki8gciLorXCqZf79kWGjWhVrT2DDSaF/Hbj/waA9rjvRjctOUe
 wUnlLt9byh6N6KNUle5BHYMPjWUhS96CV1iLQNvcVE2l1T7PNgvXFdyZliiKfgeRbTw=
X-Received: by 2002:a05:6300:614e:b0:243:78a:82cc with SMTP id
 adf61e73a8af0-32a2529463emr1184485637.25.1759356202562; 
 Wed, 01 Oct 2025 15:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgxO0FMEt6NCjTbWEVMsMIoIPsAqpPcSGWTogRJlJI3yNWhMaCOEagO+8drQ4c5arKTyjNnA==
X-Received: by 2002:a05:6300:614e:b0:243:78a:82cc with SMTP id
 adf61e73a8af0-32a2529463emr1184444637.25.1759356201994; 
 Wed, 01 Oct 2025 15:03:21 -0700 (PDT)
Received: from [192.168.1.9] ([117.244.71.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b01f9ced7sm659664b3a.15.2025.10.01.15.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 15:03:21 -0700 (PDT)
Message-ID: <79b54a9a-2f05-4a2e-b9f6-6fe46e2c25cf@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 03:33:12 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 15/17] drm/msm/adreno: Do CX GBIF config before GMU start
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
 <ae2ooybajk6mcjggeztumubht6auw5qlhmsdrblikc5ruoxtmm@oj5kvpxithva>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ae2ooybajk6mcjggeztumubht6auw5qlhmsdrblikc5ruoxtmm@oj5kvpxithva>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dda52b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=2kejHg7nZSoTgEpwAwsXNQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=AweIZ1vEVvbksj7JdV4A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: C_jzYYJJCNjMWVI0ePcr3qUMZxTpCC6f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX5GKH/YKtNIgc
 zEg8Ib4EQsbgANR52CJdcnJxY6EvMowYqniWJ6krr7wdINVVmIEyg2quowYcsRCWeml6Gbm8Rl6
 nXEN2ok6sMLTNhYj4oi+PfRnWYRxxPkeDybDYKGgcSWNemcfvMozy7O+woObAErQR83rDJ5TXNY
 uyz7Llb/Ah04GGtlLd5pKTv42nV68DOiKmfd3TbXy11xfvBCgbwcU8NrllDQuaMen5k5nToYV0O
 LPJBEHmZo9xj33yFAa/WOU1Zplmm1deqG/iIlngcvmXTMRPUHVVJQHtKAO0taR40OqsBw662CzQ
 hnTk7vioUdowJklUX/CiwQODJLZ6gKJUbWLn5mwnxVtPdI9jE4eTgD9VPAc9DtAxAJ/WQznDFaz
 zAJOIfLOAVoqRBHAjIs+JOsqWvZqWA==
X-Proofpoint-ORIG-GUID: C_jzYYJJCNjMWVI0ePcr3qUMZxTpCC6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
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



On 9/30/2025 1:19 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 11:18:20AM +0530, Akhil P Oommen wrote:
>> GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
>> configurations before GMU wakes up. Also, move these registers to
>> the catalog.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> Fixes tag?

Seems this is not an issue for existing GPUs. So, technically not a 
bugfix. I will update the commit text mentioning this.

-Akhil

> 
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 23 +++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 12 ++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 ++++++++++-------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>   drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 10 +++-------
>>   5 files changed, 49 insertions(+), 14 deletions(-)
>>
> 

