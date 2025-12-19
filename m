Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C376CD16E0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7663610F084;
	Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="U503OLJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972F910F07E;
 Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6AEjezfZKDs0XvSfUCxxqcxbpEjYQW04G0xxXaq7h6c=; b=U503OLJzMNRaA2srTN6gFf3kdw
 iaKM0h3pjftJicC7ZTyvMTeNoFpVAAPfYWhFVxr19U5hVL5k6nQAU4xBcw+rYVesEEgU8bi40GA5t
 I9Bf3gSwq4vv0xfh2AeOAA0ZxR7UwfzA4mbFxE4E/fYbyHHSaPI7hihcCml0pMbMX4TBDQs6BIKI5
 4cxL7aDpOFR7YPg1MIiyaKNlh1zFYi3m5DDsTpFV0+Ili0vKmO48KDCnWLhBe/fnLES1+9MHM/HeG
 06ypOF7D3iILKuAJWFSa78kRC5U15EoZ/fCaWAU5sqhJFnkkMpSJSmYxcjlpQEFSCvUq3cE/lAJIz
 cAdYCqxg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUy-0000000AqkV-1KB4; Fri, 19 Dec 2025 18:46:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:31 -0800
Message-ID: <20251219184638.1813181-13-rdunlap@infradead.org>
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

Modify non-kernel-doc comments to begin with "/*" instead of "/**".
Correct or add kernel-doc comments to eliminate all warnings:

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:17 missing initial
 short description on line: * Flags
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:19 expecting
 prototype for Flags(). Prototype was for DPU_SSPP_FLIP_LR() instead
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:26 This comment
 starts with '/**', but isn't a kernel-doc comment.
 * Component indices
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:47 cannot understand
 function prototype: 'enum dpu_sspp_multirect_index'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:152 struct member
 'dst_rect' not described in 'dpu_sw_pipe_cfg'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:174 struct member
 'multirect_index' not described in 'dpu_sw_pipe'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:174 struct member
 'multirect_mode' not described in 'dpu_sw_pipe'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:183 Incorrect use of
 kernel-doc format: * setup_format - setup pixel format cropping
 rectangle, flip
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:192 Incorrect use of
 kernel-doc format: * setup_rects - setup pipe ROI rectangles
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:200 Incorrect use of
 kernel-doc format: * setup_pe - setup pipe pixel extension
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:208 Incorrect use of
 kernel-doc format: * setup_sourceaddress - setup pipe source addresses
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:216 Incorrect use of
 kernel-doc format: * setup_csc - setup color space coversion
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:223 Incorrect use of
 kernel-doc format: * setup_solidfill - enable/disable colorfill
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:231 Incorrect use of
 kernel-doc format: * setup_multirect - setup multirect configuration
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:238 Incorrect use of
 kernel-doc format: * setup_sharpening - setup sharpening
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:247 Incorrect use of
 kernel-doc format: * setup_qos_lut - setup QoS LUTs
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:255 Incorrect use of
 kernel-doc format: * setup_qos_ctrl - setup QoS control
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:263 Incorrect use of
 kernel-doc format: * setup_clk_force_ctrl - setup clock force control
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:271 Incorrect use of
 kernel-doc format: * setup_histogram - setup histograms
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:279 Incorrect use of
 kernel-doc format: * setup_scaler - setup scaler
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:288 Incorrect use of
 kernel-doc format: * setup_cdp - setup client driven prefetch
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_format' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_rects' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_pe' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_sourceaddress' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_csc' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_solidfill' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_multirect' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_sharpening' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_qos_lut' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_qos_ctrl' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_clk_force_ctrl' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_histogram' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_scaler' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:296 struct member
 'setup_cdp' not described in 'dpu_hw_sspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:320 struct member
 'mdss_ver' not described in 'dpu_hw_sspp'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   47 +++++++++---------
 1 file changed, 24 insertions(+), 23 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -14,7 +14,7 @@ struct dpu_hw_sspp;
 
 #define DPU_SSPP_MAX_PITCH_SIZE		0xffff
 
-/**
+/*
  * Flags
  */
 #define DPU_SSPP_FLIP_LR		BIT(0)
@@ -23,7 +23,7 @@ struct dpu_hw_sspp;
 #define DPU_SSPP_ROT_90			BIT(3)
 #define DPU_SSPP_SOLID_FILL		BIT(4)
 
-/**
+/*
  * Component indices
  */
 enum {
@@ -36,9 +36,10 @@ enum {
 };
 
 /**
- * DPU_SSPP_RECT_SOLO - multirect disabled
- * DPU_SSPP_RECT_0 - rect0 of a multirect pipe
- * DPU_SSPP_RECT_1 - rect1 of a multirect pipe
+ * enum dpu_sspp_multirect_index - multirect mode
+ * @DPU_SSPP_RECT_SOLO: multirect disabled
+ * @DPU_SSPP_RECT_0: rect0 of a multirect pipe
+ * @DPU_SSPP_RECT_1: rect1 of a multirect pipe
  *
  * Note: HW supports multirect with either RECT0 or
  * RECT1. Considering no benefit of such configs over
@@ -143,7 +144,7 @@ struct dpu_hw_pixel_ext {
  * struct dpu_sw_pipe_cfg : software pipe configuration
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
- * @dest_rect: destination ROI.
+ * @dst_rect: destination ROI.
  * @rotation: simplified drm rotation hint
  */
 struct dpu_sw_pipe_cfg {
@@ -165,8 +166,8 @@ struct dpu_hw_pipe_ts_cfg {
 /**
  * struct dpu_sw_pipe - software pipe description
  * @sspp:      backing SSPP pipe
- * @index:     index of the rectangle of SSPP
- * @mode:      parallel or time multiplex multirect mode
+ * @multirect_index:     index of the rectangle of SSPP
+ * @multirect_mode:      parallel or time multiplex multirect mode
  */
 struct dpu_sw_pipe {
 	struct dpu_hw_sspp *sspp;
@@ -181,7 +182,7 @@ struct dpu_sw_pipe {
  */
 struct dpu_hw_sspp_ops {
 	/**
-	 * setup_format - setup pixel format cropping rectangle, flip
+	 * @setup_format: setup pixel format cropping rectangle, flip
 	 * @pipe: Pointer to software pipe context
 	 * @cfg: Pointer to pipe config structure
 	 * @flags: Extra flags for format config
@@ -190,7 +191,7 @@ struct dpu_hw_sspp_ops {
 			     const struct msm_format *fmt, u32 flags);
 
 	/**
-	 * setup_rects - setup pipe ROI rectangles
+	 * @setup_rects: setup pipe ROI rectangles
 	 * @pipe: Pointer to software pipe context
 	 * @cfg: Pointer to pipe config structure
 	 */
@@ -198,7 +199,7 @@ struct dpu_hw_sspp_ops {
 			    struct dpu_sw_pipe_cfg *cfg);
 
 	/**
-	 * setup_pe - setup pipe pixel extension
+	 * @setup_pe: setup pipe pixel extension
 	 * @ctx: Pointer to pipe context
 	 * @pe_ext: Pointer to pixel ext settings
 	 */
@@ -206,7 +207,7 @@ struct dpu_hw_sspp_ops {
 			struct dpu_hw_pixel_ext *pe_ext);
 
 	/**
-	 * setup_sourceaddress - setup pipe source addresses
+	 * @setup_sourceaddress: setup pipe source addresses
 	 * @pipe: Pointer to software pipe context
 	 * @layout: format layout information for programming buffer to hardware
 	 */
@@ -214,14 +215,14 @@ struct dpu_hw_sspp_ops {
 				    struct dpu_hw_fmt_layout *layout);
 
 	/**
-	 * setup_csc - setup color space coversion
+	 * @setup_csc: setup color space coversion
 	 * @ctx: Pointer to pipe context
 	 * @data: Pointer to config structure
 	 */
 	void (*setup_csc)(struct dpu_hw_sspp *ctx, const struct dpu_csc_cfg *data);
 
 	/**
-	 * setup_solidfill - enable/disable colorfill
+	 * @setup_solidfill: enable/disable colorfill
 	 * @pipe: Pointer to software pipe context
 	 * @const_color: Fill color value
 	 * @flags: Pipe flags
@@ -229,23 +230,22 @@ struct dpu_hw_sspp_ops {
 	void (*setup_solidfill)(struct dpu_sw_pipe *pipe, u32 color);
 
 	/**
-	 * setup_multirect - setup multirect configuration
+	 * @setup_multirect: setup multirect configuration
 	 * @pipe: Pointer to software pipe context
 	 */
 
 	void (*setup_multirect)(struct dpu_sw_pipe *pipe);
 
 	/**
-	 * setup_sharpening - setup sharpening
+	 * @setup_sharpening: setup sharpening
 	 * @ctx: Pointer to pipe context
 	 * @cfg: Pointer to config structure
 	 */
 	void (*setup_sharpening)(struct dpu_hw_sspp *ctx,
 			struct dpu_hw_sharp_cfg *cfg);
 
-
 	/**
-	 * setup_qos_lut - setup QoS LUTs
+	 * @setup_qos_lut: setup QoS LUTs
 	 * @ctx: Pointer to pipe context
 	 * @cfg: LUT configuration
 	 */
@@ -253,7 +253,7 @@ struct dpu_hw_sspp_ops {
 			struct dpu_hw_qos_cfg *cfg);
 
 	/**
-	 * setup_qos_ctrl - setup QoS control
+	 * @setup_qos_ctrl: setup QoS control
 	 * @ctx: Pointer to pipe context
 	 * @danger_safe_en: flags controlling enabling of danger/safe QoS/LUT
 	 */
@@ -261,7 +261,7 @@ struct dpu_hw_sspp_ops {
 			       bool danger_safe_en);
 
 	/**
-	 * setup_clk_force_ctrl - setup clock force control
+	 * @setup_clk_force_ctrl: setup clock force control
 	 * @ctx: Pointer to pipe context
 	 * @enable: enable clock force if true
 	 */
@@ -269,7 +269,7 @@ struct dpu_hw_sspp_ops {
 				     bool enable);
 
 	/**
-	 * setup_histogram - setup histograms
+	 * @setup_histogram: setup histograms
 	 * @ctx: Pointer to pipe context
 	 * @cfg: Pointer to histogram configuration
 	 */
@@ -277,7 +277,7 @@ struct dpu_hw_sspp_ops {
 			void *cfg);
 
 	/**
-	 * setup_scaler - setup scaler
+	 * @setup_scaler: setup scaler
 	 * @scaler3_cfg: Pointer to scaler configuration
 	 * @format: pixel format parameters
 	 */
@@ -286,7 +286,7 @@ struct dpu_hw_sspp_ops {
 		const struct msm_format *format);
 
 	/**
-	 * setup_cdp - setup client driven prefetch
+	 * @setup_cdp: setup client driven prefetch
 	 * @pipe: Pointer to software pipe context
 	 * @fmt: format used by the sw pipe
 	 * @enable: whether the CDP should be enabled for this pipe
@@ -303,6 +303,7 @@ struct dpu_hw_sspp_ops {
  * @ubwc: UBWC configuration data
  * @idx: pipe index
  * @cap: pointer to layer_cfg
+ * @mdss_ver: MDSS version info to use for feature checks
  * @ops: pointer to operations possible for this pipe
  */
 struct dpu_hw_sspp {
