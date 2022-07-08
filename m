Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDF756B328
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 09:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F3E10E8B3;
	Fri,  8 Jul 2022 07:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA5C10E8B3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 07:11:58 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4LfPbM0k7Dz9tKD;
 Fri,  8 Jul 2022 09:11:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_y4uC6M_egq; Fri,  8 Jul 2022 09:11:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4LfPbK6kjpz9tF7;
 Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D594B8B763;
 Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XZuSmughcSeh; Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.202])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 75BC18B76E;
 Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2687BSQg603395
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 8 Jul 2022 09:11:28 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2687BN8i603387;
 Fri, 8 Jul 2022 09:11:23 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 deller@gmx.de, manoj@linux.ibm.com, mrochs@linux.ibm.com,
 ukrishn@linux.ibm.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 tzimmermann@suse.de
Subject: [PATCH v3 1/4] video: fbdev: offb: Include missing
 linux/platform_device.h
Date: Fri,  8 Jul 2022 09:11:05 +0200
Message-Id: <f75b383673663e27f6b57e50b4abfb9fe3780b00.1657264228.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657264265; l=997; s=20211009;
 h=from:subject:message-id; bh=p+lWafqrH6KOPHJ8OTtOKJ/OSZxVmCtmi3nNoK87dwM=;
 b=KqCkpTMX4F6Hkya0AInt4pxI97ck7Coi4Ygpuy9qmiI6OYdHnwe7ki54ez4eao9Q+hC3PzG4GhjH
 Rdn9089ODPcmP2HTCnde7LOHIZrI+zPM0ak1tc0Iu2ojju8qtY8H
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
Cc: linux-fbdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A lot of drivers were getting platform and of headers
indirectly via headers like asm/pci.h or asm/prom.h

Most of them were fixed during 5.19 cycle but a newissue was
introduced by commit 52b1b46c39ae ("of: Create platform devices
for OF framebuffers")

Include missing platform_device.h to allow cleaning asm/pci.h

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 52b1b46c39ae ("of: Create platform devices for OF framebuffers")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/offb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index b1acb1ebebe9..91001990e351 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -26,6 +26,7 @@
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <asm/io.h>
 
 #ifdef CONFIG_PPC32
-- 
2.36.1

