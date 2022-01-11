Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F2D48C04D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17910112E52;
	Wed, 12 Jan 2022 08:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 11 Jan 2022 21:36:48 UTC
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259510E283
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 21:36:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1641937008; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=gCZNJastbjYFHPXtfi5+BDLBCMuC79nUsj/TARVQfvA=;
 b=f+AdmdI+DiUGBYOIiE9YH9t5hUy2fXXPb0Eto174UiRURcujfW8x/N3ZUVRtLVmk+aiVgkFi
 FkbFQu1PS0qBp3yOJgJZ+RoIhrL2VW0hUMDFZwILwA2OUvnsxZTPi75WafRvsVOix5xV0Wyx
 uXuv9NrkVbJMRW4eJa/pae5fypM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61ddf7424f9f22efc09a5e1d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Jan 2022 21:31:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 57A5AC43635; Tue, 11 Jan 2022 21:31:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C384C4338F;
 Tue, 11 Jan 2022 21:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0C384C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>
Subject: [PATCH 1/4] drm/msm/adreno: Add support for Adreno 8c Gen 3
Date: Wed, 12 Jan 2022 03:01:27 +0530
Message-Id: <20220112030115.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 12 Jan 2022 08:51:42 +0000
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
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for "Adreno 8c Gen 3" gpu along with the necessary speedbin
support.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 21 +++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++++++--
 3 files changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 51b8377..9268ce3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,7 +10,6 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
-#include <linux/nvmem-consumer.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
@@ -1734,6 +1733,18 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 adreno_7c3_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 117)
+		return 0;
+	else if (fuse == 190)
+		return 1;
+
+	return UINT_MAX;
+}
+
 static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 {
 	u32 val = UINT_MAX;
@@ -1741,6 +1752,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+		val = adreno_7c3_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware",
@@ -1753,11 +1767,10 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 
 static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 {
-	u32 supp_hw = UINT_MAX;
-	u32 speedbin;
+	u32 speedbin, supp_hw = UINT_MAX;
 	int ret;
 
-	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
+	ret = adreno_read_speedbin(dev, &speedbin);
 	/*
 	 * -ENOENT means that the platform doesn't support speedbin which is
 	 * fine
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 9300583..f35c631 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/nvmem-consumer.h>
 #include "adreno_gpu.h"
 
 bool hang_debug = false;
@@ -317,6 +318,17 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a660_zap.mdt",
 		.hwcg = a660_hwcg,
 	}, {
+		.rev = ADRENO_REV_SKU(6, 3, 5, ANY_ID, 190),
+		.name = "Adreno 8c Gen 3",
+		.fw = {
+			[ADRENO_FW_SQE] = "a660_sqe.fw",
+			[ADRENO_FW_GMU] = "a660_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.hwcg = a660_hwcg,
+	}, {
 		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
 		.name = "Adreno 7c Gen 3",
 		.fw = {
@@ -371,7 +383,8 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2)
 	return _rev_match(rev1.core, rev2.core) &&
 		_rev_match(rev1.major, rev2.major) &&
 		_rev_match(rev1.minor, rev2.minor) &&
-		_rev_match(rev1.patchid, rev2.patchid);
+		_rev_match(rev1.patchid, rev2.patchid) &&
+		_rev_match(rev1.sku, rev2.sku);
 }
 
 const struct adreno_info *adreno_info(struct adreno_rev rev)
@@ -445,12 +458,17 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return gpu;
 }
 
+int adreno_read_speedbin(struct device *dev, u32 *speedbin)
+{
+	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
+}
+
 static int find_chipid(struct device *dev, struct adreno_rev *rev)
 {
 	struct device_node *node = dev->of_node;
 	const char *compat;
 	int ret;
-	u32 chipid;
+	u32 chipid, speedbin;
 
 	/* first search the compat strings for qcom,adreno-XYZ.W: */
 	ret = of_property_read_string_index(node, "compatible", 0, &compat);
@@ -466,7 +484,7 @@ static int find_chipid(struct device *dev, struct adreno_rev *rev)
 			rev->minor = r;
 			rev->patchid = patch;
 
-			return 0;
+			goto done;
 		}
 	}
 
@@ -486,6 +504,11 @@ static int find_chipid(struct device *dev, struct adreno_rev *rev)
 	dev_warn(dev, "Use compatible qcom,adreno-%u%u%u.%u instead.\n",
 		rev->core, rev->major, rev->minor, rev->patchid);
 
+done:
+	if (adreno_read_speedbin(dev, &speedbin))
+		speedbin = ANY_ID;
+
+	rev->sku = (uint16_t) (0xffff & speedbin);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cffabe7..52bd93a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -40,12 +40,16 @@ struct adreno_rev {
 	uint8_t  major;
 	uint8_t  minor;
 	uint8_t  patchid;
+	uint16_t sku;
 };
 
-#define ANY_ID 0xff
+#define ANY_ID	0xff
+#define ANY_SKU 0xffff
 
 #define ADRENO_REV(core, major, minor, patchid) \
-	((struct adreno_rev){ core, major, minor, patchid })
+	((struct adreno_rev){ core, major, minor, patchid, ANY_SKU })
+#define ADRENO_REV_SKU(core, major, minor, patchid, sku) \
+	((struct adreno_rev){ core, major, minor, patchid, sku })
 
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
@@ -324,6 +328,8 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 
 void adreno_set_llc_attributes(struct iommu_domain *iommu);
 
+int adreno_read_speedbin(struct device *dev, u32 *speedbin);
+
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
  * out of secure mode
-- 
2.7.4

