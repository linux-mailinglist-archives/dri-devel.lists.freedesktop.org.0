Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA2744E85D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EC46E489;
	Fri, 12 Nov 2021 14:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A128E6EA5B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:16:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 27F3821993;
 Fri, 12 Nov 2021 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636726592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mz+PiD+Hs4qwezSNV2QoOKqCGHD5UTA4veN+14dJtYg=;
 b=TBj8GaJqnABR2D8Y691uIiwuVZ9OeAiD1YDhyTU/TgY/XQkRbGaRz3Vrb54PjI0r/tDb8z
 TbuY8DSupFxiK+uiogGHpAfTaoVLXn03IgwokQBY/GN4yCr8RMXNwttv1+pXDYb2lXc0Jb
 pHlZQkZlTiAEBQglwlI8eryxi/octNs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636726592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mz+PiD+Hs4qwezSNV2QoOKqCGHD5UTA4veN+14dJtYg=;
 b=SmBE/Ru8R3IIgXRX5fUFUL+zyRPUbD4IYTnOMAx3JfvZqOveytMIlXASqq/Vt2FPUPVL0C
 QFh8QXvAh8VRQjCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA20C13DB2;
 Fri, 12 Nov 2021 14:16:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sKEqOD93jmHhPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 14:16:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH 7/7] agp/via: Remove unused variable 'current_size'
Date: Fri, 12 Nov 2021 15:16:28 +0100
Message-Id: <20211112141628.12904-8-tzimmermann@suse.de>
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

  drivers/char/agp/via-agp.c: In function 'via_configure_agp3':
  drivers/char/agp/via-agp.c:131:35: warning: variable 'current_size' set but not used [-Wunused-but-set-variable]
    131 |         struct aper_size_info_16 *current_size;

by removing the variable.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/char/agp/via-agp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/char/agp/via-agp.c b/drivers/char/agp/via-agp.c
index 87a92a044570..dc594f4eca38 100644
--- a/drivers/char/agp/via-agp.c
+++ b/drivers/char/agp/via-agp.c
@@ -128,9 +128,6 @@ static int via_fetch_size_agp3(void)
 static int via_configure_agp3(void)
 {
 	u32 temp;
-	struct aper_size_info_16 *current_size;
-
-	current_size = A_SIZE_16(agp_bridge->current_size);
 
 	/* address to map to */
 	agp_bridge->gart_bus_addr = pci_bus_address(agp_bridge->dev,
-- 
2.33.1

