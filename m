Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A283A9045
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 06:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8597D6E4B7;
	Wed, 16 Jun 2021 04:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1063 seconds by postgrey-1.36 at gabe;
 Wed, 16 Jun 2021 04:01:50 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FEB6E4B7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 04:01:50 +0000 (UTC)
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G4WCj586Vz6y6w;
 Wed, 16 Jun 2021 11:40:01 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.62) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 16 Jun 2021 11:44:00 +0800
From: Yu Jiahua <yujiahua1@huawei.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.co>, <robert.foss@linaro.org>, 
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drivers: gpu: add missing MODULE_DEVICE_TABLE in
 anx7625.c
Date: Tue, 15 Jun 2021 19:44:48 -0800
Message-ID: <20210616034448.34919-1-yujiahua1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.62]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yujiahua1@huawei.com, hsinyi@chromium.org, sam@ravnborg.org,
 xji@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Signed-off-by: Yu Jiahua <yujiahua1@huawei.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 65cc05982f82..beb01364af4d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1830,6 +1830,7 @@ static const struct of_device_id anx_match_table[] = {
 	{.compatible = "analogix,anx7625",},
 	{},
 };
+MODULE_DEVICE_TABLE(of, anx_match_table);
 
 static struct i2c_driver anx7625_driver = {
 	.driver = {
-- 
2.17.1

