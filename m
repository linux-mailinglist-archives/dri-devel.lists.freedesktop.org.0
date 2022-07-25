Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3157FA88
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 09:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9529112BCC;
	Mon, 25 Jul 2022 07:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47200112BCC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658735648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gjSp1VwYgFdF3r/pc3Q0KhJt/Ooi2/fe36LMyPMHMA0=;
 b=H4I5HKjY6R6CyX513hVNZb7T6blgj9FsSy0aXKxpGKcVhaf6FLEEErpAzwUCx4ce8i91OP
 6zy2P3VTNEJks63QTlB9ssXyn4M6dAft3bm/hbez65Ye3/xVIulpYhIyJsYdQY9ieTf/As
 PCauGwjkEBwMNx2ZPPdehLMop2zhPyI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-4-GVi8U2NWa06-esLe206Q-1; Mon, 25 Jul 2022 03:54:06 -0400
X-MC-Unique: 4-GVi8U2NWa06-esLe206Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 bh18-20020a05600c3d1200b003a32044cc9fso5809662wmb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 00:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gjSp1VwYgFdF3r/pc3Q0KhJt/Ooi2/fe36LMyPMHMA0=;
 b=NRyzSIEYD5kuilKoLpVJd/MMBvlxO3QkGz430pJB1s2DDvc7j/N8J+xT3QfKxjJlEk
 BD30OeYMdeacFiakRaqa5fkdVrbHWSJTgLnXQdhgCbpZBfic5fdCkfYHcyRdNccPOPoQ
 YsCMRpv7OnPcFAnUg7xpsoGt3maa/RcLsz2wTeQAimG7Mw9/V2eDRSZ1rnfr/mxc2cYu
 J+oCbPbaMr9CHS5MNR7g2EQ+1cK/QqHp4L6t6JCQFCcWTxH5SJ2hKFetFXnE6jvW6Rji
 F8ifHSdyOKqlwD/BOl3ETKD8Xt/G+YKXe2l1rL/SyfYFkKHetAIRvWIJ9tgLh8G5ftnG
 eYjg==
X-Gm-Message-State: AJIora9VrCwAYAx5INHQZLyDVRASrgjEht1NUyOEF2sKW7ql31B3v06h
 QoNgZNLvznPifj+g/ecny4MESFhlGWfCE7/GVgGHEHUJQZkYH+mCfQEpjJI6iO5b17vw7c/tJfz
 TW4CaJQQ6J1M52aBPRaCNI14UV7Gc
X-Received: by 2002:a5d:4448:0:b0:21e:640d:337c with SMTP id
 x8-20020a5d4448000000b0021e640d337cmr6960385wrr.572.1658735645235; 
 Mon, 25 Jul 2022 00:54:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1suU5FTfkKK40ECam9k1/4kpNk1ekZHVHPUssTBMkFcGkvOyZlSDPJGMC7bA8bJaSq6TebPUA==
X-Received: by 2002:a5d:4448:0:b0:21e:640d:337c with SMTP id
 x8-20020a5d4448000000b0021e640d337cmr6960371wrr.572.1658735645053; 
 Mon, 25 Jul 2022 00:54:05 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003a33227e49bsm13439251wms.4.2022.07.25.00.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 00:54:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: Make registered_fb[] private to fbmem.c
Date: Mon, 25 Jul 2022 09:54:00 +0200
Message-Id: <20220725075400.68478-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.1
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

No driver access this anymore, except for the olpc dcon fbdev driver but
that has been marked as broken anyways by commit de0952f267ff ("staging:
olpc_dcon: mark driver as broken").

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/core/fbmem.c | 6 +++---
 include/linux/fb.h               | 6 ------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 6ae1c5fa19f9..1e70d8c67653 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -51,10 +51,10 @@
 static DEFINE_MUTEX(registration_lock);
 
 struct fb_info *registered_fb[FB_MAX] __read_mostly;
-EXPORT_SYMBOL(registered_fb);
-
 int num_registered_fb __read_mostly;
-EXPORT_SYMBOL(num_registered_fb);
+#define for_each_registered_fb(i)		\
+	for (i = 0; i < FB_MAX; i++)		\
+		if (!registered_fb[i]) {} else
 
 bool fb_center_logo __read_mostly;
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 453c3b2b6b8e..0aff76bcbb00 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -627,16 +627,10 @@ extern int fb_get_color_depth(struct fb_var_screeninfo *var,
 extern int fb_get_options(const char *name, char **option);
 extern int fb_new_modelist(struct fb_info *info);
 
-extern struct fb_info *registered_fb[FB_MAX];
-extern int num_registered_fb;
 extern bool fb_center_logo;
 extern int fb_logo_count;
 extern struct class *fb_class;
 
-#define for_each_registered_fb(i)		\
-	for (i = 0; i < FB_MAX; i++)		\
-		if (!registered_fb[i]) {} else
-
 static inline void lock_fb_info(struct fb_info *info)
 {
 	mutex_lock(&info->lock);
-- 
2.37.1

