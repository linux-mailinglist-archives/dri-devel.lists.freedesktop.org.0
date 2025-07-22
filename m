Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC8B0DB11
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470E510E69A;
	Tue, 22 Jul 2025 13:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="opGsLQ5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E9910E69A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:39:35 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8rwUo006230
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4w3F0joZHW750KxFalsn9QVx
 Ns0FPKKZPb2uX1yiarA=; b=opGsLQ5tSzq299+AcwZy9AxOaTjfrG7Vq/UQSF0g
 hTPLYon4gdQzd5Hv3rvlsy1dxpv7549YPoSBbF7HXwDnRagGztr1FyBNT4Ki0O1r
 Ib5ompQdFhVzwomnNGgwEKTmt6OCWSFlSXaxphsUH7eEy2HKJwaH80Dk+20bWRRD
 51NjxrKzOWOhnARKS69h9VSclxz9jS1PpTo55/JUcLsqYdCOCiqJFPghUY5RpWJs
 aeINXIeim2ECvUImYEkdcX4jiqGB+foL7Cyb3s0OaxUx/0uTfkZzyNhCdMsWZSYG
 MtrbCYK9hoQ9a2eWw2yAb3w5dJujpgQkgGTvhPpOv7qBng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q9mbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:39:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e4ca52aedaso246913285a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753191573; x=1753796373;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4w3F0joZHW750KxFalsn9QVxNs0FPKKZPb2uX1yiarA=;
 b=sWGHjl58urAUfv31uAD4qi/556CeJ7V/cYh/N/x61UNBTl9IC6DRDSGKrt7PuLGeqy
 wyXYlP2YFJWxaynkl3LXO53kl3D1Cc777YcYiBweVOBoVFqrh2vTWTnv7AnSyPW3AUiR
 m50sTSq7d+m80NBQDFtjnSALXyFhSbAIKngu0qpWvEuD20eHaJ6Nmblj4q8QqTLPx1RI
 s0h635WVmNlpGrDVJrdfLqgfJZdaphDdAFtN1VbBtflu2Z3W5HZt3q66BX02LwvUP/Qj
 EvOCoprW3WNZ3yiNIHA/HcFfIzkr6rhLP83R8Cs9Qp1HDzbi3QEjU7fTpiueiimffF2/
 vEAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMrSh4J9lkxlEQW+7FlU8ranxATcV273YqROV05gLanF8Wmi+1Ql5qhW6Ljg1vCCox/1/IuKj+hhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOAPter1HllsgtMRxoxjLkOHBLH/tTXLhXoHiQWqmpq+/6Qdt/
 qX83cDoILQSOLt7x1NKGvxEdG7ToCZgncjItN6/hLa/kMgk8c1ImK5ISEsWoaqmVABA1WiLjXb8
 zacRYGTP50aKDC8iVy1lQoGSAW8t1OhLOy6X0TBhljHfp32eRWqy/PK8rgpzTqwjj9bFhy+8=
X-Gm-Gg: ASbGncuj+199z63kjWqsj9OG4W9Iqx/r1U3A1vkB012SrMcPpBithkKFzcCzhigZpwk
 z8wCaBx/2BPdbCIX8DXSorNX/dYgaxX+BfK7OiWnhs/Nj0FWb3ZD0XXknOkbfAP/snu+HBvccU+
 fgYntcgIOtdDNLvWj7Z66Di4rY+W3O80EBqA1/h61np/ekkpWUj63ehcmpPZj2HZjv2YsFI/Llj
 10rzzgXNx2twOjqrGEwQILehe4tRLIWjWh+sN519pKGY6d9U6sBTT4szxUyO9iGkmY6TxJmbmsa
 a4R0MB2NCZMMDA0lxxaCFuyo5BFd4WFDI2asZkJ4MMttv6sE5lnERALxyW3nBd54PVOmhxwvSyP
 qS47Oh0YBzWxx0ColvPtWwOptxyByYKcN5PF5MFZWa/vrFt4ufCUE
X-Received: by 2002:a05:620a:19a5:b0:7e3:52f6:66e5 with SMTP id
 af79cd13be357-7e352f6672amr2503269685a.35.1753191573297; 
 Tue, 22 Jul 2025 06:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWXNAeEBRYm0Qc899vTrFNNPTNnIjLTPXDWYSnbj33m9VCWWBjQI/8iRumSgWsa8P13k24+Q==
X-Received: by 2002:a05:620a:19a5:b0:7e3:52f6:66e5 with SMTP id
 af79cd13be357-7e352f6672amr2503264185a.35.1753191572771; 
 Tue, 22 Jul 2025 06:39:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91f640csm16330041fa.91.2025.07.22.06.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:39:31 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:39:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
Message-ID: <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-7-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-7-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMiBTYWx0ZWRfX0VenVwCWPKl4
 pdOzRIIi4nHBova3XG2+eUQEDdYVB3Y/fBaN/oJu8kNIkjTPqh6tgEQ2xlluLIrn9HIGNPVSZDO
 Mc8DFl7XsosASRIL3lTPaOrJ6Y/0GIAwAtph6qd7acsEvoH7FFTnIoGgDLJCwqX3R/pSvGI8iTN
 6Ff5m8Ew2dVx6dMRvzZwPzj7KQZkLhbPhJ/AHBdRhAOXRGGbxkSYEMfoRez5P95436bI6MLaGEn
 vj2RKp6NrtC6iOjbD7L3j0QAHp47RMqyhUVeej1xi2SJBM6bS0qbKHEanu0yqF8h3/RwnuyDJ4e
 3/ICstbrOpk2YmzC/g+NzYysavnizeWK5u2Hw9651iSLp8p0kRhAtxMyYVklWacp7+/AfUius1X
 kmZgBz1LJkZViC4UwjCeUxklbXiIeL1D4+0wItMhVcX4jNb5WU+m+aRUYwiQclHZvVVUDa3I
X-Proofpoint-ORIG-GUID: IJSoNe_uFxm9qS1GJDFINzox5GM1P3aS
X-Proofpoint-GUID: IJSoNe_uFxm9qS1GJDFINzox5GM1P3aS
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687f9496 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=A7g6f4VAW18hdwHdu84A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220112
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

On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
> There are some special registers which are accessible even when GX power
> domain is collapsed during an IFPC sleep. Accessing these registers
> wakes up GPU from power collapse and allow programming these registers
> without additional handshake with GMU. This patch adds support for this
> special register write sequence.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>  3 files changed, 73 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,67 @@
>  
>  #define GPU_PAS_ID 13
>  
> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
> +{
> +	/* Success if !writedropped0/1 */
> +	if (!(status & mask))
> +		return true;
> +
> +	udelay(10);

Why do we need udelay() here? Why can't we use interval setting inside
gmu_poll_timeout()?

> +
> +	/* Try to update fenced register again */
> +	gpu_write(gpu, offset, value);
> +	return false;
> +}
> +
> +static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value, u32 mask)
> +{
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct msm_gpu *gpu = &adreno_gpu->base;
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	u32 status;
> +
> +	gpu_write(gpu, offset, value);
> +
> +	/* Nothing else to be done in the case of no-GMU */
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return 0;
> +
> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
> +		return 0;
> +
> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
> +			offset);
> +
> +	/* Try again for another 1ms before failing */
> +	gpu_write(gpu, offset, value);
> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
> +		return 0;
> +
> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
> +			offset);
> +
> +	return -ETIMEDOUT;
> +}
> +
> +int a6xx_fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u64 value, u32 mask, bool is_64b)
> +{
> +	int ret;
> +
> +	ret = fenced_write(a6xx_gpu, offset, lower_32_bits(value), mask);
> +	if (ret)
> +		return ret;
> +
> +	if (!is_64b)
> +		return 0;
> +
> +	ret = fenced_write(a6xx_gpu, offset + 1, upper_32_bits(value), mask);

no need for a separate ret assignment.

> +
> +	return ret;
> +}
> +
>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -86,7 +147,7 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  	/* Update HW if this is the current ring and we are not in preempt*/
>  	if (!a6xx_in_preempt(a6xx_gpu)) {
>  		if (a6xx_gpu->cur_ring == ring)
> -			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> +			a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);

I can't stop but notice that we don't handle a6xx_fenced_write() errors.
Is it fine? Or will it result in some sort of crash / reset?

>  		else
>  			ring->restore_wptr = true;
>  	} else {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 9201a53dd341bf432923ffb44947e015208a3d02..2be036a3faca58b4b559c30881e4b31d5929592a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -291,5 +291,6 @@ int a6xx_gpu_state_put(struct msm_gpu_state *state);
>  
>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
>  void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
> +int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 mask, bool is_64b);
>  
>  #endif /* __A6XX_GPU_H__ */
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index 3b17fd2dba89115a8e48ba9469e52e4305b0cdbb..5b0fd510ff58d989ab285f1a2497f6f522a6b187 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -41,7 +41,7 @@ static inline void set_preempt_state(struct a6xx_gpu *gpu,
>  }
>  
>  /* Write the most recent wptr for the given ring into the hardware */
> -static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +static inline void update_wptr(struct a6xx_gpu *a6xx_gpu, struct msm_ringbuffer *ring)
>  {
>  	unsigned long flags;
>  	uint32_t wptr;
> @@ -51,7 +51,7 @@ static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  	if (ring->restore_wptr) {
>  		wptr = get_wptr(ring);
>  
> -		gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> +		a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
>  
>  		ring->restore_wptr = false;
>  	}
> @@ -172,7 +172,7 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
>  
> -	update_wptr(gpu, a6xx_gpu->cur_ring);
> +	update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  
> @@ -268,7 +268,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  	 */
>  	if (!ring || (a6xx_gpu->cur_ring == ring)) {
>  		set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
> -		update_wptr(gpu, a6xx_gpu->cur_ring);
> +		update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
>  		set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  		spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
>  		return;
> @@ -302,13 +302,13 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  
>  	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>  
> -	gpu_write64(gpu,
> -		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
> -		a6xx_gpu->preempt_smmu_iova[ring->id]);
> +	a6xx_fenced_write(a6xx_gpu,
> +		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
> +		BIT(1), true);
>  
> -	gpu_write64(gpu,
> +	a6xx_fenced_write(a6xx_gpu,
>  		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
> -		a6xx_gpu->preempt_iova[ring->id]);
> +		a6xx_gpu->preempt_iova[ring->id], BIT(1), true);
>  
>  	a6xx_gpu->next_ring = ring;
>  
> @@ -328,7 +328,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  	set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
>  
>  	/* Trigger the preemption */
> -	gpu_write(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl);
> +	a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl, BIT(1), false);
>  }
>  
>  static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
