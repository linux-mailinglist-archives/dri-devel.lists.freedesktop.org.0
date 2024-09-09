Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5159C972400
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 22:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A7710E6B4;
	Mon,  9 Sep 2024 20:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OUjpahKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com
 [209.85.215.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2758E10E6B4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 20:54:11 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-7cd849a6077so4647198a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 13:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725915250; x=1726520050;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WeKmC9FnbgEe6fOW87kQOk6OE5+Tj5Hd5JhdaW8htRU=;
 b=OUjpahKOKPw4iM+vJG9kxab+ic7zW8aA8nVYRzWFIv1bdCLBkTbjEdKUgl/APqWwF7
 +2/+6tsSX0GN/IBTTZAZ6ykN+TlNkw7h1x9bB8/aRH3xngAL3qbRNtpuSUVZmnYH2zRa
 9lSH2IL0FGZLjhIKGR8zgPiJOwwD8wqSTn8nuarJTm+fO/EiQx8ra2k5OBqHbnNPGBYp
 hWMU/I0InXsVXaZL6OQd2SNkqez2d2IpV9W21aJJ0EHi92kIpPNVaWGZZx7me0mPgORa
 5oSIttPttK4V4lNpsAAlV0DZb0EVW0FMevJnDepVEAFbJ54Rm9+01P38AhW3KGvwDbSs
 k7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725915250; x=1726520050;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WeKmC9FnbgEe6fOW87kQOk6OE5+Tj5Hd5JhdaW8htRU=;
 b=CAiv4cIJa78qHizZIaB3zwLSm3thGheyIJGLneFSMa4dIaVorMhgS6q0kw2MFQuBAt
 dZNKJKbAq8G4KPixTCx2p+Vwjg1/AfulywxGUChO3KX7B3kmSd4JfFlUyOFRYxRH9p5+
 5ScYtJ3cBuLlB471WyqX0rdVH/jNKMRClFD57cF6SET5o7JBKaDpMfFuVRFeDUJZ/BYY
 yLS4+SlHiueTQRA1drUylj6WoXAwEYinbQ8SWXvoSIPF9ZbB/3CeDjVmfmJloyz9Wcgj
 zyellHNeEoue3e6oUKPMGM6YvhPS0/rb+iKJbGZdtT3vwEMlaa00cMQO35GgkvXhgBzc
 x+Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTzP92BNIh5GI1wD8hKmfwNnA7/YYAPmJwh1aY/WIEFNuaYHPimlrODXXk4S57chxG2h7cYgF54tM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybVDifRKFrGgykP9we4ic27/v5gpNV/Hds1tGT5p+xGeH1EveS
 bIFHeG2Xc1mfazPXDkB5FBdDCVdU+sSQKTW1lsZT1trvnVmn4k/Zxjm34DKUcrXXKfppPq/ZGMw
 FMr3dwTwRpUAwSw==
X-Google-Smtp-Source: AGHT+IGY0VQuaZZPXhKDdZl8yMzvGLZQlqOz/QGDPNv0228X2E5wWrrJX+Bx4WbRGEMdXUp3Yh52ObY0j4U/Nsc=
X-Received: from tj-virt.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a17:903:18f:b0:205:71f1:853f with SMTP
 id d9443c01a7336-206f051c88cmr8372105ad.5.1725915250444; Mon, 09 Sep 2024
 13:54:10 -0700 (PDT)
Date: Mon,  9 Sep 2024 20:53:59 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240909205400.3498337-1-tjmercier@google.com>
Subject: [PATCH] drm/syncobj: Fix syncobj leak in drm_syncobj_eventfd_ioctl
From: "T.J. Mercier" <tjmercier@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Simon Ser <contact@emersion.fr>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Xingyu Jin <xingyuj@google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A syncobj reference is taken in drm_syncobj_find, but not released if
eventfd_ctx_fdget or kzalloc fails. Put the reference in these error
paths.

Reported-by: Xingyu Jin <xingyuj@google.com>
Fixes: c7a472297169 ("drm/syncobj: add IOCTL to register an eventfd")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/gpu/drm/drm_syncobj.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index a0e94217b511..4fcfc0b9b386 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1464,6 +1464,7 @@ drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
 	struct drm_syncobj *syncobj;
 	struct eventfd_ctx *ev_fd_ctx;
 	struct syncobj_eventfd_entry *entry;
+	int ret;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
 		return -EOPNOTSUPP;
@@ -1479,13 +1480,15 @@ drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	ev_fd_ctx = eventfd_ctx_fdget(args->fd);
-	if (IS_ERR(ev_fd_ctx))
-		return PTR_ERR(ev_fd_ctx);
+	if (IS_ERR(ev_fd_ctx)) {
+		ret = PTR_ERR(ev_fd_ctx);
+		goto err_fdget;
+	}
 
 	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
 	if (!entry) {
-		eventfd_ctx_put(ev_fd_ctx);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_kzalloc;
 	}
 	entry->syncobj = syncobj;
 	entry->ev_fd_ctx = ev_fd_ctx;
@@ -1496,6 +1499,12 @@ drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
 	drm_syncobj_put(syncobj);
 
 	return 0;
+
+err_kzalloc:
+	eventfd_ctx_put(ev_fd_ctx);
+err_fdget:
+	drm_syncobj_put(syncobj);
+	return ret;
 }
 
 int
-- 
2.46.0.598.g6f2099f65c-goog

