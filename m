Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEDD4F9A3E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8074710E4ED;
	Fri,  8 Apr 2022 16:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D725110E491
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649434425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zcEitY10iZAiJ+J3+u8UtqIoWNDWTfj8MjNNemYgu3M=;
 b=U62esd08pu7I6ZgvES0Hj+JwXQvMZaJXO5YBQzbIPMPCzcoA5pRNDlvVhhxi4pM1x2/Ye7
 +Nau8v8a8W9stYxANAXEEVUhYKn4a80mwwq0bzlgD43cxnRzcjhP8wcoaWue2KYve7amwe
 Y2aa+1Lcn9ifLVuf3F/NVxZCRCttoS0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-VfrywZPEMyWS3Ds899-ngQ-1; Fri, 08 Apr 2022 12:13:44 -0400
X-MC-Unique: VfrywZPEMyWS3Ds899-ngQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r127-20020a1c4485000000b0038eaca2b8c9so110260wma.7
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zcEitY10iZAiJ+J3+u8UtqIoWNDWTfj8MjNNemYgu3M=;
 b=rG8SmDOFlj+LtO0O/NXqpZ3hi1vVRPfc8E7TMQmD/4fi+SnoFyfLmjhwBBhGnMTLDj
 pZJ6SATr5CPSabbX69JkxzCB5A8ZTPpV9c78HVBI6hXG3Re0yU4ZT2+2RPqZijAFicAX
 3kS+0O2OgLnHxwbwItGxi/hsSbogXBuCbbaV/QCwgW++TyEcPHk6e1pdb4VXO8Yn6xbR
 0jAgcQSiM5/DiToejY1a9qZy59/eBZXxisNAd4sAEzScPYpPEcWJGT0u2+H6ehpIM5Ij
 agWU9C04dnpmuiKma+9O92BibC3yVUlQoc+q2/5alvsqzyDi8c1u7v+j56xge3Wx6Tvc
 0A1Q==
X-Gm-Message-State: AOAM530pYAdG/vgU1TUEJoqPyP3lhOZCL1zVP72Rc3787FG/VDFzXa/+
 w+twTVd16u/48Dp5wgBbghKzbE4rh16HS/NrMRXNIZlSVaPZC9lll2hLZNPicNDznfRDp9UTucR
 Hi2YhB77vJPqXOFZbwON4+Wi86LBp
X-Received: by 2002:a5d:6785:0:b0:204:f8f:8fab with SMTP id
 v5-20020a5d6785000000b002040f8f8fabmr15369342wru.353.1649434423620; 
 Fri, 08 Apr 2022 09:13:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt3Rj+zw8mIsN24LhLbQy+hWefHkvvpTKfeMVqAFvoZziJC7qiikDxng1MGBPfgLZBQiYEtg==
X-Received: by 2002:a5d:6785:0:b0:204:f8f:8fab with SMTP id
 v5-20020a5d6785000000b002040f8f8fabmr15369313wru.353.1649434423340; 
 Fri, 08 Apr 2022 09:13:43 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm14377455wrn.114.2022.04.08.09.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:13:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] fbdev: Restart conflicting fb removal loop when
 unregistering devices
Date: Fri,  8 Apr 2022 18:13:20 +0200
Message-Id: <20220408161322.270176-4-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408161322.270176-1-javierm@redhat.com>
References: <20220408161322.270176-1-javierm@redhat.com>
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
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers that want to remove registered conflicting framebuffers prior to
register their own framebuffer, calls remove_conflicting_framebuffers().

This function takes the registration_lock mutex, to prevent a races when
drivers register framebuffer devices. But if a conflicting framebuffer
device is found, the underlaying platform device is unregistered and this
will lead to the platform driver .remove callback to be called, which in
turn will call to the unregister_framebuffer() that takes the same lock.

To prevent this, a struct fb_info.forced_out field was used as indication
to unregister_framebuffer() whether the mutex has to be grabbed or not.

A cleaner solution is to drop the lock before platform_device_unregister()
so unregister_framebuffer() can take it when called from the fbdev driver,
and just grab the lock again after the device has been registered and do
a removal loop restart.

Since the framebuffer devices will already be removed, the loop would just
finish when no more conflicting framebuffers are found.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

(no changes since v1)

 drivers/video/fbdev/core/fbmem.c | 29 +++++++++++++++++++----------
 include/linux/fb.h               |  1 -
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index bdd00d381bbc..bcdbbe543466 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1553,6 +1553,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 {
 	int i;
 
+restart_removal:
 	/* check all firmware fbs and kick off if the base addr overlaps */
 	for_each_registered_fb(i) {
 		struct apertures_struct *gen_aper;
@@ -1576,16 +1577,28 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 			 * VESA, EFI, etc. A native driver will then be able to
 			 * allocate the memory range.
 			 *
-			 * If it's not a platform device, at least print a warning. A
-			 * fix would add code to remove the device from the system.
+			 * Drop the lock because if the device is unregistered, its
+			 * drivers will call to unregister_framebuffer() that takes
+			 * this lock.
 			 */
+			mutex_unlock(&registration_lock);
 			if (dev_is_platform(device)) {
-				registered_fb[i]->forced_out = true;
 				platform_device_unregister(to_platform_device(device));
 			} else {
+				/*
+				 * If it's not a platform device, at least print a warning. A
+				 * fix would add to code to remove the device from the system.
+				 */
 				pr_warn("fb%d: cannot remove device\n", i);
-				do_unregister_framebuffer(registered_fb[i]);
+				/* call unregister_framebuffer() so it can take the lock */
+				unregister_framebuffer(registered_fb[i]);
 			}
+			mutex_lock(&registration_lock);
+			/*
+			 * Restart the removal loop now that the device has been
+			 * unregistered and its associated framebuffer gone.
+			 */
+			goto restart_removal;
 		}
 	}
 }
@@ -1892,13 +1905,9 @@ EXPORT_SYMBOL(register_framebuffer);
 void
 unregister_framebuffer(struct fb_info *fb_info)
 {
-	bool forced_out = fb_info->forced_out;
-
-	if (!forced_out)
-		mutex_lock(&registration_lock);
+	mutex_lock(&registration_lock);
 	do_unregister_framebuffer(fb_info);
-	if (!forced_out)
-		mutex_unlock(&registration_lock);
+	mutex_unlock(&registration_lock);
 }
 EXPORT_SYMBOL(unregister_framebuffer);
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index f95da1af9ff6..b781bc721113 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -502,7 +502,6 @@ struct fb_info {
 	} *apertures;
 
 	bool skip_vt_switch; /* no VT switch on suspend/resume required */
-	bool forced_out; /* set when being removed by another driver */
 };
 
 static inline struct apertures_struct *alloc_apertures(unsigned int max_num) {
-- 
2.35.1

