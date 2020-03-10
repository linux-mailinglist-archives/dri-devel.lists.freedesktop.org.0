Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4809C180C84
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AB86E90A;
	Tue, 10 Mar 2020 23:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7140A6E301
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 14:30:48 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id y7so490142pjn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ge7gDpcBGRttSD8WjUIEGB/IfPhV68NKF/ex9fXuV1k=;
 b=CoFNk7HHJ27bS8Sau2w7fDpQELoK3pr1joAA4rGVBfG5Pm0v8QxK3gvrRv31TMJgBw
 /CCO4x6Zsc+Of+XbBzOwSfE7m1Sxr4AKwGylYBTm8IAkBbFMbk7JAamCR/yEbd2trE7T
 ZB4gaC5uh/i04xNu0v5Ipync9hCnJUA093+tfr9ocBI/54M6JwTgwD/rLyyfGf25JEz2
 6mhMR3QILXYjsvcCSoUdGHBFZ3n01gLbiOIyaQvtohNjsTXC47ZHWkh/TucOuWvDJzoq
 G/Wcnk5S+SeD4OiYuFpNFMeNtZYnrAN0/fiJWGGuuDfvlHAM+YL+0/6r96Z2X7HtH+xo
 G/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ge7gDpcBGRttSD8WjUIEGB/IfPhV68NKF/ex9fXuV1k=;
 b=j91S3vpogF1okyx/xaq84ekplT4P/6q+ufnyvJUqASgxwKPJAiJZnmeyimWUzH3AN4
 m/jOhFJKbnIOib8tyv5C7TSssyQP6kL5kfMvPSERwjuVm49tY5ia1eDuxMn9f7EwQsML
 5xh5TLAmtf6itqfNqrUSjR7Px/VCOjja9/D6c4aSKvUpWZOBvCE0mUxmZGApIziOLgqs
 fCqnvBQ9QXAsU+/mXwE6YGg1/mSn7UQ53K4kOx+DVoDo/SVoidpZ43Di0YaBqftM9sqt
 x0x96yd6SvAPyPrnyBgWDTP5QtFeTsjQEekaCyasIhovE+qseot3i5FuOZmSIBvqtxnO
 K+vg==
X-Gm-Message-State: ANhLgQ2Fsg/jLB472yXY2uiKyFB4iHkmc2aqBnEToeBantgarTk/enFB
 DG0hSJHL0pE9EpVnlpeQ0hI=
X-Google-Smtp-Source: ADFU+vstmImOUNgoCcrT7uEN6qpq42UEh1S0ApYVVlp2WgbIzWYZKiUJyohS5+dKEhJO2dENy6CcRA==
X-Received: by 2002:a17:902:9a4c:: with SMTP id
 x12mr19846817plv.297.1583850647173; 
 Tue, 10 Mar 2020 07:30:47 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id l11sm2419160pjy.44.2020.03.10.07.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 07:30:46 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2] fbdev: s1d13xxxfb: add missed unregister_framebuffer in
 remove
Date: Tue, 10 Mar 2020 22:30:33 +0800
Message-Id: <20200310143033.5098-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver calls register_framebuffer() in probe but does not call
unregister_framebuffer() in remove.
Rename current remove to __s1d13xxxfb_remove() for error handler.
Then add a new remove to call unregister_framebuffer().

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Rename the existing remove and add a new one to ensure the correctness
    of error handler in probe.

 drivers/video/fbdev/s1d13xxxfb.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
index 8048499e398d..bafea3d09bba 100644
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@ -721,9 +721,8 @@ static void s1d13xxxfb_fetch_hw_state(struct fb_info *info)
 		xres, yres, xres_virtual, yres_virtual, is_color, is_dual, is_tft);
 }
 
-
 static int
-s1d13xxxfb_remove(struct platform_device *pdev)
+__s1d13xxxfb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 	struct s1d13xxxfb_par *par = NULL;
@@ -752,6 +751,18 @@ s1d13xxxfb_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int
+s1d13xxxfb_remove(struct platform_device *pdev)
+{
+	struct fb_info *info = platform_get_drvdata(pdev);
+
+	if (info)
+		unregister_framebuffer(info);
+
+	return __s1d13xxxfb_remove(pdev);
+}
+
+
 static int s1d13xxxfb_probe(struct platform_device *pdev)
 {
 	struct s1d13xxxfb_par *default_par;
@@ -895,7 +906,7 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
 	return 0;
 
 bail:
-	s1d13xxxfb_remove(pdev);
+	__s1d13xxxfb_remove(pdev);
 	return ret;
 
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
