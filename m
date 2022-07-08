Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FAA56B326
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 09:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B30010E9C3;
	Fri,  8 Jul 2022 07:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1086810E9C3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 07:12:05 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4LfPbP33V6z9tKy;
 Fri,  8 Jul 2022 09:11:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rA1tWbRo3HMk; Fri,  8 Jul 2022 09:11:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4LfPbK6rPnz9tHw;
 Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CEA818B7A9;
 Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id afkSoB4pgl9z; Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.202])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 76E4B8B79F;
 Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2687BSxD603399
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 8 Jul 2022 09:11:28 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2687BSh6603398;
 Fri, 8 Jul 2022 09:11:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 deller@gmx.de, manoj@linux.ibm.com, mrochs@linux.ibm.com,
 ukrishn@linux.ibm.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 tzimmermann@suse.de
Subject: [PATCH v3 2/4] scsi: cxlflash: Include missing linux/irqdomain.h
Date: Fri,  8 Jul 2022 09:11:06 +0200
Message-Id: <c6c0cc5e9179a642370a61439f95158271a78c03.1657264228.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <f75b383673663e27f6b57e50b4abfb9fe3780b00.1657264228.git.christophe.leroy@csgroup.eu>
References: <f75b383673663e27f6b57e50b4abfb9fe3780b00.1657264228.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657264266; l=1730; s=20211009;
 h=from:subject:message-id; bh=48X8ZLFinvI6xSHRLAcSqxxzVN1Ahbtv4N3knADh6qU=;
 b=YU4h1peK3Lo6jA0K/Z7WhkAnSK9Cu6oz10qTglFNiF9Q9RaG18x5Vk4CCG1tdqhESa+HLbWUbqCN
 dCVKoT/aDiYSnVJbr3snkdDjQhvZGW03ftlLugoYxjuh0RQJxCWq
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

powerpc's asm/prom.h brings some headers that it doesn't need itself.

Once those headers are removed from asm/prom.h, the following
errors occur:

  CC [M]  drivers/scsi/cxlflash/ocxl_hw.o
drivers/scsi/cxlflash/ocxl_hw.c: In function 'afu_map_irq':
drivers/scsi/cxlflash/ocxl_hw.c:195:16: error: implicit declaration of function 'irq_create_mapping' [-Werror=implicit-function-declaration]
  195 |         virq = irq_create_mapping(NULL, irq->hwirq);
      |                ^~~~~~~~~~~~~~~~~~
drivers/scsi/cxlflash/ocxl_hw.c:222:9: error: implicit declaration of function 'irq_dispose_mapping' [-Werror=implicit-function-declaration]
  222 |         irq_dispose_mapping(virq);
      |         ^~~~~~~~~~~~~~~~~~~
drivers/scsi/cxlflash/ocxl_hw.c: In function 'afu_unmap_irq':
drivers/scsi/cxlflash/ocxl_hw.c:264:13: error: implicit declaration of function 'irq_find_mapping'; did you mean 'is_cow_mapping'? [-Werror=implicit-function-declaration]
  264 |         if (irq_find_mapping(NULL, irq->hwirq)) {
      |             ^~~~~~~~~~~~~~~~
      |             is_cow_mapping
cc1: some warnings being treated as errors

Fix it by including linux/irqdomain.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/scsi/cxlflash/ocxl_hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/cxlflash/ocxl_hw.c b/drivers/scsi/cxlflash/ocxl_hw.c
index 244fc27215dc..631eda2d467e 100644
--- a/drivers/scsi/cxlflash/ocxl_hw.c
+++ b/drivers/scsi/cxlflash/ocxl_hw.c
@@ -16,6 +16,7 @@
 #include <linux/poll.h>
 #include <linux/sched/signal.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <asm/xive.h>
 #include <misc/ocxl.h>
 
-- 
2.36.1

