Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF51B55C3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04836E153;
	Thu, 23 Apr 2020 07:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A92B6E342
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 07:19:38 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6001DDB4B78D23B552C1;
 Wed, 22 Apr 2020 15:19:34 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Apr 2020
 15:19:25 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <b.zolnierkie@samsung.com>, <arnd@arndb.de>, <jrdr.linux@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] fbdev: aty: use true, false for bool variables in atyfb_base.c
Date: Wed, 22 Apr 2020 15:18:54 +0800
Message-ID: <20200422071854.513-1-yanaijie@huawei.com>
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

drivers/video/fbdev/aty/atyfb_base.c:3822:3-10: WARNING: Assignment of
0/1 to bool variable
drivers/video/fbdev/aty/atyfb_base.c:3824:3-9: WARNING: Assignment of
0/1 to bool variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/video/fbdev/aty/atyfb_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index 49d192869cf5..b0ac895e5ac9 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3819,9 +3819,9 @@ static int __init atyfb_setup(char *options)
 
 	while ((this_opt = strsep(&options, ",")) != NULL) {
 		if (!strncmp(this_opt, "noaccel", 7)) {
-			noaccel = 1;
+			noaccel = true;
 		} else if (!strncmp(this_opt, "nomtrr", 6)) {
-			nomtrr = 1;
+			nomtrr = true;
 		} else if (!strncmp(this_opt, "vram:", 5))
 			vram = simple_strtoul(this_opt + 5, NULL, 0);
 		else if (!strncmp(this_opt, "pll:", 4))
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
