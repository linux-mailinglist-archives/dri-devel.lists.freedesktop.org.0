Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE068A3097A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AD810E66F;
	Tue, 11 Feb 2025 11:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AfIu1pe6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B4F10E66C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:29 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38dcb7122c1so3425417f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272168; x=1739876968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ht9ZYJCKi3pSkXQH9HmuvB26RHJWpzU2MzuZ6pZw6lg=;
 b=AfIu1pe6pv0hn4RgBWLaM3nSjj729Vi9/MlhrZPke9zu3LDCFEFpBGtQHD6ESH23rI
 cdzeQUj7qRfM43lLq9vEbcQvUwe+LsqJeHGew+Z1j4Han8SdA0k8aTMwygUdvuCsBoLV
 okoOAFCxnrziyM9KF8jEJpcAd+VOsayp5VI+VRSXIsbITiamhOj43WgDEUEryT72mLf6
 M9+N1AJZ6YIzX4a8c4swIR4+wY/aqijI72k5LS1wDB8E/gvZO6K+wA/0dwdmLQv34XCt
 4DdtzcgAH0kGAyQsKz9gKedq5zZQ7dCpT20D1nA0BEYEz48m7EeS7Ye4Hb4N+oz5sb6t
 dBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272168; x=1739876968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ht9ZYJCKi3pSkXQH9HmuvB26RHJWpzU2MzuZ6pZw6lg=;
 b=MpbKKHbDPNQZ0PpsU93sIUR2b4CMVUNZDNZ5kUk40/FbJf9m3nycWuBjjss7kIYb7l
 CNSuCb21Zv2QrtBy1qyZ9yzi2SfoU5UMXV91u/zKWyj1FS0epc4M9+/UgVF1fIa3mSUI
 EP9peNXsULg2tYNL4cQS0Kh7wp3yKkAgJ9DgRkqII5CdY120HOFyDJK0dmsmTug+fh2s
 UHhNS0DkV13YlJC9ZJbR7lGedVhakcHDomng9RM/twQGjAjgjqfJ15RZ07jLWvkMZt+T
 6JbfDRNfAZOrslGUkd/PZ2DmVJq2bkw+eVBuJirBOcNh3EcgmaYGbz35gowO1HuNMWi9
 +T2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA62/6wno3LpWGgkMax444xYWcJkYGscnPUgv7SE6Tz+wLbcihd4WQJxx8enEGMSZkAsxayV9vrdM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDFhrEv3FXousW7bd1diO93c6YYPbwj9pKiZexoCiU9DZ71JBV
 SdXSe6kQNt/hukVFkEk+G6wATx0VZmj/9S43daFLhmTpQn64H1Nx
X-Gm-Gg: ASbGnctltwEva2Bl1CeuOi9rqEodK6dY0xvh+peSP9cDomTmD9IZpBBgQZOsCocgATK
 sXAhsebQ/kVW7JxRd6JUKQcuv0WpRnbu5q8mU/2BjnQGNCMejkQSPAphznbpa1Ix1b+4Y9sikMS
 5HZbjd9s2Vll7iRzkTvblU50BZU1BVn53IMARlxZqY1AntzjVgcEDfUaT3j7vqGHrXsXqlOJA0/
 tTQxI6RfvpT8lszkXc5+26scgdtlun/ZdZN1RP+7AUBx2ayogBhUw3+fegPcL/93Nr+PzKpjmcw
 r1xIce1lPeYLlNQY
X-Google-Smtp-Source: AGHT+IE3r+36gyMVrHDbD9UHJvKxqbwN9H602g5n7dACf3knhXILuBi9Jj4prEWWCMO9MZ7h+Gndlw==
X-Received: by 2002:a05:6000:186f:b0:38d:e250:d962 with SMTP id
 ffacd0b85a97d-38de250db12mr4478466f8f.30.1739272167690; 
 Tue, 11 Feb 2025 03:09:27 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:27 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 08/15] drm/vkms: Add a validation function for VKMS
 configuration
Date: Tue, 11 Feb 2025 12:09:05 +0100
Message-ID: <20250211110912.15409-9-jose.exposito89@gmail.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

As the configuration will be used by userspace, add a validator to avoid
creating a broken DRM device.

For the moment, the function always returns true, but rules will be
added in future patches.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  2 ++
 drivers/gpu/drm/vkms/vkms_config.c            |  5 +++++
 drivers/gpu/drm/vkms/vkms_config.h            | 10 ++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
 drivers/gpu/drm/vkms/vkms_output.c            |  3 +++
 5 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 92798590051b..6e07139d261c 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -54,6 +54,8 @@ static void vkms_config_test_default_config(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, config->writeback, params->enable_writeback);
 	KUNIT_EXPECT_EQ(test, config->overlay, params->enable_overlay);
 
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
 	vkms_config_destroy(config);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 11b0e539920b..67f71d29596e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -47,6 +47,11 @@ void vkms_config_destroy(struct vkms_config *config)
 	kfree(config);
 }
 
+bool vkms_config_is_valid(struct vkms_config *config)
+{
+	return true;
+}
+
 static int vkms_config_show(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index fcaa909fb2e0..0376dceaf6be 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -67,6 +67,16 @@ vkms_config_get_device_name(struct vkms_config *config)
 	return config->dev_name;
 }
 
+/**
+ * vkms_config_is_valid() - Validate a configuration
+ * @config: Configuration to validate
+ *
+ * Returns:
+ * Whether the configuration is valid or not.
+ * For example, a configuration without primary planes is not valid.
+ */
+bool vkms_config_is_valid(struct vkms_config *config);
+
 /**
  * vkms_config_register_debugfs() - Register a debugfs file to show the device's
  * configuration
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index a74a7fc3a056..95afc39ce985 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -204,7 +204,7 @@ struct vkms_config;
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
-	const struct vkms_config *config;
+	struct vkms_config *config;
 };
 
 /*
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 068a7f87ecec..414cc933af41 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -16,6 +16,9 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	int writeback;
 	unsigned int n;
 
+	if (!vkms_config_is_valid(vkmsdev->config))
+		return -EINVAL;
+
 	/*
 	 * Initialize used plane. One primary plane is required to perform the composition.
 	 *
-- 
2.48.1

