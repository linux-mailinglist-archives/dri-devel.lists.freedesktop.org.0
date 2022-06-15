Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D6A54CA96
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 16:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BC010F715;
	Wed, 15 Jun 2022 13:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C8810F72F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:59:53 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id h187so15569014oif.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 06:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqX7pyDsRsnxVd7um6ECYDVkH+sbOxfeN1/XFEFnRl4=;
 b=HP18Pp2gTfz2A896UOXh17WQmM71eUS6AdPv/aIDtt2kzIF/fuhOTehJfyC8qXiajv
 Gqkm22j9ENm+RY2uCdHL5tH0uNvQN0EBl74fPehaqQxKfp6ArY3hPlYcIJkEfX4XGXRR
 cUeV6LdRX9195bozYfAWwQBVkNWhuMsMBewLMBB1QQYyPuzaZcdW9ggMy4ZC5JdYrTXN
 gNNlseBgylrId9/jWq5YzBdEHXKvhIRqE12ZvSGTFKYmaCYPgAbnsTQtyffjnyLGH2Ns
 TGU4ajvZ3HgT2D42+HW27qYkFVjfMCwS8HJ13PJBnYPWLZxt4G19PNuYRZ0dcCPKB0PM
 2VEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqX7pyDsRsnxVd7um6ECYDVkH+sbOxfeN1/XFEFnRl4=;
 b=1mCY96pEqDOtluHXjJdosLWdCPHvzZFm1i91Rzq9/61KhmlTKGhwU9TDtmvU2eohCI
 fTi5sjRslh7w4M2kLp+1uZU66+pHSgE4gbtjATCHGy3tbBgrucLDw2oNrACxCCbEjQqn
 c6xQSPOulZBr7YlOCRgG8F4iMYmlQ1kjdswEqTdGMGXVu+/f+km5+/IIWPhF26O2rNyb
 ZBcMzJVjcNX51Mlbak6kgnjSFwxPyQjGDVUtpWkk63Tre8gHUzLLozuuPiRJqp13rDP6
 cFWtaBdbEyoQbvgStqCwbo6i8ouqVRusnB4gWQEBqNtbbtqhHtxvXuBbl3Z9SnP9k7Hk
 SrTQ==
X-Gm-Message-State: AOAM532iqFTE/eWvGvyyIX2PvaQcfBJU6w1assSv24Vf4lQee4NuVLj9
 zlkpTpz3glQTh5y0M6TcWuOgkg==
X-Google-Smtp-Source: ABdhPJy1WggQTSsvEhrVpfeG5oP8kP/8bOl2j0L6cRLZA86A2Rdk3m1yOt3Yh9yEhs35b+hmkBV/Yg==
X-Received: by 2002:a54:4419:0:b0:32e:7cc0:de67 with SMTP id
 k25-20020a544419000000b0032e7cc0de67mr5044939oiw.51.1655301592448; 
 Wed, 15 Jun 2022 06:59:52 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056830248700b0060bfebb96e5sm6056928ots.35.2022.06.15.06.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 06:59:51 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 Trevor Woerner <twoerner@gmail.com>, leandro.ribeiro@collabora.com,
 n@nfraprado.net, Daniel Vetter <daniel@ffwll.ch>,
 Shuah Khan <skhan@linuxfoundation.org>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
Subject: [PATCH 07/10] drm: selftest: convert drm_dp_mst_helper selftest to
 KUnit
Date: Wed, 15 Jun 2022 10:58:21 -0300
Message-Id: <20220615135824.15522-8-maira.canal@usp.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615135824.15522-1-maira.canal@usp.br>
References: <20220615135824.15522-1-maira.canal@usp.br>
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
 Rubens Gomes Neto <rubens.gomes.neto@usp.br>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Considering the current adoption of the KUnit framework, convert the
DRM DP MST helper selftest to the KUnit API.

Co-developed-by: Rubens Gomes Neto <rubens.gomes.neto@usp.br>
Signed-off-by: Rubens Gomes Neto <rubens.gomes.neto@usp.br>
Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/selftests/Makefile            |  3 +-
 .../gpu/drm/selftests/drm_modeset_selftests.h |  2 -
 .../drm/selftests/test-drm_modeset_common.h   |  2 -
 drivers/gpu/drm/tests/Kconfig                 | 13 +++
 drivers/gpu/drm/tests/Makefile                |  1 +
 .../test-drm_dp_mst_helper.c                  | 82 ++++++++++---------
 6 files changed, 59 insertions(+), 44 deletions(-)
 rename drivers/gpu/drm/{selftests => tests}/test-drm_dp_mst_helper.c (73%)

diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
index 9e0ccb482841..1539f55db9a7 100644
--- a/drivers/gpu/drm/selftests/Makefile
+++ b/drivers/gpu/drm/selftests/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-test-drm_modeset-y := test-drm_modeset_common.o test-drm_framebuffer.o \
-					test-drm_dp_mst_helper.o
+test-drm_modeset-y := test-drm_modeset_common.o test-drm_framebuffer.o
 
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o \
 				    test-drm_buddy.o
diff --git a/drivers/gpu/drm/selftests/drm_modeset_selftests.h b/drivers/gpu/drm/selftests/drm_modeset_selftests.h
index 22e467f6465a..40a29b8cf386 100644
--- a/drivers/gpu/drm/selftests/drm_modeset_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_modeset_selftests.h
@@ -7,5 +7,3 @@
  * Tests are executed in order by igt/drm_selftests_helper
  */
 selftest(check_drm_framebuffer_create, igt_check_drm_framebuffer_create)
-selftest(dp_mst_calc_pbn_mode, igt_dp_mst_calc_pbn_mode)
-selftest(dp_mst_sideband_msg_req_decode, igt_dp_mst_sideband_msg_req_decode)
diff --git a/drivers/gpu/drm/selftests/test-drm_modeset_common.h b/drivers/gpu/drm/selftests/test-drm_modeset_common.h
index 790f3cf31f0d..3feb2fea1a6b 100644
--- a/drivers/gpu/drm/selftests/test-drm_modeset_common.h
+++ b/drivers/gpu/drm/selftests/test-drm_modeset_common.h
@@ -17,7 +17,5 @@
 #define FAIL_ON(x) FAIL((x), "%s", "FAIL_ON(" __stringify(x) ")\n")
 
 int igt_check_drm_framebuffer_create(void *ignored);
-int igt_dp_mst_calc_pbn_mode(void *ignored);
-int igt_dp_mst_sideband_msg_req_decode(void *ignored);
 
 #endif
diff --git a/drivers/gpu/drm/tests/Kconfig b/drivers/gpu/drm/tests/Kconfig
index 5aa8ac2dd28e..eea0783f981d 100644
--- a/drivers/gpu/drm/tests/Kconfig
+++ b/drivers/gpu/drm/tests/Kconfig
@@ -73,4 +73,17 @@ config DRM_PLANE_HELPER_KUNIT_TEST
 
 		If in doubt, say "N".
 
+config DRM_DP_MST_HELPER_KUNIT_TEST
+	tristate "KUnit tests for DRM DP MST helper" if !DRM_KUNIT_TEST
+	select DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
+	default y if DRM_KUNIT_TEST
+	help
+		This option provides a kunit module that can be used to run
+		an unit test on the DRM DP MST helper API. This option is not
+		useful for distributions or general kernels, but only for kernel
+		developers working on DRM and associated drivers.
+
+		If in doubt, say "N".
+
 endmenu
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 6e3a10806cd8..735ca8e4c446 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_CMDLINE_PARSER_KUNIT_TEST) += test-drm_cmdline_parser.o
 obj-$(CONFIG_DRM_RECT_KUNIT_TEST) += test-drm_rect.o
 obj-$(CONFIG_DRM_FORMAT_KUNIT_TEST) += test-drm_format.o
 obj-$(CONFIG_DRM_PLANE_HELPER_KUNIT_TEST) += test-drm_plane_helper.o
+obj-$(CONFIG_DRM_DP_MST_HELPER_KUNIT_TEST) += test-drm_dp_mst_helper.o
diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/tests/test-drm_dp_mst_helper.c
similarity index 73%
rename from drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
rename to drivers/gpu/drm/tests/test-drm_dp_mst_helper.c
index 967c52150b67..88120e878a15 100644
--- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
+++ b/drivers/gpu/drm/tests/test-drm_dp_mst_helper.c
@@ -5,15 +5,15 @@
 
 #define PREFIX_STR "[drm_dp_mst_helper]"
 
+#include <kunit/test.h>
 #include <linux/random.h>
 
 #include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_print.h>
 
 #include "../display/drm_dp_mst_topology_internal.h"
-#include "test-drm_modeset_common.h"
 
-int igt_dp_mst_calc_pbn_mode(void *ignored)
+static void igt_dp_mst_calc_pbn_mode(struct kunit *test)
 {
 	int pbn, i;
 	const struct {
@@ -33,13 +33,11 @@ int igt_dp_mst_calc_pbn_mode(void *ignored)
 		pbn = drm_dp_calc_pbn_mode(test_params[i].rate,
 					   test_params[i].bpp,
 					   test_params[i].dsc);
-		FAIL(pbn != test_params[i].expected,
+		KUNIT_EXPECT_EQ_MSG(test, pbn, test_params[i].expected,
 		     "Expected PBN %d for clock %d bpp %d, got %d\n",
 		     test_params[i].expected, test_params[i].rate,
 		     test_params[i].bpp, pbn);
 	}
-
-	return 0;
 }
 
 static bool
@@ -176,66 +174,64 @@ sideband_msg_req_encode_decode(struct drm_dp_sideband_msg_req_body *in)
 	return result;
 }
 
-int igt_dp_mst_sideband_msg_req_decode(void *unused)
+static void igt_dp_mst_sideband_msg_req_decode(struct kunit *test)
 {
 	struct drm_dp_sideband_msg_req_body in = { 0 };
 	u8 data[] = { 0xff, 0x0, 0xdd };
 	int i;
 
-#define DO_TEST() FAIL_ON(!sideband_msg_req_encode_decode(&in))
-
 	in.req_type = DP_ENUM_PATH_RESOURCES;
 	in.u.port_num.port_number = 5;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 
 	in.req_type = DP_POWER_UP_PHY;
 	in.u.port_num.port_number = 5;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 
 	in.req_type = DP_POWER_DOWN_PHY;
 	in.u.port_num.port_number = 5;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 
 	in.req_type = DP_ALLOCATE_PAYLOAD;
 	in.u.allocate_payload.number_sdp_streams = 3;
 	for (i = 0; i < in.u.allocate_payload.number_sdp_streams; i++)
 		in.u.allocate_payload.sdp_stream_sink[i] = i + 1;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.allocate_payload.port_number = 0xf;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.allocate_payload.vcpi = 0x7f;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.allocate_payload.pbn = U16_MAX;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 
 	in.req_type = DP_QUERY_PAYLOAD;
 	in.u.query_payload.port_number = 0xf;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.query_payload.vcpi = 0x7f;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 
 	in.req_type = DP_REMOTE_DPCD_READ;
 	in.u.dpcd_read.port_number = 0xf;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.dpcd_read.dpcd_address = 0xfedcb;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.dpcd_read.num_bytes = U8_MAX;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 
 	in.req_type = DP_REMOTE_DPCD_WRITE;
 	in.u.dpcd_write.port_number = 0xf;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.dpcd_write.dpcd_address = 0xfedcb;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.dpcd_write.num_bytes = ARRAY_SIZE(data);
 	in.u.dpcd_write.bytes = data;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 
 	in.req_type = DP_REMOTE_I2C_READ;
 	in.u.i2c_read.port_number = 0xf;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.i2c_read.read_i2c_device_id = 0x7f;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.i2c_read.num_transactions = 3;
 	in.u.i2c_read.num_bytes_read = ARRAY_SIZE(data) * 3;
 	for (i = 0; i < in.u.i2c_read.num_transactions; i++) {
@@ -244,32 +240,42 @@ int igt_dp_mst_sideband_msg_req_decode(void *unused)
 		in.u.i2c_read.transactions[i].i2c_dev_id = 0x7f & ~i;
 		in.u.i2c_read.transactions[i].i2c_transaction_delay = 0xf & ~i;
 	}
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 
 	in.req_type = DP_REMOTE_I2C_WRITE;
 	in.u.i2c_write.port_number = 0xf;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.i2c_write.write_i2c_device_id = 0x7f;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.i2c_write.num_bytes = ARRAY_SIZE(data);
 	in.u.i2c_write.bytes = data;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 
 	in.req_type = DP_QUERY_STREAM_ENC_STATUS;
 	in.u.enc_status.stream_id = 1;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	get_random_bytes(in.u.enc_status.client_id,
 			 sizeof(in.u.enc_status.client_id));
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.enc_status.stream_event = 3;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.enc_status.valid_stream_event = 0;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.enc_status.stream_behavior = 3;
-	DO_TEST();
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 	in.u.enc_status.valid_stream_behavior = 1;
-	DO_TEST();
-
-#undef DO_TEST
-	return 0;
+	KUNIT_EXPECT_TRUE(test, sideband_msg_req_encode_decode(&in));
 }
+
+static struct kunit_case drm_dp_mst_helper_tests[] = {
+	KUNIT_CASE(igt_dp_mst_calc_pbn_mode),
+	KUNIT_CASE(igt_dp_mst_sideband_msg_req_decode),
+	{ }
+};
+
+static struct kunit_suite drm_dp_mst_helper_test_suite = {
+	.name = "drm_dp_mst_helper_tests",
+	.test_cases = drm_dp_mst_helper_tests,
+};
+
+kunit_test_suite(drm_dp_mst_helper_test_suite);
-- 
2.36.1

