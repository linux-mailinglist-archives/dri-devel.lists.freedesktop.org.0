Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D981FBB1E59
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 00:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB7910E16C;
	Wed,  1 Oct 2025 22:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgHtWHf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606CB10E16C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 22:00:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic0aY012279
 for <dri-devel@lists.freedesktop.org>; Wed, 1 Oct 2025 22:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tahmT1PTe+yL6IlloLfwZS8CDuOsIe0H/cgXQSKTibY=; b=CgHtWHf4QYacRtFJ
 F55IPjX3GrlHxD9+Uk2GBUIWvPe04OJTlGfiOBLVizXpsvXq2htqbPQIxYB8YQLL
 I+01S/mg2sXAa7/wg/4t8NA1nGxdG62QHOoKkse6x6Fc6nEtSHHPlQS7oP9XGNEQ
 spwVW+ry0HYHyHGtE4p2L0xIEesd0dmOmoH1MT6P0CQiriUpb2bo203GkdzY8M+h
 sh3Qxv/guKzd1GbQTBAaAtVwZnZ4aM1aUA/n9MusX7I2H5bskLKK0Bblg2LS9ikR
 6Q/OUmO0yWuWb97dyyT/wmVpFnYercQ1EuTL/FI+7W/GaDtETryK2nr8/q7OlOqG
 Z4+Ulg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tx510-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 22:00:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-78117b8e49fso647629b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 15:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759356016; x=1759960816;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tahmT1PTe+yL6IlloLfwZS8CDuOsIe0H/cgXQSKTibY=;
 b=rHCMuhGTwnd7qvtXNFVvzvhEzxvUg7qZ/fApYcndlflRoybZGaPWiGIpnRaSfbvxA5
 8j58UiuLXEt/y235Sy7AHvjZJuNGsw4Rm9VaYzsq6BIpxRzeYxNSw/Q7aK4XiHd75EAM
 aLvWoWBru1ssGzVcaADJ9LNmOfj3Q3ZTnt/vFOyWz/DuVs5xZ6lhvgkOhAYygQjgTiuX
 SDM0tXzUCp2+VGHApOJlHkGRyrEFYW3NuyrTd/PShGYNT8bhP587sik2ZOMxqCm4LNCl
 wZZINStz4FSZHwWGnEpzaV4rsB7mqaSloDl50TkBshlAIwBmaAJXqe/Fnjd+HXAW9UCl
 onVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnDPncpHDcdDy46VkQOY1b/7EJTue3I8J6p6WT6iA4SL4RZEwpupQo4x17ZKRTrUDO18gldyTP2eg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/v2cCVaVv0dEE+Pza+GkjsROdHsEGFFsyrR9ZAPyTIfu9fIJv
 e0yBr1Ej11nU5tmCphcK020nGuyqicZpNYxScIXkJ6dN3ToAUK7Nrg1wNfGUcBDC7mCgqJaauaY
 RNrRkouI4at91VgJis/KTeuXa7VtdHfT7S51DV4jJ6lQp7ELFENfQi/1FRiTofc3e0DuvhXE=
X-Gm-Gg: ASbGncvheskBwOXFvOZNsb6bKM3rQfoIyCCbYjl6x82W72gaCApba0jMjIB9AgxVhGp
 El96t8CaF6OB95sSWoJnYPzuSDlZAP8oUnnlSAMPTCDo7G8NOqOqGLnMXJUtp9LERWoBl0tPeJD
 c9m6bh3P0ZFkLoj9BrmFPH0p5nHchbPC0X/FcTqejCyvlVmJWmErqKaPmbkjCCtQFbItAsWzHNQ
 6cPy3CWTKjjzdMi3BtokHmTAlDUczd1Ww6gtgYgE1fg73b+1Ij5bClWz6QtW2L1ymd66AgU6qvE
 hXK530LVOPRm/MXpDtjsaumWhUyluE9XlJsrod1nHVettFAUqqblsD9rIXbnazVGVzw=
X-Received: by 2002:a05:6a00:98c:b0:781:b23:6b7e with SMTP id
 d2e1a72fcca58-78af41efa31mr5716907b3a.15.1759356015511; 
 Wed, 01 Oct 2025 15:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHifSlan3h5RBjjCLPaJeaE4EOWmKdwWuMjDg/ZbUeJT6bjRGbcINV4nFTXqWDsiHfMn8qoQA==
X-Received: by 2002:a05:6a00:98c:b0:781:b23:6b7e with SMTP id
 d2e1a72fcca58-78af41efa31mr5716824b3a.15.1759356014792; 
 Wed, 01 Oct 2025 15:00:14 -0700 (PDT)
Received: from [192.168.1.9] ([117.244.71.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b020938b1sm636738b3a.83.2025.10.01.15.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 15:00:14 -0700 (PDT)
Message-ID: <26e29a80-df70-4ffb-9cc0-8b1ab74873ce@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 03:30:04 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 13/17] drm/msm/adreno: Support AQE engine
To: rob.clark@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
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
 <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
 <CACSVV01UygpiUj0m_Ppd_LSxvW0MFunz+Lfhg20XHR7vyOBx7w@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV01UygpiUj0m_Ppd_LSxvW0MFunz+Lfhg20XHR7vyOBx7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX8zlKAPIBY7JD
 iVwkszJ2lonIf5P1bueNG6PPNhIIVzeKZO6uxFVJWyKceJAYsWeRK7ek/+4f1Lt/YwpTuha8gso
 GcVmdHPVOOX69+PtuLwRPydIvLSZm87pNVPiv6tPCJAbt5/l4T3sAqbEEq0GhdAsjGKUbZk82zr
 AS1qM5f6wHlA/d7gMZ3WkVB8IKogqJDBZj1kxWkPIQrkg8quibZ+XlrHiCfqw3pY73i6BhlD1/1
 NBq6tmNtrHgFNLUh4SsXVryQCcxGYhfgvCydP1hdD3rt1DrefaIsPDo7GBwLueeWTXJpyN5vJhv
 WDBPwriNxa+GkefWPB+Z8eSgTvUe3JT9Kl6hBdkCdPvOnOqls6T6jG19uMQ9mQoFunr6EPf0E04
 vVsNjHkKLwSfBPSVSWGK8qsYMk1YyA==
X-Proofpoint-GUID: 2SCYlovr1C2OrkVTow4vLNFitbMfdX4z
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dda473 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=2kejHg7nZSoTgEpwAwsXNQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=neJfBgYAGg7YAZYFY1IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 2SCYlovr1C2OrkVTow4vLNFitbMfdX4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
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



On 9/30/2025 1:57 PM, Rob Clark wrote:
> On Mon, Sep 29, 2025 at 10:51 PM Akhil P Oommen
> <akhilpo@oss.qualcomm.com> wrote:
>>
>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>> in Raytracing related workloads. Add support for loading the AQE firmware
>> and initialize the necessary registers.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 24 ++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>>   drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>>   4 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 4aeeaceb1fb30a9d68ac636c14249e3853ef73ac..07ac5be9d0bccf4d2345eb76b08851a94187e861 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1093,6 +1093,30 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>>                  }
>>          }
>>
>> +       if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
>> +               a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
>> +                       adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
>> +
>> +               if (IS_ERR(a6xx_gpu->aqe_bo)) {
>> +                       int ret = PTR_ERR(a6xx_gpu->aqe_bo);
>> +
>> +                       a6xx_gpu->aqe_bo = NULL;
>> +                       DRM_DEV_ERROR(&gpu->pdev->dev,
>> +                               "Could not allocate AQE ucode: %d\n", ret);
>> +
>> +                       return ret;
>> +               }
>> +
>> +               msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
>> +               if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->aqe_bo)) {
> 
> a6xx_ucode_check_version() doesn't do anything for aqe fw (but also
> a6xx_ucode_check_version() should probably bail early for a8xx at this
> point?)
> 
> OTOH if over time we keep growing the version checks, we might need to
> re-think how a6xx_ucode_check_version() works.  But that is not a now
> problem.

Copy-paste miss. We can remove a6xx_ucode_check_version() until there 
are some security or any other major fixes in AQE firmware.

-Akhil.

> 
> BR,
> -R
> 
>> +                       msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
>> +                       drm_gem_object_put(a6xx_gpu->aqe_bo);
>> +
>> +                       a6xx_gpu->aqe_bo = NULL;
>> +                       return -EPERM;
>> +               }
>> +       }
>> +
>>          /*
>>           * Expanded APRIV and targets that support WHERE_AM_I both need a
>>           * privileged buffer to store the RPTR shadow
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 18300b12bf2a8bcd5601797df0fcc7afa8943863..a6ef8381abe5dd3eb202a645bb87a3bc352df047 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>>
>>          struct drm_gem_object *sqe_bo;
>>          uint64_t sqe_iova;
>> +       struct drm_gem_object *aqe_bo;
>> +       uint64_t aqe_iova;
>>
>>          struct msm_ringbuffer *cur_ring;
>>          struct msm_ringbuffer *next_ring;
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index 6a64b1f96d730a46301545c52a83d62dddc6c2ff..9a09ce37687aba2f720637ec3845a25d72d2fff7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -599,6 +599,9 @@ static int hw_init(struct msm_gpu *gpu)
>>                  goto out;
>>
>>          gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>> +       if (a6xx_gpu->aqe_iova)
>> +               gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
>> +
>>          /* Set the ringbuffer address */
>>          gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>>          gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 6a2157f31122ba0c2f2a7005c98e3e4f1ada6acc..3de3a2cda7a1b9e6d4c32075afaadc6604e74b15 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -27,6 +27,7 @@ enum {
>>          ADRENO_FW_PFP = 1,
>>          ADRENO_FW_GMU = 1, /* a6xx */
>>          ADRENO_FW_GPMU = 2,
>> +       ADRENO_FW_AQE = 3,
>>          ADRENO_FW_MAX,
>>   };
>>
>>
>> --
>> 2.51.0
>>

