Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4340F9B9DF6
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 09:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6F910E203;
	Sat,  2 Nov 2024 08:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q8vTJZYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D35210E178
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 08:46:15 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539f72c913aso4434909e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730537173; x=1731141973; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jj7DIdpj0UQY/0Ej6PodqWbcYeQJUEcVHFngKQua6EY=;
 b=Q8vTJZYzyVOkRnpSq3hjnVZB5bG9q92c3iAshkImzPbSwQBIIbPh+zN/uLeDG8iIQv
 FKWMkRnzLybGfUQ6DF4wl1c0zhU8LlQWaf124u0vmE831NOiwzVi/ZwKaQrA/czlSrLM
 4NZmHgjrv+bynwvHlmWiBJJx6vYAPDwFUE6/Zaphl6sPRlSojBinevDFPXtfLw3Xs3sl
 mj4ib+B1zCiPyn/u9NBNnzMAa4J1zMrcVkNVjtPtE00A464EqSksNqZSgUoGaOniYfs2
 GmL/d/cERSx8fJ0ENRO9BGmjYPQs7xuLLGkTpBdL/e8biCBRnvqFmIAasuR3G9aL1SYi
 /jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730537173; x=1731141973;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jj7DIdpj0UQY/0Ej6PodqWbcYeQJUEcVHFngKQua6EY=;
 b=JGzD66r3BnyHQbmlLEJegyYd6bK4d1/xegpLI1qjscmtNh10cZoJgJpIyaOwi9Pmie
 jBsXtI5k4GxDwu3BqfDrSrDkqWYjMgseifA0N64XeGi/2XYEOjhZjQi2aQ44vPoNXcGB
 eKuwmH6wzTQNqFqwq1bPNn47ZLY9tK7BSAPDTYhO+eu95ozDGnqiQnMyHmkU37ouIQsj
 f/I+OWB1iHHAl0lqJF0M9evE59refqmaVZ9ZEFbJTEH45XoZjq8uVdrUy4BCsVS8FkY9
 NT9/wyZ1obvHV+gizg3pOKwHQ9tCJi/uFclPpEuYgmfhIhhOZeQ6JoExiwW2cyemN3Qb
 JbJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+aKQ8CKBIbxUrT+VkRgL24VXJsCFhK76hndNjrIu0fG/Krh6INlSvwoC+NhLGlOxbLKjQv+YBXUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoGGrRXZWxDKoXcdvnkng/CedD89BwgwANk+xMIIz5HaqVe/Jg
 iRiw73Xv8igc7LlqzQlhBK/QwHhuV1hUB4yP2KDEBh3HwwvCoy/x4TBMstYzNGk=
X-Google-Smtp-Source: AGHT+IETaKs41kif3OMnxDedn8NlHGxaOTEG1zo0pokOgGGgHJo0AerpyIj5aXacAR2xQ+yO18FCYw==
X-Received: by 2002:a05:6512:39cc:b0:539:fa43:fc36 with SMTP id
 2adb3069b0e04-53b348c396cmr13565318e87.12.1730537172525; 
 Sat, 02 Nov 2024 01:46:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc957e9sm816167e87.53.2024.11.02.01.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 01:46:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 02 Nov 2024 10:46:09 +0200
Subject: [PATCH] drm/msm/dpu: rework documentation comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241102-dpu-docs-rework-v1-1-d735853fd6db@linaro.org>
X-B4-Tracking: v=1; b=H4sIANDmJWcC/x3MTQqAIBBA4avErBtQE4KuEi1SpxoCjZF+QLp70
 vJbvFcgkzBlGJoCQhdnTrFCtw34bY4rIYdqMMpYrZXBcJwYks8odCfZ0Qbj58WpvnMOanUILfz
 8x3F63w/DCvS2YQAAAA==
X-Change-ID: 20241102-dpu-docs-rework-4d2cafb073bb
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=89313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jZ0Nofp0/ZtXLiafeXzA1zEi0JHXIWZxvWw7FngCS58=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJebS8m7L3w4gGNQ0TzavyZksyTmqwY7miqCLZ
 ZJxNAjV1CWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyXm0gAKCRCLPIo+Aiko
 1WcmCACVME6uBHr4metrZ4SOKMQd13bZdh14NwSNm7PNcsiRnqvdkFo+ndGvs7S5P7WNjGkC0Bn
 y+sUMb3t2N/lYL/vKcWwotC3i219kfN6QauZ6XIDVx40HMrr4pc7jdV8GTk63UhkwLjgS19KFlM
 xpq2x3jFrcGHGvptKEgtWR6G8fcLSSV0JjKUFu8RaUIjm8rsD/0vI6bgHpDKDpv0UVIcJwS7xbI
 gqWy/JA0YRjxQjKDyHKiJWc1ibILFixO5iLdUBJvNMnXAaoZ675D2cC42mQLTrChckxm+dJUQxK
 Am+NUlM+ifkavPWIn+cgiNekl6yFCJskKdL35mo+rz8CljOV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unfortunately the tooling doesn't check documents placed before funciton
prototypes. Such comments frequently become outdated, miss several
params, etc. Move documentation for the functions to be placed before
the actual function body, allowing 'make W=1' to actually check these
comments and report an error.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
The documentation can further be improved, but let's move the comments
now, close to the end of the development window, reducing the risk of
the possible conflicts.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |  46 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  23 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |  27 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  31 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |  38 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 179 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 105 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  90 -----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   6 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c         |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   9 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   9 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  14 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  52 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   9 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   9 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   9 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   9 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   8 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  22 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  34 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  26 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  46 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  38 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |  13 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |  18 ---
 47 files changed, 502 insertions(+), 543 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index 7c286bafb948d1b797d1837074f27549f8f3dd06..e7183cf057768f7a2c892b1e9c88d8996421049f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -8,72 +8,26 @@
 #include "dpu_kms.h"
 #include "dpu_hw_interrupts.h"
 
-/**
- * dpu_core_irq_preinstall - perform pre-installation of core IRQ handler
- * @kms:		MSM KMS handle
- * @return:		none
- */
 void dpu_core_irq_preinstall(struct msm_kms *kms);
 
-/**
- * dpu_core_irq_uninstall - uninstall core IRQ handler
- * @kms:		MSM KMS handle
- * @return:		none
- */
 void dpu_core_irq_uninstall(struct msm_kms *kms);
 
-/**
- * dpu_core_irq - core IRQ handler
- * @kms:		MSM KMS handle
- * @return:		interrupt handling status
- */
 irqreturn_t dpu_core_irq(struct msm_kms *kms);
 
-/**
- * dpu_core_irq_read - IRQ helper function for reading IRQ status
- * @dpu_kms:		DPU handle
- * @irq_idx:		irq index
- * @return:		non-zero if irq detected; otherwise no irq detected
- */
 u32 dpu_core_irq_read(
 		struct dpu_kms *dpu_kms,
 		unsigned int irq_idx);
 
-/**
- * dpu_core_irq_register_callback - For registering callback function on IRQ
- *                             interrupt
- * @dpu_kms:		DPU handle
- * @irq_idx:		irq index
- * @irq_cb:		IRQ callback funcion.
- * @irq_arg:		IRQ callback argument.
- * @return:		0 for success registering callback, otherwise failure
- *
- * This function supports registration of multiple callbacks for each interrupt.
- */
 int dpu_core_irq_register_callback(
 		struct dpu_kms *dpu_kms,
 		unsigned int irq_idx,
 		void (*irq_cb)(void *arg),
 		void *irq_arg);
 
-/**
- * dpu_core_irq_unregister_callback - For unregistering callback function on IRQ
- *                             interrupt
- * @dpu_kms:		DPU handle
- * @irq_idx:		irq index
- * @return:		0 for success registering callback, otherwise failure
- *
- * This function supports registration of multiple callbacks for each interrupt.
- */
 int dpu_core_irq_unregister_callback(
 		struct dpu_kms *dpu_kms,
 		unsigned int irq_idx);
 
-/**
- * dpu_debugfs_core_irq_init - register core irq debugfs
- * @dpu_kms: pointer to kms
- * @parent: debugfs directory root
- */
 void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 		struct dentry *parent);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 260accc151d4b49383eb6fcaa3ca6616ca283991..6f0a37f954fe8797a4e3a34e7876a93d5e477642 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -140,6 +140,12 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 			perf->max_per_pipe_ib, perf->bw_ctl);
 }
 
+/**
+ * dpu_core_perf_crtc_check - validate performance of the given crtc state
+ * @crtc: Pointer to crtc
+ * @state: Pointer to new crtc state
+ * return: zero if success, or error code otherwise
+ */
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
@@ -301,6 +307,12 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 	return clk_rate;
 }
 
+/**
+ * dpu_core_perf_crtc_update - update performance of the given crtc
+ * @crtc: Pointer to crtc
+ * @params_changed: true if crtc parameters are modified
+ * return: zero if success, or error code otherwise
+ */
 int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 			      int params_changed)
 {
@@ -446,6 +458,11 @@ static const struct file_operations dpu_core_perf_mode_fops = {
 	.write = _dpu_core_perf_mode_write,
 };
 
+/**
+ * dpu_core_perf_debugfs_init - initialize debugfs for core performance context
+ * @dpu_kms: Pointer to the dpu_kms struct
+ * @parent: Pointer to parent debugfs
+ */
 int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 {
 	struct dpu_core_perf *perf = &dpu_kms->perf;
@@ -482,6 +499,12 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 }
 #endif
 
+/**
+ * dpu_core_perf_init - initialize the given core performance context
+ * @perf: Pointer to core performance context
+ * @perf_cfg: Pointer to platform performance configuration
+ * @max_core_clk_rate: Maximum core clock rate
+ */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		const struct dpu_perf_cfg *perf_cfg,
 		unsigned long max_core_clk_rate)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 4186977390bd8c79cc9ed9cf730615c6c16f3a45..451bf8021114d9d4a2dfdbb81ed4150fc559c681 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -54,47 +54,20 @@ struct dpu_core_perf {
 	u64 fix_core_ab_vote;
 };
 
-/**
- * dpu_core_perf_crtc_check - validate performance of the given crtc state
- * @crtc: Pointer to crtc
- * @state: Pointer to new crtc state
- * return: zero if success, or error code otherwise
- */
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		struct drm_crtc_state *state);
 
-/**
- * dpu_core_perf_crtc_update - update performance of the given crtc
- * @crtc: Pointer to crtc
- * @params_changed: true if crtc parameters are modified
- * return: zero if success, or error code otherwise
- */
 int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 			      int params_changed);
 
-/**
- * dpu_core_perf_crtc_release_bw - release bandwidth of the given crtc
- * @crtc: Pointer to crtc
- */
 void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
 
-/**
- * dpu_core_perf_init - initialize the given core performance context
- * @perf: Pointer to core performance context
- * @perf_cfg: Pointer to platform performance configuration
- * @max_core_clk_rate: Maximum core clock rate
- */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		const struct dpu_perf_cfg *perf_cfg,
 		unsigned long max_core_clk_rate);
 
 struct dpu_kms;
 
-/**
- * dpu_core_perf_debugfs_init - initialize debugfs for core performance context
- * @dpu_kms: Pointer to the dpu_kms struct
- * @debugfs_parent: Pointer to parent debugfs
- */
 int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent);
 
 #endif /* _DPU_CORE_PERF_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 58595dcc38891875b02bb732fb548d3a2694c69e..9f6ffd344693ecfb633095772a31ada5613345dc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -572,6 +572,10 @@ static void _dpu_crtc_complete_flip(struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
+/**
+ * dpu_crtc_get_intf_mode - get interface mode of the given crtc
+ * @crtc: Pointert to crtc
+ */
 enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
@@ -594,6 +598,10 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
 	return INTF_MODE_NONE;
 }
 
+/**
+ * dpu_crtc_vblank_callback - called on vblank irq, issues completion events
+ * @crtc: Pointer to drm crtc object
+ */
 void dpu_crtc_vblank_callback(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
@@ -704,6 +712,10 @@ void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
 	kthread_queue_work(priv->event_thread[crtc_id].worker, &fevent->work);
 }
 
+/**
+ * dpu_crtc_complete_commit - callback signalling completion of current commit
+ * @crtc: Pointer to drm crtc object
+ */
 void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 {
 	trace_dpu_crtc_complete_commit(DRMID(crtc));
@@ -934,6 +946,10 @@ static int _dpu_crtc_wait_for_frame_done(struct drm_crtc *crtc)
 	return rc;
 }
 
+/**
+ * dpu_crtc_commit_kickoff - trigger kickoff of the commit for this crtc
+ * @crtc: Pointer to drm crtc object
+ */
 void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
@@ -1243,6 +1259,11 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 				      4096);
 }
 
+/**
+ * dpu_crtc_vblank - enable or disable vblanks for this crtc
+ * @crtc: Pointer to drm crtc object
+ * @en: true to enable vblanks, false to disable
+ */
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
@@ -1462,7 +1483,15 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
-/* initialize crtc */
+/**
+ * dpu_crtc_init - create a new crtc object
+ * @dev: dpu device
+ * @plane: base plane
+ * @cursor: cursor plane
+ * @return: new crtc object or error
+ *
+ * initialize CRTC
+ */
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 				struct drm_plane *cursor)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index febc3e764a6323cee26058e79b8cb99a9583a8e5..0b148f3ce0d7af80ec4ffcd31d8632a5815b16f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -239,55 +239,17 @@ static inline int dpu_crtc_frame_pending(struct drm_crtc *crtc)
 	return crtc ? atomic_read(&to_dpu_crtc(crtc)->frame_pending) : -EINVAL;
 }
 
-/**
- * dpu_crtc_vblank - enable or disable vblanks for this crtc
- * @crtc: Pointer to drm crtc object
- * @en: true to enable vblanks, false to disable
- */
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en);
 
-/**
- * dpu_crtc_vblank_callback - called on vblank irq, issues completion events
- * @crtc: Pointer to drm crtc object
- */
 void dpu_crtc_vblank_callback(struct drm_crtc *crtc);
 
-/**
- * dpu_crtc_commit_kickoff - trigger kickoff of the commit for this crtc
- * @crtc: Pointer to drm crtc object
- */
 void dpu_crtc_commit_kickoff(struct drm_crtc *crtc);
 
-/**
- * dpu_crtc_complete_commit - callback signalling completion of current commit
- * @crtc: Pointer to drm crtc object
- */
 void dpu_crtc_complete_commit(struct drm_crtc *crtc);
 
-/**
- * dpu_crtc_init - create a new crtc object
- * @dev: dpu device
- * @plane: base plane
- * @cursor: cursor plane
- * @Return: new crtc object or error
- */
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 			       struct drm_plane *cursor);
 
-/**
- * dpu_crtc_register_custom_event - api for enabling/disabling crtc event
- * @kms: Pointer to dpu_kms
- * @crtc_drm: Pointer to crtc object
- * @event: Event that client is interested
- * @en: Flag to enable/disable the event
- */
-int dpu_crtc_register_custom_event(struct dpu_kms *kms,
-		struct drm_crtc *crtc_drm, u32 event, bool en);
-
-/**
- * dpu_crtc_get_intf_mode - get interface mode of the given crtc
- * @crtc: Pointert to crtc
- */
 enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index bd3698bf0cf7403235da8315d53a4dbe077f5779..83de7564e2c1fe14fcf8c4f82335cafc937e1b99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -217,6 +217,10 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+/**
+ * dpu_encoder_get_drm_fmt - return DRM fourcc format
+ * @phys_enc: Pointer to physical encoder structure
+ */
 u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
 {
 	struct drm_encoder *drm_enc;
@@ -235,6 +239,11 @@ u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
 	return DRM_FORMAT_RGB888;
 }
 
+/**
+ * dpu_encoder_needs_periph_flush - return true if physical encoder requires
+ *	peripheral flush
+ * @phys_enc: Pointer to physical encoder structure
+ */
 bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
 {
 	struct drm_encoder *drm_enc;
@@ -253,6 +262,10 @@ bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
 	       msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
 }
 
+/**
+ * dpu_encoder_is_widebus_enabled - return bool value if widebus is enabled
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
 	const struct dpu_encoder_virt *dpu_enc;
@@ -272,6 +285,11 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 	return false;
 }
 
+/**
+ * dpu_encoder_is_dsc_enabled - indicate whether dsc is enabled
+ *				for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
 bool dpu_encoder_is_dsc_enabled(const struct drm_encoder *drm_enc)
 {
 	const struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
@@ -279,6 +297,12 @@ bool dpu_encoder_is_dsc_enabled(const struct drm_encoder *drm_enc)
 	return dpu_enc->dsc ? true : false;
 }
 
+/**
+ * dpu_encoder_get_crc_values_cnt - get number of physical encoders contained
+ *	in virtual encoder that can collect CRC values
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * Returns:     Number of physical encoders for given drm encoder
+ */
 int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
@@ -297,6 +321,10 @@ int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc)
 	return num_intf;
 }
 
+/**
+ * dpu_encoder_setup_misr - enable misr calculations
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
 void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
@@ -315,6 +343,13 @@ void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
 	}
 }
 
+/**
+ * dpu_encoder_get_crc - get the crc value from interface blocks
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @crcs:	array to fill with CRC data
+ * @pos:	offset into the @crcs array
+ * Returns:     0 on success, error otherwise
+ */
 int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos)
 {
 	struct dpu_encoder_virt *dpu_enc;
@@ -385,6 +420,12 @@ static char *dpu_encoder_helper_get_intf_type(enum dpu_intf_mode intf_mode)
 	}
 }
 
+/**
+ * dpu_encoder_helper_report_irq_timeout - utility to report error that irq has
+ *	timed out, including reporting frame error event to crtc and debug dump
+ * @phys_enc: Pointer to physical encoder structure
+ * @intr_idx: Failing interrupt index
+ */
 void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
 		enum dpu_intr_idx intr_idx)
 {
@@ -402,6 +443,15 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
 static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 		u32 irq_idx, struct dpu_encoder_wait_info *info);
 
+/**
+ * dpu_encoder_helper_wait_for_irq - utility to wait on an irq.
+ *	note: will call dpu_encoder_helper_wait_for_irq on timeout
+ * @phys_enc: Pointer to physical encoder structure
+ * @irq_idx: IRQ index
+ * @func: IRQ callback to be called in case of timeout
+ * @wait_info: wait info struct
+ * @return: 0 or -ERROR
+ */
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		unsigned int irq_idx,
 		void (*func)(void *arg),
@@ -473,6 +523,10 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 	return ret;
 }
 
+/**
+ * dpu_encoder_get_vsync_count - get vsync count for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
 int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
@@ -480,6 +534,10 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc)
 	return phys ? atomic_read(&phys->vsync_cnt) : 0;
 }
 
+/**
+ * dpu_encoder_get_linecount - get interface line count for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
 int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
@@ -495,6 +553,13 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
 	return linecount;
 }
 
+/**
+ * dpu_encoder_helper_split_config - split display configuration helper function
+ *	This helper function may be used by physical encoders to configure
+ *	the split display related registers.
+ * @phys_enc: Pointer to physical encoder structure
+ * @interface: enum dpu_intf setting
+ */
 void dpu_encoder_helper_split_config(
 		struct dpu_encoder_phys *phys_enc,
 		enum dpu_intf interface)
@@ -544,6 +609,10 @@ void dpu_encoder_helper_split_config(
 	}
 }
 
+/**
+ * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
 bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
@@ -560,6 +629,12 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
 
+/**
+ * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
+ *   This helper function is used by physical encoder to get DSC config
+ *   used for this encoder.
+ * @drm_enc: Pointer to encoder structure
+ */
 struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv = drm_enc->dev->dev_private;
@@ -1089,6 +1164,11 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 	return 0;
 }
 
+/**
+ * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @job:        Pointer to the current drm writeback job
+ */
 void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
 		struct drm_writeback_job *job)
 {
@@ -1106,6 +1186,11 @@ void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
 	}
 }
 
+/**
+ * dpu_encoder_cleanup_wb_job - cleanup writeback job for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @job:        Pointer to the current drm writeback job
+ */
 void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 		struct drm_writeback_job *job)
 {
@@ -1248,6 +1333,10 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	}
 }
 
+/**
+ * dpu_encoder_virt_runtime_resume - pm runtime resume the encoder configs
+ * @drm_enc:	encoder pointer
+ */
 void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
@@ -1389,6 +1478,12 @@ static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catal
 	return NULL;
 }
 
+/**
+ * dpu_encoder_vblank_callback - Notify virtual encoder of vblank IRQ reception
+ * @drm_enc:    Pointer to drm encoder structure
+ * @phy_enc:	Pointer to physical encoder
+ * Note: This is called from IRQ handler context.
+ */
 void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phy_enc)
 {
@@ -1411,6 +1506,12 @@ void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 	DPU_ATRACE_END("encoder_vblank_callback");
 }
 
+/**
+ * dpu_encoder_underrun_callback - Notify virtual encoder of underrun IRQ reception
+ * @drm_enc:    Pointer to drm encoder structure
+ * @phy_enc:	Pointer to physical encoder
+ * Note: This is called from IRQ handler context.
+ */
 void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phy_enc)
 {
@@ -1429,6 +1530,11 @@ void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
 	DPU_ATRACE_END("encoder_underrun_callback");
 }
 
+/**
+ * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
+ * @drm_enc:	encoder pointer
+ * @crtc:	crtc pointer
+ */
 void dpu_encoder_assign_crtc(struct drm_encoder *drm_enc, struct drm_crtc *crtc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
@@ -1441,6 +1547,13 @@ void dpu_encoder_assign_crtc(struct drm_encoder *drm_enc, struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
 }
 
+/**
+ * dpu_encoder_toggle_vblank_for_crtc - Toggles vblank interrupts on or off if
+ *	the encoder is assigned to the given crtc
+ * @drm_enc:	encoder pointer
+ * @crtc:	crtc pointer
+ * @enable:	true if vblank should be enabled
+ */
 void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
 					struct drm_crtc *crtc, bool enable)
 {
@@ -1465,6 +1578,13 @@ void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
 	}
 }
 
+/**
+ * dpu_encoder_frame_done_callback - Notify virtual encoder that this phys
+ *     encoder completes last request frame
+ * @drm_enc:    Pointer to drm encoder structure
+ * @ready_phys:	Pointer to physical encoder
+ * @event:	Event to process
+ */
 void dpu_encoder_frame_done_callback(
 		struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *ready_phys, u32 event)
@@ -1587,6 +1707,12 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		phys->ops.trigger_start(phys);
 }
 
+/**
+ * dpu_encoder_helper_trigger_start - control start helper function
+ *	This helper function may be optionally specified by physical
+ *	encoders if they require ctl_start triggering.
+ * @phys_enc: Pointer to physical encoder structure
+ */
 void dpu_encoder_helper_trigger_start(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl;
@@ -1708,6 +1834,11 @@ static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt *dpu_enc)
 	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
 }
 
+/**
+ * dpu_encoder_trigger_kickoff_pending - Clear the flush bits from previous
+ *        kickoff and trigger the ctl prepare progress for command mode display.
+ * @drm_enc:	encoder pointer
+ */
 void dpu_encoder_trigger_kickoff_pending(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
@@ -1784,6 +1915,11 @@ static u32 _dpu_encoder_calculate_linetime(struct dpu_encoder_virt *dpu_enc,
 	return line_time;
 }
 
+/**
+ * dpu_encoder_vsync_time - get the time of the next vsync
+ * @drm_enc:	encoder pointer
+ * @wakeup_time: pointer to ktime_t to write the vsync time to
+ */
 int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time)
 {
 	struct drm_display_mode *mode;
@@ -1930,6 +2066,13 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 					 dsc, dsc_common_mode, initial_lines);
 }
 
+/**
+ * dpu_encoder_prepare_for_kickoff - schedule double buffer flip of the ctl
+ *	path (i.e. ctl flush and start) at next appropriate time.
+ *	Immediately: if no previous commit is outstanding.
+ *	Delayed: Block until next trigger can be issued.
+ * @drm_enc:	encoder pointer
+ */
 void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
@@ -1966,6 +2109,10 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 		dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
 }
 
+/**
+ * dpu_encoder_is_valid_for_commit - check if encode has valid parameters for commit.
+ * @drm_enc:    Pointer to drm encoder structure
+ */
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
@@ -1987,6 +2134,11 @@ bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
 	return true;
 }
 
+/**
+ * dpu_encoder_kickoff - trigger a double buffer flip of the ctl path
+ *	(i.e. ctl flush and start) immediately.
+ * @drm_enc:	encoder pointer
+ */
 void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
@@ -2085,6 +2237,10 @@ static void dpu_encoder_unprep_dsc(struct dpu_encoder_virt *dpu_enc)
 	}
 }
 
+/**
+ * dpu_encoder_helper_phys_cleanup - helper to cleanup dpu pipeline
+ * @phys_enc: Pointer to physical encoder structure
+ */
 void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
@@ -2168,6 +2324,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	ctl->ops.clear_pending_flush(ctl);
 }
 
+/**
+ * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
+ * @phys_enc: Pointer to physical encoder
+ * @dpu_fmt: Pinter to the format description
+ * @output_type: HDMI/WB
+ */
 void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
 				       const struct msm_format *dpu_fmt,
 				       u32 output_type)
@@ -2472,6 +2634,13 @@ static const struct drm_encoder_funcs dpu_encoder_funcs = {
 	.debugfs_init = dpu_encoder_debugfs_init,
 };
 
+/**
+ * dpu_encoder_init - initialize virtual encoder object
+ * @dev:        Pointer to drm device structure
+ * @drm_enc_mode: corresponding DRM_MODE_ENCODER_* constant
+ * @disp_info:  Pointer to display information structure
+ * Returns:     Pointer to newly created drm encoder
+ */
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 		int drm_enc_mode,
 		struct msm_display_info *disp_info)
@@ -2593,6 +2762,10 @@ int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_enc)
 	return ret;
 }
 
+/**
+ * dpu_encoder_get_intf_mode - get interface mode of the given encoder
+ * @encoder: Pointer to drm encoder object
+ */
 enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
@@ -2612,6 +2785,12 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
 	return INTF_MODE_NONE;
 }
 
+/**
+ * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
+ *   This helper function is used by physical encoder to get DSC blocks mask
+ *   used for this encoder.
+ * @phys_enc: Pointer to physical encoder structure
+ */
 unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
 {
 	struct drm_encoder *encoder = phys_enc->parent;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 6c4f3d7dfbb12da5c811d826eedafe7d466b15ff..92b5ee390788d16e85e195a664417896a2bf1cae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -38,159 +38,54 @@ struct msm_display_info {
 	enum dpu_vsync_source vsync_source;
 };
 
-/**
- * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
- * @encoder:	encoder pointer
- * @crtc:	crtc pointer
- */
 void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
 			     struct drm_crtc *crtc);
 
-/**
- * dpu_encoder_toggle_vblank_for_crtc - Toggles vblank interrupts on or off if
- *	the encoder is assigned to the given crtc
- * @encoder:	encoder pointer
- * @crtc:	crtc pointer
- * @enable:	true if vblank should be enabled
- */
 void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *encoder,
 					struct drm_crtc *crtc, bool enable);
 
-/**
- * dpu_encoder_prepare_for_kickoff - schedule double buffer flip of the ctl
- *	path (i.e. ctl flush and start) at next appropriate time.
- *	Immediately: if no previous commit is outstanding.
- *	Delayed: Block until next trigger can be issued.
- * @encoder:	encoder pointer
- */
 void dpu_encoder_prepare_for_kickoff(struct drm_encoder *encoder);
 
-/**
- * dpu_encoder_trigger_kickoff_pending - Clear the flush bits from previous
- *        kickoff and trigger the ctl prepare progress for command mode display.
- * @encoder:	encoder pointer
- */
 void dpu_encoder_trigger_kickoff_pending(struct drm_encoder *encoder);
 
-/**
- * dpu_encoder_kickoff - trigger a double buffer flip of the ctl path
- *	(i.e. ctl flush and start) immediately.
- * @encoder:	encoder pointer
- */
 void dpu_encoder_kickoff(struct drm_encoder *encoder);
 
-/**
- * dpu_encoder_wakeup_time - get the time of the next vsync
- */
 int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time);
 
 int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_encoder);
 
 int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_encoder);
 
-/*
- * dpu_encoder_get_intf_mode - get interface mode of the given encoder
- * @encoder: Pointer to drm encoder object
- */
 enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);
 
-/**
- * dpu_encoder_virt_runtime_resume - pm runtime resume the encoder configs
- * @encoder:	encoder pointer
- */
 void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
 
-/**
- * dpu_encoder_init - initialize virtual encoder object
- * @dev:        Pointer to drm device structure
- * @drm_enc_mode: corresponding DRM_MODE_ENCODER_* constant
- * @disp_info:  Pointer to display information structure
- * Returns:     Pointer to newly created drm encoder
- */
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 		int drm_enc_mode,
 		struct msm_display_info *disp_info);
 
-/**
- * dpu_encoder_set_idle_timeout - set the idle timeout for video
- *                    and command mode encoders.
- * @drm_enc:    Pointer to previously created drm encoder structure
- * @idle_timeout:    idle timeout duration in milliseconds
- */
-void dpu_encoder_set_idle_timeout(struct drm_encoder *drm_enc,
-							u32 idle_timeout);
-/**
- * dpu_encoder_get_linecount - get interface line count for the encoder.
- * @drm_enc:    Pointer to previously created drm encoder structure
- */
 int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
 
-/**
- * dpu_encoder_get_vsync_count - get vsync count for the encoder.
- * @drm_enc:    Pointer to previously created drm encoder structure
- */
 int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
 
-/**
- * dpu_encoder_is_widebus_enabled - return bool value if widebus is enabled
- * @drm_enc:    Pointer to previously created drm encoder structure
- */
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
 
-/**
- * dpu_encoder_is_dsc_enabled - indicate whether dsc is enabled
- *				for the encoder.
- * @drm_enc:    Pointer to previously created drm encoder structure
- */
 bool dpu_encoder_is_dsc_enabled(const struct drm_encoder *drm_enc);
 
-/**
- * dpu_encoder_get_crc_values_cnt - get number of physical encoders contained
- *	in virtual encoder that can collect CRC values
- * @drm_enc:    Pointer to previously created drm encoder structure
- * Returns:     Number of physical encoders for given drm encoder
- */
 int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc);
 
-/**
- * dpu_encoder_setup_misr - enable misr calculations
- * @drm_enc:    Pointer to previously created drm encoder structure
- */
 void dpu_encoder_setup_misr(const struct drm_encoder *drm_encoder);
 
-/**
- * dpu_encoder_get_crc - get the crc value from interface blocks
- * @drm_enc:    Pointer to previously created drm encoder structure
- * Returns:     0 on success, error otherwise
- */
 int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
 
-/**
- * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
- * @drm_enc:    Pointer to previously created drm encoder structure
- */
 bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
 
-/**
- * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
- * @drm_enc:    Pointer to previously created drm encoder structure
- * @job:        Pointer to the current drm writeback job
- */
 void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
 		struct drm_writeback_job *job);
 
-/**
- * dpu_encoder_cleanup_wb_job - cleanup writeback job for the encoder.
- * @drm_enc:    Pointer to previously created drm encoder structure
- * @job:        Pointer to the current drm writeback job
- */
 void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 		struct drm_writeback_job *job);
 
-/**
- * dpu_encoder_is_valid_for_commit - check if encode has valid parameters for commit.
- * @drm_enc:    Pointer to drm encoder structure
- */
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e77ebe3a68da99cc51638f225fe4b76540f9656f..63f09857025c2004dcb56bd33e9c51f8e0f80e48 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -279,37 +279,15 @@ struct dpu_encoder_wait_info {
 	s64 timeout_ms;
 };
 
-/**
- * dpu_encoder_phys_vid_init - Construct a new video mode physical encoder
- * @p:	Pointer to init params structure
- * Return: Error code or newly allocated encoder
- */
 struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p);
 
-/**
- * dpu_encoder_phys_cmd_init - Construct a new command mode physical encoder
- * @dev:  Corresponding device for devres management
- * @p:	Pointer to init params structure
- * Return: Error code or newly allocated encoder
- */
 struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p);
 
-/**
- * dpu_encoder_phys_wb_init - initialize writeback encoder
- * @dev:  Corresponding device for devres management
- * @init:	Pointer to init info structure with initialization params
- */
 struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p);
 
-/**
- * dpu_encoder_helper_trigger_start - control start helper function
- *	This helper function may be optionally specified by physical
- *	encoders if they require ctl_start triggering.
- * @phys_enc: Pointer to physical encoder structure
- */
 void dpu_encoder_helper_trigger_start(struct dpu_encoder_phys *phys_enc);
 
 static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
@@ -331,106 +309,38 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 	return BLEND_3D_NONE;
 }
 
-/**
- * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
- *   This helper function is used by physical encoder to get DSC blocks mask
- *   used for this encoder.
- * @phys_enc: Pointer to physical encoder structure
- */
 unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
 
-/**
- * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
- *   This helper function is used by physical encoder to get DSC config
- *   used for this encoder.
- * @drm_enc: Pointer to encoder structure
- */
 struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc);
 
-/**
- * dpu_encoder_get_drm_fmt - return DRM fourcc format
- * @phys_enc: Pointer to physical encoder structure
- */
 u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
 
-/**
- * dpu_encoder_needs_periph_flush - return true if physical encoder requires
- *	peripheral flush
- * @phys_enc: Pointer to physical encoder structure
- */
 bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc);
 
-/**
- * dpu_encoder_helper_split_config - split display configuration helper function
- *	This helper function may be used by physical encoders to configure
- *	the split display related registers.
- * @phys_enc: Pointer to physical encoder structure
- * @interface: enum dpu_intf setting
- */
 void dpu_encoder_helper_split_config(
 		struct dpu_encoder_phys *phys_enc,
 		enum dpu_intf interface);
 
-/**
- * dpu_encoder_helper_report_irq_timeout - utility to report error that irq has
- *	timed out, including reporting frame error event to crtc and debug dump
- * @phys_enc: Pointer to physical encoder structure
- * @intr_idx: Failing interrupt index
- */
 void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
 		enum dpu_intr_idx intr_idx);
 
-/**
- * dpu_encoder_helper_wait_for_irq - utility to wait on an irq.
- *	note: will call dpu_encoder_helper_wait_for_irq on timeout
- * @phys_enc: Pointer to physical encoder structure
- * @irq: IRQ index
- * @func: IRQ callback to be called in case of timeout
- * @wait_info: wait info struct
- * @Return: 0 or -ERROR
- */
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		unsigned int irq,
 		void (*func)(void *arg),
 		struct dpu_encoder_wait_info *wait_info);
 
-/**
- * dpu_encoder_helper_phys_cleanup - helper to cleanup dpu pipeline
- * @phys_enc: Pointer to physical encoder structure
- */
 void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
 
-/**
- * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
- * @phys_enc: Pointer to physical encoder
- * @output_type: HDMI/WB
- */
 void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
 				       const struct msm_format *dpu_fmt,
 				       u32 output_type);
 
-/**
- * dpu_encoder_vblank_callback - Notify virtual encoder of vblank IRQ reception
- * @drm_enc:    Pointer to drm encoder structure
- * @phys_enc:	Pointer to physical encoder
- * Note: This is called from IRQ handler context.
- */
 void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 				 struct dpu_encoder_phys *phy_enc);
 
-/** dpu_encoder_underrun_callback - Notify virtual encoder of underrun IRQ reception
- * @drm_enc:    Pointer to drm encoder structure
- * @phys_enc:	Pointer to physical encoder
- * Note: This is called from IRQ handler context.
- */
 void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
 				   struct dpu_encoder_phys *phy_enc);
 
-/** dpu_encoder_frame_done_callback -- Notify virtual encoder that this phys encoder completes last request frame
- * @drm_enc:    Pointer to drm encoder structure
- * @phys_enc:	Pointer to physical encoder
- * @event:	Event to process
- */
 void dpu_encoder_frame_done_callback(
 		struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *ready_phys, u32 event);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 6fc31d47cd1dc8a14377ace54db122e9618a06e4..e9bbccc44dad8b391cd51daf902307105b2598fc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -720,6 +720,12 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->get_line_count = dpu_encoder_phys_cmd_get_line_count;
 }
 
+/**
+ * dpu_encoder_phys_cmd_init - Construct a new command mode physical encoder
+ * @dev:  Corresponding device for devres management
+ * @p:	Pointer to init params structure
+ * Return: Error code or newly allocated encoder
+ */
 struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d8a2edebfe8c3c6fb97255f196263f83b0427d94..abd6600046cb3a91bf88ca240fd9b9c306b0ea2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -746,6 +746,12 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->get_frame_count = dpu_encoder_phys_vid_get_frame_count;
 }
 
+/**
+ * dpu_encoder_phys_vid_init - Construct a new video mode physical encoder
+ * @dev:  Corresponding device for devres management
+ * @p:	Pointer to init params structure
+ * Return: Error code or newly allocated encoder
+ */
 struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 		struct dpu_enc_phys_init_params *p)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index b0909cbd91cb69832768dd8f2d438cd7b76b0684..59c9427da7dda07b8e8ee3d070d2dfb3c165698e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -241,8 +241,8 @@ static int _dpu_format_populate_plane_sizes_linear(
 	return 0;
 }
 
-/*
- * dpu_format_populate_addrs - populate non-address part of the layout based on
+/**
+ * dpu_format_populate_plane_sizes - populate non-address part of the layout based on
  *                     fb, and format found in the fb
  * @fb:                framebuffer pointer
  * @layout:              format layout structure to populate
@@ -366,6 +366,13 @@ static void _dpu_format_populate_addrs_linear(struct msm_gem_address_space *aspa
 		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);
 }
 
+/**
+ * dpu_format_populate_addrs - populate buffer addresses based on
+ *                     mmu, fb, and format found in the fb
+ * @aspace:            address space pointer
+ * @fb:                framebuffer pointer
+ * @layout:            format layout structure to populate
+ */
 void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
 			       struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 256ca25c37a0eab9184f3f19edd255a5a8cdc0cb..c6145d43aa3f82fa5b51fa1ec3eb2429010be800 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -31,13 +31,6 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-/**
- * dpu_format_populate_addrs - populate buffer addresses based on
- *                     mmu, fb, and format found in the fb
- * @aspace:            address space pointer
- * @fb:                framebuffer pointer
- * @fmtl:              format layout structure to populate
- */
 void dpu_format_populate_addrs(struct msm_gem_address_space *aspace,
 			       struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
index 55d2768a6d4d98422342e39d2bc33f088a69338c..ae1534c49ae02fa92766b744390c2ad90b986f67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
@@ -222,6 +222,14 @@ static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_
 	DPU_REG_WRITE(c, CDM_MUX, mux_cfg);
 }
 
+/**
+ * dpu_hw_cdm_init - initializes the cdm hw driver object.
+ * should be called once before accessing every cdm.
+ * @dev: DRM device handle
+ * @cfg: CDM catalog entry for which driver object is required
+ * @addr :   mapped register io address of MDSS
+ * @mdss_rev: mdss hw core revision
+ */
 struct dpu_hw_cdm *dpu_hw_cdm_init(struct drm_device *dev,
 				   const struct dpu_cdm_cfg *cfg, void __iomem *addr,
 				   const struct dpu_mdss_version *mdss_rev)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
index ec71c9886d7537864eb3d8895e1313ab3ae7a734..6bb3476a05f80c3963b72e6735a61ea8be79233e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
@@ -122,14 +122,6 @@ struct dpu_hw_cdm {
 	struct dpu_hw_cdm_ops ops;
 };
 
-/**
- * dpu_hw_cdm_init - initializes the cdm hw driver object.
- * should be called once before accessing every cdm.
- * @dev: DRM device handle
- * @cdm: CDM catalog entry for which driver object is required
- * @addr :   mapped register io address of MDSS
- * @mdss_rev: mdss hw core revision
- */
 struct dpu_hw_cdm *dpu_hw_cdm_init(struct drm_device *dev,
 				   const struct dpu_cdm_cfg *cdm, void __iomem *addr,
 				   const struct dpu_mdss_version *mdss_rev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2e50049f2f85094a23882deaf4761886cde35d5c..4893f10d6a5832521808c0f4d8b231c356dbdc41 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -736,6 +736,15 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 };
 
+/**
+ * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
+ * Should be called before accessing any ctl_path register.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  ctl_path catalog entry for which driver object is required
+ * @addr: mapped register io address of MDP
+ * @mixer_count: Number of mixers in @mixer
+ * @mixer: Pointer to an array of Layer Mixers defined in the catalog
+ */
 struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 				   const struct dpu_ctl_cfg *cfg,
 				   void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 4401fdc0f3e4fe525531f018272613d38f57fd73..85c6c835cc8780e6cb66f3a262d9897c91962935 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -294,15 +294,6 @@ static inline struct dpu_hw_ctl *to_dpu_hw_ctl(struct dpu_hw_blk *hw)
 	return container_of(hw, struct dpu_hw_ctl, base);
 }
 
-/**
- * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
- * Should be called before accessing any ctl_path register.
- * @dev:  Corresponding device for devres management
- * @cfg:  ctl_path catalog entry for which driver object is required
- * @addr: mapped register io address of MDP
- * @mixer_count: Number of mixers in @mixer
- * @mixer: Pointer to an array of Layer Mixers defined in the catalog
- */
 struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 				   const struct dpu_ctl_cfg *cfg,
 				   void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 5e9aad1b2aa28361b61b2242a2f460b9960530ea..657200401f57635481a22f018ff00076dfd2ba34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -190,6 +190,13 @@ static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
 		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 };
 
+/**
+ * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  DSC catalog entry for which driver object is required
+ * @addr: Mapped register io address of MDP
+ * Return: Error code or allocated dpu_hw_dsc context
+ */
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
 				   void __iomem *addr)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index 989c88d2449b6a8ed40164af71d6c59d905dfcf5..fc171bdeca488f6287cf2ba7362ed330ad55b28f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -62,24 +62,10 @@ struct dpu_hw_dsc {
 	struct dpu_hw_dsc_ops ops;
 };
 
-/**
- * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
- * @dev:  Corresponding device for devres management
- * @cfg:  DSC catalog entry for which driver object is required
- * @addr: Mapped register io address of MDP
- * Return: Error code or allocated dpu_hw_dsc context
- */
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
 				   void __iomem *addr);
 
-/**
- * dpu_hw_dsc_init_1_2() - initializes the v1.2 DSC hw driver object
- * @dev:  Corresponding device for devres management
- * @cfg:  DSC catalog entry for which driver object is required
- * @addr: Mapped register io address of MDP
- * Returns: Error code or allocated dpu_hw_dsc context
- */
 struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
 				       void __iomem *addr);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index ba193b0376fe8259cea097320200965694da7521..b9c433567262a954b7f02233f6670ee6a8476846 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -369,6 +369,13 @@ static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
 	ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk_1_2;
 }
 
+/**
+ * dpu_hw_dsc_init_1_2() - initializes the v1.2 DSC hw driver object
+ * @dev:  Corresponding device for devres management
+ * @cfg:  DSC catalog entry for which driver object is required
+ * @addr: Mapped register io address of MDP
+ * Returns: Error code or allocated dpu_hw_dsc context
+ */
 struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
 				       void __iomem *addr)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index b1da88e2935f466973f9ee65d2e50e81131c34ee..829ca272873e45b122c04bea7da22dc569732e10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -70,6 +70,14 @@ static void _setup_dspp_ops(struct dpu_hw_dspp *c,
 		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 }
 
+/**
+ * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
+ * should be called once before accessing every DSPP.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  DSPP catalog entry for which driver object is required
+ * @addr: Mapped register io address of MDP
+ * Return: pointer to structure or ERR_PTR
+ */
 struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 				     const struct dpu_dspp_cfg *cfg,
 				     void __iomem *addr)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index 3b435690b6ccbf246a49a38be296d2cd2e38dcc6..45c26cd49fa3ed5a5c80985fb62720558f256578 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -78,14 +78,6 @@ static inline struct dpu_hw_dspp *to_dpu_hw_dspp(struct dpu_hw_blk *hw)
 	return container_of(hw, struct dpu_hw_dspp, base);
 }
 
-/**
- * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
- * should be called once before accessing every DSPP.
- * @dev:  Corresponding device for devres management
- * @cfg:  DSPP catalog entry for which driver object is required
- * @addr: Mapped register io address of MDP
- * Return: pointer to structure or ERR_PTR
- */
 struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 				     const struct dpu_dspp_cfg *cfg,
 				     void __iomem *addr);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index b85881aab04786733aa46c23303db45ad592228b..49bd77a755aa55067144247fd37c2e57d1e60d46 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -237,6 +237,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int
 	irq_entry->cb(irq_entry->arg);
 }
 
+/**
+ * dpu_core_irq - core IRQ handler
+ * @kms:		MSM KMS handle
+ * @return:		interrupt handling status
+ */
 irqreturn_t dpu_core_irq(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -442,6 +447,12 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 	wmb();
 }
 
+/**
+ * dpu_core_irq_read - IRQ helper function for reading IRQ status
+ * @dpu_kms:		DPU handle
+ * @irq_idx:		irq index
+ * @return:		non-zero if irq detected; otherwise no irq detected
+ */
 u32 dpu_core_irq_read(struct dpu_kms *dpu_kms,
 		      unsigned int irq_idx)
 {
@@ -476,6 +487,12 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms,
 	return intr_status;
 }
 
+/**
+ * dpu_hw_intr_init(): Initializes the interrupts hw object
+ * @dev:  Corresponding device for devres management
+ * @addr: mapped register io address of MDP
+ * @m:    pointer to MDSS catalog data
+ */
 struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
 				     void __iomem *addr,
 				     const struct dpu_mdss_cfg *m)
@@ -517,6 +534,17 @@ struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
 	return intr;
 }
 
+/**
+ * dpu_core_irq_register_callback - For registering callback function on IRQ
+ *                             interrupt
+ * @dpu_kms:		DPU handle
+ * @irq_idx:		irq index
+ * @irq_cb:		IRQ callback function.
+ * @irq_arg:		IRQ callback argument.
+ * @return:		0 for success registering callback, otherwise failure
+ *
+ * This function supports registration of multiple callbacks for each interrupt.
+ */
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
 				   unsigned int irq_idx,
 				   void (*irq_cb)(void *arg),
@@ -567,6 +595,15 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
 	return 0;
 }
 
+/**
+ * dpu_core_irq_unregister_callback - For unregistering callback function on IRQ
+ *                             interrupt
+ * @dpu_kms:		DPU handle
+ * @irq_idx:		irq index
+ * @return:		0 for success registering callback, otherwise failure
+ *
+ * This function supports registration of multiple callbacks for each interrupt.
+ */
 int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms,
 				     unsigned int irq_idx)
 {
@@ -628,6 +665,11 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
 
 DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_core_irq);
 
+/**
+ * dpu_debugfs_core_irq_init - register core irq debugfs
+ * @dpu_kms: pointer to kms
+ * @parent: debugfs directory root
+ */
 void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 		struct dentry *parent)
 {
@@ -636,6 +678,11 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 }
 #endif
 
+/**
+ * dpu_core_irq_preinstall - perform pre-installation of core IRQ handler
+ * @kms:		MSM KMS handle
+ * @return:		none
+ */
 void dpu_core_irq_preinstall(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -653,6 +700,11 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
 	}
 }
 
+/**
+ * dpu_core_irq_uninstall - uninstall core IRQ handler
+ * @kms:		MSM KMS handle
+ * @return:		none
+ */
 void dpu_core_irq_uninstall(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 564b750a28fe28749832861a9789fe6e341fcdd2..142358a105c5958ed991ef302087520e5a74d38c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -68,12 +68,6 @@ struct dpu_hw_intr {
 	struct dpu_hw_intr_entry irq_tbl[DPU_NUM_IRQS];
 };
 
-/**
- * dpu_hw_intr_init(): Initializes the interrupts hw object
- * @dev:  Corresponding device for devres management
- * @addr: mapped register io address of MDP
- * @m:    pointer to MDSS catalog data
- */
 struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
 				     void __iomem *addr,
 				     const struct dpu_mdss_cfg *m);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 29cb854f831a3defd27a768a06d306e0843bde7a..fb1d25baa518057e74fec3406faffd48969d492b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -547,6 +547,14 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *intf,
 	DPU_REG_WRITE(&intf->hw, INTF_CONFIG2, intf_cfg2);
 }
 
+/**
+ * dpu_hw_intf_init() - Initializes the INTF driver for the passed
+ * interface catalog entry.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  interface catalog entry for which driver object is required
+ * @addr: mapped register io address of MDP
+ * @mdss_rev: dpu core's major and minor versions
+ */
 struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 				     const struct dpu_intf_cfg *cfg,
 				     void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index fc23650dfbf05d6c739f61c266de608c31f45fc9..114be272ac0ae67fe0d4dfc0c117baa4106f77c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -130,14 +130,6 @@ struct dpu_hw_intf {
 	struct dpu_hw_intf_ops ops;
 };
 
-/**
- * dpu_hw_intf_init() - Initializes the INTF driver for the passed
- * interface catalog entry.
- * @dev:  Corresponding device for devres management
- * @cfg:  interface catalog entry for which driver object is required
- * @addr: mapped register io address of MDP
- * @mdss_rev: dpu core's major and minor versions
- */
 struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 				     const struct dpu_intf_cfg *cfg,
 				     void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 1d3ccf3228c62ceaeeb7543d3887ce92d87abb68..81b56f066519a68c9e72f0b42df12652139ab83a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -158,6 +158,13 @@ static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
 	ops->collect_misr = dpu_hw_lm_collect_misr;
 }
 
+/**
+ * dpu_hw_lm_init() - Initializes the mixer hw driver object.
+ * should be called once before accessing every mixer.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  mixer catalog entry for which driver object is required
+ * @addr: mapped register io address of MDP
+ */
 struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 				    const struct dpu_lm_cfg *cfg,
 				    void __iomem *addr)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 0a33817552499a5590e30d3f75faa1ebbfd385f1..6f60fa9b3cd78160699a97dc7a86a5ec0b599281 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -93,13 +93,6 @@ static inline struct dpu_hw_mixer *to_dpu_hw_mixer(struct dpu_hw_blk *hw)
 	return container_of(hw, struct dpu_hw_mixer, base);
 }
 
-/**
- * dpu_hw_lm_init() - Initializes the mixer hw driver object.
- * should be called once before accessing every mixer.
- * @dev:  Corresponding device for devres management
- * @cfg:  mixer catalog entry for which driver object is required
- * @addr: mapped register io address of MDP
- */
 struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 				    const struct dpu_lm_cfg *cfg,
 				    void __iomem *addr);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index ddfa40a959cbd08c7f6b798db97d7cf607826704..0b3325f9c8705999e1003e5c88872562e880229b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -39,6 +39,14 @@ static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
 	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
 };
 
+/**
+ * dpu_hw_merge_3d_init() - Initializes the merge_3d driver for the passed
+ * merge3d catalog entry.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  Pingpong catalog entry for which driver object is required
+ * @addr: Mapped register io address of MDP
+ * Return: Error code or allocated dpu_hw_merge_3d context
+ */
 struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
 					     const struct dpu_merge_3d_cfg *cfg,
 					     void __iomem *addr)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
index c192f02ec1abcc4049474d5d2a69cc767cc47671..6833c02075236608c29801a0b748a89c1a37f01f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -45,14 +45,6 @@ static inline struct dpu_hw_merge_3d *to_dpu_hw_merge_3d(struct dpu_hw_blk *hw)
 	return container_of(hw, struct dpu_hw_merge_3d, base);
 }
 
-/**
- * dpu_hw_merge_3d_init() - Initializes the merge_3d driver for the passed
- * merge3d catalog entry.
- * @dev:  Corresponding device for devres management
- * @cfg:  Pingpong catalog entry for which driver object is required
- * @addr: Mapped register io address of MDP
- * Return: Error code or allocated dpu_hw_merge_3d context
- */
 struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
 					     const struct dpu_merge_3d_cfg *cfg,
 					     void __iomem *addr);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 2db4c6fba37ac1dc9c7c70c21393bcfbc32e2773..36c0ec775b92036eaab26e1fa5331579651ac27c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -283,6 +283,15 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
 	return 0;
 }
 
+/**
+ * dpu_hw_pingpong_init() - initializes the pingpong driver for the passed
+ * pingpong catalog entry.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  Pingpong catalog entry for which driver object is required
+ * @addr: Mapped register io address of MDP
+ * @mdss_rev: dpu core's major and minor versions
+ * Return: Error code or allocated dpu_hw_pingpong context
+ */
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
 					     const struct dpu_pingpong_cfg *cfg,
 					     void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index a48b69fd79a3b4e8eee7240091f5ab7945ea7a48..dd99e1c21a1eee146a17399e928ad43323d52bb1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -118,15 +118,6 @@ static inline struct dpu_hw_pingpong *to_dpu_hw_pingpong(struct dpu_hw_blk *hw)
 	return container_of(hw, struct dpu_hw_pingpong, base);
 }
 
-/**
- * dpu_hw_pingpong_init() - initializes the pingpong driver for the passed
- * pingpong catalog entry.
- * @dev:  Corresponding device for devres management
- * @cfg:  Pingpong catalog entry for which driver object is required
- * @addr: Mapped register io address of MDP
- * @mdss_rev: dpu core's major and minor versions
- * Return: Error code or allocated dpu_hw_pingpong context
- */
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
 					     const struct dpu_pingpong_cfg *cfg,
 					     void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 2c720f1fc1b298e9bb9c4fa5c98d2f6539286e43..32c7c80845533d720683dbcde3978d98f4972cce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -672,6 +672,15 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 }
 #endif
 
+/**
+ * dpu_hw_sspp_init() - Initializes the sspp hw driver object.
+ * Should be called once before accessing every pipe.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  Pipe catalog entry for which driver object is required
+ * @addr: Mapped register io address of MDP
+ * @mdss_data: UBWC / MDSS configuration data
+ * @mdss_rev: dpu core's major and minor versions
+ */
 struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 				     const struct dpu_sspp_cfg *cfg,
 				     void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 9ae475420c053897bfc4af2c8b7a27b8e83ca2d0..56a0edf2a57c6dcef7cddf4a1bcd6f6df5ad60f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -319,15 +319,7 @@ struct dpu_hw_sspp {
 };
 
 struct dpu_kms;
-/**
- * dpu_hw_sspp_init() - Initializes the sspp hw driver object.
- * Should be called once before accessing every pipe.
- * @dev:  Corresponding device for devres management
- * @cfg:  Pipe catalog entry for which driver object is required
- * @addr: Mapped register io address of MDP
- * @mdss_data: UBWC / MDSS configuration data
- * @mdss_rev: dpu core's major and minor versions
- */
+
 struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 				     const struct dpu_sspp_cfg *cfg,
 				     void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 0f40eea7f5e247b5497bac37307c8c5ed639ecea..ad19330de61abd66762671cf253276695b303b32 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -284,6 +284,13 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 
+/**
+ * dpu_hw_mdptop_init - initializes the top driver for the passed config
+ * @dev:  Corresponding device for devres management
+ * @cfg:  MDP TOP configuration from catalog
+ * @addr: Mapped register io address of MDP
+ * @mdss_rev: dpu core's major and minor versions
+ */
 struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 				      const struct dpu_mdp_cfg *cfg,
 				      void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index f1ab9fd106e5133dbc7be817fa948e7e290ac85b..04efdcd21ceb0a703e6e8250c08635a79f0217e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -157,18 +157,9 @@ struct dpu_hw_mdp {
 	struct dpu_hw_mdp_ops ops;
 };
 
-/**
- * dpu_hw_mdptop_init - initializes the top driver for the passed config
- * @dev:  Corresponding device for devres management
- * @cfg:  MDP TOP configuration from catalog
- * @addr: Mapped register io address of MDP
- * @mdss_rev: dpu core's major and minor versions
- */
 struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 				      const struct dpu_mdp_cfg *cfg,
 				      void __iomem *addr,
 				      const struct dpu_mdss_version *mdss_rev);
 
-void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
-
 #endif /*_DPU_HW_TOP_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index 98e34afde2d259ab3cbc0011af05c463aeb1d2bc..af76ad8a81035ca1adfde7112d49a9e2acc19b04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -213,6 +213,13 @@ static void _setup_vbif_ops(struct dpu_hw_vbif_ops *ops,
 	ops->set_write_gather_en = dpu_hw_set_write_gather_en;
 }
 
+/**
+ * dpu_hw_vbif_init() - Initializes the VBIF driver for the passed
+ * VBIF catalog entry.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  VBIF catalog entry for which driver object is required
+ * @addr: Mapped register io address of MDSS
+ */
 struct dpu_hw_vbif *dpu_hw_vbif_init(struct drm_device *dev,
 				     const struct dpu_vbif_cfg *cfg,
 				     void __iomem *addr)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
index e2b4307500e42f1c2ca4496561135df0d4726b35..285121ec804cca0b2fa432eca4ce6e563401abf3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
@@ -105,13 +105,6 @@ struct dpu_hw_vbif {
 	struct dpu_hw_vbif_ops ops;
 };
 
-/**
- * dpu_hw_vbif_init() - Initializes the VBIF driver for the passed
- * VBIF catalog entry.
- * @dev:  Corresponding device for devres management
- * @cfg:  VBIF catalog entry for which driver object is required
- * @addr: Mapped register io address of MDSS
- */
 struct dpu_hw_vbif *dpu_hw_vbif_init(struct drm_device *dev,
 				     const struct dpu_vbif_cfg *cfg,
 				     void __iomem *addr);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index f39db534697dc8d9e0ffee941bd8e533ea1d11e2..fb9f909577624959560abddbab8d03b0b1ea11a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -213,6 +213,14 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 		ops->setup_clk_force_ctrl = dpu_hw_wb_setup_clk_force_ctrl;
 }
 
+/**
+ * dpu_hw_wb_init() - Initializes the writeback hw driver object.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  wb_path catalog entry for which driver object is required
+ * @addr: mapped register io address of MDP
+ * @mdss_rev: dpu core's major and minor versions
+ * Return: Error code or allocated dpu_hw_wb context
+ */
 struct dpu_hw_wb *dpu_hw_wb_init(struct drm_device *dev,
 				 const struct dpu_wb_cfg *cfg,
 				 void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index b240a4f7b33a13f729e04a4d4ced46bcffad8d51..ee5e5ab786e1b429de233eae4cd6e6e45441e39e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -75,14 +75,6 @@ struct dpu_hw_wb {
 	struct dpu_hw_wb_ops ops;
 };
 
-/**
- * dpu_hw_wb_init() - Initializes the writeback hw driver object.
- * @dev:  Corresponding device for devres management
- * @cfg:  wb_path catalog entry for which driver object is required
- * @addr: mapped register io address of MDP
- * @mdss_rev: dpu core's major and minor versions
- * Return: Error code or allocated dpu_hw_wb context
- */
 struct dpu_hw_wb *dpu_hw_wb_init(struct drm_device *dev,
 				 const struct dpu_wb_cfg *cfg,
 				 void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 15679dd50c66038816cd1fc6a92f3c99138c985f..ca4847b2b73876c59dedff1e3ec4188ea70860a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -230,6 +230,21 @@ static int dpu_regset32_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(dpu_regset32);
 
+/**
+ * dpu_debugfs_create_regset32 - Create register read back file for debugfs
+ *
+ * This function is almost identical to the standard debugfs_create_regset32()
+ * function, with the main difference being that a list of register
+ * names/offsets do not need to be provided. The 'read' function simply outputs
+ * sequential register values over a specified range.
+ *
+ * @name:   File name within debugfs
+ * @mode:   File mode within debugfs
+ * @parent: Parent directory entry within debugfs, can be NULL
+ * @offset: sub-block offset
+ * @length: sub-block length, in bytes
+ * @dpu_kms: pointer to dpu kms structure
+ */
 void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 		void *parent,
 		uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms)
@@ -1060,6 +1075,13 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+/**
+ * dpu_kms_get_clk_rate() - get the clock rate
+ * @dpu_kms:  pointer to dpu_kms structure
+ * @clock_name: clock name to get the rate
+ *
+ * Return: current clock rate
+ */
 unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 {
 	struct clk *clk;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 935ff6fd172c41a2f2c719f3479294214e512aad..88d64d43ea1a8226b414f04bf76551f7dda94ef6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -145,37 +145,10 @@ struct dpu_global_state
  * @dpu_debugfs_create_regset32: Create 32-bit register dump file
  */
 
-/**
- * dpu_debugfs_create_regset32 - Create register read back file for debugfs
- *
- * This function is almost identical to the standard debugfs_create_regset32()
- * function, with the main difference being that a list of register
- * names/offsets do not need to be provided. The 'read' function simply outputs
- * sequential register values over a specified range.
- *
- * @name:   File name within debugfs
- * @mode:   File mode within debugfs
- * @parent: Parent directory entry within debugfs, can be NULL
- * @offset: sub-block offset
- * @length: sub-block length, in bytes
- * @dpu_kms: pointer to dpu kms structure
- */
 void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 		void *parent,
 		uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms);
 
-/**
- * dpu_debugfs_get_root - Return root directory entry for KMS's debugfs
- *
- * The return value should be passed as the 'parent' argument to subsequent
- * debugfs create calls.
- *
- * @dpu_kms: Pointer to DPU's KMS structure
- *
- * Return: dentry pointer for DPU's debugfs location
- */
-void *dpu_debugfs_get_root(struct dpu_kms *dpu_kms);
-
 /**
  * DPU info management functions
  * These functions/definitions allow for building up a 'dpu_info' structure
@@ -189,13 +162,6 @@ void *dpu_debugfs_get_root(struct dpu_kms *dpu_kms);
 int dpu_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 
-/**
- * dpu_kms_get_clk_rate() - get the clock rate
- * @dpu_kms:  pointer to dpu_kms structure
- * @clock_name: clock name to get the rate
- *
- * Return: current clock rate
- */
 unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
 
 #endif /* __dpu_kms_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 5e230391fabc7f389ac8ae3ef2f633ba7f37fe25..3ffac24333a2a5b01135d4ece418432d4a74dc04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1041,6 +1041,10 @@ static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe
 
 }
 
+/**
+ * dpu_plane_flush - final plane operations before commit flush
+ * @plane: Pointer to drm plane structure
+ */
 void dpu_plane_flush(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
@@ -1429,7 +1433,15 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 		.atomic_update = dpu_plane_atomic_update,
 };
 
-/* initialize plane */
+/**
+ * dpu_plane_init - create new dpu plane for the given pipe
+ * @dev:   Pointer to DRM device
+ * @pipe:  dpu hardware pipe identifier
+ * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
+ * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
+ *
+ * Initialize the plane.
+ */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
 		unsigned long possible_crtcs)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 31ee8b55c4dd8b03af4208b201cf3c519b6c7249..97090ca7842b41c697090665d89194a87c02cba1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -54,40 +54,14 @@ struct dpu_plane_state {
 #define to_dpu_plane_state(x) \
 	container_of(x, struct dpu_plane_state, base)
 
-/**
- * dpu_plane_flush - final plane operations before commit flush
- * @plane: Pointer to drm plane structure
- */
 void dpu_plane_flush(struct drm_plane *plane);
 
-/**
- * dpu_plane_set_error: enable/disable error condition
- * @plane: pointer to drm_plane structure
- */
 void dpu_plane_set_error(struct drm_plane *plane, bool error);
 
-/**
- * dpu_plane_init - create new dpu plane for the given pipe
- * @dev:   Pointer to DRM device
- * @pipe:  dpu hardware pipe identifier
- * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
- * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
- *
- */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
 		unsigned long possible_crtcs);
 
-/**
- * dpu_plane_color_fill - enables color fill on plane
- * @plane:  Pointer to DRM plane object
- * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, [7..0] Red
- * @alpha:  8-bit fill alpha value, 255 selects 100% alpha
- * Returns: 0 on success
- */
-int dpu_plane_color_fill(struct drm_plane *plane,
-		uint32_t color, uint32_t alpha);
-
 #ifdef CONFIG_DEBUG_FS
 void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
 #else
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 44938ba7a2b7e618735447e0af51e91f9fa3242a..c247af03dc8ef7174eedf3d5cc267d64f17a8656 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -34,6 +34,16 @@ struct dpu_rm_requirements {
 	struct msm_display_topology topology;
 };
 
+/**
+ * dpu_rm_init - Read hardware catalog and create reservation tracking objects
+ *	for all HW blocks.
+ * @dev:  Corresponding device for devres management
+ * @rm: DPU Resource Manager handle
+ * @cat: Pointer to hardware catalog
+ * @mdss_data: Pointer to MDSS / UBWC configuration
+ * @mmio: mapped register io address of MDP
+ * @return: 0 on Success otherwise -ERROR
+ */
 int dpu_rm_init(struct drm_device *dev,
 		struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
@@ -641,6 +651,13 @@ static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
 	}
 }
 
+/**
+ * dpu_rm_release - Given the encoder for the display chain, release any
+ *	HW blocks previously reserved for that use case.
+ * @global_state: resources shared across multiple kms objects
+ * @enc: DRM Encoder handle
+ * @return: 0 on Success otherwise -ERROR
+ */
 void dpu_rm_release(struct dpu_global_state *global_state,
 		    struct drm_encoder *enc)
 {
@@ -657,6 +674,20 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 	_dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
 }
 
+/**
+ * dpu_rm_reserve - Given a CRTC->Encoder->Connector display chain, analyze
+ *	the use connections and user requirements, specified through related
+ *	topology control properties, and reserve hardware blocks to that
+ *	display chain.
+ *	HW blocks can then be accessed through dpu_rm_get_* functions.
+ *	HW Reservations should be released via dpu_rm_release_hw.
+ * @rm: DPU Resource Manager handle
+ * @global_state: resources shared across multiple kms objects
+ * @enc: DRM Encoder handle
+ * @crtc_state: Proposed Atomic DRM CRTC State handle
+ * @topology: Pointer to topology info for the display
+ * @return: 0 on Success otherwise -ERROR
+ */
 int dpu_rm_reserve(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
@@ -694,6 +725,16 @@ int dpu_rm_reserve(
 	return ret;
 }
 
+/**
+ * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
+ *     assigned to this encoder
+ * @rm: DPU Resource Manager handle
+ * @global_state: resources shared across multiple kms objects
+ * @enc_id: encoder id requesting for allocation
+ * @type: resource type to return data for
+ * @blks: pointer to the array to be filled by HW resources
+ * @blks_size: size of the @blks array
+ */
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
@@ -772,6 +813,11 @@ static void dpu_rm_print_state_helper(struct drm_printer *p,
 }
 
 
+/**
+ * dpu_rm_print_state - output the RM private state
+ * @p: DRM printer
+ * @global_state: global state
+ */
 void dpu_rm_print_state(struct drm_printer *p,
 			const struct dpu_global_state *global_state)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 14220ba04a7864494b2bc358264f1ab06789d868..ea0e49cb7b0d3e05dfa57442784c83acb69c3ada 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -53,63 +53,25 @@ struct msm_display_topology {
 	bool needs_cdm;
 };
 
-/**
- * dpu_rm_init - Read hardware catalog and create reservation tracking objects
- *	for all HW blocks.
- * @dev:  Corresponding device for devres management
- * @rm: DPU Resource Manager handle
- * @cat: Pointer to hardware catalog
- * @mdss_data: Pointer to MDSS / UBWC configuration
- * @mmio: mapped register io address of MDP
- * @Return: 0 on Success otherwise -ERROR
- */
 int dpu_rm_init(struct drm_device *dev,
 		struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
 		const struct msm_mdss_data *mdss_data,
 		void __iomem *mmio);
 
-/**
- * dpu_rm_reserve - Given a CRTC->Encoder->Connector display chain, analyze
- *	the use connections and user requirements, specified through related
- *	topology control properties, and reserve hardware blocks to that
- *	display chain.
- *	HW blocks can then be accessed through dpu_rm_get_* functions.
- *	HW Reservations should be released via dpu_rm_release_hw.
- * @rm: DPU Resource Manager handle
- * @drm_enc: DRM Encoder handle
- * @crtc_state: Proposed Atomic DRM CRTC State handle
- * @topology: Pointer to topology info for the display
- * @Return: 0 on Success otherwise -ERROR
- */
 int dpu_rm_reserve(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
 		struct msm_display_topology topology);
 
-/**
- * dpu_rm_reserve - Given the encoder for the display chain, release any
- *	HW blocks previously reserved for that use case.
- * @rm: DPU Resource Manager handle
- * @enc: DRM Encoder handle
- * @Return: 0 on Success otherwise -ERROR
- */
 void dpu_rm_release(struct dpu_global_state *global_state,
 		struct drm_encoder *enc);
 
-/**
- * Get hw resources of the given type that are assigned to this encoder.
- */
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
 
-/**
- * dpu_rm_print_state - output the RM private state
- * @p: DRM printer
- * @global_state: global state
- */
 void dpu_rm_print_state(struct drm_printer *p,
 			const struct dpu_global_state *global_state);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 47c02b98eac37bb4f569fa875ca1d3f187cc3a09..2a551e455aa30de548a97461ca98b9ba1f75f23f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -204,6 +204,11 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	vbif->ops.set_halt_ctrl(vbif, params->xin_id, false);
 }
 
+/**
+ * dpu_vbif_set_qos_remap - set QoS priority level remap
+ * @dpu_kms:	DPU handler
+ * @params:	Pointer to QoS configuration parameters
+ */
 void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_qos_params *params)
 {
@@ -245,6 +250,10 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	}
 }
 
+/**
+ * dpu_vbif_clear_errors - clear any vbif errors
+ * @dpu_kms:	DPU handler
+ */
 void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 {
 	struct dpu_hw_vbif *vbif;
@@ -262,6 +271,10 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 	}
 }
 
+/**
+ * dpu_vbif_init_memtypes - initialize xin memory types for vbif
+ * @dpu_kms:	DPU handler
+ */
 void dpu_vbif_init_memtypes(struct dpu_kms *dpu_kms)
 {
 	struct dpu_hw_vbif *vbif;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
index e1b1f7f4e4be29a58cd439ba713132555c4c8d82..62e47ae1e3ee708227ed50b4b007f1a350240acd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
@@ -38,32 +38,14 @@ struct dpu_vbif_set_qos_params {
 	bool is_rt;
 };
 
-/**
- * dpu_vbif_set_ot_limit - set OT limit for vbif client
- * @dpu_kms:	DPU handler
- * @params:	Pointer to OT configuration parameters
- */
 void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_ot_params *params);
 
-/**
- * dpu_vbif_set_qos_remap - set QoS priority level remap
- * @dpu_kms:	DPU handler
- * @params:	Pointer to QoS configuration parameters
- */
 void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_qos_params *params);
 
-/**
- * dpu_vbif_clear_errors - clear any vbif errors
- * @dpu_kms:	DPU handler
- */
 void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms);
 
-/**
- * dpu_vbif_init_memtypes - initialize xin memory types for vbif
- * @dpu_kms:	DPU handler
- */
 void dpu_vbif_init_memtypes(struct dpu_kms *dpu_kms);
 
 void dpu_debugfs_vbif_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);

---
base-commit: d742f7e0684035bbe1bbd69652e01c353484980b
change-id: 20241102-dpu-docs-rework-4d2cafb073bb

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

