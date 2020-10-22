Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B41229577A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 07:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D8D6F3A1;
	Thu, 22 Oct 2020 05:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D129D6F3A1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 05:02:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603342933; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bs0PLwHTsY9XEnsASkgvtp0LumQf4uYuGUvx3brV6cE=;
 b=Vr2q5flfTR2F87D5VYBK7adIpY5bWKLfem+paVUjvGJhGgBveZ/zHGUpYe7cJq7ovy/uG3wv
 zP0GItkg5VD+oBvcZbeSbkG4RjMyIFsjcQjDIIEmIpD3xkY4QGtVvEkqQjb2WVPTlXCPjuhT
 WMariJ8hadwALGMlb5r7DyHJuHc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f91124d83370fa1c19961a0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 05:02:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C1DCAC43387; Thu, 22 Oct 2020 05:02:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EDA4BC43382;
 Thu, 22 Oct 2020 05:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EDA4BC43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm: register the base address with dpu_dbg module
Date: Wed, 21 Oct 2020 22:01:47 -0700
Message-Id: <20201022050148.27105-4-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201022050148.27105-1-abhinavk@codeaurora.org>
References: <20201022050148.27105-1-abhinavk@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register the base address of various dpu sub-modules with the
dpu_dbg module so that it can be dumped out during error scenarios.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c       |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  6 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  7 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  5 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  6 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  8 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  7 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 12 +++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++-
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 12 +++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h           |  4 +++
 drivers/gpu/drm/msm/dp/dp_display.c           |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 10 ++++++-
 drivers/gpu/drm/msm/msm_drv.c                 | 26 ++++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h                 |  3 ++-
 15 files changed, 101 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
index 6703e1555194..62f49e60a4ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dbg.c
@@ -263,7 +263,7 @@ int dpu_dbg_reg_register_base(const char *name, void __iomem *base,
 	/* Initialize list to make sure check for null list will be valid */
 	INIT_LIST_HEAD(&reg_base->sub_range_list);
 
-	pr_debug("%s base: %pK max_offset 0x%zX\n", reg_base->name,
+	pr_info("%s base: %pK max_offset 0x%zX\n", reg_base->name,
 			reg_base->base, reg_base->max_offset);
 
 	list_add(&reg_base->reg_base_head, &dbg_base->reg_base_list);
@@ -310,7 +310,7 @@ void dpu_dbg_reg_register_dump_range(const char *base_name,
 	range->xin_id = xin_id;
 	list_add_tail(&range->head, &reg_base->sub_range_list);
 
-	pr_debug("base %s, range %s, start 0x%X, end 0x%X\n",
+	pr_info("base_name %s, range_name %s, start 0x%X, end 0x%X\n",
 			base_name, range->range_name,
 			range->offset.start, range->offset.end);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 758c355b4fd8..3a827ea96723 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
 #include <linux/delay.h>
@@ -7,6 +7,7 @@
 #include "dpu_hw_ctl.h"
 #include "dpu_kms.h"
 #include "dpu_trace.h"
+#include "dpu_dbg.h"
 
 #define   CTL_LAYER(lm)                 \
 	(((lm) == LM_5) ? (0x024) : (((lm) - LM_0) * 0x004))
@@ -588,6 +589,9 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl idx,
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_CTL, idx, &dpu_hw_ops);
 
+	dpu_dbg_reg_register_dump_range(DPU_DBG_NAME, cfg->name, c->hw.blk_off,
+			c->hw.blk_off + c->hw.length, c->hw.xin_id);
+
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index a7a24539921f..ee9ae02f5e7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
 #include "dpu_hwio.h"
@@ -7,7 +7,7 @@
 #include "dpu_hw_lm.h"
 #include "dpu_hw_dspp.h"
 #include "dpu_kms.h"
-
+#include "dpu_dbg.h"
 
 /* DSPP_PCC */
 #define PCC_EN BIT(0)
@@ -115,6 +115,9 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_DSPP, idx, &dpu_hw_ops);
 
+	dpu_dbg_reg_register_dump_range(DPU_DBG_NAME, cfg->name, c->hw.blk_off,
+			c->hw.blk_off + c->hw.length, c->hw.xin_id);
+
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 6f0f54588124..d8198d4d42bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2020, The Linux Foundation. All rights reserved.
  */
 
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_intf.h"
 #include "dpu_kms.h"
+#include "dpu_dbg.h"
 
 #define INTF_TIMING_ENGINE_EN           0x000
 #define INTF_CONFIG                     0x004
@@ -319,6 +320,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_INTF, idx, &dpu_hw_ops);
 
+	dpu_dbg_reg_register_dump_range(DPU_DBG_NAME, cfg->name, c->hw.blk_off,
+			c->hw.blk_off + c->hw.length, c->hw.xin_id);
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index bea4ab5c58c5..0dc6d161e890 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
 #include <linux/iopoll.h>
@@ -10,6 +10,7 @@
 #include "dpu_hw_pingpong.h"
 #include "dpu_kms.h"
 #include "dpu_trace.h"
+#include "dpu_dbg.h"
 
 #define PP_TEAR_CHECK_EN                0x000
 #define PP_SYNC_CONFIG_VSYNC            0x004
@@ -260,6 +261,9 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_PINGPONG, idx, &dpu_hw_ops);
 
+	dpu_dbg_reg_register_dump_range(DPU_DBG_NAME, cfg->name, c->hw.blk_off,
+			c->hw.blk_off + c->hw.length, c->hw.xin_id);
+
 	return c;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index c940b69435e1..873fc828538d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
 #include "dpu_hwio.h"
@@ -7,6 +7,7 @@
 #include "dpu_hw_lm.h"
 #include "dpu_hw_sspp.h"
 #include "dpu_kms.h"
+#include "dpu_dbg.h"
 
 #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
 
@@ -736,6 +737,11 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
 
 	dpu_hw_blk_init(&hw_pipe->base, DPU_HW_BLK_SSPP, idx, &dpu_hw_ops);
 
+	dpu_dbg_reg_register_dump_range(DPU_DBG_NAME, cfg->name,
+			hw_pipe->hw.blk_off,
+			hw_pipe->hw.blk_off + hw_pipe->hw.length,
+			hw_pipe->hw.xin_id);
+
 	return hw_pipe;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 01b76766a9a8..f042471815cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_top.h"
 #include "dpu_kms.h"
+#include "dpu_dbg.h"
 
 #define SSPP_SPARE                        0x28
 
@@ -326,6 +327,10 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 
 	dpu_hw_blk_init(&mdp->base, DPU_HW_BLK_TOP, idx, &dpu_hw_ops);
 
+	dpu_dbg_reg_register_dump_range(DPU_DBG_NAME, cfg->name,
+			mdp->hw.blk_off, mdp->hw.blk_off + mdp->hw.length,
+			mdp->hw.xin_id);
+
 	return mdp;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d93c44f6996d..dc64e032d82f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2014-2018, 2020 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -27,6 +27,7 @@
 #include "dpu_encoder.h"
 #include "dpu_plane.h"
 #include "dpu_crtc.h"
+#include "dpu_dbg.h"
 
 #define CREATE_TRACE_POINTS
 #include "dpu_trace.h"
@@ -908,7 +909,14 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->mmio = NULL;
 		goto error;
 	}
-	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
+
+	dpu_kms->mmio_len = msm_iomap_size(dpu_kms->pdev, "mdp");
+
+	DRM_DEBUG("mapped dpu address space @%pK len = 0x%lx\n",
+			dpu_kms->mmio, dpu_kms->mmio_len);
+
+	dpu_dbg_reg_register_base(DPU_DBG_NAME,
+			dpu_kms->mmio, dpu_kms->mmio_len);
 
 	dpu_kms->vbif[VBIF_RT] = msm_ioremap(dpu_kms->pdev, "vbif", "vbif");
 	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 1c0e4c0c9ffb..a478b40868dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -103,6 +103,8 @@ struct dpu_kms {
 	/* io/register spaces: */
 	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
 
+	unsigned long mmio_len;
+
 	struct regulator *vdd;
 	struct regulator *mmagic;
 	struct regulator *venus;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b15b4ce4ba35..efde98a3d9ab 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -63,6 +63,18 @@ struct dp_catalog_private {
 	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
 };
 
+void dp_catalog_register_dbg_base(struct dp_catalog *dp_catalog)
+{
+	char dbg_name[32];
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+			struct dp_catalog_private, dp_catalog);
+
+	snprintf(dbg_name, 32, "dp_ctrl");
+
+	dpu_dbg_reg_register_base(dbg_name, catalog->io->dp_controller.base,
+			catalog->io->dp_controller.len);
+}
+
 static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
 {
 	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 4b7666f1fe6f..af48590913e3 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -9,6 +9,7 @@
 #include <drm/drm_modes.h>
 
 #include "dp_parser.h"
+#include "dpu_dbg.h"
 
 /* interrupts */
 #define DP_INTR_HPD		BIT(0)
@@ -71,6 +72,9 @@ struct dp_catalog {
 	u32 audio_data;
 };
 
+/* Debug module */
+void dp_catalog_register_dbg_base(struct dp_catalog *dp_catalog);
+
 /* AUX APIs */
 u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e175aa3fd3a9..4a5735564be2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -230,6 +230,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	if (rc)
 		DRM_ERROR("Audio registration Dp failed\n");
 
+	dp_catalog_register_dbg_base(dp->catalog);
+
 end:
 	return rc;
 }
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b17ac6c27554..97c04d31f289 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2015, 2020 The Linux Foundation. All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -26,6 +26,8 @@
 #include "sfpb.xml.h"
 #include "dsi_cfg.h"
 #include "msm_kms.h"
+#include "dpu_dbg.h"
+#include "msm_drv.h"
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
@@ -1823,6 +1825,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	struct msm_dsi_host *msm_host = NULL;
 	struct platform_device *pdev = msm_dsi->pdev;
 	int ret;
+	char dbg_name[32];
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
 	if (!msm_host) {
@@ -1912,6 +1915,11 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	msm_dsi->id = msm_host->id;
 
+	snprintf(dbg_name, 32, "dsi%d_ctrl",
+			msm_host->id);
+	dpu_dbg_reg_register_base(dbg_name, msm_host->ctrl_base,
+			msm_iomap_size(pdev, "dsi_ctrl"));
+
 	DBG("Dsi Host %d initialized", msm_host->id);
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f6fb0187388f..df505a3d53e8 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -17,8 +17,8 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_of.h>
 #include <drm/drm_vblank.h>
-#include "dpu_dbg.h"
 
+#include "dpu_dbg.h"
 #include "msm_drv.h"
 #include "msm_debugfs.h"
 #include "msm_fence.h"
@@ -166,6 +166,24 @@ void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
 	return _msm_ioremap(pdev, name, dbgname, true);
 }
 
+unsigned long msm_iomap_size(struct platform_device *pdev, const char *name)
+{
+	struct resource *res;
+
+	if (name)
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	else
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res) {
+		dev_dbg(&pdev->dev, "failed to get memory resource: %s\n",
+				name);
+		return 0;
+	}
+
+	return resource_size(res);
+}
+
 void msm_writel(u32 data, void __iomem *addr)
 {
 	if (reglog)
@@ -535,6 +553,8 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
+	dpu_dbg_register_drm_dev(ddev);
+
 	drm_mode_config_reset(ddev);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
@@ -1282,6 +1302,10 @@ static int msm_pdev_probe(struct platform_device *pdev)
 	int ret;
 
 	if (get_mdp_ver(pdev)) {
+		ret = dpu_dbg_init(&pdev->dev);
+		if (ret)
+			pr_err("dpu_dbg_init failed ret = %d\n", ret);
+
 		ret = add_display_components(&pdev->dev, &match);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b9dd8f8f4887..211161bdce2f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2016-2018, 2020 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -476,6 +476,7 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
 		const char *dbgname);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
 		const char *dbgname);
+unsigned long msm_iomap_size(struct platform_device *pdev, const char *name);
 void msm_writel(u32 data, void __iomem *addr);
 u32 msm_readl(const void __iomem *addr);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
