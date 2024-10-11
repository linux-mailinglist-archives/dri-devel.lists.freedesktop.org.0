Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525C99A6C2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 16:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760BD10EB00;
	Fri, 11 Oct 2024 14:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="omnHMwpK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uZL/+kWf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="omnHMwpK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uZL/+kWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C6110EB00
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 14:46:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1016A1FF0F;
 Fri, 11 Oct 2024 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728657995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHEQ/DKpZKygrH6IzVgf+nuzhQIOxm76CTjJBHX/bdY=;
 b=omnHMwpKqyyN/XtBoMCSp0RU2bAkNzHY8vJ98jaKm10JwmavJ8vG/qFgU3Z4q6FsoCvVlq
 8RvzbCmWa1QAsmZ+SJLBxVEvp4AWcifb+9/BKQKniaV1WO7XSk+g2cUTYjhkNwgHgsciBd
 SakfyAq7l1HquSWfZXKKcwiIiFcaOdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728657995;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHEQ/DKpZKygrH6IzVgf+nuzhQIOxm76CTjJBHX/bdY=;
 b=uZL/+kWfDge0inJzSj9qGh9PTnTxU4wMCmpxOHFIp6QkiCbVgcy7X4AEVjl/iLg8iSaGhq
 L+xqUvYngb2V3zBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=omnHMwpK;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="uZL/+kWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728657995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHEQ/DKpZKygrH6IzVgf+nuzhQIOxm76CTjJBHX/bdY=;
 b=omnHMwpKqyyN/XtBoMCSp0RU2bAkNzHY8vJ98jaKm10JwmavJ8vG/qFgU3Z4q6FsoCvVlq
 8RvzbCmWa1QAsmZ+SJLBxVEvp4AWcifb+9/BKQKniaV1WO7XSk+g2cUTYjhkNwgHgsciBd
 SakfyAq7l1HquSWfZXKKcwiIiFcaOdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728657995;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHEQ/DKpZKygrH6IzVgf+nuzhQIOxm76CTjJBHX/bdY=;
 b=uZL/+kWfDge0inJzSj9qGh9PTnTxU4wMCmpxOHFIp6QkiCbVgcy7X4AEVjl/iLg8iSaGhq
 L+xqUvYngb2V3zBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0B6A13AAF;
 Fri, 11 Oct 2024 14:46:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mOM4LUo6CWc/GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 14:46:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 4/6] drm/panel: panel-samsung-s6e3ha2: Include
 <linux/mod_devicetable.h>
Date: Fri, 11 Oct 2024 16:41:22 +0200
Message-ID: <20241011144632.90434-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011144632.90434-1-tzimmermann@suse.de>
References: <20241011144632.90434-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1016A1FF0F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linaro.org:email];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Include <linux/mod_devicetable.h> directly to get struct of_device_id.
Avoids the proxy include via <linux/backlight.h>

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index ed53787d1dea..364f1c9a16d9 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -11,6 +11,7 @@
 #include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 
-- 
2.46.0

