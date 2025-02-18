Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F5A39859
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0100610E65D;
	Tue, 18 Feb 2025 10:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b3gmznXH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FD010E654
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:12:25 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce319so3144420f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873544; x=1740478344; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyJ4zhCFR8HQ/P+sh2alNxUJOEd+yUChQD9LZjyxME0=;
 b=b3gmznXH0ULhoMwgp0h/BPhGUOvMvDdTpLEsgng0DlXBff0hHkxzmYyi7AtJBSF1zo
 ckJRBqu3RtkCoHdrM26Z22JqHTdX3q5FhTa1CwajtNZ6mLhO8oQlp9S7IhPTu99wm0v8
 1p8ugNVm1k+nhoUE85uckfYSZtnDmmSWUAGelug6mBTgqxZXRBXU9EoP7hEmLj6IglGk
 rcIjoj20DNS5hEDZ65yJ1eOTdAM1MPUkRUoT+cQqD/xxiyzGJbJhnO5G8z5s92ZW5Nco
 BejV5m9fh8U4nwUX0Kj3YxNi7w7lLugF1leZMfkqpvYAPcE0TcQJ/0J+n6/Mf8iBSNUE
 /L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873544; x=1740478344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyJ4zhCFR8HQ/P+sh2alNxUJOEd+yUChQD9LZjyxME0=;
 b=M9i6i7zKueZbAfIGg9WdsWBMIL3rPeATSH7mZjDp+5fJTv2TEsDeFCVBhKDg+1wUsa
 Ta2qGJgjlCryz2GANqNqcjggSB4kNG+Cte/QKdr2EFxX4qrDcDrTOOsyU/y2PaM1gRqg
 6WZwQbUEcbtYm6GpgXIkjVb5WBM2ITu93U31MdFVisN5uFpnmiEU5LRPVDGefo7ip2GY
 sbbohqALxca7aWypNXaxmdqF/doC5h4aH8UUGrF6lTDm13HpmR8XEhKhDT4y7Y7AfFrT
 zQNo/hnwpBX5P8J2Wgi8eQvj4uLFZtvYXrgwyaEn1MtIe+BhFKikvQnI1RSldGwWyMdE
 xrFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQe6YnIYVmfW3TmMKQ7e8SQskiwQhu65IXAM55nxGw1CVYX405DUGkRjX/c4uPyB/PohDOracAyMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTAzBs3+hbWA+wJQl/4B5WG/3DrUFL7QsZWTs9ESGG0vhe8R+W
 Ycwmi/xpjdhde5D4bw9sOU7qTfHnr5eay6IB5Jkx8r9gEhXf01Zn
X-Gm-Gg: ASbGnctNpV4LWVOnucHyIAZkyReGmUhUsON+Y2QrGLr8m7iWc0rvu7D4bvoKZaeDGsB
 xfwBlbw2QyRPMtrY+cOjm+bRALMUwPk/aYFH8+sJ/pjTmEU9/G0rbAl51/s8YvzWMSbHIlEWJFe
 RpAIsclc50nSVYMypJtNpBoweG/jB3nNtgfSe6H/nwJ2LLLh5ChkyJXbnkrs4TGbmXnblc4USCO
 XdQ0QcuH5HmkEFPKnbaBtqNsCdnB4qY+XOa7SN5fY/zW7w29e0q001aLGHgsBbKclBvENMpyGK4
 VF8oulRzV75C2UkTFQ==
X-Google-Smtp-Source: AGHT+IFC2iZ3b86dmZHVNKNjYIDDceABsmu1t7eFO+6DJG0rTP5rcTEl6DAhwD/VfnPs4aPOLeh59g==
X-Received: by 2002:a05:6000:1864:b0:38f:3888:33bc with SMTP id
 ffacd0b85a97d-38f388836bamr11398807f8f.10.1739873544100; 
 Tue, 18 Feb 2025 02:12:24 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm14749720f8f.66.2025.02.18.02.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:12:23 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v4 03/14] drm/vkms: Add KUnit test scaffolding
Date: Tue, 18 Feb 2025 11:12:03 +0100
Message-ID: <20250218101214.5790-4-jose.exposito89@gmail.com>
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

Add the required boilerplate to start creating KUnit test.

To run the tests:

    $ ./tools/testing/kunit/kunit.py run \
      --kunitconfig=drivers/gpu/drm/vkms/tests

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Kconfig                  | 15 +++++++++++++++
 drivers/gpu/drm/vkms/Makefile                 |  1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |  4 ++++
 drivers/gpu/drm/vkms/tests/Makefile           |  3 +++
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 19 +++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index 9def079f685b..3c02f928ffe6 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -14,3 +14,18 @@ config DRM_VKMS
 	  a VKMS.
 
 	  If M is selected the module will be called vkms.
+
+config DRM_VKMS_KUNIT_TEST
+	tristate "KUnit tests for VKMS" if !KUNIT_ALL_TESTS
+	depends on DRM_VKMS && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for VKMS. This option is not useful for
+	  distributions or general kernels, but only for kernel
+	  developers working on VKMS.
+
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 6b0615c424f2..c23eee2f3df4 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -10,3 +10,4 @@ vkms-y := \
 	vkms_connector.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
new file mode 100644
index 000000000000..6a2d87068edc
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_VKMS=y
+CONFIG_DRM_VKMS_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
new file mode 100644
index 000000000000..9ded37b67a46
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms_config_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
new file mode 100644
index 000000000000..1177e62e19cb
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+
+static struct kunit_case vkms_config_test_cases[] = {
+	{}
+};
+
+static struct kunit_suite vkms_config_test_suite = {
+	.name = "vkms-config",
+	.test_cases = vkms_config_test_cases,
+};
+
+kunit_test_suite(vkms_config_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Kunit test for vkms config utility");
-- 
2.48.1

