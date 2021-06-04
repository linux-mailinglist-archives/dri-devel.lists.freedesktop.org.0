Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D9F39B0C9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 05:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1E66F570;
	Fri,  4 Jun 2021 03:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with ESMTP id C53A46F570
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 03:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=pZeW5
 XWw0/CemuoVaTv0dyhtE+ayHz1bZ2XZZs9jt14=; b=CgTpXGwsEFO7CuL+XT+So
 xl5IlEiUZ+9UfMSP5B0841r/PHyAlPqHA3JZnTiz23eJFMlgZa3h/g0+Hu4JMTTy
 FASH6PMf3vp79U9njbB8C8xd2dYekQi59V5HoIpw/lt/hSD4f3QCk4wCNC1WqfLr
 1VbIZSMzcIF6lPM9ubFJ8E=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp7 (Coremail) with SMTP id C8CowAAnL3+1m7lgFIBlgA--.924S2;
 Fri, 04 Jun 2021 11:19:18 +0800 (CST)
From: lijian_8010a29@163.com
To: spock@gentoo.org
Subject: [PATCH] video: fbdev: uvesafb: Removed unnecessary 'return'
Date: Fri,  4 Jun 2021 11:18:20 +0800
Message-Id: <20210604031820.137327-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowAAnL3+1m7lgFIBlgA--.924S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWxGrW3CF1fAr4fWw1fCrg_yoWDJwb_Ca
 17Zr92gryqyws2yF48Kr43AFWIya1UX3ZrZFnIqr9xAasrXF4fZr42vr4qgFyUXr4kAFy3
 uF4Dur10yr4rKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5niSJUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/1tbiHRanUFSIrCTJmwAAs6
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

Removed unnecessary 'return' in void function uvesafb_vbe_getmonspecs()
and uvesafb_cn_callback().

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/video/fbdev/uvesafb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 4df6772802d7..28f353da668c 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -106,7 +106,6 @@ static void uvesafb_cn_callback(struct cn_msg *msg, struct netlink_skb_parms *ns
 		memcpy(task->buf, utask + 1, task->t.buf_len);
 
 	complete(task->done);
-	return;
 }
 
 static int uvesafb_helper_start(void)
@@ -748,8 +747,6 @@ static void uvesafb_vbe_getmonspecs(struct uvesafb_ktask *task,
 			fb_add_videomode(&info->monspecs.modedb[i],
 					&info->modelist);
 	}
-
-	return;
 }
 
 static void uvesafb_vbe_getstatesize(struct uvesafb_ktask *task,
-- 
2.25.1

