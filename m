Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB7690B06
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8249410EAF1;
	Thu,  9 Feb 2023 13:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9B410EAE6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0213B5D030;
 Thu,  9 Feb 2023 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675950913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2/BUPdiD/DSFrLNZwoR2NooKVxr9DAwaBGLRql4mPs=;
 b=mYlREntyu41T1DaQVnlSCb00Zocdk5dmaMnrt5MKQheBHRoc8HAeYIN+vKkkqHdiPisBE0
 qV4P4uTPmaZF2jztXT+rUyPXewprfrvFBPmn8iFJR6AOVMM8AJ8DEg5Oh3ICUbv1ZLhWEC
 8NUyQRkI4dzchjaJ0kTQ/VwkDI2TOvI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675950913;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2/BUPdiD/DSFrLNZwoR2NooKVxr9DAwaBGLRql4mPs=;
 b=858j3P5EDKNBQDCG86dhDiJ/ZInrJvm4uqoJ6knYW+RL3ywqfJ3PCtxawAB5EMMmVpy1dX
 /pPdiSXSlI66k5Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F7E313915;
 Thu,  9 Feb 2023 13:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UBwdJkD75GNTfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, geoff@infradead.org,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH 01/11] fbdev: Fix contact info in fb_cmdline.c
Date: Thu,  9 Feb 2023 14:54:59 +0100
Message-Id: <20230209135509.7786-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209135509.7786-1-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix Daniel's email address. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/video/fbdev/core/fb_cmdline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_cmdline.c b/drivers/video/fbdev/core/fb_cmdline.c
index 3b5bd666b952..6792010d6716 100644
--- a/drivers/video/fbdev/core/fb_cmdline.c
+++ b/drivers/video/fbdev/core/fb_cmdline.c
@@ -12,7 +12,7 @@
  * for more details.
  *
  * Authors:
- *    Vetter <danie.vetter@ffwll.ch>
+ *    Daniel Vetter <daniel.vetter@ffwll.ch>
  */
 #include <linux/init.h>
 #include <linux/fb.h>
-- 
2.39.1

