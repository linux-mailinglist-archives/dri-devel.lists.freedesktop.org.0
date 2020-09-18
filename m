Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E23270BF4
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED076E1A8;
	Sat, 19 Sep 2020 08:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFAF6ECCC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 09:55:30 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BB7F4FADDBC7584C58BF;
 Fri, 18 Sep 2020 17:55:28 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Fri, 18 Sep 2020 17:55:22 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <christian.koenig@amd.com>, <ray.huang@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: update kernel-doc line comments
Date: Fri, 18 Sep 2020 17:52:58 +0800
Message-ID: <1600422778-888-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update kernel-doc line comments to fix warnings reported by make W=1.

drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
member 'glob' not described in 'ttm_shrink'
drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
member 'from_wq' not described in 'ttm_shrink'
drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
member 'extra' not described in 'ttm_shrink'
drivers/gpu/drm/ttm/ttm_memory.c:271: warning: Function parameter or
member 'ctx' not described in 'ttm_shrink'

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/ttm/ttm_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_memory.c
index acd63b7..0b51773 100644
--- a/drivers/gpu/drm/ttm/ttm_memory.c
+++ b/drivers/gpu/drm/ttm/ttm_memory.c
@@ -259,7 +259,7 @@ static bool ttm_zones_above_swap_target(struct ttm_mem_global *glob,
 	return false;
 }
 
-/**
+/*
  * At this point we only support a single shrink callback.
  * Extend this if needed, perhaps using a linked list of callbacks.
  * Note that this function is reentrant:
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
