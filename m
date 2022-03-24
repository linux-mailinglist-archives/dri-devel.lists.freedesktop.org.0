Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C456A4E6FA3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 09:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18C810E1F1;
	Fri, 25 Mar 2022 08:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE3D110E868
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 09:07:38 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 24 Mar
 2022 17:07:29 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 24 Mar
 2022 17:07:29 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <patrik.r.jakobsson@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm: gma500: clean up some style problems reported by
 checkpatch.pl
Date: Thu, 24 Mar 2022 17:07:28 +0800
Message-ID: <1648112848-29052-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-125.meizu.com (172.16.1.125) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Fri, 25 Mar 2022 08:49:35 +0000
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
Cc: Haowen Bai <baihaowen@meizu.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WARNING: Statements should start on a tabstop

WARNING: Missing a blank line after declarations

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/gpu/drm/gma500/mid_bios.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index 7e76790..71942c2 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -50,8 +50,8 @@ static void mid_get_fuse_settings(struct drm_device *dev)
 	DRM_INFO("internal display is %s\n",
 		 dev_priv->iLVDS_enable ? "LVDS display" : "MIPI display");
 
-	 /* Prevent runtime suspend at start*/
-	 if (dev_priv->iLVDS_enable) {
+	/* Prevent runtime suspend at start*/
+	if (dev_priv->iLVDS_enable) {
 		dev_priv->is_lvds_on = true;
 		dev_priv->is_mipi_on = false;
 	} else {
@@ -325,6 +325,7 @@ static void mid_get_vbt_data(struct drm_psb_private *dev_priv)
 int mid_chip_setup(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
 	mid_get_fuse_settings(dev);
 	mid_get_vbt_data(dev_priv);
 	mid_get_pci_revID(dev_priv);
-- 
2.7.4

