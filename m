Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2EFCF5981
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 22:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4C610E43D;
	Mon,  5 Jan 2026 21:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="qxYtoCkp";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="O0b5ltCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AA710E43D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 21:04:19 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 33A0D1D00107;
 Mon,  5 Jan 2026 16:04:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Mon, 05 Jan 2026 16:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1767647059;
 x=1767733459; bh=phQMOsM87S6EFVPQfbAog1dRcLf306pE5KyeQ6bVQYo=; b=
 qxYtoCkpYNzkWkQEma3s8ac7G05f0HbItpYMiS06Fn0UMvn2RbymwZTnapW4tEgO
 9vq2PspwKjPZO/HZLBjCBPnx5TimNcZsK9mno302p4mRSfv5DYweiPXJsLBR+DUQ
 dcVtqYpTzKJZpGdSFVm/MqJDRq6iT2cviThSaKdOShgmfSftFKZmaakaG+i5mf42
 hGy87/Vx75a/p8OdwMuc3HjKbK0tjHJtnMy6n+ZfRncwc0Z8EZdN9dro1GFKzL3x
 3Ctkjsg7Cr7YP/e055jz8DwEuo2oRcT3xZXJhBM9U/zfKS5v1uTYGvsrMJvbiyvt
 THsjkInmMX6nDGC5/BIajQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767647059; x=
 1767733459; bh=phQMOsM87S6EFVPQfbAog1dRcLf306pE5KyeQ6bVQYo=; b=O
 0b5ltCfZp6pn9FvyIYgSGzsd9ns3ALPDFS39okI7MxhRSPC75Bg0Z0IIg7VrzgZu
 2l+CdinIh7yWqOna85fikcmQCCUeO3tmJjsBLl7VVufBcX6mhramnlqgbbPhCLy5
 NKmJPWlWAOK0z+sxD0Eq/vtdrF1sW5T3rblcjboXrgGOA2q3R50kFSdKpvSVlA3w
 h+QTQJ/5wtjrGwMKFTJjJcJd91JCNRSmv1IwwlSEary2Y4DTqPRTXnfEJ7PjnbAR
 AowL7xASj+XWKe4Bu0V6+SkZemjodcNZQyrikzrWoDD4m3l/8KQ+GdYTzrAEW+aX
 SWERIA+N2fBQQl2HiRsxQ==
X-ME-Sender: <xms:UidcaaRTOqV4dEIP9EzLu2N5xns2IblvwDQC0BO1QW7sdK5OlGwMyA>
 <xme:UidcabNCwWI5-ULtTrviKXJ7oVb5kWG7Q3O9t38_EN3tTlh0qNqOFO-ed7hWIO0JV
 R7NNDubsQQr_IHc9JxxEEpcQ8wnQzlpAP8bDCv4uKa5zJ1JvDwRlg8>
X-ME-Received: <xmr:UidcabVLJe2sZJLbOqMPBEQKzSHPeGFSqMofa2zBSj_-6KnVMeAd121IUP2fFhHgjsZkXRRULtHPrdV4YKIqk8aXwojKunIx2Gz0MQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkeeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcu
 ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefhe
 ehieeludffheetiefhvddtleffuddtleduudeiudetvdefffehkeehgfettdenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
 drnhgvthdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
 oheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegurhhiqd
 guvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohep
 ihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtth
 hopehjsehjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:UidcaafA7lbHGfxVAM44fJ3pKNNrwZU8riINWzBnHnlkchi64SskOA>
 <xmx:UydcafujxJNAYWqc-RB5LWWwmMJVw8fxNADuciHn1ReV5l_KTrg8FQ>
 <xmx:UydcaR9-EvFmN4zsYg8NvbUKgmRN4_MLnOrGZLvNEYXQA6SV8_20bg>
 <xmx:UydcaS1K2Z1iNTE8ocJRtkpo3agUgDy3jgSpG6MnOOeDnPmOI6Y7jQ>
 <xmx:UydcaZ0zuRUA8fUppYEkt4zvd8LvC8F0KWQGvBFFEdxdLIfMnbIRjZgO>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 16:04:17 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Mon, 05 Jan 2026 22:03:46 +0100
Subject: [PATCH i-g-t 2/3] asahi: Add test infrastruture for asahi DRM
 render driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-asahi-tests-wave1-v1-2-a6c72617e680@jannau.net>
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
In-Reply-To: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8198; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=aMpphEuoPtqwfjZsL5kz+5PEYowIkxg2ZA0leUcntHY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhswYdfsYHoEttY83B6rqKc13PLxbeaO6n9Rx9/cKy9t0J
 oXIT9PoKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJF9ZxgZtkxWcN7wK/HqK/lp
 i7rvet3+WuVuMuFjaC2DQVLRhMwdkgx/Jfj+rtCoX5HuXLV+kW+DedJvg8DMz1/+zbku+Mjl25E
 QPgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
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

Asahi is DRM render-only driver for Apple AGX GPUs found in Apple
silicon SoCs starting with the Apple M1 family.
Add a define for the driver, build system support and a helper function
for DRM_IOCTL_ASAHI_GET_PARAMS. To ensure everything works add an
initial test for DRM_IOCTL_ASAHI_GET_PARAMS.
Further tests are expected to require some of the queried parameters.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 lib/drmtest.c                  |  1 +
 lib/drmtest.h                  |  1 +
 lib/igt_asahi.c                | 44 +++++++++++++++++++++++++++++++++
 lib/igt_asahi.h                | 12 +++++++++
 lib/meson.build                |  1 +
 meson.build                    |  8 ++++++
 tests/asahi/asahi_get_params.c | 55 ++++++++++++++++++++++++++++++++++++++++++
 tests/asahi/meson.build        | 13 ++++++++++
 tests/meson.build              |  2 ++
 9 files changed, 137 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4a788ea7a59cfd2878d0586b1d7ed9ad0de14a14..dc3fe330bf57693fa4f157cf9076e995e64639cb 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -222,6 +222,7 @@ static const struct module {
 	void (*modprobe)(const char *name);
 } modules[] = {
 	{ DRIVER_AMDGPU, "amdgpu" },
+	{ DRIVER_ASAHI, "asahi" },
 	{ DRIVER_INTEL, "i915", modprobe_i915 },
 	{ DRIVER_MSM, "msm" },
 	{ DRIVER_PANFROST, "panfrost" },
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 37874d729bb89577f61875728bd0d6d2a6458756..74cff27ffd3deba4b7664b4f37fbd59143e04f3e 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -58,6 +58,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
 #define DRIVER_VKMS	(1 << 9)
 #define DRIVER_VIRTIO	(1 << 10)
 #define DRIVER_PANTHOR	(1 << 11)
+#define DRIVER_ASAHI	(1 << 12)
 
 /*
  * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if you run
diff --git a/lib/igt_asahi.c b/lib/igt_asahi.c
new file mode 100644
index 0000000000000000000000000000000000000000..90d2c190f0dd05e372af0eefaed22d2b2a26eb71
--- /dev/null
+++ b/lib/igt_asahi.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
+// SPDX-FileCopyrightText: Copyright (C) 2025 Asahi Linux contributors
+/*
+ * Based on igt_panthor.c
+ */
+
+#include "drmtest.h"
+#include "igt_asahi.h"
+#include "ioctl_wrappers.h"
+#include "asahi_drm.h"
+
+#include <stdint.h>
+
+/**
+ * SECTION:igt_asahi
+ * @short_description: asahi support library
+ * @title: Asahi
+ * @include: igt.h
+ *
+ * This Library provides auxiliary helper functions for writing asahi tests.
+ */
+
+/**
+ * igt_asahi_get_params:
+ * @fd: device file descriptor
+ * @param_group: which params to query parameters for
+ * @params: pointer to the struct to store the parameters in
+ * @size: size of the params buffer
+ * @err: expected error code, 0 for success
+ */
+void igt_asahi_get_params(int fd, uint32_t param_group, void *params, size_t size, int err)
+{
+	struct drm_asahi_get_params get_params = {
+		.param_group = param_group,
+		.pointer = (uintptr_t)params,
+		.size = size,
+	};
+
+	if (err)
+		do_ioctl_err(fd, DRM_IOCTL_ASAHI_GET_PARAMS, &get_params, err);
+	else
+		do_ioctl(fd, DRM_IOCTL_ASAHI_GET_PARAMS, &get_params);
+}
diff --git a/lib/igt_asahi.h b/lib/igt_asahi.h
new file mode 100644
index 0000000000000000000000000000000000000000..f0ac3fbf428a8050957eab0e9b259f68b5ecd0cd
--- /dev/null
+++ b/lib/igt_asahi.h
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) 2025 Asahi Linux contributors
+
+#ifndef ASAHI_IOCTL_H
+#define ASAHI_IOCTL_H
+
+#include <stddef.h>
+#include <stdint.h>
+
+void igt_asahi_get_params(int fd, uint32_t param_group, void *data, size_t size, int err);
+
+#endif /* ASAHI_IOCTL_H */
diff --git a/lib/meson.build b/lib/meson.build
index d0487fb3ca79faa40640579ce78efd434eb38f86..73e07ea677ebbffa9722de7c28b6c94bc2a53ee0 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -105,6 +105,7 @@ lib_sources = [
 	'uwildmat/uwildmat.c',
 	'igt_kmod.c',
 	'igt_ktap.c',
+	'igt_asahi.c',
 	'igt_panfrost.c',
 	'igt_panthor.c',
 	'igt_v3d.c',
diff --git a/meson.build b/meson.build
index 4b2496c01679852c05c575ab4589192b15da149c..1b16a60281e6202b99affbf43d1ab4e098ea6860 100644
--- a/meson.build
+++ b/meson.build
@@ -286,6 +286,7 @@ includedir = get_option('includedir')
 libdir = get_option('libdir')
 libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
+asahidir = join_paths(libexecdir, 'asahi')
 msmdir = join_paths(libexecdir, 'msm')
 panfrostdir = join_paths(libexecdir, 'panfrost')
 panthordir = join_paths(libexecdir, 'panthor')
@@ -330,6 +331,12 @@ if get_option('use_rpath')
 	endforeach
 	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
 
+	asahi_rpathdir = '$ORIGIN'
+	foreach p : asahidir.split('/')
+		asahi_rpathdir = join_paths(asahi_rpathdir, '..')
+	endforeach
+	asahi_rpathdir = join_paths(asahi_rpathdir, libdir)
+
 	msm_rpathdir = '$ORIGIN'
 	foreach p : msmdir.split('/')
 		msm_rpathdir = join_paths(msm_rpathdir, '..')
@@ -375,6 +382,7 @@ else
 	bindir_rpathdir = ''
 	libexecdir_rpathdir = ''
 	amdgpudir_rpathdir = ''
+	asahi_rpathdir = ''
 	msm_rpathdir = ''
 	panfrost_rpathdir = ''
 	panthor_rpathdir = ''
diff --git a/tests/asahi/asahi_get_params.c b/tests/asahi/asahi_get_params.c
new file mode 100644
index 0000000000000000000000000000000000000000..43482a00418f854cba2417f8f8eb5c6a04e19385
--- /dev/null
+++ b/tests/asahi/asahi_get_params.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: MIT
+// SPDX-FileCopyrightText: Copyright (C) Asahi Linux contributors
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_asahi.h"
+#include "asahi_drm.h"
+#include <stdint.h>
+
+int igt_main()
+{
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver_render(DRIVER_ASAHI);
+	}
+
+	igt_describe("Query global GPU parameters from device.");
+	igt_subtest("get-params") {
+		struct drm_asahi_params_global globals = {};
+
+		igt_asahi_get_params(fd, 0, &globals, sizeof(globals), 0);
+
+		// Supported GPU generations start with G13G
+		igt_assert(globals.gpu_generation >= 13);
+		// chip id is expected to be non zero
+		igt_assert(globals.chip_id != 0);
+		// VM should contain some space
+		igt_assert(globals.vm_end > globals.vm_start);
+		// the driver is expected to request some space for the
+		// kernel in a VM
+		igt_assert(globals.vm_kernel_min_size > 0);
+		// the frequency of the clock used to generate timestamps
+		igt_assert(globals.command_timestamp_frequency_hz > 0);
+	}
+
+	igt_describe("Query global GPU parameters for invalid param_groups.");
+	igt_subtest_group() {
+		struct drm_asahi_params_global globals = {};
+
+		igt_subtest("get-params-1") {
+			igt_asahi_get_params(fd, 1, &globals, sizeof(globals), EINVAL);
+		}
+		igt_subtest("get-params-2") {
+			igt_asahi_get_params(fd, 2, &globals, sizeof(globals), EINVAL);
+		}
+		igt_subtest("get-params-uint32-max") {
+			igt_asahi_get_params(fd, UINT32_MAX, &globals, sizeof(globals), EINVAL);
+		}
+	}
+
+	igt_fixture() {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/asahi/meson.build b/tests/asahi/meson.build
new file mode 100644
index 0000000000000000000000000000000000000000..909e146295e83f558ef7378f814ded55adaafe2b
--- /dev/null
+++ b/tests/asahi/meson.build
@@ -0,0 +1,13 @@
+asahi_progs = [
+	'asahi_get_params',
+]
+
+foreach prog : asahi_progs
+	test_executables += executable(prog,
+				       prog + '.c',
+				       dependencies : test_deps,
+				       install_dir : asahidir,
+				       install_rpath : asahi_rpathdir,
+				       install : true)
+	test_list += join_paths('asahi', prog)
+endforeach
diff --git a/tests/meson.build b/tests/meson.build
index 169340d7d0937020f04b1720d5570619ce0d3591..ba69c56e7f872cb0050f6508d91318e000be6e97 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -491,6 +491,8 @@ endif
 
 subdir('amdgpu')
 
+subdir('asahi')
+
 subdir('msm')
 
 subdir('panfrost')

-- 
2.52.0

