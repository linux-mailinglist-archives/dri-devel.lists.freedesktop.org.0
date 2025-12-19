Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4A0CD16E9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCFD10F08A;
	Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="cspOZFUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACF910F070;
 Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ffwG/PDzB8qi5AZFiseCdmI9ljWmXWH6/j0cmPS4p1s=; b=cspOZFUITC0R3ko8yx/y3e27UG
 ujiqFFGwy9P/4DBIh/Cf6RLmXc/IoDxJmrQPPUAP0tbemKGA6rkEmKJc9K7yilK1E5ipEsdO/YnbW
 y1BI/ROJ0g00bw7uDNM/Eo26oA7fuqgY0tTW6tvVoAkf7ucv0hTfgmQUDcOGvOEoq667Y+36UWfbp
 iYigDcTB5jZMUuUc48EKZIjKJHhwcDPkzTrsVltalnr/2MrsQWQxfx5/1PucoyKWtguvOLsKWX5R4
 WzenVWhhBWyxUpV4otCd/HhsFTJSAlSrSZ/s792DkD6ajaMYNuFh25rfecVab7eutxv8cDoFnsWN+
 oodozMDg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUy-0000000AqkV-01FB; Fri, 19 Dec 2025 18:46:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc
 warnings
Date: Fri, 19 Dec 2025 10:46:30 -0800
Message-ID: <20251219184638.1813181-12-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:36 Cannot find
 identifier on line: *
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:46 Incorrect use
 of kernel-doc format: * enables vysnc generation and sets up init value of
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:53 Incorrect use
 of kernel-doc format: * disables tear check block
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:58 Incorrect use
 of kernel-doc format: * read, modify, write to either set or clear
 listening to external TE
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:65 Incorrect use
 of kernel-doc format: * Obtain current vertical line counter
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:70 Incorrect use
 of kernel-doc format: * Disable autorefresh if enabled
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:75 Incorrect use
 of kernel-doc format: * Setup dither matix for pingpong block
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:80 Incorrect use
 of kernel-doc format: * Enable DSC
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:85 Incorrect use
 of kernel-doc format: * Disable DSC
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:90 Incorrect use
 of kernel-doc format: * Setup DSC
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:93 struct member
 'connect_external_te' not described in 'dpu_hw_pingpong_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:93 struct member
 'disable_autorefresh' not described in 'dpu_hw_pingpong_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:93 struct member
 'enable_dsc' not described in 'dpu_hw_pingpong_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:93 struct member
 'disable_dsc' not described in 'dpu_hw_pingpong_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h:93 struct member
 'setup_dsc' not described in 'dpu_hw_pingpong_ops'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h |   20 +++++++-------
 1 file changed, 10 insertions(+), 10 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -34,7 +34,6 @@ struct dpu_hw_dither_cfg {
 };
 
 /**
- *
  * struct dpu_hw_pingpong_ops : Interface to the pingpong Hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
  *  @enable_tearcheck: program and enable tear check block
@@ -44,51 +43,52 @@ struct dpu_hw_dither_cfg {
  */
 struct dpu_hw_pingpong_ops {
 	/**
-	 * enables vysnc generation and sets up init value of
+	 * @enable_tearcheck: enables vysnc generation and sets up init value of
 	 * read pointer and programs the tear check cofiguration
 	 */
 	int (*enable_tearcheck)(struct dpu_hw_pingpong *pp,
 			struct dpu_hw_tear_check *cfg);
 
 	/**
-	 * disables tear check block
+	 * @disable_tearcheck: disables tear check block
 	 */
 	int (*disable_tearcheck)(struct dpu_hw_pingpong *pp);
 
 	/**
-	 * read, modify, write to either set or clear listening to external TE
+	 * @connect_external_te: read, modify, write to either set or clear
+	 * listening to external TE
 	 * @Return: 1 if TE was originally connected, 0 if not, or -ERROR
 	 */
 	int (*connect_external_te)(struct dpu_hw_pingpong *pp,
 			bool enable_external_te);
 
 	/**
-	 * Obtain current vertical line counter
+	 * @get_line_count: Obtain current vertical line counter
 	 */
 	u32 (*get_line_count)(struct dpu_hw_pingpong *pp);
 
 	/**
-	 * Disable autorefresh if enabled
+	 * @disable_autorefresh: Disable autorefresh if enabled
 	 */
 	void (*disable_autorefresh)(struct dpu_hw_pingpong *pp, uint32_t encoder_id, u16 vdisplay);
 
 	/**
-	 * Setup dither matix for pingpong block
+	 * @setup_dither: Setup dither matix for pingpong block
 	 */
 	void (*setup_dither)(struct dpu_hw_pingpong *pp,
 			struct dpu_hw_dither_cfg *cfg);
 	/**
-	 * Enable DSC
+	 * @enable_dsc: Enable DSC
 	 */
 	int (*enable_dsc)(struct dpu_hw_pingpong *pp);
 
 	/**
-	 * Disable DSC
+	 * @disable_dsc: Disable DSC
 	 */
 	void (*disable_dsc)(struct dpu_hw_pingpong *pp);
 
 	/**
-	 * Setup DSC
+	 * @setup_dsc: Setup DSC
 	 */
 	int (*setup_dsc)(struct dpu_hw_pingpong *pp);
 };
