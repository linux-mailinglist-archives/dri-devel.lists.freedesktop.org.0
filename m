Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B879FA37F30
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046BA10E3FC;
	Mon, 17 Feb 2025 10:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H62TYoIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026F510E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:01:34 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f378498c9so1388608f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786493; x=1740391293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vG84qkV7BJECjcnd+fwOr4EF0zkS6sxDafqd+tmcLZs=;
 b=H62TYoIZUkmBms4xjplWgx75yXKFLlQLCjr+7m5Fiv2McYnhsIw7/Jc/xvW1QUx9Xq
 8VPVZsJGp5tR74tQ1iAjwl6XpdZMno7n7Nzm99lppeBPe+DB9uPFBH+zgBmJvRZNomRW
 jH8BO14S9YYJe0aDJwa5v1OxJfmAYljKdta8ZBkG6h2kJRb0Q4A58v4F7htXrL+ARSgv
 E3AYbzkkPEdGG2sZDETcQfyElNdrxPvFeZUX1XrUU3vSTGVCdR9JSAUQlwOzTr8s8Dca
 IcH2xhiEJFhIxD21knisFI59f5PIuvOZZhwTAJBINam4YTW/hO3LpT/wrg9DTOw/XrL7
 37wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786493; x=1740391293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vG84qkV7BJECjcnd+fwOr4EF0zkS6sxDafqd+tmcLZs=;
 b=EXrcQFfu3tSDBvc9inuOamYXU+uHh6EtP5+Y+nM3NUjf9ZWyQ5xDs99+eRB/BFKpNl
 sX4A9qbb/Kwg6z9d8kl4btei8QEu4Dc8tLfHmuLvn2aF3KDmkX13wjp/ODTjOz3CSwgV
 8xFCskcLV0ldNbzBK0rJ9qWfRphOodVviB5DQRLDfW6f2VKsVn/Bz8mrxVrdor62CeiC
 5xihEFh5m+bzhHJyG6OelK/vXJ1ThWrNlgGjd5pUwl/GjfeXSGtasCUCP6O9CG7RyEgU
 fBa4SFd493sq8C3wRrHgFCM22uV1c9ShN8pBsnocSE3u15fC577YNU+dFS4nMWOD4Qp8
 gYDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW75XIAi4mamwwxRIV1L+1L9LsUHgoaHrNG68y8l7bECFw3X8B9B2a107ocEl5PUGe5X9NKNBDGd80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGgKIs8bOGPfqzScssIMw6T5ZzBeMR4nYx1zCNydJF3wWCVTKV
 7r8NsWBTc0mUm4ZLPwH5/bqamNO2wXl6PGz/C0ldVHhUClzU1E+V
X-Gm-Gg: ASbGncucNVeEDQeGoFxfYHPelIMdDdOMrUFnCn6CsBaay8zNtDeYNTGHDw5U31N3Cuz
 DgDosppBRnD5EJaGXKPHEqrxFFo5lFpLL03AIkOw1Vp02ht7SjRSUd5XYKEPExsybq3cpvsK3/B
 tQJ4HocEcu/+Xif9VVXPFqx0WDPT/feceqhBla5M1feGOpAFx/0UbX4zlEHNHCmebu238wjVSF2
 KfBCMIa07IxpQfgqOSn5Xja/27Z7E24J76qnLEi0DEJKuLwaDZJtzI3lDF7Dn5BJgIW+UHuRavO
 8xYdbkSCsf2W6Ou6eg==
X-Google-Smtp-Source: AGHT+IFGNiAYm97F/rvajIu8CyZRnvNveqnN8T22WAtQI5gMJGrMZ9dUcF45LtAZOYQGxLfI+woL/w==
X-Received: by 2002:a05:6000:1f87:b0:38d:d8fb:e91a with SMTP id
 ffacd0b85a97d-38f33f35862mr8662918f8f.27.1739786492575; 
 Mon, 17 Feb 2025 02:01:32 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm11591901f8f.86.2025.02.17.02.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:01:31 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 07/14] drm/vkms: Add a validation function for VKMS
 configuration
Date: Mon, 17 Feb 2025 11:01:13 +0100
Message-ID: <20250217100120.7620-8-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217100120.7620-1-jose.exposito89@gmail.com>
References: <20250217100120.7620-1-jose.exposito89@gmail.com>
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

