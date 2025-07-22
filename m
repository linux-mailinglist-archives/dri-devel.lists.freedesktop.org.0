Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397D1B0E564
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 23:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837D010E716;
	Tue, 22 Jul 2025 21:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fl1N3gdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2D310E062
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:25:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKTv8n026063
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bx6AND6qIidWf5n32E4fzkLDfQp167XjFiENx1umcI8=; b=fl1N3gdFbnbW6zs3
 xthlnmmIcSvU+LS0IMa6qXorJtBVRpZb82HziDrZHY0Vjv0f3K14l1g+zxiCZ6hm
 BEB//nuFQI2n9o7/I1MEBSn6efFU7sfSeI4aTzTM/vCI0ux5KAFWChrSx0+JR2l6
 SJGkHOQJ6YdfiAdcp8AL6y6qPuPJF3eVq0JrD9YI/6c6cBrSbACDOnyF3TjHxpSZ
 z5w7OENt8aK/hXWans789scPyLlC7dhT5+Xs0uXCmeZJV8wqJM+3ED1L939p/awg
 Vb2byiVFQmvDuZ4Al+UDUmbDdl+zOxRQuDLtfphP7nYd5F7WRJAI2cpnMR+H5Xvv
 fS5Nrw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hrxvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:25:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-234a102faa3so50392865ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753219505; x=1753824305;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bx6AND6qIidWf5n32E4fzkLDfQp167XjFiENx1umcI8=;
 b=WESbQU89MmwzcXXA1XU2I+g86TanBiFuP0CloH7+PJAs78r20RmJdsaHF9vOpWzIkk
 Q7s6vNkYHSS6JwU+GJ032T9AvrM+8mM14mv9qU2UsXC0ZSNrn76cS28KkzFbTFkaRLhj
 WyfnaeLjNdRK4qg3iHIhrQdxkzgTWGvWTBVxFn5kiKO47XblYVoGJ8Tx1E8EMwgmV2uy
 jWh4IDNtRmZSNkcqKSx0l9KUxz7KoUUxV2h1hOfgsIjnHX/rE8Ofj/o7tO27FiU38Xf7
 gbTD0gvwLSloGa3XmGF0/fFvOAaHhXu60oyzNR5LiG7XY8c8omXqWJb0HtBJCle6jJxr
 +Z7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVvZeKOTysuaS2CnvDZKw11PwvILqD3nQEUAcNESS95A3tf4CS8tfkkinTWxvxSp2azVfbrhevupg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkzU3OzqUqZ70u+y0WkYr1zq+X7XvJG9qiapsM/6Dig5fLXulD
 1sZa6p3z3s1lqFdAKB1RRmJ73VbR8WypsFbpni/5MkJ6UlZ3aT/mAwVz8kZ0Y8i+Qkb3hBHjS3r
 Ww99xYIiS74E6HdNkIX0DMmKoKV6i0pWhn/LoKml4bSP7AQziOIxIbg4GUNxGQPvDJVYGD8I=
X-Gm-Gg: ASbGncukVbnS/YP0nvVzRCWPEPCN9i9z2z8LPvtKBvtApbR7hPl+yN/NMdIpVRCzyjb
 tM8GxR8fwFKstwxhs+qmsRYmywMLR+VJ3AqdS5YL2N90N8p75AIAwGfgabiqt6PWAz24NRdy4Z7
 CxhTgwOvOJF6kNyC+OeeSKi7KGt+O7E9/+vbqZvhieGkycicuPMlLGmbKgbn0AqvpErykQOdd1M
 Mr4tyF1u3mZyms1WxLpRhZrm7zn1F7o4fcM/fzR9Gt8DXfNjK0D7fc7Vytv0Le/TFrC+S4CTk9e
 J+8rbOvmyZaH8BP5DfPHbIJO+5eJ1MjTd+gtBsEkP1nimB3zVfYj/+eJxR8zEA9A
X-Received: by 2002:a17:903:fa6:b0:220:c4e8:3b9f with SMTP id
 d9443c01a7336-23f98087878mr6681745ad.0.1753219505428; 
 Tue, 22 Jul 2025 14:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFps9jaK7xU+IcaPx+PU7yuB+q3TWSjyxzOi5zTDgaE+nkIXF7XgkGNIc87COjEka46a4qGHw==
X-Received: by 2002:a17:903:fa6:b0:220:c4e8:3b9f with SMTP id
 d9443c01a7336-23f98087878mr6681445ad.0.1753219504988; 
 Tue, 22 Jul 2025 14:25:04 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6ef82esm82325845ad.209.2025.07.22.14.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 14:25:04 -0700 (PDT)
Message-ID: <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 02:54:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=688001b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=54dI5dBpyKhlXk0ovUwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NCBTYWx0ZWRfX7+0S83O8WKz6
 PmWMosYUodc744xlg7441YEO8ad4HSohTEMHv5mNTt1aL5GE9bLKByFNIY3HyGypwjUpxEUB28+
 OKb9yrJqNsYbVUXU9829JINpg0LDL+uPwlKc2vlilZrTCPn4uorkLWJpK1RmkKcuKcq95mWHJyH
 Wa9n8Eb8zSyk7dw/axNXsuVvdMwS0r0sTMFXv6KOgvzkcIL6NK8XYD8fZZSuTVw9xXYPIAqxkHk
 Z7fQILyyTXEI2KQgfiskDruh3Xzdbj/gepFakvsbgVO7h2Q3alC5crQV/4oC1vBaVLEX3TLg/uw
 wdVSa/dR9POuXTXcGJcpp1CQTkwXm3np7I0plI+Uc2Ip6kb8wX85eORD7YNhXlhsHindh8SoO0A
 MAEqn9QatEjpVpEnk/meD6uWTV8uWllAVwLge5O+a2EqC+8KhV/qrMxmFBIRC6VaAqhPBZ2/
X-Proofpoint-GUID: eOQdgyWWbS0wDVJaEer0KoTDwjxq3nAx
X-Proofpoint-ORIG-GUID: eOQdgyWWbS0wDVJaEer0KoTDwjxq3nAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220184
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

On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
>> Set Keepalive votes at appropriate places to block IFPC power collapse
>> until we access all the required registers. This is required during gpu
>> IRQ handling and also during preemption.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
>>  2 files changed, 37 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 8c004fc3abd2896d467a9728b34e99e4ed944dc4..6770f0363e7284e4596b1188637a4615d2c0779b 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1752,8 +1752,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
>>  
>>  static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>>  {
>> -	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>  	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
>>  
>>  	/*
>> @@ -1765,13 +1763,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>>  	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
>>  		return;
>>  
>> -	/*
>> -	 * Force the GPU to stay on until after we finish
>> -	 * collecting information
>> -	 */
>> -	if (!adreno_has_gmu_wrapper(adreno_gpu))
>> -		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
>> -
>>  	DRM_DEV_ERROR(&gpu->pdev->dev,
>>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
>>  		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
>> @@ -1810,9 +1801,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
>>  	}
>>  }
>>  
>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> 
> a6xx_set_keepalive_vote()

static fn! Why do we need prefix here?

-Akhil

> 
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>> +		return;
>> +
>> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
>> +}
>> +
>>  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>>  {
>>  	struct msm_drm_private *priv = gpu->dev->dev_private;
>> +
>> +	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
>> +	set_keepalive_vote(gpu, true);
>> +
>>  	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
>>  
>>  	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
>> @@ -1849,6 +1855,8 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>>  	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
>>  		a6xx_preempt_irq(gpu);
>>  
>> +	set_keepalive_vote(gpu, false);
>> +
>>  	return IRQ_HANDLED;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> index 5b0fd510ff58d989ab285f1a2497f6f522a6b187..1c8ec1911010c00a000d195116fc950c4d947cac 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
>>  	a6xx_gpu->postamble_enabled = false;
>>  }
>>  
>> +/*
>> + * Set preemption keepalive vote. Please note that this vote is different from the one used in
>> + * a6xx_irq()
>> + */
>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> 
> a6xx_set_preempt_keepalive_vote();
> 
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>> +		return;
>> +
>> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_PWR_COL_PREEMPT_KEEPALIVE, on);
>> +}
>> +
>>  void a6xx_preempt_irq(struct msm_gpu *gpu)
>>  {
>>  	uint32_t status;
>> @@ -176,6 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>>  
>>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>>  
>> +	set_keepalive_vote(gpu, false);
>> +
>>  	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>>  
>>  	/*
>> @@ -302,6 +319,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>  
>>  	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>  
>> +	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
>> +	set_keepalive_vote(gpu, true);
>> +
>>  	a6xx_fenced_write(a6xx_gpu,
>>  		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
>>  		BIT(1), true);
>>
>> -- 
>> 2.50.1
>>
> 

