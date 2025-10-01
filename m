Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511BABB1A73
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 21:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1051B10E11B;
	Wed,  1 Oct 2025 19:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGd5f1Br";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7071810E4CD
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 19:54:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ibvng008309
 for <dri-devel@lists.freedesktop.org>; Wed, 1 Oct 2025 19:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 brS60HbFUtOuWxvnUIY4WzudlEdGwstrPazqVvcT3+g=; b=ZGd5f1BrVBZ6J0/d
 GYp9HNUCicoqdgxC6Fn4OMf68pMQQnYq5zgVOTJTfA9rCaPc8cIrGVwlCIpNh3qm
 tmm009Me6aoJTVIH91yL/3FWIH5QAyAxwiE44y2kKrxEu58dusLLuIDhjQqhdB64
 i5cZfKsWtyVQqnZq1zrJPnxf+treMgaPlW9mawts3sNw3Ab8hXM/PPxyxat/3h/A
 LQaS8Vo3RTZkoVloD7PfwLYYOHUx6EmaZM/7hyq9apE9NlTeMZvHTV7U5EoilAw1
 7u/rddjgU3YyWt3ydzBg5XvJcv30JWPxbO8m0aTUPMFWvFgFCSw7/Sl2q1Dw13sw
 FCoVwQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr95rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 19:54:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7810af03a63so499545b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 12:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759348489; x=1759953289;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=brS60HbFUtOuWxvnUIY4WzudlEdGwstrPazqVvcT3+g=;
 b=CyrdWCX7EFrGdCnUh3gXn/8woMfFxztH2mRVzwIKKpKt0maMHtxOuKlDuEkhf4Lqzg
 6P6gFVLLVLKnEIbbvhPgbKYsjXVXwd60BDVdtE+e96TAO/u/YkGumFZgWurgiKBBmaDM
 OnYd1/lFYVTQN/G8+rEx9mA63D1VQZkKSa2KsJqYlHOQAxxpI0BjoqbqFavSWeEgTWUq
 hAJU4+wV0FG5Cqj0uw5kz0IlXUBqMYLEkfUh68E0446D0hWDu5y82jKgYsgbryHvQePd
 bvrM/2QIzlywDYYkj04hD+JNKlrYPoyvB6uD04DVyT5jDsbsdZn0jYZHnvDHcWEHJouf
 kraA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJMzL6xaLzxhb9OqTEDaFDE5FeWtAgFbOG3yl0fWzjSZkuzHAkO7QFZ96XDPnGM2nVOGVWN4S6kj0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyGhnkkdZBxEQEXoRtvW2R4EK9Ft5tvfnA09bVpUO/Hx+9CBfY
 pYVGlSnQ1CJPaUAZNfbRUJm0wJBktxcXnHrwdxA+bh+I80Wtpn6iJLf2d2/mS5hO+MxO1QLY+yJ
 5We+rmomMZKFZ4nlY6wwyjuTC8iLE/0fpCbf69Xl6iUWTDvmUxNNceRKQpQWEvlTy+wH+4y0=
X-Gm-Gg: ASbGncuc0r8VUWLWWevbYvvlf+k5FC8Yxgr0c8C+KYqwx2sH1cf4DWjx/QpJnjnRgFL
 snnENdHTShRWP9hBPOb7voJoNP4Bv38ejrVhD38Xvg0MBM128ygzh+gCUJZFaSKvtH/+e8SKZxB
 qtrEm2YulzcCzWblMEf16RlDkJssRHiK4KwNMvt37KfbUNRFX107M+LUWp5xidppBssalxcRyOj
 ZI6awJa4tRxu6XL/gwzaPweQyQ5+lvkSdeouqERrUj/NPV0shrGvF2MxtO9dDxuVqPL3/3cxoOS
 jgXtDfFuEn0BV5DGgvSr0+tBeQFgqPC4JJM8Odi1S7fdUryG/anL9KirkL/Y08fL0b8=
X-Received: by 2002:a05:6a20:258f:b0:2b1:c9dc:6da0 with SMTP id
 adf61e73a8af0-321dfc7f1b3mr6835310637.46.1759348488858; 
 Wed, 01 Oct 2025 12:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsIg+XF+b3CzfwLXlkZJJwTtOF3hWxO1NYUBnIl48kRjZPlbxjVEtrqF7B3r6dPLdbru/a4w==
X-Received: by 2002:a05:6a20:258f:b0:2b1:c9dc:6da0 with SMTP id
 adf61e73a8af0-321dfc7f1b3mr6835273637.46.1759348488399; 
 Wed, 01 Oct 2025 12:54:48 -0700 (PDT)
Received: from [192.168.1.9] ([117.211.42.17])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6099f729c3sm297566a12.46.2025.10.01.12.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 12:54:48 -0700 (PDT)
Message-ID: <82cd8782-b2ee-46ce-9964-e564ab6a0199@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 01:24:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] drm/msm/adreno: Move adreno_gpu_func to catalogue
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
 <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
 <cp7djnezyp4whhfqcnsfpes5kxfbyvqvc2ceimdrnrl7s7agyk@z7ozx6oihezd>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cp7djnezyp4whhfqcnsfpes5kxfbyvqvc2ceimdrnrl7s7agyk@z7ozx6oihezd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX+P/eHDpWMXC3
 SJ3eBKluJKC9iPpnIpURqDPbCOgRlu08XJHc22n6tP5YP9J8RYy9kuYUDl7EqkaHNvk8u0DM+cx
 bG/XQx9wcF9ckjFFlroqFSSGrZJl7fwlirIttwZT9MSXGQCWIhZv9j1HEdM8f3jhqInfLm05N9V
 +1dQEI3WuoBqMUbJ9dxgwe2bu7esl19hmWhevr2DQmHMQiqtv6Wtw0CeqBQM75trjdsTbOETnGX
 mHlVPfOD5Bk7072AwSyjy16TZSjOhG1grVVxkfKY5ImKos0I9d8OSRbV5ftbX/6nohATcEo0VtY
 2S+IuJZnxi+aVSnrG2fKAtVix01HKq09tbGpae9CWy+n7DeukFZetlLdANJLc8tMHv+mhJNn1zJ
 Or/bDUIu6hHFMUHR4Rxpa2KXrAiDeg==
X-Proofpoint-ORIG-GUID: tYPcAgDGrJV8i2FhYxjPKatiWwJ4pDJv
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dd870a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=paYLq2NZIH8GVbL4gQAG2g==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Qop4gD_cnJnpb7o7aosA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: tYPcAgDGrJV8i2FhYxjPKatiWwJ4pDJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
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

On 9/30/2025 12:39 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 11:18:11AM +0530, Akhil P Oommen wrote:
>> In A6x family (which is a pretty big one), there are separate
>> adreno_func definitions for each sub-generations. To streamline the
>> identification of the correct struct for a gpu, move it to the
>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   8 +-
>>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  50 +++----
>>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  14 +-
>>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  52 +++----
>>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   8 +-
>>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  54 ++++----
>>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  18 +--
>>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  61 ++++-----
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  50 +++----
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 209 ++++++++++++++---------------
>>  drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +-
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +-
>>  12 files changed, 275 insertions(+), 262 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>> index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..af3e4cceadd11d4e0ec4ba75f75e405af276cb7e 100644
>> --- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>> @@ -8,6 +8,8 @@
>>  
>>  #include "adreno_gpu.h"
>>  
>> +extern const struct adreno_gpu_funcs a2xx_gpu_funcs;
> 
> Please move these definitions to aNxx_gpu.h (a2xx_gpu.h, etc). LGTM
> otherwise.

This is a special case. These symbols needs to be visible only here.

-Akhil

> 

