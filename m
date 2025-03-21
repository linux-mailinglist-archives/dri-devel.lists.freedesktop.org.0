Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E0A6B84C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 10:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E97010E775;
	Fri, 21 Mar 2025 09:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rYaNa4/j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hwt1PB2m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rYaNa4/j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hwt1PB2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4118410E777
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:58:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE6821FB8C;
 Fri, 21 Mar 2025 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742551114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgpodcsPOKzQA30aH0HCMN73xMr2cOT8/QilNnjBVcQ=;
 b=rYaNa4/jZDLMSNTV6R0WlVW+pCN0vRhnoWHA9bdsJ/gPA2n5vdJleCEgVvCnEAFI9KV9JJ
 hdJDNPnryDCh6/kOowA9a91j5FFN43GJZeGGGkP52SrkxH1eV5yG6c58bFWPa748uyCmWs
 0tU4jP0P7yB0GzGX83AUTbqCjlnVshw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742551114;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgpodcsPOKzQA30aH0HCMN73xMr2cOT8/QilNnjBVcQ=;
 b=hwt1PB2mRIpfMggszcbmbnS3ssOnFxk1u84kEo4Ed6nPx/5nXT6NnNgYcUdbnkNUOcv5Jj
 9gnyJ7sH/pfFWoDQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="rYaNa4/j";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hwt1PB2m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742551114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgpodcsPOKzQA30aH0HCMN73xMr2cOT8/QilNnjBVcQ=;
 b=rYaNa4/jZDLMSNTV6R0WlVW+pCN0vRhnoWHA9bdsJ/gPA2n5vdJleCEgVvCnEAFI9KV9JJ
 hdJDNPnryDCh6/kOowA9a91j5FFN43GJZeGGGkP52SrkxH1eV5yG6c58bFWPa748uyCmWs
 0tU4jP0P7yB0GzGX83AUTbqCjlnVshw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742551114;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgpodcsPOKzQA30aH0HCMN73xMr2cOT8/QilNnjBVcQ=;
 b=hwt1PB2mRIpfMggszcbmbnS3ssOnFxk1u84kEo4Ed6nPx/5nXT6NnNgYcUdbnkNUOcv5Jj
 9gnyJ7sH/pfFWoDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7493013A68;
 Fri, 21 Mar 2025 09:58:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4NP+Gko43Wd9JAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 09:58:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v4 05/11] backlight: Move blank-state handling into helper
Date: Fri, 21 Mar 2025 10:53:58 +0100
Message-ID: <20250321095517.313713-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250321095517.313713-1-tzimmermann@suse.de>
References: <20250321095517.313713-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BE6821FB8C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 R_RATELIMIT(0.00)[to_ip_from(RLa7dkhshwamq1oe933z1pzp6m)];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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

Move the handling of blank-state updates into a separate helper,
so that is can be called without the fbdev event. No functional
changes.

As a minor improvement over the original code, the update replaces
manual locking with a guard.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/video/backlight/backlight.c | 46 +++++++++++++++++------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index bb01f57c4683..1c43f579396f 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -80,6 +80,30 @@ static const char *const backlight_scale_types[] = {
 
 #if defined(CONFIG_FB_CORE) || (defined(CONFIG_FB_CORE_MODULE) && \
 				defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
+static void backlight_notify_blank(struct backlight_device *bd,
+				   struct device *display_dev,
+				   bool fb_on, bool prev_fb_on)
+{
+	guard(mutex)(&bd->ops_lock);
+
+	if (!bd->ops)
+		return;
+	if (bd->ops->controls_device && !bd->ops->controls_device(bd, display_dev))
+		return;
+
+	if (fb_on && (!prev_fb_on || !bd->use_count)) {
+		if (!bd->use_count++) {
+			bd->props.state &= ~BL_CORE_FBBLANK;
+			backlight_update_status(bd);
+		}
+	} else if (!fb_on && prev_fb_on && bd->use_count) {
+		if (!(--bd->use_count)) {
+			bd->props.state |= BL_CORE_FBBLANK;
+			backlight_update_status(bd);
+		}
+	}
+}
+
 /*
  * fb_notifier_callback
  *
@@ -107,31 +131,15 @@ static int fb_notifier_callback(struct notifier_block *self,
 		return 0;
 
 	bd = container_of(self, struct backlight_device, fb_notif);
-	mutex_lock(&bd->ops_lock);
 
-	if (!bd->ops)
-		goto out;
-	if (bd->ops->controls_device && !bd->ops->controls_device(bd, info->device))
-		goto out;
 	if (fb_bd && fb_bd != bd)
-		goto out;
+		return 0;
 
 	fb_on = fb_blank[0] == FB_BLANK_UNBLANK;
 	prev_fb_on = fb_blank[1] == FB_BLANK_UNBLANK;
 
-	if (fb_on && (!prev_fb_on || !bd->use_count)) {
-		if (!bd->use_count++) {
-			bd->props.state &= ~BL_CORE_FBBLANK;
-			backlight_update_status(bd);
-		}
-	} else if (!fb_on && prev_fb_on && bd->use_count) {
-		if (!(--bd->use_count)) {
-			bd->props.state |= BL_CORE_FBBLANK;
-			backlight_update_status(bd);
-		}
-	}
-out:
-	mutex_unlock(&bd->ops_lock);
+	backlight_notify_blank(bd, info->device, fb_on, prev_fb_on);
+
 	return 0;
 }
 
-- 
2.48.1

