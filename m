Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BBE6F3858
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 21:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C090710E33D;
	Mon,  1 May 2023 19:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDC910E323;
 Mon,  1 May 2023 19:40:42 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 341Iq0ti026167; Mon, 1 May 2023 19:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=73Dw+qF2GwWCYr3wQ3MLxCeKdnCuW+gD3VLsISqgIVg=;
 b=cGKh2N5C6zeYatj7HKNIV06J7gAfKURGOGMNXaIFIMGOgT9Eu55jsa7nZJ4trKHAklOP
 n8732cCvQAht50AQr6+SIxfXUCTAsnZFdFdSSWcSP5sARNx20Cca0dpQw/Kms76GcqQM
 kKlrHur07tPIfFBCqH9kF9P7EWYpxKq5KL8m6Tp96GYz6QbP/19BgivzH0BygrKZBAam
 ikgBtYMxHDftAF74VPXeCp/OvtKREEs693oCUlhGJ+2pQpNEFm0BkQadOq6uyGDqZkG5
 gjJLQl4JzwdLlrjRXeje1IZ1sjARZaMEczjC2y25LxqR6RkSZaPxTaf46xLGFXjusa7h MQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8vhgvek0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 May 2023 19:40:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 341JeWbo018607
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 1 May 2023 19:40:32 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 1 May 2023 12:40:26 -0700
Date: Tue, 2 May 2023 01:10:22 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v5 06/15] drm/msm/a6xx: Introduce GMU wrapper support
Message-ID: <20230501194022.GA18382@akhilpo-linux.qualcomm.com>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
 <20230223-topic-gmuwrapper-v5-6-bf774b9a902a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v5-6-bf774b9a902a@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xgoAcC8VvADoO9EjtcL7Z8nb6vL8wf-Y
X-Proofpoint-ORIG-GUID: xgoAcC8VvADoO9EjtcL7Z8nb6vL8wf-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-01_12,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305010158
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 01:25:20AM +0200, Konrad Dybcio wrote:
> Some (particularly SMD_RPM, a.k.a non-RPMh) SoCs implement A6XX GPUs
> but don't implement the associated GMUs. This is due to the fact that
> the GMU directly pokes at RPMh. Sadly, this means we have to take care
> of enabling & scaling power rails, clocks and bandwidth ourselves.
> 
> Reuse existing Adreno-common code and modify the deeply-GMU-infused
> A6XX code to facilitate these GPUs. This involves if-ing out lots
> of GMU callbacks and introducing a new type of GMU - GMU wrapper (it's
> the actual name that Qualcomm uses in their downstream kernels).
> 
> This is essentially a register region which is convenient to model
> as a device. We'll use it for managing the GDSCs. The register
> layout matches the actual GMU_CX/GX regions on the "real GMU" devices
> and lets us reuse quite a bit of gmu_read/write/rmw calls.

Commenting here after going through rest of the patch...

Only convenience I see with modeling a dummy gmu is that we can reuse gmu read/write routines which I think would be less that 10 instances. If we just add a gmu_wrapper region to gpu node, wouldn't that help to create a clean separation between gmu-supported vs gmu-wrapper/no-gmu architectures? Also, creating a dummy gmu device in device tree doesn't sound right to me.


> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  72 +++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 254 +++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   8 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   6 +
>  6 files changed, 317 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 1514b3ed0fcf..c6001e82e03d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1474,6 +1474,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
>  
>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  {
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	struct platform_device *pdev = to_platform_device(gmu->dev);
>  
> @@ -1499,10 +1500,12 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  	gmu->mmio = NULL;
>  	gmu->rscc = NULL;
>  
> -	a6xx_gmu_memory_free(gmu);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +		a6xx_gmu_memory_free(gmu);
>  
> -	free_irq(gmu->gmu_irq, gmu);
> -	free_irq(gmu->hfi_irq, gmu);
> +		free_irq(gmu->gmu_irq, gmu);
> +		free_irq(gmu->hfi_irq, gmu);
> +	}
>  
>  	/* Drop reference taken in of_find_device_by_node */
>  	put_device(gmu->dev);
> @@ -1521,6 +1524,69 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>  	return 0;
>  }
>  
> +int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(node);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	int ret;
> +
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	gmu->dev = &pdev->dev;
> +
> +	of_dma_configure(gmu->dev, node, true);
If GMU is dummy, why should we configure dma?
> +
> +	pm_runtime_enable(gmu->dev);
> +
> +	/* Mark legacy for manual SPTPRAC control */
> +	gmu->legacy = true;
> +
> +	/* Map the GMU registers */
> +	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
> +	if (IS_ERR(gmu->mmio)) {
> +		ret = PTR_ERR(gmu->mmio);
> +		goto err_mmio;
> +	}
> +
> +	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
> +	if (IS_ERR(gmu->cxpd)) {
> +		ret = PTR_ERR(gmu->cxpd);
> +		goto err_mmio;
> +	}
> +
> +	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
> +		ret = -ENODEV;
> +		goto detach_cxpd;
> +	}
> +
> +	init_completion(&gmu->pd_gate);
> +	complete_all(&gmu->pd_gate);
> +	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
> +
> +	/* Get a link to the GX power domain to reset the GPU */
> +	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
> +	if (IS_ERR(gmu->gxpd)) {
> +		ret = PTR_ERR(gmu->gxpd);
> +		goto err_mmio;
> +	}
> +
> +	gmu->initialized = true;
> +
> +	return 0;
> +
> +detach_cxpd:
> +	dev_pm_domain_detach(gmu->cxpd, false);
> +
> +err_mmio:
> +	iounmap(gmu->mmio);
> +
> +	/* Drop reference taken in of_find_device_by_node */
> +	put_device(gmu->dev);
> +
> +	return ret;
> +}
> +
>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  {
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ae0a90b2834f..a7ecb0a87e98 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -20,9 +20,11 @@ static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  
> -	/* Check that the GMU is idle */
> -	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
> -		return false;
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +		/* Check that the GMU is idle */
> +		if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
> +			return false;
> +	}
>  
>  	/* Check tha the CX master is idle */
>  	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS) &
> @@ -612,13 +614,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  		return;
>  
>  	/* Disable SP clock before programming HWCG registers */
> -	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
>  
>  	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
>  		gpu_write(gpu, reg->offset, state ? reg->value : 0);
>  
>  	/* Enable SP clock */
> -	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
>  
>  	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
>  }
> @@ -1002,10 +1006,13 @@ static int hw_init(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	int ret;
>  
> -	/* Make sure the GMU keeps the GPU on while we set it up */
> -	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +		/* Make sure the GMU keeps the GPU on while we set it up */
> +		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> +	}
>  
>  	/* Clear GBIF halt in case GX domain was not collapsed */
>  	if (a6xx_has_gbif(adreno_gpu))
> @@ -1128,6 +1135,17 @@ static int hw_init(struct msm_gpu *gpu)
>  			0x3f0243f0);
>  	}
>  
> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> +		/* Do it here, as GMU wrapper only inits the GMU for memory reservation etc. */
> +
> +		/* Set up the CX GMU counter 0 to count busy ticks */
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK, 0xff000000);
> +
> +		/* Enable power counter 0 */
> +		gmu_rmw(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_0, 0xff, BIT(5));
> +		gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 1);
> +	}
> +
>  	/* Protect registers from the CP */
>  	a6xx_set_cp_protect(gpu);
>  
> @@ -1236,6 +1254,8 @@ static int hw_init(struct msm_gpu *gpu)
>  	}
>  
>  out:
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return ret;
>  	/*
>  	 * Tell the GMU that we are done touching the GPU and it can start power
>  	 * management
> @@ -1270,6 +1290,9 @@ static void a6xx_dump(struct msm_gpu *gpu)
>  	adreno_dump(gpu);
>  }
>  
> +#define GBIF_GX_HALT_MASK	BIT(0)
> +#define GBIF_CLIENT_HALT_MASK	BIT(0)
> +#define GBIF_ARB_HALT_MASK	BIT(1)
>  #define VBIF_RESET_ACK_TIMEOUT	100
>  #define VBIF_RESET_ACK_MASK	0x00f0
>  
> @@ -1302,7 +1325,8 @@ static void a6xx_recover(struct msm_gpu *gpu)
>  	 * Turn off keep alive that might have been enabled by the hang
>  	 * interrupt
>  	 */
> -	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);

Perhaps, we can move this register write to the begining of a6xx_gmu_force_off(). That looks cleaner to me.

>  
>  	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
>  
> @@ -1332,6 +1356,32 @@ static void a6xx_recover(struct msm_gpu *gpu)
>  
>  	dev_pm_genpd_remove_notifier(gmu->cxpd);
>  
> +	/* Software-reset the GPU */
This is not soft reset. We are quiescenting gpu to ddr traffic before we
pull the regulator
> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> +		/* Halt the GX side of GBIF */
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
> +		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
> +			   GBIF_GX_HALT_MASK);
> +
> +		/* Halt new client requests on GBIF */
> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
> +		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> +			   (GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
> +
> +		/* Halt all AXI requests on GBIF */
> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
> +		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> +			   (GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
> +
> +		/* Clear the halts */
> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> +
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
> +
> +		/* This *really* needs to go through before we do anything else! */
> +		mb();
> +	}

This sequence should be before we collapse the regulators and clocks. Can't we handle this similar
to the gmu ops in the pm_suspend cb? Also, We can reuse a6xx_bus_clear_pending_transactions() for this sequence.

> +
>  	pm_runtime_use_autosuspend(&gpu->pdev->dev);
>  
>  	if (active_submits)
> @@ -1516,7 +1566,8 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  	 * Force the GPU to stay on until after we finish
>  	 * collecting information
>  	 */
> -	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);

It would be more readable if we wrap this into a subroutine. 

>  
>  	DRM_DEV_ERROR(&gpu->pdev->dev,
>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
> @@ -1677,7 +1728,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
>  }
>  
> -static int a6xx_pm_resume(struct msm_gpu *gpu)
> +static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -1697,10 +1748,61 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>  
>  	a6xx_llc_activate(a6xx_gpu);
>  
> -	return 0;
> +	return ret;
Isn't ret uninitialized here?
>  }
>  
> -static int a6xx_pm_suspend(struct msm_gpu *gpu)
> +static int a6xx_pm_resume(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	unsigned long freq = 0;
> +	struct dev_pm_opp *opp;
> +	int ret;
> +
> +	gpu->needs_hw_init = true;
> +
> +	trace_msm_gpu_resume(0);
> +
> +	mutex_lock(&a6xx_gpu->gmu.lock);
I don't think we need gmu lock when there is no gmu. Btw, this lock
doesn't seem to be initialized in the current patch.
> +
> +	pm_runtime_resume_and_get(gmu->dev);
> +	pm_runtime_resume_and_get(gmu->gxpd);
> +
> +	/* Set the core clock, having VDD scaling in mind */
> +	ret = dev_pm_opp_set_rate(&gpu->pdev->dev, gpu->fast_rate);
> +	if (ret)
> +		goto err_core_clk;

From power perspective, it is pretty bad if we resume with Fmax. Are you
doing this because you see janks with the current set of GPUs without
GMU?
> +
> +	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
> +	if (ret)
> +		goto err_bulk_clk;
> +
> +	ret = clk_prepare_enable(gpu->ebi1_clk);

Which clk exactly is this? I didn't any patch adding this one.

> +	if (ret)
> +		goto err_mem_clk;
> +
> +	/* If anything goes south, tear the GPU down piece by piece.. */
> +	if (ret) {
> +err_mem_clk:
> +		clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
> +err_bulk_clk:
> +		opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
> +		dev_pm_opp_put(opp);
> +		dev_pm_opp_set_rate(&gpu->pdev->dev, 0);
> +err_core_clk:
> +		pm_runtime_put(gmu->gxpd);
> +		pm_runtime_put(gmu->dev);
> +	}
> +	mutex_unlock(&a6xx_gpu->gmu.lock);
> +
> +	if (!ret)
> +		msm_devfreq_resume(gpu);
> +
> +	return ret;
> +}
> +
> +static int a6xx_gmu_pm_suspend(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -1727,11 +1829,62 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>  	return 0;
>  }
>  
> +static int a6xx_pm_suspend(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	unsigned long freq = 0;
> +	struct dev_pm_opp *opp;
> +	int i, ret;
> +
> +	trace_msm_gpu_suspend(0);
> +
> +	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
> +	dev_pm_opp_put(opp);
> +
> +	msm_devfreq_suspend(gpu);
> +
> +	mutex_lock(&a6xx_gpu->gmu.lock);
> +
> +	clk_disable_unprepare(gpu->ebi1_clk);
> +
> +	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
> +
> +	/* Set frequency to the minimum supported level (no 27MHz on A6xx!) */
> +	ret = dev_pm_opp_set_rate(&gpu->pdev->dev, freq);
> +	if (ret)
> +		goto err;

Why exactly are we doing this here?

> +
> +	pm_runtime_put_sync(gmu->gxpd);
> +	pm_runtime_put_sync(gmu->dev);
> +
> +	mutex_unlock(&a6xx_gpu->gmu.lock);
gmu lock??
> +
> +	if (a6xx_gpu->shadow_bo)
> +		for (i = 0; i < gpu->nr_rings; i++)
> +			a6xx_gpu->shadow[i] = 0;
> +
> +	gpu->suspend_count++;
> +
> +	return 0;
> +
> +err:
> +	mutex_unlock(&a6xx_gpu->gmu.lock);
> +
> +	return ret;
> +}
> +
>  static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  
> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> +		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
> +		return 0;
> +	}
> +

I feel overusing gmu_wrapper check reduces readability and also
increases the mental gymnastic required while modifying the driver. This chunk
clearly fit better as a separate ".get_timestamp" op.

>  	mutex_lock(&a6xx_gpu->gmu.lock);
>  
>  	/* Force the GPU power on so we can read this register */
> @@ -1769,7 +1922,8 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>  		drm_gem_object_put(a6xx_gpu->shadow_bo);
>  	}
>  
> -	a6xx_llc_slices_destroy(a6xx_gpu);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		a6xx_llc_slices_destroy(a6xx_gpu);
>  
>  	mutex_lock(&a6xx_gpu->gmu.lock);
>  	a6xx_gmu_remove(a6xx_gpu);
> @@ -2009,8 +2163,8 @@ static const struct adreno_gpu_funcs funcs = {
>  		.get_param = adreno_get_param,
>  		.set_param = adreno_set_param,
>  		.hw_init = a6xx_hw_init,
> -		.pm_suspend = a6xx_pm_suspend,
> -		.pm_resume = a6xx_pm_resume,
> +		.pm_suspend = a6xx_gmu_pm_suspend,
> +		.pm_resume = a6xx_gmu_pm_resume,
>  		.recover = a6xx_recover,
>  		.submit = a6xx_submit,
>  		.active_ring = a6xx_active_ring,
> @@ -2034,6 +2188,34 @@ static const struct adreno_gpu_funcs funcs = {
>  	.get_timestamp = a6xx_get_timestamp,
>  };
>  
> +static const struct adreno_gpu_funcs funcs_gmuwrapper = {
> +	.base = {
> +		.get_param = adreno_get_param,
> +		.set_param = adreno_set_param,
> +		.hw_init = a6xx_hw_init,
> +		.pm_suspend = a6xx_pm_suspend,
> +		.pm_resume = a6xx_pm_resume,
> +		.recover = a6xx_recover,
> +		.submit = a6xx_submit,
> +		.active_ring = a6xx_active_ring,
> +		.irq = a6xx_irq,
> +		.destroy = a6xx_destroy,
> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +		.show = a6xx_show,
> +#endif
> +		.gpu_busy = a6xx_gpu_busy,
> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +		.gpu_state_get = a6xx_gpu_state_get,
> +		.gpu_state_put = a6xx_gpu_state_put,
> +#endif
> +		.create_address_space = a6xx_create_address_space,
> +		.create_private_address_space = a6xx_create_private_address_space,
> +		.get_rptr = a6xx_get_rptr,
> +		.progress = a6xx_progress,
> +	},
> +	.get_timestamp = a6xx_get_timestamp,
> +};
> +
>  struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  {
>  	struct msm_drm_private *priv = dev->dev_private;
> @@ -2055,18 +2237,36 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  
>  	adreno_gpu->registers = NULL;
>  
> +	/* Check if there is a GMU phandle and set it up */
> +	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> +	/* FIXME: How do we gracefully handle this? */
> +	BUG_ON(!node);
Would creating a gmu component help to gracefully handle this?
> +
> +	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
> +
>  	/*
>  	 * We need to know the platform type before calling into adreno_gpu_init
>  	 * so that the hw_apriv flag can be correctly set. Snoop into the info
>  	 * and grab the revision number
>  	 */
>  	info = adreno_info(config->rev);
> -
> -	if (info && (info->revn == 650 || info->revn == 660 ||
> -			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
> +	if (!info)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* Assign these early so that we can use the is_aXYZ helpers */
> +	/* Numeric revision IDs (e.g. 630) */
> +	adreno_gpu->revn = info->revn;
> +	/* New-style ADRENO_REV()-only */
> +	adreno_gpu->rev = info->rev;
> +	/* Quirk data */
> +	adreno_gpu->info = info;
> +
> +	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
>  		adreno_gpu->base.hw_apriv = true;
>  
> -	a6xx_llc_slices_init(pdev, a6xx_gpu);
> +	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */

Assuming this comment is based on the correlation you see with the
current set GPUs, can we update it to "No LLCC on non-RPMh (and by extension, non-GMU) SoCs so far"?

I think the llcc driver currently doesn't handle well if you call
get_slice api when the platform doesn't have an llc. It returns
EPROBE_DEFER instead of ENODEV or something. So this check to
skip is fine for now, I think.

> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
can we move this check inside a6xx_llc_slices_init()? Same for the
remove part.

-Akhil

> +		a6xx_llc_slices_init(pdev, a6xx_gpu);
>  
>  	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
>  	if (ret) {
> @@ -2074,7 +2274,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  		return ERR_PTR(ret);
>  	}
>  
> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
> +	else
> +		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
>  		return ERR_PTR(ret);
> @@ -2087,13 +2290,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>  		priv->gpu_clamp_to_idle = true;
>  
> -	/* Check if there is a GMU phandle and set it up */
> -	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> -
> -	/* FIXME: How do we gracefully handle this? */
> -	BUG_ON(!node);
> -
> -	ret = a6xx_gmu_init(a6xx_gpu, node);
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
> +	else
> +		ret = a6xx_gmu_init(a6xx_gpu, node);
>  	of_node_put(node);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index eea2e60ce3b7..51a7656072fa 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -76,6 +76,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>  void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>  
>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
> +int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
>  
>  void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 30ecdff363e7..4e5d650578c6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1041,16 +1041,18 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>  	/* Get the generic state from the adreno core */
>  	adreno_gpu_state_get(gpu, &a6xx_state->base);
>  
> -	a6xx_get_gmu_registers(gpu, a6xx_state);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> +		a6xx_get_gmu_registers(gpu, a6xx_state);
>  
> -	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
> -	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
> -	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
> +		a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
> +		a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
> +		a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
>  
> -	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
> +		a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
> +	}
>  
>  	/* If GX isn't on the rest of the data isn't going to be accessible */
> -	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
> +	if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>  		return &a6xx_state->base;
>  
>  	/* Get the banks of indexed registers */
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 84f25122afba..e6216b4169be 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -468,6 +468,10 @@ int adreno_load_fw(struct adreno_gpu *adreno_gpu)
>  		if (!adreno_gpu->info->fw[i])
>  			continue;
>  
> +		/* Skip loading GMU firwmare with GMU Wrapper */
> +		if (adreno_has_gmu_wrapper(adreno_gpu) && i == ADRENO_FW_GMU)
> +			continue;
> +
>  		/* Skip if the firmware has already been loaded */
>  		if (adreno_gpu->fw[i])
>  			continue;
> @@ -1021,8 +1025,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	u32 speedbin;
>  	int ret;
>  
> -	/* Only handle the core clock when GMU is not in use */
> -	if (config->rev.core < 6) {
> +	/* Only handle the core clock when GMU is not in use (or is absent). */
> +	if (adreno_has_gmu_wrapper(adreno_gpu) || config->rev.core < 6) {
>  		/*
>  		 * This can only be done before devm_pm_opp_of_add_table(), or
>  		 * dev_pm_opp_set_config() will WARN_ON()
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index b4f9b1343d63..2c0f0ef094cb 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -115,6 +115,7 @@ struct adreno_gpu {
>  	 * code (a3xx_gpu.c) and stored in this common location.
>  	 */
>  	const unsigned int *reg_offsets;
> +	bool gmu_is_wrapper;
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>  
> @@ -145,6 +146,11 @@ struct adreno_platform_config {
>  
>  bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>  
> +static inline bool adreno_has_gmu_wrapper(struct adreno_gpu *gpu)
> +{
> +	return gpu->gmu_is_wrapper;
> +}
> +
>  static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
>  {
>  	return (gpu->revn < 300);
> 
> -- 
> 2.40.0
> 
