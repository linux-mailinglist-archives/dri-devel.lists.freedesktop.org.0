Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8003BA5C921
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 16:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F76410E5F1;
	Tue, 11 Mar 2025 15:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="g3Ls7I7F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E9IoQL8K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g3Ls7I7F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E9IoQL8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A2110E5F4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 15:55:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C792E21184;
 Tue, 11 Mar 2025 15:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741708491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jozy/v8NT0GN5TxtUOTLrsyJUrXwxRJ95fyMlLjn2VI=;
 b=g3Ls7I7FIen1uaVcHU6Rsl2I9tR6aOsR13j9ny3LzmW0NHUyY5EvlGe7WKYLhgYh9RSvaZ
 LAO/0T3TDe8DZMaLIVSF8IN6NnHYUWe9TEOGNaw6mte20cOrXjuMxqApyY3u5yX71a9ppp
 AgRFS18s6Nn6AxjzWPb5mSzigNwllvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741708491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jozy/v8NT0GN5TxtUOTLrsyJUrXwxRJ95fyMlLjn2VI=;
 b=E9IoQL8K20XcmhzjBZW2qloGWQRLqH4KojwlEzry2bwUyJ81B1BkD2ne3tzqrQttpI16tr
 65djfHE6LlZRuaBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=g3Ls7I7F;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=E9IoQL8K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741708491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jozy/v8NT0GN5TxtUOTLrsyJUrXwxRJ95fyMlLjn2VI=;
 b=g3Ls7I7FIen1uaVcHU6Rsl2I9tR6aOsR13j9ny3LzmW0NHUyY5EvlGe7WKYLhgYh9RSvaZ
 LAO/0T3TDe8DZMaLIVSF8IN6NnHYUWe9TEOGNaw6mte20cOrXjuMxqApyY3u5yX71a9ppp
 AgRFS18s6Nn6AxjzWPb5mSzigNwllvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741708491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jozy/v8NT0GN5TxtUOTLrsyJUrXwxRJ95fyMlLjn2VI=;
 b=E9IoQL8K20XcmhzjBZW2qloGWQRLqH4KojwlEzry2bwUyJ81B1BkD2ne3tzqrQttpI16tr
 65djfHE6LlZRuaBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26F0213AB8;
 Tue, 11 Mar 2025 15:54:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id INg2CMtc0GdUdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:51 +0000
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
 Thomas Zimmermann <tzimmermann@suse.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v4 07/25] drm/exynos: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:11 +0100
Message-ID: <20250311155120.442633-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C792E21184
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
 RCPT_COUNT_TWELVE(0.00)[26];
 DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
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

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. No alignment required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 4787fee4696f..ffa1c02b4b1e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -11,6 +11,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/module.h>
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_vma_manager.h>
 #include <drm/exynos_drm.h>
@@ -330,15 +331,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 	unsigned int flags;
 	int ret;
 
+	ret = drm_mode_size_dumb(dev, args, 0, 0);
+	if (ret)
+		return ret;
+
 	/*
 	 * allocate memory to be used for framebuffer.
 	 * - this callback would be called by user application
 	 *	with DRM_IOCTL_MODE_CREATE_DUMB command.
 	 */
 
-	args->pitch = args->width * ((args->bpp + 7) / 8);
-	args->size = args->pitch * args->height;
-
 	if (is_drm_iommu_supported(dev))
 		flags = EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC;
 	else
-- 
2.48.1

