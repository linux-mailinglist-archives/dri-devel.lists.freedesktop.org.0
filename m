Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DD42C498D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 22:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB8C6EA93;
	Wed, 25 Nov 2020 21:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37E86EA93
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 21:10:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606338616; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=LXi+8GhbOdCSBQpn2FWDZHiSkQRyBjoO0GEOs9SQ7rU=;
 b=P3zvUFwxrmZcIkYozHxbHA2rk2ffUPvNQB3es4kKhGRHEtL702rQBcr1pRHxyJUqcJvNYsuU
 DZERTTOtpimmhWm7glXqF4t62ywUFiBqCUHfSASV18+oQBtUy0vkQtb7aiWfmqGC/dRXA+Hs
 5WAOzKP+hgG6g78zyw67XYdxwy4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fbec830d64ea0b703b31498 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 21:10:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EF745C43462; Wed, 25 Nov 2020 21:10:07 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 50E98C433ED;
 Wed, 25 Nov 2020 21:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50E98C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Wed, 25 Nov 2020 14:10:02 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable: Remove tlb_flush_leaf
Message-ID: <20201125211002.GE16856@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
 robh@kernel.org, tomeu.vizoso@collabora.com,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
References: <9844ab0c5cb3da8b2f89c6c2da16941910702b41.1606324115.git.robin.murphy@arm.com>
 <c6e3e4af-118e-d92c-0430-94d8caf52963@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6e3e4af-118e-d92c-0430-94d8caf52963@arm.com>
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
Cc: tomeu.vizoso@collabora.com, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 06:24:13PM +0000, Robin Murphy wrote:
> On 2020-11-25 17:29, Robin Murphy wrote:
> >The only user of tlb_flush_leaf is a particularly hairy corner of the
> >Arm short-descriptor code, which wants a synchronous invalidation to
> >minimise the races inherent in trying to split a large page mapping.
> >This is already far enough into "here be dragons" territory that no
> >sensible caller should ever hit it, and thus it really doesn't need
> >optimising. Although using tlb_flush_walk there may technically be
> >more heavyweight than needed, it does the job and saves everyone else
> >having to carry around useless baggage.
> >
> >Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> >---
> >
> >Reviewing the Mediatek TLB optimisation patches just left me thinking
> >"why do we even have this?"... Panfrost folks, this has zero functional
> >impact to you, merely wants an ack for straying outside drivers/iommu.
> 
> Oops, same goes for MSM folks too - I honestly failed to even notice that
> some of the "msm_iommu" code actually lives in DRM. Maybe the fancy editor
> makes life *too* easy and I should go back to grep and vim and having to pay
> attention to paths... :)

Not a problem - having io-pgtable outside of drivers/iommu is new to most of us
too.

drm/msm LGTM.

Jordan

> Robin.
> 
> >  drivers/gpu/drm/msm/msm_iommu.c             |  1 -
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c     |  7 ------
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  7 ------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 25 +++------------------
> >  drivers/iommu/arm/arm-smmu/qcom_iommu.c     |  8 -------
> >  drivers/iommu/io-pgtable-arm-v7s.c          |  3 +--
> >  drivers/iommu/io-pgtable-arm.c              |  1 -
> >  drivers/iommu/ipmmu-vmsa.c                  |  1 -
> >  drivers/iommu/msm_iommu.c                   |  7 ------
> >  drivers/iommu/mtk_iommu.c                   |  1 -
> >  include/linux/io-pgtable.h                  | 11 ---------
> >  11 files changed, 4 insertions(+), 68 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> >index 22ac7c692a81..50d881794758 100644
> >--- a/drivers/gpu/drm/msm/msm_iommu.c
> >+++ b/drivers/gpu/drm/msm/msm_iommu.c
> >@@ -139,7 +139,6 @@ static void msm_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
> >  static const struct iommu_flush_ops null_tlb_ops = {
> >  	.tlb_flush_all = msm_iommu_tlb_flush_all,
> >  	.tlb_flush_walk = msm_iommu_tlb_flush_walk,
> >-	.tlb_flush_leaf = msm_iommu_tlb_flush_walk,
> >  	.tlb_add_page = msm_iommu_tlb_add_page,
> >  };
> >
> >diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> >index 776448c527ea..c186914cc4f9 100644
> >--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> >+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> >@@ -347,16 +347,9 @@ static void mmu_tlb_flush_walk(unsigned long iova, size_t size, size_t granule,
> >  	mmu_tlb_sync_context(cookie);
> >  }
> >
> >-static void mmu_tlb_flush_leaf(unsigned long iova, size_t size, size_t granule,
> >-			       void *cookie)
> >-{
> >-	mmu_tlb_sync_context(cookie);
> >-}
> >-
> >  static const struct iommu_flush_ops mmu_tlb_ops = {
> >  	.tlb_flush_all	= mmu_tlb_inv_context_s1,
> >  	.tlb_flush_walk = mmu_tlb_flush_walk,
> >-	.tlb_flush_leaf = mmu_tlb_flush_leaf,
> >  };
> >
> >  int panfrost_mmu_pgtable_alloc(struct panfrost_file_priv *priv)
> >diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> >index e634bbe60573..fb684a393118 100644
> >--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> >+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> >@@ -1741,16 +1741,9 @@ static void arm_smmu_tlb_inv_walk(unsigned long iova, size_t size,
> >  	arm_smmu_tlb_inv_range(iova, size, granule, false, cookie);
> >  }
> >
> >-static void arm_smmu_tlb_inv_leaf(unsigned long iova, size_t size,
> >-				  size_t granule, void *cookie)
> >-{
> >-	arm_smmu_tlb_inv_range(iova, size, granule, true, cookie);
> >-}
> >-
> >  static const struct iommu_flush_ops arm_smmu_flush_ops = {
> >  	.tlb_flush_all	= arm_smmu_tlb_inv_context,
> >  	.tlb_flush_walk = arm_smmu_tlb_inv_walk,
> >-	.tlb_flush_leaf = arm_smmu_tlb_inv_leaf,
> >  	.tlb_add_page	= arm_smmu_tlb_inv_page_nosync,
> >  };
> >
> >diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >index dad7fa86fbd4..0b8c59922a2b 100644
> >--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> >@@ -333,14 +333,6 @@ static void arm_smmu_tlb_inv_walk_s1(unsigned long iova, size_t size,
> >  	arm_smmu_tlb_sync_context(cookie);
> >  }
> >
> >-static void arm_smmu_tlb_inv_leaf_s1(unsigned long iova, size_t size,
> >-				     size_t granule, void *cookie)
> >-{
> >-	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
> >-				  ARM_SMMU_CB_S1_TLBIVAL);
> >-	arm_smmu_tlb_sync_context(cookie);
> >-}
> >-
> >  static void arm_smmu_tlb_add_page_s1(struct iommu_iotlb_gather *gather,
> >  				     unsigned long iova, size_t granule,
> >  				     void *cookie)
> >@@ -357,14 +349,6 @@ static void arm_smmu_tlb_inv_walk_s2(unsigned long iova, size_t size,
> >  	arm_smmu_tlb_sync_context(cookie);
> >  }
> >
> >-static void arm_smmu_tlb_inv_leaf_s2(unsigned long iova, size_t size,
> >-				     size_t granule, void *cookie)
> >-{
> >-	arm_smmu_tlb_inv_range_s2(iova, size, granule, cookie,
> >-				  ARM_SMMU_CB_S2_TLBIIPAS2L);
> >-	arm_smmu_tlb_sync_context(cookie);
> >-}
> >-
> >  static void arm_smmu_tlb_add_page_s2(struct iommu_iotlb_gather *gather,
> >  				     unsigned long iova, size_t granule,
> >  				     void *cookie)
> >@@ -373,8 +357,8 @@ static void arm_smmu_tlb_add_page_s2(struct iommu_iotlb_gather *gather,
> >  				  ARM_SMMU_CB_S2_TLBIIPAS2L);
> >  }
> >
> >-static void arm_smmu_tlb_inv_any_s2_v1(unsigned long iova, size_t size,
> >-				       size_t granule, void *cookie)
> >+static void arm_smmu_tlb_inv_walk_s2_v1(unsigned long iova, size_t size,
> >+					size_t granule, void *cookie)
> >  {
> >  	arm_smmu_tlb_inv_context_s2(cookie);
> >  }
> >@@ -401,21 +385,18 @@ static void arm_smmu_tlb_add_page_s2_v1(struct iommu_iotlb_gather *gather,
> >  static const struct iommu_flush_ops arm_smmu_s1_tlb_ops = {
> >  	.tlb_flush_all	= arm_smmu_tlb_inv_context_s1,
> >  	.tlb_flush_walk	= arm_smmu_tlb_inv_walk_s1,
> >-	.tlb_flush_leaf	= arm_smmu_tlb_inv_leaf_s1,
> >  	.tlb_add_page	= arm_smmu_tlb_add_page_s1,
> >  };
> >
> >  static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v2 = {
> >  	.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
> >  	.tlb_flush_walk	= arm_smmu_tlb_inv_walk_s2,
> >-	.tlb_flush_leaf	= arm_smmu_tlb_inv_leaf_s2,
> >  	.tlb_add_page	= arm_smmu_tlb_add_page_s2,
> >  };
> >
> >  static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
> >  	.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
> >-	.tlb_flush_walk	= arm_smmu_tlb_inv_any_s2_v1,
> >-	.tlb_flush_leaf	= arm_smmu_tlb_inv_any_s2_v1,
> >+	.tlb_flush_walk	= arm_smmu_tlb_inv_walk_s2_v1,
> >  	.tlb_add_page	= arm_smmu_tlb_add_page_s2_v1,
> >  };
> >
> >diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> >index b30d6c966e2c..7f280c8d5c53 100644
> >--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> >+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> >@@ -185,13 +185,6 @@ static void qcom_iommu_tlb_flush_walk(unsigned long iova, size_t size,
> >  	qcom_iommu_tlb_sync(cookie);
> >  }
> >
> >-static void qcom_iommu_tlb_flush_leaf(unsigned long iova, size_t size,
> >-				      size_t granule, void *cookie)
> >-{
> >-	qcom_iommu_tlb_inv_range_nosync(iova, size, granule, true, cookie);
> >-	qcom_iommu_tlb_sync(cookie);
> >-}
> >-
> >  static void qcom_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
> >  				    unsigned long iova, size_t granule,
> >  				    void *cookie)
> >@@ -202,7 +195,6 @@ static void qcom_iommu_tlb_add_page(struct iommu_iotlb_gather *gather,
> >  static const struct iommu_flush_ops qcom_flush_ops = {
> >  	.tlb_flush_all	= qcom_iommu_tlb_inv_context,
> >  	.tlb_flush_walk = qcom_iommu_tlb_flush_walk,
> >-	.tlb_flush_leaf = qcom_iommu_tlb_flush_leaf,
> >  	.tlb_add_page	= qcom_iommu_tlb_add_page,
> >  };
> >
> >diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> >index a688f22cbe3b..3cf72c100add 100644
> >--- a/drivers/iommu/io-pgtable-arm-v7s.c
> >+++ b/drivers/iommu/io-pgtable-arm-v7s.c
> >@@ -584,7 +584,7 @@ static arm_v7s_iopte arm_v7s_split_cont(struct arm_v7s_io_pgtable *data,
> >  	__arm_v7s_pte_sync(ptep, ARM_V7S_CONT_PAGES, &iop->cfg);
> >
> >  	size *= ARM_V7S_CONT_PAGES;
> >-	io_pgtable_tlb_flush_leaf(iop, iova, size, size);
> >+	io_pgtable_tlb_flush_walk(iop, iova, size, size);
> >  	return pte;
> >  }
> >
> >@@ -866,7 +866,6 @@ static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
> >  static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
> >  	.tlb_flush_all	= dummy_tlb_flush_all,
> >  	.tlb_flush_walk	= dummy_tlb_flush,
> >-	.tlb_flush_leaf	= dummy_tlb_flush,
> >  	.tlb_add_page	= dummy_tlb_add_page,
> >  };
> >
> >diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> >index a7a9bc08dcd1..938830e07dcf 100644
> >--- a/drivers/iommu/io-pgtable-arm.c
> >+++ b/drivers/iommu/io-pgtable-arm.c
> >@@ -1079,7 +1079,6 @@ static void __init dummy_tlb_add_page(struct iommu_iotlb_gather *gather,
> >  static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
> >  	.tlb_flush_all	= dummy_tlb_flush_all,
> >  	.tlb_flush_walk	= dummy_tlb_flush,
> >-	.tlb_flush_leaf	= dummy_tlb_flush,
> >  	.tlb_add_page	= dummy_tlb_add_page,
> >  };
> >
> >diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> >index 0f18abda0e20..d71f10257f15 100644
> >--- a/drivers/iommu/ipmmu-vmsa.c
> >+++ b/drivers/iommu/ipmmu-vmsa.c
> >@@ -325,7 +325,6 @@ static void ipmmu_tlb_flush(unsigned long iova, size_t size,
> >  static const struct iommu_flush_ops ipmmu_flush_ops = {
> >  	.tlb_flush_all = ipmmu_tlb_flush_all,
> >  	.tlb_flush_walk = ipmmu_tlb_flush,
> >-	.tlb_flush_leaf = ipmmu_tlb_flush,
> >  };
> >
> >  /* -----------------------------------------------------------------------------
> >diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> >index 3615cd6241c4..040e85f70861 100644
> >--- a/drivers/iommu/msm_iommu.c
> >+++ b/drivers/iommu/msm_iommu.c
> >@@ -174,12 +174,6 @@ static void __flush_iotlb_walk(unsigned long iova, size_t size,
> >  	__flush_iotlb_range(iova, size, granule, false, cookie);
> >  }
> >
> >-static void __flush_iotlb_leaf(unsigned long iova, size_t size,
> >-			       size_t granule, void *cookie)
> >-{
> >-	__flush_iotlb_range(iova, size, granule, true, cookie);
> >-}
> >-
> >  static void __flush_iotlb_page(struct iommu_iotlb_gather *gather,
> >  			       unsigned long iova, size_t granule, void *cookie)
> >  {
> >@@ -189,7 +183,6 @@ static void __flush_iotlb_page(struct iommu_iotlb_gather *gather,
> >  static const struct iommu_flush_ops msm_iommu_flush_ops = {
> >  	.tlb_flush_all = __flush_iotlb,
> >  	.tlb_flush_walk = __flush_iotlb_walk,
> >-	.tlb_flush_leaf = __flush_iotlb_leaf,
> >  	.tlb_add_page = __flush_iotlb_page,
> >  };
> >
> >diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> >index c072cee532c2..8e56cec532e7 100644
> >--- a/drivers/iommu/mtk_iommu.c
> >+++ b/drivers/iommu/mtk_iommu.c
> >@@ -240,7 +240,6 @@ static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
> >  static const struct iommu_flush_ops mtk_iommu_flush_ops = {
> >  	.tlb_flush_all = mtk_iommu_tlb_flush_all,
> >  	.tlb_flush_walk = mtk_iommu_tlb_flush_range_sync,
> >-	.tlb_flush_leaf = mtk_iommu_tlb_flush_range_sync,
> >  	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
> >  };
> >
> >diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> >index 4cde111e425b..ec9fae37c0e4 100644
> >--- a/include/linux/io-pgtable.h
> >+++ b/include/linux/io-pgtable.h
> >@@ -25,8 +25,6 @@ enum io_pgtable_fmt {
> >   * @tlb_flush_walk: Synchronously invalidate all intermediate TLB state
> >   *                  (sometimes referred to as the "walk cache") for a virtual
> >   *                  address range.
> >- * @tlb_flush_leaf: Synchronously invalidate all leaf TLB state for a virtual
> >- *                  address range.
> >   * @tlb_add_page:   Optional callback to queue up leaf TLB invalidation for a
> >   *                  single page.  IOMMUs that cannot batch TLB invalidation
> >   *                  operations efficiently will typically issue them here, but
> >@@ -40,8 +38,6 @@ struct iommu_flush_ops {
> >  	void (*tlb_flush_all)(void *cookie);
> >  	void (*tlb_flush_walk)(unsigned long iova, size_t size, size_t granule,
> >  			       void *cookie);
> >-	void (*tlb_flush_leaf)(unsigned long iova, size_t size, size_t granule,
> >-			       void *cookie);
> >  	void (*tlb_add_page)(struct iommu_iotlb_gather *gather,
> >  			     unsigned long iova, size_t granule, void *cookie);
> >  };
> >@@ -220,13 +216,6 @@ io_pgtable_tlb_flush_walk(struct io_pgtable *iop, unsigned long iova,
> >  	iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
> >  }
> >
> >-static inline void
> >-io_pgtable_tlb_flush_leaf(struct io_pgtable *iop, unsigned long iova,
> >-			  size_t size, size_t granule)
> >-{
> >-	iop->cfg.tlb->tlb_flush_leaf(iova, size, granule, iop->cookie);
> >-}
> >-
> >  static inline void
> >  io_pgtable_tlb_add_page(struct io_pgtable *iop,
> >  			struct iommu_iotlb_gather * gather, unsigned long iova,
> >--
> >2.17.1
> >
> >_______________________________________________
> >iommu mailing list
> >iommu@lists.linux-foundation.org
> >https://lists.linuxfoundation.org/mailman/listinfo/iommu
> >
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
