Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7242CD16FE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C92010F091;
	Fri, 19 Dec 2025 18:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="gA9Pxcid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EFF10F070;
 Fri, 19 Dec 2025 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GotC1nTIrAg78rmdG0CbbNaRcRLJxiG0NzkUqWavGm0=; b=gA9Pxcid+ceWopr7RLUyo3skuO
 9SFLDVZdKruDGTlLJka8CK/aTGE2GEZV5ceQdzFyORFuiWrrflxZdRnjFN2J71TICJofzJYxNl0CH
 24i6BKB8fGXlGl8vQQTHOps/jlBctfhP0HbjlxqveMPJ2Vp7zcf0oQ/8RyN/ZgBtXhRdebBWESBSY
 pM2n6DnSCkrjUkoevReBTlCFsbEIOmJtCkTZ0TiDEdYs5YXuj7L++iachGjCmfY596Vz3m/WD4MAY
 rGO1OTDZr18AR5VdJ6XaEJandPSjfYaM5OqPytBndCyB5v2PSCqJ/cEi07IEpPv6Q6RJgBvcyszcG
 bMsgjXjg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUx-0000000AqkV-0O0h; Fri, 19 Dec 2025 18:46:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:27 -0800
Message-ID: <20251219184638.1813181-9-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h:76 duplicate section
 name 'Return'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h:112 Incorrect use of
 kernel-doc format: * Disable autorefresh if enabled
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h:118 struct member
 'setup_timing_gen' not described in 'dpu_hw_intf_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h:118 struct member
 'setup_prg_fetch' not described in 'dpu_hw_intf_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h:118 struct member
 'enable_timing' not described in 'dpu_hw_intf_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h:118 struct member
 'get_status' not described in 'dpu_hw_intf_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h:118 struct member
 'get_line_count' not described in 'dpu_hw_intf_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h:118 struct member
 'disable_autorefresh' not described in 'dpu_hw_intf_ops'
dpu_hw_intf.h:119: warning: Excess struct member 'get_vsync_info'
 description in 'dpu_hw_intf_ops'
dpu_hw_intf.h:119: warning: Excess struct member 'setup_autorefresh'
 description in 'dpu_hw_intf_ops'
dpu_hw_intf.h:119: warning: Excess struct member 'get_autorefresh'
 description in 'dpu_hw_intf_ops'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |   20 ++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -57,11 +57,11 @@ struct dpu_hw_intf_cmd_mode_cfg {
 /**
  * struct dpu_hw_intf_ops : Interface to the interface Hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
- * @ setup_timing_gen : programs the timing engine
- * @ setup_prog_fetch : enables/disables the programmable fetch logic
- * @ enable_timing: enable/disable timing engine
- * @ get_status: returns if timing engine is enabled or not
- * @ get_line_count: reads current vertical line counter
+ * @setup_timing_gen : programs the timing engine
+ * @setup_prg_fetch  : enables/disables the programmable fetch logic
+ * @enable_timing: enable/disable timing engine
+ * @get_status: returns if timing engine is enabled or not
+ * @get_line_count: reads current vertical line counter
  * @bind_pingpong_blk: enable/disable the connection with pingpong which will
  *                     feed pixels to this interface
  * @setup_misr: enable/disable MISR
@@ -70,12 +70,9 @@ struct dpu_hw_intf_cmd_mode_cfg {
  *                              pointer and programs the tear check configuration
  * @disable_tearcheck:          Disables tearcheck block
  * @connect_external_te:        Read, modify, write to either set or clear listening to external TE
- *                              Return: 1 if TE was originally connected, 0 if not, or -ERROR
- * @get_vsync_info:             Provides the programmed and current line_count
- * @setup_autorefresh:          Configure and enable the autorefresh config
- * @get_autorefresh:            Retrieve autorefresh config from hardware
- *                              Return: 0 on success, -ETIMEDOUT on timeout
+ *                              Returns 1 if TE was originally connected, 0 if not, or -ERROR
  * @vsync_sel:                  Select vsync signal for tear-effect configuration
+ * @disable_autorefresh:        Disable autorefresh if enabled
  * @program_intf_cmd_cfg:       Program the DPU to interface datapath for command mode
  */
 struct dpu_hw_intf_ops {
@@ -109,9 +106,6 @@ struct dpu_hw_intf_ops {
 
 	void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
 
-	/**
-	 * Disable autorefresh if enabled
-	 */
 	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);
 
 	void (*program_intf_cmd_cfg)(struct dpu_hw_intf *intf,
