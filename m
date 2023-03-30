Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C6E6CF8AE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 03:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F07E10ECB7;
	Thu, 30 Mar 2023 01:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C16510ECAD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 01:27:31 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R901e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VeyT95o_1680139646; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VeyT95o_1680139646) by smtp.aliyun-inc.com;
 Thu, 30 Mar 2023 09:27:27 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: inki.dae@samsung.com
Subject: [PATCH -next] drm: bridge: samsung-dsim: fix
 platform_no_drv_owner.cocci warning
Date: Thu, 30 Mar 2023 09:27:25 +0800
Message-Id: <20230330012725.124031-1-yang.lee@linux.alibaba.com>
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
Cc: neil.armstrong@linaro.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yang Li <yang.lee@linux.alibaba.com>, jagan@amarulasolutions.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

./drivers/gpu/drm/bridge/samsung-dsim.c:1957:6-11: No need to set .owner here. The core will do it.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4640
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e0a402a85787..10dc3315e69e 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1954,7 +1954,6 @@ static struct platform_driver samsung_dsim_driver = {
 	.remove = samsung_dsim_remove,
 	.driver = {
 		   .name = "samsung-dsim",
-		   .owner = THIS_MODULE,
 		   .pm = &samsung_dsim_pm_ops,
 		   .of_match_table = samsung_dsim_of_match,
 	},
-- 
2.20.1.7.g153144c

