Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0343762F0AF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 10:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3E810E201;
	Fri, 18 Nov 2022 09:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 352 seconds by postgrey-1.36 at gabe;
 Fri, 18 Nov 2022 09:12:41 UTC
Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
 by gabe.freedesktop.org (Postfix) with ESMTP id 89D9510E201
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:12:41 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id CD3DE1E80D9F;
 Fri, 18 Nov 2022 16:58:49 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k8SQIVuQR-0f; Fri, 18 Nov 2022 16:58:47 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
 (Authenticated sender: yuzhe@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 51EE31E80D70;
 Fri, 18 Nov 2022 16:58:40 +0800 (CST)
From: Yu Zhe <yuzhe@nfschina.com>
To: deller@gmx.de
Subject: [PATCH] video: fbdev: fix spelling mistake "paramaters"->"parameters"
Date: Fri, 18 Nov 2022 17:00:50 +0800
Message-Id: <20221118090050.22148-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
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
Cc: linux-fbdev@vger.kernel.org, Yu Zhe <yuzhe@nfschina.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, liqiong@nfschina.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in comment. Fix it.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 drivers/video/fbdev/controlfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 6bbcd9fc864e..77dbf94aae5f 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -376,7 +376,7 @@ static int read_control_sense(struct fb_info_control *p)
 #define CONTROL_PIXCLOCK_MIN	5000	/* ~ 200 MHz dot clock */
 
 /*
- * calculate the clock paramaters to be sent to CUDA according to given
+ * calculate the clock parameters to be sent to CUDA according to given
  * pixclock in pico second.
  */
 static int calc_clock_params(unsigned long clk, unsigned char *param)
-- 
2.11.0

