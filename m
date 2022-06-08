Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495CF54209D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 03:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6309910ECDF;
	Wed,  8 Jun 2022 01:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4AF10ECDF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 01:09:40 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id y69so12394312oia.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 18:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5p+YY8gybAKuQcsMVh2MWy7OP9yApdl+Art1AWfbko4=;
 b=l0vH6uF2Kay4roGyviEB6yUha0FWjErNM5oSVGGa9GYxycj69SewTV4S+exXuVIrld
 tcD0oVt97q4NnrQ5WUbOxoLgD4uHd7K17nmo5pC4oWCihLwe+aKT9zNj1UfumIkGSOlf
 rf4sVKhsJk/0rM7laRh6sJCKrmmSak6qTexnX1kIp+46qQTQcoZJcituYmW4kFuZzgmP
 /B+yOZkotlB2O62UuGVKIqpoUDKLgf8cY2afKSv0a5RoOmHK3DhECgn2ywgfS7dIZQE0
 +jkUg+eQ3NZKl2t5LuPU0qgMZnpdm7x8eMxgUAVEuh9MZzLoDuiT90QO8FRB46Ex65fd
 D9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5p+YY8gybAKuQcsMVh2MWy7OP9yApdl+Art1AWfbko4=;
 b=AzXO0fU7DugoxVv1DxmJx6gSpn8UsZm2wt1bY81c9Gpfmdb3/TxT1ZFwAoqNGbgKMU
 hEgAgXDW5+0eRlhRRP/Y+I90lTDSM31bjmNT2e1aQfvvjrvbmPSYSJNqNWDXiU3KnYcS
 NfOT9XQj/36n/JhiJH8FInPoyRUvDoZUJkLIMRwSrilVcMRDPo5SzSuH4JmV1V+gTtw7
 s0d3f8wGP19auojxQmG/EEXyPpjAoxf7ME1eDP8O0anr8vORvoc7rPySd3+gPU7CscjL
 HqA0LCndE89yK4EtTRthecn3JBKZ4Yt0XjrCPsnu/pBwAZr6YN6Dpfijt/YRhmqPL04I
 YGow==
X-Gm-Message-State: AOAM532YWzx9m6hiqCZONjJ9tk4P+260RDdalyHDFLvH8yR2MZQnM3Ul
 WiOLh9cdeL8oMfvJSHZMELZw9Q==
X-Google-Smtp-Source: ABdhPJzAtEy3VpvtGd8JE19u4+8me6FEpwHjaGKdRGUz1fqMacKFsUnOWNFd1Awi6hzS+5tNdeA1Ow==
X-Received: by 2002:a05:6808:bc7:b0:32b:1c5a:d8b1 with SMTP id
 o7-20020a0568080bc700b0032b1c5ad8b1mr1000182oik.185.1654650578632; 
 Tue, 07 Jun 2022 18:09:38 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a544e90000000b0032b1b84f4e3sm10343057oiy.22.2022.06.07.18.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 18:09:38 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Jun Lei <jun.lei@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>,
 Harrison Chiu <harrison.chiu@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
Subject: [RFC 3/3] drm/amd/display: Introduce KUnit tests to the bw_fixed
 library
Date: Tue,  7 Jun 2022 22:07:11 -0300
Message-Id: <20220608010709.272962-4-maira.canal@usp.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608010709.272962-1-maira.canal@usp.br>
References: <20220608010709.272962-1-maira.canal@usp.br>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Magali Lemes <magalilemes00@gmail.com>

The bw_fixed library performs a lot of the mathematical operations
involving fixed-point arithmetic and the conversion of integers to
fixed-point representation.

As fixed-point representation is the base foundation of the DML calcs
operations, this unit tests intend to assure the proper functioning of
the basic mathematical operations of fixed-point arithmetic, such as
multiplication, conversion from fractional to fixed-point number, and more.

Co-developed-by: Tales Aparecida <tales.aparecida@gmail.com>
Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
Co-developed-by: Maíra Canal <maira.canal@usp.br>
Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 .../drm/amd/display/amdgpu_dm/tests/Kconfig   |  12 +
 .../drm/amd/display/amdgpu_dm/tests/Makefile  |   4 +
 .../amdgpu_dm/tests/calcs/bw_fixed_test.c     | 322 ++++++++++++++++++
 .../amd/display/amdgpu_dm/tests/dml_test.c    |   3 +
 .../amd/display/amdgpu_dm/tests/dml_test.h    |   8 +
 5 files changed, 349 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/calcs/bw_fixed_test.c

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
index bd1d971d4452..540b2f79f971 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
@@ -2,6 +2,18 @@
 menu "DML Unit Tests"
 	depends on DRM_AMD_DC && KUNIT=m
 
+config BW_FIXED_KUNIT_TEST
+	bool "Enable unit tests for dml/calcs/bw_fixed" if !DML_KUNIT_TEST
+	default y if DML_KUNIT_TEST
+	help
+		Enables unit tests for the dml/calcs/bw_fixed. Only useful for kernel
+		devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
+
 config DISPLAY_MODE_LIB_KUNIT_TEST
 	bool "Enable unit tests for dml/display_mode_lib" if !DML_KUNIT_TEST
 	default y if DML_KUNIT_TEST
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
index 53b38e340564..23109e51cf32 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
@@ -5,6 +5,10 @@
 
 DML_TESTS = dml_test.o
 
+ifdef CONFIG_BW_FIXED_KUNIT_TEST
+DML_TESTS += calcs/bw_fixed_test.o
+endif
+
 ifdef CONFIG_DISPLAY_MODE_LIB_KUNIT_TEST
 DML_TESTS += display_mode_lib_test.o
 endif
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/calcs/bw_fixed_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/calcs/bw_fixed_test.c
new file mode 100644
index 000000000000..344c1517745e
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/calcs/bw_fixed_test.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/calcs/bw_fixed.h
+ *
+ * Copyright (C) 2022, Magali Lemes <magalilemes00@gmail.com>
+ * Copyright (C) 2022, Maíra Canal <mairacanal@riseup.net>
+ * Copyright (C) 2022, Tales Aparecida <tales.aparecida@gmail.com>
+ */
+
+#include <kunit/test.h>
+#include "../../../dc/inc/bw_fixed.h"
+#include "../dml_test.h"
+
+/**
+ * DOC: Unit tests for AMDGPU DML calcs/bw_fixed.h
+ *
+ * bw_fixed.h performs a lot of the mathematical operations involving
+ * fixed-point arithmetic and the conversion of integers to fixed-point
+ * representation.
+ *
+ * As fixed-point representation is the base foundation of the DML calcs
+ * operations, these tests intend to assure the proper functioning of the
+ * basic mathematical operations of fixed-point arithmetic, such as
+ * multiplication, conversion from fractional to fixed-point number, and more.
+ *
+ */
+
+static void abs_i64_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 0ULL, abs_i64(0LL));
+
+	/* Argument type limits */
+	KUNIT_EXPECT_EQ(test, (uint64_t)MAX_I64, abs_i64(MAX_I64));
+	KUNIT_EXPECT_EQ(test, (uint64_t)MAX_I64 + 1, abs_i64(MIN_I64));
+}
+
+static void bw_int_to_fixed_nonconst_test(struct kunit *test)
+{
+	struct bw_fixed res;
+
+	/* Add BW_FIXED_BITS_PER_FRACTIONAL_PART trailing 0s to binary number */
+	res = bw_int_to_fixed_nonconst(1000);          /* 0x3E8 */
+	KUNIT_EXPECT_EQ(test, 16777216000, res.value); /* 0x3E8000000 */
+
+	res = bw_int_to_fixed_nonconst(-1000);          /* -0x3E8 */
+	KUNIT_EXPECT_EQ(test, -16777216000, res.value); /* -0x3E8000000 */
+
+	res = bw_int_to_fixed_nonconst(0LL);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	/**
+	 * Test corner cases, as the function's argument has to be an int64_t
+	 * between BW_FIXED_MIN_I32 and BW_FIXED_MAX_I32.
+	 */
+	res = bw_int_to_fixed_nonconst(BW_FIXED_MAX_I32 - 1);  /* 0x7FFFFFFFFE */
+	KUNIT_EXPECT_EQ(test, 9223372036821221376, res.value); /* 0x7FFFFFFFFE000000 */
+
+	res = bw_int_to_fixed_nonconst(BW_FIXED_MIN_I32 + 1);   /* -0x7FFFFFFFFF */
+	KUNIT_EXPECT_EQ(test, -9223372036837998592, res.value); /* -0x7FFFFFFFFF000000 */
+}
+
+static void bw_frc_to_fixed_test(struct kunit *test)
+{
+	struct bw_fixed res;
+
+	/* Extreme scenarios */
+
+	/* A fraction of N/N should result in "1.0" */
+	res = bw_frc_to_fixed(MAX_I64, MAX_I64);
+	KUNIT_EXPECT_EQ(test, 1LL << BW_FIXED_BITS_PER_FRACTIONAL_PART, res.value);
+
+	res = bw_frc_to_fixed(1, MAX_I64);
+	KUNIT_EXPECT_EQ(test, 0LL, res.value);
+
+	res = bw_frc_to_fixed(0, MAX_I64);
+	KUNIT_EXPECT_EQ(test, 0LL, res.value);
+
+	/* Turn a repeating decimal to the fixed-point representation */
+
+	/* A repeating decimal that doesn't round up the LSB */
+	res = bw_frc_to_fixed(4, 3);
+	KUNIT_EXPECT_EQ(test, 22369621LL, res.value);     /* 0x1555555 */
+
+	res = bw_frc_to_fixed(-4, 3);
+	KUNIT_EXPECT_EQ(test, -22369621LL, res.value);    /* -0x1555555 */
+
+	res = bw_frc_to_fixed(99999997, 100000000);
+	KUNIT_EXPECT_EQ(test, 16777215LL, res.value);     /* 0x0FFFFFF */
+
+	/* A repeating decimal that rounds up the MSB */
+	res = bw_frc_to_fixed(5, 3);
+	KUNIT_EXPECT_EQ(test, 27962027LL, res.value);     /* 0x1AAAAAB */
+
+	res = bw_frc_to_fixed(-5, 3);
+	KUNIT_EXPECT_EQ(test, -27962027LL, res.value);    /* -0x1AAAAAB */
+
+	res = bw_frc_to_fixed(99999998, 100000000);
+	KUNIT_EXPECT_EQ(test, 1LL << BW_FIXED_BITS_PER_FRACTIONAL_PART, res.value);
+
+	/* Turn a terminating decimal to the fixed-point representation */
+	res = bw_frc_to_fixed(62609, 100);
+	KUNIT_EXPECT_EQ(test, 10504047165LL, res.value);  /* 0X272170A3D */
+
+	res = bw_frc_to_fixed(-62609, 100);
+	KUNIT_EXPECT_EQ(test, -10504047165LL, res.value); /* -0X272170A3D */
+}
+
+static void bw_floor2_test(struct kunit *test)
+{
+	struct bw_fixed arg;
+	struct bw_fixed significance;
+	struct bw_fixed res;
+
+	/* Round 10 down to the nearest multiple of 3 */
+	arg.value = 10;
+	significance.value = 3;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 9, res.value);
+
+	/* Round 10 down to the nearest multiple of 5 */
+	arg.value = 10;
+	significance.value = 5;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 10, res.value);
+
+	/* Round 100 down to the nearest multiple of 7 */
+	arg.value = 100;
+	significance.value = 7;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 98, res.value);
+
+	/* Round an integer down to its nearest multiple should return itself */
+	arg.value = MAX_I64;
+	significance.value = MAX_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	arg.value = MIN_I64;
+	significance.value = MIN_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MIN_I64, res.value);
+
+	/* Value is a multiple of significance, result should be value */
+	arg.value = MAX_I64;
+	significance.value = MIN_I64 + 1;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	/* Round 0 down to the nearest multiple of any number should return 0 */
+	arg.value = 0;
+	significance.value = MAX_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg.value = 0;
+	significance.value = MIN_I64;
+	res = bw_floor2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+}
+
+static void bw_ceil2_test(struct kunit *test)
+{
+	struct bw_fixed arg;
+	struct bw_fixed significance;
+	struct bw_fixed res;
+
+	/* Round 10 up to the nearest multiple of 3 */
+	arg.value = 10;
+	significance.value = 3;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 12, res.value);
+
+	/* Round 10 up to the nearest multiple of 5 */
+	arg.value = 10;
+	significance.value = 5;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 10, res.value);
+
+	/* Round 100 up to the nearest multiple of 7 */
+	arg.value = 100;
+	significance.value = 7;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 105, res.value);
+
+	/* Round an integer up to its nearest multiple should return itself */
+	arg.value = MAX_I64;
+	significance.value = MAX_I64;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	arg.value = MIN_I64 + 1;
+	significance.value = MIN_I64 + 1;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MIN_I64 + 1, res.value);
+
+	/* Value is a multiple of significance, result should be value */
+	arg.value = MAX_I64;
+	significance.value = MIN_I64 + 1;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, MAX_I64, res.value);
+
+	/* Round 0 up to the nearest multiple of any number should return 0 */
+	arg.value = 0;
+	significance.value = MAX_I64;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg.value = 0;
+	significance.value = MIN_I64;
+	res = bw_ceil2(arg, significance);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+}
+
+static void bw_mul_test(struct kunit *test)
+{
+	struct bw_fixed arg1;
+	struct bw_fixed arg2;
+	struct bw_fixed res;
+	struct bw_fixed ans;
+
+	/* Extreme scenario */
+	arg1.value = MAX_I64;
+	arg2.value = MIN_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, BW_FIXED_MAX_I32 + 1, res.value);
+
+	/* Testing multiplication property: x * 1 = x */
+	arg1.value = 1;
+	arg2.value = MAX_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, BW_FIXED_MAX_I32 + 1, res.value);
+
+	arg1.value = 1;
+	arg2.value = MIN_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, BW_FIXED_MIN_I32, res.value);
+
+	/* Testing multiplication property: x * 0 = 0 */
+	arg1.value = 0;
+	arg2.value = 0;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg1.value = 0;
+	arg2.value = MAX_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	arg1.value = 0;
+	arg2.value = MIN_I64;
+	res = bw_mul(arg1, arg2);
+	KUNIT_EXPECT_EQ(test, 0, res.value);
+
+	/* Testing multiplication between integers */
+	res = bw_mul(bw_int_to_fixed(8), bw_int_to_fixed(10));
+	KUNIT_EXPECT_EQ(test, 1342177280LL, res.value); /* 0x50000000 */
+
+	res = bw_mul(bw_int_to_fixed(10), bw_int_to_fixed(5));
+	KUNIT_EXPECT_EQ(test, 838860800LL, res.value); /* 0x32000000 */
+
+	res = bw_mul(bw_int_to_fixed(-10), bw_int_to_fixed(7));
+	KUNIT_EXPECT_EQ(test, -1174405120LL, res.value); /* -0x46000000 */
+
+	/* Testing multiplication between fractions and integers */
+	res = bw_mul(bw_frc_to_fixed(4, 3), bw_int_to_fixed(3));
+	ans = bw_int_to_fixed(4);
+
+	/**
+	 * As bw_frc_to_fixed(4, 3) didn't round up the fixed-point representation,
+	 * the ans must be subtrated by 1.
+	 */
+	KUNIT_EXPECT_EQ(test, ans.value - 1, res.value);
+
+	res = bw_mul(bw_frc_to_fixed(5, 3), bw_int_to_fixed(3));
+	ans = bw_int_to_fixed(5);
+
+	/**
+	 * As bw_frc_to_fixed(5, 3) rounds up the fixed-point representation,
+	 * the ans must be added by 1.
+	 */
+	KUNIT_EXPECT_EQ(test, ans.value + 1, res.value);
+}
+
+static struct kunit_case bw_fixed_test_cases[] = {
+	KUNIT_CASE(abs_i64_test),
+	KUNIT_CASE(bw_int_to_fixed_nonconst_test),
+	KUNIT_CASE(bw_frc_to_fixed_test),
+	KUNIT_CASE(bw_floor2_test),
+	KUNIT_CASE(bw_ceil2_test),
+	KUNIT_CASE(bw_mul_test),
+	{  }
+};
+
+static struct kunit_suite bw_fixed_test_suite = {
+	.name = "dml-calcs-bw-fixed",
+	.test_cases = bw_fixed_test_cases,
+};
+
+static struct kunit_suite *bw_fixed_test_suites[] = { &bw_fixed_test_suite, NULL };
+
+int bw_fixed_test_init(void)
+{
+	pr_info("===> Running calcs/bw_fixed KUnit Tests");
+	pr_info("**********************************************************");
+	pr_info("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **");
+	pr_info("**                                                      **");
+	pr_info("** calcs/bw_fixed KUnit Tests are being run. This means **");
+	pr_info("** that this is a TEST kernel and should not be used    **");
+	pr_info("** for production.                                      **");
+	pr_info("**                                                      **");
+	pr_info("** If you see this message and you are not debugging    **");
+	pr_info("** the kernel, report this immediately to your vendor!  **");
+	pr_info("**                                                      **");
+	pr_info("**********************************************************");
+
+	return __kunit_test_suites_init(bw_fixed_test_suites);
+}
+
+void bw_fixed_test_exit(void)
+{
+	return __kunit_test_suites_exit(bw_fixed_test_suites);
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c
index 9a5d47597c10..98ae4e8cd952 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c
@@ -13,11 +13,14 @@
  */
 int amdgpu_dml_test_init(void)
 {
+	bw_fixed_test_init();
 	display_mode_lib_test_init();
+
 	return 0;
 }
 
 void amdgpu_dml_test_exit(void)
 {
 	display_mode_lib_test_exit();
+	bw_fixed_test_exit();
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.h b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.h
index 2786db9d0e87..d8fe38abd9bc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.h
@@ -2,6 +2,14 @@
 #ifndef DML_TEST_H_
 #define DML_TEST_H_
 
+#if defined (CONFIG_BW_FIXED_KUNIT_TEST)
+int bw_fixed_test_init(void);
+void bw_fixed_test_exit(void);
+#else
+static inline int bw_fixed_test_init(void) { return 0; }
+static inline void bw_fixed_test_exit(void) { }
+#endif
+
 #if defined (CONFIG_DISPLAY_MODE_LIB_KUNIT_TEST)
 int display_mode_lib_test_init(void);
 void display_mode_lib_test_exit(void);
-- 
2.36.1

