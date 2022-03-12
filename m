Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C104D6D06
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 07:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0903710E056;
	Sat, 12 Mar 2022 06:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B0E10E056
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 06:34:53 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KFtJz5LhLzBrjh;
 Sat, 12 Mar 2022 14:32:51 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Sat, 12 Mar
 2022 14:34:49 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <javierm@redhat.com>,
 <yuehaibing@huawei.com>, <maxime@cerno.tech>
Subject: [PATCH -next] drm/solomon: Make DRM_SSD130X depends on MMU
Date: Sat, 12 Mar 2022 14:34:37 +0800
Message-ID: <20220312063437.19160-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
  Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
  Selected by [m]:
  - DRM_SSD130X [=m] && HAS_IOMEM [=y] && DRM [=m]

DRM_GEM_SHMEM_HELPER depends on MMU, DRM_SSD130X should also depends on MMU.

Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/solomon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/Kconfig b/drivers/gpu/drm/solomon/Kconfig
index 5861c3ab7c45..6230369505c9 100644
--- a/drivers/gpu/drm/solomon/Kconfig
+++ b/drivers/gpu/drm/solomon/Kconfig
@@ -1,6 +1,6 @@
 config DRM_SSD130X
 	tristate "DRM support for Solomon SSD130x OLED displays"
-	depends on DRM
+	depends on DRM && MMU
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
-- 
2.17.1

