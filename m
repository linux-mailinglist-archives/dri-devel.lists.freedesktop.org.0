Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FFFB15295
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 20:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968EF10E665;
	Tue, 29 Jul 2025 18:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2TITawp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B185710E667
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 18:20:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9GMi9004936
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 18:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lcsta1yjIbei4fuovlusUPalhkFx/bRo2Mx3CVdJirA=; b=Q2TITawp04pzzAhu
 xgbOv/S3s9a9GWetJyEZIkSGmrKEpvOPuMlD7Izf4baGmdaurpXRt9l+ANFsEoWu
 w73V3gK+5KM5/kVy9RKGiziNE18pFPqGNZWLvJsTjQcopKW5Tj/kb6/8OXuBN5CB
 L7NUd+ZIKA8UdLD5hblJYL170pAh0Uow/7/7cveYRpNmfzURSX2MvJaL1VE98tys
 v/8jgbJ7/PaJq0mPYXyYPx7SmFX+mlgm3Xl/WcOZiJbSJD8FySltSjB/Y+gE8jjC
 84SlWIWs7NzpLOUN5rCISI1Dt0XWXK128LqYaozH+l8WFR/OPo34NSIP0nz2WtPF
 AHn/Lg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr9amt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 18:20:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-237e6963f70so102175115ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 11:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753813201; x=1754418001;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lcsta1yjIbei4fuovlusUPalhkFx/bRo2Mx3CVdJirA=;
 b=TZH6Nb2KWmJNdRhfM+RhKZt3oJl16b5xHGFW4fHgkuACM7Ku/BAPb2PqWcs7D0zBqx
 dgpVdFLqzeqKbnEeU8i7P91BTOTvLvhOLtYRRRzqXcKxWktKpz+kD9SUuQ1eLmUjF51p
 gneWLEJAFxwtFwe5sBLSPcm5uLj7H28XJ34WJ04zdCx4YalQBKFB9lQrNUqHGxDn+whz
 Dw+3W7gPlv+SbLOeQnk30SJaKHQ0URbvkwCVZYyHNiflxZo4S7L7HZp7oSsN1Bw1t5BC
 BduhrkaAgjl4lLedWFfMIbQ2lQDB4KQwoPem6RYMKQ/X7Hnmgv9V48UFfuRCW5T2jW8F
 tYLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWrl4/GzDDfowx+xrL8uRzL/e4PTySvO4tbmWk4hNZOz5lRxcFMtcW1bUGIdGICSt1gkAfD50kXLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPYLTRkUnSAy9nVcmbnlNA+lOlysoYt6wVP1UTqU1gVYmlJ1NA
 ZoNDy+KckTV3MtdA4q4vyJc1tew74hOd63n2mTErXNv8utHZ5nIq60ALDrLFLpPYNJvgDohlxEj
 kbCXrEEI/djgH25nzwFOlHrvU/mTMEwSbZ3O/6uYQjZbZkdZ0SrH17M2b2s+K3tUWZuPUlJk=
X-Gm-Gg: ASbGnctFwQqF91OQ0q+6fclW7Vp4eHZKDVYJmxYXb9ByKgk3eK2oRq3jzywkXSWCF4d
 LasIx3ZaHLvCsytvrpwHWiJ12Dzv+vEVS6cs5llEvu6lESrbOB7YWXgfBN+DINKov2oEGratKn7
 L5M1OAtwakTEbQbrIoeADmKpsEbPGruv827rKmGCGh8w2FnCmVVPLb+yCD+C+Mlj34teZNfK6KM
 tqhKRya7FLCdS4nwI0WrZbDMm+tygzlFFrLv7bmZ9FUK0YShUaWiyJjnfR8nyqjsg6GgPdc50E/
 ZiBTULnYsnrAZTFOSoGKDkXT70jbO9jr2KIRSZ/pkER5k9qYeQG3oksouzDjbO4W
X-Received: by 2002:a17:902:d4cc:b0:240:6406:c471 with SMTP id
 d9443c01a7336-24096a4f7e5mr4814525ad.10.1753813201078; 
 Tue, 29 Jul 2025 11:20:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa6BasIaRExFV/BwNT4qsayfxOvO5gmjUpfnYyJ28K3IONSoxFXWJUahLqssfmGes+zOsqug==
X-Received: by 2002:a17:902:d4cc:b0:240:6406:c471 with SMTP id
 d9443c01a7336-24096a4f7e5mr4814125ad.10.1753813200416; 
 Tue, 29 Jul 2025 11:20:00 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.231.177])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ff1dbec8esm68679145ad.194.2025.07.29.11.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 11:20:00 -0700 (PDT)
Message-ID: <c44eb0a7-3656-412e-8b21-fdc52866c0a4@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 23:49:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <cfbad162-e629-45c9-8436-74bb6fc416f2@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cfbad162-e629-45c9-8436-74bb6fc416f2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDE0MCBTYWx0ZWRfXwSA8Ruf2Rt+6
 zTtCTw3TAsAm4ahUAgEzu+70XFfN0j5jj9nW4cKi35lMiLNRMWpFQ4Oes94FU+UxFVFn3bY60XL
 yyO45rna6ot5TH+bN1oCcyNUwUtLcoGAWr0bNl/KA4YCuIZ+WlvVDdPa8VpoVZL34s9FL3reokj
 DDhJpAg/ehad5Km2Fka0ORzyknI3Lj26xg8GZ8k2bF1/veR45yHMPua7cv8bqWealfgiZQBkAfn
 V/Fj5iJnL8Q/7YFcUHjveconvjhSiGyzlVbdBbuzXo9iaZWpbTTpWxxJDiV+O6PhBDTWbcxL/N4
 I6pPqot58dI4nlXXiSibNhhaBorQ7lK5FRRTRDGXZBl7kap578LRRFnFbr2FrRHGd5zplEoYAmJ
 inK9/U1H7OdrKPajoT2FvwYEa647CLBUP3e3ZD/h1bl1pDlLkQNEvHaBaXC+RpJHv9cxKB0e
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688910d2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=9XpMM9ZEX5jLuhR58p3+Fw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=oxwwQDlBbdW4oIJT5RMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: clyMG5XTanPEXgpl_BZibHgpUcWDv_Bt
X-Proofpoint-ORIG-GUID: clyMG5XTanPEXgpl_BZibHgpUcWDv_Bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290140
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

On 7/29/2025 7:36 PM, neil.armstrong@linaro.org wrote:
> On 20/07/2025 14:16, Akhil P Oommen wrote:
>> Add the IFPC restore register list and enable IFPC support on Adreno
>> X1-85 gpu.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 +++++++++++++++++++++
>> +++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>   3 files changed, 78 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/
>> drm/msm/adreno/a6xx_catalog.c
>> index
>> 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[]
>> = {
>>   
> 
> <snip>
> 
>> +
>>   static const struct adreno_info a7xx_gpus[] = {
>>       {
>>           .chip_ids = ADRENO_CHIP_IDS(0x07000200),
>> @@ -1432,12 +1495,13 @@ static const struct adreno_info a7xx_gpus[] = {
>>           .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>           .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>                 ADRENO_QUIRK_HAS_HW_APRIV |
>> -              ADRENO_QUIRK_PREEMPTION,
>> +              ADRENO_QUIRK_PREEMPTION | ADRENO_QUIRK_IFPC,
>>           .init = a6xx_gpu_init,
>>           .a6xx = &(const struct a6xx_info) {
>>               .hwcg = a740_hwcg,
>>               .protect = &a730_protect,
>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>> +            .ifpc_reglist = &a750_ifpc_reglist,
>>               .gmu_chipid = 0x7050001,
>>               .gmu_cgc_mode = 0x00020202,
>>           },
>> @@ -1459,6 +1523,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>           .a6xx = &(const struct a6xx_info) {
>>               .protect = &a730_protect,
>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>> +            .ifpc_reglist = &a750_ifpc_reglist,
> 
> So far it's stable on a750 so I think can safely add ADRENO_QUIRK_IFPC
> here aswell.

Thanks for testing. I will enable it for a750 in the next revision.

-Akhil

> 
> Neil
> 
> <snip>
> 

