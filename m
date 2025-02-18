Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C5A3985F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663FC10E658;
	Tue, 18 Feb 2025 10:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EmPmDsch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BBF10E655
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:12:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4395dddb07dso54717765e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873548; x=1740478348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vG84qkV7BJECjcnd+fwOr4EF0zkS6sxDafqd+tmcLZs=;
 b=EmPmDschEef8XxWv2XZTAVA+CHF7iYb5bWLJySClb523vIOVodppD4r6OPfon9NyNa
 paVfl5nSNiYqujSv/QzFB9TmNg3otXYGSXY9tGF3MaEO6RiyE0p9w+3VzYH6wjA6CTIi
 nRuFoRSBgfEAnfB5aHQdaaQhFZ3xhdnlURHuIj/fTmPRshlEytp/ntgKwK7A4F1RXspx
 yhrG2vmI/F7Nly3eOJFH+7PgHY40iVkhNuAqMNGgOXJtzUibox/h3CZDyT7mr0f+rhux
 RDPW6VrFLPVmMMEww1wUKZ9MygLwEeqjQ14EPmIb5sSWRZ3GhquTi1paIb72vu7DMDH9
 GoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873548; x=1740478348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vG84qkV7BJECjcnd+fwOr4EF0zkS6sxDafqd+tmcLZs=;
 b=vAoZC5esk66V5e+NHmJ5KT7n7R1pwq/VzOGqTPFYrId6nT5sjoqwloVwRBcONpePgB
 XFm0m3zACVFiCeJghL1Gq62qchkq02Ba+S5uot6WKoSmNWNhV/etGUT/sW1I/x2de0KW
 +K6DujmMNtjO/zLdZT5fKGlekiUTnFfIpLnEaxwWzbTHpX5nDLuGM2eOGXlwfsmCKls5
 kfV1xJ+T2xryxUvkYmL5C2uz/LitMdTe0AtR30j4mvdXTS+qRC3S0X5uo7bTQIyVJ3MW
 EAze5S9FJ1SYbPQFmUTMZ3x/mWwe/ZLb+dugQwwI+PGPL9CpK0mkvkze/6KF8coWhNu1
 es/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwgFcf0udxoI+DViQRqmgd6Jv6LtbXfFhyTM1OzmqInx0t7GBuXgJZGggFM4k6fXnan/Gj1tmvfv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznJtw2lHl/hoUDI1qkMaqWOfwzLq5wMNGyzxTpYA4u2mkr8AT4
 kwBm91O54343HRp7UaevOqBS9chbCP5juOMV+mz67JMJJW5uuIs1
X-Gm-Gg: ASbGnctnnMbYdBFirJNr2FaGeBUZJ0xrsyxZnE1j09xJ0E6gqnrwrmeJHiG6ht3pLKV
 1SRpNlrXqjN5QV69KGiFulyypCWPBdB4R9IweUs4pqx8jq8k0rPuzCxztkFn9DHMMC34SbisNY7
 7Kj6ulpTNlbMhVEvS1ZOUYPg8R++btY5j9hQ48+s4XzZxbEo5uReuQWJ9TCebC0YGyAtaoyxjvC
 GrGQoppEl+Zh/LBnKgu6NA2GhLDBaQQEeKhAJnSW1akENC5WbtQeV7EnZlI+l5/reMaXCW3lccq
 xTQJlIRTdlc4EFhRIA==
X-Google-Smtp-Source: AGHT+IFbaa0meB3wBm+TDHc5jyul6WCWSeakV99m+tb4BZHPtJ5c4WpsT4IWxy5+wWc8KfJM1qrkAw==
X-Received: by 2002:a5d:64a3:0:b0:38f:50bd:ad11 with SMTP id
 ffacd0b85a97d-38f50bdadd5mr2178759f8f.5.1739873548145; 
 Tue, 18 Feb 2025 02:12:28 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm14749720f8f.66.2025.02.18.02.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:12:27 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 07/14] drm/vkms: Add a validation function for VKMS
 configuration
Date: Tue, 18 Feb 2025 11:12:07 +0100
Message-ID: <20250218101214.5790-8-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218101214.5790-1-jose.exposito89@gmail.com>
References: <20250218101214.5790-1-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/vkms/vkms_config.c            |  6 ++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 10 ++++++++++
 drivers/gpu/drm/vkms/vkms_output.c            |  3 +++
 4 files changed, 21 insertions(+)

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
index 9fb08d94a351..d1947537834c 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -51,6 +51,12 @@ void vkms_config_destroy(struct vkms_config *config)
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy);
 
+bool vkms_config_is_valid(const struct vkms_config *config)
+{
+	return true;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_is_valid);
+
 static int vkms_config_show(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index fcaa909fb2e0..31c758631c37 100644
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
+bool vkms_config_is_valid(const struct vkms_config *config);
+
 /**
  * vkms_config_register_debugfs() - Register a debugfs file to show the device's
  * configuration
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

