Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B726399A6BF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 16:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D4810EB04;
	Fri, 11 Oct 2024 14:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gHIVOL/g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WndF6MpF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gHIVOL/g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WndF6MpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C807D10EB02
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 14:46:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 382442202B;
 Fri, 11 Oct 2024 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728657994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7AkMflKGrNBvcd0/9rLmWv6/HamhCZjWMX1wKaRPGE=;
 b=gHIVOL/glGeWZ6c4YhCatBooTs+2ZC4N9fZT/ycyT0IKlM7fuGLevL5Dz8ZOPzo4iinuYc
 lH2KzuuSv29fAzk7frmWDYR80ohoo0korRYWRqHREF20dpu21TFU3oS0MIYj8YqvKuMpBB
 m2/zpCZP1qD8KGS2FGliZ1fBsB58GtQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728657994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7AkMflKGrNBvcd0/9rLmWv6/HamhCZjWMX1wKaRPGE=;
 b=WndF6MpF2PfGtsHragI+JpXHKXVqDtxPljm0xg5H3g4z1XbEAu+CAUw641hFHJrdrcMiS3
 +9Fcp6QGYMwZMMAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="gHIVOL/g";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WndF6MpF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728657994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7AkMflKGrNBvcd0/9rLmWv6/HamhCZjWMX1wKaRPGE=;
 b=gHIVOL/glGeWZ6c4YhCatBooTs+2ZC4N9fZT/ycyT0IKlM7fuGLevL5Dz8ZOPzo4iinuYc
 lH2KzuuSv29fAzk7frmWDYR80ohoo0korRYWRqHREF20dpu21TFU3oS0MIYj8YqvKuMpBB
 m2/zpCZP1qD8KGS2FGliZ1fBsB58GtQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728657994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7AkMflKGrNBvcd0/9rLmWv6/HamhCZjWMX1wKaRPGE=;
 b=WndF6MpF2PfGtsHragI+JpXHKXVqDtxPljm0xg5H3g4z1XbEAu+CAUw641hFHJrdrcMiS3
 +9Fcp6QGYMwZMMAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA46213AAF;
 Fri, 11 Oct 2024 14:46:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WKwSNEk6CWc/GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 14:46:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>
Subject: [PATCH 1/6] drm/fsl-dcu: Include <linux/of.h>
Date: Fri, 11 Oct 2024 16:41:19 +0200
Message-ID: <20241011144632.90434-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011144632.90434-1-tzimmermann@suse.de>
References: <20241011144632.90434-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 382442202B
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Include <linux/of.h> directly to get of_parse_phandle(). Avoids the
proxy include via <linux/backlight.h>

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Alison Wang <alison.wang@nxp.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 2c2b92324a2e..c418e8496bdf 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/backlight.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
-- 
2.46.0

