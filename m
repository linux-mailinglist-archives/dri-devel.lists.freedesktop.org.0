Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B975D37F47E
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 10:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76316E854;
	Thu, 13 May 2021 08:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93716E845
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 07:23:41 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FgjjX661NzqTXR;
 Thu, 13 May 2021 15:20:16 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Thu, 13 May 2021
 15:23:36 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next 4/4] drm/radeon/radeon_vm: correct function names in
 radeon_vm.c
Date: Thu, 13 May 2021 15:25:59 +0800
Message-ID: <20210513072559.1731410-5-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513072559.1731410-1-yangyingliang@huawei.com>
References: <20210513072559.1731410-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 13 May 2021 08:56:28 +0000
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following make W=1 kernel build warnings:

  drivers/gpu/drm/radeon/radeon_vm.c:61: warning: expecting prototype for radeon_vm_num_pde(). Prototype was for radeon_vm_num_pdes() instead
  drivers/gpu/drm/radeon/radeon_vm.c:642: warning: expecting prototype for radeon_vm_update_pdes(). Prototype was for radeon_vm_update_page_directory() instead

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/radeon/radeon_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index 2dc9c9f98049..36a38adaaea9 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -51,7 +51,7 @@
  */
 
 /**
- * radeon_vm_num_pde - return the number of page directory entries
+ * radeon_vm_num_pdes - return the number of page directory entries
  *
  * @rdev: radeon_device pointer
  *
@@ -626,7 +626,7 @@ static uint32_t radeon_vm_page_flags(uint32_t flags)
 }
 
 /**
- * radeon_vm_update_pdes - make sure that page directory is valid
+ * radeon_vm_update_page_directory - make sure that page directory is valid
  *
  * @rdev: radeon_device pointer
  * @vm: requested vm
-- 
2.25.1

