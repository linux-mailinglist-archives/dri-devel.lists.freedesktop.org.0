Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A772A61F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 00:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D60610E0CC;
	Fri,  9 Jun 2023 22:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0223710E0CC;
 Fri,  9 Jun 2023 22:07:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359LTUhR017767; Fri, 9 Jun 2023 22:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=Of75NHEAHIhfLWUhCU9RoMKuB6r7I2Xo3TnnFYOfgeQ=;
 b=f1wlGTgCY3PPZpRaQ+8FmPD0lm6MmKGNiYvG2P/f0TE6AAhPQjq3ziOsNUNJpa4CHKK2
 E+h4fGZ+qSAo0DwyEOxtUilkPU3xTi+plltWYpmt2KT6x/Yr3v8CN6OLu+g0xSjoZ6cn
 DqfdSH1oYusQjaNgWQOuDfKLoBlCqZN0w+9gzickz3x49b32ddOZr6EZHCgfEZxV8D09
 G1M+oEPymMFq+JHwDmDi0vqsONMrcu+1MpMNd4jFWele0BrNyAPCpWl7r35e2RncB3mN
 LcHgYZ+039XZ3qQx/+IbaTTfeEfJJaFJYNzyizJVZ06O69Yp1ia6AVpDrYYnmK+aoZmZ zw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3vu4j00a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 22:07:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 359M75di022236
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Jun 2023 22:07:05 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 9 Jun 2023 15:06:59 -0700
Date: Sat, 10 Jun 2023 03:36:56 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 10/18] drm/msm/a6xx: Introduce GMU wrapper support
Message-ID: <2vr72w4tslxxumzphtuwgkcnbfjrtmw2j4qak2cukcabchadlg@spjbqoa7v4lr>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-10-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-10-69c68206609e@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cBp-jPyw1J0Y3iDp5j6jm_GioRGiZNEt
X-Proofpoint-ORIG-GUID: cBp-jPyw1J0Y3iDp5j6jm_GioRGiZNEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_16,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090187
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
 Conor Dooley <conor+dt@kernel.org>,
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

On Mon, May 29, 2023 at 03:52:29PM +0200, Konrad Dybcio wrote:
> 
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
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  72 +++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 211 ++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   8 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   6 +
>  6 files changed, 277 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 5ba8cba69383..385ca3a12462 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1437,6 +1437,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
>  
>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  {
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	struct platform_device *pdev = to_platform_device(gmu->dev);
>  
> @@ -1462,10 +1463,12 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
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
> @@ -1484,6 +1487,69 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
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
> index 58bf405b85d8..0a44762dbb6d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -21,7 +21,7 @@ static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  
>  	/* Check that the GMU is idle */
> -	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
> +	if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_isidle(&a6xx_gpu->gmu))
>  		return false;
>  
>  	/* Check tha the CX master is idle */
> @@ -1018,10 +1018,13 @@ static int hw_init(struct msm_gpu *gpu)
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
>  	if (a6xx_has_gbif(adreno_gpu)) {
> @@ -1148,6 +1151,17 @@ static int hw_init(struct msm_gpu *gpu)
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

nit: For gmu targets, we do this at a6xx_rpmh_start() which is an odd place
to keep this. But I don't know the reason why it was decided to keep it
there. I don't see any reason why we cannot keep it here for both
gmu/gmu-wrapper like in the downstream driver.

> +
>  	/* Protect registers from the CP */
>  	a6xx_set_cp_protect(gpu);
>  
> @@ -1237,6 +1251,8 @@ static int hw_init(struct msm_gpu *gpu)
>  	}
>  
>  out:
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return ret;
>  	/*
>  	 * Tell the GMU that we are done touching the GPU and it can start power
>  	 * management
> @@ -1271,9 +1287,6 @@ static void a6xx_dump(struct msm_gpu *gpu)
>  	adreno_dump(gpu);
>  }
>  
> -#define VBIF_RESET_ACK_TIMEOUT	100
> -#define VBIF_RESET_ACK_MASK	0x00f0
> -
>  static void a6xx_recover(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -1311,6 +1324,15 @@ static void a6xx_recover(struct msm_gpu *gpu)
>  	 */
>  	gpu->active_submits = 0;
>  
> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> +		/* Drain the outstanding traffic on memory buses */
> +		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
> +
> +		/* Reset the GPU to a clean state */
> +		a6xx_gpu_sw_reset(gpu, true);
> +		a6xx_gpu_sw_reset(gpu, false);
> +	}
> +
>  	reinit_completion(&gmu->pd_gate);
>  	dev_pm_genpd_add_notifier(gmu->cxpd, &gmu->pd_nb);
>  	dev_pm_genpd_synced_poweroff(gmu->cxpd);
> @@ -1461,7 +1483,8 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  	 * Force the GPU to stay on until after we finish
>  	 * collecting information
>  	 */
> -	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> +		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
>  
>  	DRM_DEV_ERROR(&gpu->pdev->dev,
>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
> @@ -1592,6 +1615,10 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  
>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>  {
> +	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> +	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> +		return;
> +
>  	llcc_slice_putd(a6xx_gpu->llc_slice);
>  	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
>  }
> @@ -1601,6 +1628,10 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  {
>  	struct device_node *phandle;
>  
> +	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> +	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> +		return;
> +
>  	/*
>  	 * There is a different programming path for targets with an mmu500
>  	 * attached, so detect if that is the case
> @@ -1670,7 +1701,7 @@ void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
>  		udelay(100);
>  }
>  
> -static int a6xx_pm_resume(struct msm_gpu *gpu)
> +static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -1690,10 +1721,58 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>  
>  	a6xx_llc_activate(a6xx_gpu);
>  
> -	return 0;
> +	return ret;
>  }
>  
> -static int a6xx_pm_suspend(struct msm_gpu *gpu)
> +static int a6xx_pm_resume(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	unsigned long freq = gpu->fast_rate;
> +	struct dev_pm_opp *opp;
> +	int ret;
> +
> +	gpu->needs_hw_init = true;
> +
> +	trace_msm_gpu_resume(0);
> +
> +	mutex_lock(&a6xx_gpu->gmu.lock);

Where is this lock initialized? If the init was moved out of
a6xx_gmu_init(), can you please share that patch?

> +
> +	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
> +	if (IS_ERR(opp)) {
> +		ret = PTR_ERR(opp);
> +		goto err_set_opp;
> +	}
> +	dev_pm_opp_put(opp);
> +
> +	/* Set the core clock and bus bw, having VDD scaling in mind */
> +	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> +
> +	pm_runtime_resume_and_get(gmu->dev);
> +	pm_runtime_resume_and_get(gmu->gxpd);
> +
> +	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
> +	if (ret)
> +		goto err_bulk_clk;
> +
> +	/* If anything goes south, tear the GPU down piece by piece.. */
> +	if (ret) {
> +err_bulk_clk:

Goto jump directly to another block looks odd to me. Why do you need this label
anyway?

> +		pm_runtime_put(gmu->gxpd);
> +		pm_runtime_put(gmu->dev);
> +		dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> +	}
> +err_set_opp:

Generally, it is better to name the label based on what you do here. For
eg: "unlock_lock:".

Also, this function is small enough that it is better to return directly
in case of error. I think that would be more readable.

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
> @@ -1720,7 +1799,40 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>  	return 0;
>  }
>  
> -static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
> +static int a6xx_pm_suspend(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	int i;
> +
> +	trace_msm_gpu_suspend(0);
> +
> +	msm_devfreq_suspend(gpu);
> +
> +	mutex_lock(&a6xx_gpu->gmu.lock);

Again, is this initialized somewhere?

> +
> +	/* Drain the outstanding traffic on memory buses */
> +	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
> +
> +	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
> +
> +	pm_runtime_put_sync(gmu->gxpd);
> +	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> +	pm_runtime_put_sync(gmu->dev);
> +
> +	mutex_unlock(&a6xx_gpu->gmu.lock);
> +
> +	if (a6xx_gpu->shadow_bo)
> +		for (i = 0; i < gpu->nr_rings; i++)
> +			a6xx_gpu->shadow[i] = 0;
> +
> +	gpu->suspend_count++;
> +
> +	return 0;
> +}
> +
> +static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -1739,6 +1851,12 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  	return 0;
>  }
>  
> +static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
> +{
> +	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
> +	return 0;
> +}
> +
>  static struct msm_ringbuffer *a6xx_active_ring(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -2004,8 +2122,8 @@ static const struct adreno_gpu_funcs funcs = {
>  		.set_param = adreno_set_param,
>  		.hw_init = a6xx_hw_init,
>  		.ucode_load = a6xx_ucode_load,
> -		.pm_suspend = a6xx_pm_suspend,
> -		.pm_resume = a6xx_pm_resume,
> +		.pm_suspend = a6xx_gmu_pm_suspend,
> +		.pm_resume = a6xx_gmu_pm_resume,
>  		.recover = a6xx_recover,
>  		.submit = a6xx_submit,
>  		.active_ring = a6xx_active_ring,
> @@ -2020,6 +2138,35 @@ static const struct adreno_gpu_funcs funcs = {
>  #if defined(CONFIG_DRM_MSM_GPU_STATE)
>  		.gpu_state_get = a6xx_gpu_state_get,
>  		.gpu_state_put = a6xx_gpu_state_put,
> +#endif
> +		.create_address_space = a6xx_create_address_space,
> +		.create_private_address_space = a6xx_create_private_address_space,
> +		.get_rptr = a6xx_get_rptr,
> +		.progress = a6xx_progress,
> +	},
> +	.get_timestamp = a6xx_gmu_get_timestamp,
> +};
> +
> +static const struct adreno_gpu_funcs funcs_gmuwrapper = {
> +	.base = {
> +		.get_param = adreno_get_param,
> +		.set_param = adreno_set_param,
> +		.hw_init = a6xx_hw_init,
> +		.ucode_load = a6xx_ucode_load,
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
>  #endif
>  		.create_address_space = a6xx_create_address_space,
>  		.create_private_address_space = a6xx_create_private_address_space,
> @@ -2050,15 +2197,31 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  
>  	adreno_gpu->registers = NULL;
>  
> +	/* Check if there is a GMU phandle and set it up */
> +	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> +	/* FIXME: How do we gracefully handle this? */
> +	BUG_ON(!node);
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
>  	a6xx_llc_slices_init(pdev, a6xx_gpu);
> @@ -2069,7 +2232,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
> @@ -2082,13 +2248,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
> index aa70390ee1c6..c788b06e72da 100644
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
>  /
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
> index 6934cee07d42..5c5901d65950 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -528,6 +528,10 @@ int adreno_load_fw(struct adreno_gpu *adreno_gpu)
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
> @@ -1074,8 +1078,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
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
> index f62612a5c70f..ee5352bc5329 100644
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
> 2.40.1
> 

I am still not fully onboard with the idea of gmu_wrapper node in devicetree.
Aside from that, I don't see any other issue. Please check the few comments I left.

-Akhil.

