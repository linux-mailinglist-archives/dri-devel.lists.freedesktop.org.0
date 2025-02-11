Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2548DA30971
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BA910E664;
	Tue, 11 Feb 2025 11:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+oThHo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2E610E661
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4394820123dso11076365e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272157; x=1739876957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqPjNzN3hIOUqf1ihOkU/QGEBU1cO5gaJEuNeFStEvY=;
 b=S+oThHo+kXK9OBEb2knkqkLKVxDf/f+bANdTgf5HPdJh6iznipnHuehE3qliKLWqMl
 aAFUOif53zPuKZTiav1EIjcKztGAY8ykydk7NpenkZvvWePqoKAmAMULasfRE81+hI5k
 bA4y9+z9uSjlLyaCEp+YntU+DjiwTduepmr2QAqauLTzrDMeGpfMJwz0TNUlbeQc4WUy
 lKaL08kzTgTuDg3YufTFIPj4xEAgQyOQglm0h6J/rtTdRz51cZxIbwNitkPYMqLemSIt
 3q3VKZ6MON2E0ae6BG2QUBEMR0iwVqX9jk05veDVdg5XdyCowEQiUhHMQeYToL0xRCQh
 GDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272157; x=1739876957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wqPjNzN3hIOUqf1ihOkU/QGEBU1cO5gaJEuNeFStEvY=;
 b=lh7cAlxweJJ7Qzun7dqRt9EgjTYJpHL++2xGtllgHt/iICuzIgWX8GvbMdgNORwPu8
 Fwiv31N/5vC+6iXqAg1usYb8q5NpoG9HwRqBsTxdTiBY1VyAjPhOsOKs6//RBUI5MZYl
 bXZE5h9jNbjqPSHK/8SL2LaJUyG/HbgYhD+FUYuzTJLxfTeqDQglihZhVV+ovm55tIdD
 Pp2WmZlZDuMl9jlFqq8vH3N+HohZ8o2IBSMUPhkPfEaSpXEEaxulD9tEO+uRi8zpDa0l
 hT+ODaCA+o8RY8KkahMjECbAXhMzXQtzsj2/GlbEkWyqn//g20is1djaUigCxngyJvMP
 A3Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUDwDsCKju9QeL6QBXXpnh0ZFO/2qyz+X1/hTRy7t9tE30GOEIKd0ohTbvOf8gbcNEaYR/G9ckWAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw85dgvGJcMvxRqLjgxPTWBX0aSFzgUmPBDXNGBw2LuakzLau55
 qnCOsggsS3nw3Ktg9yNlYbt2aZjxjXF+di8VvBXuGcrtldj3dLz/
X-Gm-Gg: ASbGncuhxawBeJ1fJPEk+ktm29DF74gK5ZESbr1sP4TGcA3Hy3Xq+Gr8FY29uN+C6rk
 guVCiTPusKtbcEKMKggGkbeoAYi4tfCp5fcsu5/9A/uCt6r6ELdESNptDygU1q1m4FV1yGNp96X
 eFWZXEFgKfKb3D+DgA9KRJBWRPSCx0YqlsmAGspANnGobKho1Cr0FHFOqxsPxywucngBHapqNq5
 YmlASOaHY+FA3s6hH7Dwqds1fVhHqi1eGsFBW0QjRHADnjmaHjalYzxqFOdJIwENSN/If4i01Vr
 uumX7HkQhDigC7XX
X-Google-Smtp-Source: AGHT+IFlaMdG5xYT8daUity03Cn/YyaHakX4RFbJ81EYHMnPhENehZWM/3i2t+R5N2A4WjM1CP0j9w==
X-Received: by 2002:a05:600c:3c8f:b0:439:3e90:c535 with SMTP id
 5b1f17b1804b1-4393e90c71cmr91082515e9.0.1739272157348; 
 Tue, 11 Feb 2025 03:09:17 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:16 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 01/15] drm/vkms: Fix use after free and double free on init
 error
Date: Tue, 11 Feb 2025 12:08:58 +0100
Message-ID: <20250211110912.15409-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211110912.15409-1-jose.exposito89@gmail.com>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

If the driver initialization fails, the vkms_exit() function might
access an uninitialized or freed default_config pointer and it might
double free it.

Fix both possible errors by initializing default_config only when the
driver initialization succeeded.

Reported-by: Louis Chauvet <louis.chauvet@bootlin.com>
Link: https://lore.kernel.org/all/Z5uDHcCmAwiTsGte@louis-chauvet-laptop/
Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 7c142bfc3bd9..b6de91134a22 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -235,17 +235,19 @@ static int __init vkms_init(void)
 	if (!config)
 		return -ENOMEM;
 
-	default_config = config;
-
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
 	config->overlay = enable_overlay;
 
 	ret = vkms_create(config);
-	if (ret)
+	if (ret) {
 		kfree(config);
+		return ret;
+	}
 
-	return ret;
+	default_config = config;
+
+	return 0;
 }
 
 static void vkms_destroy(struct vkms_config *config)
@@ -269,9 +271,10 @@ static void vkms_destroy(struct vkms_config *config)
 
 static void __exit vkms_exit(void)
 {
-	if (default_config->dev)
-		vkms_destroy(default_config);
+	if (!default_config)
+		return;
 
+	vkms_destroy(default_config);
 	kfree(default_config);
 }
 
-- 
2.48.1

