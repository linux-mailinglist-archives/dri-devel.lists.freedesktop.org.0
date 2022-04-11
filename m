Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A1E4FBC9A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 14:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2B610E033;
	Mon, 11 Apr 2022 12:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8F310E033
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 12:58:06 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:b509:6862:2557:437a])
 by albert.telenet-ops.be with bizsmtp
 id HQy4270061G7NMJ06Qy4b8; Mon, 11 Apr 2022 14:58:04 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ndtcJ-000ASK-O6; Mon, 11 Apr 2022 14:58:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ndtcJ-009JP5-5O; Mon, 11 Apr 2022 14:58:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Helge Deller <deller@gmx.de>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] video: fbdev: sh_mobile_lcdcfb: Remove
 sh_mobile_lcdc_check_var() declaration
Date: Mon, 11 Apr 2022 14:58:01 +0200
Message-Id: <632d1ef6be69c93cd37b9336a133f8c5ec779c8a.1649681814.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-renesas-soc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit 0fe66f327c464943 ("fbdev/sh_mobile: remove
sh_mobile_lcdc_display_notify"), there is no longer a need for a foward
declaration of sh_mobile_lcdc_check_var().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index aa4ebe3192ec9735..9a4417430b4e948f 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -531,9 +531,6 @@ static void sh_mobile_lcdc_display_off(struct sh_mobile_lcdc_chan *ch)
 		ch->tx_dev->ops->display_off(ch->tx_dev);
 }
 
-static int sh_mobile_lcdc_check_var(struct fb_var_screeninfo *var,
-				    struct fb_info *info);
-
 /* -----------------------------------------------------------------------------
  * Format helpers
  */
-- 
2.25.1

