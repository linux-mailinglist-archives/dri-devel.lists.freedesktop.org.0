Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16199C44E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478EE10E3E9;
	Mon, 14 Oct 2024 08:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="l+APxzGq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="09iJ4u/N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l+APxzGq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="09iJ4u/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A95B10E3DD;
 Mon, 14 Oct 2024 08:57:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A010421C2B;
 Mon, 14 Oct 2024 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728896266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwCcgLz6S2p+8e6z9b1FWpbGjw0nwSTC12GpMVcwUJw=;
 b=l+APxzGqyOOOsFX6VZPsHUmQu5a/CZ2nkNAKQ6b2aAIVJLdbuiR4H8/AU8bKw9e4UTYnzp
 8CkRECyt169oea/L2CtleQlppqU3+n2GTSbcBLDNx1PbPU58RDWEdJNLnC1QzU2ZS14W7q
 hGArtfMeZ2++yP2BvF6q9dnYAeQ+Kk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728896266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwCcgLz6S2p+8e6z9b1FWpbGjw0nwSTC12GpMVcwUJw=;
 b=09iJ4u/Nbd2rzEgbtWfKm3gcFzxPuu7Vf0DaVVb5L8EpIGj9xYxxVyTGsi8+S1uDOBuEIy
 oRd+Ali8YCCyBcAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=l+APxzGq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="09iJ4u/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728896266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwCcgLz6S2p+8e6z9b1FWpbGjw0nwSTC12GpMVcwUJw=;
 b=l+APxzGqyOOOsFX6VZPsHUmQu5a/CZ2nkNAKQ6b2aAIVJLdbuiR4H8/AU8bKw9e4UTYnzp
 8CkRECyt169oea/L2CtleQlppqU3+n2GTSbcBLDNx1PbPU58RDWEdJNLnC1QzU2ZS14W7q
 hGArtfMeZ2++yP2BvF6q9dnYAeQ+Kk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728896266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwCcgLz6S2p+8e6z9b1FWpbGjw0nwSTC12GpMVcwUJw=;
 b=09iJ4u/Nbd2rzEgbtWfKm3gcFzxPuu7Vf0DaVVb5L8EpIGj9xYxxVyTGsi8+S1uDOBuEIy
 oRd+Ali8YCCyBcAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4643913A79;
 Mon, 14 Oct 2024 08:57:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sHTpDwrdDGfXfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Oct 2024 08:57:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel test robot <lkp@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, stable@vger.kernel.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v4 03/12] drm/fbdev-dma: Select FB_DEFERRED_IO
Date: Mon, 14 Oct 2024 10:55:17 +0200
Message-ID: <20241014085740.582287-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241014085740.582287-1-tzimmermann@suse.de>
References: <20241014085740.582287-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A010421C2B
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[14]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,intel.com:email];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
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

Commit 808a40b69468 ("drm/fbdev-dma: Implement damage handling and
deferred I/O") added deferred I/O for fbdev-dma. Also select the
Kconfig symbol FB_DEFERRED_IO (via FB_DMAMEM_HELPERS_DEFERRED). Fixes
build errors about missing fbdefio, such as

drivers/gpu/drm/drm_fbdev_dma.c:218:26: error: 'struct drm_fb_helper' has no member named 'fbdefio'
  218 |                 fb_helper->fbdefio.delay = HZ / 20;
      |                          ^~
drivers/gpu/drm/drm_fbdev_dma.c:219:26: error: 'struct drm_fb_helper' has no member named 'fbdefio'
  219 |                 fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
      |                          ^~
drivers/gpu/drm/drm_fbdev_dma.c:221:21: error: 'struct fb_info' has no member named 'fbdefio'
  221 |                 info->fbdefio = &fb_helper->fbdefio;
      |                     ^~
drivers/gpu/drm/drm_fbdev_dma.c:221:43: error: 'struct drm_fb_helper' has no member named 'fbdefio'
  221 |                 info->fbdefio = &fb_helper->fbdefio;
      |                                           ^~

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410050241.Mox9QRjP-lkp@intel.com/
Fixes: 808a40b69468 ("drm/fbdev-dma: Implement damage handling and deferred I/O")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: <stable@vger.kernel.org> # v6.11+
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1df4e627e3d3..db2e206a117c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -338,7 +338,7 @@ config DRM_TTM_HELPER
 config DRM_GEM_DMA_HELPER
 	tristate
 	depends on DRM
-	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
+	select FB_DMAMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
 	help
 	  Choose this if you need the GEM DMA helper functions
 
-- 
2.46.0

