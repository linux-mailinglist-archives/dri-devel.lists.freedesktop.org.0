Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD04359203
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 04:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B44F6E440;
	Fri,  9 Apr 2021 02:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF466E440
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 02:29:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617935355; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=pbsD/wKMaI68vm174fd2CAWgZFe43VrSk83pSMnRTkk=;
 b=vZ4fNmFZO/RabTOUBEqjUBNno7z4WsFM2+669nzoktHrJ54egjSTI4X3rR9aUKNp0qLC/udv
 ZfZRI4ywHs5/86f2uKYcqVHPhYzawWAKqpis/9aFnLgi7Zhtjzig29bcIrc8WsnJXN7MEgcx
 gQpxD2lHOh7eE4nVsZ9iVZBE1U8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 606fbbe703cfff3452c0c148 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Apr 2021 02:28:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B78AFC4346A; Fri,  9 Apr 2021 02:28:53 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E89E0C433CA;
 Fri,  9 Apr 2021 02:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E89E0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/msm/dpu: add dpu_dbg points across dpu driver
Date: Thu,  8 Apr 2021 19:28:37 -0700
Message-Id: <1617935317-15571-4-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617935317-15571-1-git-send-email-abhinavk@codeaurora.org>
References: <1617935317-15571-1-git-send-email-abhinavk@codeaurora.org>
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
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dpu_dbg points across dpu driver to trigger dumps when critical
errors are hit.

changes in v3:
 - change the callers to also pass the drm device while triggering
   the dump

Change-Id: I351514afe2f1c85232a1562253e5671588075197
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 18 +++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 14 +++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  8 +++++++-
 3 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 288e95e..d89c4e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -26,6 +26,7 @@
 #include "dpu_crtc.h"
 #include "dpu_trace.h"
 #include "dpu_core_irq.h"
+#include "dpu_dbg.h"
 
 #define DPU_DEBUG_ENC(e, fmt, ...) DPU_DEBUG("enc%d " fmt,\
 		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
@@ -1306,6 +1307,13 @@ static void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
 
 	DPU_ATRACE_BEGIN("encoder_underrun_callback");
 	atomic_inc(&phy_enc->underrun_cnt);
+
+	/* trigger dump only on the first underrun */
+	if (atomic_read(&phy_enc->underrun_cnt) == 1) {
+		pr_err("triggering dump\n");
+		DPU_DBG_DUMP(drm_enc->dev, "all");
+	}
+
 	trace_dpu_enc_underrun_cb(DRMID(drm_enc),
 				  atomic_read(&phy_enc->underrun_cnt));
 	DPU_ATRACE_END("encoder_underrun_callback");
@@ -1535,19 +1543,23 @@ static void dpu_encoder_helper_hw_reset(struct dpu_encoder_phys *phys_enc)
 	struct dpu_encoder_virt *dpu_enc;
 	struct dpu_hw_ctl *ctl;
 	int rc;
+	struct drm_encoder *drm_enc;
 
 	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
 	ctl = phys_enc->hw_ctl;
+	drm_enc = phys_enc->parent;
 
 	if (!ctl->ops.reset)
 		return;
 
-	DRM_DEBUG_KMS("id:%u ctl %d reset\n", DRMID(phys_enc->parent),
+	DRM_DEBUG_KMS("id:%u ctl %d reset\n", DRMID(drm_enc),
 		      ctl->idx);
 
 	rc = ctl->ops.reset(ctl);
-	if (rc)
+	if (rc) {
 		DPU_ERROR_ENC(dpu_enc, "ctl %d reset failure\n",  ctl->idx);
+		DPU_DBG_DUMP(drm_enc->dev, "all");
+	}
 
 	phys_enc->enable_state = DPU_ENC_ENABLED;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b2be39b..fd5ddcb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -11,6 +11,7 @@
 #include "dpu_core_irq.h"
 #include "dpu_formats.h"
 #include "dpu_trace.h"
+#include "dpu_dbg.h"
 
 #define DPU_DEBUG_CMDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->base.parent ? \
@@ -191,10 +192,13 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 			to_dpu_encoder_phys_cmd(phys_enc);
 	u32 frame_event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	bool do_log = false;
+	struct drm_encoder *drm_enc;
 
 	if (!phys_enc->hw_pp)
 		return -EINVAL;
 
+	drm_enc = phys_enc->parent;
+
 	cmd_enc->pp_timeout_report_cnt++;
 	if (cmd_enc->pp_timeout_report_cnt == PP_TIMEOUT_MAX_TRIALS) {
 		frame_event |= DPU_ENCODER_FRAME_EVENT_PANEL_DEAD;
@@ -203,7 +207,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 		do_log = true;
 	}
 
-	trace_dpu_enc_phys_cmd_pdone_timeout(DRMID(phys_enc->parent),
+	trace_dpu_enc_phys_cmd_pdone_timeout(DRMID(drm_enc),
 		     phys_enc->hw_pp->idx - PINGPONG_0,
 		     cmd_enc->pp_timeout_report_cnt,
 		     atomic_read(&phys_enc->pending_kickoff_cnt),
@@ -212,12 +216,12 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 	/* to avoid flooding, only log first time, and "dead" time */
 	if (do_log) {
 		DRM_ERROR("id:%d pp:%d kickoff timeout %d cnt %d koff_cnt %d\n",
-			  DRMID(phys_enc->parent),
+			  DRMID(drm_enc),
 			  phys_enc->hw_pp->idx - PINGPONG_0,
 			  phys_enc->hw_ctl->idx - CTL_0,
 			  cmd_enc->pp_timeout_report_cnt,
 			  atomic_read(&phys_enc->pending_kickoff_cnt));
-
+		DPU_DBG_DUMP(drm_enc->dev, "all");
 		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_RDPTR);
 	}
 
@@ -228,7 +232,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 
 	if (phys_enc->parent_ops->handle_frame_done)
 		phys_enc->parent_ops->handle_frame_done(
-				phys_enc->parent, phys_enc, frame_event);
+				drm_enc, phys_enc, frame_event);
 
 	return -ETIMEDOUT;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 9a69fad..4909e65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -9,6 +9,7 @@
 #include "dpu_core_irq.h"
 #include "dpu_formats.h"
 #include "dpu_trace.h"
+#include "dpu_dbg.h"
 
 #define DPU_DEBUG_VIDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->parent ? \
@@ -468,6 +469,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 		"update pending flush ctl %d intf %d\n",
 		ctl->idx - CTL_0, phys_enc->hw_intf->idx);
 
+	atomic_set(&phys_enc->underrun_cnt, 0);
 
 	/* ctl_flush & timing engine enable will be triggered by framework */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED)
@@ -537,6 +539,9 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 {
 	struct dpu_hw_ctl *ctl;
 	int rc;
+	struct drm_encoder *drm_enc;
+
+	drm_enc = phys_enc->parent;
 
 	ctl = phys_enc->hw_ctl;
 	if (!ctl->ops.wait_reset_status)
@@ -550,6 +555,7 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 	if (rc) {
 		DPU_ERROR_VIDENC(phys_enc, "ctl %d reset failure: %d\n",
 				ctl->idx, rc);
+		DPU_DBG_DUMP(drm_enc->dev, "all");
 		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_VSYNC);
 	}
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
