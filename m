Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D799353DAF3
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 11:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06F81124FA;
	Sun,  5 Jun 2022 09:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 467 seconds by postgrey-1.36 at gabe;
 Sun, 05 Jun 2022 09:07:25 UTC
Received: from smtpbg519.qq.com (smtpbg516.qq.com [203.205.250.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F921124FA
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 09:07:25 +0000 (UTC)
X-QQ-mid: bizesmtp73t1654419559tv8kcgm9
Received: from localhost.localdomain ( [111.9.5.115])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 05 Jun 2022 16:59:14 +0800 (CST)
X-QQ-SSF: 01000000002000C0G000B00A0000000
X-QQ-FEAT: DHpJGCbtM4nx5RtduTeQ1jE8RQDF4LyMBrhXEEUK5EHEg7aO/KdFUpyIc2BSy
 yrMUqW6RJu/KdMaqHn7JDRxSJhkSf6H0FZDCWN6wYxoXaFUyorcimuMghjbT+fIYMlZ3ceP
 9+UIYN7uAA1WAyy6HFr1mJfzJHtV6lr3VL54fOqp9ZRrK+vjLHUz9JaOE+dbSl7FZAX8INu
 lg2OcHdwF6v0xvPt0DBQsyIEbosSgH0tizfuxGl1r+PpzLcxVYzyTWKg92tNpqBk7j8pSN2
 mL+Y2oIs/J7hyiv7x6KuIDAkQ4EkPF2X2XRcpzuSyCNQ7Q9y0nalf1x6qEAE8j8NhTyXrXq
 yy4kRcGFg9uwU9D91nCulRkiG+FuQ==
X-QQ-GoodBg: 0
From: Xiang wangx <wangxiang@cdjrlc.com>
To: deller@gmx.de
Subject: [PATCH] fbdev: Fix syntax errors in comments
Date: Sun,  5 Jun 2022 16:59:13 +0800
Message-Id: <20220605085913.11682-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam6
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
Cc: linux-fbdev@vger.kernel.org, Xiang wangx <wangxiang@cdjrlc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'its'.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/video/fbdev/skeletonfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index bcacfb6934fa..3d4d78362ede 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -96,7 +96,7 @@ static const struct fb_fix_screeninfo xxxfb_fix = {
 
     /*
      * 	Modern graphical hardware not only supports pipelines but some 
-     *  also support multiple monitors where each display can have its  
+     *  also support multiple monitors where each display can have
      *  its own unique data. In this case each display could be  
      *  represented by a separate framebuffer device thus a separate 
      *  struct fb_info. Now the struct xxx_par represents the graphics
-- 
2.36.1


