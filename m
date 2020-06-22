Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9B203D31
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 18:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D5F6E104;
	Mon, 22 Jun 2020 16:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936206E0FB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 16:55:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592844948; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=E1xy9Gx0hTkrEu6KUPmiiRl49qJNoU7hD/Q9T7ORmy0=;
 b=d0xecxRRJY872JEOr1evq6jqpUVNcWo9XI2qOCUMMPkpCkrLddBWQeDDYZASvjwl9b8q1C/1
 k7lqQ5j3904R8LtUQQLfEee5yemZDZW6RlcgobTC6q7uUnZKADPGtwQdtx/TCp7fB+ZBUBf7
 njK69cuDr+4RbZrBPjYdnbWOpPY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5ef0e293567385e8e775f91d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Jun 2020 16:55:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A9A17C43391; Mon, 22 Jun 2020 16:55:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E005AC433CB;
 Mon, 22 Jun 2020 16:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E005AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm: Fix up the rest of the messed up address sizes
Date: Mon, 22 Jun 2020 10:55:38 -0600
Message-Id: <20200622165539.9247-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
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
Cc: freedreno@lists.freedesktop.org, Joerg Roedel <jroedel@suse.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, tongtiangen <tongtiangen@huawei.com>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

msm_gem_address_space_create() changed to take a start/length instead
of a start/end for the iova space but all of the callers were just
cut and pasted from the old usage. Most of the mistakes have been fixed
up so just catch up the rest.

Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 60f6472a3e58..6021f8d9efd1 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -408,7 +408,7 @@ a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 	struct msm_gem_address_space *aspace;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
-		SZ_16M + 0xfff * SZ_64K);
+		0xfff * SZ_64K);
 
 	if (IS_ERR(aspace) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 096be97ce9f9..21e77d67151f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1121,7 +1121,7 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 		return -ENODEV;
 
 	mmu = msm_iommu_new(gmu->dev, domain);
-	gmu->aspace = msm_gem_address_space_create(mmu, "gmu", 0x0, 0x7fffffff);
+	gmu->aspace = msm_gem_address_space_create(mmu, "gmu", 0x0, 0x80000000);
 	if (IS_ERR(gmu->aspace)) {
 		iommu_domain_free(domain);
 		return PTR_ERR(gmu->aspace);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index b8615d4fe8a3..680527e28d09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -780,7 +780,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 
 	mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
 	aspace = msm_gem_address_space_create(mmu, "dpu1",
-		0x1000, 0xfffffff);
+		0x1000, 0x100000000 - 0x1000);
 
 	if (IS_ERR(aspace)) {
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 08897184b1d9..fc6a3f8134c7 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -514,7 +514,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 			config->iommu);
 
 		aspace  = msm_gem_address_space_create(mmu,
-			"mdp4", 0x1000, 0xffffffff);
+			"mdp4", 0x1000, 0x100000000 - 0x1000);
 
 		if (IS_ERR(aspace)) {
 			if (!IS_ERR(mmu))
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 54631fbd9389..8586d2cf1d94 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -641,7 +641,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 		mmu = msm_iommu_new(iommu_dev, config->platform.iommu);
 
 		aspace = msm_gem_address_space_create(mmu, "mdp5",
-			0x1000, 0xffffffff);
+			0x1000, 0x100000000 - 0x1000);
 
 		if (IS_ERR(aspace)) {
 			if (!IS_ERR(mmu))
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
