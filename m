Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D5BB1CC0
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 23:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BE610E160;
	Wed,  1 Oct 2025 21:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEoBOZbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F1610E139
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 21:22:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcQQP010615
 for <dri-devel@lists.freedesktop.org>; Wed, 1 Oct 2025 21:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tY1kk2Q5hRz9w3+RRK/dSbVzsoNAtpTZ1wIZRGTLaPE=; b=AEoBOZbY5dwHsaEu
 nCz2fNZKcAZfaYdo5d5ulPVRFWJ8zMZ7Mi2+jxZ1vA7pKIwX64LOdeMVvEmiD8rr
 sIDuv9xRcIAN69afsfe63q4APcIO2rPZE4ANruDmLiGkhcnlLxQlv0q5guwKKpdT
 8E/5BjiSkPiIHgQSXaWF5esBN9iECy0OktYe35tQKHWp+spFR2VCg2UuIy0DOYHJ
 lg6D0+O5lQ8xw2yAfFk6mov6NbrGiJxdlmEvUy9Vth2d2s8r+3W6cZf4dZndVJuY
 lZdnaPHFWzfCQzJe/5uh48ZM9lA1XK4aWdq70vaLqAlFNBPOF9UaA/2fqIiNCT+p
 +1Hnvg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hnn1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 21:22:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b60968d52a1so571868a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 14:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759353765; x=1759958565;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tY1kk2Q5hRz9w3+RRK/dSbVzsoNAtpTZ1wIZRGTLaPE=;
 b=Su4Nes1ZJoPJf3djoAeOb+SkoDP+EHFj7+4xZmZ5mAqFvnuqqqiJP8rVCwvNEPor0k
 zoYYHn37seMusc3nY+IYrmBlkhi8LWbEk0E1xymBHjMkcC7iJX9mt4dVO/zB6kbXWtMW
 HSzcrMtOmTFedt9mVu4dDyrKKRj1SOqAMxXIKxc2dw9oYEBT8Bn5T0iI5jdqArLGa1v8
 mZ1zqRr1CnzrfpEQXF/y/Zak61N2NCDhqSlwsBYyO7+cynkkvyIhpmJUbmaaPpN7nq6A
 5HY67P7UtDES2obGwj74IquxmGWNhszdbELxOZUJzaLFwpZcMCxDN/uu6QsjgC/D6q9l
 iJoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeEW9R3RU6SKkFYONpmTWowPAiI29QB4TRx1k/lRKDIDwWbeG9GIDfScAdcWK/MxAv89Mv/06puRs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypWNLVtjZ/dmiqCAStgOK6R+vqVRDi/oMMINNqjuV+9aklf6CK
 LYjF4dwYXv1p3BXaiutWq+o4xK9c+soedJ16BA4C6KWqENnxAh1QHfK2C9tf5/Ek5FnsDj8r+WO
 JlsQ8i1NVmj6IB8p0kvTC7/I0Pu+EVZMTZEELryOmIqR3GiNcr8Gfop49nT5IZJ4OfHtzi5Y=
X-Gm-Gg: ASbGnctQdJmOZz39UUYvl1606CaNFGDRumxpDJCDAlKAv/wcLrUPzXuu6QVdd0yP0lR
 3d2x8NmgTGKJJU4EFc4JljFUcA2aYgoE4VtLvYC8cwQKCn355CUn8xSlrCUyEW5hPExmV3IBpdj
 Psr1AGmp13CrlRio8irRaWqsqPNJkMdmqgd+/ylUiS2JHZ+O9V6EA0H7Cu3Ql58a2VGsG+Ftbi1
 wBQPMXw44+GilNO4XWJm02qPn2E/rVnU6wFFwtcXG5L83JhHdRfkhNmMRqUKeJJSL6eGC0CYj5T
 g9p1Cn3RG/OKkCUydyrhFnkbMu6OU+4Z14vkRQnoTrnx1hvFlh2yM0kpXEpihKLdOs4=
X-Received: by 2002:a17:90b:3143:b0:338:26e3:ffb6 with SMTP id
 98e67ed59e1d1-339a6f5329fmr5484035a91.26.1759353764853; 
 Wed, 01 Oct 2025 14:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3J5m7IdAEVQ8YgjK8xPIMo/mwc0iZ4ZB/L76eAW/owdYw7sgKWjOIFg1cMlAzuYnR+gwPtg==
X-Received: by 2002:a17:90b:3143:b0:338:26e3:ffb6 with SMTP id
 98e67ed59e1d1-339a6f5329fmr5484006a91.26.1759353764421; 
 Wed, 01 Oct 2025 14:22:44 -0700 (PDT)
Received: from [192.168.1.9] ([117.244.71.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339b4f3caf9sm623334a91.13.2025.10.01.14.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 14:22:44 -0700 (PDT)
Message-ID: <edb8b0dd-126b-4ed6-8603-119f1fd52baf@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 02:52:35 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
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
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
 <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX07ad1/sq6AaL
 qOQDjkUE89XoVsBBhAKGQQZizn8iyrkbwiwy3FMBQF4Rb1Axx9wEHvIr3C2vxO95Y+fiuGPw3FT
 lvGvttSVY8En+j+7ylaCMRVQWYgXdVrUzdUREhO8ND1g8gzSx8oxeRBNbXrn+TD13ATXBpEP2pP
 4OpBnyq/p1uxWUMd/SoL0MFdA7Y0eD5M6ffSfk0VVEmj/YBf+We0A0d+VaHgzNv58QAXY9sJs2I
 UDLmUoWOz7RlbY3DZzg1nMMURpmpmqDK5/j69JlRqAnhgNaoyp8YT4wD+M0mYicL6fMvmt3TA4H
 VyxNTXDNFETyyzjE7aux7MOtd/Qyyxy+yC3UxnHWLKf9rZ5iWaNfc8GenbKx2U/JAX7hr7NTMNr
 Fs45UwncQoL9jZ4ZVLfF42/XvgkPGg==
X-Proofpoint-GUID: ey-OQFjz6e3OHPLHoTanrUbU3LG3Bay8
X-Proofpoint-ORIG-GUID: ey-OQFjz6e3OHPLHoTanrUbU3LG3Bay8
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dd9ba5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=2kejHg7nZSoTgEpwAwsXNQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=DsFpUOTLdg6Fp_xZM74A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
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



On 9/30/2025 12:53 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 11:18:15AM +0530, Akhil P Oommen wrote:
>> GMU registers are always at a fixed offset from the GPU base address,
>> a consistency maintained at least within a given architecture generation.
>> In A8x family, the base address of the GMU has changed, but the offsets
>> of the gmu registers remain largely the same. To enable reuse of the gmu
> 
> I understand the code, but I think I'd very much prefer to see it in the
> catalog file (with the note on how to calculate it). Reading resources
> for two different devices sounds too strange to be nice. This way you
> can keep the offsets for a6xx / a7xx untouched and just add the non-zero
> offset for a8xx.

It is not clear to me whether the concern is about the calculation part 
or the xml update part.

If it is about the former,I think it is okay as we have confidence on 
the layout of both devices. They are not random platform devices. Also, 
we may have to do something similar for other gpu/gmu reg ranges too to 
conveniently collect a full coredump.

-Akhil

> 
>> code for A8x chipsets, update the gmu register offsets to be relative
>> to the GPU's base address instead of GMU's.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
>>   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
>>   3 files changed, 172 insertions(+), 140 deletions(-)
> 

