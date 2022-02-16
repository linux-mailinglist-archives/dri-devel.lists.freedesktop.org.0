Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A764B8393
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D7910E625;
	Wed, 16 Feb 2022 09:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D8F10E720
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:04:31 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7534:e0be:5adf:2691])
 by albert.telenet-ops.be with bizsmtp
 id vl4V2600K18GbK106l4Veb; Wed, 16 Feb 2022 10:04:30 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nKGEf-000wtW-Dn; Wed, 16 Feb 2022 10:04:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nKFrS-00CDzg-BS; Wed, 16 Feb 2022 09:40:30 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] video: fbdev: au1100fb: Spelling s/palette/palette/
Date: Wed, 16 Feb 2022 09:40:29 +0100
Message-Id: <20220216084029.2913685-1-geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a misspelling of "palette" in a structure member.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/au1100fb.c | 2 +-
 drivers/video/fbdev/au1100fb.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 37a6512feda0fb20..52f731a6148210eb 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -239,7 +239,7 @@ int au1100fb_fb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned
 	u32 value;
 
 	fbdev = to_au1100fb_device(fbi);
-	palette = fbdev->regs->lcd_pallettebase;
+	palette = fbdev->regs->lcd_palettebase;
 
 	if (regno > (AU1100_LCD_NBR_PALETTE_ENTRIES - 1))
 		return -EINVAL;
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index e7239bceefd3ad34..79f4048726f1af0f 100644
--- a/drivers/video/fbdev/au1100fb.h
+++ b/drivers/video/fbdev/au1100fb.h
@@ -92,7 +92,7 @@ struct au1100fb_regs
 	u32  lcd_pwmdiv;
 	u32  lcd_pwmhi;
 	u32  reserved[(0x0400-0x002C)/4];
-	u32  lcd_pallettebase[256];
+	u32  lcd_palettebase[256];
 };
 
 struct au1100fb_device {
-- 
2.25.1

