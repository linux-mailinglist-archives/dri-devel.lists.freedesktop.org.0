Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E716D1C00
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A0D10F137;
	Fri, 31 Mar 2023 09:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0132F10F148
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 93A461FE98;
 Fri, 31 Mar 2023 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680254597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJcSgdFmnfHrJ0ZpRg1xALi+u5FWWw3afSDEFFON944=;
 b=zN/ymXKRSusdwLtH16DRQEN1rStQXkM6RDSphAYIculyHnWg+RLsnDiE0ESSLvsTtlwLgd
 gVAKGGAynEcDg1bKCGZO3WDYQn9/1ER9xH2px3OkfrBCmwD4QJZ9Kx6H8XimVShfxKewHA
 3DTg1QJfrUdR0ADRu8Badppco8sbA3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680254597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJcSgdFmnfHrJ0ZpRg1xALi+u5FWWw3afSDEFFON944=;
 b=OjRzprPPhRZlmUsuwAQaYv0OA65D0eDZMiswbRFpIkDhrEkVe26DmOGzenqnycMOEVirFq
 yL69c0SOdH/2PHCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 787E9133B6;
 Fri, 31 Mar 2023 09:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iC2hHIWmJmTsOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Subject: [PATCH 07/15] fbdev/hpfb: Remove trailing whitespaces
Date: Fri, 31 Mar 2023 11:23:06 +0200
Message-Id: <20230331092314.2209-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331092314.2209-1-tzimmermann@suse.de>
References: <20230331092314.2209-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/hpfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/hpfb.c b/drivers/video/fbdev/hpfb.c
index cdd44e5deafe..77fbff47b1a8 100644
--- a/drivers/video/fbdev/hpfb.c
+++ b/drivers/video/fbdev/hpfb.c
@@ -92,7 +92,7 @@ static int hpfb_setcolreg(unsigned regno, unsigned red, unsigned green,
 
 	if (regno >= info->cmap.len)
 		return 1;
-	
+
 	while (in_be16(fb_regs + 0x6002) & 0x4) udelay(1);
 
 	out_be16(fb_regs + 0x60ba, 0xff);
@@ -143,7 +143,7 @@ static void topcat_blit(int x0, int y0, int x1, int y1, int w, int h, int rr)
 	out_8(fb_regs + WMOVE, fb_bitmask);
 }
 
-static void hpfb_copyarea(struct fb_info *info, const struct fb_copyarea *area) 
+static void hpfb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 {
 	topcat_blit(area->sx, area->sy, area->dx, area->dy, area->width, area->height, RR_COPY);
 }
@@ -315,7 +315,7 @@ static int hpfb_init_one(unsigned long phys_base, unsigned long virt_base)
 	return ret;
 }
 
-/* 
+/*
  * Check that the secondary ID indicates that we have some hope of working with this
  * framebuffer.  The catseye boards are pretty much like topcats and we can muddle through.
  */
@@ -323,7 +323,7 @@ static int hpfb_init_one(unsigned long phys_base, unsigned long virt_base)
 #define topcat_sid_ok(x)  (((x) == DIO_ID2_LRCATSEYE) || ((x) == DIO_ID2_HRCCATSEYE)    \
 			   || ((x) == DIO_ID2_HRMCATSEYE) || ((x) == DIO_ID2_TOPCAT))
 
-/* 
+/*
  * Initialise the framebuffer
  */
 static int hpfb_dio_probe(struct dio_dev *d, const struct dio_device_id *ent)
-- 
2.40.0

