Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC334F9A40
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183C610E4BA;
	Fri,  8 Apr 2022 16:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F297910E491
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649434431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NpBw4lqbBFDRVqxgjOkgfaUZ1HLPBwF1iC6qPlab68=;
 b=JZyiNuF4HXQ8eHxtuoFFM2CA82c+YveRKYcXaJqVuEpKG/Wzj1D2L/O/wCnmIBBbbbS9+s
 9qB7wHgUtpRt3GfjpAMN4d8xjl1S+O05V+PaZTLRo5EqJ3VQtodEvbfG15ZUDxw8KG2hSb
 thu0IIXICp/7A+YwqzeQvF/X4bkRuNE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-nOyLUbI6O5S_8vzuJ5B4Dw-1; Fri, 08 Apr 2022 12:13:48 -0400
X-MC-Unique: nOyLUbI6O5S_8vzuJ5B4Dw-1
Received: by mail-wr1-f72.google.com with SMTP id
 105-20020adf82f2000000b002079aba50b9so407693wrc.18
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+NpBw4lqbBFDRVqxgjOkgfaUZ1HLPBwF1iC6qPlab68=;
 b=HUIUZzPvksdl3iZCYaCE0TOqUnOSJXgJveLUx4jdoWk75NSSCx30RsjSGLss9C///g
 QK7ebg0DMOL8W5lo3DzCZjAiMEZexTIYqylHfH2llV06fz7/s8sI+xmvx3cZ8i2Ku9IE
 2tNl29jBIgmySzmoY01UL/j3GCnZxlUYjL13jeawuWAzyUJ2EyH0J0EiiaAKEcEiEC0c
 WEh9sGHQkERO+0rXWZExl4dgV46uEFyzQENALc9x9iXby84gTGfYsCd1/jdv0LMdpE0k
 HZBdSlqD7YElYEGdAjw8tGRFVMU7c/7eXvnlQvZsI03agvLugedk1lr5c+zMb6IpEH9s
 0jng==
X-Gm-Message-State: AOAM530bK290d8GQmslkROOPSuHT/Eb9iiJmLT7xivKUDUPxf3N0dku4
 F3ujVJWOJ+BGAgXi6UuyZw6ri3uWuNcfx0MkgKfc0tEtKCegsQl5mbBgYiB3kgKKT82I4BVIBhB
 XjcIZlkvN2oEEjS8rh7D2UlaDR434
X-Received: by 2002:a5d:526f:0:b0:206:1c39:810f with SMTP id
 l15-20020a5d526f000000b002061c39810fmr15159301wrc.139.1649434426833; 
 Fri, 08 Apr 2022 09:13:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwORWvYYZa7FXQJJTC1f/+l/2/E9uRlYGrj8t0VKR/7z+nDTMUHBSWhuUjM5hw14PF+grH6Sg==
X-Received: by 2002:a5d:526f:0:b0:206:1c39:810f with SMTP id
 l15-20020a5d526f000000b002061c39810fmr15159279wrc.139.1649434426543; 
 Fri, 08 Apr 2022 09:13:46 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm14377455wrn.114.2022.04.08.09.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:13:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] Revert "fbdev: Prevent probing generic drivers if a FB
 is already registered"
Date: Fri,  8 Apr 2022 18:13:22 +0200
Message-Id: <20220408161322.270176-6-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408161322.270176-1-javierm@redhat.com>
References: <20220408161322.270176-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Ilya Trukhanov <lahvuun@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

This reverts commit fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee.

With

commit 27599aacbaefcbf2af7b06b0029459bbf682000d
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Jan 25 10:12:18 2022 +0100

    fbdev: Hot-unplug firmware fb devices on forced removal

this should be fixed properly and we can remove this somewhat hackish
check here (e.g. this won't catch drm drivers if fbdev emulation isn't
enabled).

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilya Trukhanov <lahvuun@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Cc: Peter Jones <pjones@redhat.com>
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/video/fbdev/efifb.c    | 11 -----------
 drivers/video/fbdev/simplefb.c | 11 -----------
 2 files changed, 22 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index ea42ba6445b2..edca3703b964 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -351,17 +351,6 @@ static int efifb_probe(struct platform_device *dev)
 	char *option = NULL;
 	efi_memory_desc_t md;
 
-	/*
-	 * Generic drivers must not be registered if a framebuffer exists.
-	 * If a native driver was probed, the display hardware was already
-	 * taken and attempting to use the system framebuffer is dangerous.
-	 */
-	if (num_registered_fb > 0) {
-		dev_err(&dev->dev,
-			"efifb: a framebuffer is already registered\n");
-		return -EINVAL;
-	}
-
 	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 94fc9c6d0411..0ef41173325a 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -413,17 +413,6 @@ static int simplefb_probe(struct platform_device *pdev)
 	struct simplefb_par *par;
 	struct resource *res, *mem;
 
-	/*
-	 * Generic drivers must not be registered if a framebuffer exists.
-	 * If a native driver was probed, the display hardware was already
-	 * taken and attempting to use the system framebuffer is dangerous.
-	 */
-	if (num_registered_fb > 0) {
-		dev_err(&pdev->dev,
-			"simplefb: a framebuffer is already registered\n");
-		return -EINVAL;
-	}
-
 	if (fb_get_options("simplefb", NULL))
 		return -ENODEV;
 
-- 
2.35.1

