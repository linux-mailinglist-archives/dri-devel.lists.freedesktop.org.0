Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA450192263
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1886E591;
	Wed, 25 Mar 2020 08:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941296E161
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:23:20 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id d17so8448709pgo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H9W5asHoSbtI69dnrLRaFeOykWQKzVNx1ATwcX4bFlQ=;
 b=cTEo3+rd8HjtvQG84BxeLG5XwUFWbasowEp0PVZ6AJ/I5pEqpW4uEbt3Wuk2CT+SCt
 De2wcAyw3uw+IPmKMCPaFITdnf7zCEl9kM5er3APCB5PKEpirrz+U4dKfY0+2ZpWDm5g
 9hz8y5gJDvNwfgilx3+eMuNGsqiEccHlKCNPyw1NrgHDn9o9O4JCm9posf1Sco1085zY
 IxsIbbH+dmxoTN3oX85CHQhhKxuVHo+gKMCzDjn5eqWW3qrUJ8BsBRQ/8HBXfXiAEtyt
 zb3NMACa4XBLpk1faZBKgIDplrvs0jDPyHvOvMMPnT8c0mA0OLTukH08sccg8nDez6xR
 8iEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H9W5asHoSbtI69dnrLRaFeOykWQKzVNx1ATwcX4bFlQ=;
 b=iaMN/AGnNB6kCF95+YwvCNSGxR9aA6Xox9g0DB+FNB77URRAJvbsrPbzTbvgWoaEOA
 m7MCxQeEDJkThWoSVpuNCUv8FKZgBpM9S2ktd5jVIDaS8r3QfI04ft8JNxirzIgQ7Cgq
 GeLu7ZmhyLK7Qr0Jv9pk079Foob02HXdEGMna6DM8o2p9A3MRxH4MQC1ETjfhRXk97/q
 BAWcANFI2KxFOHUY4D6b6Ej/YSXXPT7ISepOlmuMdNTaXpsgE+3GthjbU2D61mMLOvKw
 nNPAOCewVR9XlquQnPvdhCOWnxUPRqDmQpg98memPu+6slfpgyGvT5NWu4PvG6OzNiwR
 7H8A==
X-Gm-Message-State: ANhLgQ2VFo1SYUnGOLKT6Zh07WhIPwiIUe75uOkmAUb90Z/wUTIi6DX4
 gmbdv1UVOl8phzH5GuqARww=
X-Google-Smtp-Source: ADFU+vvaV82cQxYW+iVQ8iL9mUZuQav300Ftc7kBv07XCthMCJNg/aF3ZNj3CMKOFKg++p2Xw3BLbA==
X-Received: by 2002:a62:1745:: with SMTP id 66mr30225015pfx.291.1585056200107; 
 Tue, 24 Mar 2020 06:23:20 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id r189sm4187618pgr.31.2020.03.24.06.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 06:23:19 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v3] fbdev: s1d13xxxfb: add missed unregister_framebuffer in
 remove
Date: Tue, 24 Mar 2020 21:23:11 +0800
Message-Id: <20200324132311.21729-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Changes in v3:
  - Fix code style.
  - Set __s1d13xxxfb_remove() to return void.
  - Remove redundant check for info.

 drivers/video/fbdev/s1d13xxxfb.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
index 8048499e398d..d51ef7619115 100644
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@ -721,9 +721,7 @@ static void s1d13xxxfb_fetch_hw_state(struct fb_info *info)
 		xres, yres, xres_virtual, yres_virtual, is_color, is_dual, is_tft);
 }
 
-
-static int
-s1d13xxxfb_remove(struct platform_device *pdev)
+static void __s1d13xxxfb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 	struct s1d13xxxfb_par *par = NULL;
@@ -749,9 +747,18 @@ s1d13xxxfb_remove(struct platform_device *pdev)
 			pdev->resource[0].end - pdev->resource[0].start +1);
 	release_mem_region(pdev->resource[1].start,
 			pdev->resource[1].end - pdev->resource[1].start +1);
+}
+
+static int s1d13xxxfb_remove(struct platform_device *pdev)
+{
+	struct fb_info *info = platform_get_drvdata(pdev);
+
+	unregister_framebuffer(info);
+	__s1d13xxxfb_remove(pdev);
 	return 0;
 }
 
+
 static int s1d13xxxfb_probe(struct platform_device *pdev)
 {
 	struct s1d13xxxfb_par *default_par;
@@ -895,7 +902,7 @@ static int s1d13xxxfb_probe(struct platform_device *pdev)
 	return 0;
 
 bail:
-	s1d13xxxfb_remove(pdev);
+	__s1d13xxxfb_remove(pdev);
 	return ret;
 
 }
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
