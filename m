Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3294B26DD7C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14EB6E2A5;
	Thu, 17 Sep 2020 14:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428A36E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 09:20:57 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D238686AB85E77F6F371;
 Thu, 17 Sep 2020 17:20:49 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 17:20:39 +0800
From: Xiaofei Tan <tanxiaofei@huawei.com>
To: <b.zolnierkie@samsung.com>, <sam@ravnborg.org>, <arnd@arndb.de>,
 <laurent.pinchart@ideasonboard.com>, <jani.nikula@intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] fbdev: mx3fb: remove unused variable 'irq'
Date: Thu, 17 Sep 2020 17:19:20 +0800
Message-ID: <1600334360-4214-1-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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
Cc: Xiaofei Tan <tanxiaofei@huawei.com>, linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the variable 'irq' that is set but never used.

Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
---
 drivers/video/fbdev/mx3fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index 603731a..894617d 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -1428,7 +1428,6 @@ static int init_fb_chan(struct mx3fb_data *mx3fb, struct idmac_channel *ichan)
 	struct device *dev = mx3fb->dev;
 	struct mx3fb_platform_data *mx3fb_pdata = dev_get_platdata(dev);
 	const char *name = mx3fb_pdata->name;
-	unsigned int irq;
 	struct fb_info *fbi;
 	struct mx3fb_info *mx3fbi;
 	const struct fb_videomode *mode;
@@ -1441,7 +1440,6 @@ static int init_fb_chan(struct mx3fb_data *mx3fb, struct idmac_channel *ichan)
 	}
 
 	ichan->client = mx3fb;
-	irq = ichan->eof_irq;
 
 	if (ichan->dma_chan.chan_id != IDMAC_SDC_0)
 		return -EINVAL;
-- 
2.8.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
