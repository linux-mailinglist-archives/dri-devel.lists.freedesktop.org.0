Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E951447F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3226E10EC32;
	Fri, 29 Apr 2022 08:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E0E89F89
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/nkZHXCBB5ZrJnB24ro/1pCmNvdbhB1vwTZ80wJLns=;
 b=SvJIv2vRliREQYsjKyjlx+FUl0eo4WI19IemMGVaOiS1S7z8o2DXkDAp72ZmoUfiB6TxfK
 FHVaKE0yJyexY0uGxwvTyXQTj3q0rNSLWaTE5+M79KZNnnPMnjhlYbjbVgYdEizRApnyyv
 TRxXv7ECDZMNfi9z1XQbtt6LGyKdQ0M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-XqddTsAfP6i8n5Vrvd8RdQ-1; Fri, 29 Apr 2022 04:43:19 -0400
X-MC-Unique: XqddTsAfP6i8n5Vrvd8RdQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 g3-20020a7bc4c3000000b0039409519611so2151324wmk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/nkZHXCBB5ZrJnB24ro/1pCmNvdbhB1vwTZ80wJLns=;
 b=lEJwLxtAZMb+eXeL5VqTllit2hI3nIWrOBLjlbg3mXF5B9/hdgbIqMMaCAhCcAZgnT
 sy57Xitb1Ldu+TJq+Ryf1qM2U8FAlRolaeQ9ENIYf/uJSZyuiJXh+s58llZIbFESzDJP
 UVn6YMYQN/7AwPA1xg3AoHW0nUBaRLZY4DlObUUnVV/QRXPq62EpNnGqpv4OPOxz1OC3
 VdTWBICMpFnFgtLh7GVHnGy0M/EKvhVNRkC/9iDDhvDqQeLDYad/yY44SyCealrEBZrB
 k8jMmZFwkP7mEgjgbKwscu4fw+lgALBP7koZp/9GNAqoTVDXeNRfNHVrcGxbXUjUm4D7
 qgyg==
X-Gm-Message-State: AOAM533A0p8E2yHpHT8YjYMCEMcLL1kkukQj/15/Ch1jFhNXdjlwxILc
 0KwJDdMlF2Z/4CoI+IAHA3yMXqg2AvIH6qL6bKVX8tEc9q7e4ZnHrs1ZiQ90Z3/Zgo5gyDLtfVF
 3g8VMhUuICU5fd1yqL1WKfmqt0h6S
X-Received: by 2002:adf:decb:0:b0:20a:c975:8eec with SMTP id
 i11-20020adfdecb000000b0020ac9758eecmr28945997wrn.438.1651221797471; 
 Fri, 29 Apr 2022 01:43:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8Bnodipm9XVNni3rYsFrTH34G/LMUhH0fq+PeE59BdcIE+fgw0hrkNZbBfqT2Hiuz7RWIbw==
X-Received: by 2002:adf:decb:0:b0:20a:c975:8eec with SMTP id
 i11-20020adfdecb000000b0020ac9758eecmr28945970wrn.438.1651221797201; 
 Fri, 29 Apr 2022 01:43:17 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:43:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 08/11] fbdev: Fix race between sysfb and framebuffer
 devices registration
Date: Fri, 29 Apr 2022 10:42:50 +0200
Message-Id: <20220429084253.1085911-9-javierm@redhat.com>
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

The platform devices registered by sysfb match with firmware-based DRM or
fbdev drivers, that are used to have early graphics using a framebuffer
provided by the system firmware.

DRM or fbdev drivers later are probed and remove all conflicting framebuffers,
leading to these platform devices for generic drivers to be unregistered.

But the current solution has a race, since the sysfb_init() function could
be called after a DRM driver is probed and requested to unregister devices
for drivers with conflicting framebuffes.

To prevent this, disable any future sysfb platform device registration by
calling sysfb_disable(), if either a framebuffer device or a DRM device is
registered. Since in that case a display will already be present.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v3)

Changes in v3:
- Call sysfb_disable() when a fbdev framebuffer is registered rather
  than when conflicting framebuffers are removed (Thomas Zimmermann).
- Drop Daniel Vetter's Reviewed-by tag since patch changed a lot.

Changes in v2:
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).

 drivers/video/fbdev/core/fbmem.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index d6ae33990f40..7583296481b0 100644
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
@@ -1903,6 +1904,17 @@ register_framebuffer(struct fb_info *fb_info)
 	ret = do_register_framebuffer(fb_info);
 	mutex_unlock(&registration_lock);
 
+	/*
+	 * If a driver registers a framebuffer device, then it can be assumed
+	 * that a display will be present and there is no need for a generic
+	 * driver using the firmware setup system framebuffer.
+	 *
+	 * Disable sysfb and prevent registering simple framebuffer devices,
+	 * but only do it for framebuffers that are not provided by firmware.
+	 */
+	if (!(fb_info->flags & FBINFO_MISC_FIRMWARE))
+		sysfb_disable();
+
 	return ret;
 }
 EXPORT_SYMBOL(register_framebuffer);
-- 
2.35.1

