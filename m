Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E4C6B0FC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 18:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6AB10E121;
	Tue, 18 Nov 2025 17:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwmT8sKI";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aw+HoVOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D6A10E121
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 17:56:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIE0bZ8385449
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 17:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MGfq3+o76gasNqjhRUD5fDSxtMn7/maZ/Vlsn3dafG4=; b=VwmT8sKIt895LNEz
 nwSV2POpOiQMw4EJCsVpK5GouVyWWNQZJ1P6cik/hjPgO4GxpurwtjD7LuUnMYb/
 bPWDsi/sXEfi4S4XbTcgu0LrBRo0GYJXljXPaMAy1HqQy46w+FmJZM3bHqzPC1hc
 GkpMr/ezsxZFq8ynz9hbFSU5g5Nh45FC4OBrq+/RBzt2KRz14Obd/pVyhaBNphZB
 R2BBcweU7do7EBFhZTez5gotoEl5BwAluHE2aRi/TUC6HiKkB0RO314WJ2lZZB/K
 cSGPE71k5SWTGHiMbjNPHDdNRjI9/XXy8OccCbSEnVG8YXLYT6lTMfst37Ml9csq
 d1XdFg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8keh2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 17:56:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297dabf9fd0so75134475ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763488607; x=1764093407;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MGfq3+o76gasNqjhRUD5fDSxtMn7/maZ/Vlsn3dafG4=;
 b=aw+HoVOpaS/qKmB8nn/XlaKt8xq/qwpUE8dydXvEOq4rgiRXQlRckVeTfzkMUzHszo
 Y7f3RXrKGT/T1cl2scc6YoipHINkZRMJq785N1bhsRMml657PBERiYr0Kiq0tR9CG4v1
 VZ6ZyJ4BQLwH5DsVUR+LBBbNSHuG/qoMpF4MCSe1ElFo+uRYLq7mjuZF7ESK/YrPlJK5
 GEEFzuxmKxu0/6vDb+xtLCHB+RCFMeW10jXnUQ4W9eDHaP+jFNtRxdbuse+CRP5ZA9zU
 6pEeilByHc6kzSBjjxtIB7PTrhJs4cWfz+8YVkYRaQ17K7hUTWPdH17d4CF6iIJ/r8bh
 rtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763488607; x=1764093407;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGfq3+o76gasNqjhRUD5fDSxtMn7/maZ/Vlsn3dafG4=;
 b=rvGgwqFftwWHcTUp5mkLtjWn2m7fySSFLogjlM6fX7K22yoh3pQSuqA9FEzwxbFQ6N
 OiWHcj/BMEBzS6r1ypa0j2MuquSrEaDmKGYAU3Lm4OHXNmnDuC5S/hmjIb+peq1hf3ro
 0He0eMW5pYRC0EsPNcafkkTncRKQ2XhIEuPd9PcYcKfkdqJfKCbT4eS7oU/s1z6Ap+9M
 GIfDmiHBPChuMChJ9kmFcBrNfzOpi1b3vA4a4xMqubNLYGchjFvZ+NH3zryx/X/Fyhja
 4XA86QjUN8IpB8AiXfQvVtUkXWsxbW8mFsfVDv4Ri0Wtxrg9JCVOsHJDzTOhA6pBdIgy
 J+gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxl2dYrliYM4LiivKJk0HPhxrc9saTJlFY6qjn6iRXKepgumPn1SQ7aEby6KHwkoYLvE6cztb7Wck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6vtEq8MaG+0G2olfyn1U6Fp8+aN//RNiBeXKHaZmFws/n+n9R
 VuPEU6W/EF2N4+9/1j6tVHfsYCulZhTO7G+liA/9/1zTffoewlMfC5+q3DaTC/ulAmWXd0HeuHk
 wpvhWi9yjn/ONlOmAe5cFPSGi+Zk5GvscvhxWz6Oj5m++1k8WkdpBGkEvOOKAH4hMTk2GWUg=
X-Gm-Gg: ASbGncvGekli8esaTpTkq+/3D8JtBNtQ2aqEIXH+lWN3+iZ/LABrHHZ3EOvew2qFsq4
 lQsYRtN9DtGbXQXJEl1jE/h1jeiDIgu69UwX7SKtZvdU5WGuLMmQ80uQrLhlvaVphTkhtrizXc1
 tSlAejB/Ru9zR2VFlpthJ9HZpz7UC0Qbz+BOASTTxz9x/iVnSVk5ScQr1+M7YWEdj9agS0UBcgw
 AUFsDyYT9uwnh6U+GmtX+WeA7NQaz4XAKAvaqYAD+qYfwLwyn+Wl8K6+dk5QPiEHmQD3KGOeRoA
 UnWjWF43osm/R5qIgX7RTsWWPrSd0uGRY9hsHrHfy30A5XfNiZjWDAdVXrZAXkji5htpQPh75L8
 nOSyiEQTQTde7GxCempZXaEk=
X-Received: by 2002:a17:903:388d:b0:298:8a9:766a with SMTP id
 d9443c01a7336-2986a76744amr178497575ad.53.1763488606640; 
 Tue, 18 Nov 2025 09:56:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQlMErgROQXlsJJoTVKsYRv9QN0O/2YGJMmSrS6nuYJu/7XEVDBts4CiDzoWr4bcLhtAddlA==
X-Received: by 2002:a17:903:388d:b0:298:8a9:766a with SMTP id
 d9443c01a7336-2986a76744amr178497255ad.53.1763488606089; 
 Tue, 18 Nov 2025 09:56:46 -0800 (PST)
Received: from [192.168.1.13] ([106.222.233.13])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2346b8sm181565255ad.16.2025.11.18.09.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 09:56:45 -0800 (PST)
Message-ID: <dcaaba7e-1073-4900-a4c8-88dac40be434@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 23:26:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
To: Connor Abbott <cwabbott0@gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
 <CACu1E7HzsnSjz0SiUJT0SMNJ7cFhiNdtUE9jKHpvD3UzG6EegQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACu1E7HzsnSjz0SiUJT0SMNJ7cFhiNdtUE9jKHpvD3UzG6EegQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jjCT0T7bMMSCSSu--ejloG1bGeRm1a6V
X-Proofpoint-ORIG-GUID: jjCT0T7bMMSCSSu--ejloG1bGeRm1a6V
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691cb35f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=/VsID1VB8JbHTH3F2fYZMQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=neJfBgYAGg7YAZYFY1IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NSBTYWx0ZWRfX8mGKs6nmzOqn
 TLHHxC+QanrjuCeXK/SnCERJR06vJ6kUFIJlIkyfB9P8JZz0rW6iMBBEpCSKiwqwShUILBKLj+0
 32ExPE0YSguo6HP6vT7aA6zOT955lMlOnmA7aT5A9/nT9tO5THIFTgUEp+CIyIZ2dSnJ1CM2fDa
 elNXivUIVUraVz3Gxe/HVYjkDSbOQ1Bd1Ze8NfbRAyWY5My7w1aqZ5EyjG+i2E2k13pqWVTOGie
 /Mb5JZHY97Db2/fpomEqMkcaw8JMcw5jYYisEP2c4/jG9h/nyUB3ToJb3RZycG4O7WjHtgy1ZM7
 908tPUqL6yCWoMyc9duN7oKDX/Qb0xo5FrK6hjH9+fxm9kAcNZZqsxruNn5NMHLxCNgzUzcIDtL
 rMzPJB+Jxj51uUAqQYEagmDuuTeEEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180145
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

On 11/18/2025 9:26 PM, Connor Abbott wrote:
> On Tue, Nov 18, 2025 at 3:53 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>> in Raytracing related workloads. Add support for loading the AQE firmware
>> and initialize the necessary registers.
>>
>> Since AQE engine has dependency on preemption context records, expose
>> Raytracing support to userspace only when preemption is enabled.
> 
> I guess the plan is to expose MSM_PARAM_AQE later once preemption
> records are in place and for now just load the firmware to ensure that
> people have it?
> 
> The interrupt error handling is still missing, but I guess that can be
> handled later if that's the plan.

Correct. The stale 2nd para in the commit text will be removed when Rob
apply the patches.

-Akhil

> 
> Connor
> 
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 22 ++++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>>  4 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 810b64b909f5..9a643bcccdcf 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1118,6 +1118,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>>                 }
>>         }
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
>> +       }
>> +
>>         /*
>>          * Expanded APRIV and targets that support WHERE_AM_I both need a
>>          * privileged buffer to store the RPTR shadow
>> @@ -2400,6 +2417,11 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>>                 drm_gem_object_put(a6xx_gpu->sqe_bo);
>>         }
>>
>> +       if (a6xx_gpu->aqe_bo) {
>> +               msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
>> +               drm_gem_object_put(a6xx_gpu->aqe_bo);
>> +       }
>> +
>>         if (a6xx_gpu->shadow_bo) {
>>                 msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->vm);
>>                 drm_gem_object_put(a6xx_gpu->shadow_bo);
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index e6218b0b9732..3a054fcdeb4a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -59,6 +59,8 @@ struct a6xx_gpu {
>>
>>         struct drm_gem_object *sqe_bo;
>>         uint64_t sqe_iova;
>> +       struct drm_gem_object *aqe_bo;
>> +       uint64_t aqe_iova;
>>
>>         struct msm_ringbuffer *cur_ring;
>>         struct msm_ringbuffer *next_ring;
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index c9cd7546024a..e011e80ceb50 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -627,6 +627,9 @@ static int hw_init(struct msm_gpu *gpu)
>>                 goto out;
>>
>>         gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>> +       if (a6xx_gpu->aqe_iova)
>> +               gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
>> +
>>         /* Set the ringbuffer address */
>>         gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>>         gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index c496b63ffd41..0aca222c46bc 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -27,6 +27,7 @@ enum {
>>         ADRENO_FW_PFP = 1,
>>         ADRENO_FW_GMU = 1, /* a6xx */
>>         ADRENO_FW_GPMU = 2,
>> +       ADRENO_FW_AQE = 3,
>>         ADRENO_FW_MAX,
>>  };
>>
>>
>> --
>> 2.51.0
>>

