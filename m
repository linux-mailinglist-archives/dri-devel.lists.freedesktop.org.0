Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE359F8C6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 13:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B056910E2FD;
	Wed, 24 Aug 2022 11:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763A510E22A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 11:45:05 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R531e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VN7Mkhl_1661341497; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VN7Mkhl_1661341497) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 19:45:01 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: deller@gmx.de
Subject: [PATCH] video: fbdev: omap: Remove unnecessary print function
 dev_err()
Date: Wed, 24 Aug 2022 19:44:55 +0800
Message-Id: <20220824114455.5167-1-jiapeng.chong@linux.alibaba.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The print function dev_err() is redundant because platform_get_irq()
already prints an error.

./drivers/video/fbdev/omap/omapfb_main.c:1653:2-9: line 1653 is redundant because platform_get_irq() already prints an error.
./drivers/video/fbdev/omap/omapfb_main.c:1646:2-9: line 1646 is redundant because platform_get_irq() already prints an error.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1957
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/video/fbdev/omap/omapfb_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index fbb3af883d4d..17cda5765683 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1643,14 +1643,12 @@ static int omapfb_do_probe(struct platform_device *pdev,
 	}
 	fbdev->int_irq = platform_get_irq(pdev, 0);
 	if (fbdev->int_irq < 0) {
-		dev_err(&pdev->dev, "unable to get irq\n");
 		r = ENXIO;
 		goto cleanup;
 	}
 
 	fbdev->ext_irq = platform_get_irq(pdev, 1);
 	if (fbdev->ext_irq < 0) {
-		dev_err(&pdev->dev, "unable to get irq\n");
 		r = ENXIO;
 		goto cleanup;
 	}
-- 
2.20.1.7.g153144c

