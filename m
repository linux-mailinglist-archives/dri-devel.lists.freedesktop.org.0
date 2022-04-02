Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8936D4F0076
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 12:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF5A10F80B;
	Sat,  2 Apr 2022 10:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F3F10F80B
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 10:23:12 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KVtR21LGgz9sSZ;
 Sat,  2 Apr 2022 12:23:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZquyIJd4SRe; Sat,  2 Apr 2022 12:23:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KVtR20SFlz9sSQ;
 Sat,  2 Apr 2022 12:23:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E92E08B76D;
 Sat,  2 Apr 2022 12:23:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id C6PcTIWmTHoD; Sat,  2 Apr 2022 12:23:09 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.136])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A012F8B768;
 Sat,  2 Apr 2022 12:23:09 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 232AMwHq685346
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 2 Apr 2022 12:22:58 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 232AMuYv685345;
 Sat, 2 Apr 2022 12:22:56 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Paul Mackerras <paulus@samba.org>, Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] video: fbdev: Prepare cleanup of powerpc's asm/prom.h
Date: Sat,  2 Apr 2022 12:22:56 +0200
Message-Id: <68d44009feb802c58b855ade3ac9109496b9d0e5.1648833426.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648894975; l=4417; s=20211009;
 h=from:subject:message-id; bh=NUrHFSycOvagcdRTsZ0KQOWwYFUWWBtR8hlzOrV8ib0=;
 b=l7Qb3dp99ynwky4d0UQJ3JdMGk7zv+x3ehiGgnBVDG2PjZuA50gzwIi53OWyRGw1RuqAMkcs8uEU
 cRMaGK1HBJCKKH6tnhTx9ElNNLaV+eAdiyo10o+t4GX49Rs5SX8P
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

powerpc's asm/prom.h brings some headers that it doesn't
need itself.

In order to clean it up, first add missing headers in
users of asm/prom.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/video/fbdev/aty/aty128fb.c         | 1 -
 drivers/video/fbdev/aty/atyfb_base.c       | 1 -
 drivers/video/fbdev/aty/radeon_pm.c        | 1 -
 drivers/video/fbdev/aty/radeonfb.h         | 2 +-
 drivers/video/fbdev/controlfb.c            | 3 ---
 drivers/video/fbdev/matrox/matroxfb_base.h | 1 -
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 2 ++
 drivers/video/fbdev/platinumfb.c           | 2 +-
 drivers/video/fbdev/valkyriefb.c           | 3 +--
 9 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index 6ff16d3132e5..b26c81233b6b 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -68,7 +68,6 @@
 #ifdef CONFIG_PPC_PMAC
 #include <asm/machdep.h>
 #include <asm/pmac_feature.h>
-#include <asm/prom.h>
 #include "../macmodes.h"
 #endif
 
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index 1aef3d6ebd88..a3e6faed7745 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -79,7 +79,6 @@
 
 #ifdef __powerpc__
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include "../macmodes.h"
 #endif
 #ifdef __sparc__
diff --git a/drivers/video/fbdev/aty/radeon_pm.c b/drivers/video/fbdev/aty/radeon_pm.c
index b5fbd5329652..97a5972f5b1f 100644
--- a/drivers/video/fbdev/aty/radeon_pm.c
+++ b/drivers/video/fbdev/aty/radeon_pm.c
@@ -22,7 +22,6 @@
 
 #ifdef CONFIG_PPC_PMAC
 #include <asm/machdep.h>
-#include <asm/prom.h>
 #include <asm/pmac_feature.h>
 #endif
 
diff --git a/drivers/video/fbdev/aty/radeonfb.h b/drivers/video/fbdev/aty/radeonfb.h
index 93f403cbb415..91d81b576231 100644
--- a/drivers/video/fbdev/aty/radeonfb.h
+++ b/drivers/video/fbdev/aty/radeonfb.h
@@ -21,7 +21,7 @@
 
 #include <asm/io.h>
 
-#if defined(CONFIG_PPC) || defined(CONFIG_SPARC)
+#ifdef CONFIG_SPARC
 #include <asm/prom.h>
 #endif
 
diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index bd59e7b11ed5..aba46118b208 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -47,9 +47,6 @@
 #include <linux/nvram.h>
 #include <linux/adb.h>
 #include <linux/cuda.h>
-#ifdef CONFIG_PPC_PMAC
-#include <asm/prom.h>
-#endif
 #ifdef CONFIG_BOOTX_TEXT
 #include <asm/btext.h>
 #endif
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.h b/drivers/video/fbdev/matrox/matroxfb_base.h
index 759dee996af1..958be6805f87 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.h
+++ b/drivers/video/fbdev/matrox/matroxfb_base.h
@@ -47,7 +47,6 @@
 #include <asm/unaligned.h>
 
 #if defined(CONFIG_PPC_PMAC)
-#include <asm/prom.h>
 #include "../macmodes.h"
 #endif
 
diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index 63721337a377..a7508f5be343 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -18,6 +18,8 @@
 #include <linux/interrupt.h>
 #include <linux/pci.h>
 #if defined(CONFIG_OF)
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #endif
 #include "mb862xxfb.h"
diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/platinumfb.c
index ce413a9df06e..5b9e26ea6449 100644
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -30,9 +30,9 @@
 #include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/nvram.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
-#include <asm/prom.h>
 
 #include "macmodes.h"
 #include "platinumfb.h"
diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index 8425afe37d7c..a6c9d4f26669 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -54,10 +54,9 @@
 #include <linux/nvram.h>
 #include <linux/adb.h>
 #include <linux/cuda.h>
+#include <linux/of_address.h>
 #ifdef CONFIG_MAC
 #include <asm/macintosh.h>
-#else
-#include <asm/prom.h>
 #endif
 
 #include "macmodes.h"
-- 
2.35.1

