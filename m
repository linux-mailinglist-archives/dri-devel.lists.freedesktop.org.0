Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE23DAD6A5C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950B010E7A2;
	Thu, 12 Jun 2025 08:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PGlcarUi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/of6ipu0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PGlcarUi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/of6ipu0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D09910E7A6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:21:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92D731F7CF;
 Thu, 12 Jun 2025 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uX7lGM1x1Fv0mat8PkMcNqnToA4ft/jJ1ag2CDhaFHw=;
 b=PGlcarUiODd7zRQVBRrX5Dgh/pLnzsktA98qbLMgFLsJSVH/cuC4o1Mu83v8wat0dFyDWD
 KetQpBG+lN1LYN7CHEv8xyJMxqRtmf2bJb2YMYg6qSN52de4tLcxCSSbQOilvoIbEBIg2V
 QQVUflr315kfZn3tlNUra7qWubzAQ+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716485;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uX7lGM1x1Fv0mat8PkMcNqnToA4ft/jJ1ag2CDhaFHw=;
 b=/of6ipu0lkmP1IoJ6H6hgiYvzjMKmaBWwOJGoGYUsgDw0XsClMAwNsM/rpTBZ78GPp3+xm
 R6TANpJG8LMArTBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PGlcarUi;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/of6ipu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uX7lGM1x1Fv0mat8PkMcNqnToA4ft/jJ1ag2CDhaFHw=;
 b=PGlcarUiODd7zRQVBRrX5Dgh/pLnzsktA98qbLMgFLsJSVH/cuC4o1Mu83v8wat0dFyDWD
 KetQpBG+lN1LYN7CHEv8xyJMxqRtmf2bJb2YMYg6qSN52de4tLcxCSSbQOilvoIbEBIg2V
 QQVUflr315kfZn3tlNUra7qWubzAQ+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716485;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uX7lGM1x1Fv0mat8PkMcNqnToA4ft/jJ1ag2CDhaFHw=;
 b=/of6ipu0lkmP1IoJ6H6hgiYvzjMKmaBWwOJGoGYUsgDw0XsClMAwNsM/rpTBZ78GPp3+xm
 R6TANpJG8LMArTBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33DFD13A6D;
 Thu, 12 Jun 2025 08:21:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kB8dCwWOSmgILAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, linux@armlinux.org.uk,
 FlorianSchandinat@gmx.de, alchark@gmail.com, krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/14] fbdev: Remove trailing whitespaces
Date: Thu, 12 Jun 2025 10:16:24 +0200
Message-ID: <20250612081738.197826-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612081738.197826-1-tzimmermann@suse.de>
References: <20250612081738.197826-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 92D731F7CF
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[12]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -3.01
X-Spam-Level: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/macmodes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/macmodes.c b/drivers/video/fbdev/macmodes.c
index d6be3c67d3df..cd689161f561 100644
--- a/drivers/video/fbdev/macmodes.c
+++ b/drivers/video/fbdev/macmodes.c
@@ -236,7 +236,7 @@ int mac_vmode_to_var(int vmode, int cmode, struct fb_var_screeninfo *var)
 	case CMODE_8:
 	    var->bits_per_pixel = 8;
 	    var->red.offset = 0;
-	    var->red.length = 8;   
+	    var->red.length = 8;
 	    var->green.offset = 0;
 	    var->green.length = 8;
 	    var->blue.offset = 0;
-- 
2.49.0

