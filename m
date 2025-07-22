Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1404AB0DF88
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3F510E6C6;
	Tue, 22 Jul 2025 14:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvxP2BTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA7B10E6C6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:52:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MB3eCX016286
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JKfgySS6e/EZJ9CHZwXQOHZ4Nnh1OaO/SrNWrKkQSd8=; b=fvxP2BTG2vlJvOGG
 PublOSHqG307548zzPWYE6pIZE6E79GhiPnSSxeif2V/g5SiIu9r/qyg4VQhN+o7
 +krg7HRQccZS8t/HiuOdrBT4b2ZTRv3vRPViQ83jIBGH+jLDMsofTcjknsaH0usz
 Q4xV9Bx/sEchi0sy9FZ1fFMaLFgzf1MzKyE0q3LwBkl6/VGKd+9Yw9yLkfdylxN7
 C+F4vN/cAJCciQFNNC3LG6OsyAOryVBnQzdjuA3SQC7CQ0beaOGcvamcupBZVnfz
 PeF/LAaQ7KzQXFav3XB4wqge/ks+xi/o+OYtT0BhtWeKnP4ME/nL0IAS+X5aCq8t
 OIWLYw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s1whv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:52:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fac0b29789so20696306d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753195950; x=1753800750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JKfgySS6e/EZJ9CHZwXQOHZ4Nnh1OaO/SrNWrKkQSd8=;
 b=wrRxf0aMseAkCHUn182sTrc9Gkg2pjKeUJyHe8GA4svqH8eWnqgNUZdrsxf1kG9U8G
 aFI1sh8ruRhq38nmswSDrFMjImDRWiTh0skY16/sFyB5sYyAYKwjwTS72lMOheosxBWY
 oI5wP9j0FtN36JkeoVT4IGvUKZki2IHTg3+nKAvMD6foFD7InT87Y+y9Jjo3ccqlPlvR
 YxPsQtZnn0sH3zseNyPDRQHv7Lu8ymSLFPd1lk886+M++c+oTZg9d050l8i1rQMr43el
 c0erifKCPU7WASuway9rf/pE7vX18FjHZFBM4hkQmJC6Zx9ENFKqmliphdTsgFmAXVLZ
 kFTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXmxJ+3I9paHr6GiLbr1Q2yyjIhyVvoHQHMxyce4CmaxYMTdtyJGNhA5dkBae+2nPq0ztfWAYGmzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWIB8oGxKWVDtFYNq/PR4VW7nhqlCBGVOfKsUef/qP25c/Wt56
 9jv+a0D+bU70aP7Pwd/jdsoEP/QKUdp0d42tG1x75hwDSdtilptETgf1JzaUgMlFrtLfsgGZgGl
 dbzYUl5wavoRNt0UCCUhMGNKWjafdP3c//7VicK5gWXv92SWF+RKWVMaTSG5PbsMHdzs1Wgs=
X-Gm-Gg: ASbGnctVbaDNalAfsloH0UrlY2Rz7fsQJidLU6WGM/eOaWZyywXMP54guwNARO692oB
 vjz1QMB8v85L/1DF2UJvG7V70Tkcpc9Xbvdzrefj6els8Uk/H+gp+oaaV7Zst8t6OsCcw83nQRp
 hHtdL6npSAzJZ8EQOCbDmP7XawK2CEw1cRYohGYlwMH/lnK4WrZx3XW2rXUTLu8xe6qR/i28Iov
 PN4td1+PszovmG0/8fo2wi6dX6yskCTc7vhUbPtnxxe0MI9ZkaTceXrp0rC0W3M2GVeZst41eEC
 46asl/8cTQtm5Ag6U/LlfPgqgiyIX8aWOrk2sk9YOLsEIRdch2hrOqXmkcwbaYRD2JVG9LegrVj
 Kg3SX1cnGMntWpo4JBXD+
X-Received: by 2002:a05:620a:2714:b0:7d2:89c2:eddb with SMTP id
 af79cd13be357-7e342a5dc6amr1310280585a.2.1753195949468; 
 Tue, 22 Jul 2025 07:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuJgUU9V6/qKb7uv3smvtN8wrkQjr3Ocrb0xAp9swHWKZD9GzivTqkf1QkinncRE8s3a+Xow==
X-Received: by 2002:a05:620a:2714:b0:7d2:89c2:eddb with SMTP id
 af79cd13be357-7e342a5dc6amr1310275285a.2.1753195948053; 
 Tue, 22 Jul 2025 07:52:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f5d06dsm6945128a12.33.2025.07.22.07.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:52:27 -0700 (PDT)
Message-ID: <30442713-2990-490a-b076-93c3cfc3901d@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-7-9347aa5bcbd6@oss.qualcomm.com>
 <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfXwGo55kKXRsYj
 Tii1OQ9klctzfh2Sbu2KP0KyczZwBAo/RbW3LtcIFpa1Cp6gZuf0ESJPBAKNB4V4POzD7tT0K8T
 142vTJ93mSgHBIQ7GUhadi6QKtHSMu9f4oLByVBbEvbnWo/IQxoyHSOk2eISpG0KnOn45l2H2YW
 lqyV8zwn/K1nIgDy/XnbJ7zadk0uDH6hYsJzuQ0I+9Y90msIvm0FMGLqUiJyIfrxfwJTOH1bvMk
 IQ2MQ5vtDjX18upyKsR2mGXCTVMbpMy0b7g2yWE1bbnrr+w7gzMlaZ4MkgZDJ5RG5CT7lXWyo4n
 wFW6yUdxXkt0ICEWxa2vmdeHUij2NPrThSqIQTx8kHAqv23gIunMDgLlnhNCA8Yi/UQSBbEQm3H
 3k9pBaMda062bUwZ7oDi46FCIrfn/JabBlECVMYEhATRvRPKwxPdJ3a/gBSQEfqp5HKKOnQY
X-Proofpoint-ORIG-GUID: EL65nVEvoFbW_bwxCesQp1hnxpq3ClKE
X-Proofpoint-GUID: EL65nVEvoFbW_bwxCesQp1hnxpq3ClKE
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687fa5af cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5dKzzWTJmYxMyaayncUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220123
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

On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>> There are some special registers which are accessible even when GX power
>> domain is collapsed during an IFPC sleep. Accessing these registers
>> wakes up GPU from power collapse and allow programming these registers
>> without additional handshake with GMU. This patch adds support for this
>> special register write sequence.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -16,6 +16,67 @@
>>  
>>  #define GPU_PAS_ID 13
>>  
>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>> +{
>> +	/* Success if !writedropped0/1 */
>> +	if (!(status & mask))
>> +		return true;
>> +
>> +	udelay(10);
> 
> Why do we need udelay() here? Why can't we use interval setting inside
> gmu_poll_timeout()?

Similarly here:

[...]

>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>> +		return 0;
>> +
>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>> +			offset);
>> +
>> +	/* Try again for another 1ms before failing */
>> +	gpu_write(gpu, offset, value);
>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>> +		return 0;
>> +
>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>> +			offset);

We may want to combine the two, so as not to worry the user too much..

If it's going to fail, I would assume it's going to fail both checks
(unless e.g. the bus is so congested a single write can't go through
to a sleepy GPU across 2 miliseconds, but that's another issue)

Konrad
