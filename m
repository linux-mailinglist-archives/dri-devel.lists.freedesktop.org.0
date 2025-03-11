Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682D3A5C94A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 16:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEA010E611;
	Tue, 11 Mar 2025 15:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2Pn7PJ2e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G9+zCNxD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Pn7PJ2e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G9+zCNxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4812410E611
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 15:55:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7CD8E1F452;
 Tue, 11 Mar 2025 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741708497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2QvY6PVclanBPN/7E5Tf5uByFFYe3OXaJ8iZr7ZrX8=;
 b=2Pn7PJ2erySVEjfwNvLRkBYt07s+rg12O+wHz5Kx8n9OJ4WW2HOxkYf/OMOxfhdB1XJ7h5
 +uSJXyzsnpxLT4idjsuZyWyDqBbx4zDzq7/4gewGRBb00dc6rnulW9wHINERup9rI3MchY
 bPgR5ip6GxUBKWhTeBPaZt4f5GuJK5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741708497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2QvY6PVclanBPN/7E5Tf5uByFFYe3OXaJ8iZr7ZrX8=;
 b=G9+zCNxDECef7LxTOmra0fbhNMbTZjVoaNkDoL7lLArKtpIcQIfa2clFEm/eAGymus64VK
 nPDfD+mTu5UqnLBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2Pn7PJ2e;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=G9+zCNxD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741708497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2QvY6PVclanBPN/7E5Tf5uByFFYe3OXaJ8iZr7ZrX8=;
 b=2Pn7PJ2erySVEjfwNvLRkBYt07s+rg12O+wHz5Kx8n9OJ4WW2HOxkYf/OMOxfhdB1XJ7h5
 +uSJXyzsnpxLT4idjsuZyWyDqBbx4zDzq7/4gewGRBb00dc6rnulW9wHINERup9rI3MchY
 bPgR5ip6GxUBKWhTeBPaZt4f5GuJK5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741708497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2QvY6PVclanBPN/7E5Tf5uByFFYe3OXaJ8iZr7ZrX8=;
 b=G9+zCNxDECef7LxTOmra0fbhNMbTZjVoaNkDoL7lLArKtpIcQIfa2clFEm/eAGymus64VK
 nPDfD+mTu5UqnLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E30DA134A0;
 Tue, 11 Mar 2025 15:54:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oEspNtBc0GdUdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 16/25] drm/qxl: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:20 +0100
Message-ID: <20250311155120.442633-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7CD8E1F452
X-Spam-Level: 
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[23];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc),to(RLbwen1niosrcqbxsafh1)];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.de:+]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
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

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
and buffer size. No alignment required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_dumb.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_dumb.c b/drivers/gpu/drm/qxl/qxl_dumb.c
index 17df5c7ccf69..1200946767ce 100644
--- a/drivers/gpu/drm/qxl/qxl_dumb.c
+++ b/drivers/gpu/drm/qxl/qxl_dumb.c
@@ -23,6 +23,8 @@
  *          Alon Levy
  */
 
+#include <drm/drm_dumb_buffers.h>
+
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
@@ -35,14 +37,13 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 	struct qxl_device *qdev = to_qxl(dev);
 	struct qxl_bo *qobj;
 	struct drm_gem_object *gobj;
-	uint32_t handle;
 	int r;
 	struct qxl_surface surf;
-	uint32_t pitch, format;
+	u32 format;
 
-	pitch = args->width * ((args->bpp + 1) / 8);
-	args->size = pitch * args->height;
-	args->size = ALIGN(args->size, PAGE_SIZE);
+	r = drm_mode_size_dumb(dev, args, 0, 0);
+	if (r)
+		return r;
 
 	switch (args->bpp) {
 	case 16:
@@ -57,20 +58,18 @@ int qxl_mode_dumb_create(struct drm_file *file_priv,
 
 	surf.width = args->width;
 	surf.height = args->height;
-	surf.stride = pitch;
+	surf.stride = args->pitch;
 	surf.format = format;
 	surf.data = 0;
 
 	r = qxl_gem_object_create_with_handle(qdev, file_priv,
 					      QXL_GEM_DOMAIN_CPU,
 					      args->size, &surf, &gobj,
-					      &handle);
+					      &args->handle);
 	if (r)
 		return r;
 	qobj = gem_to_qxl_bo(gobj);
 	qobj->is_dumb = true;
 	drm_gem_object_put(gobj);
-	args->pitch = pitch;
-	args->handle = handle;
 	return 0;
 }
-- 
2.48.1

