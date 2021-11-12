Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBFD44E860
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7E46EB3B;
	Fri, 12 Nov 2021 14:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A9B6E4C9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:16:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F41CE21992;
 Fri, 12 Nov 2021 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636726592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwnHEnANpUKR9rJNtGidSsceilP/caEJZCQVKOEk2H4=;
 b=eREX6VoSSL5pCUcPv6babOaAYTOvhAXVsLei+2QfUNIh7C/5gFcFCM2bHF6U9tpNBZIS34
 IIe68QDTO70Q3upYBTEPHF/n17JkV0hadVG9z2HlM1ZvTWDowOTyfZ2UVWR2599ZC2abrs
 Dz/GHr5BzQJBc5AOlgdr821A2Pzwi1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636726592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwnHEnANpUKR9rJNtGidSsceilP/caEJZCQVKOEk2H4=;
 b=slGhAko69KPbEi6oSaIZkf9DaOzGYkydxCdHfNJr+WvUhn7Y5Kr2Fkaltdx3HRRzb/NGF1
 qyVnJHTACWh7mJDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADCC313C7C;
 Fri, 12 Nov 2021 14:16:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0FV0KT93jmHhPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 14:16:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH 6/7] agp/sworks: Remove unused variable 'current_size'
Date: Fri, 12 Nov 2021 15:16:27 +0100
Message-Id: <20211112141628.12904-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112141628.12904-1-tzimmermann@suse.de>
References: <20211112141628.12904-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the compiler warning

  drivers/char/agp/sworks-agp.c: In function 'serverworks_configure':
  drivers/char/agp/sworks-agp.c:265:37: warning: variable 'current_size' set but not used [-Wunused-but-set-variable]
    265 |         struct aper_size_info_lvl2 *current_size;

by removing the variable.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/char/agp/sworks-agp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/char/agp/sworks-agp.c b/drivers/char/agp/sworks-agp.c
index b15d3d4f71d5..b91da5998dd7 100644
--- a/drivers/char/agp/sworks-agp.c
+++ b/drivers/char/agp/sworks-agp.c
@@ -262,13 +262,10 @@ static void serverworks_tlbflush(struct agp_memory *temp)
 
 static int serverworks_configure(void)
 {
-	struct aper_size_info_lvl2 *current_size;
 	u32 temp;
 	u8 enable_reg;
 	u16 cap_reg;
 
-	current_size = A_SIZE_LVL2(agp_bridge->current_size);
-
 	/* Get the memory mapped registers */
 	pci_read_config_dword(agp_bridge->dev, serverworks_private.mm_addr_ofs, &temp);
 	temp = (temp & PCI_BASE_ADDRESS_MEM_MASK);
-- 
2.33.1

