Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED482CD16BF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7039910F075;
	Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="abUQbgLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2C710F070;
 Fri, 19 Dec 2025 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yi/wPZIyGw0Ud9LE6Bh5bJP/cpbksQq2y9TvDCMaq3U=; b=abUQbgLks3D0vJ9XX1XXjqG1ec
 jErhY4Mk+QZIkywcC191eWVvN+oJzb71AZmSMxMNqCtvJ1KLrfyq3fvhGIXuOHD8V9d72OZJZFNXO
 56jNq4J6cZcHVOmxP26jKV4Hj3bMRYEL5oGfl3l/O46ItZ90pGFpDulWZHz55QCc0nCnb6eWwx41D
 LgVqm+5O94TlDKgFyecd63HxNxymzCm8MuOYu0M7YTvBXh4HVTsE8EzOPhqedP1ou6pDOozBdLOWO
 xbd8BECjoryg3nSpX9Vrl51DHptULbQdppc31A2sUNkcTZs8Lai1bIggPU8ak/Oux3FRhJ6/TWPrQ
 RWd1gvQQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUx-0000000AqkV-1iMS; Fri, 19 Dec 2025 18:46:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:28 -0800
Message-ID: <20251219184638.1813181-10-rdunlap@infradead.org>
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

Correct or add kernel-doc comments to eliminate all warnings:

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:27 Cannot find
 identifier on line: *
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:52 Incorrect use of
 kernel-doc format: * Clear layer mixer to pipe configuration
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:59 Incorrect use of
 kernel-doc format: * Configure layer mixer to pipe configuration
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:69 Incorrect use of
 kernel-doc format: * setup_border_color : enable/disable border color
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:76 Incorrect use of
 kernel-doc format: * setup_misr: Enable/disable MISR
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:81 Incorrect use of
 kernel-doc format: * collect_misr: Read MISR signature

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:84 struct member
 'setup_mixer_out' not described in 'dpu_hw_lm_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:84 struct member
 'setup_blend_config' not described in 'dpu_hw_lm_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:84 struct member
 'setup_alpha_out' not described in 'dpu_hw_lm_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:84 struct member
 'clear_all_blendstages' not described in 'dpu_hw_lm_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:84 struct member
 'setup_blendstage' not described in 'dpu_hw_lm_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:84 struct member
 'setup_border_color' not described in 'dpu_hw_lm_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:84 struct member
 'setup_misr' not described in 'dpu_hw_lm_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h:84 struct member
 'collect_misr' not described in 'dpu_hw_lm_ops'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h |   23 +++++++++-----------
 1 file changed, 11 insertions(+), 12 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -25,39 +25,38 @@ struct dpu_hw_color3_cfg {
 };
 
 /**
- *
  * struct dpu_hw_lm_ops : Interface to the mixer Hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
  */
 struct dpu_hw_lm_ops {
-	/*
-	 * Sets up mixer output width and height
+	/**
+	 * @setup_mixer_out: Sets up mixer output width and height
 	 * and border color if enabled
 	 */
 	void (*setup_mixer_out)(struct dpu_hw_mixer *ctx,
 		struct dpu_hw_mixer_cfg *cfg);
 
-	/*
-	 * Alpha blending configuration
+	/**
+	 * @setup_blend_config: Alpha blending configuration
 	 * for the specified stage
 	 */
 	void (*setup_blend_config)(struct dpu_hw_mixer *ctx, uint32_t stage,
 		uint32_t fg_alpha, uint32_t bg_alpha, uint32_t blend_op);
 
-	/*
-	 * Alpha color component selection from either fg or bg
+	/**
+	 * @setup_alpha_out: Alpha color component selection from either fg or bg
 	 */
 	void (*setup_alpha_out)(struct dpu_hw_mixer *ctx, uint32_t mixer_op);
 
 	/**
-	 * Clear layer mixer to pipe configuration
+	 * @clear_all_blendstages: Clear layer mixer to pipe configuration
 	 * @ctx		: mixer ctx pointer
 	 * Returns: 0 on success or -error
 	 */
 	int (*clear_all_blendstages)(struct dpu_hw_mixer *ctx);
 
 	/**
-	 * Configure layer mixer to pipe configuration
+	 * @setup_blendstage: Configure layer mixer to pipe configuration
 	 * @ctx		: mixer ctx pointer
 	 * @lm		: layer mixer enumeration
 	 * @stage_cfg	: blend stage configuration
@@ -67,19 +66,19 @@ struct dpu_hw_lm_ops {
 				struct dpu_hw_stage_cfg *stage_cfg);
 
 	/**
-	 * setup_border_color : enable/disable border color
+	 * @setup_border_color : enable/disable border color
 	 */
 	void (*setup_border_color)(struct dpu_hw_mixer *ctx,
 		struct dpu_mdss_color *color,
 		u8 border_en);
 
 	/**
-	 * setup_misr: Enable/disable MISR
+	 * @setup_misr: Enable/disable MISR
 	 */
 	void (*setup_misr)(struct dpu_hw_mixer *ctx);
 
 	/**
-	 * collect_misr: Read MISR signature
+	 * @collect_misr: Read MISR signature
 	 */
 	int (*collect_misr)(struct dpu_hw_mixer *ctx, u32 *misr_value);
 };
