Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6F5BF526
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 06:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFFA10E34E;
	Wed, 21 Sep 2022 04:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAFA10E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 04:08:43 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 28L3ktid031000;
 Wed, 21 Sep 2022 11:46:55 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 21 Sep 2022 12:07:44 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <john.stultz@linaro.org>, <kong.kongxinwei@hisilicon.com>,
 <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <javierm@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/hisilicon/kirin: Fix typo in kirin_drm_drv.c
Date: Wed, 21 Sep 2022 12:08:01 +0800
Message-ID: <20220921040801.13537-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 28L3ktid031000
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

'config_max_height' should be used for 'max_height'.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 2af51df6dca7..b23ad03157e1 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -165,7 +165,7 @@ static int kirin_drm_kms_init(struct drm_device *dev,
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 	dev->mode_config.max_width = driver_data->config_max_width;
-	dev->mode_config.max_height = driver_data->config_max_width;
+	dev->mode_config.max_height = driver_data->config_max_height;
 	dev->mode_config.funcs = driver_data->mode_config_funcs;
 
 	/* display controller init */
-- 
2.25.1

