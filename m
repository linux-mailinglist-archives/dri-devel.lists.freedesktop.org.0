Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D558887C2D
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 10:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5240A10E074;
	Sun, 24 Mar 2024 09:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LaWBTe0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD16A10E073;
 Sun, 24 Mar 2024 09:55:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42O9oNRs031484; Sun, 24 Mar 2024 09:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=AjaFl7g03vwI4sThHBoGG
 IckgLDPCRTa7YcKZWTVpno=; b=LaWBTe0uZHYhAan7AzYzk+Z3u1gTDLdM3gv6l
 Bn6MOf5rodnpVJijYgwoqYvirSPWFDvRoNmFY79Q7spHPq13gkoR4VSZd6MA9Nn0
 m2PW5pFIrJgqdW3YPZfyGZB0A6d4NOeap9nV66xyR3AItIZaBsLQ0EK8vRY7juyM
 Ojvj3MHxY0l6RwFvsQX6drQOkI/fHs5amW+S1t7IhwF5Sqy3QUYX9ldJU01Twig5
 apKiFapY344ghXMcuNki2cQQCQK1uxOn4eU3DF1nQyg4EXdY9QhUKYsq5iTwJ/9G
 uG7AUu5xpf4yTyh8xecEzMwhRowgXDbwGeJ17gFRO7ZlCFxjA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x1q60m9ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 Mar 2024 09:54:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42O9siLb018166
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 Mar 2024 09:54:44 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 24 Mar 2024 02:54:39 -0700
Date: Sun, 24 Mar 2024 15:22:22 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-kbuild@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/16] drm/msm: move msm_gpummu.c to
 adreno/a2xx_gpummu.c
Message-ID: <20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-4-cca5e8457b9e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240323-fd-xml-shipped-v4-4-cca5e8457b9e@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ccV9tcYtGZtWQxhc3uQ7qiZeooQ7HHyZ
X-Proofpoint-GUID: ccV9tcYtGZtWQxhc3uQ7qiZeooQ7HHyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-24_06,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403240062
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

On Sat, Mar 23, 2024 at 12:56:56AM +0200, Dmitry Baryshkov wrote:
> The msm_gpummu.c implementation is used only on A2xx and it is tied to
> the A2xx registers. Rename the source file accordingly.
> 

There are very few functions in this file and a2xx_gpu.c is a relatively
small source file too. Shall we just move them to a2xx_gpu.c instead of
renaming?

-Akhil

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/Makefile                       |  2 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |  4 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |  4 ++
>  .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} | 45 ++++++++++++----------
>  drivers/gpu/drm/msm/msm_mmu.h                      |  5 ---
>  5 files changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index b21ae2880c71..26ed4f443149 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -8,6 +8,7 @@ msm-y := \
>  	adreno/adreno_device.o \
>  	adreno/adreno_gpu.o \
>  	adreno/a2xx_gpu.o \
> +	adreno/a2xx_gpummu.o \
>  	adreno/a3xx_gpu.o \
>  	adreno/a4xx_gpu.o \
>  	adreno/a5xx_gpu.o \
> @@ -113,7 +114,6 @@ msm-y += \
>  	msm_ringbuffer.o \
>  	msm_submitqueue.o \
>  	msm_gpu_tracepoints.o \
> -	msm_gpummu.o
>  
>  msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
>  	dp/dp_debug.o
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index 0d8133f3174b..0dc255ddf5ce 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -113,7 +113,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
>  	uint32_t *ptr, len;
>  	int i, ret;
>  
> -	msm_gpummu_params(gpu->aspace->mmu, &pt_base, &tran_error);
> +	a2xx_gpummu_params(gpu->aspace->mmu, &pt_base, &tran_error);
>  
>  	DBG("%s", gpu->name);
>  
> @@ -469,7 +469,7 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
>  static struct msm_gem_address_space *
>  a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>  {
> -	struct msm_mmu *mmu = msm_gpummu_new(&pdev->dev, gpu);
> +	struct msm_mmu *mmu = a2xx_gpummu_new(&pdev->dev, gpu);
>  	struct msm_gem_address_space *aspace;
>  
>  	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
> index 161a075f94af..53702f19990f 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
> @@ -19,4 +19,8 @@ struct a2xx_gpu {
>  };
>  #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
>  
> +struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu);
> +void a2xx_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
> +		dma_addr_t *tran_error);
> +
>  #endif /* __A2XX_GPU_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
> similarity index 67%
> rename from drivers/gpu/drm/msm/msm_gpummu.c
> rename to drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
> index f7d1945e0c9f..39641551eeb6 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
> @@ -5,30 +5,33 @@
>  
>  #include "msm_drv.h"
>  #include "msm_mmu.h"
> -#include "adreno/adreno_gpu.h"
> -#include "adreno/a2xx.xml.h"
>  
> -struct msm_gpummu {
> +#include "adreno_gpu.h"
> +#include "a2xx_gpu.h"
> +
> +#include "a2xx.xml.h"
> +
> +struct a2xx_gpummu {
>  	struct msm_mmu base;
>  	struct msm_gpu *gpu;
>  	dma_addr_t pt_base;
>  	uint32_t *table;
>  };
> -#define to_msm_gpummu(x) container_of(x, struct msm_gpummu, base)
> +#define to_a2xx_gpummu(x) container_of(x, struct a2xx_gpummu, base)
>  
>  #define GPUMMU_VA_START SZ_16M
>  #define GPUMMU_VA_RANGE (0xfff * SZ_64K)
>  #define GPUMMU_PAGE_SIZE SZ_4K
>  #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_SIZE)
>  
> -static void msm_gpummu_detach(struct msm_mmu *mmu)
> +static void a2xx_gpummu_detach(struct msm_mmu *mmu)
>  {
>  }
>  
> -static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
> +static int a2xx_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
>  		struct sg_table *sgt, size_t len, int prot)
>  {
> -	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
> +	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
>  	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
>  	struct sg_dma_page_iter dma_iter;
>  	unsigned prot_bits = 0;
> @@ -53,9 +56,9 @@ static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
>  	return 0;
>  }
>  
> -static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
> +static int a2xx_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
>  {
> -	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
> +	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
>  	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
>  	unsigned i;
>  
> @@ -68,13 +71,13 @@ static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
>  	return 0;
>  }
>  
> -static void msm_gpummu_resume_translation(struct msm_mmu *mmu)
> +static void a2xx_gpummu_resume_translation(struct msm_mmu *mmu)
>  {
>  }
>  
> -static void msm_gpummu_destroy(struct msm_mmu *mmu)
> +static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
>  {
> -	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
> +	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
>  
>  	dma_free_attrs(mmu->dev, TABLE_SIZE, gpummu->table, gpummu->pt_base,
>  		DMA_ATTR_FORCE_CONTIGUOUS);
> @@ -83,16 +86,16 @@ static void msm_gpummu_destroy(struct msm_mmu *mmu)
>  }
>  
>  static const struct msm_mmu_funcs funcs = {
> -		.detach = msm_gpummu_detach,
> -		.map = msm_gpummu_map,
> -		.unmap = msm_gpummu_unmap,
> -		.destroy = msm_gpummu_destroy,
> -		.resume_translation = msm_gpummu_resume_translation,
> +		.detach = a2xx_gpummu_detach,
> +		.map = a2xx_gpummu_map,
> +		.unmap = a2xx_gpummu_unmap,
> +		.destroy = a2xx_gpummu_destroy,
> +		.resume_translation = a2xx_gpummu_resume_translation,
>  };
>  
> -struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
> +struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu)
>  {
> -	struct msm_gpummu *gpummu;
> +	struct a2xx_gpummu *gpummu;
>  
>  	gpummu = kzalloc(sizeof(*gpummu), GFP_KERNEL);
>  	if (!gpummu)
> @@ -111,10 +114,10 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
>  	return &gpummu->base;
>  }
>  
> -void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
> +void a2xx_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>  		dma_addr_t *tran_error)
>  {
> -	dma_addr_t base = to_msm_gpummu(mmu)->pt_base;
> +	dma_addr_t base = to_a2xx_gpummu(mmu)->pt_base;
>  
>  	*pt_base = base;
>  	*tran_error = base + TABLE_SIZE; /* 32-byte aligned */
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index eb72d3645c1d..88af4f490881 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -42,7 +42,6 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
>  
>  struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
>  struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
> -struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
>  
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>  		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
> @@ -53,10 +52,6 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>  
>  struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
>  
> -void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
> -		dma_addr_t *tran_error);
> -
> -
>  int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
>  		int *asid);
>  struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
> 
> -- 
> 2.39.2
> 
