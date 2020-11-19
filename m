Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A443B2B8D27
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EBB6E529;
	Thu, 19 Nov 2020 08:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2655789AAD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:30:10 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.125])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id C68FB4E17D8;
 Thu, 19 Nov 2020 15:30:05 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] via/via_irq: use __func__ to replace string function name
Date: Wed, 18 Nov 2020 23:29:55 -0800
Message-Id: <20201119072957.108941-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHhlJHUxJQhlDQ0hNVkpNS05MTEpLS05CQ0lVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDo6OQw6Sz8tPw0xPkg2Vk8q
 ThMwFENVSlVKTUtOTExKS0tNSEJKVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSkxITjcG
X-HM-Tid: 0a75df690fd89376kuwsc68fb4e17d8
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change also fix checkpatch.pl warning:
WARNING: Prefer using '"%s...", __func__' to using
'via_driver_irq_postinstall', this function's name, in a string
+	DRM_DEBUG("via_driver_irq_postinstall\n");

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/via/via_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/via/via_irq.c b/drivers/gpu/drm/via/via_irq.c
index 24cc445169e2..56ce5d4ee24a 100644
--- a/drivers/gpu/drm/via/via_irq.c
+++ b/drivers/gpu/drm/via/via_irq.c
@@ -308,7 +308,7 @@ int via_driver_irq_postinstall(struct drm_device *dev)
 	drm_via_private_t *dev_priv = (drm_via_private_t *) dev->dev_private;
 	u32 status;
 
-	DRM_DEBUG("via_driver_irq_postinstall\n");
+	DRM_DEBUG("fun: %s\n", __func__);
 	if (!dev_priv)
 		return -EINVAL;
 
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
