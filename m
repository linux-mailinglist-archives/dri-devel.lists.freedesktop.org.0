Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFEF350553
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 19:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C52E6EB1F;
	Wed, 31 Mar 2021 17:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121143.qiye.163.com (mail-m121143.qiye.163.com
 [115.236.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00A26EAA1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 13:21:13 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m121143.qiye.163.com (Hmail) with ESMTPA id D1121540562;
 Wed, 31 Mar 2021 21:12:57 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ttm: cleanup coding style a bit
Date: Wed, 31 Mar 2021 06:12:51 -0700
Message-Id: <20210331131251.60883-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGEIdQ0xPTxlPGkMfVkpNSkxKQk1ITENLTUpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K006Szo4HD8IFjUYNy8ONFYw
 GBVPCRhVSlVKTUpMSkJNSExDSE1IVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFKQk1JNwY+
X-HM-Tid: 0a78886a678ab038kuuud1121540562
X-Mailman-Approved-At: Wed, 31 Mar 2021 17:21:40 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix sparse warning:
drivers/gpu/drm/ttm/ttm_bo.c:52:1: warning: symbol 'ttm_global_mutex' was not declared. Should it be static?
drivers/gpu/drm/ttm/ttm_bo.c:53:10: warning: symbol 'ttm_bo_glob_use_count' was not declared. Should it be static?

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 101a68dc615b..eab21643edfb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -49,8 +49,8 @@ static void ttm_bo_global_kobj_release(struct kobject *kobj);
 /*
  * ttm_global_mutex - protecting the global BO state
  */
-DEFINE_MUTEX(ttm_global_mutex);
-unsigned ttm_bo_glob_use_count;
+static DEFINE_MUTEX(ttm_global_mutex);
+static unsigned int ttm_bo_glob_use_count;
 struct ttm_bo_global ttm_bo_glob;
 EXPORT_SYMBOL(ttm_bo_glob);
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
