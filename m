Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CA4A56250
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 09:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8230710E273;
	Fri,  7 Mar 2025 08:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="citeJ5z0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="niCw8GB7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="citeJ5z0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="niCw8GB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BFC10E112
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 08:12:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 354CA1F78C;
 Fri,  7 Mar 2025 08:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmTzZTG5S0MszKdXhIWtgbZKmj3whOMgJYbis2TpPrQ=;
 b=citeJ5z0IchfUE1rQPpbv+ws2Lq545UB1SiJvI1cFhW4q8ZuJS93ViK9Rm8MHYkEIbOQB7
 RzZzMROuwXVCTNT0tB0qyniclLW0zZlYZ2BJhvEb4ry0/dALm1msifKcur1IZwaNPZrnNS
 OxYliXvV2XyBearwcpalDGJNx5IsYe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335126;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmTzZTG5S0MszKdXhIWtgbZKmj3whOMgJYbis2TpPrQ=;
 b=niCw8GB7XE4UgLUeunhNlkphnOpaI2WR54y9WSrV2VDzxeOYQZFLpvvHg3sGpCaY0JQphh
 0lobxD70tsXcUYDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmTzZTG5S0MszKdXhIWtgbZKmj3whOMgJYbis2TpPrQ=;
 b=citeJ5z0IchfUE1rQPpbv+ws2Lq545UB1SiJvI1cFhW4q8ZuJS93ViK9Rm8MHYkEIbOQB7
 RzZzMROuwXVCTNT0tB0qyniclLW0zZlYZ2BJhvEb4ry0/dALm1msifKcur1IZwaNPZrnNS
 OxYliXvV2XyBearwcpalDGJNx5IsYe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335126;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmTzZTG5S0MszKdXhIWtgbZKmj3whOMgJYbis2TpPrQ=;
 b=niCw8GB7XE4UgLUeunhNlkphnOpaI2WR54y9WSrV2VDzxeOYQZFLpvvHg3sGpCaY0JQphh
 0lobxD70tsXcUYDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8C4F13A53;
 Fri,  7 Mar 2025 08:12:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QP+LL1WqymftLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Mar 2025 08:12:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com, admin@kodeit.net, gargaditya08@live.com,
 jani.nikula@intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/5] drm/udl: Set struct drm_device.dma_dev
Date: Fri,  7 Mar 2025 09:04:03 +0100
Message-ID: <20250307080836.42848-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307080836.42848-1-tzimmermann@suse.de>
References: <20250307080836.42848-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,poorly.run,linaro.org,amd.com,kodeit.net,live.com,intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLk1j8fm6pferx3phn9ndszqb3)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com]
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

Set the dma_dev field provided by the DRM device. Required for PRIME
dma-buf import. Remove the driver's implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.c  | 17 -----------------
 drivers/gpu/drm/udl/udl_drv.h  |  1 -
 drivers/gpu/drm/udl/udl_main.c | 14 +++++++-------
 3 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 05b3a152cc33..3b56ca2f6eb8 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -49,22 +49,6 @@ static int udl_usb_reset_resume(struct usb_interface *interface)
 	return drm_mode_config_helper_resume(dev);
 }
 
-/*
- * FIXME: Dma-buf sharing requires DMA support by the importing device.
- *        This function is a workaround to make USB devices work as well.
- *        See todo.rst for how to fix the issue in the dma-buf framework.
- */
-static struct drm_gem_object *udl_driver_gem_prime_import(struct drm_device *dev,
-							  struct dma_buf *dma_buf)
-{
-	struct udl_device *udl = to_udl(dev);
-
-	if (!udl->dmadev)
-		return ERR_PTR(-ENODEV);
-
-	return drm_gem_prime_import_dev(dev, dma_buf, udl->dmadev);
-}
-
 DEFINE_DRM_GEM_FOPS(udl_driver_fops);
 
 static const struct drm_driver driver = {
@@ -73,7 +57,6 @@ static const struct drm_driver driver = {
 	/* GEM hooks */
 	.fops = &udl_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
-	.gem_prime_import = udl_driver_gem_prime_import,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index be00dc1d87a1..e67e7e2e6f1f 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -51,7 +51,6 @@ struct urb_list {
 struct udl_device {
 	struct drm_device drm;
 	struct device *dev;
-	struct device *dmadev;
 
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3ebe2ce55dfd..cbb0169cc030 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -308,12 +308,17 @@ int udl_init(struct udl_device *udl)
 {
 	struct drm_device *dev = &udl->drm;
 	int ret = -ENOMEM;
+	struct device *dma_dev;
 
 	DRM_DEBUG("\n");
 
-	udl->dmadev = usb_intf_get_dma_device(to_usb_interface(dev->dev));
-	if (!udl->dmadev)
+	dma_dev = usb_intf_get_dma_device(to_usb_interface(dev->dev));
+	if (dma_dev) {
+		drm_dev_set_dma_dev(dev, dma_dev);
+		put_device(dma_dev);
+	} else {
 		drm_warn(dev, "buffer sharing not supported"); /* not an error */
+	}
 
 	mutex_init(&udl->gem_lock);
 
@@ -343,18 +348,13 @@ int udl_init(struct udl_device *udl)
 err:
 	if (udl->urbs.count)
 		udl_free_urb_list(dev);
-	put_device(udl->dmadev);
 	DRM_ERROR("%d\n", ret);
 	return ret;
 }
 
 int udl_drop_usb(struct drm_device *dev)
 {
-	struct udl_device *udl = to_udl(dev);
-
 	udl_free_urb_list(dev);
-	put_device(udl->dmadev);
-	udl->dmadev = NULL;
 
 	return 0;
 }
-- 
2.48.1

