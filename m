Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D390294ED53
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 14:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EE110E1ED;
	Mon, 12 Aug 2024 12:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2221210E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 12:48:33 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WjDnv58zXz1T77K;
 Mon, 12 Aug 2024 20:48:03 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
 by mail.maildlp.com (Postfix) with ESMTPS id E7E86140137;
 Mon, 12 Aug 2024 20:48:30 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 12 Aug
 2024 20:48:30 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <kong.kongxinwei@hisilicon.com>, <sumit.semwal@linaro.org>,
 <yongqin.liu@linaro.org>, <jstultz@google.com>,
 <dri-devel@lists.freedesktop.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH] drm/hisilicon: Remove unused delarations
Date: Mon, 12 Aug 2024 20:35:43 +0800
Message-ID: <20240812123543.64300-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf500003.china.huawei.com (7.202.181.241)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hibmc_mm_init() has been removed since commit 28645ae064d1
("drm/hisilicon/hibmc: Remove hibmc_ttm.c"), but remain the declaration
untouched in the header files. So, let's remove this unused declaration.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index 207aa3f660b0..6b566f3aeecb 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -57,7 +57,6 @@ void hibmc_set_current_gate(struct hibmc_drm_private *priv,
 int hibmc_de_init(struct hibmc_drm_private *priv);
 int hibmc_vdac_init(struct hibmc_drm_private *priv);
 
-int hibmc_mm_init(struct hibmc_drm_private *hibmc);
 int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_connector *connector);
 
 #endif
-- 
2.17.1

