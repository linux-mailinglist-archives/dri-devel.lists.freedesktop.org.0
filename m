Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF7ACE1CC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 17:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517C110E749;
	Wed,  4 Jun 2025 15:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gRHUZyll";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xrlyqeoj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gRHUZyll";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xrlyqeoj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DB010E749
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 15:52:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A1B020787;
 Wed,  4 Jun 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749052359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvedNb5KaLhFpseSojymSwCXp98WXNnwYmNAp9Tppa8=;
 b=gRHUZyllg/dJqiRU1Fulx1kz+Fg4ABNm4Rm6pxlemaaZfEvx6JdX16Mk9PlBev8agIBIrY
 +Ci2cmLS55wadY79+qlA7aRIuZ2wAXBC4+BnMWBkqH9vCQm+GatMJs6FLAVayMdIXfb8IS
 tA9dBWltZAqjPkhDmSFXBFaCToj5Ozg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749052359;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvedNb5KaLhFpseSojymSwCXp98WXNnwYmNAp9Tppa8=;
 b=xrlyqeojc8ZZI8/3WA5J16zUZN0uCHuy0QIbVpnKOjprg37wLpdHqegrHWzQ7Z/KkWUp1m
 7s7wazK5QehwGTDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gRHUZyll;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xrlyqeoj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749052359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvedNb5KaLhFpseSojymSwCXp98WXNnwYmNAp9Tppa8=;
 b=gRHUZyllg/dJqiRU1Fulx1kz+Fg4ABNm4Rm6pxlemaaZfEvx6JdX16Mk9PlBev8agIBIrY
 +Ci2cmLS55wadY79+qlA7aRIuZ2wAXBC4+BnMWBkqH9vCQm+GatMJs6FLAVayMdIXfb8IS
 tA9dBWltZAqjPkhDmSFXBFaCToj5Ozg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749052359;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvedNb5KaLhFpseSojymSwCXp98WXNnwYmNAp9Tppa8=;
 b=xrlyqeojc8ZZI8/3WA5J16zUZN0uCHuy0QIbVpnKOjprg37wLpdHqegrHWzQ7Z/KkWUp1m
 7s7wazK5QehwGTDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 801EB13A63;
 Wed,  4 Jun 2025 15:52:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aJ/4HcZrQGgkGAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Jun 2025 15:52:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arthurgrillo@riseup.net, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/tests: Test drm_fb_build_fourcc_list() in separate
 test suite
Date: Wed,  4 Jun 2025 17:45:43 +0200
Message-ID: <20250604154844.28995-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604154844.28995-1-tzimmermann@suse.de>
References: <20250604154844.28995-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.43 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_SPAM_SHORT(1.38)[0.461];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[riseup.net,gmail.com,redhat.com,linux.intel.com,kernel.org]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 0A1B020787
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.43
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

Only sysfb drivers use drm_fb_build_fourcc_list(). The helper will
be moved from format helpers to sysfb helpers. Moving the related
tests to their own test suite.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tests/Makefile                |   3 +-
 .../gpu/drm/tests/drm_format_helper_test.c    | 142 ---------------
 drivers/gpu/drm/tests/drm_sysfb_helper_test.c | 166 ++++++++++++++++++
 3 files changed, 168 insertions(+), 143 deletions(-)
 create mode 100644 drivers/gpu/drm/tests/drm_sysfb_helper_test.c

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 3afd6587df08..a3ad1f0879cc 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
-	drm_rect_test.o
+	drm_rect_test.o \
+	drm_sysfb_helper_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 8aacc1ffa93a..ef1cc3b28f1b 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1335,147 +1335,6 @@ static void drm_test_fb_clip_offset(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, offset, params->expected_offset);
 }
 
-struct fb_build_fourcc_list_case {
-	const char *name;
-	u32 native_fourccs[TEST_BUF_SIZE];
-	size_t native_fourccs_size;
-	u32 expected[TEST_BUF_SIZE];
-	size_t expected_fourccs_size;
-};
-
-static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
-	{
-		.name = "no native formats",
-		.native_fourccs = { },
-		.native_fourccs_size = 0,
-		.expected = { DRM_FORMAT_XRGB8888 },
-		.expected_fourccs_size = 1,
-	},
-	{
-		.name = "XRGB8888 as native format",
-		.native_fourccs = { DRM_FORMAT_XRGB8888 },
-		.native_fourccs_size = 1,
-		.expected = { DRM_FORMAT_XRGB8888 },
-		.expected_fourccs_size = 1,
-	},
-	{
-		.name = "remove duplicates",
-		.native_fourccs = {
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_RGB565,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_RGB565,
-			DRM_FORMAT_RGB565,
-			DRM_FORMAT_XRGB8888,
-		},
-		.native_fourccs_size = 11,
-		.expected = {
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_RGB888,
-			DRM_FORMAT_RGB565,
-		},
-		.expected_fourccs_size = 3,
-	},
-	{
-		.name = "convert alpha formats",
-		.native_fourccs = {
-			DRM_FORMAT_ARGB1555,
-			DRM_FORMAT_ABGR1555,
-			DRM_FORMAT_RGBA5551,
-			DRM_FORMAT_BGRA5551,
-			DRM_FORMAT_ARGB8888,
-			DRM_FORMAT_ABGR8888,
-			DRM_FORMAT_RGBA8888,
-			DRM_FORMAT_BGRA8888,
-			DRM_FORMAT_ARGB2101010,
-			DRM_FORMAT_ABGR2101010,
-			DRM_FORMAT_RGBA1010102,
-			DRM_FORMAT_BGRA1010102,
-		},
-		.native_fourccs_size = 12,
-		.expected = {
-			DRM_FORMAT_XRGB1555,
-			DRM_FORMAT_XBGR1555,
-			DRM_FORMAT_RGBX5551,
-			DRM_FORMAT_BGRX5551,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_XBGR8888,
-			DRM_FORMAT_RGBX8888,
-			DRM_FORMAT_BGRX8888,
-			DRM_FORMAT_XRGB2101010,
-			DRM_FORMAT_XBGR2101010,
-			DRM_FORMAT_RGBX1010102,
-			DRM_FORMAT_BGRX1010102,
-		},
-		.expected_fourccs_size = 12,
-	},
-	{
-		.name = "random formats",
-		.native_fourccs = {
-			DRM_FORMAT_Y212,
-			DRM_FORMAT_ARGB1555,
-			DRM_FORMAT_ABGR16161616F,
-			DRM_FORMAT_C8,
-			DRM_FORMAT_BGR888,
-			DRM_FORMAT_XRGB1555,
-			DRM_FORMAT_RGBA5551,
-			DRM_FORMAT_BGR565_A8,
-			DRM_FORMAT_R10,
-			DRM_FORMAT_XYUV8888,
-		},
-		.native_fourccs_size = 10,
-		.expected = {
-			DRM_FORMAT_Y212,
-			DRM_FORMAT_XRGB1555,
-			DRM_FORMAT_ABGR16161616F,
-			DRM_FORMAT_C8,
-			DRM_FORMAT_BGR888,
-			DRM_FORMAT_RGBX5551,
-			DRM_FORMAT_BGR565_A8,
-			DRM_FORMAT_R10,
-			DRM_FORMAT_XYUV8888,
-			DRM_FORMAT_XRGB8888,
-		},
-		.expected_fourccs_size = 10,
-	},
-};
-
-static void fb_build_fourcc_list_case_desc(struct fb_build_fourcc_list_case *t, char *desc)
-{
-	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
-}
-
-KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fourcc_list_case_desc);
-
-static void drm_test_fb_build_fourcc_list(struct kunit *test)
-{
-	const struct fb_build_fourcc_list_case *params = test->param_value;
-	u32 fourccs_out[TEST_BUF_SIZE] = {0};
-	size_t nfourccs_out;
-	struct drm_device *drm;
-	struct device *dev;
-
-	dev = drm_kunit_helper_alloc_device(test);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
-
-	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
-
-	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
-						params->native_fourccs_size,
-						fourccs_out, TEST_BUF_SIZE);
-
-	KUNIT_EXPECT_EQ(test, nfourccs_out, params->expected_fourccs_size);
-	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
-}
-
 struct fb_memcpy_case {
 	const char *name;
 	u32 format;
@@ -1864,7 +1723,6 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xbgr8888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_abgr8888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
-	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_memcpy, fb_memcpy_gen_params),
 	{}
 };
diff --git a/drivers/gpu/drm/tests/drm_sysfb_helper_test.c b/drivers/gpu/drm/tests/drm_sysfb_helper_test.c
new file mode 100644
index 000000000000..88a4bf28c745
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_sysfb_helper_test.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_kunit_helpers.h>
+
+#define TEST_BUF_SIZE 50
+
+struct fb_build_fourcc_list_case {
+	const char *name;
+	u32 native_fourccs[TEST_BUF_SIZE];
+	size_t native_fourccs_size;
+	u32 expected[TEST_BUF_SIZE];
+	size_t expected_fourccs_size;
+};
+
+static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
+	{
+		.name = "no native formats",
+		.native_fourccs = { },
+		.native_fourccs_size = 0,
+		.expected = { DRM_FORMAT_XRGB8888 },
+		.expected_fourccs_size = 1,
+	},
+	{
+		.name = "XRGB8888 as native format",
+		.native_fourccs = { DRM_FORMAT_XRGB8888 },
+		.native_fourccs_size = 1,
+		.expected = { DRM_FORMAT_XRGB8888 },
+		.expected_fourccs_size = 1,
+	},
+	{
+		.name = "remove duplicates",
+		.native_fourccs = {
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB565,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB565,
+			DRM_FORMAT_RGB565,
+			DRM_FORMAT_XRGB8888,
+		},
+		.native_fourccs_size = 11,
+		.expected = {
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_RGB888,
+			DRM_FORMAT_RGB565,
+		},
+		.expected_fourccs_size = 3,
+	},
+	{
+		.name = "convert alpha formats",
+		.native_fourccs = {
+			DRM_FORMAT_ARGB1555,
+			DRM_FORMAT_ABGR1555,
+			DRM_FORMAT_RGBA5551,
+			DRM_FORMAT_BGRA5551,
+			DRM_FORMAT_ARGB8888,
+			DRM_FORMAT_ABGR8888,
+			DRM_FORMAT_RGBA8888,
+			DRM_FORMAT_BGRA8888,
+			DRM_FORMAT_ARGB2101010,
+			DRM_FORMAT_ABGR2101010,
+			DRM_FORMAT_RGBA1010102,
+			DRM_FORMAT_BGRA1010102,
+		},
+		.native_fourccs_size = 12,
+		.expected = {
+			DRM_FORMAT_XRGB1555,
+			DRM_FORMAT_XBGR1555,
+			DRM_FORMAT_RGBX5551,
+			DRM_FORMAT_BGRX5551,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_XBGR8888,
+			DRM_FORMAT_RGBX8888,
+			DRM_FORMAT_BGRX8888,
+			DRM_FORMAT_XRGB2101010,
+			DRM_FORMAT_XBGR2101010,
+			DRM_FORMAT_RGBX1010102,
+			DRM_FORMAT_BGRX1010102,
+		},
+		.expected_fourccs_size = 12,
+	},
+	{
+		.name = "random formats",
+		.native_fourccs = {
+			DRM_FORMAT_Y212,
+			DRM_FORMAT_ARGB1555,
+			DRM_FORMAT_ABGR16161616F,
+			DRM_FORMAT_C8,
+			DRM_FORMAT_BGR888,
+			DRM_FORMAT_XRGB1555,
+			DRM_FORMAT_RGBA5551,
+			DRM_FORMAT_BGR565_A8,
+			DRM_FORMAT_R10,
+			DRM_FORMAT_XYUV8888,
+		},
+		.native_fourccs_size = 10,
+		.expected = {
+			DRM_FORMAT_Y212,
+			DRM_FORMAT_XRGB1555,
+			DRM_FORMAT_ABGR16161616F,
+			DRM_FORMAT_C8,
+			DRM_FORMAT_BGR888,
+			DRM_FORMAT_RGBX5551,
+			DRM_FORMAT_BGR565_A8,
+			DRM_FORMAT_R10,
+			DRM_FORMAT_XYUV8888,
+			DRM_FORMAT_XRGB8888,
+		},
+		.expected_fourccs_size = 10,
+	},
+};
+
+static void fb_build_fourcc_list_case_desc(struct fb_build_fourcc_list_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fourcc_list_case_desc);
+
+static void drm_test_fb_build_fourcc_list(struct kunit *test)
+{
+	const struct fb_build_fourcc_list_case *params = test->param_value;
+	u32 fourccs_out[TEST_BUF_SIZE] = {0};
+	size_t nfourccs_out;
+	struct drm_device *drm;
+	struct device *dev;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+
+	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
+						params->native_fourccs_size,
+						fourccs_out, TEST_BUF_SIZE);
+
+	KUNIT_EXPECT_EQ(test, nfourccs_out, params->expected_fourccs_size);
+	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
+}
+
+static struct kunit_case drm_sysfb_helper_test_cases[] = {
+	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
+	{}
+};
+
+static struct kunit_suite drm_sysfb_helper_test_suite = {
+	.name = "drm_sysfb_helper_test",
+	.test_cases = drm_sysfb_helper_test_cases,
+};
+
+kunit_test_suite(drm_sysfb_helper_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for the drm_sysfb_helper APIs");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("José Expósito <jose.exposito89@gmail.com>");
-- 
2.49.0

