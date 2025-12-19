Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724DCCD16DD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F83210F080;
	Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="sqiqU2Qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD4310F077;
 Fri, 19 Dec 2025 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YXj+2VB+qykXGnoBqXu0bdo0Nqyv/wpG5dksHagKeVM=; b=sqiqU2QpO2Jatw/6I2CyaS8LHA
 tvbugIYGLCpE5WsbQls6GLDMpznBW6TtzjYM0fFhDJ1SFO5OGken5ha2yQPfDkecybuVYD+QYw5I+
 2Uw/HNcGG3nWJMAp0651s3Ql8FLpIn/fEWt4ZkpWAxQVl1IhZfUXb8tESIapNW5IfuoqqmrCr5dks
 dwcYfjJ/aab8nieDFQ/5BOTM8mkFPL2zSQCneilOnmLx++oDimx/gt7MGKS9Z6Zr5ayhElznlqkRa
 4DyhmXkt42IAxYAlbFYSJ5B4gtZyIusGgff70xzIFWWKul9SFOrnn6B9hgMCyIVnQKt43OXo+c0cI
 vCKw35yw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUw-0000000AqkV-3HO8; Fri, 19 Dec 2025 18:46:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:26 -0800
Message-ID: <20251219184638.1813181-8-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h:33 expecting prototype
 for struct dpu_hw_pcc. Prototype was for struct dpu_hw_pcc_cfg instead
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h:42 Incorrect use of
 kernel-doc format: * setup_pcc - setup dspp pcc
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h:48 struct member
 'setup_pcc' not described in 'dpu_hw_dspp_ops'
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h:76 expecting prototype
 for dpu_hw_dspp(). Prototype was for to_dpu_hw_dspp() instead

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -22,7 +22,7 @@ struct dpu_hw_pcc_coeff {
 };
 
 /**
- * struct dpu_hw_pcc - pcc feature structure
+ * struct dpu_hw_pcc_cfg - pcc feature structure
  * @r: red coefficients.
  * @g: green coefficients.
  * @b: blue coefficients.
@@ -40,7 +40,7 @@ struct dpu_hw_pcc_cfg {
  */
 struct dpu_hw_dspp_ops {
 	/**
-	 * setup_pcc - setup dspp pcc
+	 * @setup_pcc: setup_pcc - setup dspp pcc
 	 * @ctx: Pointer to dspp context
 	 * @cfg: Pointer to configuration
 	 */
@@ -69,7 +69,7 @@ struct dpu_hw_dspp {
 };
 
 /**
- * dpu_hw_dspp - convert base object dpu_hw_base to container
+ * to_dpu_hw_dspp - convert base object dpu_hw_base to container
  * @hw: Pointer to base hardware block
  * return: Pointer to hardware block container
  */
