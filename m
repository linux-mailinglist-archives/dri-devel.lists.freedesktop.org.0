Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551769C62C2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 21:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DC310E188;
	Tue, 12 Nov 2024 20:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QwsVZCEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F49910E188;
 Tue, 12 Nov 2024 20:43:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACC2Z8F004914;
 Tue, 12 Nov 2024 20:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J8+6ZVF+prS9JLCj/yiR7Zf9qdZTC6blaLgmFTCViTU=; b=QwsVZCEmoSxRLWM3
 vPTZH82u/xstyeZIpNJGcmD5Si28gVD/vticSG8WtGz2wTHHjErgino5BV0CgAZN
 u8b+0U2QWmEQTegENDfs2jPZkzHD2qak2TD997u2oSonAoAx7wpUTkcKjvFAO8Gc
 1ObPxKl8XBxZe3qMaLBDiGz5WotPE2GDmWfdgqKz5UGn+tJtJI9M6H+oA83AHpuf
 Qu7/SJDgYayReNJkbcPDuVUCc8eDlt2Rl1dnJIEWZLOx5nmTLqLwxMWT0rigyZtI
 qpv16wi6bxoWzPy7ce1zVui/u8N3jjYlckdCMhQfSerQ3ptUvTzeGrxUzLBOF1b9
 aThI7A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uwt5jrtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 20:43:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACKhF5b021398
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 20:43:15 GMT
Received: from [10.216.22.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 12:43:11 -0800
Message-ID: <9c25d4b9-223d-4461-a611-05e65538f4a1@quicinc.com>
Date: Wed, 13 Nov 2024 02:13:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Add support for Adreno 612
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20241101-a612-gpu-support-v1-1-bdfe8f6d9306@quicinc.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241101-a612-gpu-support-v1-1-bdfe8f6d9306@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mBAbCoRG80ljEhf-WCQuUyS18vBz6hUo
X-Proofpoint-ORIG-GUID: mBAbCoRG80ljEhf-WCQuUyS18vBz6hUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120167
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

On 11/1/2024 8:40 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> of A615 GPU.
> 
> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> which is a small state machine which helps to toggle GX GDSC
> (connected to CX rail) to implement IFPC feature. It doesn't support
> any other features of a full fledged GMU like clock control, resource
> voting to rpmh etc. So we need linux clock driver support like other
> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> Since there is no benefit with enabling RGMU at the moment, RGMU is
> entirely skipped in this patch.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> Mesa support is already available for A612. Verified Glmark2 with
> weston.
> 
> Some dependencies for the devicetree change are not yet available
> in the mailing lists. I will send it out as a separate patch later.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 28 +++++++++++++++++++++-------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 11 ++++++++---
>  3 files changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a..234083b69844 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -704,6 +704,21 @@ static const struct adreno_info a6xx_gpus[] = {
>  			{ 157, 3 },
>  			{ 127, 4 },
>  		),
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x06010200),
> +		.family = ADRENO_6XX_GEN1,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> +		},
> +		.gmem = (SZ_128K + SZ_4K),
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.a6xx = &(const struct a6xx_info) {
> +			.hwcg = a612_hwcg,
> +			.protect = &a630_protect,
> +			.gmu_cgc_mode = 0x00000022,
> +			.prim_fifo_threshold = 0x00080000,
> +		},
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x06010500),
>  		.family = ADRENO_6XX_GEN1,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 019610341df1..f69607267262 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -504,15 +504,26 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  
>  	if (adreno_is_a630(adreno_gpu))
>  		clock_cntl_on = 0x8aa8aa02;
> -	else if (adreno_is_a610(adreno_gpu))
> +	else if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu))
>  		clock_cntl_on = 0xaaa8aa82;
>  	else if (adreno_is_a702(adreno_gpu))
>  		clock_cntl_on = 0xaaaaaa82;
>  	else
>  		clock_cntl_on = 0x8aa8aa82;
>  
> -	cgc_delay = adreno_is_a615_family(adreno_gpu) ? 0x111 : 0x10111;
> -	cgc_hyst = adreno_is_a615_family(adreno_gpu) ? 0x555 : 0x5555;
> +	if (adreno_is_a612(adreno_gpu))
> +		cgc_delay = 0x11;
> +	else if (adreno_is_a615_family(adreno_gpu))
> +		cgc_delay = 0x111;
> +	else
> +		cgc_delay = 0x10111;
> +
> +	if (adreno_is_a612(adreno_gpu))
> +		cgc_hyst = 0x55;
> +	else if (adreno_is_a615_family(adreno_gpu))
> +		cgc_delay = 0x555;
> +	else
> +		cgc_delay = 0x5555;
>  
>  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
>  			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
> @@ -600,6 +611,9 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  		gpu->ubwc_config.ubwc_swizzle = 0x7;
>  	}
>  
> +	if (adreno_is_a612(gpu))
> +		gpu->ubwc_config.highest_bank_bit = 13;
> +
>  	if (adreno_is_a618(gpu))
>  		gpu->ubwc_config.highest_bank_bit = 14;
>  
> @@ -1165,7 +1179,7 @@ static int hw_init(struct msm_gpu *gpu)
>  		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
>  
>  	/* Setting the mem pool size */
> -	if (adreno_is_a610(adreno_gpu)) {
> +	if (adreno_is_a610(adreno_gpu) || adreno_is_a612(adreno_gpu)) {
>  		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 48);
>  		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_DBG_ADDR, 47);
>  	} else if (adreno_is_a702(adreno_gpu)) {
> @@ -1199,7 +1213,7 @@ static int hw_init(struct msm_gpu *gpu)
>  
>  	/* Enable fault detection */
>  	if (adreno_is_a730(adreno_gpu) ||
> -	    adreno_is_a740_family(adreno_gpu))
> +	    adreno_is_a740_family(adreno_gpu) || adreno_is_a612(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
>  	else if (adreno_is_a690(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x4fffff);
> @@ -1864,7 +1878,7 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>  {
>  	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> +	if (adreno_has_gmu_wrapper(&a6xx_gpu->base) && !adreno_is_a612(&a6xx_gpu->base))
>  		return;
>  
>  	llcc_slice_putd(a6xx_gpu->llc_slice);
> @@ -1877,7 +1891,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  	struct device_node *phandle;
>  
>  	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> +	if (adreno_has_gmu_wrapper(&a6xx_gpu->base) && !adreno_is_a612(&a6xx_gpu->base))
>  		return;
>  
>  	/*
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e71f420f8b3a..5cde84817a03 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -420,6 +420,11 @@ static inline int adreno_is_a610(const struct adreno_gpu *gpu)
>  	return adreno_is_revn(gpu, 610);
>  }
>  
> +static inline int adreno_is_a612(const struct adreno_gpu *gpu)
> +{
> +	return gpu->info->chip_ids[0] == 0x06010200;
> +}
> +
>  static inline int adreno_is_a618(const struct adreno_gpu *gpu)
>  {
>  	return adreno_is_revn(gpu, 618);
> @@ -489,9 +494,9 @@ static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
>  {
>  	if (WARN_ON_ONCE(!gpu->info))
>  		return false;
> -
> -	/* TODO: A612 */
> -	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
> +	return adreno_is_a610(gpu) ||
> +	       adreno_is_a702(gpu) ||
> +	       adreno_is_a612(gpu);
>  }
>  
>  /* TODO: 615/616 */
> 
> ---
> base-commit: 4a6fd06643afa99989a0e6b848e125099674227b
> change-id: 20241031-a612-gpu-support-d6330f17d01f
> 
> Best regards,

This patch requires a fix up related to llcc. I will send a v2 revision.

-Akhil.
