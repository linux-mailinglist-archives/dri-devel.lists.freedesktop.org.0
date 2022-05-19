Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CCD52E6C8
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E1E11B7B3;
	Fri, 20 May 2022 07:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 564 seconds by postgrey-1.36 at gabe;
 Thu, 19 May 2022 17:34:49 UTC
Received: from mail.wantyapps.xyz (unknown
 [IPv6:2001:19f0:5:305f:5400:3ff:fe88:abd4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0770110E11C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 17:34:48 +0000 (UTC)
Received: from localhost (bzq-79-183-83-88.red.bezeqint.net [79.183.83.88])
 by mail.wantyapps.xyz (Postfix) with ESMTPSA id 41DC57D654;
 Thu, 19 May 2022 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wantyapps.xyz;
 s=mail; t=1652981122;
 bh=bwIKlOGYkL2L4Ao4onVXBZ5fa9b9XMy3wOyD2HdryOQ=;
 h=From:To:Cc:Subject:Date:From;
 b=oQUhwKS+DczDCMjN3HbYDbECzhCixVy+OoQ5gWsypv1yLI2z+K/H/Thbk8xn8nEbF
 45G8ezHEH3zy0jk9t3w76n96o7YtAM4cCOiorLVmsK+U7/HPTdxDb4YS2b1Scgdl8s
 SkHbRRdGryTQORDrCUDksuCfncEgXMCl9gXskbpENN4v5auzz1TrWZh5FCersqOZS6
 Q0W8NWdHL9sdiGX3MIVmIHlacYbJ09fcAM3aMIcNyKqnHSsqmeJ5SODukMgRhlBxYX
 6t+GvpZVoCCSkqwTWTOdfX2ZiX6s/IalCK+9+UlaaHZ8H1vY01bMvajC27p5Qsi1Eq
 fH1XgkGos0Vxw==
From: Uri Arev <me@wantyapps.xyz>
To: 
Subject: [PATCH] staging: fbtft: fix checkpatch.pl struct should normally be
 const
Date: Thu, 19 May 2022 20:25:01 +0300
Message-Id: <20220519172503.10821-1-me@wantyapps.xyz>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 May 2022 07:59:06 +0000
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
Cc: Srivathsa Dara <srivathsa729.8@gmail.com>, Uri Arev <me@wantyapps.xyz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Len Baker <len.baker@gmx.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This simple patch fixes a checkpatch.pl warning in `fbtft/fbtft-core.c`.

Reported by Checkpatch:
WARNING: struct fb_ops should normally be const

Signed-off-by: Uri Arev <me@wantyapps.xyz>
---
 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 9c4d797e7ae4..9ff2b8230caf 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -539,7 +539,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 {
 	struct fb_info *info;
 	struct fbtft_par *par;
-	struct fb_ops *fbops = NULL;
+	const struct fb_ops *fbops = NULL;
 	struct fb_deferred_io *fbdefio = NULL;
 	u8 *vmem = NULL;
 	void *txbuf = NULL;
@@ -614,7 +614,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (!vmem)
 		goto alloc_fail;
 
-	fbops = devm_kzalloc(dev, sizeof(struct fb_ops), GFP_KERNEL);
+	const fbops = devm_kzalloc(dev, sizeof(struct fb_ops), GFP_KERNEL);
 	if (!fbops)
 		goto alloc_fail;
 
-- 
2.36.1

