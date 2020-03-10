Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73B180C88
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846B76E90C;
	Tue, 10 Mar 2020 23:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48C36E2D1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:31:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e26so1351242wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFRDmL4Zh4eJz0dC2VFAElPsXkXME7WPBS85RGbecwI=;
 b=c/oQCe8Fwz9nXwyCf8btmq+zgbJr99OfSghDbrjSIy1YA5iYiHlMrzRXpgKT5wB1Da
 Fh4ojIBfzPvrB45tV1hrtezRqawIqIMOo4KUd90xbjYGKlAWkLxNG31i48yb4HN26ZlQ
 uqRKUr/wC3o/gZA/Q03sK1qjmx8LbSMEPevwbDDYU/JN++tsOlfWs8MmAG3INlxhYFCE
 v13MEvL8Ez4I0QBv0zOLdUyvg+il0Yy7bxgzXLOv16u6EbHAxVDYoK2DF6++KGPGvsuN
 l5oFRLRTY6oSRH24OEYCypr2WvwU/27akBye883DOVFeRNQFBsgWZ5GtPOUDqG5QWBl3
 DeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFRDmL4Zh4eJz0dC2VFAElPsXkXME7WPBS85RGbecwI=;
 b=G3Uq1kCjXEvJyZXAsFhNeQVDpMZPwL+NbQCndKKwof93wW7SPFxg1M3N9Rh7FboZ+C
 8m6FJBm3+D8PrYhspbVhzzR8Sbv4c37YfsmSq48hjlFR0ymZMKhrVrwvjQBeJ+gOoFVl
 SbfP4eSa8GmY2N6Q/BvLFzRkbDG9SIbh6+yR4auC0Ktsowik47ifLFw6Bq8BZqR/auZQ
 vFQVuDaLZyc/kqdSDiqaQyuc6J3nMzM/ajD/Yy6X3c7G0qg3VSJcBVpCj59Xy3k0TcBa
 l+QJSWt8YmoNw5BRvpfnAwNdf/DzfMZ7GH79xjm1DPsGuPGIQzOjKlYUWdg7bqEnDLr9
 VMnw==
X-Gm-Message-State: ANhLgQ3yikD/fGNensIO2dwZf9lrbFqEvyVLIhL8uFiY6+6XEfQ9AhHm
 r1KdZglmaaYeYzK4rUIJ0co=
X-Google-Smtp-Source: ADFU+vt3mTlFHG7wS0s9CIbANX1Q58NQ0KUoueq4y7/GIjZiz/VTOo1JSVj1JmRqRXTDtd5kXJwQBQ==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr2377854wmj.12.1583847102585; 
 Tue, 10 Mar 2020 06:31:42 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:41 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>
Subject: [PATCH v2 06/17] drm/arm: make hdlcd_debugfs_init() return 0
Date: Tue, 10 Mar 2020 16:31:10 +0300
Message-Id: <20200310133121.27913-7-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and should return void. Therefore, remove its use as the
return value of hdlcd_debugfs_init() and have the latter function return
0 directly.

v2: make hdlcd_debugfs_init() return 0 instead of void to ensure that
each patch compiles individually.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 2e053815b54a..bd0ad6f46a97 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -226,8 +226,10 @@ static struct drm_info_list hdlcd_debugfs_list[] = {
 
 static int hdlcd_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(hdlcd_debugfs_list,
-		ARRAY_SIZE(hdlcd_debugfs_list),	minor->debugfs_root, minor);
+	drm_debugfs_create_files(hdlcd_debugfs_list,
+				 ARRAY_SIZE(hdlcd_debugfs_list),
+				 minor->debugfs_root, minor);
+	return 0;
 }
 #endif
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
