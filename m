Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4BECD16C5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CEE10F07A;
	Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="YH0q3lx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D787D10F073;
 Fri, 19 Dec 2025 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=X1zbGY0zfBb6WWPms7jFzEXFLOTz3spooobx9hnueIk=; b=YH0q3lx9ykrb+c22vFi9BD7md0
 /ALaTYExNvKG2VfKhEI30NLdJuqM8RqM6qXpW4RrennxXtPnXsThNu5DPCvdlLKnn1pG1W6CRUWuq
 whmG9HGrJvu5/C1L70m47OiNnSq0dxz44VRLbTsm0/qGhrISqZ/rmzuvdMxxniEcwEmoKE2d2JHd9
 RVauxsevAZacLaVqg4gc4aEYBdyL8h2pNvBvsWdVtMHNPE8x+uN/JdcGb2VHta6eo6SnDOD/tScXA
 HglhsZbwTuaceOkylyVK9vamsl/QB3i1kOSUK/mwR6B61Q9I27hJZD26lZN/NCqJXgtiQUW5cXC8k
 a/oX/91Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUv-0000000AqkV-2R8i; Fri, 19 Dec 2025 18:46:41 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:22 -0800
Message-ID: <20251219184638.1813181-4-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h:91 Incorrect use of
 kernel-doc format:          * Enable the CDM module
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h:97 Incorrect use of
 kernel-doc format:          * Enable/disable the connection with pingpong

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
@@ -89,13 +89,13 @@ enum dpu_hw_cdwn_op_mode_method_h_v {
  */
 struct dpu_hw_cdm_ops {
 	/**
-	 * Enable the CDM module
+	 * @enable: Enable the CDM module
 	 * @cdm         Pointer to chroma down context
 	 */
 	int (*enable)(struct dpu_hw_cdm *cdm, struct dpu_hw_cdm_cfg *cfg);
 
 	/**
-	 * Enable/disable the connection with pingpong
+	 * @bind_pingpong_blk: Enable/disable the connection with pingpong
 	 * @cdm         Pointer to chroma down context
 	 * @pp          pingpong block id.
 	 */
