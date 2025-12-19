Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB22CD16F5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC2010F08D;
	Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="fUO9XUrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CF310F074;
 Fri, 19 Dec 2025 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Od5agI4hcMcqxupDgHzI7N/s9zaVA6aBzsW8sCoSM+4=; b=fUO9XUrFPIvnRg2hsSbIGbN/T+
 5izXALj9IJql+piVJXP9VDXamZDnfQvS9dPiEnMVIzNu8oA8EATZzfTSaQhwhQI517XVeUV7Dps2D
 BVIlS4KMORDZqoONy2UYF2MPOMBYkTFtafcYaMX36speKQpQzcP6Tfi8254oYCCTj+ez8f6rkUwyM
 9TtyDQvF7dvhNtFWF5yAE2ZVpd5GrbAVngLHtVza+Ufw21NsxoIxz6F0vPXFGkxlojbmQXwV8wJUM
 aBekLJMazCFBlp5vQnaQcSFYsFnk60eR9CC5EktvFx+pAWAR+9aosf9eZkfccbFip6KzoARFi2YSi
 4URShYXw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUv-0000000AqkV-3iy2; Fri, 19 Dec 2025 18:46:41 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:23 -0800
Message-ID: <20251219184638.1813181-5-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct and add kernel-doc comments to eliminate all warnings:

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:18 cannot understand
 function prototype: 'enum dpu_ctl_mode_sel'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:58 struct member 'wb'
 not described in 'dpu_hw_intf_cfg'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:66 Incorrect use of
 kernel-doc format: * kickoff hw operation for Sw controlled interfaces
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:73 Incorrect use of
 kernel-doc format: * check if the ctl is started
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:80 Incorrect use of
 kernel-doc format: * kickoff prepare is in progress hw operation for sw
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:88 Incorrect use of
 kernel-doc format: * Clear the value of the cached pending_flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:96 Incorrect use of
 kernel-doc format: * Query the value of the cached pending_flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:103 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the cached
 pending_flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:112 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the
 cached pending_(wb_)flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:121 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the cached
 pending_(cwb_)flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:130 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the cached
 pending_(intf_)flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:139 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the cached
 pending_(periph_)flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:148 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the cached
 pending_(merge_3d_)flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:157 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the cached
 pending_flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:166 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the cached
 pending_flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:175 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the cached
 pending_flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:185 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the cached
 pending_(dsc_)flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:194 Incorrect use of
 kernel-doc format: * OR in the given flushbits to the cached
 pending_(cdm_)flush_mask
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:202 Incorrect use of
 kernel-doc format: * Write the value of the pending_flush_mask to hardware
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:208 Incorrect use of
 kernel-doc format: * Read the value of the flush register
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:215 Incorrect use of
 kernel-doc format: * Setup ctl_path interface config
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:223 Incorrect use of
 kernel-doc format: * reset ctl_path interface config
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:244 Incorrect use of
 kernel-doc format: * Set all blend stages to disabled
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:250 Incorrect use of
 kernel-doc format: * Configure layer mixer to pipe configuration
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:262 Incorrect use of
 kernel-doc format: * Set active pipes attached to this CTL
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:270 Incorrect use of
 kernel-doc format: * Set active layer mixers attached to this CTL
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:277 struct member
 'trigger_start' not described in 'dpu_hw_ctl_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:277 struct member
 'is_started' not described in 'dpu_hw_ctl_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:277 struct member
 'trigger_pending' not described in 'dpu_hw_ctl_ops'
[many here]
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:319 struct member
 'pending_periph_flush_mask' not described in 'dpu_hw_ctl'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:319 struct member
 'pending_merge_3d_flush_mask' not described in 'dpu_hw_ctl'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:319 struct member
 'pending_dspp_flush_mask' not described in 'dpu_hw_ctl'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h:327 expecting
 prototype for dpu_hw_ctl(). Prototype was for to_dpu_hw_ctl() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |   84 +++++++++++--------
 1 file changed, 53 insertions(+), 31 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -12,9 +12,9 @@
 #include "dpu_hw_sspp.h"
 
 /**
- * dpu_ctl_mode_sel: Interface mode selection
- * DPU_CTL_MODE_SEL_VID:    Video mode interface
- * DPU_CTL_MODE_SEL_CMD:    Command mode interface
+ * enum dpu_ctl_mode_sel: Interface mode selection
+ * @DPU_CTL_MODE_SEL_VID:    Video mode interface
+ * @DPU_CTL_MODE_SEL_CMD:    Command mode interface
  */
 enum dpu_ctl_mode_sel {
 	DPU_CTL_MODE_SEL_VID = 0,
@@ -37,6 +37,7 @@ struct dpu_hw_stage_cfg {
  * struct dpu_hw_intf_cfg :Describes how the DPU writes data to output interface
  * @intf :                 Interface id
  * @intf_master:           Master interface id in the dual pipe topology
+ * @wb:                    Writeback mode
  * @mode_3d:               3d mux configuration
  * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
@@ -64,21 +65,21 @@ struct dpu_hw_intf_cfg {
  */
 struct dpu_hw_ctl_ops {
 	/**
-	 * kickoff hw operation for Sw controlled interfaces
+	 * @trigger_start: kickoff hw operation for Sw controlled interfaces
 	 * DSI cmd mode and WB interface are SW controlled
 	 * @ctx       : ctl path ctx pointer
 	 */
 	void (*trigger_start)(struct dpu_hw_ctl *ctx);
 
 	/**
-	 * check if the ctl is started
+	 * @is_started: check if the ctl is started
 	 * @ctx       : ctl path ctx pointer
 	 * @Return: true if started, false if stopped
 	 */
 	bool (*is_started)(struct dpu_hw_ctl *ctx);
 
 	/**
-	 * kickoff prepare is in progress hw operation for sw
+	 * @trigger_pending: kickoff prepare is in progress hw operation for sw
 	 * controlled interfaces: DSI cmd mode and WB interface
 	 * are SW controlled
 	 * @ctx       : ctl path ctx pointer
@@ -86,7 +87,7 @@ struct dpu_hw_ctl_ops {
 	void (*trigger_pending)(struct dpu_hw_ctl *ctx);
 
 	/**
-	 * Clear the value of the cached pending_flush_mask
+	 * @clear_pending_flush: Clear the value of the cached pending_flush_mask
 	 * No effect on hardware.
 	 * Required to be implemented.
 	 * @ctx       : ctl path ctx pointer
@@ -94,14 +95,15 @@ struct dpu_hw_ctl_ops {
 	void (*clear_pending_flush)(struct dpu_hw_ctl *ctx);
 
 	/**
-	 * Query the value of the cached pending_flush_mask
+	 * @get_pending_flush: Query the value of the cached pending_flush_mask
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 */
 	u32 (*get_pending_flush)(struct dpu_hw_ctl *ctx);
 
 	/**
-	 * OR in the given flushbits to the cached pending_flush_mask
+	 * @update_pending_flush: OR in the given flushbits to the cached
+	 * pending_flush_mask.
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 * @flushbits : module flushmask
@@ -110,7 +112,8 @@ struct dpu_hw_ctl_ops {
 		u32 flushbits);
 
 	/**
-	 * OR in the given flushbits to the cached pending_(wb_)flush_mask
+	 * @update_pending_flush_wb: OR in the given flushbits to the
+	 * cached pending_(wb_)flush_mask.
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 * @blk       : writeback block index
@@ -119,7 +122,8 @@ struct dpu_hw_ctl_ops {
 		enum dpu_wb blk);
 
 	/**
-	 * OR in the given flushbits to the cached pending_(cwb_)flush_mask
+	 * @update_pending_flush_cwb: OR in the given flushbits to the
+	 * cached pending_(cwb_)flush_mask.
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 * @blk       : concurrent writeback block index
@@ -128,7 +132,8 @@ struct dpu_hw_ctl_ops {
 		enum dpu_cwb blk);
 
 	/**
-	 * OR in the given flushbits to the cached pending_(intf_)flush_mask
+	 * @update_pending_flush_intf: OR in the given flushbits to the
+	 * cached pending_(intf_)flush_mask.
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 * @blk       : interface block index
@@ -137,7 +142,8 @@ struct dpu_hw_ctl_ops {
 		enum dpu_intf blk);
 
 	/**
-	 * OR in the given flushbits to the cached pending_(periph_)flush_mask
+	 * @update_pending_flush_periph: OR in the given flushbits to the
+	 * cached pending_(periph_)flush_mask.
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 * @blk       : interface block index
@@ -146,7 +152,8 @@ struct dpu_hw_ctl_ops {
 					    enum dpu_intf blk);
 
 	/**
-	 * OR in the given flushbits to the cached pending_(merge_3d_)flush_mask
+	 * @update_pending_flush_merge_3d: OR in the given flushbits to the
+	 * cached pending_(merge_3d_)flush_mask.
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 * @blk       : interface block index
@@ -155,7 +162,8 @@ struct dpu_hw_ctl_ops {
 		enum dpu_merge_3d blk);
 
 	/**
-	 * OR in the given flushbits to the cached pending_flush_mask
+	 * @update_pending_flush_sspp: OR in the given flushbits to the
+	 * cached pending_flush_mask.
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 * @blk       : SSPP block index
@@ -164,7 +172,8 @@ struct dpu_hw_ctl_ops {
 		enum dpu_sspp blk);
 
 	/**
-	 * OR in the given flushbits to the cached pending_flush_mask
+	 * @update_pending_flush_mixer: OR in the given flushbits to the
+	 * cached pending_flush_mask.
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 * @blk       : LM block index
@@ -173,7 +182,8 @@ struct dpu_hw_ctl_ops {
 		enum dpu_lm blk);
 
 	/**
-	 * OR in the given flushbits to the cached pending_flush_mask
+	 * @update_pending_flush_dspp: OR in the given flushbits to the
+	 * cached pending_flush_mask.
 	 * No effect on hardware
 	 * @ctx       : ctl path ctx pointer
 	 * @blk       : DSPP block index
@@ -183,7 +193,8 @@ struct dpu_hw_ctl_ops {
 		enum dpu_dspp blk, u32 dspp_sub_blk);
 
 	/**
-	 * OR in the given flushbits to the cached pending_(dsc_)flush_mask
+	 * @update_pending_flush_dsc: OR in the given flushbits to the
+	 * cached pending_(dsc_)flush_mask.
 	 * No effect on hardware
 	 * @ctx: ctl path ctx pointer
 	 * @blk: interface block index
@@ -192,7 +203,8 @@ struct dpu_hw_ctl_ops {
 					 enum dpu_dsc blk);
 
 	/**
-	 * OR in the given flushbits to the cached pending_(cdm_)flush_mask
+	 * @update_pending_flush_cdm: OR in the given flushbits to the
+	 * cached pending_(cdm_)flush_mask.
 	 * No effect on hardware
 	 * @ctx: ctl path ctx pointer
 	 * @cdm_num: idx of cdm to be flushed
@@ -200,20 +212,20 @@ struct dpu_hw_ctl_ops {
 	void (*update_pending_flush_cdm)(struct dpu_hw_ctl *ctx, enum dpu_cdm cdm_num);
 
 	/**
-	 * Write the value of the pending_flush_mask to hardware
+	 * @trigger_flush: Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
 	 */
 	void (*trigger_flush)(struct dpu_hw_ctl *ctx);
 
 	/**
-	 * Read the value of the flush register
+	 * @get_flush_register: Read the value of the flush register
 	 * @ctx       : ctl path ctx pointer
 	 * @Return: value of the ctl flush register.
 	 */
 	u32 (*get_flush_register)(struct dpu_hw_ctl *ctx);
 
 	/**
-	 * Setup ctl_path interface config
+	 * @setup_intf_cfg: Setup ctl_path interface config
 	 * @ctx
 	 * @cfg    : interface config structure pointer
 	 */
@@ -221,17 +233,20 @@ struct dpu_hw_ctl_ops {
 		struct dpu_hw_intf_cfg *cfg);
 
 	/**
-	 * reset ctl_path interface config
+	 * @reset_intf_cfg: reset ctl_path interface config
 	 * @ctx    : ctl path ctx pointer
 	 * @cfg    : interface config structure pointer
 	 */
 	void (*reset_intf_cfg)(struct dpu_hw_ctl *ctx,
 			struct dpu_hw_intf_cfg *cfg);
 
+	/**
+	 * @reset: reset function for this ctl type
+	 */
 	int (*reset)(struct dpu_hw_ctl *c);
 
-	/*
-	 * wait_reset_status - checks ctl reset status
+	/**
+	 * @wait_reset_status: checks ctl reset status
 	 * @ctx       : ctl path ctx pointer
 	 *
 	 * This function checks the ctl reset status bit.
@@ -242,13 +257,13 @@ struct dpu_hw_ctl_ops {
 	int (*wait_reset_status)(struct dpu_hw_ctl *ctx);
 
 	/**
-	 * Set all blend stages to disabled
+	 * @clear_all_blendstages: Set all blend stages to disabled
 	 * @ctx       : ctl path ctx pointer
 	 */
 	void (*clear_all_blendstages)(struct dpu_hw_ctl *ctx);
 
 	/**
-	 * Configure layer mixer to pipe configuration
+	 * @setup_blendstage: Configure layer mixer to pipe configuration
 	 * @ctx       : ctl path ctx pointer
 	 * @lm        : layer mixer enumeration
 	 * @cfg       : blend stage configuration
@@ -256,11 +271,16 @@ struct dpu_hw_ctl_ops {
 	void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
 		enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
 
+	/**
+	 * @set_active_fetch_pipes: Set active pipes attached to this CTL
+	 * @ctx: ctl path ctx pointer
+	 * @active_pipes: bitmap of enum dpu_sspp
+	 */
 	void (*set_active_fetch_pipes)(struct dpu_hw_ctl *ctx,
 		unsigned long *fetch_active);
 
 	/**
-	 * Set active pipes attached to this CTL
+	 * @set_active_pipes: Set active pipes attached to this CTL
 	 * @ctx: ctl path ctx pointer
 	 * @active_pipes: bitmap of enum dpu_sspp
 	 */
@@ -268,13 +288,12 @@ struct dpu_hw_ctl_ops {
 				 unsigned long *active_pipes);
 
 	/**
-	 * Set active layer mixers attached to this CTL
+	 * @set_active_lms: Set active layer mixers attached to this CTL
 	 * @ctx: ctl path ctx pointer
 	 * @active_lms: bitmap of enum dpu_lm
 	 */
 	void (*set_active_lms)(struct dpu_hw_ctl *ctx,
 			       unsigned long *active_lms);
-
 };
 
 /**
@@ -289,6 +308,9 @@ struct dpu_hw_ctl_ops {
  * @pending_intf_flush_mask: pending INTF flush
  * @pending_wb_flush_mask: pending WB flush
  * @pending_cwb_flush_mask: pending CWB flush
+ * @pending_periph_flush_mask: pending PERIPH flush
+ * @pending_merge_3d_flush_mask: pending MERGE 3D flush
+ * @pending_dspp_flush_mask: pending DSPP flush
  * @pending_dsc_flush_mask: pending DSC flush
  * @pending_cdm_flush_mask: pending CDM flush
  * @mdss_ver: MDSS revision information
@@ -320,7 +342,7 @@ struct dpu_hw_ctl {
 };
 
 /**
- * dpu_hw_ctl - convert base object dpu_hw_base to container
+ * to_dpu_hw_ctl - convert base object dpu_hw_base to container
  * @hw: Pointer to base hardware block
  * return: Pointer to hardware block container
  */
