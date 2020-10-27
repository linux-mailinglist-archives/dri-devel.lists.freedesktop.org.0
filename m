Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0750829B23F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 15:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C686EB73;
	Tue, 27 Oct 2020 14:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1836EB73
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 14:39:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603809596; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=BNq5Q872iIhaMxxogOGA+BIR4CjeK4IuQKh6PxLrTdg=;
 b=bLhnG+KdPjTdw5mnx2lLlId8mG5v0QaUSwrUukaYFeKMIxg/GRqWgCPLUF2j3nmb8yPW27aQ
 zL/vaBgnavMJeAbYaNP3A2jeInbdbamH/TTkTM/vxDuPSymppCdo0IwO5K/3WPPPRSzr2t8T
 EXWcrEfEopOUSucFu+s09hzBSGw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f98313b09df41a6c4f799af (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 14:39:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4FF78C43142; Tue, 27 Oct 2020 14:39:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A6C7BC4345D;
 Tue, 27 Oct 2020 14:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6C7BC4345D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 27 Oct 2020 08:39:49 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] drm/msm/a6xx: Add support for using system cache on
 MMU500 based targets
Message-ID: <20201027143949.GC23509@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jonathan Marek <jonathan@marek.ca>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Sharat Masetty <smasetty@codeaurora.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20201026185428.101443-1-jcrouse@codeaurora.org>
 <d5050762b88d5d0d957ad5057f165b21@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5050762b88d5d0d957ad5057f165b21@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 12:38:02PM +0530, Sai Prakash Ranjan wrote:
> On 2020-10-27 00:24, Jordan Crouse wrote:
> >This is an extension to the series [1] to enable the System Cache (LLC)
> >for
> >Adreno a6xx targets.
> >
> >GPU targets with an MMU-500 attached have a slightly different process for
> >enabling system cache. Use the compatible string on the IOMMU phandle
> >to see if an MMU-500 is attached and modify the programming sequence
> >accordingly.
> >
> >[1] https://patchwork.freedesktop.org/series/83037/
> >
> >Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> >---
> >
> > drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 46 +++++++++++++++++++++------
> > drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
> > 2 files changed, 37 insertions(+), 10 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >index 95c98c642876..b7737732fbb6 100644
> >--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >@@ -1042,6 +1042,8 @@ static void a6xx_llc_deactivate(struct a6xx_gpu
> >*a6xx_gpu)
> >
> > static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
> > {
> >+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >+	struct msm_gpu *gpu = &adreno_gpu->base;
> > 	u32 cntl1_regval = 0;
> >
> > 	if (IS_ERR(a6xx_gpu->llc_mmio))
> >@@ -1055,11 +1057,17 @@ static void a6xx_llc_activate(struct a6xx_gpu
> >*a6xx_gpu)
> > 			       (gpu_scid << 15) | (gpu_scid << 20);
> > 	}
> >
> >+	/*
> >+	 * For targets with a MMU500, activate the slice but don't program the
> >+	 * register.  The XBL will take care of that.
> >+	 */
> > 	if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
> >-		u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
> >+		if (!a6xx_gpu->have_mmu500) {
> >+			u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
> >
> >-		gpuhtw_scid &= 0x1f;
> >-		cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
> >+			gpuhtw_scid &= 0x1f;
> >+			cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
> >+		}
> > 	}
> >
> > 	if (cntl1_regval) {
> >@@ -1067,13 +1075,20 @@ static void a6xx_llc_activate(struct a6xx_gpu
> >*a6xx_gpu)
> > 		 * Program the slice IDs for the various GPU blocks and GPU MMU
> > 		 * pagetables
> > 		 */
> >-		a6xx_llc_write(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1,
> >cntl1_regval);
> >-
> >-		/*
> >-		 * Program cacheability overrides to not allocate cache lines on
> >-		 * a write miss
> >-		 */
> >-		a6xx_llc_rmw(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF,
> >0x03);
> >+		if (a6xx_gpu->have_mmu500)
> >+			gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0),
> >+				cntl1_regval);
> >+		else {
> >+			a6xx_llc_write(a6xx_gpu,
> >+				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
> >+
> >+			/*
> >+			 * Program cacheability overrides to not allocate cache
> >+			 * lines on a write miss
> >+			 */
> >+			a6xx_llc_rmw(a6xx_gpu,
> >+				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
> >+		}
> > 	}
> > }
> >
> >@@ -1086,10 +1101,21 @@ static void a6xx_llc_slices_destroy(struct
> >a6xx_gpu *a6xx_gpu)
> > static void a6xx_llc_slices_init(struct platform_device *pdev,
> > 		struct a6xx_gpu *a6xx_gpu)
> > {
> >+	struct device_node *phandle;
> >+
> > 	a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
> > 	if (IS_ERR(a6xx_gpu->llc_mmio))
> > 		return;
> >
> >+	/*
> >+	 * There is a different programming path for targets with an mmu500
> >+	 * attached, so detect if that is the case
> >+	 */
> >+	phandle = of_parse_phandle(pdev->dev.of_node, "iommus", 0);
> >+	a6xx_gpu->have_mmu500 = (phandle &&
> >+		of_device_is_compatible(phandle, "arm,mmu500"));
> >+	of_node_put(phandle);
> >+
> > 	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
> > 	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
> >
> >diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >index 9e6079af679c..e793d329e77b 100644
> >--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >@@ -32,6 +32,7 @@ struct a6xx_gpu {
> > 	void __iomem *llc_mmio;
> > 	void *llc_slice;
> > 	void *htw_llc_slice;
> >+	bool have_mmu500;
> > };
> >
> > #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
> 
> Thanks Jordan for the patch.

If it makes your life or Rob's life easier, please feel free to squash them.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
