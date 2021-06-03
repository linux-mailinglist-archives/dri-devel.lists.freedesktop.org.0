Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203EC399C30
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 09:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAA86E0AA;
	Thu,  3 Jun 2021 07:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CEE56E0AA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 07:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=MG1lq
 JY+aPmdBeo5Cm5Dp5IGRQlMjpO0NQ3s+uGv+kQ=; b=a+XG4OMJ+CIqHv0EbzAJ+
 WDYDdmOIIf8ysFxEUcY9A28yGFGuRiUCsu6+eHsL65mKxwbL2V7YzyqYeccMqkQW
 bs7ajAK9upgk58Sm50cAelmz1ajbOMu8/BgVPyY69+uaILUZdw30ED7nvEiT/aKI
 YzWxDP1XXMQrfLRvBXB/YA=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp9 (Coremail) with SMTP id DcCowABHT7vbi7hgTcsYEQ--.16506S2;
 Thu, 03 Jun 2021 15:59:24 +0800 (CST)
From: lijian_8010a29@163.com
To: FlorianSchandinat@gmx.de
Subject: [PATCH] video: fbdev: via: viafbdev.c:  Fix a typo
Date: Thu,  3 Jun 2021 15:58:26 +0800
Message-Id: <20210603075826.64932-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowABHT7vbi7hgTcsYEQ--.16506S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF4kAw4xJF15AF1DJF48Xrb_yoWfGFX_Cr
 1kZr9rXryvvw40kryrta17uFWqyrW7ZFn3XF42gr93CFW7Zr1rZr1UZFn2qrWjgF47XFyD
 Wr4agws5CryfCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUe5UUUUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbi3xymUGB0GawFEgAAsD
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lijian <lijian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lijian <lijian@yulong.com>

Change 'ouput' to 'output'.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/video/fbdev/via/viafbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index 22deb340a048..86a8f080bb97 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -766,7 +766,7 @@ static int viafb_cursor(struct fb_info *info, struct fb_cursor *cursor)
 	if (info->flags & FBINFO_HWACCEL_DISABLED || info != viafbinfo)
 		return -ENODEV;
 
-	/* LCD ouput does not support hw cursors (at least on VN896) */
+	/* LCD output does not support hw cursors (at least on VN896) */
 	if ((chip_name == UNICHROME_CLE266 && viapar->iga_path == IGA2) ||
 		viafb_LCD_ON)
 		return -ENODEV;
-- 
2.25.1


