Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B99577CF8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B0391A87;
	Mon, 18 Jul 2022 08:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A783A0994
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 01:54:02 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LmQ2C1Nc9zlVll;
 Mon, 18 Jul 2022 09:52:19 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Jul 2022 09:53:58 +0800
Received: from huawei.com (10.174.179.164) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 18 Jul
 2022 09:53:57 +0800
From: Liu Zixian <liuzixian4@huawei.com>
To: <maxime@cerno.tech>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: correct comments
Date: Mon, 18 Jul 2022 09:53:57 +0800
Message-ID: <20220718015357.1722-1-liuzixian4@huawei.com>
X-Mailer: git-send-email 2.29.2.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.179.164]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 18 Jul 2022 08:00:04 +0000
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
Cc: linfeilong@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On failure, these functions return error pointer, not NULL.

Signed-off-by: Liu Zixian <liuzixian4@huawei.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 include/drm/drm_gem_shmem_helper.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8ad0e0299..05ca028dd 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -662,7 +662,7 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
  * drm_gem_shmem_get_pages_sgt() instead.
  *
  * Returns:
- * A pointer to the scatter/gather table of pinned pages or NULL on failure.
+ * A pointer to the scatter/gather table of pinned pages or error pointer on failure.
  */
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 {
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index d0a57853c..a2201b248 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -210,7 +210,7 @@ static inline void drm_gem_shmem_object_unpin(struct drm_gem_object *obj)
  * use it as their &drm_gem_object_funcs.get_sg_table handler.
  *
  * Returns:
- * A pointer to the scatter/gather table of pinned pages or NULL on failure.
+ * A pointer to the scatter/gather table of pinned pages or error pointer on failure.
  */
 static inline struct sg_table *drm_gem_shmem_object_get_sg_table(struct drm_gem_object *obj)
 {
-- 
2.33.0

