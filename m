Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD45172EF
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 17:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4283010EF3A;
	Mon,  2 May 2022 15:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A3F10EEF8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 15:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651505951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NjxoxE0JKElHTb/WpKcB2BiZO2PHnuo9tVxz/TUikho=;
 b=cwDnCrjuE+pRUGjeAk5GjoKHLR0AOuxxK43jVNk0hHAAlBD1j9SGJIc4rVXydLm58cqjwu
 QcccQ7pQfUtMlHY95WFR4x+Dl3NokY5ku8gGODusp3hjWW3wLED39FDqyoQtc0tPmcRisa
 ZoeIX26X3LWJqccUktgIIX0RmQ53uAg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-zfiukZDKMr27LJ-V6f0dAw-1; Mon, 02 May 2022 11:39:10 -0400
X-MC-Unique: zfiukZDKMr27LJ-V6f0dAw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so5417587wra.15
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 08:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NjxoxE0JKElHTb/WpKcB2BiZO2PHnuo9tVxz/TUikho=;
 b=X20ouXC/WurjZEMFcoNF+hTbbqf9IKY0+MN/aON0JG52iNe+BPfHLPoSd0iLwwYotM
 wJzGEepjDlhlLJVOnD3W3AgUv7AtzQwQO19aSEsRphiRzHgnk+ZAFn9h51TUkAq1MA+0
 ZHU9zmvkAuzO2QZABbAm1sqllNkpPEqOaFkM07mNf96ks8H58WHw2pELL2MPR8TXAbBz
 ggwPU2EwNakA35FaiwtVHjhJjzl316Bd4gA1wVobl0r+huc2LY35hM2zKt44z7n7YrWc
 Ozag1A11c7R7u+SHdrCBKiER58/IoE+6VRrIgZtm4VqFaSXZVA0kGZzDAlFuvTto6TvW
 VKHw==
X-Gm-Message-State: AOAM530CbofFSt5XpUt0v9yJdYz/cXjJpxdsH6P/DdHRWazAu1Lart2i
 Mcu7N1TocbFDZzvBNkiDEXFUKorwLr1O2ic8q2cveBZrqP+CqdtvPKDsaiudYUm106kNA43fvUS
 V4P1iujDwcWyz/Sz5OkETHE2ekFv1
X-Received: by 2002:adf:f4c5:0:b0:20a:ece1:1e91 with SMTP id
 h5-20020adff4c5000000b0020aece11e91mr9894283wrp.172.1651505948831; 
 Mon, 02 May 2022 08:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3Da6qZWFhP++jyhVMD/l4xJcEKuWzBbFQeF2rJfhQtQ7IqvFSHRl36OTYCsrPs3Om4eZVZw==
X-Received: by 2002:adf:f4c5:0:b0:20a:ece1:1e91 with SMTP id
 h5-20020adff4c5000000b0020aece11e91mr9894274wrp.172.1651505948606; 
 Mon, 02 May 2022 08:39:08 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v28-20020adfa1dc000000b0020c5253d923sm7294489wrv.111.2022.05.02.08.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 08:39:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Date: Mon,  2 May 2022 17:39:00 +0200
Message-Id: <20220502153900.408522-4-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502153900.408522-1-javierm@redhat.com>
References: <20220502153900.408522-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Indicate to fbdev subsystem that the registered framebuffer is provided by
the system firmware, so that it can handle accordingly. For example, would
unregister the FB devices if asked to remove the conflicting framebuffers.

Add a new DRM_FB_FW field to drm_fbdev_generic_setup() options parameter.
Drivers can use this to indicate the FB helper initialization that the FB
registered is provided by the firmware, so it can be configured as such.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/drm_fb_helper.c  |  9 +++++++++
 drivers/gpu/drm/tiny/simpledrm.c |  2 +-
 include/drm/drm_fb_helper.h      | 10 ++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index fd0084ad77c3..775e47c5de1f 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1891,6 +1891,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
 		/* don't leak any physical addresses to userspace */
 		info->flags |= FBINFO_HIDE_SMEM_START;
 
+	/* Indicate that the framebuffer is provided by the firmware */
+	if (fb_helper->firmware)
+		info->flags |= FBINFO_MISC_FIRMWARE;
+
 	/* Need to drop locks to avoid recursive deadlock in
 	 * register_framebuffer. This is ok because the only thing left to do is
 	 * register the fbdev emulation instance in kernel_fb_helper_list. */
@@ -2512,6 +2516,8 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
  *
  * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
  *   @dev->mode_config.preferred_depth is used instead.
+ * * DRM_FB_FW: if the framebuffer for the device is provided by the
+ *   system firmware.
  *
  * This function sets up generic fbdev emulation for drivers that supports
  * dumb buffers with a virtual address and that can be mmap'ed.
@@ -2538,6 +2544,7 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int options)
 {
 	struct drm_fb_helper *fb_helper;
 	unsigned int preferred_bpp = DRM_FB_GET_OPTION(DRM_FB_BPP, options);
+	bool firmware = DRM_FB_GET_OPTION(DRM_FB_FW, options);
 	int ret;
 
 	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
@@ -2570,6 +2577,8 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int options)
 		preferred_bpp = 32;
 	fb_helper->preferred_bpp = preferred_bpp;
 
+	fb_helper->firmware = firmware;
+
 	ret = drm_fbdev_client_hotplug(&fb_helper->client);
 	if (ret)
 		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f5b8e864a5cd..5dcc21ea6180 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -901,7 +901,7 @@ static int simpledrm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, 0);
+	drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_FW, 1));
 
 	return 0;
 }
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 740f87560102..77a72d55308d 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -44,6 +44,7 @@ enum mode_set_atomic {
 };
 
 #define DRM_FB_BPP_MASK GENMASK(7, 0)
+#define DRM_FB_FW_MASK GENMASK(8, 8)
 
 /* Using the GNU statement expression extension */
 #define DRM_FB_OPTION(option, value)				\
@@ -197,6 +198,15 @@ struct drm_fb_helper {
 	 * See also: @deferred_setup
 	 */
 	int preferred_bpp;
+
+	/**
+	 * @firmware:
+	 *
+	 * Set if the driver indicates to the FB helper initialization that the
+	 * framebuffer for the device being registered is provided by firmware,
+	 * so that it can pass this on when registering the framebuffer device.
+	 */
+	bool firmware;
 };
 
 static inline struct drm_fb_helper *
-- 
2.35.1

