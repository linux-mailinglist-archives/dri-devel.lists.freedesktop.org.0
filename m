Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C33924E004
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 20:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2821A6EB9D;
	Fri, 21 Aug 2020 18:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436C16EB9D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 18:54:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598036048; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Eun3ubW9wlIkbxTu8kXEPkP0U2HvXvDD7ppooqIBcgM=;
 b=vehy5UkTxBz0XDsCKFQZxf2Sz1tIJkMnJe7KR71xh5Mrky3zCfAbEMPQdU71RdJzuKoHMJcC
 CsFD3PhDVYc4JcgiMSjyITrIFum+oKv6W6qpGAEwYvZo3tPpMUC2TF2NS9TrSZp1Khp5flUe
 pklrNXKeJJZ5youBISyr1P9hL9k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f401839c1ce10a051f4e5b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 21 Aug 2020 18:53:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DEC2AC433CA; Fri, 21 Aug 2020 18:53:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FCF9C43387;
 Fri, 21 Aug 2020 18:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7FCF9C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] drm/msm: Enable expanded apriv support for a650
Date: Fri, 21 Aug 2020 12:53:36 -0600
Message-Id: <20200821185336.2196780-2-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821185336.2196780-1-jcrouse@codeaurora.org>
References: <20200821185336.2196780-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a650 supports expanded apriv support that allows us to map critical buffers
(ringbuffer and memstore) as as privileged to protect them from corruption.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  6 +++++-
 drivers/gpu/drm/msm/msm_gpu.c         |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         | 11 +++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c  |  4 ++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c5a3e4d4c007..406efaac95a7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -678,7 +678,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 			A6XX_PROTECT_RDONLY(0x980, 0x4));
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(25), A6XX_PROTECT_RW(0xa630, 0x0));
 
-	if (adreno_is_a650(adreno_gpu)) {
+	/* Enable expanded apriv for targets that support it */
+	if (gpu->hw_apriv) {
 		gpu_write(gpu, REG_A6XX_CP_APRIV_CNTL,
 			(1 << 6) | (1 << 5) | (1 << 3) | (1 << 2) | (1 << 1));
 	}
@@ -1056,6 +1057,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->registers = NULL;
 	adreno_gpu->reg_offsets = a6xx_register_offsets;
 
+	if (adreno_is_a650(adreno_gpu))
+		adreno_gpu->base.hw_apriv = true;
+
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d5645472b25d..57ddc9438351 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -908,7 +908,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	memptrs = msm_gem_kernel_new(drm,
 		sizeof(struct msm_rbmemptrs) * nr_rings,
-		MSM_BO_UNCACHED, gpu->aspace, &gpu->memptrs_bo,
+		check_apriv(gpu, MSM_BO_UNCACHED), gpu->aspace, &gpu->memptrs_bo,
 		&memptrs_iova);
 
 	if (IS_ERR(memptrs)) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0db117a7339b..37cffac4cbe3 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -15,6 +15,7 @@
 #include "msm_drv.h"
 #include "msm_fence.h"
 #include "msm_ringbuffer.h"
+#include "msm_gem.h"
 
 struct msm_gem_submit;
 struct msm_gpu_perfcntr;
@@ -139,6 +140,8 @@ struct msm_gpu {
 	} devfreq;
 
 	struct msm_gpu_state *crashstate;
+	/* True if the hardware supports expanded apriv (a650 and newer) */
+	bool hw_apriv;
 };
 
 /* It turns out that all targets use the same ringbuffer size */
@@ -327,4 +330,12 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 	mutex_unlock(&gpu->dev->struct_mutex);
 }
 
+/*
+ * Simple macro to semi-cleanly add the MAP_PRIV flag for targets that can
+ * support expanded privileges
+ */
+#define check_apriv(gpu, flags) \
+	(((gpu)->hw_apriv ? MSM_BO_MAP_PRIV : 0) | (flags))
+
+
 #endif /* __MSM_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 39ecb5a18431..935bf9b1d941 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -27,8 +27,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ring->id = id;
 
 	ring->start = msm_gem_kernel_new(gpu->dev, MSM_GPU_RINGBUFFER_SZ,
-		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->aspace, &ring->bo,
-		&ring->iova);
+		check_apriv(gpu, MSM_BO_WC | MSM_BO_GPU_READONLY),
+		gpu->aspace, &ring->bo, &ring->iova);
 
 	if (IS_ERR(ring->start)) {
 		ret = PTR_ERR(ring->start);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
