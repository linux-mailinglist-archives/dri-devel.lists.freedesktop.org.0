Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F27514482
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D9D10FBA4;
	Fri, 29 Apr 2022 08:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376C210FBAD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32BFmTqPr/eVAc9kmYw/jW8gg2xRyq+gsg/BzILupkI=;
 b=imc8R0/CLrw9Rf4enKcd59wGernHthf8Djq+V6wM+RfD5ZVhESMUA5XFWXzLOvPIWFyF9t
 sr2a5Kfcf4C7SraBnh595XZpHwXqRK1ca5e6ZzJV5XBC0vLjC6E/lcWi9ZYQvyQ5wM6dAB
 Oqu6qjEVyHIAZfNlzdrW30pQ/ZnQpJE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-1xn253v7PY-8kUewongc4A-1; Fri, 29 Apr 2022 04:43:17 -0400
X-MC-Unique: 1xn253v7PY-8kUewongc4A-1
Received: by mail-wr1-f71.google.com with SMTP id
 p10-20020adfaa0a000000b0020c4829af5fso568548wrd.16
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32BFmTqPr/eVAc9kmYw/jW8gg2xRyq+gsg/BzILupkI=;
 b=7SxB8NkBPC3uux7VYU+Jc3IsS6PxnzVafZZ+vVSwdxnu3OvUHMxZ3R1cHPCFpSVzs6
 q/ZiLyq+C78FC2zDw8iGDFrvouk/59Ld5pf3p9wvER1C+xy7WOUI5oi6YeRpoOG9JqY1
 KgrsT+lOw7zJoemvv7OLcAzMyAxNE655DqFPwuTt2F6s5dfoe42ScWRMtAnR5QgpuMHz
 lmRbnIiLkVFU6Sf7XSjvxU8HMF69f050782Vyqzolzc62jPrwyfNV/boBD7G9dtY8EbZ
 tbXmhr4TGuewM+NKCLtJhPE9ScJP+NCKB1AHjCOCmDw7hLRDmmDS24EUSupSwqy3rgn7
 y2LQ==
X-Gm-Message-State: AOAM533vMCzcJ8hmjjSc+vJhOf+lxtfnb28sZPyG+KdRBCZafkyksudE
 h5HRaGNlP2YcVgX9oHtqibS4e+M3xLlny04azohMRkBk4ZpF2VteipMcHvhPrL+RHBvU2jLusP7
 QV1AZwbdrVabX3hG2THXUZrsc7uFM
X-Received: by 2002:a05:600c:29c4:b0:393:fdfa:9baf with SMTP id
 s4-20020a05600c29c400b00393fdfa9bafmr2106694wmd.26.1651221796244; 
 Fri, 29 Apr 2022 01:43:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpb9GJOon/VWE7cLIvn3hOO2k4R3a9ThVl9BjzphxKGmE7ttlSfqH3kxxBUwJ+8zmSamy6eA==
X-Received: by 2002:a05:600c:29c4:b0:393:fdfa:9baf with SMTP id
 s4-20020a05600c29c400b00393fdfa9bafmr2106674wmd.26.1651221795966; 
 Fri, 29 Apr 2022 01:43:15 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:43:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 07/11] fbdev: Make sysfb to unregister its own
 registered devices
Date: Fri, 29 Apr 2022 10:42:49 +0200
Message-Id: <20220429084253.1085911-8-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429084253.1085911-1-javierm@redhat.com>
References: <20220429084253.1085911-1-javierm@redhat.com>
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
 Helge Deller <deller@gmx.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform devices registered in sysfb match with a firmware-based fbdev
or DRM driver, that are used to have early graphics using framebuffers set
up by the system firmware.

Real DRM drivers later are probed and remove all conflicting framebuffers,
leading to these platform devices for generic drivers to be unregistered.

But the current solution has the problem that sysfb doesn't know when the
device that registered is unregistered. This means that is not able to do
any cleanup if needed since the device pointer may not be valid anymore.

Not all platforms use sysfb to register the simple framebuffer devices,
so an unregistration has to be forced by fbmem if sysfb_try_unregister()
does not succeed at unregister the device.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

---

Changes in v4:
- Drop call to sysfb_disable() in fbmem since is done in other places now.

Changes in v2:
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).

 drivers/video/fbdev/core/fbmem.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 0bb459258df3..d6ae33990f40 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1585,18 +1585,35 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
 			if (!device) {
 				pr_warn("fb%d: no device set\n", i);
 				do_unregister_framebuffer(registered_fb[i]);
-			} else if (dev_is_platform(device)) {
+			} else {
 				/*
 				 * Drop the lock because if the device is unregistered, its
 				 * driver will call to unregister_framebuffer(), that takes
 				 * this lock.
 				 */
 				mutex_unlock(&registration_lock);
-				platform_device_unregister(to_platform_device(device));
+				/*
+				 * First attempt the device to be unregistered by sysfb.
+				 */
+				if (!sysfb_try_unregister(device)) {
+					if (dev_is_platform(device)) {
+						/*
+						 * FIXME: sysfb didn't register this device, the platform
+						 * device was registered in other platform code.
+						 */
+						platform_device_unregister(to_platform_device(device));
+					} else {
+						/*
+						 * If is not a platform device, at least print a warning. A
+						 * fix would add to make the code that registered the device
+						 * to also unregister it.
+						 */
+						pr_warn("fb%d: cannot remove device\n", i);
+						/* call unregister_framebuffer() since the lock was dropped */
+						unregister_framebuffer(registered_fb[i]);
+					}
+				}
 				mutex_lock(&registration_lock);
-			} else {
-				pr_warn("fb%d: cannot remove device\n", i);
-				do_unregister_framebuffer(registered_fb[i]);
 			}
 			/*
 			 * Restart the removal loop now that the device has been
-- 
2.35.1

