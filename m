Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7E75B863C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 12:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFF310E8E5;
	Wed, 14 Sep 2022 10:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A9E10E8E5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 10:23:19 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R571e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VPn2vi9_1663150986; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VPn2vi9_1663150986) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 18:23:16 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: deller@gmx.de
Subject: [PATCH] video: fbdev: controlfb: Remove the unused function
 VAR_MATCH()
Date: Wed, 14 Sep 2022 18:22:59 +0800
Message-Id: <20220914102301.87981-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 linux-fbdev@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function VAR_MATCH is defined in the controlfb.c file, but not
called elsewhere, so delete this unused function.

drivers/video/fbdev/controlfb.c:111:19: warning: unused function 'VAR_MATCH'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2153
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/video/fbdev/controlfb.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index aba46118b208..6bbcd9fc864e 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -108,13 +108,6 @@ static inline int PAR_EQUAL(struct fb_par_control *x, struct fb_par_control *y)
 	return (!DIRTY(cmode) && !DIRTY(xres) && !DIRTY(yres)
 		&& !DIRTY(vxres) && !DIRTY(vyres));
 }
-static inline int VAR_MATCH(struct fb_var_screeninfo *x, struct fb_var_screeninfo *y)
-{
-	return (!DIRTY(bits_per_pixel) && !DIRTY(xres)
-		&& !DIRTY(yres) && !DIRTY(xres_virtual)
-		&& !DIRTY(yres_virtual)
-		&& !DIRTY_CMAP(red) && !DIRTY_CMAP(green) && !DIRTY_CMAP(blue));
-}
 
 struct fb_info_control {
 	struct fb_info		info;
-- 
2.20.1.7.g153144c

