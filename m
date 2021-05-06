Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC737530A
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 13:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306D96E128;
	Thu,  6 May 2021 11:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m176216.qiye.163.com (mail-m176216.qiye.163.com
 [59.111.176.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD476E128
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 11:29:56 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m176216.qiye.163.com (Hmail) with ESMTPA id 9AE4DC201B5;
 Thu,  6 May 2021 19:29:51 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gma500: update comment of psb_spank()
Date: Thu,  6 May 2021 19:28:51 +0800
Message-Id: <20210506112851.20315-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQkhPH1ZMHk1OTB5JTEhMTkxVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NEk6Fgw5Cz8PPEI5FjNMMTI5
 Nw8KC0lVSlVKTUlLSEtLTkJJSUlLVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFKQ0pINwY+
X-HM-Tid: 0a794170f2c9d976kuws9ae4dc201b5
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
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In commit 5c209d8056b9 ("drm/gma500: psb_spank() doesn't need it's
own file"), accel_2d.c was deleted and psb_spank() was moved into
psb_drv.c. Fix the comment here.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/gma500/psb_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 49afa577d442..d6e7c2c2c947 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -646,7 +646,7 @@ extern u32 psb_get_vblank_counter(struct drm_crtc *crtc);
 extern int psbfb_probed(struct drm_device *dev);
 extern int psbfb_remove(struct drm_device *dev,
 			struct drm_framebuffer *fb);
-/* accel_2d.c */
+/* psb_drv.c */
 extern void psb_spank(struct drm_psb_private *dev_priv);
 
 /* psb_reset.c */
-- 
2.25.1

