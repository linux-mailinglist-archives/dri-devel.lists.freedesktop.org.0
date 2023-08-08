Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F74773ADA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 17:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643B410E1EC;
	Tue,  8 Aug 2023 15:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1095110E3E5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 15:07:37 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RKxKc0jjNzNmvf;
 Tue,  8 Aug 2023 23:04:04 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 23:07:32 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <kong.kongxinwei@hisilicon.com>, <sumit.semwal@linaro.org>,
 <yongqin.liu@linaro.org>, <jstultz@google.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH -next] drm/hisilicon: Remove unused function declaration
 hibmc_mm_init()
Date: Tue, 8 Aug 2023 23:07:31 +0800
Message-ID: <20230808150731.35264-1-yuehaibing@huawei.com>
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
Cc: yuehaibing@huawei.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 552a77bab3ff ("drm/hisilicon: Delete the entire file hibmc_ttm.c")
removed the implementation but leave declaration.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index f957552c6c50..a95fe13aefff 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -57,8 +57,6 @@ void hibmc_set_current_gate(struct hibmc_drm_private *priv,
 
 int hibmc_de_init(struct hibmc_drm_private *priv);
 int hibmc_vdac_init(struct hibmc_drm_private *priv);
-
-int hibmc_mm_init(struct hibmc_drm_private *hibmc);
 int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_connector *connector);
 
 #endif
-- 
2.34.1

