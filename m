Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F3FC4053F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8EF10EAEB;
	Fri,  7 Nov 2025 14:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="P82BL2LG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ig2zL+5A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P82BL2LG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ig2zL+5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2735410EAEA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:26:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 89284211FC;
 Fri,  7 Nov 2025 14:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762525577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQKbrIXvqSMxNJUdXoPd9pomVDFVPBjwEwiLonwMJ/0=;
 b=P82BL2LG0hSEz1TYJ9FHyJs5nQr7FkPgePqEBdqyPCxFupHTbfuGOdM7tlOgYQu1feLFgP
 PPUiTSTynzcr0/5CXDW1VKvmi8Pjlyxq2Z23fiHQeXY79tDTi3Y9IcUqZt/OudIx9JZRDh
 T7KnQenJ+Elb0g0pipW9Xp4KAZtOeT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762525577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQKbrIXvqSMxNJUdXoPd9pomVDFVPBjwEwiLonwMJ/0=;
 b=ig2zL+5Aq3s52xbyl7mb7EnGobse5CIk2HoXwu2EHA8ZBcIcC9ZKdJ0o3Szcl05NMCV7+G
 NwJfTJ3kFDVodrCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P82BL2LG;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ig2zL+5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762525577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQKbrIXvqSMxNJUdXoPd9pomVDFVPBjwEwiLonwMJ/0=;
 b=P82BL2LG0hSEz1TYJ9FHyJs5nQr7FkPgePqEBdqyPCxFupHTbfuGOdM7tlOgYQu1feLFgP
 PPUiTSTynzcr0/5CXDW1VKvmi8Pjlyxq2Z23fiHQeXY79tDTi3Y9IcUqZt/OudIx9JZRDh
 T7KnQenJ+Elb0g0pipW9Xp4KAZtOeT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762525577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQKbrIXvqSMxNJUdXoPd9pomVDFVPBjwEwiLonwMJ/0=;
 b=ig2zL+5Aq3s52xbyl7mb7EnGobse5CIk2HoXwu2EHA8ZBcIcC9ZKdJ0o3Szcl05NMCV7+G
 NwJfTJ3kFDVodrCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D06313A60;
 Fri,  7 Nov 2025 14:26:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OA62DYkBDmkaLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Nov 2025 14:26:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/client: log: Implement struct drm_client_funcs.restore
Date: Fri,  7 Nov 2025 15:19:27 +0100
Message-ID: <20251107142612.467817-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107142612.467817-1-tzimmermann@suse.de>
References: <20251107142612.467817-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 89284211FC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[12]; RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,linuxfoundation.org];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
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

Restore the log client's output when the DRM core invokes the restore
callback. Follow the existing behavior of fbdev emulation wrt. the
value of the force parameter.

If force is false, acquire the DRM master lock and reprogram the
display. This is the case when the user-space compositor exists and
the DRM core transfers the display back to the in-kernel client. This
also enables log output during reboots.

If force is true, reprogram without considering the master lock. This
overrides the current compositor and prints the log to the screen. In
case of system malfunction, users can enter SysRq+v to invoke the
emergency error reporting. See Documentation/admin-guide/sysrq.rst for
more information.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_log.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 19e55aa0ed74..4d3005273b27 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -315,6 +315,18 @@ static void drm_log_client_unregister(struct drm_client_dev *client)
 	drm_client_release(client);
 }
 
+static int drm_log_client_restore(struct drm_client_dev *client, bool force)
+{
+	int ret;
+
+	if (force)
+		ret = drm_client_modeset_commit_locked(client);
+	else
+		ret = drm_client_modeset_commit(client);
+
+	return ret;
+}
+
 static int drm_log_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_log *dlog = client_to_drm_log(client);
@@ -348,6 +360,7 @@ static const struct drm_client_funcs drm_log_client_funcs = {
 	.owner		= THIS_MODULE,
 	.free		= drm_log_client_free,
 	.unregister	= drm_log_client_unregister,
+	.restore	= drm_log_client_restore,
 	.hotplug	= drm_log_client_hotplug,
 	.suspend	= drm_log_client_suspend,
 	.resume		= drm_log_client_resume,
-- 
2.51.1

