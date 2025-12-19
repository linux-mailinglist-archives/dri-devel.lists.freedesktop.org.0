Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34177CD16E3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4E010F085;
	Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="VDDu7pYL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D3810F076;
 Fri, 19 Dec 2025 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GMuISuhLZlhqMv9bXZPyQ5GgapsS85Up6a86wjy0oNY=; b=VDDu7pYLy+RTa8fNVbe8KjWvbC
 E4JOzvAqAodW7TZa26CM6W2xXP6s6+rhJPvvIaS9RinL27wW6IqvYaA/apFV39MZtWz/tUxzu2Dm+
 E9lBircAPtK+TQBATTynEDS+Tb61BVjtGT7PKzzRVlfZfsiimCKRwWYy3w5j+Ohb8Zvppun9ZlPC6
 vhZvIVGeKAbYAaCunnZuDR5C//M6li/H0XMPF635xX4/OZaHEwOx4ZAv3DhEUNmLFNBAo/bOenEZ0
 tMFZUTGnIsDecfBgJidlKn1Q/Jg+9Walv2d4x9rjIQyWtkkrCBXtrPA+mHu4u88iTgV38GOJbiOfe
 dlnyTM2g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUw-0000000AqkV-21TJ; Fri, 19 Dec 2025 18:46:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:25 -0800
Message-ID: <20251219184638.1813181-7-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:23 Incorrect use of
 kernel-doc format: * dsc_disable - disable dsc
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:29 Incorrect use of
 kernel-doc format: * dsc_config - configures dsc encoder
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:41 Incorrect use of
 kernel-doc format: * dsc_config_thresh - programs panel thresholds
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:50 struct member
 'dsc_disable' not described in 'dpu_hw_dsc_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:50 struct member
 'dsc_config' not described in 'dpu_hw_dsc_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:50 struct member
 'dsc_config_thresh' not described in 'dpu_hw_dsc_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h:50 struct member
 'dsc_bind_pingpong_blk' not described in 'dpu_hw_dsc_ops'

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -21,13 +21,13 @@ struct dpu_hw_dsc;
  */
 struct dpu_hw_dsc_ops {
 	/**
-	 * dsc_disable - disable dsc
+	 * @dsc_disable: disable dsc
 	 * @hw_dsc: Pointer to dsc context
 	 */
 	void (*dsc_disable)(struct dpu_hw_dsc *hw_dsc);
 
 	/**
-	 * dsc_config - configures dsc encoder
+	 * @dsc_config: configures dsc encoder
 	 * @hw_dsc: Pointer to dsc context
 	 * @dsc: panel dsc parameters
 	 * @mode: dsc topology mode to be set
@@ -39,13 +39,17 @@ struct dpu_hw_dsc_ops {
 			   u32 initial_lines);
 
 	/**
-	 * dsc_config_thresh - programs panel thresholds
+	 * @dsc_config_thresh: programs panel thresholds
 	 * @hw_dsc: Pointer to dsc context
 	 * @dsc: panel dsc parameters
 	 */
 	void (*dsc_config_thresh)(struct dpu_hw_dsc *hw_dsc,
 				  struct drm_dsc_config *dsc);
 
+	/**
+	 * @dsc_bind_pingpong_blk: binds pixel output from a DSC block
+	 * to a pingpong block
+	 */
 	void (*dsc_bind_pingpong_blk)(struct dpu_hw_dsc *hw_dsc,
 				  enum dpu_pingpong pp);
 };
