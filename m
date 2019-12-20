Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D381282F7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 20:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBE989FEA;
	Fri, 20 Dec 2019 19:58:08 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7060D6ECA2
 for <dri-devel@freedesktop.org>; Fri, 20 Dec 2019 19:58:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576871887; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=qqzsE6iE6h9c38qi8OJwL6QizKwmkcXr+epT82FyQ1U=;
 b=Oh9rnGPTUm5k1KJpIu66unev3oX86X4C8RtT4ic+4TkJIJCCNI10KaMvDPRQDEqjVzuvred4
 WGiwMQx6w4Bm0FIEwOS4XqDfuX/WrbIy2hFMzosQu3kX8agK7ReJfd5BEf9wPoXjPTWjcfJz
 F3+KpUf7Yi3B0m93MQcnVElqS44=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfd27cb.7fc937aa6340-smtp-out-n02;
 Fri, 20 Dec 2019 19:58:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 248C5C4479C; Fri, 20 Dec 2019 19:58:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A3857C43383;
 Fri, 20 Dec 2019 19:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3857C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 20 Dec 2019 12:57:58 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: smasetty@codeaurora.org
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/a6xx: Add support for using
 system cache(LLC)
Message-ID: <20191220195758.GA12730@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: smasetty@codeaurora.org, freedreno@lists.freedesktop.org,
 saiprakash.ranjan@codeaurora.org, will@kernel.org,
 linux-arm-msm@vger.kernel.org, joro@8bytes.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 dri-devel@freedesktop.org, robin.murphy@arm.com,
 linux-arm-msm-owner@vger.kernel.org
References: <1576761286-20451-1-git-send-email-smasetty@codeaurora.org>
 <1576761286-20451-6-git-send-email-smasetty@codeaurora.org>
 <20191219195814.GA23673@jcrouse1-lnx.qualcomm.com>
 <9c32a63c7300cb68e459f58a1b6fe3f8@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c32a63c7300cb68e459f58a1b6fe3f8@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: saiprakash.ranjan@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org, will@kernel.org,
 linux-arm-msm-owner@vger.kernel.org, robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 03:40:59PM +0530, smasetty@codeaurora.org wrote:
> On 2019-12-20 01:28, Jordan Crouse wrote:
> >On Thu, Dec 19, 2019 at 06:44:46PM +0530, Sharat Masetty wrote:
> >>The last level system cache can be partitioned to 32 different slices
> >>of which GPU has two slices preallocated. One slice is used for caching
> >>GPU
> >>buffers and the other slice is used for caching the GPU SMMU pagetables.
> >>This patch talks to the core system cache driver to acquire the slice
> >>handles,
> >>configure the SCID's to those slices and activates and deactivates the
> >>slices
> >>upon GPU power collapse and restore.
> >>
> >>Some support from the IOMMU driver is also needed to make use of the
> >>system cache. IOMMU_QCOM_SYS_CACHE is a buffer protection flag which
> >>enables
> >>caching GPU data buffers in the system cache with memory attributes such
> >>as outer cacheable, read-allocate, write-allocate for buffers. The GPU
> >>then has the ability to override a few cacheability parameters which it
> >>does to override write-allocate to write-no-allocate as the GPU hardware
> >>does not benefit much from it.
> >>
> >>Similarly DOMAIN_ATTR_QCOM_SYS_CACHE is another domain level attribute
> >>used by the IOMMU driver to set the right attributes to cache the
> >>hardware
> >>pagetables into the system cache.
> >>
> >>Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >>---
> >> drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 122
> >>+++++++++++++++++++++++++++++++++-
> >> drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   9 +++
> >> drivers/gpu/drm/msm/msm_iommu.c       |  13 ++++
> >> drivers/gpu/drm/msm/msm_mmu.h         |   3 +
> >> 4 files changed, 146 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>index faff6ff..0c7fdee 100644
> >>--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>@@ -9,6 +9,7 @@
> >> #include "a6xx_gmu.xml.h"
> >>
> >> #include <linux/devfreq.h>
> >>+#include <linux/soc/qcom/llcc-qcom.h>
> >>
> >> #define GPU_PAS_ID 13
> >>
> >>@@ -781,6 +782,117 @@ static void
> >>a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
> >> 	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> >> }
> >>
> >>+#define A6XX_LLC_NUM_GPU_SCIDS		5
> >>+#define A6XX_GPU_LLC_SCID_NUM_BITS	5
> >
> >As I mention below, I'm not sure if we need these
> >
> >>+#define A6XX_GPU_LLC_SCID_MASK \
> >>+	((1 << (A6XX_LLC_NUM_GPU_SCIDS * A6XX_GPU_LLC_SCID_NUM_BITS)) - 1)
> >>+
> >>+#define A6XX_GPUHTW_LLC_SCID_SHIFT	25
> >>+#define A6XX_GPUHTW_LLC_SCID_MASK \
> >>+	(((1 << A6XX_GPU_LLC_SCID_NUM_BITS) - 1) <<
> >>A6XX_GPUHTW_LLC_SCID_SHIFT)
> >>+
> >
> >Normally these go into the envytools regmap but if we're going to do these
> >guys
> >lets use the power of <linux/bitfield.h> for good.
> >
> >#define A6XX_GPU_LLC_SCID GENMASK(24, 0)
> >#define A6XX_GPUHTW_LLC_SCID GENMASK(29, 25)
> >
> >>+static inline void a6xx_gpu_cx_rmw(struct a6xx_llc *llc,
> >
> >Don't mark C functions as inline - let the compiler figure it out for you.
> >
> >>+	u32 reg, u32 mask, u32 or)
> >>+{
> >>+	msm_rmw(llc->mmio + (reg << 2), mask, or);
> >>+}
> >>+
> >>+static void a6xx_llc_deactivate(struct a6xx_llc *llc)
> >>+{
> >>+	llcc_slice_deactivate(llc->gpu_llc_slice);
> >>+	llcc_slice_deactivate(llc->gpuhtw_llc_slice);
> >>+}
> >>+
> >>+static void a6xx_llc_activate(struct a6xx_llc *llc)
> >>+{
> >>+	if (!llc->mmio)
> >>+		return;
> >>+
> >>+	/* Program the sub-cache ID for all GPU blocks */
> >>+	if (!llcc_slice_activate(llc->gpu_llc_slice))
> >>+		a6xx_gpu_cx_rmw(llc,
> >>+				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1,
> >>+				A6XX_GPU_LLC_SCID_MASK,
> >>+				(llc->cntl1_regval &
> >>+				 A6XX_GPU_LLC_SCID_MASK));
> >
> >This is out of order with the comments below, but if we store the slice id
> >then
> >you could calculate regval here and not have to store it.
> >
> >>+
> >>+	/* Program the sub-cache ID for the GPU pagetables */
> >>+	if (!llcc_slice_activate(llc->gpuhtw_llc_slice))
> >
> >val |= FIELD_SET(A6XX_GPUHTW_LLC_SCID, htw_llc_sliceid);
> >
> >>+		a6xx_gpu_cx_rmw(llc,
> >>+				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1,
> >>+				A6XX_GPUHTW_LLC_SCID_MASK,
> >>+				(llc->cntl1_regval &
> >>+				 A6XX_GPUHTW_LLC_SCID_MASK));
> >
> >And this could be FIELD_SET(A6XX_GPUHTW_LLC_SCID, sliceid);
> >
> >In theory you could just calculate the u32 and write it directly without a
> >rmw.
> >In fact, that might be preferable - if the slice activate failed, you
> >don't want
> >to run the risk that the scid for htw is still populated.
> >
> >>+
> >>+	/* Program cacheability overrides */
> >>+	a6xx_gpu_cx_rmw(llc, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF,
> >>+		llc->cntl0_regval);
> >
> >As below, this could easily be a constant.
> >
> >>+}
> >>+
> >>+static void a6xx_llc_slices_destroy(struct a6xx_llc *llc)
> >>+{
> >>+	if (llc->mmio)
> >>+		iounmap(llc->mmio);
> >
> >msm_ioremap returns a devm_ managed resource, so do not use iounmap() to
> >free
> >it. Bets to just leave it and let the gpu device handle it when it goes
> >boom.
> >
> >>+
> >>+	llcc_slice_putd(llc->gpu_llc_slice);
> >>+	llcc_slice_putd(llc->gpuhtw_llc_slice);
> >>+}
> >>+
> >>+static int a6xx_llc_slices_init(struct platform_device *pdev,
> >T
> >This can be void, I don't think we care if it passes or fails.
> >
> >>+		struct a6xx_llc *llc)
> >>+{
> >>+	llc->mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
> >>+	if (IS_ERR_OR_NULL(llc->mmio))
> >
> >msm_ioremap can not return NULL.
> >
> >>+		return -ENODEV;
> >>+
> >>+	llc->gpu_llc_slice = llcc_slice_getd(LLCC_GPU);
> >>+	llc->gpuhtw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
> >>+	if (IS_ERR(llc->gpu_llc_slice) && IS_ERR(llc->gpuhtw_llc_slice))
> >>+		return -ENODEV;
> >>+
> >>+	/*
> >>+	 * CNTL0 provides options to override the settings for the
> >>+	 * read and write allocation policies for the LLC. These
> >>+	 * overrides are global for all memory transactions from
> >>+	 * the GPU.
> >>+	 *
> >>+	 * 0x3: read-no-alloc-overridden = 0
> >>+	 *      read-no-alloc = 0 - Allocate lines on read miss
> >>+	 *      write-no-alloc-overridden = 1
> >>+	 *      write-no-alloc = 1 - Do not allocates lines on write miss
> >>+	 */
> >>+	llc->cntl0_regval = 0x03;
> >
> >This is a fixed value isn't it?  We should be able to get away with
> >writing a
> >constant.
> >
> >>+
> >>+	/*
> >>+	 * CNTL1 is used to specify SCID for (CP, TP, VFD, CCU and UBWC
> >>+	 * FLAG cache) GPU blocks. This value will be passed along with
> >>+	 * the address for any memory transaction from GPU to identify
> >>+	 * the sub-cache for that transaction.
> >>+	 */
> >>+	if (!IS_ERR(llc->gpu_llc_slice)) {
> >>+		u32 gpu_scid = llcc_get_slice_id(llc->gpu_llc_slice);
> >>+		int i;
> >>+
> >>+		for (i = 0; i < A6XX_LLC_NUM_GPU_SCIDS; i++)
> >>+			llc->cntl1_regval |=
> >>+				gpu_scid << (A6XX_GPU_LLC_SCID_NUM_BITS * i);
> >
> >As above, i'm not sure a loop is better than just:
> >
> >gpu_scid &= 0x1f;
> >
> >llc->cntl1_regval = (gpu_scid << 0) || (gpu_scid << 5) | (gpu_scid << 10)
> > | (gpu_scid << 15) | (gpu_scid << 20);
> >
> >And I'm not even sure we need do this math here in the first place.
> >
> >>+	}
> >>+
> >>+	/*
> >>+	 * Set SCID for GPU IOMMU. This will be used to access
> >>+	 * page tables that are cached in LLC.
> >>+	 */
> >>+	if (!IS_ERR(llc->gpuhtw_llc_slice)) {
> >>+		u32 gpuhtw_scid = llcc_get_slice_id(llc->gpuhtw_llc_slice);
> >>+
> >>+		llc->cntl1_regval |=
> >>+			gpuhtw_scid << A6XX_GPUHTW_LLC_SCID_SHIFT;
> >>+	}
> >
> >As above, I think storing the slice id could be more beneficial than
> >calculating
> >a value, but if we do calculate a value, use
> >FIELD_SET(A6XX_GPUHTW_LLC_SCID, )
> >
> >>+
> >>+	return 0;
> >>+}
> >>+
> >> static int a6xx_pm_resume(struct msm_gpu *gpu)
> >> {
> >> 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >>@@ -795,6 +907,8 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
> >>
> >> 	msm_gpu_resume_devfreq(gpu);
> >>
> >>+	a6xx_llc_activate(&a6xx_gpu->llc);
> >>+
> >> 	return 0;
> >> }
> >>
> >>@@ -803,6 +917,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
> >> 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >> 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> >>
> >>+	a6xx_llc_deactivate(&a6xx_gpu->llc);
> >>+
> >> 	devfreq_suspend_device(gpu->devfreq.devfreq);
> >>
> >> 	/*
> >>@@ -851,6 +967,7 @@ static void a6xx_destroy(struct msm_gpu *gpu)
> >> 		drm_gem_object_put_unlocked(a6xx_gpu->sqe_bo);
> >> 	}
> >>
> >>+	a6xx_llc_slices_destroy(&a6xx_gpu->llc);
> >> 	a6xx_gmu_remove(a6xx_gpu);
> >>
> >> 	adreno_gpu_cleanup(adreno_gpu);
> >>@@ -924,7 +1041,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device
> >>*dev)
> >> 	adreno_gpu->registers = NULL;
> >> 	adreno_gpu->reg_offsets = a6xx_register_offsets;
> >>
> >>-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1, 0);
> >>+	ret = a6xx_llc_slices_init(pdev, &a6xx_gpu->llc);
> >>+
> >
> >Confirming we don't care if a6xx_llc_slices_init passes or fails.
> 
> Are you suggesting to unconditionally set the memory attributes in iommu(see
> the code below in msm_iommu.c).
> We probably wouldn't need this patch too in that case:
> https://patchwork.freedesktop.org/patch/346097/
> 
> The return code  is used in the line below to pass
> MMU_FEATURE_USE_SYSTEM_CACHE. Am I missing something here?

Oh, I see. Please don't do that. Set a separate flag if you need to.

features = 0;

 if (a6xx_llc_slices_init(pdev, &a6xx_gpu->llc))
    features = MMU_FEATURE_USE_SYSTEM_CACHE;

Hiding ret in a function that also sets ret has a tendency to confuse people
like me.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
