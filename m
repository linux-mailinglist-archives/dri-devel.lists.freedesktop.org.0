Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A9905402
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107AE10E194;
	Wed, 12 Jun 2024 13:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be
 [195.130.137.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4D910E127
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:42:34 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Vzmtv62xwz4x0KD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:42:31 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:170b:1b4a:247:a009])
 by xavier.telenet-ops.be with bizsmtp
 id adiX2C00J3axqkY01diXux; Wed, 12 Jun 2024 15:42:31 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHOEA-008cnA-2T;
 Wed, 12 Jun 2024 15:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHOFD-00EaNg-5F;
 Wed, 12 Jun 2024 15:42:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Helge Deller <deller@gmx.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] video/logo: Remove linux_serial_image comments
Date: Wed, 12 Jun 2024 15:42:29 +0200
Message-Id: <427f78490365b38195f142d0aad7c9594a5bdd76.1718199686.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The last user of the serial_console ASCII image was removed in v2.1.115.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/linux_logo.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/linux_logo.h b/include/linux/linux_logo.h
index d4d5b93efe8435bd..e37699b7e8393df0 100644
--- a/include/linux/linux_logo.h
+++ b/include/linux/linux_logo.h
@@ -10,9 +10,6 @@
  *  Copyright (C) 2001 Greg Banks <gnb@alphalink.com.au>
  *  Copyright (C) 2001 Jan-Benedict Glaw <jbglaw@lug-owl.de>
  *  Copyright (C) 2003 Geert Uytterhoeven <geert@linux-m68k.org>
- *
- *  Serial_console ascii image can be any size,
- *  but should contain %s to display the version
  */
 
 #include <linux/init.h>
-- 
2.34.1

