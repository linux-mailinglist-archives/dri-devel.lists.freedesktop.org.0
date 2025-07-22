Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742DB0DB2A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE9610E533;
	Tue, 22 Jul 2025 13:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of93aJyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C165410E044
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:44:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7i24f003589
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/PlvjBmBNhRqz0BnasHFhjw6
 BKLI8rWtueB1348TmAU=; b=Of93aJyQ8B2IXq//kHIuNs5oNAeHAckqmlzzEHin
 JB0jbnxK3HwqmVrHsXdArPWFtS5InJJECABp1JqgOORgL/j51qy9VArRt/ZqegY7
 SRXubWmx6w4Ca6cx60eifdX/A6beIlp2D9WPZSHC3R9A0aI0KRADO8OF3K/uGbg6
 xnelwe9XrpQ1rA1wqz8L2sclzfUaBBp1hNSBcvmZdzz8PcxkT+6dD9iJfze8djQt
 chkRh1WJpqmcvOdijECtCl+fHhCvFt7+BgcAVx6TcFLsC2z40n14TNybb1T7L7y4
 0Eu76qghAovYfV294L5ZFHuqm1ERp1Dc82PxjHmIcW20Dg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v7www-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:44:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e333fae758so1162684085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 06:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753191861; x=1753796661;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/PlvjBmBNhRqz0BnasHFhjw6BKLI8rWtueB1348TmAU=;
 b=hNc2AzUtz3e72bjtVNu4EDUQkSN5gOHBKXrFvc+/9FY/H/apbf7VPoAjhm0yFHiFj9
 0xLN77af0ZZg6479oCZo7YcGK6lJKyyO3758b/Q5VS2fvWu0J0lETgsktLZoXCW/wc3J
 f17SeWoW+9C4BTy0WnA6XY/Ic2OWGAi809nsNevzWFQ+F7b2TPDK3pyb3SAni4t5wdn4
 uVISetT6KJGoX5AfzLBZ56zP7DZE+4nrHu/N0Db+61xAvPZyWIj01WfEihjJbtXoiijs
 YU0EcD0IeKIeEebaACCpVTO3MdV99+eyqIAr3PdTltF3y4tqfoKvuGCuNBtY+LP4S2Ra
 uFvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoNKzz4x5x86Th+194RLDzFd/czRHVlgOkudIS0hz/LwR1d5zYYZb94kuKm+22BY6yEeWPI+wgxjQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/WiIoLZv3qHg2KnvxOIda9HgxBGKuhvlRt1d/2qMwfUb007Fi
 II84f7/kymUNERm1IGYjxGfQyYAE/+ZJZoBo9BBhQdO3v9c78OBvGLQIXHo3ESac+GENNtrDnmT
 X4eHrT4znD5T4eOpJIiETT3jb/0jGbKU47gGdX8s5w8GcdI5as2nkZ27mKEmbsYnpu5Ypcq8=
X-Gm-Gg: ASbGncvx7iYTbGuE7RXY1VrbPBaeCzOtx8m/bqX/xifH89p7U/omMWJQXCNNdGeFG0x
 FZYglqu4+9popTQ7MN/GjO6zNMYQzWG7jfAVkI9uc0KEzW/PD4sYSSVoPxMpYWtpc9xNdoTnsGu
 M1NQ34EW459UR+N5LpB21GaERpXSaXjCoBpPb6u9I94ids4ZQJr8UvaGKPm0wifg6iOtsG6HezL
 WsRf089AbeOigTwSOxoaO1FXANmjqIXU7VceLoXOqOGb1gWp3hlyiMDB/NX7rwwClkW722AONjI
 z5SDPIXi1XTDe6UvDTXY+Ts/7IVEHRdDktWgEhQSX4Ytw4k647R99YMAXlSpT+gIawNnZ77T1LL
 2g/Yo6bX9wYyxErM431cWn1ncZLuB8tEZE09I3GazTJBFfcPjQ0GF
X-Received: by 2002:a05:620a:d96:b0:7e6:2167:6fb with SMTP id
 af79cd13be357-7e6216707e1mr450345285a.57.1753191860626; 
 Tue, 22 Jul 2025 06:44:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJYjfAd2lPvfeopVnQTvfIiKF4FZMT25Jj8QNn5OT3bmUYHUVmlPAwFf/7JubdQINFF9syIw==
X-Received: by 2002:a05:620a:d96:b0:7e6:2167:6fb with SMTP id
 af79cd13be357-7e6216707e1mr450339985a.57.1753191859973; 
 Tue, 22 Jul 2025 06:44:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a9109c31sm16373981fa.43.2025.07.22.06.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:44:17 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:44:16 +0300
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
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
Message-ID: <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-GUID: sdnMWbp52IyKSZgAALiKOFDkIk_MIPw8
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687f95b6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kzfAnjQGA3Um0d4qlLMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMiBTYWx0ZWRfX8Si0cisC2eTG
 kFx6sJk7gqqSWd+qqSAwy6gjcDiMJqh+E7DCtaO/jzyZYU92KAjN7ylzpEd410yCNfYx+q48NcD
 epzGtuj+CXHSfGfc4gVRHiuNdeIBfKUxo3j0ygk9HsPtTNO49Tj4HDs3SHwXTNnb4J1rUBPjYV9
 RpXbiKvIPVXA2XNffBVRpAgobiDsEDJlfXH17fHiHIyhjLdje16l8Af/53b9tT1RwgaZT/6vgGp
 TISp7ovOYC0j3pPl6qkDoj89w/cFMdZUeMPYRhEavXVB1ioj7jobmQPR7chAMDwnTXvvL7DnLMd
 SI6Mrgd/wGvrXY+ZulyhjrQuhpUQ0BBk/dbs+OPGOjjq2tfiZXFVWFZ6Nx1FsyRCWkT6BFIxo0J
 yRixFJONT9uBkCiua7rgVvVHxlqNDmdA/0wAyH1YOsXYd70bqBosO3qK9JnAH2Ou13IFMlFI
X-Proofpoint-ORIG-GUID: sdnMWbp52IyKSZgAALiKOFDkIk_MIPw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220112
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

On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
> Set Keepalive votes at appropriate places to block IFPC power collapse
> until we access all the required registers. This is required during gpu
> IRQ handling and also during preemption.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
>  2 files changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 8c004fc3abd2896d467a9728b34e99e4ed944dc4..6770f0363e7284e4596b1188637a4615d2c0779b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1752,8 +1752,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
>  
>  static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  {
> -	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
>  
>  	/*
> @@ -1765,13 +1763,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
>  		return;
>  
> -	/*
> -	 * Force the GPU to stay on until after we finish
> -	 * collecting information
> -	 */
> -	if (!adreno_has_gmu_wrapper(adreno_gpu))
> -		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
> -
>  	DRM_DEV_ERROR(&gpu->pdev->dev,
>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
>  		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
> @@ -1810,9 +1801,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
>  	}
>  }
>  
> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)

a6xx_set_keepalive_vote()

> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return;
> +
> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
> +}
> +
>  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  {
>  	struct msm_drm_private *priv = gpu->dev->dev_private;
> +
> +	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
> +	set_keepalive_vote(gpu, true);
> +
>  	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
>  
>  	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
> @@ -1849,6 +1855,8 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
>  		a6xx_preempt_irq(gpu);
>  
> +	set_keepalive_vote(gpu, false);
> +
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index 5b0fd510ff58d989ab285f1a2497f6f522a6b187..1c8ec1911010c00a000d195116fc950c4d947cac 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
>  	a6xx_gpu->postamble_enabled = false;
>  }
>  
> +/*
> + * Set preemption keepalive vote. Please note that this vote is different from the one used in
> + * a6xx_irq()
> + */
> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)

a6xx_set_preempt_keepalive_vote();

> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return;
> +
> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_PWR_COL_PREEMPT_KEEPALIVE, on);
> +}
> +
>  void a6xx_preempt_irq(struct msm_gpu *gpu)
>  {
>  	uint32_t status;
> @@ -176,6 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  
> +	set_keepalive_vote(gpu, false);
> +
>  	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>  
>  	/*
> @@ -302,6 +319,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  
>  	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>  
> +	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
> +	set_keepalive_vote(gpu, true);
> +
>  	a6xx_fenced_write(a6xx_gpu,
>  		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
>  		BIT(1), true);
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
