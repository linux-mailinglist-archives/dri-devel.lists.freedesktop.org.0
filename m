Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452825A8453
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 19:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768F010E4BD;
	Wed, 31 Aug 2022 17:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3743910E4BE;
 Wed, 31 Aug 2022 17:26:06 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MHrgK0wxkzDqVh;
 Wed, 31 Aug 2022 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661966765; bh=hQysIsxVyI/EpK7q3xv+BMacKVJpVAgMgCfpm5Rxa9E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aNA2rAWkY4Dr+f3otS7XHu99kvKs/OS5+DfbaR2ysAKmrUCMdb71aalNwIBBoNoD4
 6UgHyLld1M+cYZEpsefYp4fmyYoWgSyL2fkerJqsZlwsbbhvyPdilouc0THeFS9CKx
 9EN86Uofa+HFf0zylzQ3CG0F8iNqcNByxmRrGEM8=
X-Riseup-User-ID: 4E72AF1192636691E7F46BCFB20DF42D6A9112D1D1F13CE6249E318DA1BFCAB7
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MHrg84JSrz1y9N;
 Wed, 31 Aug 2022 17:25:56 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Daniel Latypov <dlatypov@google.com>, David Gow <davidgow@google.com>
Subject: [PATCH v2 8/8] Documentation/gpu: Add Display Core Unit Test
 documentation
Date: Wed, 31 Aug 2022 14:22:39 -0300
Message-Id: <20220831172239.344446-9-mairacanal@riseup.net>
In-Reply-To: <20220831172239.344446-1-mairacanal@riseup.net>
References: <20220831172239.344446-1-mairacanal@riseup.net>
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
Cc: kunit-dev@googlegroups.com, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explain how to run the KUnit tests present in the AMDGPU's Display
Core and clarify which architectures and tools can be used to run
the tests. Moreover, explains how to add new tests to the existing
tests.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 .../gpu/amdgpu/display/display-test.rst       | 88 +++++++++++++++++++
 Documentation/gpu/amdgpu/display/index.rst    |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 Documentation/gpu/amdgpu/display/display-test.rst

diff --git a/Documentation/gpu/amdgpu/display/display-test.rst b/Documentation/gpu/amdgpu/display/display-test.rst
new file mode 100644
index 000000000000..a8c136ce87b7
--- /dev/null
+++ b/Documentation/gpu/amdgpu/display/display-test.rst
@@ -0,0 +1,88 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+========================
+Display Core Unit Tests
+========================
+
+Display core provides a set of unit tests, currently focused on the Display Mode
+Library. The unit tests use KUnit (Kernel Unit Testing Framework), a common
+framework for unit tests within the Linux Kernel.
+
+This section covers the specifics of the tests for the AMDGPU driver. For general
+information about KUnit, please refer to Documentation/dev-tools/kunit/start.rst.
+
+How to run the tests?
+=====================
+
+In order to facilitate running the test suite, a configuration file is present
+in ``drivers/gpu/drm/amd/display/tests/dc/.kunitconfig``. This configuration file
+can be used to run the kunit_tool, a Python script (``tools/testing/kunit/kunit.py``)
+used to configure, build, exec, parse and run tests.
+
+.. code-block:: bash
+
+	$ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
+	    --kunitconfig=drivers/gpu/drm/amd/display/tests
+
+Currently, the Display Core Unit Tests are only supported on x86_64.
+
+Moreover, the tests can also be run on real hardware or in other emulation
+environments. To include the Display Core Unit Tests on a deployable kernel,
+you might add the following config options to your ``.config``:
+
+.. code-block:: none
+
+	CONFIG_KUNIT=y
+	CONFIG_AMDGPU=m
+	CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
+	CONFIG_AMD_DC_KUNIT_TEST=y
+	CONFIG_DCE_KUNIT_TEST=y
+	CONFIG_DML_KUNIT_TEST=y
+
+Once the kernel is built and installed, you can load the ``amdgpu`` module
+to run all tests available.
+
+Also, the tests can be added to the kernel as built-in modules, by adding the
+following config options to your ``.config``:
+
+.. code-block:: none
+
+	CONFIG_KUNIT=y
+	CONFIG_AMDGPU=y
+	CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
+	CONFIG_AMD_DC_KUNIT_TEST=y
+	CONFIG_DCE_KUNIT_TEST=y
+	CONFIG_DML_KUNIT_TEST=y
+
+In order to run specific tests, you can check the filter options from KUnit on
+Documentation/dev-tools/kunit/kunit-tool.rst.
+
+How to add new tests?
+=====================
+
+Tests covering different parts of the Display Core are always welcomed. Adding
+a new test is a simple procedure, that consists in creating a unit test file
+and adding the following guard to the end of the tested file when you are
+testing static functions:
+
+.. code-block:: c
+
+	#ifdef CONFIG_MY_KUNIT_TEST
+	#include "my_kunit_test.c"
+	#endif
+
+If you are not testing static functions, you should use the Makefile placed on
+``display/tests``. In order to add a test to the Makefile, you can just add
+the following entry to the Makefile:
+
+.. code-block:: make
+
+	ifdef CONFIG_MY_KUNIT_TEST
+		DC_TESTS += my_kunit_test.o
+	endif
+
+The ``display/tests`` folder replicates the folder hierarchy of the ``display``
+folder, so this must be considered while adding new tests.
+
+More information on how to write unit tests with the KUnit API can be provided
+on Documentation/dev-tools/kunit/api/test.rst.
diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
index c1fb2fb3c710..4f4e72e3e75f 100644
--- a/Documentation/gpu/amdgpu/display/index.rst
+++ b/Documentation/gpu/amdgpu/display/index.rst
@@ -28,4 +28,5 @@ table of content:
    display-manager.rst
    dc-debug.rst
    dcn-overview.rst
+   display-test.rst
    dc-glossary.rst
-- 
2.37.2

