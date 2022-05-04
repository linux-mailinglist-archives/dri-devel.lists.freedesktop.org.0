Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E8519EB9
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CA810FB99;
	Wed,  4 May 2022 11:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBF410FB99
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651665581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hdaz9MpZoIlHo5W6Yr3E01ttRcC4gjvc5tNziIXBlcs=;
 b=g2Rh8U3Qk93oZZVPuLRochTgH1dnnr0lorTgh1Le61yoo4E2oOH7MCi2khAfu8Ek+YHvn0
 9nJ5u+EpGinxEEzf85NrzhMRVo8ssePUEy3lw6rtPRtZZyUIllguGYliyNY6r2jIuRjqCX
 /q2AiP/aetDjSflifVEn2whrgR2WvnU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-7Y-9UI5kNT6t95nVRBweIQ-1; Wed, 04 May 2022 07:59:33 -0400
X-MC-Unique: 7Y-9UI5kNT6t95nVRBweIQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so558478wmc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hdaz9MpZoIlHo5W6Yr3E01ttRcC4gjvc5tNziIXBlcs=;
 b=6i2jDIaDsv2LomHVNJwnFl4huDvr0b3vrISBTEDLgV4eGt7TUq7c2428XYhoy9cWwu
 dSt75eeP8bTqx6XvtzThFzvqoesqUjqZ0uUD9dDAPjTY3aVXhIqFjXeq+B7L6w84kKXR
 /f0Yq5mfufR9SRIhwmMbmSadPX65edSeMSvw2zRA/xlWQpJreMrPKHFK4vpXk6Zkzi3T
 mlx+V3r1ubJT6GNrG1Gi0QMbAhvjLQyDVSXS9L8JjfQ9k4zLMhKzczd/PT0nwjKNqP2u
 JKm17/jdNy+ysFkyGm9y+7tnFqafTH3NZ2B8qKRczGUaGtEY1diRciOSU8XbTDd/0saI
 ZIHA==
X-Gm-Message-State: AOAM5325CE7VaDuTcEz0rodgioiDBa3vskRKhnqtlI7rb2S4voCHwy6P
 B3Z8noGQXGvQYFHIe32ISf7SfRX3LDNTFkcHIoXrKA4LEh19hKqNOnFTOxi1t1By3UOA132hFt8
 Qx9VoWlzfW7cn+tkiKhlSsPwnehb9
X-Received: by 2002:a05:6000:1844:b0:20c:5672:9573 with SMTP id
 c4-20020a056000184400b0020c56729573mr15065536wri.538.1651665572009; 
 Wed, 04 May 2022 04:59:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgDtpAe/DLUybOoXaFzCCcl0wELARIERg8DV6OtPnYk2dBjPP7wFdtw5kHDTnYHSwd136yIw==
X-Received: by 2002:a05:6000:1844:b0:20c:5672:9573 with SMTP id
 c4-20020a056000184400b0020c56729573mr15065508wri.538.1651665571647; 
 Wed, 04 May 2022 04:59:31 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n32-20020a05600c3ba000b003943a559b3fsm3765344wms.8.2022.05.04.04.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:59:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] Revert "fbdev: Make fb_release() return -ENODEV if fbdev
 was unregistered"
Date: Wed,  4 May 2022 13:59:17 +0200
Message-Id: <20220504115917.758787-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit aafa025c76dcc7d1a8c8f0bdefcbe4eb480b2f6a. That commit
attempted to fix a NULL pointer dereference, caused by the struct fb_info
associated with a framebuffer device to not longer be valid when the file
descriptor was closed.

The issue was exposed by commit 27599aacbaef ("fbdev: Hot-unplug firmware
fb devices on forced removal"), which added a new path that goes through
the struct device removal instead of directly unregistering the fb.

Most fbdev drivers have issues with the fb_info lifetime, because call to
framebuffer_release() from their driver's .remove callback, rather than
doing from fbops.fb_destroy callback. This meant that due to this switch,
the fb_info was now destroyed too early, while references still existed,
while before it was simply leaked.

The patch we're reverting here reinstated that leak, hence "fixed" the
regression. But the proper solution is to fix the drivers to not release
the fb_info too soon.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---

Changes in v2:
- Add more info in the commit message about why it's crashing and how
  the reverted commit was papering over the issue (Daniel Vetter).
- Add Daniel Vetter's Reviewed-by tag.

 drivers/video/fbdev/core/fbmem.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 97eb0dee411c..a6bb0e438216 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1434,10 +1434,7 @@ fb_release(struct inode *inode, struct file *file)
 __acquires(&info->lock)
 __releases(&info->lock)
 {
-	struct fb_info * const info = file_fb_info(file);
-
-	if (!info)
-		return -ENODEV;
+	struct fb_info * const info = file->private_data;
 
 	lock_fb_info(info);
 	if (info->fbops->fb_release)
-- 
2.35.1

