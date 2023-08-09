Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6645D77512F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 05:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE19310E0DB;
	Wed,  9 Aug 2023 03:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05A210E0DB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 03:05:19 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RLFDq6SP3zNnN3;
 Wed,  9 Aug 2023 11:00:59 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 11:04:28 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <jonathanh@nvidia.com>, <tzimmermann@suse.de>
Subject: [PATCH -next] drm/tegra: Remove two unused function declarations
Date: Wed, 9 Aug 2023 11:02:26 +0800
Message-ID: <20230809030226.3412-1-yuehaibing@huawei.com>
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
Cc: linux-tegra@vger.kernel.org, yuehaibing@huawei.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 776dc3840367 ("drm/tegra: Move subdevice infrastructure to host1x")
removed the implementation but not the declaration.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/tegra/drm.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index f9d18e8cf6ab..ccb5d74fa227 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -120,9 +120,6 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 int host1x_client_iommu_attach(struct host1x_client *client);
 void host1x_client_iommu_detach(struct host1x_client *client);
 
-int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
-int tegra_drm_exit(struct tegra_drm *tegra);
-
 void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size, dma_addr_t *iova);
 void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
 		    dma_addr_t iova);
-- 
2.34.1

