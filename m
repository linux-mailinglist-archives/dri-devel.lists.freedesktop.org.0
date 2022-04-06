Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A474F6D20
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE5310E14C;
	Wed,  6 Apr 2022 21:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D118310E0A0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 21:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649281257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2QzSBkwn7Yafa/16sbGGbBUM4FbySeU5GGeHJm/Jx0=;
 b=ATCK0n5/10Ao6VUz0/U8Dq4LyPLLWPNHajpsrtwMOt7cjuTjsWpqbeGNaVLTRXk81+DePg
 K3UP4xHZyy/7mYu2Yg/fOni/P05lbHVg0sC0MfT3xLbE996j75G902ns4XGKwCN8w7GMsR
 oVGBOccLrw1pFWxzVODCXPVHKbEiZ1o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-D2YGC5w5Mba9K3I17P9uGw-1; Wed, 06 Apr 2022 17:40:57 -0400
X-MC-Unique: D2YGC5w5Mba9K3I17P9uGw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r206-20020a1c44d7000000b0038e6a1b25f1so3531899wma.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 14:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U2QzSBkwn7Yafa/16sbGGbBUM4FbySeU5GGeHJm/Jx0=;
 b=cYz+bx0P0A61nYGHXNB+/5WYl2qvt7/YlbyOIkVRymy+Qs4FJymdE+2mW26FdF+G0R
 yfdWyMKNTmRLZmNBWX8hcn1oJHODiwm9oXSR6C6il2ZHNF4WyRdjUM36e5XPNGaMH3Pz
 skbVCYT4+EeJmV+B8uxGFrIE2KzzPJNNitWhMU7/u+8qV/WIUU7p7/tY6DMsS6MWsVdf
 z64X1eRJ/m4GhaPrp3JU60kM+oETVEewMWJymL2xjJdo49LCsI9K8/VWcgFfHTIzJPTq
 LG9AaltrRdPHCsDV7eyn6GNLoWmphWObfAEHC4J7ISU94qUygkpcJczmxSoP4uOrqPOg
 ZKyQ==
X-Gm-Message-State: AOAM5335ipcxfreVVi5nRrLtfFUnqV3FSy4Y2+8nzI+ObN1ngFup6vht
 y596kHbKx6qBdMNLrB32VRW61hgyfXRgcWzmU017QNoiW4otgL3/AcXYJPCUFUm/Ubs/fx2R90Y
 zRhZeXOfIUnz3hxPNefKvaKgRc1T1
X-Received: by 2002:a05:600c:6004:b0:38c:6c00:4316 with SMTP id
 az4-20020a05600c600400b0038c6c004316mr9499670wmb.6.1649281255705; 
 Wed, 06 Apr 2022 14:40:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy98rnXAztsyk4KBqYgyk86f1BpoiJOrcBFIcbWPB9DOuUKh2YKVe/1UDGOsUjrhGSlhCdgYw==
X-Received: by 2002:a05:600c:6004:b0:38c:6c00:4316 with SMTP id
 az4-20020a05600c600400b0038c6c004316mr9499656wmb.6.1649281255447; 
 Wed, 06 Apr 2022 14:40:55 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a05600c511d00b0038e3532b23csm5876020wms.15.2022.04.06.14.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:40:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH 4/5] fbdev: Fix some race conditions between fbmem
 and sysfb
Date: Wed,  6 Apr 2022 23:39:18 +0200
Message-Id: <20220406213919.600294-5-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406213919.600294-1-javierm@redhat.com>
References: <20220406213919.600294-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform devices registered in sysfb match with a firmware-based fbdev
or DRM driver, that are used to have early graphics using framebuffers set
up by the system firmware.

Real DRM drivers later are probed and remove all conflicting framebuffers,
leading to these platform devices for generic drivers to be unregistered.

But the current solution has two issues that this patch fixes:

1) It is a layering violation for the fbdev core to unregister a device
   that was registered by sysfb.

   Instead, the sysfb_try_unregister() helper function can be called for
   sysfb to attempt unregistering the device if is the one registered.

2) The sysfb_init() function could be called after a DRM driver is probed
   and requested to unregister devices for drivers with a conflicting fb.

   To prevent this, disable any future sysfb platform device registration
   by calling sysfb_disable(), if a driver requested to remove conflicting
   framebuffers with remove_conflicting_framebuffers().

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/core/fbmem.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index c1bfb8df9cba..acf641b05d11 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/major.h>
 #include <linux/slab.h>
+#include <linux/sysfb.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
 #include <linux/vt.h>
@@ -1588,7 +1589,10 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 				 * unregister_framebuffer() function that takes it.
 				 */
 				mutex_unlock(&registration_lock);
-				platform_device_unregister(to_platform_device(device));
+				if (!sysfb_try_unregister(device)) {
+					/* sysfb didn't register this device, unregister it */
+					platform_device_unregister(to_platform_device(device));
+				}
 				mutex_lock(&registration_lock);
 				/*
 				 * Restart the removal now that the platform device
@@ -1781,6 +1785,17 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 		do_free = true;
 	}
 
+	/*
+	 * If a driver asked to unregister a platform device registered by
+	 * sysfb, then can be assumed that this is a driver for a display
+	 * that is set up by the system firmware and has a generic driver.
+	 *
+	 * Drivers for devices that don't have a generic driver will never
+	 * ask for this, so let's assume that a real driver for the display
+	 * was already probed and prevent sysfb to register devices later.
+	 */
+	sysfb_disable();
+
 	mutex_lock(&registration_lock);
 	do_remove_conflicting_framebuffers(a, name, primary);
 	mutex_unlock(&registration_lock);
-- 
2.35.1

