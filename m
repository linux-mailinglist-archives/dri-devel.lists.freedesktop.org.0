Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A8650FD5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D408F10E2CC;
	Mon, 19 Dec 2022 16:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBA410E2C1;
 Mon, 19 Dec 2022 16:05:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 27ADF6106E;
 Mon, 19 Dec 2022 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671465922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hk5EKSUL389KsnsC/G3K1wHJayEh/SOXo4ItcALV1Ag=;
 b=QmXXYlFXdG0dSdHbUVlQ1pBn85w1xRlIeCKDPeIEgqjXvs9YOQpLfBrcpQai8KNTcUgWWE
 PhIZo4ftOUK/WV/kScRCmMUM/wzhlqRxZSS0oh9/O6QLc4EoED4y2IwV5NvvdrWTzneA+p
 zWJeSck1MA+ahx+UzXdP+LnA8VopBMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671465922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hk5EKSUL389KsnsC/G3K1wHJayEh/SOXo4ItcALV1Ag=;
 b=mqL6Vjk4YynhjeMTYPsc0SkyQ4Rtk3Ol/IUTDWJgY23ZYs3AxewUZ0B4rQn6Omkf8Dyedl
 Ch6EJrXpKWzqEsBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E89FB13911;
 Mon, 19 Dec 2022 16:05:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MDD0N8GLoGPeZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:05:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 15/18] fbdev/vesafb: Remove trailing whitespaces
Date: Mon, 19 Dec 2022 17:05:13 +0100
Message-Id: <20221219160516.23436-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221219160516.23436-1-tzimmermann@suse.de>
References: <20221219160516.23436-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/vesafb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index 929d4775cb4b..47ce244e4bb8 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -140,7 +140,7 @@ static int vesafb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	 *  (according to the entries in the `var' structure). Return
 	 *  != 0 for invalid regno.
 	 */
-	
+
 	if (regno >= info->cmap.len)
 		return 1;
 
@@ -209,13 +209,13 @@ static struct fb_ops vesafb_ops = {
 static int vesafb_setup(char *options)
 {
 	char *this_opt;
-	
+
 	if (!options || !*options)
 		return 0;
-	
+
 	while ((this_opt = strsep(&options, ",")) != NULL) {
 		if (!*this_opt) continue;
-		
+
 		if (! strcmp(this_opt, "inverse"))
 			inverse=1;
 		else if (! strcmp(this_opt, "redraw"))
@@ -381,7 +381,7 @@ static int vesafb_probe(struct platform_device *dev)
 	vesafb_defined.pixclock     = 10000000 / vesafb_defined.xres * 1000 / vesafb_defined.yres;
 	vesafb_defined.left_margin  = (vesafb_defined.xres / 8) & 0xf8;
 	vesafb_defined.hsync_len    = (vesafb_defined.xres / 8) & 0xf8;
-	
+
 	vesafb_defined.red.offset    = screen_info.red_pos;
 	vesafb_defined.red.length    = screen_info.red_size;
 	vesafb_defined.green.offset  = screen_info.green_pos;
-- 
2.39.0

