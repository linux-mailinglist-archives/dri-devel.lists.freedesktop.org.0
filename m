Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFADF5F60C9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 07:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6049410E7E3;
	Thu,  6 Oct 2022 05:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 991 seconds by postgrey-1.36 at gabe;
 Thu, 06 Oct 2022 05:50:12 UTC
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E2A10E7E3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 05:50:12 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Mjg8f3LxDz9srM;
 Thu,  6 Oct 2022 07:33:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FcCf-JPVJsZG; Thu,  6 Oct 2022 07:33:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Mjg8f2WLzz9srL;
 Thu,  6 Oct 2022 07:33:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 47D268B765;
 Thu,  6 Oct 2022 07:33:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n-KpVnNpT6jZ; Thu,  6 Oct 2022 07:33:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.234])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A94F8B763;
 Thu,  6 Oct 2022 07:33:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2965XNRc212701
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 6 Oct 2022 07:33:23 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2965XNgs212672;
 Thu, 6 Oct 2022 07:33:23 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] video: fbdev: mb862xx: Replace NO_IRQ by 0
Date: Thu,  6 Oct 2022 07:33:17 +0200
Message-Id: <58bf3cab7a6a7797f109ea40490cf5520c4b565d.1665034339.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665034396; l=946; s=20211009;
 h=from:subject:message-id; bh=5rrnv9tXfKElM58dckx8PfsDwOBKrbY7NKno08H6cjA=;
 b=OK1tf77KEbziItN8h1cB68jly42cwL3MPYQqo3UrdTiKSLjRbeWZtYkpnbOg+ZMRHzaXTDM9eFze
 UyHMOdeQCm2nJRYP75OJFzzIQ5EQjzxHi27AX6LMawn2ucnwSOE0
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

NO_IRQ is used to check the return of irq_of_parse_and_map().

On some architecture NO_IRQ is 0, on other architectures it is -1.

irq_of_parse_and_map() returns 0 on error, independent of NO_IRQ.

So use 0 instead of using NO_IRQ.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index a7508f5be343..3f605d2d8f0c 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -692,7 +692,7 @@ static int of_platform_mb862xx_probe(struct platform_device *ofdev)
 	par->dev = dev;
 
 	par->irq = irq_of_parse_and_map(np, 0);
-	if (par->irq == NO_IRQ) {
+	if (!par->irq) {
 		dev_err(dev, "failed to map irq\n");
 		ret = -ENODEV;
 		goto fbrel;
-- 
2.37.1

