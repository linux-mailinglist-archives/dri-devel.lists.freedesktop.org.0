Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A056C16A6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBB210E1FD;
	Mon, 20 Mar 2023 15:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1A010E1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:07:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 069DB21AA2;
 Mon, 20 Mar 2023 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679324874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5bhIWlTBxaMr+7HCLOGXRqyCz0ofOUlDW8wgfg/afo=;
 b=yKUzjsRIxTPZXMTNmx9p5GmwE28SqSp/BZLiCR5HF+tvbvdqhjeN75B/mhPB/5Ddduf84a
 MdS6ootazU2x+vexYkgyMIA4nyeN4MSJPT01X65iwB7QZOdHW6jrDfvA2tLLLVbUgRYV9J
 Z79fK6f5DzVkuYBJTnK/1f5qvPYUyz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679324874;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5bhIWlTBxaMr+7HCLOGXRqyCz0ofOUlDW8wgfg/afo=;
 b=3ZSZt9zckDC6tyVWdZ7QIkDD9rVBKYyjynh5+PQ1KghZKx4s/BTYmUAhHfCahP6ZeAFEPn
 kE//pFS7PLHC3oAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF7AF13A00;
 Mon, 20 Mar 2023 15:07:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gBDELcl2GGTXOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 15:07:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH v2 2/8] drm/fbdev-generic: Remove unused prefer_shadow_fbdev
 flag
Date: Mon, 20 Mar 2023 16:07:45 +0100
Message-Id: <20230320150751.20399-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230320150751.20399-1-tzimmermann@suse.de>
References: <20230320150751.20399-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the flag prefer_shadow_fbdev from struct drm_mode_config.
Drivers set this flag to enable shadow buffering in the generic
fbdev emulation. Such shadow buffering is now mandatory, so the
flag is unused.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/tiny/bochs.c        | 1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 1 -
 include/drm/drm_mode_config.h       | 7 -------
 3 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 024346054c70..d254679a136e 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -545,7 +545,6 @@ static int bochs_kms_init(struct bochs_device *bochs)
 
 	bochs->dev->mode_config.preferred_depth = 24;
 	bochs->dev->mode_config.prefer_shadow = 0;
-	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
 	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 
 	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 84d6380b9895..5162a7a12792 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2112,7 +2112,6 @@ int vmw_kms_init(struct vmw_private *dev_priv)
 	dev->mode_config.max_width = dev_priv->texture_max_width;
 	dev->mode_config.max_height = dev_priv->texture_max_height;
 	dev->mode_config.preferred_depth = dev_priv->assume_16bpp ? 16 : 32;
-	dev->mode_config.prefer_shadow_fbdev = !dev_priv->has_mob;
 
 	drm_mode_create_suggested_offset_properties(dev);
 	vmw_kms_create_hotplug_mode_update_property(dev_priv);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index e5b053001d22..973119a9176b 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -890,13 +890,6 @@ struct drm_mode_config {
 	/* dumb ioctl parameters */
 	uint32_t preferred_depth, prefer_shadow;
 
-	/**
-	 * @prefer_shadow_fbdev:
-	 *
-	 * Hint to framebuffer emulation to prefer shadow-fb rendering.
-	 */
-	bool prefer_shadow_fbdev;
-
 	/**
 	 * @quirk_addfb_prefer_xbgr_30bpp:
 	 *
-- 
2.40.0

