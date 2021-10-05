Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C654230DC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 21:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416176EC33;
	Tue,  5 Oct 2021 19:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 05 Oct 2021 19:41:05 UTC
Received: from out28-2.mail.aliyun.com (out28-2.mail.aliyun.com [115.124.28.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A366EC3C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 19:41:05 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07579427|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00686209-0.000177396-0.992961;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=amos@sietium.com; NM=1; PH=DS;
 RN=3; RT=3; SR=0; TI=SMTPD_---.LUh8Q1Q_1633462556; 
Received: from fedora..(mailfrom:amos@sietium.com
 fp:SMTPD_---.LUh8Q1Q_1633462556)
 by smtp.aliyun-inc.com(10.147.42.22); Wed, 06 Oct 2021 03:36:01 +0800
From: Amos Kong <amos@sietium.com>
To: dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	ray.huang@amd.com
Subject: [PATCH] drm/ttm_bo_api: update the description for @placement and @sg
Date: Wed,  6 Oct 2021 03:35:56 +0800
Message-Id: <38eac09bf2ddd6088cc8a126e6bc4792eaa2dc88.1633462176.git.amos@sietium.com>
X-Mailer: git-send-email 2.31.1
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

Correct the argument name of @placement and added @sg description for
ttm_bo_init() and ttm_bo_init_reserved().

Argument @flags was replaced to @placement by Jerome in commit
09855acb1c2e3779f25317ec9a8ffe1b1784a4a8

Argument @sg was added by Dave in commit
129b78bfca591e736e56a294f0e357d73d938f7e

Signed-off-by: Amos Kong <amos@sietium.com>
Cc: Jerome Glisse <jglisse@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
---
 include/drm/ttm/ttm_bo_api.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index f681bbdbc698..eb27bbee9888 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -363,9 +363,10 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
  * @bo: Pointer to a ttm_buffer_object to be initialized.
  * @size: Requested size of buffer object.
  * @type: Requested type of buffer object.
- * @flags: Initial placement flags.
+ * @placement: Initial placement for buffer object.
  * @page_alignment: Data alignment in pages.
  * @ctx: TTM operation context for memory allocation.
+ * @sg: Scatter-gather table.
  * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
  * @destroy: Destroy function. Use NULL for kfree().
  *
@@ -406,7 +407,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
  * @bo: Pointer to a ttm_buffer_object to be initialized.
  * @size: Requested size of buffer object.
  * @type: Requested type of buffer object.
- * @flags: Initial placement flags.
+ * @placement: Initial placement for buffer object.
  * @page_alignment: Data alignment in pages.
  * @interruptible: If needing to sleep to wait for GPU resources,
  * sleep interruptible.
@@ -414,6 +415,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
  * holds a pointer to a persistent shmem object. Typically, this would
  * point to the shmem object backing a GEM object if TTM is used to back a
  * GEM user interface.
+ * @sg: Scatter-gather table.
  * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
  * @destroy: Destroy function. Use NULL for kfree().
  *
-- 
2.31.1

