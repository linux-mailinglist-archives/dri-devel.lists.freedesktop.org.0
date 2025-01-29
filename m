Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BFBA21B8C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDFF10E7AD;
	Wed, 29 Jan 2025 11:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yh9weOkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC13710E7A7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:13 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso6190535f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148472; x=1738753272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vcLgxm3SUTsLjkaczvOfL6Bm5o46S9pgFwtVrMuPL9A=;
 b=Yh9weOkVurmcblEl4DJAxTDRTZlUutSn3bVOrS1AqX6umdZQydGUtWW7u7Fz7uRBdw
 AnPDaNUvvrnhHQ1u0MjmCJhD9JC5a5zZEIG/7kS0Z86YW92gTEa/Usj5kePKGBYGPR8S
 xKW+kuzwb2FNzguLsapqZ8vqrD1tmYMVKvu8vlXkhGfFztuZjcPQpVC5yDGQ7EBlLfIl
 eUU+jkNyYMAiH8F3vuDJcAO3OIsJSGZ7oHmLDvdVahKdGJKwnYuY2AcJ06Rr2Vxcj8cn
 Ncqkg1d5xeBaSRJb7bO0O4I30E+KsuUBZ61Ie8wGkBxt3xqfJfLFrFVWahBm3whb40lr
 2Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148472; x=1738753272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vcLgxm3SUTsLjkaczvOfL6Bm5o46S9pgFwtVrMuPL9A=;
 b=JAQ3NNua/U98U+z4Ln/7+tzz/ZXLmLauyZQaxXEIH/sif7b3d8wqgZhrFaNIWKTzHE
 70D/XK0vXsv6EksZ7wQfh69HnAuo6/Xwi05uN9Qpj8hkFNXh3k83dWzhJZ6PIZLpciG+
 KtH4ahyH4BknRKFxORrEYrGhjeUTV+No0qNlB7vT896/mT9DXMta3iRBpw+B8OBOWSqh
 bUDynOgyNAm32PIZzs7WuksQqgIhpJX2gQzwyYrQLwsppFCJkbMVF/otbojNeo2gD7jc
 OtXGFCP9ZB+vQsJ6dIOrkoOA2xjaJksrPob8O5+ZWeH85u177PB5CHpfhW0LU4KVyltO
 MXkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh1MeGD33BtV10/Tb/TzjYeT6oskDRktG4RpFvs1e3QK8MyKHTb+BCqepJ3R0agOjpLgtdQ2WAmh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVuddw1fA/AaCB6Dkdy6AcXl4hBqbmvcw6cGGBPF//JoxE0pdB
 zYkhn4kDXMYoSAtI0IXRjVZfrchUit1/MS56HhNM1hQf2gmuxuml
X-Gm-Gg: ASbGnctLK91EQCgW2h+CIVjDbC+rIWwlPe/9tgC1jq4IsowWJJZlEcCPL5xYor7WjeB
 qMt018s/3aXqu7qh/IRRnwDb960NXjW1pT9Y0v9XiSPHTe7VvVbtO6AMsQ1DSAqVxUxwjgbxq+j
 XO/Igf41kb0FsygbotlGBlFGr+1c9WGum+FUrjkQDUqYmw26ezu7XgYecWVBH0fBLspxeh89iDx
 LBG7xzvZoJseTBgbf8k4G4WiPQCQ6KIR3XAzEP/z9D3CC7MhwKi6mD06AyzW0EotX94MAegCGuo
 /i75SUC1apfwLMAv
X-Google-Smtp-Source: AGHT+IGJkECaHDdVMqpyu56d/KRmlF5eI3OFpcFDGpoPoyaY9mw51GmEv0T/B7Cfz1VL8PGPqNskXA==
X-Received: by 2002:a5d:6d88:0:b0:38a:418e:1179 with SMTP id
 ffacd0b85a97d-38c519380afmr2274027f8f.2.1738148472073; 
 Wed, 29 Jan 2025 03:01:12 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:11 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 06/13] drm/vkms: Add a validation function for VKMS
 configuration
Date: Wed, 29 Jan 2025 12:00:52 +0100
Message-ID: <20250129110059.12199-7-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129110059.12199-1-jose.exposito89@gmail.com>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
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

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  2 ++
 drivers/gpu/drm/vkms/vkms_config.c            |  5 +++++
 drivers/gpu/drm/vkms/vkms_config.h            | 10 ++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 526800b1afb4..66c2c6cb4a0e 100644
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
index 3e4f39cbe2e2..963f22b9b4bd 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -64,6 +64,16 @@ vkms_config_get_device_name(struct vkms_config *config)
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
-- 
2.48.1

