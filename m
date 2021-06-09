Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D203A1BB3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60A56E9E6;
	Wed,  9 Jun 2021 17:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C16E6E9C2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:23:15 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 9 Jun 2021 10:23:12 -0700
Received: from vertex.localdomain (unknown [10.21.244.178])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 5A38E2024D;
 Wed,  9 Jun 2021 10:23:14 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 9/9] drm/vmwgfx: Fix implicit declaration error
Date: Wed, 9 Jun 2021 13:23:07 -0400
Message-ID: <20210609172307.131929-10-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609172307.131929-1-zackr@vmware.com>
References: <20210609172307.131929-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>, Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The declarations of ttm_range_man_init and ttm_range_man_fini
have been moved to ttm_range_manager.h so we have to add it
to the include list.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: 3eb7d96e9415 ("drm/ttm: flip over the range manager to self allocated nodes")
Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index d51f215bd715..48a62fb0da2f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -36,6 +36,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_sysfs.h>
 #include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_placement.h>
 #include <generated/utsrelease.h>
 
-- 
2.30.2

