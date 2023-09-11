Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 257FE79A82D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 15:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B746F10E2F6;
	Mon, 11 Sep 2023 13:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA87E10E2E7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 13:10:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7646421850;
 Mon, 11 Sep 2023 13:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694437839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zC+JZGsYXsje+yxOPTqCSn4MX7oGHygyObBUu1WbhrA=;
 b=NXQHlmbMHYPOXM6/Q/wl/QPcZG0WBva+XMfJ3bI8zPZR0ux8x966yv6JXD7NlSTCOQklTa
 932HKLit7W3e7hcuwCJ8sc5x6KRlq+PhBRrREvJgCoo1V1dGXQ5h7PnTiS4OLTxVn3gu1O
 Rx1xh4EvrS13FZCYRWs2QwstnFhPB3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694437839;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zC+JZGsYXsje+yxOPTqCSn4MX7oGHygyObBUu1WbhrA=;
 b=JCHgcAtxoFB/ZbPa6EOWzeOMrMPLp/0P8whX9d/BfwDeq0tnkGwyxy4nr08KjBixgKrfEu
 Rcaq/Y+WU3OamAAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DC1513AD1;
 Mon, 11 Sep 2023 13:10:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ALk3Cs8R/2SCIwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Sep 2023 13:10:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 arnd@arndb.de, deller@gmx.de
Subject: [PATCH v3 3/5] arch/powerpc: Remove trailing whitespaces
Date: Mon, 11 Sep 2023 15:08:33 +0200
Message-ID: <20230911131033.27745-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911131033.27745-1-tzimmermann@suse.de>
References: <20230911131033.27745-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/powerpc/include/asm/machdep.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 4f6e7d7ee3883..933465ed4c432 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -10,7 +10,7 @@
 #include <linux/export.h>
 
 struct pt_regs;
-struct pci_bus;	
+struct pci_bus;
 struct device_node;
 struct iommu_table;
 struct rtc_time;
@@ -78,8 +78,8 @@ struct machdep_calls {
 	unsigned char 	(*nvram_read_val)(int addr);
 	void		(*nvram_write_val)(int addr, unsigned char val);
 	ssize_t		(*nvram_write)(char *buf, size_t count, loff_t *index);
-	ssize_t		(*nvram_read)(char *buf, size_t count, loff_t *index);	
-	ssize_t		(*nvram_size)(void);		
+	ssize_t		(*nvram_read)(char *buf, size_t count, loff_t *index);
+	ssize_t		(*nvram_size)(void);
 	void		(*nvram_sync)(void);
 
 	/* Exception handlers */
@@ -102,9 +102,9 @@ struct machdep_calls {
 	 */
 	long	 	(*feature_call)(unsigned int feature, ...);
 
-	/* Get legacy PCI/IDE interrupt mapping */ 
+	/* Get legacy PCI/IDE interrupt mapping */
 	int		(*pci_get_legacy_ide_irq)(struct pci_dev *dev, int channel);
-	
+
 	/* Get access protection for /dev/mem */
 	pgprot_t	(*phys_mem_access_prot)(struct file *file,
 						unsigned long pfn,
-- 
2.42.0

