Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FD951CBDB
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 00:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD09110E3E2;
	Thu,  5 May 2022 22:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6280410E3E2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651788358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOMIAnnTamSRotiOWkLRdWbDfwtm7Vtf7J5gIUBLvsY=;
 b=KVmT3BGatAwG+bW+HbDVFyphnyta6J0lZoMDbXVC/G7ni6bWbOindIwqG+2ioOxLy6TWgA
 0xtMHgKDrbSmH+xXzNimPqwSSigqcGgt+8XZKt3s9KSXylb8hlRDO+oEST6An019LhHs4r
 wbb7SrRjpJDQ5S0tbeGKnxqvtcYPX+w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-rsTBRLtENyqiU5rXhAsdaw-1; Thu, 05 May 2022 18:05:56 -0400
X-MC-Unique: rsTBRLtENyqiU5rXhAsdaw-1
Received: by mail-wr1-f70.google.com with SMTP id
 g7-20020adfbc87000000b0020ac76d254bso1876214wrh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 15:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XOMIAnnTamSRotiOWkLRdWbDfwtm7Vtf7J5gIUBLvsY=;
 b=R+1Ygawrba0Tj2sZfC6HrJrIArWLdV+GfVXmoETVZYF/GkUeGC8pWIljiCRAAOoeAL
 XlnysiDJcQ3y+koKW8E5esh+svFLCN+kZiaaZPDNrCr9G+6hFiCauSgrnIDj5PWfgSMq
 xxbmD8JIP8ZCgYbLH51Whwoepf6qZL8s0wZHkXgu0sUDrSaUtPj1m92AaUR9Tjo2aEL0
 ckWKSN0x0Z6oE5bXR6Nn8p+CrjOKBCZpWNLfNLseTiv3WQbgH8M4V5Y+K54AANZkc3yy
 kwTEwdyukpiQKY/XC0TL4LE6aj0fV+Q1awWwkmTUAEEQNJ+x6QkApE8rwKkS9ZZymtb7
 I3Zg==
X-Gm-Message-State: AOAM531tOUWUwBXLyAkWqWGOtatYabib59s0txGUyBfBuketyZ7vXDj5
 RRKXH+pUYWAO0SAq5iStLk1kCvP+TuOJ0bsa/0Y88FDkjWWc5bsZR4rpdRVrdVjahLYiXWyNVAB
 7ePdVzloyoI970h6Z1idg/I2QPkLa
X-Received: by 2002:a05:600c:214c:b0:394:2dfe:2754 with SMTP id
 v12-20020a05600c214c00b003942dfe2754mr287442wml.135.1651788354980; 
 Thu, 05 May 2022 15:05:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeda1HHZwr4FX+lwN/TaIHgdOKHms0BlDVvSG/oTgRzg2lXGiKrE9u+GvlU9S+3hDsIgrQvw==
X-Received: by 2002:a05:600c:214c:b0:394:2dfe:2754 with SMTP id
 v12-20020a05600c214c00b003942dfe2754mr287430wml.135.1651788354747; 
 Thu, 05 May 2022 15:05:54 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j28-20020a05600c1c1c00b003942a244f39sm7291679wms.18.2022.05.05.15.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 15:05:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] fbdev: efifb: Cleanup fb_info in .fb_destroy rather
 than .remove
Date: Fri,  6 May 2022 00:05:40 +0200
Message-Id: <20220505220540.366218-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505215947.364694-1-javierm@redhat.com>
References: <20220505215947.364694-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver is calling framebuffer_release() in its .remove callback, but
this will cause the struct fb_info to be freed too early. Since it could
be that a reference is still hold to it if user-space opened the fbdev.

This would lead to a use-after-free error if the framebuffer device was
unregistered but later a user-space process tries to close the fbdev fd.

To prevent this, move the framebuffer_release() call to fb_ops.fb_destroy
instead of doing it in the driver's .remove callback.

Strictly speaking, the code flow in the driver is still wrong because all
the hardware cleanupd (i.e: iounmap) should be done in .remove while the
software cleanup (i.e: releasing the framebuffer) should be done in the
.fb_destroy handler. But this at least makes to match the behavior before
commit 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal").

Fixes: 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

(no changes since v1)

 drivers/video/fbdev/efifb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index ea42ba6445b2..cfa3dc0b4eee 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -243,6 +243,10 @@ static void efifb_show_boot_graphics(struct fb_info *info)
 static inline void efifb_show_boot_graphics(struct fb_info *info) {}
 #endif
 
+/*
+ * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
+ * of unregister_framebuffer() or fb_release(). Do any cleanup here.
+ */
 static void efifb_destroy(struct fb_info *info)
 {
 	if (efifb_pci_dev)
@@ -254,6 +258,9 @@ static void efifb_destroy(struct fb_info *info)
 		else
 			memunmap(info->screen_base);
 	}
+
+	framebuffer_release(info);
+
 	if (request_mem_succeeded)
 		release_mem_region(info->apertures->ranges[0].base,
 				   info->apertures->ranges[0].size);
@@ -620,9 +627,9 @@ static int efifb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
+	/* efifb_destroy takes care of info cleanup */
 	unregister_framebuffer(info);
 	sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
-	framebuffer_release(info);
 
 	return 0;
 }
-- 
2.35.1

