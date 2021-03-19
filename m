Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82513417A4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6213C6E9A9;
	Fri, 19 Mar 2021 08:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F8D6E99E;
 Fri, 19 Mar 2021 08:40:52 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0USYrtC0_1616143241; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0USYrtC0_1616143241) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 19 Mar 2021 16:40:48 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: bskeggs@redhat.com
Subject: [PATCH] drm/nouveau:  Remove unused variable ret
Date: Fri, 19 Mar 2021 16:40:40 +0800
Message-Id: <1616143240-16356-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warnings:

./drivers/gpu/drm/nouveau/nouveau_bios.c:2048:5-8: Unneeded variable:
"ret". Return "0" on line 2061.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index e8c445e..41b78e9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2045,7 +2045,6 @@ static bool NVInitVBIOS(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvbios *bios = &drm->vbios;
-	int ret = 0;
 
 	/* Reset the BIOS head to 0. */
 	bios->state.crtchead = 0;
@@ -2058,7 +2057,7 @@ static bool NVInitVBIOS(struct drm_device *dev)
 		bios->fp.lvds_init_run = false;
 	}
 
-	return ret;
+	return 0;
 }
 
 static bool
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
