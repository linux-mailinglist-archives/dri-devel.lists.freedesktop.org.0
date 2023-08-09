Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E23B7761E5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 15:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF7C10E444;
	Wed,  9 Aug 2023 13:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F7C10E444
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 13:59:27 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RLWq767GJz15NVd;
 Wed,  9 Aug 2023 21:58:11 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 21:59:22 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <christian.koenig@amd.com>, <ray.huang@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/ttm: Remove two unused function declarations
Date: Wed, 9 Aug 2023 21:58:39 +0800
Message-ID: <20230809135839.13216-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit cd3a8a596214 ("drm/ttm: remove ttm_bo_(un)lock_delayed_workqueue")
removed the implementations but not the declarations.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 include/drm/ttm/ttm_bo.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 8b113c384236..0223a41a64b2 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -355,8 +355,6 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 void ttm_bo_put(struct ttm_buffer_object *bo);
 void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
 			  struct ttm_lru_bulk_move *bulk);
-int ttm_bo_lock_delayed_workqueue(struct ttm_device *bdev);
-void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resched);
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place);
 int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
-- 
2.34.1

