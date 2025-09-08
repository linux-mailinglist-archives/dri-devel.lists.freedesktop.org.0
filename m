Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D5EB495E7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 18:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F1710E572;
	Mon,  8 Sep 2025 16:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORj47Ymd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C115910E572
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 16:46:23 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GOkVn018353
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 16:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R9pcsmAoSHVDbbzIiULdZ8NEWiWLl5JSAmvUzsmuP4E=; b=ORj47YmdAQmkECZh
 tOfrKf8nCXKCdNzCXBdWdwAUyakfGyQ8gZ9viFQ4kXjpuL3huEUZi8QaLPT4nh17
 Hdf7ezKPZSsrD+4AM4zDjfHYxLyLtIAS2rakmgdnfR/mdITP5F4lctw6u2Ym82DW
 x2F01btgRZWuoaCv75Ui8L9EVVNzY52dM6sinUtKj+ejiHiu7b55zU4tqZZw3WRP
 QjF2TCjrPeKOFsFy9XlqqFugNDzWJGnEaqBx1yfuWI//T/UESts8+lgohR2FIQdw
 WuDEXXDdOA37GMbeHmTgYs6m3CoMULT8H4CbGEkb+4UAT79tiWX81m9NliCjmytp
 N/6t9w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8dbe2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 16:46:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2507ae2fb0fso25893755ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 09:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757349982; x=1757954782;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R9pcsmAoSHVDbbzIiULdZ8NEWiWLl5JSAmvUzsmuP4E=;
 b=UI/eqbnzXw8grFOj1mBy9Q7deeSVbExssC/1boK0S5NJYn54/zcV1XX9I8rGZ+ri8h
 fRwR2PwF4V+y0C7+rdi+Kz+OXJ3pYNBI3fQYG79c+Wv0DQivJM0dLwmKzk37ujjCftm5
 hWVQxsdE24qGDU40QBUtpzIR0Y7OfSzfFaJdhTe2zhRoslEgFLePTcsxuU166Dz39XXY
 Xskckr0QUYFuK9r24OkAOKvx4lX/ksdRe7E22aNS2/+diwR/1emULrJ/UybtIcCeV+tJ
 gDyHqcQzwi2lLG76nRC1c1IWDOJMVhZ8mcdAishPKBF1UUC/GWE/UEfVOYiutKILf42V
 tiyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVLEnQIfIA2o7VswYdTDSYpe3M6azV9URkgvkjJmJFtTD5VyFqjiXMPq5zBI7WqQBl98QRb3BA1rU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbwt0R3+DKFLck2A2J960WnhYgqtB6vwry+wPdBz8HIJrEcgar
 BgBJdt3oNcZjLCzQMGPUgSwOMbfliJTkNXyYE3/toPtE8kHVAGdh/fZap9JLxoR0/fPwLaGoaPK
 BkVE82mXfoO7128IFllL1M+5gk7JsWAJfsik9T1lR2JOO125zhnCnJr9IkYdjKI5v6hUFo7A=
X-Gm-Gg: ASbGncv0CkyPa1iYrgQklc58KZb8R0cBLhcv5NhWo7zP+y3N9zIAoW9qL4/7uwQUuYA
 79cA6vP/GwGGcT/jEAGxnMbhFeIp1kN6K5Je+fVRdBPJjm2O7HqA13adt8JM8b2CPg1q1P2c3tP
 ZdHM+vvFupTWTuKoCUPQsU8rqvys+Qo9mb3nM77V5NKQywk/m7NUqq/5jU+YJx8bCxF1nMaksdU
 XzR46AfKUFcjuGN8DWVaeLMom0GbyYjBTkODyyZNFTGxtQoc+aKmRyPwNsLNq8/PpHiuSkhyKui
 Yb8R9Kx1kcCBVeXTC+J2yiFXpXuMCeiRBF9Yh9oD69B9nw3rNnfwSgbVfGhp8g==
X-Received: by 2002:a17:902:f787:b0:24c:d33d:417c with SMTP id
 d9443c01a7336-2516e889ac6mr88938415ad.9.1757349981562; 
 Mon, 08 Sep 2025 09:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5C6a21lbY10oE/GGVNO4fuDADuEXCbELslzfbogJaxrkiWAbotF5cys8mh6IlE2CkL7wfVQ==
X-Received: by 2002:a17:902:f787:b0:24c:d33d:417c with SMTP id
 d9443c01a7336-2516e889ac6mr88937985ad.9.1757349981002; 
 Mon, 08 Sep 2025 09:46:21 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d08a36b3sm20306144a91.25.2025.09.08.09.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 09:46:20 -0700 (PDT)
Message-ID: <e72188ac-d680-42c2-81be-eb17bea8e94a@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 22:16:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] drm/msm/adreno: Add fenced regwrite support
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
 <CACu1E7H_K0WbWsHDqD44YfyMvc9bfZon-Tx75LkBFqWdG2YZ=Q@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACu1E7H_K0WbWsHDqD44YfyMvc9bfZon-Tx75LkBFqWdG2YZ=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX/isEu1q9Jd5d
 mmhi5p7kA0L39coI7jun9ncfecO8PZlY181F99crb5C9GMWJSJ19NKgppTxyI2KgCpZW8HZ26rZ
 c3o1IQ84nAZtLBlkRWXEyYafNiDBrZDYKf0JLQ5qqHG9DCS1mwfcG7n3aa6nvcMxfUT/3FTJ4PY
 b6IDI5WlE7p03IXGKqTia8lZvfuIIjTyBZT0wi0zikm/irG9CRMjp94+eGLHxXZZIOumtmyZkaa
 sd2IXbTnOA+BR/TAS3pkqEzzMoEYh7agj2dM7cJTslKG+w9ejKBHUmoe6sdIx/PnesJnN8A1DYY
 G2USaTBaLxXdnyJottDiX+SwJ87odv8m0LFLYPiKVec/5oQ5wffnI664EssMyNdky78FVSB6x4N
 rErT1bUG
X-Proofpoint-ORIG-GUID: EAyYkV51f1KmJ8vrg8Dp0tZLPoPg-Cg6
X-Proofpoint-GUID: EAyYkV51f1KmJ8vrg8Dp0tZLPoPg-Cg6
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bf085e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YtVMwAlMLTXNks-BDvIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On 9/8/2025 9:24 PM, Connor Abbott wrote:
> On Mon, Sep 8, 2025 at 4:27 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> There are some special registers which are accessible even when GX power
>> domain is collapsed during an IFPC sleep. Accessing these registers
>> wakes up GPU from power collapse and allow programming these registers
>> without additional handshake with GMU. This patch adds support for this
>> special register write sequence.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 80 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++----
>>  3 files changed, 90 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..a63dad80ef461da45d5c41a042ed4f19d8282ef5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -16,6 +16,84 @@
>>
>>  #define GPU_PAS_ID 13
>>
>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>> +{
>> +       /* Success if !writedropped0/1 */
>> +       if (!(status & mask))
>> +               return true;
>> +
>> +       udelay(10);
>> +
>> +       /* Try to update fenced register again */
>> +       gpu_write(gpu, offset, value);
>> +
>> +       /* We can't do a posted write here because the power domain could be
>> +        * in collapse state. So use the heaviest barrier instead
>> +        */
>> +       mb();
>> +       return false;
>> +}
>> +
>> +static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value, u32 mask)
>> +{
>> +       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +       struct msm_gpu *gpu = &adreno_gpu->base;
>> +       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>> +       u32 status;
>> +
>> +       gpu_write(gpu, offset, value);
>> +
>> +       /* Nothing else to be done in the case of no-GMU */
>> +       if (adreno_has_gmu_wrapper(adreno_gpu))
>> +               return 0;
>> +
>> +       /* We can't do a posted write here because the power domain could be
>> +        * in collapse state. So use the heaviest barrier instead
>> +        */
>> +       mb();
>> +
>> +       if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>> +                       fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>> +               return 0;
>> +
>> +       /* Try again for another 1ms before failing */
>> +       gpu_write(gpu, offset, value);
>> +       mb();
>> +
>> +       if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>> +                       fence_status_check(gpu, offset, value, status, mask), 0, 1000)) {
>> +               /*
>> +                * The 'delay' warning is here because the pause to print this
>> +                * warning will allow gpu to move to power collapse which
>> +                * defeats the purpose of continuous polling for 2 ms
>> +                */
>> +               dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>> +                               offset);
>> +               return 0;
>> +       }
>> +
>> +       dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>> +                       offset);
>> +
>> +       return -ETIMEDOUT;
>> +}
>> +
>> +int a6xx_fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u64 value, u32 mask, bool is_64b)
>> +{
>> +       int ret;
>> +
>> +       ret = fenced_write(a6xx_gpu, offset, lower_32_bits(value), mask);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (!is_64b)
>> +               return 0;
>> +
>> +       ret = fenced_write(a6xx_gpu, offset + 1, upper_32_bits(value), mask);
>> +
>> +       return ret;
>> +}
>> +
>>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>>  {
>>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> @@ -86,7 +164,7 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>         /* Update HW if this is the current ring and we are not in preempt*/
>>         if (!a6xx_in_preempt(a6xx_gpu)) {
>>                 if (a6xx_gpu->cur_ring == ring)
>> -                       gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
>> +                       a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
>>                 else
>>                         ring->restore_wptr = true;
>>         } else {
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 6e71f617fc3d0d564e51650dfed63a18f31042ac..e736c59d566b3fcf8c62a212494e3b110c09caa9 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -295,5 +295,6 @@ int a6xx_gpu_state_put(struct msm_gpu_state *state);
>>
>>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
>>  void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
>> +int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 mask, bool is_64b);
> 
> "mask" makes it sound like it's the mask for a masked write, which it
> isn't. At least in the public API I'd name it something more explicit
> like "fence_status_mask". Also it would be nice to add defines like
> GMU_FENCE_STATUS_WPTR/CONTEXT_SWITCH to make the parameter values in
> callsites less magical. Finally, this might be personal preference,
> but it's not immediately obvious what the "true"/"false" in callsites
> mean, so it would make users clearer to add a separate
> "a6xx_fenced_write64" and make 64-bit reg writes use that instead of
> is_64b.

I agree about the BIT definition. Will update if I send another
revision. Same for the 'mask'. I can see the confusion due to write and
mask in the same line.

64B fenced write is used only at a single place (in the preempt trigger
call). So I feel it is an overkill to create another function for that.
I did weigh that option earlier though.

-Akhil

> 
> Connor
> 
>>
