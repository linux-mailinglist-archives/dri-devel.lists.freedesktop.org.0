Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED826F446F
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 15:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDFE10E53D;
	Tue,  2 May 2023 13:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE1D10E543
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 13:02:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E43A21B1C;
 Tue,  2 May 2023 13:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683032546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5H+Zv5ICW1VCcW395141Sp0h6W5rJmhJkcf3cNntk1k=;
 b=1vR+ETUxDfsc2rHvp7qUThXMhyo+PDl0wJzW/O/MNiCWy2QKylJ0tn1CT4xGcGQvD2uD8u
 i/0Y7QIbt2kYrxkY6kC7dtKBKkknHsMrK7F5dJH0xSeaBCquX/uj4klmSnYlKwbhuB37/o
 gGEVR7DUdRHbSF0Ot8YETAAsOg117mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683032546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5H+Zv5ICW1VCcW395141Sp0h6W5rJmhJkcf3cNntk1k=;
 b=sUEmSt7fBBh+tfNGpVJTkvIUwNAehNlqzxZUl9Hrcvm1mH+1S14snmMjTHwfTqBTFtHVVg
 LRiCLONY8KbwhAAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF02B139D2;
 Tue,  2 May 2023 13:02:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UICJLeEJUWRYTQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 02 May 2023 13:02:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@HansenPartnership.com, arnd@arndb.de,
 sam@ravnborg.org
Subject: [PATCH v3 1/6] fbdev/matrox: Remove trailing whitespaces
Date: Tue,  2 May 2023 15:02:18 +0200
Message-Id: <20230502130223.14719-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502130223.14719-1-tzimmermann@suse.de>
References: <20230502130223.14719-1-tzimmermann@suse.de>
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
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/matrox/matroxfb_accel.c | 6 +++---
 drivers/video/fbdev/matrox/matroxfb_base.h  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/matrox/matroxfb_accel.c b/drivers/video/fbdev/matrox/matroxfb_accel.c
index 9cb0685feddd..ce51227798a1 100644
--- a/drivers/video/fbdev/matrox/matroxfb_accel.c
+++ b/drivers/video/fbdev/matrox/matroxfb_accel.c
@@ -88,7 +88,7 @@
 
 static inline void matrox_cfb4_pal(u_int32_t* pal) {
 	unsigned int i;
-	
+
 	for (i = 0; i < 16; i++) {
 		pal[i] = i * 0x11111111U;
 	}
@@ -96,7 +96,7 @@ static inline void matrox_cfb4_pal(u_int32_t* pal) {
 
 static inline void matrox_cfb8_pal(u_int32_t* pal) {
 	unsigned int i;
-	
+
 	for (i = 0; i < 16; i++) {
 		pal[i] = i * 0x01010101U;
 	}
@@ -482,7 +482,7 @@ static void matroxfb_1bpp_imageblit(struct matrox_fb_info *minfo, u_int32_t fgx,
 			/* Tell... well, why bother... */
 			while (height--) {
 				size_t i;
-				
+
 				for (i = 0; i < step; i += 4) {
 					/* Hope that there are at least three readable bytes beyond the end of bitmap */
 					fb_writel(get_unaligned((u_int32_t*)(chardata + i)),mmio.vaddr);
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.h b/drivers/video/fbdev/matrox/matroxfb_base.h
index 958be6805f87..c93c69bbcd57 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.h
+++ b/drivers/video/fbdev/matrox/matroxfb_base.h
@@ -301,9 +301,9 @@ struct matrox_altout {
 	int		(*verifymode)(void* altout_dev, u_int32_t mode);
 	int		(*getqueryctrl)(void* altout_dev,
 					struct v4l2_queryctrl* ctrl);
-	int		(*getctrl)(void* altout_dev, 
+	int		(*getctrl)(void *altout_dev,
 				   struct v4l2_control* ctrl);
-	int		(*setctrl)(void* altout_dev, 
+	int		(*setctrl)(void *altout_dev,
 				   struct v4l2_control* ctrl);
 };
 
-- 
2.40.1

