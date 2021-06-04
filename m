Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C75339B0A2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 04:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D18B6F56D;
	Fri,  4 Jun 2021 02:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by gabe.freedesktop.org (Postfix) with ESMTP id 750086F56D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 02:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=67SyH
 5ZOavcPxAra7gc1Zli3sCtHraoSINoTVQU9/8c=; b=UhpwYurjsQSIXG1Ua4f7k
 09ADijh8Jo83HH3OU3Kj3ZytS4unyBd7LUIpcgiXOQB+QygrPOzoOvZZggWpxOPY
 8j9zz6eXkRg9hGkXYukz/7W3xl5755qJO2kNeE/6AFfuFJhRjUT9qiArrL782+Uz
 RjsXumcEdG7Yc2D0ZFfYpk=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp8 (Coremail) with SMTP id DMCowAC3vQlylrlg3pK_Hw--.54443S2;
 Fri, 04 Jun 2021 10:56:51 +0800 (CST)
From: lijian_8010a29@163.com
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com
Subject: [PATCH] video: fbdev: hyperv_fb: Removed unnecessary 'return'
Date: Fri,  4 Jun 2021 10:55:52 +0800
Message-Id: <20210604025552.106888-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowAC3vQlylrlg3pK_Hw--.54443S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUDWEEUUUUU
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/xtbBEROnUFaEEmK0EAAAsz
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
Cc: lijian <lijian@yulong.com>, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lijian <lijian@yulong.com>

Removed unnecessary 'return' in void function hvfb_get_option().

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/video/fbdev/hyperv_fb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 23999df52739..c8e57a513896 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -952,7 +952,6 @@ static void hvfb_get_option(struct fb_info *info)
 
 	screen_width = x;
 	screen_height = y;
-	return;
 }
 
 /*
-- 
2.25.1


