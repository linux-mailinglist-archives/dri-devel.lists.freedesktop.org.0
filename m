Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B97437926
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 16:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CA06E5A9;
	Fri, 22 Oct 2021 14:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A6A6E5A9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634913653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Y7NfcTUc72UdelkpBwzcJihYziKx3J+s0xf/LWrgkY=;
 b=iIJKWhy4HMZBdPQokFFhhbTjVL9fzV7+/Ac851cNKTZziQ7Dr3t3HHoegmB9hX3nypUrqM
 meAEhengVkkx7SeZrfHOSkn8OB/HSapNnN5BfdtkAIh7PhaGSmNEttYEYpZEuE0/zOxjdT
 M+xqLfQNd2fJzTyuh4xTsT1Rg7yUNCg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-hujgmZ73MIu31U-5DhBVIw-1; Fri, 22 Oct 2021 10:40:52 -0400
X-MC-Unique: hujgmZ73MIu31U-5DhBVIw-1
Received: by mail-wr1-f71.google.com with SMTP id
 g2-20020a5d5402000000b00166f9cfa67aso1003005wrv.21
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 07:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Y7NfcTUc72UdelkpBwzcJihYziKx3J+s0xf/LWrgkY=;
 b=bHT8fB0rO1jFCEAcoTt7MVf66fSCM0njOga72daqnKiLqKsda2d4fyvbq84VPT2zJK
 rxOTmuOZwgXDcDbP8OIctqi10dej4DzvvRR4xCFixiGiChZyXWxrw6Vr904o0s6TuLuS
 /NmF7TLlb5cK5Cn2In0oMXfmcoCLA0kDN82zyt3PsEp1ZrPjEuAbVlKmePYV2cetPm69
 9Z66iu1qYh35aaT3o/cLfKVeD2ejqbq+bAmewPEjfoascvpr6hu6x8Q1PjcDho357nBu
 xua4vYd6/68dPNdyAIWCFUSGOSv23fEIJBTbDye6dE8SaOOLXnlzjc34sURc4OnT9ZSS
 1zkg==
X-Gm-Message-State: AOAM530BmQlGCLDJGRJHHwtA4NYed+HAJRUdHfP5302r6BIMZG0juZF7
 uwzYnhRMYGK28Kb9hY+ttnUNoz13pX2+Z+Y0nzu42Sv/8ITxIUl+JSDUFvqWw6O++gbPzWGynYW
 x+GzK81VdbhBuIlcL6bxYtA6R411L
X-Received: by 2002:adf:a556:: with SMTP id j22mr256016wrb.431.1634913649845; 
 Fri, 22 Oct 2021 07:40:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrA+8XKgUdKV8FF09Xl8lAf5kXXVCvm7L8ndkX22MUwJziJuYxZIq41IahfWM7uQNg5ZEQQQ==
X-Received: by 2002:adf:a556:: with SMTP id j22mr255978wrb.431.1634913649537; 
 Fri, 22 Oct 2021 07:40:49 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id r205sm8579459wma.3.2021.10.22.07.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 07:40:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/aperture: Add param to disable conflicting
 framebuffers removal
Date: Fri, 22 Oct 2021 16:40:40 +0200
Message-Id: <20211022144040.3418284-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

The simpledrm driver allows to use the frame buffer that was set-up by the
firmware. This gives early video output before the platform DRM driver is
probed and takes over.

But it would be useful to have a way to disable this take over by the real
DRM drivers. For example, there may be bugs in the DRM drivers that could
cause the display output to not work correctly.

For those cases, it would be good to keep the simpledrm driver instead and
at least get a working display as set-up by the firmware.

Let's add a drm.remove_fb boolean kernel command line parameter, that when
set to false will prevent the conflicting framebuffers to being removed.

Since the drivers call drm_aperture_remove_conflicting_framebuffers() very
early in their probe callback, this will cause the drivers' probe to fail.

Thanks to Neal Gompa for the suggestion and Thomas Zimmermann for the idea
on how this could be implemented.

Suggested-by: Neal Gompa <ngompa13@gmail.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
Hello,

I'm sending this as an RFC because I wasn't sure about the correct name for
this module parameter, and also if 'remove_fb=0' is intitutive or instead a
parameter that's enabled is preferred (i.e: 'disable_fb_removal=1').

Best regards,
Javier

 drivers/gpu/drm/drm_aperture.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 74bd4a76b253..0b454c8f7465 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -14,6 +14,11 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 
+static bool drm_aperture_remove_fb = true;
+module_param_named(remove_fb, drm_aperture_remove_fb, bool, 0600);
+MODULE_PARM_DESC(remove_fb,
+		 "Allow conflicting framebuffers removal [default=true]");
+
 /**
  * DOC: overview
  *
@@ -283,6 +288,9 @@ static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t si
  * This function removes graphics device drivers which use memory range described by
  * @base and @size.
  *
+ * The conflicting framebuffers removal can be disabled by setting the drm.remove_fb=0 kernel
+ * command line option. When this is disabled, the function will return an -EINVAL errno code.
+ *
  * Returns:
  * 0 on success, or a negative errno code otherwise
  */
@@ -292,7 +300,12 @@ int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_
 #if IS_REACHABLE(CONFIG_FB)
 	struct apertures_struct *a;
 	int ret;
+#endif
+
+	if (!drm_aperture_remove_fb)
+		return -EINVAL;
 
+#if IS_REACHABLE(CONFIG_FB)
 	a = alloc_apertures(1);
 	if (!a)
 		return -ENOMEM;
@@ -322,6 +335,9 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
  * for any of @pdev's memory bars. The function assumes that PCI device with
  * shadowed ROM drives a primary display and so kicks out vga16fb.
  *
+ * The conflicting framebuffers removal can be disabled by setting the drm.remove_fb=0 kernel
+ * command line option. When this is disabled, the function will return an -EINVAL errno code.
+ *
  * Returns:
  * 0 on success, or a negative errno code otherwise
  */
@@ -331,6 +347,9 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 	resource_size_t base, size;
 	int bar, ret = 0;
 
+	if (!drm_aperture_remove_fb)
+		return -EINVAL;
+
 	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
 		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
 			continue;
-- 
2.31.1

