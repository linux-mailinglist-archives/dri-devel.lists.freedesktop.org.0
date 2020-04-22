Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 336031B55CE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0FB6E15B;
	Thu, 23 Apr 2020 07:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC446E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 07:19:11 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 84F806D9E9DBBCAC755F;
 Wed, 22 Apr 2020 15:19:07 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Apr 2020
 15:18:57 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <adaplas@gmail.com>, <b.zolnierkie@samsung.com>, <yanaijie@huawei.com>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] video: fbdev: i810: use true,false for bool variables
Date: Wed, 22 Apr 2020 15:18:26 +0800
Message-ID: <20200422071826.49038-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

drivers/video/fbdev/i810/i810_main.c:1969:3-7: WARNING: Assignment of
0/1 to bool variable
drivers/video/fbdev/i810/i810_main.c:1971:3-8: WARNING: Assignment of
0/1 to bool variable
drivers/video/fbdev/i810/i810_main.c:1973:3-9: WARNING: Assignment of
0/1 to bool variable
drivers/video/fbdev/i810/i810_main.c:1975:3-7: WARNING: Assignment of
0/1 to bool variable
drivers/video/fbdev/i810/i810_main.c:2001:3-9: WARNING: Assignment of
0/1 to bool variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/video/fbdev/i810/i810_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index aa7583d963ac..13bbf7fe13bf 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -1966,13 +1966,13 @@ static int i810fb_setup(char *options)
 	
 	while ((this_opt = strsep(&options, ",")) != NULL) {
 		if (!strncmp(this_opt, "mtrr", 4))
-			mtrr = 1;
+			mtrr = true;
 		else if (!strncmp(this_opt, "accel", 5))
-			accel = 1;
+			accel = true;
 		else if (!strncmp(this_opt, "extvga", 6))
-			extvga = 1;
+			extvga = true;
 		else if (!strncmp(this_opt, "sync", 4))
-			sync = 1;
+			sync = true;
 		else if (!strncmp(this_opt, "vram:", 5))
 			vram = (simple_strtoul(this_opt+5, NULL, 0));
 		else if (!strncmp(this_opt, "voffset:", 8))
@@ -1998,7 +1998,7 @@ static int i810fb_setup(char *options)
 		else if (!strncmp(this_opt, "vsync2:", 7))
 			vsync2 = simple_strtoul(this_opt+7, NULL, 0);
 		else if (!strncmp(this_opt, "dcolor", 6))
-			dcolor = 1;
+			dcolor = true;
 		else if (!strncmp(this_opt, "ddc3", 4))
 			ddc3 = true;
 		else
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
