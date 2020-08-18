Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51611247FF2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B4689DB9;
	Tue, 18 Aug 2020 07:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83F389D46
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 06:54:00 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 248A3B2E10C626655782;
 Tue, 18 Aug 2020 14:53:56 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 18 Aug 2020 14:53:49 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon 2/4] drm/hisilicon: Use drv_err instead of
 DRM_ERROR in hibmc_drm_vdac
Date: Tue, 18 Aug 2020 14:51:42 +0800
Message-ID: <1597733504-30812-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597733504-30812-1-git-send-email-tiantao6@hisilicon.com>
References: <1597733504-30812-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drv_err instead of DRM_ERROR in hibmc_drm_vdac

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index ed12f61..376a05d 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -85,7 +85,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 	ret = drm_encoder_init(dev, encoder, &hibmc_encoder_funcs,
 			       DRM_MODE_ENCODER_DAC, NULL);
 	if (ret) {
-		DRM_ERROR("failed to init encoder: %d\n", ret);
+		drm_err(dev, "failed to init encoder: %d\n", ret);
 		return ret;
 	}
 
@@ -94,7 +94,7 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 	ret = drm_connector_init(dev, connector, &hibmc_connector_funcs,
 				 DRM_MODE_CONNECTOR_VGA);
 	if (ret) {
-		DRM_ERROR("failed to init connector: %d\n", ret);
+		drm_err(dev, "failed to init connector: %d\n", ret);
 		return ret;
 	}
 	drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
