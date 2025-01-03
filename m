Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0285A00335
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 04:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6EA10E1DC;
	Fri,  3 Jan 2025 03:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="SToAFvDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 913 seconds by postgrey-1.36 at gabe;
 Fri, 03 Jan 2025 03:41:55 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDBB610E1DC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 03:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=B4KeP
 p60jPUMgspDF+ld1z+FbtKzxwAdGj/2H6fY3FM=; b=SToAFvDKzVNBI4hJjKW8b
 +b+ju1kooz5OUlNNLP/HEDziSo8I9skCTZCCM5N8/q3s368s+C1nFcwxDkeWxt5U
 b8oPgHfkZkKAkSREm4E4euWzUyQBx7nKLbZqnEKctBwlH10XdIDmnHjtOFwNyeLP
 aLSH+fd3V/k/0LHCHokE9g=
Received: from localhost.localdomain (unknown [116.128.244.169])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgCXNVfqWHdnyHcDJQ--.21003S2;
 Fri, 03 Jan 2025 11:26:35 +0800 (CST)
From: oushixiong1025@163.com
To: Peter Jones <pjones@redhat.com>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] fbdev: efifb: Change the return value type to void
Date: Fri,  3 Jan 2025 11:26:33 +0800
Message-Id: <20250103032633.98807-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgCXNVfqWHdnyHcDJQ--.21003S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3WFWfAF47uF43uw1fXrb_yoWfWwc_Cw
 48ZFW7JrWqkryF93yIka1Sv34aya1DXw1I9Fn293sxJFyUG3s3A3y7Zrn2qa4DWr4kCFnI
 ywnFgryFyr1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8dR65UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXR3JD2d3VelIhQAAsn
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shixiong Ou <oushixiong@kylinos.cn>

efifb_setup() doesn't need to return a value.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/video/fbdev/efifb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 20517448487e..0e1bd3dba255 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -275,7 +275,7 @@ static const struct fb_ops efifb_ops = {
 	.fb_setcolreg	= efifb_setcolreg,
 };
 
-static int efifb_setup(struct screen_info *si, char *options)
+static void efifb_setup(struct screen_info *si, char *options)
 {
 	char *this_opt;
 
@@ -299,8 +299,6 @@ static int efifb_setup(struct screen_info *si, char *options)
 				use_bgrt = false;
 		}
 	}
-
-	return 0;
 }
 
 static inline bool fb_base_is_valid(struct screen_info *si)
-- 
2.25.1

