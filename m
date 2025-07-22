Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8441DB0E537
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 23:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571A410E1A3;
	Tue, 22 Jul 2025 21:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Inhn0cIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D289610E1A3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:05:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKU3of007442
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0355SZkFbrW4clUa8O8bfxTWToKcdMQi7Sj9d0UwLZs=; b=Inhn0cIHMZRRlzL7
 bg+q0pzZBRRLjjBpEcaBW3ohg5fF33XXvQXIm1imaeRIvhPE6+LZizPx901aOTSu
 axaEaoZjfOPT3gnQuWqLScMQT0lMUpRijQQ7zG2G+lCUI8ru7ymvsiFuCr1DW9m9
 bFbISlAgrw6f1uDgzRAbkHao0vJOhWqD1Qaa0u+Wd4c4whUZAFmJKhKtO9h24+Au
 YDwj+syxHybXZ6OvAeI/ppyzGv0U3xcpLLJjMRyMT/xznmPKfkdTQ73R1qH9lsde
 /z21AASY06JAmceQay5N4TkowXx8Pb7UktzP9Ku8JpzPVTn4QCQ4416JelHOB/Wq
 R6TGpw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3enp6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:05:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b2c36951518so6770587a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753218337; x=1753823137;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0355SZkFbrW4clUa8O8bfxTWToKcdMQi7Sj9d0UwLZs=;
 b=oMf4erNDVcdqAR9EuS+2VQpdWN8jNZT37Kg4JO/uoNsIxatEDZrNZFamLvjnEZRkkZ
 c1gTB1/cHWp1iacm1+VczeiyxDK5dVZupKcIpwB3c2u6AsNIC6rbv+nCjwG42aC+u4jM
 EcwYMJrEAT3AKIzvEw7yK1SI0QHOtduuS1xOG93IyQBJYzjkqEFF1mpQf+Ys5govj22g
 FPdcKKqJvEdf7pAuxNTyr1Ycn7eLw3aOYucWJ5BTpVdMMCW7anR/2jhCwyTRp0Ndwj3D
 qqdiNnKAPQk08LnAALXvhYYjLEpk3mBcZiNOLjFjwt/htnuDII9c6C4o/yzcP1UYj9az
 qf4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3NNGAwJuMcINclh7Z5bFE8hqE+pILvuTQ3rkBPCtslWt/YruC1zCmmmPaVVFi+s0OEPA4rUZNva0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX8f8zFBUUETy0LJZ7eK5p+Ahjn/Xd/7m3g2sqYyAMAaqk4qyo
 e9OZb4wcKjgDmIy0jcpmQOAfdzRAEy9NJlAjO5k/+NKw5qCs55doSiMuN2SJRkHJGwAs9ra4bTV
 iuIumh0jXAw5i4IpI3blhCEidzn42AarcjcTdaAvkHvspsfj90pbPvNEaNi3Pwp3SFb1wkMY=
X-Gm-Gg: ASbGncv7ofXqgGAxkNEj4esg0tIDjF1HEKcD/KHuq3dYCgacjGJyHWut3aMFUOySHcx
 vNQOmwdOlHlxyRLS7xdr9LduMeHWM384ZXOsUdCX6OKMxnaPglZCw3uHLV2KOaSylI2z1hFvm2s
 KsxRoGym9EftkY59Bt9MzKbIrxtgIaTHcovN9mSUVoadfFkflVTcHYOXUWTqgzvZuBklbJGHZUW
 Ef3M2NHbIdE6p3ikoz0nKFB5jONT0h/O5wMvBxpvZMhHYP166puaCK19lwHSNxajCrhDJlpfwSI
 V1qAMgfcYd9Ij/JQe4DA1P2aiF/xn9SQQ04H4jSlN9YXQf0jB34QcHuBITMNij+g
X-Received: by 2002:a05:6a20:4324:b0:1f5:8eec:e517 with SMTP id
 adf61e73a8af0-23d48fb2511mr523025637.9.1753218337004; 
 Tue, 22 Jul 2025 14:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1BjhTkdCWRXxjTiz3Zh9W88aQWhh4MT8oN3QDovcTtPwknTU/tKfCx8XWQk2PaJJlB2Ehhg==
X-Received: by 2002:a05:6a20:4324:b0:1f5:8eec:e517 with SMTP id
 adf61e73a8af0-23d48fb2511mr522956637.9.1753218336447; 
 Tue, 22 Jul 2025 14:05:36 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c8eb0e98sm8313876b3a.66.2025.07.22.14.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 14:05:36 -0700 (PDT)
Message-ID: <f1070069-7220-4351-845a-2929d1e65a71@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 02:35:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] drm/msm/a6xx: Fix PDC sleep sequence
To: rob.clark@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-5-9347aa5bcbd6@oss.qualcomm.com>
 <avni4utnzdmmafc2mf7aqgva3osbhuiqtia7gdngqswk5cmtn6@zo65ir7gyj6y>
 <CACSVV0346j2y-1Jkj=wasekYy5syax_E495AQZv0bvrrqwCSRw@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV0346j2y-1Jkj=wasekYy5syax_E495AQZv0bvrrqwCSRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OHDH_Yf-35Bpv-0jvnNqpBUHLbvwprTE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4MiBTYWx0ZWRfX/zYc4P6zGUIq
 N5J36ttCIwbwJzO6im7TYuHzDbDK26n0gr+HOLG2k6nCYtaOJOzJQaOfUx2hgvJ4IXggMSjOQYs
 C7DBS5wTmr0aGneZU19ipLNN3lIw7T61tiHGkNQn1jK5+xrzJXtqK67sqadoHhSNUEfUCx4POzC
 3zrP4NKM/e5ZeheMxfR97D+gENUBqljjyyN1i94drn5HPVg8p97cobRDsSs7pmDWETsY1bCqr1c
 m2+Q6C0BnkTscGfiUKy9LO5WnndXdWrLGG7O2L8tFf745a03UvfIQvY03RbOM2m727giBnTsPJR
 C/rw16QyicGzJ+4cWsaf34vTw4yBSEWkxPKVcHqxfdTRg1lR//PdmHkMHvWvPO+ZCx2UQlk20G/
 wHL3PYGlQLrn5oVKWpDegCkOmOcSCs2ZI40UsvYqsO9ReHI3a6lDRn0ColO58QFNhlmnsmDV
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687ffd22 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=q7gkdMK14rNBkceAJS4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: OHDH_Yf-35Bpv-0jvnNqpBUHLbvwprTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220182
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

On 7/22/2025 10:56 PM, Rob Clark wrote:
> On Tue, Jul 22, 2025 at 6:33 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, Jul 20, 2025 at 05:46:06PM +0530, Akhil P Oommen wrote:
>>> Since the PDC resides out of the GPU subsystem and cannot be reset in
>>> case it enters bad state, utmost care must be taken to trigger the PDC
>>> wake/sleep routines in the correct order.
>>>
>>> The PDC wake sequence can be exercised only after a PDC sleep sequence.
>>> Additionally, GMU firmware should initialize a few registers before the
>>> KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
>>
>> s/KMD/the driver/
> 
> IMHO for gpu things "KMD" makes sense, to differentiate between kernel
> and user mode (UMD).. this is perhaps different from other areas where
> there isn't a userspace component to the driver stack

Ack

> 
> BR,
> -R
> 
>>> GMU firmware has not initialized. Track these dependencies using a new
>>> status variable and trigger PDC sleep/wake sequences appropriately.
>>
>> Again, it looks like there should be a Fixes tag here.

Ack. I guess it is not a bad idea to backport this one too.

>>
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 30 +++++++++++++++++++-----------
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
>>>  2 files changed, 25 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 3bebb6dd7059782ceca29f2efd2acee24d3fc930..4d6c70735e0892ed87d6a68d64f24bda844e5e16 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -279,6 +279,8 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
>>>       if (ret)
>>>               DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
>>>
>>> +     set_bit(GMU_STATUS_FW_START, &gmu->status);
>>> +
>>>       return ret;
>>>  }
>>>
>>> @@ -528,6 +530,9 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
>>>       int ret;
>>>       u32 val;
>>>
>>> +     if (!test_and_clear_bit(GMU_STATUS_PDC_SLEEP, &gmu->status))
>>> +             return 0;
>>> +
>>>       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
>>>
>>>       ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
>>> @@ -555,6 +560,11 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
>>>       int ret;
>>>       u32 val;
>>>
>>> +     if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
>>> +             return;
>>> +
>>> +     /* TODO: should we skip if IFPC is not enabled */
>>
>> Is this a question or a statement?

It was a reminder to myself which I forgot to revisit later. Will
addresss this in the next revision.

-Akhil.

>>
>>> +
>>>       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
>>>
>>>       ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
>>> @@ -563,6 +573,8 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
>>>               DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
>>>
>>>       gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
>>> +
>>> +     set_bit(GMU_STATUS_PDC_SLEEP, &gmu->status);
>>>  }
>>>
>>>  static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
>>> @@ -691,8 +703,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>>>       /* ensure no writes happen before the uCode is fully written */
>>>       wmb();
>>>
>>> -     a6xx_rpmh_stop(gmu);
>>> -
>>>  err:
>>>       if (!IS_ERR_OR_NULL(pdcptr))
>>>               iounmap(pdcptr);
>>> @@ -852,19 +862,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>>>       else
>>>               gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
>>>
>>> -     if (state == GMU_WARM_BOOT) {
>>> -             ret = a6xx_rpmh_start(gmu);
>>> -             if (ret)
>>> -                     return ret;
>>> -     } else {
>>> +     ret = a6xx_rpmh_start(gmu);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     if (state == GMU_COLD_BOOT) {
>>>               if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
>>>                       "GMU firmware is not loaded\n"))
>>>                       return -ENOENT;
>>>
>>> -             ret = a6xx_rpmh_start(gmu);
>>> -             if (ret)
>>> -                     return ret;
>>> -
>>>               ret = a6xx_gmu_fw_load(gmu);
>>>               if (ret)
>>>                       return ret;
>>> @@ -1046,6 +1052,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
>>>
>>>       /* Reset GPU core blocks */
>>>       a6xx_gpu_sw_reset(gpu, true);
>>> +
>>> +     a6xx_rpmh_stop(gmu);
>>>  }
>>>
>>>  static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> index b2d4489b40249b1916ab4a42c89e3f4bdc5c4af9..034f1b4e5a3fb9cd601bfbe6d06d64e5ace3b6e7 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> @@ -117,6 +117,12 @@ struct a6xx_gmu {
>>>
>>>       struct qmp *qmp;
>>>       struct a6xx_hfi_msg_bw_table *bw_table;
>>> +
>>> +/* To check if we can trigger sleep seq at PDC. Cleared in a6xx_rpmh_stop() */
>>> +#define GMU_STATUS_FW_START  0
>>> +/* To track if PDC sleep seq was done */
>>> +#define GMU_STATUS_PDC_SLEEP 1
>>> +     unsigned long status;
>>>  };
>>>
>>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
>>>
>>> --
>>> 2.50.1
>>>
>>
>> --
>> With best wishes
>> Dmitry

