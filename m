Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMSBB8zFnWnsRwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0D189243
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA03110E5C4;
	Tue, 24 Feb 2026 15:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cdyGuxHM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ixd3cEHJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cdyGuxHM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ixd3cEHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE09610E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 550D73F2C5;
 Tue, 24 Feb 2026 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ogC9nJz/59YAkfvzcmnZu784zE1AQKPP4B7nmOsMQk=;
 b=cdyGuxHMRci9+jjl1vbNozOMDXVoAHI98+G/O4dJI/06G1cAHxJUrNj6g77hN1c8RA4zkj
 lZ+Vgq8LzOHMmNxIhOzcjRC5e0Tg6S0E1RIeSfRDxZImmzUKeir3aoOaXyiEeru5q3mTSM
 y7vzVz5JCfNZSrst7r8weMQCJ3BnyNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ogC9nJz/59YAkfvzcmnZu784zE1AQKPP4B7nmOsMQk=;
 b=Ixd3cEHJrJYBscy/rH73BglcGwyhF0JV5whfwcHUZQyATTbaPv0FDqy11nu70YmjSgmp4H
 ZLysLdHirH6dUAAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ogC9nJz/59YAkfvzcmnZu784zE1AQKPP4B7nmOsMQk=;
 b=cdyGuxHMRci9+jjl1vbNozOMDXVoAHI98+G/O4dJI/06G1cAHxJUrNj6g77hN1c8RA4zkj
 lZ+Vgq8LzOHMmNxIhOzcjRC5e0Tg6S0E1RIeSfRDxZImmzUKeir3aoOaXyiEeru5q3mTSM
 y7vzVz5JCfNZSrst7r8weMQCJ3BnyNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ogC9nJz/59YAkfvzcmnZu784zE1AQKPP4B7nmOsMQk=;
 b=Ixd3cEHJrJYBscy/rH73BglcGwyhF0JV5whfwcHUZQyATTbaPv0FDqy11nu70YmjSgmp4H
 ZLysLdHirH6dUAAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F07E43EA69;
 Tue, 24 Feb 2026 15:37:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cDyDOaHFnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 13/16] drm/st7735r: Rename priv variable to st7735r
Date: Tue, 24 Feb 2026 16:24:50 +0100
Message-ID: <20260224153656.261351-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224153656.261351-1-tzimmermann@suse.de>
References: <20260224153656.261351-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,lechnology.com,kernel.org,linux.intel.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:david@lechnology.com,m:architanant5@gmail.com,m:wens@kernel.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:tzimmermann@suse.de,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A9B0D189243
X-Rspamd-Action: no action

Rename the driver's device variable according to DRM conventions. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sitronix/st7735r.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7735r.c b/drivers/gpu/drm/sitronix/st7735r.c
index 9dd915765a6b..e70c46df0299 100644
--- a/drivers/gpu/drm/sitronix/st7735r.c
+++ b/drivers/gpu/drm/sitronix/st7735r.c
@@ -66,8 +66,8 @@ static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_crtc_state *crtc_state,
 				struct drm_plane_state *plane_state)
 {
-	struct st7735r_device *priv = to_st7735r_device(pipe->crtc.dev);
-	struct mipi_dbi_dev *dbidev = &priv->dbidev;
+	struct st7735r_device *st7735r = to_st7735r_device(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = &st7735r->dbidev;
 	struct mipi_dbi *dbi = &dbidev->dbi;
 	int ret, idx;
 	u8 addr_mode;
@@ -113,7 +113,7 @@ static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
 		break;
 	}
 
-	if (priv->cfg->rgb)
+	if (st7735r->cfg->rgb)
 		addr_mode |= ST7735R_RGB;
 
 	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
@@ -188,7 +188,7 @@ static int st7735r_probe(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	const struct st7735r_cfg *cfg;
 	struct mipi_dbi_dev *dbidev;
-	struct st7735r_device *priv;
+	struct st7735r_device *st7735r;
 	struct drm_device *drm;
 	struct mipi_dbi *dbi;
 	struct gpio_desc *dc;
@@ -199,13 +199,12 @@ static int st7735r_probe(struct spi_device *spi)
 	if (!cfg)
 		cfg = (void *)spi_get_device_id(spi)->driver_data;
 
-	priv = devm_drm_dev_alloc(dev, &st7735r_driver,
-				  struct st7735r_device, dbidev.drm);
-	if (IS_ERR(priv))
-		return PTR_ERR(priv);
+	st7735r = devm_drm_dev_alloc(dev, &st7735r_driver, struct st7735r_device, dbidev.drm);
+	if (IS_ERR(st7735r))
+		return PTR_ERR(st7735r);
 
-	dbidev = &priv->dbidev;
-	priv->cfg = cfg;
+	dbidev = &st7735r->dbidev;
+	st7735r->cfg = cfg;
 
 	dbi = &dbidev->dbi;
 	drm = &dbidev->drm;
-- 
2.52.0

