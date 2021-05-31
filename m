Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60408396329
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 17:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A216E941;
	Mon, 31 May 2021 15:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00FF6E941
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 15:05:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622473563; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=yUA18l6oLriskGlZSOdIDZ33kwlGD/ehBgJ0aOtt1y0=;
 b=ffzJwInDWBlILQlYzkBmjR0lpoTipu7WiRBmD/R4mW525QKYi3LcFvZ8D9R435zKRwJ/WpzE
 dtl653KAKlwbkjXxtB0Dol68DJUdo/cMB0COBrGUHrCdnSmZ/cmTlVLxjbhQ97ydWynn7/3D
 NIl0+yIuBVAx1mskTZAbOCTx6Ys=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60b4fb3a81efe91cda50272a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 15:05:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B79EBC43144; Mon, 31 May 2021 15:05:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [117.210.184.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 13049C433D3;
 Mon, 31 May 2021 15:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 13049C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v2 6/8] drm/msm/a6xx: add support for Adreno 660 GPU
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-7-jonathan@marek.ca>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <055b924e-43fe-1b2b-7292-43a88f9798c2@codeaurora.org>
Date: Mon, 31 May 2021 20:35:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210513171431.18632-7-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 kbuild test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/13/2021 10:44 PM, Jonathan Marek wrote:
> Add adreno_is_{a660,a650_family} helpers and convert update existing
> adreno_is_a650 usage based on downstream driver's logic (changing into
> adreno_is_a650_family or adding adreno_is_a660).
> 
> And add the remaining changes required for A660, again based on
> the downstream driver: missing GMU allocations, additional register init,
> dummy hfi BW table, cp protect list, entry in gpulist table.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx.xml.h      |  4 ++
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 32 +++++++---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 73 +++++++++++++++++++---
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 33 ++++++++++
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 12 ++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  2 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 12 ++++
>   7 files changed, 152 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
> index 920c5e6b8e96..631c36672560 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
> @@ -2240,6 +2240,8 @@ static inline uint32_t A6XX_DBGC_CFG_DBGBUS_BYTEL_1_BYTEL15(uint32_t val)
>   
>   #define REG_A6XX_DBGC_CFG_DBGBUS_TRACE_BUF2			0x00000630
>   
> +#define REG_A6XX_CP_LPAC_PROG_FIFO_SIZE     			0x00000b34
> +
>   #define REG_A6XX_VSC_PERFCTR_VSC_SEL_0				0x00000cd8
>   
>   #define REG_A6XX_VSC_PERFCTR_VSC_SEL_1				0x00000cd9
> @@ -2340,6 +2342,8 @@ static inline uint32_t A6XX_UCHE_CLIENT_PF_PERFSEL(uint32_t val)
>   
>   #define REG_A6XX_UCHE_PERFCTR_UCHE_SEL_11			0x00000e27
>   
> +#define REG_A6XX_UCHE_CMDQ_CONFIG               		0x00000e3c
> +
>   #define REG_A6XX_SP_ADDR_MODE_CNTL				0x0000ae01
>   
>   #define REG_A6XX_SP_NC_MODE_CNTL				0x0000ae02
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index c1ee02d6371d..91052a661c6e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -519,7 +519,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	if (!pdcptr)
>   		goto err;
>   
> -	if (adreno_is_a650(adreno_gpu))
> +	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))

why not adreno_is_a650_family() here?

>   		pdc_in_aop = true;
>   	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
>   		pdc_address_offset = 0x30090;
> @@ -549,7 +549,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_HI, 0x4514);
>   
>   	/* Load RSC sequencer uCode for sleep and wakeup */
> -	if (adreno_is_a650(adreno_gpu)) {
> +	if (adreno_is_a650_family(adreno_gpu)) {
>   		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xeaaae5a0);
>   		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xe1a1ebab);
>   		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e0a581);
> @@ -597,7 +597,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>   
>   	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 4, 0x10108);
>   	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 4, 0x30000);
> -	if (adreno_is_a618(adreno_gpu) || adreno_is_a650(adreno_gpu))
> +	if (adreno_is_a618(adreno_gpu) || adreno_is_a650_family(adreno_gpu))
>   		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x2);
>   	else
>   		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x3);
> @@ -698,7 +698,7 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
>   	u32 itcm_base = 0x00000000;
>   	u32 dtcm_base = 0x00040000;
>   
> -	if (adreno_is_a650(adreno_gpu))
> +	if (adreno_is_a650_family(adreno_gpu))
>   		dtcm_base = 0x10004000;
>   
>   	if (gmu->legacy) {
> @@ -751,7 +751,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>   	int ret;
>   	u32 chipid;
>   
We need to program this register here:
gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, 1);

> -	if (adreno_is_a650(adreno_gpu))
> +	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>   		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
>   
>   	if (state == GMU_WARM_BOOT) {
> @@ -1494,12 +1494,28 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   	if (ret)
>   		goto err_put_device;
>   
> +
> +	/* A660 now requires handling "prealloc requests" in GMU firmware
> +	 * For now just hardcode allocations based on the known firmware.
> +	 * note: there is no indication that these correspond to "dummy" or
> +	 * "debug" regions, but this "guess" allows reusing these BOs which
> +	 * are otherwise unused by a660.
> +	 */
> +	gmu->dummy.size = SZ_4K;
> +	if (adreno_is_a660(adreno_gpu)) {
> +		ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_4K * 7, 0x60400000);
> +		if (ret)
> +			goto err_memory;

I think we can simply ignore this allocation for a660 because it was 
required for an unused feature. Do you see any issue if you ignore this 
allocation?

> +
> +		gmu->dummy.size = SZ_8K;
> +	}
> +
>   	/* Allocate memory for the GMU dummy page */
> -	ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, SZ_4K, 0x60000000);
> +	ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, gmu->dummy.size, 0x60000000);
>   	if (ret)
>   		goto err_memory;
>   
> -	if (adreno_is_a650(adreno_gpu)) {
> +	if (adreno_is_a650_family(adreno_gpu)) {
>   		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
>   			SZ_16M - SZ_16K, 0x04000);
>   		if (ret)
> @@ -1541,7 +1557,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>   		goto err_memory;
>   	}
>   
> -	if (adreno_is_a650(adreno_gpu)) {
> +	if (adreno_is_a650_family(adreno_gpu)) {
>   		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
>   		if (IS_ERR(gmu->rscc))
>   			goto err_mmio;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ff3c328604f8..3cc23057b11d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -541,6 +541,51 @@ static const u32 a650_protect[] = {
>   	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
>   };
>   
> +/* These are for a635 and a660 */
> +static const u32 a660_protect[] = {
> +	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
> +	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
> +	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
> +	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
> +	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
> +	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
> +	A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
> +	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
> +	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
> +	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
> +	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
> +	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
> +	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
> +	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
> +	A6XX_PROTECT_NORDWR(0x08e80, 0x027f),
> +	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
> +	A6XX_PROTECT_NORDWR(0x09e60, 0x0011),
> +	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
> +	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
> +	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x0ae50, 0x012f),
> +	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x0b608, 0x0006),
> +	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
> +	A6XX_PROTECT_NORDWR(0x0be20, 0x015f),
> +	A6XX_PROTECT_NORDWR(0x0d000, 0x05ff),
> +	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x18400, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x1a400, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
> +	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
> +	A6XX_PROTECT_NORDWR(0x1f860, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x1f887, 0x001b),
> +	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
> +};
> +
>   static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -554,6 +599,10 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>   		regs = a650_protect;
>   		count = ARRAY_SIZE(a650_protect);
>   		count_max = 48;
> +	} else if (adreno_is_a660(adreno_gpu)) {
> +		regs = a660_protect;
> +		count = ARRAY_SIZE(a660_protect);
> +		count_max = 48;
>   	}
>   
>   	/*
> @@ -584,7 +633,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>   	if (adreno_is_a640(adreno_gpu))
>   		amsbc = 1;
>   
> -	if (adreno_is_a650(adreno_gpu)) {
> +	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>   		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>   		lower_bit = 3;
>   		amsbc = 1;
> @@ -797,7 +846,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>   	a6xx_set_hwcg(gpu, true);
>   
>   	/* VBIF/GBIF start*/
> -	if (adreno_is_a640(adreno_gpu) || adreno_is_a650(adreno_gpu)) {
> +	if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
>   		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
>   		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
>   		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
> @@ -822,7 +871,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>   	gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_LO, 0xfffff000);
>   	gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_HI, 0x0001ffff);
>    > -	if (!adreno_is_a650(adreno_gpu)) {
> +	if (!adreno_is_a650_family(adreno_gpu)) {
>   		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
>   		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO,
>   			REG_A6XX_UCHE_GMEM_RANGE_MIN_HI, 0x00100000);
> @@ -835,17 +884,20 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>   	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
>   	gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
>   
> -	if (adreno_is_a640(adreno_gpu) || adreno_is_a650(adreno_gpu))
> +	if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu))
>   		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
>   	else
>   		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
We can invert this and check for legacy gpus. All new gpus uses 0x02000140.

>   	gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
>   
> +	if (adreno_is_a660(adreno_gpu))
> +		gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
> +
>   	/* Setting the mem pool size */
>   	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
>   
>   	/* Setting the primFifo thresholds default values */
> -	if (adreno_is_a650(adreno_gpu))
> +	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>   		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300000);
>   	else if (adreno_is_a640(adreno_gpu))
>   		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200000);
> @@ -870,7 +922,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>   	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
>   
>   	/* Set weights for bicubic filtering */
> -	if (adreno_is_a650(adreno_gpu)) {
> +	if (adreno_is_a650_family(adreno_gpu)) {
>   		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
>   		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
>   			0x3fe05ff4);
> @@ -885,6 +937,13 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>   	/* Protect registers from the CP */
>   	a6xx_set_cp_protect(gpu);
>   
> +	if (adreno_is_a660(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
> +		/* Set dualQ + disable afull for A660 GPU but not for A635 */
> +		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
> +	}
> +
gpu_rmw(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0, (1 << 9));
We need this for a640, a650 and a660.

>   	/* Enable expanded apriv for targets that support it */
>   	if (gpu->hw_apriv) {
>   		gpu_write(gpu, REG_A6XX_CP_APRIV_CNTL,
> @@ -1561,7 +1620,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   	 */
>   	info = adreno_info(config->rev);
>   
> -	if (info && info->revn == 650)
> +	if (info && (info->revn == 650 || info->revn == 660))
>   		adreno_gpu->base.hw_apriv = true;
>   
>   	a6xx_llc_slices_init(pdev, a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index ccd44d0418f8..919433732b43 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -351,6 +351,37 @@ static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>   	msg->cnoc_cmds_data[1][0] =  0x60000001;
>   }
>   
> +static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	/*
> +	 * Send a single "off" entry just to get things running
> +	 * TODO: bus scaling
> +	 */
> +	msg->bw_level_num = 1;
> +
> +	msg->ddr_cmds_num = 3;
> +	msg->ddr_wait_bitmask = 0x01;
> +
> +	msg->ddr_cmds_addrs[0] = 0x50004;
> +	msg->ddr_cmds_addrs[1] = 0x500a0;
> +	msg->ddr_cmds_addrs[2] = 0x50000;
> +
> +	msg->ddr_cmds_data[0][0] =  0x40000000;
> +	msg->ddr_cmds_data[0][1] =  0x40000000;
> +	msg->ddr_cmds_data[0][2] =  0x40000000;
> +
> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU but the
> +	 * votes are known and fixed for the target
> +	 */
> +	msg->cnoc_cmds_num = 1;
> +	msg->cnoc_wait_bitmask = 0x01;
> +
> +	msg->cnoc_cmds_addrs[0] = 0x50070;
> +	msg->cnoc_cmds_data[0][0] =  0x40000000;
> +	msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
> +
I don't have the exact values for this table for a660 handy. If it works 
for you, I guess it is fine.

>   static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>   {
>   	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
> @@ -401,6 +432,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>   		a640_build_bw_table(&msg);
>   	else if (adreno_is_a650(adreno_gpu))
>   		a650_build_bw_table(&msg);
> +	else if (adreno_is_a660(adreno_gpu))
> +		a660_build_bw_table(&msg);
>   	else
>   		a6xx_build_bw_table(&msg);
>   
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index b3337b93be91..e4db0683d381 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -287,6 +287,18 @@ static const struct adreno_info gpulist[] = {
>   		.init = a6xx_gpu_init,
>   		.zapfw = "a650_zap.mdt",
>   		.hwcg = a650_hwcg,
> +	}, {
> +		.rev = ADRENO_REV(6, 6, 0, ANY_ID),
> +		.revn = 660,
> +		.name = "A660",
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a660_sqe.fw",
> +			[ADRENO_FW_GMU] = "a660_gmu.bin",
> +		},
> +		.gmem = SZ_1M + SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a660_zap.mdt",
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 009f4c560f16..326ca3123746 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -239,7 +239,7 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
>   		*value = adreno_gpu->gmem;
>   		return 0;
>   	case MSM_PARAM_GMEM_BASE:
> -		*value = !adreno_is_a650(adreno_gpu) ? 0x100000 : 0;
> +		*value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
>   		return 0;
>   	case MSM_PARAM_CHIP_ID:
>   		*value = adreno_gpu->rev.patchid |
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index ccac275aa7a2..63c050919d85 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -247,6 +247,18 @@ static inline int adreno_is_a650(struct adreno_gpu *gpu)
>          return gpu->revn == 650;
>   }
>   
> +static inline int adreno_is_a660(struct adreno_gpu *gpu)
> +{
> +       return gpu->revn == 660;
> +}
> +
> +/* check for a650, a660, or any derivatives */
> +static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
> +{
> +       return gpu->revn == 650 || gpu->revn == 620 ||
> +              gpu->revn == 660 || gpu->revn == 635;
We can remove 635 references throughout since that is not a valid adreno 
chipid anymore.

-Akhil
> +}
> +
>   int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
>   const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
>   		const char *fwname);
> 
