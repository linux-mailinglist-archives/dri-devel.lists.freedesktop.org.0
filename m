Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C7D5A3EA1
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 18:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0711110EE92;
	Sun, 28 Aug 2022 16:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E898810EEC0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 16:45:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c7so824057wrp.11
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=T5aRwr6pqcsQk7PMMmsjKOURSAFgkEiep7tVEjgOEu8=;
 b=eMVxp40D8zIPnnJMVchQvjuBddHTX1y2JuTilTMpaHdYOA3XVTrIWrxlutKoh5Nnuz
 aKR4a/L3hZGTg+L7entXUOpqVn8ZqYYSHIxRgrubT0r10RqyTRyF1HuFeQSVwqZLjxaQ
 8+EvGwx+RxWdNbrXTLipQ8kNEUiFeIg7Bp514To1u9GAxH2v9v5jqZ4PYMD7TW1N5V5A
 EvfFeD3dWFN2c5+OF+BY+osUyL7oh6/c2dCBx724bE38b3IrzlagAPlnIhKXAHqQ6QNI
 kfTKrBAqOVr+nbulqjGoYep5kW+hPrqa3K8omCdGojVz7II+/B1ovpVktKLGStfFESER
 JkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=T5aRwr6pqcsQk7PMMmsjKOURSAFgkEiep7tVEjgOEu8=;
 b=Q+JXhFwSem/02tSeC9YCFLbIm/uFU1NhCewSNR0Uoz9QUZRCw9H4z7nnZdkTDCgezf
 Eo+6YoWyy0QJ9E7NN5xNkEQlmNGS4psuIvYe3hkiE2TcseqN28PS7Qtvzjc8BNqaHoi5
 efkQjrObsSeI9vWtJ7LGiVtuP4Bn8DKfaNEmaO5u6NuD1sAf2FvMF+0FJDKAx24W6nJV
 uRQkmDULEgBEBY7zWOfci60NmJ+Gq2yHIDSn8sjrr6de70NWjm5ellDji3c5NuYqfn88
 eEh5pBmr/B1aKmgPohVjwdyZLw5lKq542IUJKoEUkHK0cAZtlAsTV3pycO+oZOrS/sSz
 r/1A==
X-Gm-Message-State: ACgBeo3xynKLonhBK/Z35VHTFApQh8p4DGpaIay+DYg33T56hW0oDXeG
 YJSB40gYQ0HhzWPtIrYZ2tI=
X-Google-Smtp-Source: AA6agR7V+NPsMLy1J0fh4fleBXVJLxyvQiVED33xvrwNFZhd+KyuovF8/BugiqKciBpAajCx3/Uc/g==
X-Received: by 2002:a05:6000:702:b0:225:4a84:89ea with SMTP id
 bs2-20020a056000070200b002254a8489eamr4708496wrb.194.1661705137422; 
 Sun, 28 Aug 2022 09:45:37 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 e14-20020adfef0e000000b0021d6924b777sm399926wro.115.2022.08.28.09.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 09:45:37 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 3/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_gray8()
Date: Sun, 28 Aug 2022 18:45:17 +0200
Message-Id: <20220828164517.185092-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220828164517.185092-1-jose.exposito89@gmail.com>
References: <20220828164517.185092-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>, geert@linux-m68k.org,
 tales.aparecida@gmail.com, davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the existing test cases to test the conversion from XRGB8888 to
grayscale.

Tested-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index d8536db4de1e..2f548aa51a30 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -37,6 +37,11 @@ struct convert_to_xrgb2101010_result {
 	const u32 expected[TEST_BUF_SIZE];
 };
 
+struct convert_to_gray8_result {
+	unsigned int dst_pitch;
+	const u8 expected[TEST_BUF_SIZE];
+};
+
 struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
@@ -46,6 +51,7 @@ struct convert_xrgb8888_case {
 	struct convert_to_rgb565_result rgb565_result;
 	struct convert_to_rgb888_result rgb888_result;
 	struct convert_to_xrgb2101010_result xrgb2101010_result;
+	struct convert_to_gray8_result gray8_result;
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
@@ -71,6 +77,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0x3FF00000 },
 		},
+		.gray8_result = {
+			.dst_pitch = 0,
+			.expected = { 0x4C },
+		},
 	},
 	{
 		.name = "single_pixel_clip_rectangle",
@@ -97,6 +107,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0x3FF00000 },
 		},
+		.gray8_result = {
+			.dst_pitch = 0,
+			.expected = { 0x4C },
+		},
 	},
 	{
 		/* Well known colors: White, black, red, green, blue, magenta,
@@ -155,6 +169,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x3FFFFC00, 0x000FFFFF,
 			},
 		},
+		.gray8_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0xFF, 0x00,
+				0x4C, 0x99,
+				0x19, 0x66,
+				0xE5, 0xB2,
+			},
+		},
 	},
 	{
 		/* Randomly picked colors. Full buffer within the clip area. */
@@ -206,6 +229,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x2A20300C, 0x1B1705CD, 0x03844672, 0x00000000, 0x00000000,
 			},
 		},
+		.gray8_result = {
+			.dst_pitch = 5,
+			.expected = {
+				0x3C, 0x33, 0x34, 0x00, 0x00,
+				0x6F, 0x3C, 0x33, 0x00, 0x00,
+				0x34, 0x6F, 0x3C, 0x00, 0x00,
+			},
+		},
 	},
 };
 
@@ -381,11 +412,42 @@ static void xrgb8888_to_xrgb2101010_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 }
 
+static void xrgb8888_to_gray8_test(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_gray8_result *result = &params->gray8_result;
+	size_t dst_size;
+	__u8 *buf = NULL;
+	__u32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_R8, result->dst_pitch,
+				       &params->clip);
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	drm_fb_xrgb8888_to_gray8(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+}
+
 static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb565_test, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(xrgb8888_to_rgb888_test, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(xrgb8888_to_xrgb2101010_test, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(xrgb8888_to_gray8_test, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.25.1

