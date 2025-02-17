Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED3A37F2D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5FB10E3D6;
	Mon, 17 Feb 2025 10:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T4FdGYiC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4193C10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:01:29 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38f31f7731fso1201245f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786488; x=1740391288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyJ4zhCFR8HQ/P+sh2alNxUJOEd+yUChQD9LZjyxME0=;
 b=T4FdGYiCc+ddcub9Bzz5o8OiJ/rVZq0bmKDJgUEumplC/6Bc23NSaEG54R2PnIi7yz
 AhlhS8syzXsZaAaxVbjU7rthczUwq2H5CpIzlxIVP0RXgRbSLY0aas6hkbgzuB93RbPZ
 fGBNOEnKWWasvtrGN7A3PzWOyzqWpa3cmvk42YaP/hnDMP6vtjqhDhonZlJVHxwHzdwX
 R/3XTYcdbHA8vqojS8rODGTMTNTcPd/iFspwR0BF7s2R4hKptthALIGs29Y7a9eFPHlJ
 2G0jyIN85mbJ/wrw0o6YhElvo2Tq0K4iysk82SZuUnqM/PfysiOjvN/VsutdfBK1NSpk
 Fzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786488; x=1740391288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyJ4zhCFR8HQ/P+sh2alNxUJOEd+yUChQD9LZjyxME0=;
 b=DckG3e8GLI21v+GB2d3dpHy34LqrLGmeTesnU45gZLHi167oavnZoqsu5/H/YfWQdY
 3i7SD7Id86EWCeLacyV/AUY1sta7isT9YwYh+nQRiuXtHKfj6HzflKkioUgXFnhcBUrW
 tTssMMF5aoR0Lh5HsfYFpKjxsjEGaXC9+iVfB37j7hSyfi+iX6GPwl/RpXT/jmte0+j9
 Gv0akh5i9F/52utsJ3S8cFxiauaVwHka2KB7OdqUZ6eLsItADqHVUockB/sq5fNvLKCL
 Aoo9S6/hDqWAYEa6160RN4qRJQhOYB54eiH+0+S0c+D21RRJgUegxzc/vxxspRbcZ2wH
 KfkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmiMyfX3G7Iqpr4Uz+7x11KbSjWkh+qep55cxSvwrWYHhyo3QyOBz88wUeO0yHEHw/70mBIKSdwXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS9/X+/v3GZdJuHfddQ2GC55xbn3AC2cpI9DaPFX4TbFbfmftR
 ap2RbNj/jgWFeY1osl/No4PUBUgBEjm+Y5MiZF7+WIScPtrG4QMv
X-Gm-Gg: ASbGncsh2j7xCGX6Ebs0+B9yAIaG630R5Ldl8tdh+3nkdJpCYSk+Gb5yk48ZBT2vUoH
 Z/calaj71wvDqgVyt739uLBWa/OZvkUQOFBKZ8P03n/H61FPehuUCZspwp6/L8M5UCNydsaoUzl
 wqji0et3eq323NQIoltxV5cQr6ksUv/MpciJ2r5u2YziJPHe3VClh2dDak5Gx5ZGAMeQpwgVqpL
 WFtfkeKeAPFTCVkF3MRurr27M/qarnpjhbBZd08Cfkq/Suom4icY8pMvOaG6VvsDOjwq3m2nqmf
 YDFW9iElmT12wMYxvQ==
X-Google-Smtp-Source: AGHT+IEgChZS1TM0yOWscdOUtGj2+t/pNHUL4Ncpoj0PJEzTn8rZEI3vhQLyexaVQtcmkHYF3tLn/w==
X-Received: by 2002:a05:6000:18a9:b0:38f:2193:f8c2 with SMTP id
 ffacd0b85a97d-38f33f34e32mr8698968f8f.31.1739786487650; 
 Mon, 17 Feb 2025 02:01:27 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm11591901f8f.86.2025.02.17.02.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:01:26 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v3 03/14] drm/vkms: Add KUnit test scaffolding
Date: Mon, 17 Feb 2025 11:01:09 +0100
Message-ID: <20250217100120.7620-4-jose.exposito89@gmail.com>
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

