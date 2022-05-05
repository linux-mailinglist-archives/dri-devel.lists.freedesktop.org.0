Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6B51CBDE
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 00:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B7A10E440;
	Thu,  5 May 2022 22:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34EB10E440
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 22:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651788395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2QUs/dFpZjXD63m2oUdzjI7+Wpnx04uqjBRSmxR+fJo=;
 b=Gr9AbVu5GAZCenfLo4KJ7ptYfezKMwv/Jgc5ISx16rPqAIrJdoqnI/P9MiJLTXBej0l/ir
 Yr3sjNKlL6JzyZNcYQZ+McqAv0nBXpMCWLgCUQiUqw2cbNJhE8cCbUo6/m6fc/WqUhdpQP
 tW3iPaA4/5I8Erv1Lm3h5zMaQfYX1U4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-PoM41cxiO3ySqcrG2mfJoQ-1; Thu, 05 May 2022 18:06:34 -0400
X-MC-Unique: PoM41cxiO3ySqcrG2mfJoQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso2221019wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 15:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2QUs/dFpZjXD63m2oUdzjI7+Wpnx04uqjBRSmxR+fJo=;
 b=0nn605L0RQeILMyRWUanTwg1zUB75gqHBybnC4/kBuQQAxcOtZMHtqTxXfVkNGxsJs
 fQ1ax3ULrlinU86bSSxsvZoZD7i8jcVQCuxypo/IzhWsM/nyJDRwKtYajncNFUY4U1Eq
 PDXDYQwVEB32efI3orRHLz3Tnlrc4WCo8eRotVONBF6xnQYjxxEbDNzqXQGJRGWrCewZ
 nainpD0Uawhwyc1eKxlv47cf+1v3Haat1BKR4QS7PtpDNmHzhhJii1yvN7sxjUHBN93Q
 pB+YLCl/y8SfWfgCWMIlK8TnOMRV1m/z6bUd+ZCAmfSXVyJWSuu93+pG7MNFcxJyLUvB
 RK5A==
X-Gm-Message-State: AOAM530ZA8CKLqw17uvMjyQSakJOUALEGRkQmHRr7YAgMlUominS5jYN
 6gHN9M27OwiTptqE2LtiFLSh+JwPCUSDoeyQZJYtNGl4mRfTS2ZnJDG/h4u78D6ChEQ0A/hC7Ar
 6PnomBH5Szu9N9OBvLFN0WR34fce5
X-Received: by 2002:a5d:6dd1:0:b0:207:92c4:eaef with SMTP id
 d17-20020a5d6dd1000000b0020792c4eaefmr165074wrz.498.1651788393674; 
 Thu, 05 May 2022 15:06:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJuZtwlqObinYznGZMuIaaeVki7i2UMoMVMO9mJCvQ2FsqRQYwPdVCdFx20Il32JBmnuIcGA==
X-Received: by 2002:a5d:6dd1:0:b0:207:92c4:eaef with SMTP id
 d17-20020a5d6dd1000000b0020792c4eaefmr165062wrz.498.1651788393466; 
 Thu, 05 May 2022 15:06:33 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n11-20020a056000170b00b0020c5253d8c7sm2040236wrc.19.2022.05.05.15.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 15:06:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] fbdev: vesafb: Cleanup fb_info in .fb_destroy rather
 than .remove
Date: Fri,  6 May 2022 00:06:31 +0200
Message-Id: <20220505220631.366371-1-javierm@redhat.com>
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
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
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

Changes in v3:
- Only move framebuffer_release() and don't do any other change
  (Daniel Vetter).

Changes in v2:
- Also do the change for vesafb (Thomas Zimmermann).

 drivers/video/fbdev/vesafb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index df6de5a9dd4c..e25e8de5ff67 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -179,6 +179,10 @@ static int vesafb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	return err;
 }
 
+/*
+ * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
+ * of unregister_framebuffer() or fb_release(). Do any cleanup here.
+ */
 static void vesafb_destroy(struct fb_info *info)
 {
 	struct vesafb_par *par = info->par;
@@ -188,6 +192,8 @@ static void vesafb_destroy(struct fb_info *info)
 	if (info->screen_base)
 		iounmap(info->screen_base);
 	release_mem_region(info->apertures->ranges[0].base, info->apertures->ranges[0].size);
+
+	framebuffer_release(info);
 }
 
 static struct fb_ops vesafb_ops = {
@@ -484,10 +490,10 @@ static int vesafb_remove(struct platform_device *pdev)
 {
 	struct fb_info *info = platform_get_drvdata(pdev);
 
+	/* vesafb_destroy takes care of info cleanup */
 	unregister_framebuffer(info);
 	if (((struct vesafb_par *)(info->par))->region)
 		release_region(0x3c0, 32);
-	framebuffer_release(info);
 
 	return 0;
 }
-- 
2.35.1

