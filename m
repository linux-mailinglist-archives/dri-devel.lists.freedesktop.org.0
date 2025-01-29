Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C93A21B84
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78EE10E7A2;
	Wed, 29 Jan 2025 11:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nFi6w3MS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487BC10E7A1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so3502872f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148468; x=1738753268; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bX+6EwizABkI0McC7gIJiE+k/hJhaZ4QvaDj5BOaFA=;
 b=nFi6w3MSTf0fLARM2vCACR3NF69znZpbdkwx65MlC4wcqb73rZfK+5CkPsOfu/qNNA
 AvR5nHOdSsNv/bZvWWZJacXwfUhextSFeFLS6hA1ya8DOkDX+se2VOSwdotO0dMgMWyV
 /dda8NhPl3Oa67r4QmlS1VnyUzMGwoxWYq3pItuZu2TkEwLN1y/r4PHBotnyD/DenFRA
 zNTmON9MqRScVLoNBjGLzO3MCrwnyNqMGMT5tim3WrGaIQcxe4Hm//pGgYAOWvjD33ul
 UQtjQBNod1f3o+vxWJxhS3dnoJ1shl/ld6fkbWrro0p6G42QYDSbm5Wi4Dki1q49+c8U
 aUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148468; x=1738753268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bX+6EwizABkI0McC7gIJiE+k/hJhaZ4QvaDj5BOaFA=;
 b=vgzCT57vTWHDJafl/j3qtQEqxAEVhV99UqjgSbJSlt8yLhQyHegcdYTlyx3qSgWg6W
 jg2uefM5jOWWn6TtVMjlpoAPF3l74FDvwYOx4uC6wMv40BOw6LhRtLsirRGm9uycPsIv
 eRYIrejptGHmGb1I+avlJaNJ/rQ5zsIYkEyTjkgLVLi0k6h39+7rQqmhDuja+mcm9+YB
 Qyvi8qtfZFw35dFeaV6urqSXvHP4S0p23WRl7v83wlzzOx8k5hUlFq7owvTmnQ21B7Hl
 yYnWCm641D5WtDfAnSh4Oi+GlPXNGqymeK/JTG9dB6XIJoq7FhmCixlShNCdRGlwixrC
 E10A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwOmt/VMQamUDEoAySZd6TCnX0AL8ZqOL81F6tM1Hwqj0375CPFkQR/bdp9kRr18+SxE2N9jYAL40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhssCPqrfKzE/azPziEUQGtC/3z/3DXohHFKOnwlybdM76P05P
 oNJEWYFgo/FrhdDcH2mDA2Rz2vJYpvBdU+K1eHmAHBSVxtXB4vzt
X-Gm-Gg: ASbGncsLmOJ7eVLwOUPX/lpIWPP0kiMJI6BUFUkpAaX3iZZnK+ryVOskEMeM6nZ+dl5
 jEyUO0KLyjKSo15e5tUDW41Iw7v059PcGyel2IImaISoYdLQ71evfXyaVY/OrRVTyVaS9ue6oFd
 OsU6Dw9z1YINPGLLN0QyBEIgx5O+vznM3phhDPKryixzeit6YIi3CHjkIpzqUENjJZGatDPj8c9
 HBg0d1WMSLniHRkakESTXioaaisBO/HIsrmzjbSVdTtSXTqj5jtstETObg4DtKDgHAb+vJ31Ek7
 pb6qlRZEcFgSJUi3
X-Google-Smtp-Source: AGHT+IF0iya3LHyS6aQhAfiWBUhNrHZ30Sab7dWyXgj5JiWlbgQ4M/vCB2thWkPLBNN7BECgrimYKg==
X-Received: by 2002:a05:6000:4008:b0:386:459e:655d with SMTP id
 ffacd0b85a97d-38c51952173mr2188558f8f.20.1738148467573; 
 Wed, 29 Jan 2025 03:01:07 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:06 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 02/13] drm/vkms: Add KUnit test scaffolding
Date: Wed, 29 Jan 2025 12:00:48 +0100
Message-ID: <20250129110059.12199-3-jose.exposito89@gmail.com>
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

Add the required boilerplate to start creating KUnit test.

To run the tests:

    $ ./tools/testing/kunit/kunit.py run \
      --kunitconfig=drivers/gpu/drm/vkms/tests

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Kconfig                  | 15 +++++++++++++
 drivers/gpu/drm/vkms/Makefile                 |  1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |  4 ++++
 drivers/gpu/drm/vkms/tests/Makefile           |  3 +++
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 21 +++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index 9def079f685b..d4665e913de7 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -14,3 +14,18 @@ config DRM_VKMS
 	  a VKMS.
 
 	  If M is selected the module will be called vkms.
+
+config DRM_VKMS_KUNIT_TESTS
+	tristate "KUnit tests for VKMS." if !KUNIT_ALL_TESTS
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
index 6b0615c424f2..45ef4b89379e 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -10,3 +10,4 @@ vkms-y := \
 	vkms_connector.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
new file mode 100644
index 000000000000..70e378228cbd
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_VKMS=y
+CONFIG_DRM_VKMS_KUNIT_TESTS=y
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
new file mode 100644
index 000000000000..b78371d08aa9
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_config_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
new file mode 100644
index 000000000000..ba93d864d57f
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include "../vkms_config.h"
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

