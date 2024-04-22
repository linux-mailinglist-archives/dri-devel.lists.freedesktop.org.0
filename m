Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D0A8AD42E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 20:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5655112CD9;
	Mon, 22 Apr 2024 18:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="bKcDkwV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCDF10FD5D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 18:46:04 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713811562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwhTRGcgO4r+0jygil58EKFMf8jk2PflSWuwh+0+9vw=;
 b=bKcDkwV0P+EIwJr0piI648JPdmKFtfNPz+qHAu/8kuc/JLpJyQGjFdPwYQhijWYCY0+m+3
 JOHwNwUjv1z81yyJ7gu0twnhVh5Y0Kb/VX6ZO/OuXu/yAxwHjAaNmx9ocENcLKmUeSenZg
 9tTQenhQWCMLCYycB6/+md+R80bhE6g=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v3 02/13] drm: xlnx: Fix kerneldoc
Date: Mon, 22 Apr 2024 14:45:42 -0400
Message-Id: <20240422184553.3573009-3-sean.anderson@linux.dev>
In-Reply-To: <20240422184553.3573009-1-sean.anderson@linux.dev>
References: <20240422184553.3573009-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Fix a few errors in the kerneldoc. Mostly this addresses missing/renamed
members.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v3:
- Split off documentation for base pointers to previous commit

Changes in v2:
- New

 drivers/gpu/drm/xlnx/zynqmp_dpsub.h | 1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.h   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 09ea01878f2a..b18554467e9c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -53,6 +53,7 @@ enum zynqmp_dpsub_format {
  * @drm: The DRM/KMS device data
  * @bridge: The DP encoder bridge
  * @disp: The display controller
+ * @layers: Video and graphics layers
  * @dp: The DisplayPort controller
  * @dma_align: DMA alignment constraint (must be a power of 2)
  */
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.h b/drivers/gpu/drm/xlnx/zynqmp_kms.h
index 01be96b00e3f..cb13c6b8008e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.h
@@ -22,9 +22,9 @@
 struct zynqmp_dpsub;
 
 /**
- * struct zynqmp_dpsub - ZynqMP DisplayPort Subsystem DRM/KMS data
+ * struct zynqmp_dpsub_drm - ZynqMP DisplayPort Subsystem DRM/KMS data
  * @dpsub: Backpointer to the DisplayPort subsystem
- * @drm: The DRM/KMS device
+ * @dev: The DRM/KMS device
  * @planes: The DRM planes
  * @crtc: The DRM CRTC
  * @encoder: The dummy DRM encoder
-- 
2.35.1.1320.gc452695387.dirty

