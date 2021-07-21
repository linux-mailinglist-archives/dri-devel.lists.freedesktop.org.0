Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0D3D065F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 03:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0A389C60;
	Wed, 21 Jul 2021 01:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jul 2021 01:23:58 UTC
Received: from qq.com (unknown [183.3.255.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB9789C60;
 Wed, 21 Jul 2021 01:23:58 +0000 (UTC)
X-QQ-mid: bizesmtp43t1626830166tcfq04q1
Received: from localhost.localdomain (unknown [111.207.172.18])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 21 Jul 2021 09:16:05 +0800 (CST)
X-QQ-SSF: 00400000008000209000B00A0000000
X-QQ-FEAT: Bz4iJZMGBshKP32tryI7ouacP2lfin6x1ddkHk6YXAxVdMbxioWR/Ovj7cTQ6
 GUdhlecI3ZtlXk+koIbEV2HKSfpVAAWgC3IpjqM7aZqe+VCSgr0HO/quJF+xFTMz/euA1nD
 +XWShZBNQDdEn8EQCZdGKcHFVnWPzINE/FdZ88op27OLr6y7nnQiPxxBx+A5E+WqJxDuf7Q
 CH9HgVDA6G+vkSdlUImUhKwxwdjNqJ/kCTU1JD8/j3XxLTDmd2STkNFf8H+EHZqDnYLCQde
 4SlckoJT0oEmyGsp4m+PPo4DGN8YM1TzN/NQS6n5FjoOSOy6mtI3JtfY4CIMgn4gIsLWMjv
 5qKVsgk
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drivers/gpu/drm/nouveau/nouveau_bo: Remove a bunch of unused
 variables
Date: Wed, 21 Jul 2021 09:15:54 +0800
Message-Id: <20210721011554.24658-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
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
Cc: nouveau@lists.freedesktop.org, zhaoxiao <zhaoxiao@uniontech.com>,
 bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

drivers/gpu/drm/nouveau/nouveau_bo.c: In function ‘nouveau_ttm_tt_populate’:
drivers/gpu/drm/nouveau/nouveau_bo.c:1245:17: warning: variable ‘dev’ set but not used [-Wunused-but-set-variable]
  struct device *dev;
                 ^~~
drivers/gpu/drm/nouveau/nouveau_bo.c: In function ‘nouveau_ttm_tt_unpopulate’:
drivers/gpu/drm/nouveau/nouveau_bo.c:1268:17: warning: variable ‘dev’ set but not used [-Wunused-but-set-variable]
  struct device *dev;
                 ^~~
Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 4f3a5357dd56..692d63d08b5a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1242,7 +1242,7 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
 {
 	struct ttm_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
-	struct device *dev;
+
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (ttm_tt_is_populated(ttm))
@@ -1255,7 +1255,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
 	}
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
 }
@@ -1265,14 +1264,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
 			  struct ttm_tt *ttm)
 {
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (slave)
 		return;
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
 }
-- 
2.20.1



