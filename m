Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812AE5476C7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 19:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06289112703;
	Sat, 11 Jun 2022 17:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F94B1126CA
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 17:20:18 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4LL3km2WgVz9t4V;
 Sat, 11 Jun 2022 18:51:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lyxc5OlcYbSP; Sat, 11 Jun 2022 18:51:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4LL3kl4Q65z9tPh;
 Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 79A8D8B781;
 Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id W-cpnlqeV72J; Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.192])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 06D538B77E;
 Sat, 11 Jun 2022 18:51:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25BGpEt2741180
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 11 Jun 2022 18:51:14 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25BGpE1t741179;
 Sat, 11 Jun 2022 18:51:14 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, deller@gmx.de,
 manoj@linux.ibm.com, mrochs@linux.ibm.com, ukrishn@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, tzimmermann@suse.de
Subject: [PATCH 4/4] powerpc: Finally remove unnecessary headers from
 asm/prom.h
Date: Sat, 11 Jun 2022 18:51:00 +0200
Message-Id: <187891a76d7f2eea1b75b5aa897fec62ca18f0e9.1654966253.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <a1dfa936043eeed715e8cda7f8690fe553ba7c1a.1654966253.git.christophe.leroy@csgroup.eu>
References: <a1dfa936043eeed715e8cda7f8690fe553ba7c1a.1654966253.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1654966257; l=1119; s=20211009;
 h=from:subject:message-id; bh=itD5+bDLtYc+2iYXxBP9QmALVM+RjdRtxOZhjnKzBYg=;
 b=gsABDeddGKDSjK3Vl2jQm77znS7PcwAAZc1Nf1o+nYMw48ieIDWqx+54KMOjE+swfN/blRWWvuYQ
 R7uF8lmtCDVATXa+MyMUPJvWsVWwhX3ga+O98NIGCqv4U8854wy5
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

Remove all headers included from asm/prom.h which are not used
by asm/prom.h itself.

Declare struct device_node and struct property locally to
avoid including of.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/prom.h | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 5c80152e8f18..93f112133934 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -12,15 +12,9 @@
  * Updates for PPC64 by Peter Bergner & David Engebretsen, IBM Corp.
  */
 #include <linux/types.h>
-#include <asm/irq.h>
-#include <linux/atomic.h>
-
-/* These includes should be removed once implicit includes are cleaned up. */
-#include <linux/of.h>
-#include <linux/of_fdt.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/platform_device.h>
+
+struct device_node;
+struct property;
 
 #define OF_DT_BEGIN_NODE	0x1		/* Start of node, full name */
 #define OF_DT_END_NODE		0x2		/* End node */
-- 
2.35.3

