Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E778C96866C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 13:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18FC10E2AB;
	Mon,  2 Sep 2024 11:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3EB10E2A5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 11:41:48 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wy6D11G1Qz69M6;
 Mon,  2 Sep 2024 19:36:49 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
 by mail.maildlp.com (Postfix) with ESMTPS id 840E6180087;
 Mon,  2 Sep 2024 19:41:44 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 2 Sep
 2024 19:41:44 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
 <mperttunen@nvidia.com>, <jonathanh@nvidia.com>, <liaochen4@huawei.com>
Subject: [PATCH -next 2/3] drm/tegra: Enable module autoloading
Date: Mon, 2 Sep 2024 11:33:19 +0000
Message-ID: <20240902113320.903147-3-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902113320.903147-1-liaochen4@huawei.com>
References: <20240902113320.903147-1-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.77]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500020.china.huawei.com (7.185.36.49)
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

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/gpu/drm/tegra/drm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 03d1c76aec2d..1a12f2eaad86 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1390,6 +1390,7 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra234-nvdec", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, host1x_drm_subdevs);
 
 static struct host1x_driver host1x_drm_driver = {
 	.driver = {
-- 
2.34.1

