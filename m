Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0E265CEE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4E66E9AB;
	Fri, 11 Sep 2020 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2AE6E0CB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 14:06:33 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 79844F2DCA6CBF645C48;
 Thu, 10 Sep 2020 22:06:21 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 22:06:14 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <thomas@winischhofer.net>, <b.zolnierkie@samsung.com>,
 <yanaijie@huawei.com>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] video: fbdev: sis: remove unneeded semicolon
Date: Thu, 10 Sep 2020 22:05:36 +0800
Message-ID: <20200910140536.1191150-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the following coccicheck warning:

drivers/video/fbdev/sis/sis_accel.h:143:72-73: Unneeded semicolon
drivers/video/fbdev/sis/sis_accel.h:144:72-73: Unneeded semicolon
drivers/video/fbdev/sis/sis_accel.h:145:72-73: Unneeded semicolon
drivers/video/fbdev/sis/sis_accel.h:273:75-76: Unneeded semicolon
drivers/video/fbdev/sis/sis_accel.h:274:75-76: Unneeded semicolon
drivers/video/fbdev/sis/sis_accel.h:275:73-74: Unneeded semicolon
drivers/video/fbdev/sis/sis_accel.h:276:75-76: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/video/fbdev/sis/sis_accel.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis_accel.h b/drivers/video/fbdev/sis/sis_accel.h
index c3dfd2a20cf9..98d209658662 100644
--- a/drivers/video/fbdev/sis/sis_accel.h
+++ b/drivers/video/fbdev/sis/sis_accel.h
@@ -140,9 +140,9 @@
 
 #define SiS300Idle \
   { \
-  	while((MMIO_IN16(ivideo->mmio_vbase, BR(16)+2) & 0xE000) != 0xE000){}; \
-  	while((MMIO_IN16(ivideo->mmio_vbase, BR(16)+2) & 0xE000) != 0xE000){}; \
-  	while((MMIO_IN16(ivideo->mmio_vbase, BR(16)+2) & 0xE000) != 0xE000){}; \
+	while((MMIO_IN16(ivideo->mmio_vbase, BR(16)+2) & 0xE000) != 0xE000){} \
+	while((MMIO_IN16(ivideo->mmio_vbase, BR(16)+2) & 0xE000) != 0xE000){} \
+	while((MMIO_IN16(ivideo->mmio_vbase, BR(16)+2) & 0xE000) != 0xE000){} \
   	CmdQueLen = MMIO_IN16(ivideo->mmio_vbase, 0x8240); \
   }
 /* (do three times, because 2D engine seems quite unsure about whether or not it's idle) */
@@ -270,10 +270,10 @@
 
 #define SiS310Idle \
   { \
-  	while( (MMIO_IN16(ivideo->mmio_vbase, Q_STATUS+2) & 0x8000) != 0x8000){}; \
-  	while( (MMIO_IN16(ivideo->mmio_vbase, Q_STATUS+2) & 0x8000) != 0x8000){}; \
-	while( (MMIO_IN16(ivideo->mmio_vbase, Q_STATUS+2) & 0x8000) != 0x8000){}; \
-  	while( (MMIO_IN16(ivideo->mmio_vbase, Q_STATUS+2) & 0x8000) != 0x8000){}; \
+	while( (MMIO_IN16(ivideo->mmio_vbase, Q_STATUS+2) & 0x8000) != 0x8000){} \
+	while( (MMIO_IN16(ivideo->mmio_vbase, Q_STATUS+2) & 0x8000) != 0x8000){} \
+	while( (MMIO_IN16(ivideo->mmio_vbase, Q_STATUS+2) & 0x8000) != 0x8000){} \
+	while( (MMIO_IN16(ivideo->mmio_vbase, Q_STATUS+2) & 0x8000) != 0x8000){} \
   	CmdQueLen = 0; \
   }
 
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
