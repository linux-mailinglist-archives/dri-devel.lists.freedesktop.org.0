Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA4F3ABED6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 00:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4666E837;
	Thu, 17 Jun 2021 22:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A506E82B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 22:20:39 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a21so6228375ljj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 15:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SP95ENNSJ0T1qPKBiND0oDOVFlkreVKoLn/bWr5pi2Q=;
 b=OpLMks7z6GTOob/tlT54mHsaw6w3MRt9mFVgbmmdUdKqqiDlUBugxLjgzxsZPza6TS
 Iy7gueNwPwm2hz0oDYQMHkr4n7CDU7Khbze21VAuGYpvvMzvJbumVTB8rEzKn2FGZP8l
 V7R9h7dH8ve3A1FwJb9/OwuznowlVtWXVQqMBjmq6LpB0kCcFF++b1L116T5LCcWOCtB
 ShwyXpRaPWCmTzw92/ERmgtNazYZYbpopnGzfC+yqfs28AE51h0okCmBrJLaqSEDS/xE
 MWcYEaKszTX32UCbMzbSd21ve3Alky63Jl38fau9jP+eM0z1+Sp7/UxS/dSwjhLbFA2a
 mE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SP95ENNSJ0T1qPKBiND0oDOVFlkreVKoLn/bWr5pi2Q=;
 b=R1ivlc1eWN97TTXUgJZNCKq2e98AOjUJifDXuyrkrUwgWV0Uvd+Hm1etqoDbfb8MGK
 a9kVz9Qik24HmGT4MJsEYEBdR1q9fquZbnyERRDyj9J1NxsHbp+2u2tAnlqVKHvM+/BB
 qaoBRkPFOICGDZu1t8CqGluk4aR02BY0u1a5vOp4rLMU3q766RfE6JRlKhfhoe67pCCf
 lXDV87SnWG9oI96X96qXGNvYsuFu+d387xim2mqyT0LEo+uCnhiY1cRUMtxB690Kimta
 AbXHufXuYBNccHjar42W78+jQdfCTYzWHV8CNwAevOhJTIJuOBGQ/q4N0XRT+qgOn/WH
 hchw==
X-Gm-Message-State: AOAM533ehOz4XdHXiTWufIxfvDNxMMaFu0u5xsomcrecUrx70OLJ4zB5
 puw/v/KakXMROExOstZpVtFXGQ==
X-Google-Smtp-Source: ABdhPJzv0tX4qBIBW/RjNFXwHImOExIDLrE4UlZXzU+RuGKXkWzIhcWamzJgt5xmd1qRckxvTw5wrg==
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr6579129ljg.319.1623968438191; 
 Thu, 17 Jun 2021 15:20:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a5sm895594ljq.0.2021.06.17.15.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 15:20:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 7/7] drm/msm/dpu: remove struct dpu_encoder_irq and enum
 dpu_intr_idx
Date: Fri, 18 Jun 2021 01:20:29 +0300
Message-Id: <20210617222029.463045-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the wrapping structures and the enum used to index those structures
in dpu_kms. Instead of them use IRQ indices and callback functions
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 47 +++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 48 +++-------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 94 +++++++------------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 53 ++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 12 +--
 5 files changed, 92 insertions(+), 162 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3d8864df8605..55ae3ede5846 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -241,11 +241,11 @@ static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bp
 }
 
 void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
-		enum dpu_intr_idx intr_idx)
+		int irq_idx)
 {
 	DRM_ERROR("irq timeout id=%u, intf=%d, pp=%d, intr=%d\n",
 		  DRMID(phys_enc->parent), phys_enc->intf_idx - INTF_0,
-		  phys_enc->hw_pp->idx - PINGPONG_0, intr_idx);
+		  phys_enc->hw_pp->idx - PINGPONG_0, irq_idx);
 
 	if (phys_enc->parent_ops->handle_frame_done)
 		phys_enc->parent_ops->handle_frame_done(
@@ -257,75 +257,70 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 		u32 irq_idx, struct dpu_encoder_wait_info *info);
 
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
-		enum dpu_intr_idx intr_idx,
+		int irq_idx, void (*irq_cb)(void *, int),
 		struct dpu_encoder_wait_info *wait_info)
 {
-	struct dpu_encoder_irq *irq;
 	u32 irq_status;
 	int ret;
 
-	if (!wait_info || intr_idx >= INTR_IDX_MAX) {
+	if (!wait_info || irq_idx < 0) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
-	irq = &phys_enc->irq[intr_idx];
 
 	/* note: do master / slave checking outside */
 
 	/* return EWOULDBLOCK since we know the wait isn't necessary */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
-		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d",
-			  DRMID(phys_enc->parent), intr_idx,
-			  irq->irq_idx);
+		DRM_ERROR("encoder is disabled id=%u, irq=%d",
+			  DRMID(phys_enc->parent), irq_idx);
 		return -EWOULDBLOCK;
 	}
 
-	if (irq->irq_idx < 0) {
-		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s",
-			      DRMID(phys_enc->parent), intr_idx,
-			      irq->name);
+	if (irq_idx < 0) {
+		DRM_DEBUG_KMS("skip irq wait id=%u", DRMID(phys_enc->parent));
 		return 0;
 	}
 
-	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d",
-		      DRMID(phys_enc->parent), intr_idx,
-		      irq->irq_idx, phys_enc->hw_pp->idx - PINGPONG_0,
+	DRM_DEBUG_KMS("id=%u, irq=%d, pp=%d, pending_cnt=%d",
+		      DRMID(phys_enc->parent),
+		      irq_idx, phys_enc->hw_pp->idx - PINGPONG_0,
 		      atomic_read(wait_info->atomic_cnt));
 
 	ret = dpu_encoder_helper_wait_event_timeout(
 			DRMID(phys_enc->parent),
-			irq->irq_idx,
+			irq_idx,
 			wait_info);
 
 	if (ret <= 0) {
 		irq_status = dpu_core_irq_read(phys_enc->dpu_kms,
-				irq->irq_idx, true);
+				irq_idx, true);
 		if (irq_status) {
 			unsigned long flags;
 
-			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, "
+			DRM_DEBUG_KMS("irq not triggered id=%u, "
 				      "irq=%d, pp=%d, atomic_cnt=%d",
-				      DRMID(phys_enc->parent), intr_idx,
-				      irq->irq_idx,
+				      DRMID(phys_enc->parent),
+				      irq_idx,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 			local_irq_save(flags);
-			irq->func(phys_enc, irq->irq_idx);
+			irq_cb(phys_enc, irq_idx);
 			local_irq_restore(flags);
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, "
+			DRM_DEBUG_KMS("irq timeout id=%u, "
 				      "irq=%d, pp=%d, atomic_cnt=%d",
-				      DRMID(phys_enc->parent), intr_idx,
-				      irq->irq_idx,
+				      DRMID(phys_enc->parent),
+				      irq_idx,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
 		}
 	} else {
 		ret = 0;
 		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
-			intr_idx, irq->irq_idx,
+			irq_idx,
 			phys_enc->hw_pp->idx - PINGPONG_0,
 			atomic_read(wait_info->atomic_cnt));
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index ff2218155b44..983a92d152cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -146,37 +146,6 @@ struct dpu_encoder_phys_ops {
 	int (*get_frame_count)(struct dpu_encoder_phys *phys);
 };
 
-/**
- * enum dpu_intr_idx - dpu encoder interrupt index
- * @INTR_IDX_VSYNC:    Vsync interrupt for video mode panel
- * @INTR_IDX_PINGPONG: Pingpong done unterrupt for cmd mode panel
- * @INTR_IDX_UNDERRUN: Underrun unterrupt for video and cmd mode panel
- * @INTR_IDX_RDPTR:    Readpointer done unterrupt for cmd mode panel
- */
-enum dpu_intr_idx {
-	INTR_IDX_VSYNC,
-	INTR_IDX_PINGPONG,
-	INTR_IDX_UNDERRUN,
-	INTR_IDX_CTL_START,
-	INTR_IDX_RDPTR,
-	INTR_IDX_MAX,
-};
-
-/**
- * dpu_encoder_irq - tracking structure for interrupts
- * @name:		string name of interrupt
- * @intr_idx:		Encoder interrupt enumeration
- * @irq_idx:		IRQ interface lookup index from DPU IRQ framework
- *			will be -EINVAL if IRQ is not registered
- * @irq_cb:		interrupt callback
- */
-struct dpu_encoder_irq {
-	const char *name;
-	enum dpu_intr_idx intr_idx;
-	int irq_idx;
-	void (*func)(void *arg, int irq_idx);
-};
-
 /**
  * struct dpu_encoder_phys - physical encoder that drives a single INTF block
  *	tied to a specific panel / sub-panel. Abstract type, sub-classed by
@@ -231,7 +200,13 @@ struct dpu_encoder_phys {
 	atomic_t pending_ctlstart_cnt;
 	atomic_t pending_kickoff_cnt;
 	wait_queue_head_t pending_kickoff_wq;
-	struct dpu_encoder_irq irq[INTR_IDX_MAX];
+
+	int intf_underrun_irq;
+	int vblank_irq;
+
+	/* for CMD only */
+	int ctl_start_irq;
+	int pp_done_irq;
 };
 
 static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
@@ -347,21 +322,22 @@ void dpu_encoder_helper_split_config(
  * dpu_encoder_helper_report_irq_timeout - utility to report error that irq has
  *	timed out, including reporting frame error event to crtc and debug dump
  * @phys_enc: Pointer to physical encoder structure
- * @intr_idx: Failing interrupt index
+ * @irq_idx: Failing interrupt index
  */
 void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
-		enum dpu_intr_idx intr_idx);
+		int irq_idx);
 
 /**
  * dpu_encoder_helper_wait_for_irq - utility to wait on an irq.
  *	note: will call dpu_encoder_helper_wait_for_irq on timeout
  * @phys_enc: Pointer to physical encoder structure
- * @intr_idx: encoder interrupt index
+ * @irq_idx: encoder interrupt index
+ * @irq_cb: encoder interrupt callback
  * @wait_info: wait info struct
  * @Return: 0 or -ERROR
  */
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
-		enum dpu_intr_idx intr_idx,
+		int irq_idx, void (*irq_cb)(void *, int),
 		struct dpu_encoder_wait_info *wait_info);
 
 #endif /* __dpu_encoder_phys_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 4bfeac821f51..122364a4ef54 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -151,7 +151,6 @@ static void dpu_encoder_phys_cmd_mode_set(
 {
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
-	struct dpu_encoder_irq *irq;
 
 	if (!mode || !adj_mode) {
 		DPU_ERROR("invalid args\n");
@@ -161,17 +160,10 @@ static void dpu_encoder_phys_cmd_mode_set(
 	DPU_DEBUG_CMDENC(cmd_enc, "caching mode:\n");
 	drm_mode_debug_printmodeline(adj_mode);
 
-	irq = &phys_enc->irq[INTR_IDX_CTL_START];
-	irq->irq_idx = phys_enc->hw_ctl->caps->intr_start;
-
-	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
-	irq->irq_idx = phys_enc->hw_pp->caps->intr_done;
-
-	irq = &phys_enc->irq[INTR_IDX_RDPTR];
-	irq->irq_idx = phys_enc->hw_pp->caps->intr_rdptr;
-
-	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
-	irq->irq_idx = phys_enc->hw_intf->cap->intr_underrun;
+	phys_enc->ctl_start_irq = phys_enc->hw_ctl->caps->intr_start;
+	phys_enc->pp_done_irq = phys_enc->hw_pp->caps->intr_done;
+	phys_enc->vblank_irq = phys_enc->hw_pp->caps->intr_rdptr;
+	phys_enc->intf_underrun_irq = phys_enc->hw_intf->cap->intr_underrun;
 }
 
 static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
@@ -212,8 +204,8 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 			  atomic_read(&phys_enc->pending_kickoff_cnt));
 		msm_disp_snapshot_state(drm_enc->dev);
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
-				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
+				phys_enc->vblank_irq,
+				dpu_encoder_phys_cmd_pp_rd_ptr_irq, phys_enc);
 	}
 
 	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
@@ -240,7 +232,9 @@ static int _dpu_encoder_phys_cmd_wait_for_idle(
 	wait_info.atomic_cnt = &phys_enc->pending_kickoff_cnt;
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
 
-	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_PINGPONG,
+	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
+			phys_enc->pp_done_irq,
+			dpu_encoder_phys_cmd_pp_tx_done_irq,
 			&wait_info);
 	if (ret == -ETIMEDOUT)
 		_dpu_encoder_phys_cmd_handle_ppdone_timeout(phys_enc);
@@ -280,12 +274,12 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 
 	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
 		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
-				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
+				phys_enc->vblank_irq,
+				dpu_encoder_phys_cmd_pp_rd_ptr_irq, phys_enc);
 	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
 		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
-				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
+				phys_enc->vblank_irq,
+				dpu_encoder_phys_cmd_pp_rd_ptr_irq, phys_enc);
 
 end:
 	if (ret) {
@@ -307,30 +301,30 @@ static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
 
 	if (enable) {
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx,
-				phys_enc->irq[INTR_IDX_PINGPONG].func, phys_enc);
+				phys_enc->pp_done_irq,
+				dpu_encoder_phys_cmd_pp_tx_done_irq, phys_enc);
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
-				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
+				phys_enc->intf_underrun_irq,
+				dpu_encoder_phys_cmd_underrun_irq, phys_enc);
 		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
 
 		if (dpu_encoder_phys_cmd_is_master(phys_enc))
 			dpu_core_irq_register_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START].irq_idx,
-					phys_enc->irq[INTR_IDX_CTL_START].func, phys_enc);
+					phys_enc->ctl_start_irq,
+					dpu_encoder_phys_cmd_ctl_start_irq, phys_enc);
 	} else {
 		if (dpu_encoder_phys_cmd_is_master(phys_enc))
 			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START].irq_idx,
-					phys_enc->irq[INTR_IDX_CTL_START].func, phys_enc);
+					phys_enc->ctl_start_irq,
+					dpu_encoder_phys_cmd_ctl_start_irq, phys_enc);
 
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
-				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
+				phys_enc->intf_underrun_irq,
+				dpu_encoder_phys_cmd_underrun_irq, phys_enc);
 		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx,
-				phys_enc->irq[INTR_IDX_PINGPONG].func, phys_enc);
+				phys_enc->pp_done_irq,
+				dpu_encoder_phys_cmd_pp_tx_done_irq, phys_enc);
 	}
 }
 
@@ -664,7 +658,9 @@ static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
 	wait_info.atomic_cnt = &phys_enc->pending_ctlstart_cnt;
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
 
-	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_CTL_START,
+	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
+			phys_enc->ctl_start_irq,
+			dpu_encoder_phys_cmd_ctl_start_irq,
 			&wait_info);
 	if (ret == -ETIMEDOUT) {
 		DPU_ERROR_CMDENC(cmd_enc, "ctl start interrupt wait failed\n");
@@ -719,7 +715,9 @@ static int dpu_encoder_phys_cmd_wait_for_vblank(
 
 	atomic_inc(&cmd_enc->pending_vblank_cnt);
 
-	rc = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_RDPTR,
+	rc = dpu_encoder_helper_wait_for_irq(phys_enc,
+			phys_enc->vblank_irq,
+			dpu_encoder_phys_cmd_pp_rd_ptr_irq,
 			&wait_info);
 
 	return rc;
@@ -771,8 +769,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
-	struct dpu_encoder_irq *irq;
-	int i, ret = 0;
+	int ret = 0;
 
 	DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
 
@@ -795,30 +792,11 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->enc_spinlock = p->enc_spinlock;
 	cmd_enc->stream_sel = 0;
 	phys_enc->enable_state = DPU_ENC_DISABLED;
-	for (i = 0; i < INTR_IDX_MAX; i++) {
-		irq = &phys_enc->irq[i];
-		irq->irq_idx = -EINVAL;
-	}
 
-	irq = &phys_enc->irq[INTR_IDX_CTL_START];
-	irq->name = "ctl_start";
-	irq->intr_idx = INTR_IDX_CTL_START;
-	irq->func = dpu_encoder_phys_cmd_ctl_start_irq;
-
-	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
-	irq->name = "pp_done";
-	irq->intr_idx = INTR_IDX_PINGPONG;
-	irq->func = dpu_encoder_phys_cmd_pp_tx_done_irq;
-
-	irq = &phys_enc->irq[INTR_IDX_RDPTR];
-	irq->name = "pp_rd_ptr";
-	irq->intr_idx = INTR_IDX_RDPTR;
-	irq->func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
-
-	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
-	irq->name = "underrun";
-	irq->intr_idx = INTR_IDX_UNDERRUN;
-	irq->func = dpu_encoder_phys_cmd_underrun_irq;
+	phys_enc->ctl_start_irq = -EINVAL;
+	phys_enc->pp_done_irq = -EINVAL;
+	phys_enc->vblank_irq = -EINVAL;
+	phys_enc->intf_underrun_irq = -EINVAL;
 
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 7f605287a377..19f728e63d7d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -366,19 +366,14 @@ static void dpu_encoder_phys_vid_mode_set(
 		struct drm_display_mode *mode,
 		struct drm_display_mode *adj_mode)
 {
-	struct dpu_encoder_irq *irq;
-
 	if (adj_mode) {
 		phys_enc->cached_mode = *adj_mode;
 		drm_mode_debug_printmodeline(adj_mode);
 		DPU_DEBUG_VIDENC(phys_enc, "caching mode:\n");
 	}
 
-	irq = &phys_enc->irq[INTR_IDX_VSYNC];
-	irq->irq_idx = phys_enc->hw_intf->cap->intr_vsync;
-
-	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
-	irq->irq_idx = phys_enc->hw_intf->cap->intr_underrun;
+	phys_enc->vblank_irq = phys_enc->hw_intf->cap->intr_vsync;
+	phys_enc->intf_underrun_irq = phys_enc->hw_intf->cap->intr_underrun;
 }
 
 static int dpu_encoder_phys_vid_control_vblank_irq(
@@ -405,12 +400,12 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 
 	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
 		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
-				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
+				phys_enc->vblank_irq,
+				dpu_encoder_phys_vid_vblank_irq, phys_enc);
 	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
 		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
-				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
+				phys_enc->vblank_irq,
+				dpu_encoder_phys_vid_vblank_irq, phys_enc);
 
 end:
 	if (ret) {
@@ -490,11 +485,13 @@ static int dpu_encoder_phys_vid_wait_for_vblank(
 	}
 
 	/* Wait for kickoff to complete */
-	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_VSYNC,
+	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
+			phys_enc->vblank_irq,
+			dpu_encoder_phys_vid_vblank_irq,
 			&wait_info);
 
 	if (ret == -ETIMEDOUT) {
-		dpu_encoder_helper_report_irq_timeout(phys_enc, INTR_IDX_VSYNC);
+		dpu_encoder_helper_report_irq_timeout(phys_enc, phys_enc->vblank_irq);
 	}
 
 	return ret;
@@ -543,8 +540,8 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 				ctl->idx, rc);
 		msm_disp_snapshot_state(drm_enc->dev);
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
-				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
+				phys_enc->vblank_irq,
+				dpu_encoder_phys_vid_vblank_irq, phys_enc);
 	}
 }
 
@@ -634,13 +631,13 @@ static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
 			return;
 
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
-				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
+				phys_enc->intf_underrun_irq,
+				dpu_encoder_phys_vid_underrun_irq, phys_enc);
 	} else {
 		dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
-				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
+				phys_enc->intf_underrun_irq,
+				dpu_encoder_phys_vid_underrun_irq, phys_enc);
 	}
 }
 
@@ -706,8 +703,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
-	struct dpu_encoder_irq *irq;
-	int i, ret = 0;
+	int ret = 0;
 
 	if (!p) {
 		ret = -EINVAL;
@@ -732,20 +728,9 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
 	phys_enc->enc_spinlock = p->enc_spinlock;
-	for (i = 0; i < INTR_IDX_MAX; i++) {
-		irq = &phys_enc->irq[i];
-		irq->irq_idx = -EINVAL;
-	}
-
-	irq = &phys_enc->irq[INTR_IDX_VSYNC];
-	irq->name = "vsync_irq";
-	irq->intr_idx = INTR_IDX_VSYNC;
-	irq->func = dpu_encoder_phys_vid_vblank_irq;
 
-	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
-	irq->name = "underrun";
-	irq->intr_idx = INTR_IDX_UNDERRUN;
-	irq->func = dpu_encoder_phys_vid_underrun_irq;
+	phys_enc->vblank_irq = -EINVAL;
+	phys_enc->intf_underrun_irq = -EINVAL;
 
 	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 58b7b8654543..648124e8ea2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -188,26 +188,22 @@ DEFINE_EVENT(dpu_irq_template, dpu_irq_unregister_success,
 );
 
 TRACE_EVENT(dpu_enc_irq_wait_success,
-	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
-		 int irq_idx, enum dpu_pingpong pp_idx, int atomic_cnt),
-	TP_ARGS(drm_id, intr_idx, irq_idx, pp_idx, atomic_cnt),
+	TP_PROTO(uint32_t drm_id, int irq_idx, enum dpu_pingpong pp_idx, int atomic_cnt),
+	TP_ARGS(drm_id, irq_idx, pp_idx, atomic_cnt),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		drm_id		)
-		__field(	enum dpu_intr_idx,	intr_idx	)
 		__field(	int,			irq_idx		)
 		__field(	enum dpu_pingpong,	pp_idx		)
 		__field(	int,			atomic_cnt	)
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
-		__entry->intr_idx = intr_idx;
 		__entry->irq_idx = irq_idx;
 		__entry->pp_idx = pp_idx;
 		__entry->atomic_cnt = atomic_cnt;
 	),
-	TP_printk("id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d",
-		  __entry->drm_id, __entry->intr_idx,
-		  __entry->irq_idx, __entry->pp_idx, __entry->atomic_cnt)
+	TP_printk("id=%u, irq=%d, pp=%d, atomic_cnt=%d",
+		  __entry->drm_id, __entry->irq_idx, __entry->pp_idx, __entry->atomic_cnt)
 );
 
 DECLARE_EVENT_CLASS(dpu_drm_obj_template,
-- 
2.30.2

