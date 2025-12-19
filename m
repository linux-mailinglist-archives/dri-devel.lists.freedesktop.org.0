Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69A8CD16F8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A088F10F08B;
	Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="0Y3P9IuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCB610F07E;
 Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=UtLTwc+LiBLTScqzUXqYR3Ok73APBHKTYAuY0Z5/pns=; b=0Y3P9IuMTi3L/couh/zAofVFyy
 E0XMDaUDT6h77QLXRljgI7dvOYGILqM1JLO3nyU8HBzHY3yTKEqJ0oLBCaD/Fxnx+q2H4u28x5BCc
 62paejRColy7RVVws7mt9UqyjF6GwYNKZiIu+VXGI6i8zTrc87zHSAnM2tmJhEMYjU9lBXb98xOh7
 7VCIhWW3sNSrJpR0VqtNsmFPwfdMcq92bkUeOMMnqpAl41ofZiGG5QLJ7dPppqaMdfbE5kHnZzxLY
 blHQsUaIGkw1IegImx3PWSC4GOADyXqGqjwPxL6fBmekYCOFIemKCQoqkJSx5jCpc68TpdjRZsoPN
 qAwZym9A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUy-0000000AqkV-2blN; Fri, 19 Dec 2025 18:46:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:32 -0800
Message-ID: <20251219184638.1813181-14-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:93 Incorrect use of
 kernel-doc format: * setup_traffic_shaper() : Setup traffic shaper control
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:101 Incorrect use of
 kernel-doc format: * setup_clk_force_ctrl - set clock force control
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:111 Incorrect use of
 kernel-doc format: * get_danger_status - get danger status
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:119 Incorrect use of
 kernel-doc format: * setup_vsync_source - setup vsync source
 configuration details
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:127 Incorrect use of
 kernel-doc format: * get_safe_status - get safe status
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:135 Incorrect use of
 kernel-doc format: * dp_phy_intf_sel - configure intf to phy mapping
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:142 Incorrect use of
 kernel-doc format: * intf_audio_select - select the external interface
 for audio
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:146 struct member
 'setup_clk_force_ctrl' not described in 'dpu_hw_mdp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:146 struct member
 'get_danger_status' not described in 'dpu_hw_mdp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:146 struct member
 'setup_vsync_source' not described in 'dpu_hw_mdp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:146 struct member
 'get_safe_status' not described in 'dpu_hw_mdp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:146 struct member
 'dp_phy_intf_sel' not described in 'dpu_hw_mdp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h:146 struct member
 'intf_audio_select' not described in 'dpu_hw_mdp_ops'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h |   21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -77,12 +77,11 @@ enum dpu_dp_phy_sel {
 /**
  * struct dpu_hw_mdp_ops - interface to the MDP TOP Hw driver functions
  * Assumption is these functions will be called after clocks are enabled.
- * @setup_split_pipe : Programs the pipe control registers
- * @setup_pp_split : Programs the pp split control registers
- * @setup_traffic_shaper : programs traffic shaper control
  */
 struct dpu_hw_mdp_ops {
-	/** setup_split_pipe() : Registers are not double buffered, thisk
+	/**
+	 * @setup_split_pipe : Programs the pipe control registers.
+	 * Registers are not double buffered, this
 	 * function should be called before timing control enable
 	 * @mdp  : mdp top context driver
 	 * @cfg  : upper and lower part of pipe configuration
@@ -91,7 +90,7 @@ struct dpu_hw_mdp_ops {
 			struct split_pipe_cfg *p);
 
 	/**
-	 * setup_traffic_shaper() : Setup traffic shaper control
+	 * @setup_traffic_shaper : programs traffic shaper control.
 	 * @mdp  : mdp top context driver
 	 * @cfg  : traffic shaper configuration
 	 */
@@ -99,7 +98,7 @@ struct dpu_hw_mdp_ops {
 			struct traffic_shaper_cfg *cfg);
 
 	/**
-	 * setup_clk_force_ctrl - set clock force control
+	 * @setup_clk_force_ctrl: set clock force control
 	 * @mdp: mdp top context driver
 	 * @clk_ctrl: clock to be controlled
 	 * @enable: force on enable
@@ -109,7 +108,7 @@ struct dpu_hw_mdp_ops {
 			enum dpu_clk_ctrl_type clk_ctrl, bool enable);
 
 	/**
-	 * get_danger_status - get danger status
+	 * @get_danger_status: get danger status
 	 * @mdp: mdp top context driver
 	 * @status: Pointer to danger safe status
 	 */
@@ -117,7 +116,7 @@ struct dpu_hw_mdp_ops {
 			struct dpu_danger_safe_status *status);
 
 	/**
-	 * setup_vsync_source - setup vsync source configuration details
+	 * @setup_vsync_source: setup vsync source configuration details
 	 * @mdp: mdp top context driver
 	 * @cfg: vsync source selection configuration
 	 */
@@ -125,7 +124,7 @@ struct dpu_hw_mdp_ops {
 				struct dpu_vsync_source_cfg *cfg);
 
 	/**
-	 * get_safe_status - get safe status
+	 * @get_safe_status: get safe status
 	 * @mdp: mdp top context driver
 	 * @status: Pointer to danger safe status
 	 */
@@ -133,14 +132,14 @@ struct dpu_hw_mdp_ops {
 			struct dpu_danger_safe_status *status);
 
 	/**
-	 * dp_phy_intf_sel - configure intf to phy mapping
+	 * @dp_phy_intf_sel: configure intf to phy mapping
 	 * @mdp: mdp top context driver
 	 * @phys: list of phys the DP interfaces should be connected to. 0 disables the INTF.
 	 */
 	void (*dp_phy_intf_sel)(struct dpu_hw_mdp *mdp, enum dpu_dp_phy_sel phys[2]);
 
 	/**
-	 * intf_audio_select - select the external interface for audio
+	 * @intf_audio_select: select the external interface for audio
 	 * @mdp: mdp top context driver
 	 */
 	void (*intf_audio_select)(struct dpu_hw_mdp *mdp);
