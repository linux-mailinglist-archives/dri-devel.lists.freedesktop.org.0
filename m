Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64489A56252
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 09:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B1110E71B;
	Fri,  7 Mar 2025 08:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vy9E+EcW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n14WCHSx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vy9E+EcW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n14WCHSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B45D10E273
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 08:12:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 57806211EA;
 Fri,  7 Mar 2025 08:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SN7mExs/4ZUB6uYYcQSmwrTDH4lKk4I/1zDfI641u6U=;
 b=vy9E+EcWpVZUXQnxWGXTgItebped704YJBBvjlW1b04lnhtxHtAyJndwnRPUtMZYD8hqQo
 AIc0E5DW0FluN4b3l2wFZV5jOa/tUFV1/dkQg0UBoD5SSWjeizHnfla2+Xpx5r+fEsEDtj
 4cHTRy/9v7CQsX3BUAml1uStfjqsJqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SN7mExs/4ZUB6uYYcQSmwrTDH4lKk4I/1zDfI641u6U=;
 b=n14WCHSxsXyc2bbLPQ5+5t0orxffbGaDonb7fL1GVQcxuBiKrqXc9kAVTav5h0l0sycufw
 WVCoK4Gm9PkwuLDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vy9E+EcW;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=n14WCHSx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SN7mExs/4ZUB6uYYcQSmwrTDH4lKk4I/1zDfI641u6U=;
 b=vy9E+EcWpVZUXQnxWGXTgItebped704YJBBvjlW1b04lnhtxHtAyJndwnRPUtMZYD8hqQo
 AIc0E5DW0FluN4b3l2wFZV5jOa/tUFV1/dkQg0UBoD5SSWjeizHnfla2+Xpx5r+fEsEDtj
 4cHTRy/9v7CQsX3BUAml1uStfjqsJqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SN7mExs/4ZUB6uYYcQSmwrTDH4lKk4I/1zDfI641u6U=;
 b=n14WCHSxsXyc2bbLPQ5+5t0orxffbGaDonb7fL1GVQcxuBiKrqXc9kAVTav5h0l0sycufw
 WVCoK4Gm9PkwuLDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7DEE13A53;
 Fri,  7 Mar 2025 08:12:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sExTN1SqymftLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Mar 2025 08:12:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com, admin@kodeit.net, gargaditya08@live.com,
 jani.nikula@intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/5] drm/gm12u320: Set struct drm_device.dma_dev
Date: Fri,  7 Mar 2025 09:04:01 +0100
Message-ID: <20250307080836.42848-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307080836.42848-1-tzimmermann@suse.de>
References: <20250307080836.42848-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 57806211EA
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,poorly.run,linaro.org,amd.com,kodeit.net,live.com,intel.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLau4tukfh38qp3nirdnk14qe9)];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com]
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

Set the dma_dev field provided by the DRM device. Required for PRIME
dma-buf import. Remove the driver's implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/gm12u320.c | 46 ++++++++++-----------------------
 1 file changed, 13 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 41e9bfb2e2ff..fb0004166f4a 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -86,7 +86,6 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
 
 struct gm12u320_device {
 	struct drm_device	         dev;
-	struct device                   *dmadev;
 	struct drm_simple_display_pipe   pipe;
 	struct drm_connector	         conn;
 	unsigned char                   *cmd_buf;
@@ -602,22 +601,6 @@ static const uint64_t gm12u320_pipe_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
-/*
- * FIXME: Dma-buf sharing requires DMA support by the importing device.
- *        This function is a workaround to make USB devices work as well.
- *        See todo.rst for how to fix the issue in the dma-buf framework.
- */
-static struct drm_gem_object *gm12u320_gem_prime_import(struct drm_device *dev,
-							struct dma_buf *dma_buf)
-{
-	struct gm12u320_device *gm12u320 = to_gm12u320(dev);
-
-	if (!gm12u320->dmadev)
-		return ERR_PTR(-ENODEV);
-
-	return drm_gem_prime_import_dev(dev, dma_buf, gm12u320->dmadev);
-}
-
 DEFINE_DRM_GEM_FOPS(gm12u320_fops);
 
 static const struct drm_driver gm12u320_drm_driver = {
@@ -630,7 +613,6 @@ static const struct drm_driver gm12u320_drm_driver = {
 
 	.fops		 = &gm12u320_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
-	.gem_prime_import = gm12u320_gem_prime_import,
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 };
 
@@ -645,6 +627,7 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 {
 	struct gm12u320_device *gm12u320;
 	struct drm_device *dev;
+	struct device *dma_dev;
 	int ret;
 
 	/*
@@ -660,16 +643,20 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 		return PTR_ERR(gm12u320);
 	dev = &gm12u320->dev;
 
-	gm12u320->dmadev = usb_intf_get_dma_device(to_usb_interface(dev->dev));
-	if (!gm12u320->dmadev)
+	dma_dev = usb_intf_get_dma_device(interface);
+	if (dma_dev) {
+		drm_dev_set_dma_dev(dev, dma_dev);
+		put_device(dma_dev);
+	} else {
 		drm_warn(dev, "buffer sharing not supported"); /* not an error */
+	}
 
 	INIT_DELAYED_WORK(&gm12u320->fb_update.work, gm12u320_fb_update_work);
 	mutex_init(&gm12u320->fb_update.lock);
 
 	ret = drmm_mode_config_init(dev);
 	if (ret)
-		goto err_put_device;
+		return ret;
 
 	dev->mode_config.min_width = GM12U320_USER_WIDTH;
 	dev->mode_config.max_width = GM12U320_USER_WIDTH;
@@ -679,15 +666,15 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 
 	ret = gm12u320_usb_alloc(gm12u320);
 	if (ret)
-		goto err_put_device;
+		return ret;
 
 	ret = gm12u320_set_ecomode(gm12u320);
 	if (ret)
-		goto err_put_device;
+		return ret;
 
 	ret = gm12u320_conn_init(gm12u320);
 	if (ret)
-		goto err_put_device;
+		return ret;
 
 	ret = drm_simple_display_pipe_init(&gm12u320->dev,
 					   &gm12u320->pipe,
@@ -697,31 +684,24 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 					   gm12u320_pipe_modifiers,
 					   &gm12u320->conn);
 	if (ret)
-		goto err_put_device;
+		return ret;
 
 	drm_mode_config_reset(dev);
 
 	usb_set_intfdata(interface, dev);
 	ret = drm_dev_register(dev, 0);
 	if (ret)
-		goto err_put_device;
+		return ret;
 
 	drm_client_setup(dev, NULL);
 
 	return 0;
-
-err_put_device:
-	put_device(gm12u320->dmadev);
-	return ret;
 }
 
 static void gm12u320_usb_disconnect(struct usb_interface *interface)
 {
 	struct drm_device *dev = usb_get_intfdata(interface);
-	struct gm12u320_device *gm12u320 = to_gm12u320(dev);
 
-	put_device(gm12u320->dmadev);
-	gm12u320->dmadev = NULL;
 	drm_dev_unplug(dev);
 	drm_atomic_helper_shutdown(dev);
 }
-- 
2.48.1

