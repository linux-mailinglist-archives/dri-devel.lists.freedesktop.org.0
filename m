Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97637CD171F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C93F10F09A;
	Fri, 19 Dec 2025 18:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="ffVPRY2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8075810F086;
 Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NonYhmvZMwONi2btokC5vswbHTeTJUUE8JUNsaNzQQw=; b=ffVPRY2cY7L0qE1gtUViyxo0u+
 rk6KxwV74+/wdJbQrV92EBJDZELIrnpysXQz/Ma7X60XDYFUW29CDRLSdz8DgWedaZH1h/KnB2gc/
 FsYXNujbfbMgeIrvAEuLmK7x+7nRoiudlYkMDdxXldNdORF1y86p9yTaRAANUchpv/WFb0vG3Cdn7
 HTFSCD6rpbqnw4nJWR2heg/KA3k4O9fv/rK9Ytxrl6FieDRcia01zaCYJDYLjz4vwrEklddF0kX8R
 QahjKMbTqRUeh1opBYaXTjlfdMJiBfYeMOeCnHklO99KVBzZVOhjb7dLo7l0SxliYPqMSruITR085
 p1bA4yvA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUz-0000000AqkV-0z4n; Fri, 19 Dec 2025 18:46:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:34 -0800
Message-ID: <20251219184638.1813181-16-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h:24 Cannot find
 identifier on line: *
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h:57 struct member
 'setup_roi' not described in 'dpu_hw_wb_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h:75 struct member
 'caps' not described in 'dpu_hw_wb'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -22,11 +22,11 @@ struct dpu_hw_wb_cfg {
 };
 
 /**
- *
  * struct dpu_hw_wb_ops : Interface to the wb hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
  *  @setup_outaddress: setup output address from the writeback job
  *  @setup_outformat: setup output format of writeback block from writeback job
+ *  @setup_roi:       setup ROI (Region of Interest) parameters
  *  @setup_qos_lut:   setup qos LUT for writeback block based on input
  *  @setup_cdp:       setup chroma down prefetch block for writeback block
  *  @setup_clk_force_ctrl: setup clock force control
@@ -61,7 +61,7 @@ struct dpu_hw_wb_ops {
  * struct dpu_hw_wb : WB driver object
  * @hw: block hardware details
  * @idx: hardware index number within type
- * @wb_hw_caps: hardware capabilities
+ * @caps: hardware capabilities
  * @ops: function pointers
  */
 struct dpu_hw_wb {
