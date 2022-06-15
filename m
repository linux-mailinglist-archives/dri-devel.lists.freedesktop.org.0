Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55B54CA85
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 15:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8057C10F37D;
	Wed, 15 Jun 2022 13:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A31D10F37D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:59:22 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id u9so10270933oiv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jHVTFEOci2eUcOzV7CwWvOhg3Cpxw3vHk3+96vsZXxo=;
 b=IR7FwiFA1rCw871OC2hQHeFDOFH01zdqRCRX3/RXa/OKvIg4x2mw4Ibon8PTcTfAKe
 dgYoswkLEP3FO9yusY0L51q3BEOnFQOtfGdt3OVVyicolH79ulaghXq6W6V8HMHOgnHw
 3YSj+fNUdA04j8avJadPhF9/j9D5GP8k/p9XS907YgA5j6VtXFkkoW9eyIy6v3+1CYN0
 dl2QYqw+5BFXT5T/+xgEkB7v98NJcI7cbGcVFuyuxAR07eixvexLjtF9rOL9nLVBM4dm
 9Hq5UKt85GaZs3Hd6FGTkdc34XuQZuqv8SLmxprHBWiA6hIwh66vciBlz1SCyCdK8oEg
 OETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jHVTFEOci2eUcOzV7CwWvOhg3Cpxw3vHk3+96vsZXxo=;
 b=STtL9eUoDai6dLNjv0QmN7uUTTBbOfvcS/nd2EPnhWacD55GsVRyIjMFCGaBg6iDU0
 4644lKdWl9T4GX+QT5xNV2bMCy59O0EXaPGDaMUFqPaOMhhlW8edDRw9FEOP2CLPZ+OX
 iMekMvU6FnggDWhtKV7ZHmzut1VP7AF+1ReTeENJvhiASUmWuGwXqvHrvb6ZuMmkOnCb
 7A2hmJRYsfv64VtNjWxGkQP9sU5QKLGGnctMN9Y70+X3V2yTrXt09+KLagHByYCbz34H
 bcHhPWh1mRyitGNOUp4KO6N5FlVTtwxz8OAU3UH9OlgypV5v20ksNm7P6ezxPQUljlcN
 Zmrg==
X-Gm-Message-State: AOAM532pgNbFK+qed2cJHK7FtOe/ctQMZvGtLUoma26DXqjmrSHhGWaG
 GufDQaNurSfq6mqYXrvNfFpVAw==
X-Google-Smtp-Source: ABdhPJzG33LzogZqsHGVkIrQH0d7tkBu5KbKN7A7zkS3u0ftNovgDjRpli1apWqpuOySL+69snuxtA==
X-Received: by 2002:aca:da85:0:b0:32e:b063:2451 with SMTP id
 r127-20020acada85000000b0032eb0632451mr4637363oig.159.1655301561367; 
 Wed, 15 Jun 2022 06:59:21 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056830248700b0060bfebb96e5sm6056928ots.35.2022.06.15.06.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 06:59:20 -0700 (PDT)
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
Subject: [PATCH 02/10] drm: selftest: refactor drm_cmdline_parser
Date: Wed, 15 Jun 2022 10:58:16 -0300
Message-Id: <20220615135824.15522-3-maira.canal@usp.br>
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
Cc: Arthur Grillo <arthur.grillo@usp.br>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arthur Grillo <arthur.grillo@usp.br>

Refactor the tests by modularizing the functions to avoid code repetition.

Co-developed-by: Maíra Canal <maira.canal@usp.br>
Signed-off-by: Arthur Grillo <arthur.grillo@usp.br>
Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 .../drm/selftests/test-drm_cmdline_parser.c   | 579 +++++-------------
 1 file changed, 156 insertions(+), 423 deletions(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c b/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
index d96cd890def6..57a229c5fc35 100644
--- a/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
+++ b/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2019 Bootlin
+ * Copyright (c) 2021 Ma�ra Canal <maira.canal@usp.br>,
+ * Copyright (c) 2021 Arthur Grillo <arthur.grillo@usp.br>
  */
 
 #define pr_fmt(fmt) "drm_cmdline: " fmt
@@ -17,13 +19,25 @@
 
 static const struct drm_connector no_connector = {};
 
-static int drm_cmdline_test_force_e_only(void *ignored)
+static int drm_cmdline_test_properties(void *ignored,
+		struct drm_cmdline_mode *mode, enum drm_connector_force force)
+{
+	FAIL_ON(mode->rb);
+	FAIL_ON(mode->cvt);
+	FAIL_ON(mode->interlace);
+	FAIL_ON(mode->margins);
+	FAIL_ON(mode->force != force);
+
+	return 0;
+}
+
+static int drm_cmdline_test_force_only(void *ignored, char *cmdline,
+		const struct drm_connector *connector, enum drm_connector_force force)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("e",
-							   &no_connector,
-							   &mode));
+	FAIL_ON(!drm_mode_parse_command_line_for_connector(cmdline,
+							   connector, &mode));
 	FAIL_ON(mode.specified);
 	FAIL_ON(mode.refresh_specified);
 	FAIL_ON(mode.bpp_specified);
@@ -32,95 +46,101 @@ static int drm_cmdline_test_force_e_only(void *ignored)
 	FAIL_ON(mode.cvt);
 	FAIL_ON(mode.interlace);
 	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	FAIL_ON(mode.force != force);
 
 	return 0;
 }
 
-static int drm_cmdline_test_force_D_only_not_digital(void *ignored)
+static int drm_cmdline_test_freestanding(void *ignored,
+		struct drm_cmdline_mode *mode, char *cmdline,
+		const struct drm_connector *connector)
 {
-	struct drm_cmdline_mode mode = { };
+	FAIL_ON(!drm_mode_parse_command_line_for_connector(cmdline,
+							   connector, mode));
+	FAIL_ON(mode->specified);
+	FAIL_ON(mode->refresh_specified);
+	FAIL_ON(mode->bpp_specified);
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("D",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
+	FAIL_ON(mode->tv_margins.right != 14);
+	FAIL_ON(mode->tv_margins.left != 24);
+	FAIL_ON(mode->tv_margins.bottom != 36);
+	FAIL_ON(mode->tv_margins.top != 42);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	return 0;
+}
+
+static int drm_cmdline_test_res_init(void *ignored,
+		struct drm_cmdline_mode *mode, char *cmdline)
+{
+	FAIL_ON(!drm_mode_parse_command_line_for_connector(cmdline,
+							   &no_connector, mode));
+	FAIL_ON(!mode->specified);
+	FAIL_ON(mode->xres != 720);
+	FAIL_ON(mode->yres != 480);
+
+	return 0;
+}
+
+static int drm_cmdline_test_res_bpp_init(void *ignored,
+		struct drm_cmdline_mode *mode, char *cmdline)
+{
+	FAIL_ON(!drm_mode_parse_command_line_for_connector(cmdline,
+							   &no_connector, mode));
+	FAIL_ON(!mode->specified);
+	FAIL_ON(mode->xres != 720);
+	FAIL_ON(mode->yres != 480);
+
+	FAIL_ON(!mode->refresh_specified);
+	FAIL_ON(mode->refresh != 60);
+	FAIL_ON(!mode->bpp_specified);
+	FAIL_ON(mode->bpp != 24);
+
+	return 0;
+}
+
+static int drm_cmdline_test_force_e_only(void *ignored)
+{
+	drm_cmdline_test_force_only(ignored, "e", &no_connector, DRM_FORCE_ON);
+
+	return 0;
+}
+
+static int drm_cmdline_test_force_D_only_not_digital(void *ignored)
+{
+	drm_cmdline_test_force_only(ignored, "D", &no_connector, DRM_FORCE_ON);
 
 	return 0;
 }
 
 static const struct drm_connector connector_hdmi = {
 	.connector_type	= DRM_MODE_CONNECTOR_HDMIB,
+
 };
 
 static int drm_cmdline_test_force_D_only_hdmi(void *ignored)
 {
-	struct drm_cmdline_mode mode = { };
-
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("D",
-							   &connector_hdmi,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON_DIGITAL);
+	drm_cmdline_test_force_only(ignored, "D", &connector_hdmi,
+			DRM_FORCE_ON_DIGITAL);
 
 	return 0;
 }
 
 static const struct drm_connector connector_dvi = {
 	.connector_type	= DRM_MODE_CONNECTOR_DVII,
+
 };
 
 static int drm_cmdline_test_force_D_only_dvi(void *ignored)
 {
-	struct drm_cmdline_mode mode = { };
-
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("D",
-							   &connector_dvi,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON_DIGITAL);
+	drm_cmdline_test_force_only(ignored, "D", &connector_dvi,
+			DRM_FORCE_ON_DIGITAL);
 
 	return 0;
 }
 
 static int drm_cmdline_test_force_d_only(void *ignored)
 {
-	struct drm_cmdline_mode mode = { };
-
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("d",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_OFF);
+	drm_cmdline_test_force_only(ignored, "d", &no_connector, DRM_FORCE_OFF);
 
 	return 0;
 }
@@ -151,15 +171,9 @@ static int drm_cmdline_test_res(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(mode.rb);
@@ -219,15 +233,9 @@ static int drm_cmdline_test_res_vesa(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480M",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480M");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(mode.rb);
@@ -243,15 +251,9 @@ static int drm_cmdline_test_res_vesa_rblank(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480MR",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480MR");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(!mode.rb);
@@ -267,15 +269,9 @@ static int drm_cmdline_test_res_rblank(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480R",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480R");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(!mode.rb);
@@ -291,23 +287,13 @@ static int drm_cmdline_test_res_bpp(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480-24");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(!mode.bpp_specified);
 	FAIL_ON(mode.bpp != 24);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -327,23 +313,13 @@ static int drm_cmdline_test_res_refresh(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480@60",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480@60");
 
 	FAIL_ON(!mode.refresh_specified);
 	FAIL_ON(mode.refresh != 60);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -363,24 +339,8 @@ static int drm_cmdline_test_res_bpp_refresh(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60");
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -389,18 +349,7 @@ static int drm_cmdline_test_res_bpp_refresh_interlaced(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60i",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60i");
 
 	FAIL_ON(mode.rb);
 	FAIL_ON(mode.cvt);
@@ -415,18 +364,7 @@ static int drm_cmdline_test_res_bpp_refresh_margins(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60m",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60m");
 
 	FAIL_ON(mode.rb);
 	FAIL_ON(mode.cvt);
@@ -441,24 +379,8 @@ static int drm_cmdline_test_res_bpp_refresh_force_off(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60d",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_OFF);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60d");
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_OFF);
 
 	return 0;
 }
@@ -478,24 +400,8 @@ static int drm_cmdline_test_res_bpp_refresh_force_on(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60e",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60e");
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON);
 
 	return 0;
 }
@@ -504,24 +410,8 @@ static int drm_cmdline_test_res_bpp_refresh_force_on_analog(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60D",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60D");
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON);
 
 	return 0;
 }
@@ -534,8 +424,7 @@ static int drm_cmdline_test_res_bpp_refresh_force_on_digital(void *ignored)
 	};
 
 	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60D",
-							   &connector,
-							   &mode));
+							   &connector, &mode));
 	FAIL_ON(!mode.specified);
 	FAIL_ON(mode.xres != 720);
 	FAIL_ON(mode.yres != 480);
@@ -546,11 +435,7 @@ static int drm_cmdline_test_res_bpp_refresh_force_on_digital(void *ignored)
 	FAIL_ON(!mode.bpp_specified);
 	FAIL_ON(mode.bpp != 24);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON_DIGITAL);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON_DIGITAL);
 
 	return 0;
 }
@@ -559,18 +444,7 @@ static int drm_cmdline_test_res_bpp_refresh_interlaced_margins_force_on(void *ig
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60ime",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60ime");
 
 	FAIL_ON(mode.rb);
 	FAIL_ON(mode.cvt);
@@ -585,15 +459,9 @@ static int drm_cmdline_test_res_margins_force_on(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480me",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480me");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(mode.rb);
@@ -609,15 +477,9 @@ static int drm_cmdline_test_res_vesa_margins(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480Mm",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480Mm");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(mode.rb);
@@ -673,10 +535,9 @@ static int drm_cmdline_test_name_bpp(void *ignored)
 							   &no_connector,
 							   &mode));
 	FAIL_ON(strcmp(mode.name, "NTSC"));
-
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(!mode.bpp_specified);
+
 	FAIL_ON(mode.bpp != 24);
 
 	return 0;
@@ -760,23 +621,13 @@ static int drm_cmdline_test_rotate_0(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,rotate=0",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_0);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,rotate=0");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_0);
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -785,23 +636,13 @@ static int drm_cmdline_test_rotate_90(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,rotate=90",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_90);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,rotate=90");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_90);
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -810,23 +651,13 @@ static int drm_cmdline_test_rotate_180(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,rotate=180",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,rotate=180");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -835,23 +666,13 @@ static int drm_cmdline_test_rotate_270(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,rotate=270",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_270);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,rotate=270");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_270);
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -860,9 +681,8 @@ static int drm_cmdline_test_rotate_multiple(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(drm_mode_parse_command_line_for_connector("720x480,rotate=0,rotate=90",
-							  &no_connector,
-							  &mode));
+	FAIL_ON(drm_mode_parse_command_line_for_connector(
+				"720x480,rotate=0,rotate=90", &no_connector, &mode));
 
 	return 0;
 }
@@ -871,9 +691,8 @@ static int drm_cmdline_test_rotate_invalid_val(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(drm_mode_parse_command_line_for_connector("720x480,rotate=42",
-							  &no_connector,
-							  &mode));
+	FAIL_ON(drm_mode_parse_command_line_for_connector(
+				"720x480,rotate=42", &no_connector, &mode));
 
 	return 0;
 }
@@ -882,9 +701,8 @@ static int drm_cmdline_test_rotate_truncated(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(drm_mode_parse_command_line_for_connector("720x480,rotate=",
-							  &no_connector,
-							  &mode));
+	FAIL_ON(drm_mode_parse_command_line_for_connector(
+				"720x480,rotate=", &no_connector, &mode));
 
 	return 0;
 }
@@ -893,23 +711,13 @@ static int drm_cmdline_test_hmirror(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,reflect_x",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X));
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,reflect_x");
 
+	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X));
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -918,23 +726,13 @@ static int drm_cmdline_test_vmirror(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,reflect_y",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y));
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,reflect_y");
 
+	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y));
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -943,26 +741,18 @@ static int drm_cmdline_test_margin_options(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode,
+			"720x480,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42");
+
 	FAIL_ON(mode.tv_margins.right != 14);
 	FAIL_ON(mode.tv_margins.left != 24);
 	FAIL_ON(mode.tv_margins.bottom != 36);
 	FAIL_ON(mode.tv_margins.top != 42);
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -971,23 +761,13 @@ static int drm_cmdline_test_multiple_options(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,rotate=270,reflect_x",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X));
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,rotate=270,reflect_x");
 
+	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X));
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -996,9 +776,8 @@ static int drm_cmdline_test_invalid_option(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(drm_mode_parse_command_line_for_connector("720x480,test=42",
-							  &no_connector,
-							  &mode));
+	FAIL_ON(drm_mode_parse_command_line_for_connector(
+				"720x480,test=42", &no_connector, &mode));
 
 	return 0;
 }
@@ -1007,24 +786,14 @@ static int drm_cmdline_test_bpp_extra_and_option(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24e,rotate=180",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480-24e,rotate=180");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(!mode.bpp_specified);
 	FAIL_ON(mode.bpp != 24);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON);
 
 	return 0;
 }
@@ -1033,22 +802,13 @@ static int drm_cmdline_test_extra_and_option(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480e,rotate=180",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480e,rotate=180");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
 	FAIL_ON(mode.refresh_specified);
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON);
 
 	return 0;
 }
@@ -1057,23 +817,11 @@ static int drm_cmdline_test_freestanding_options(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("margin_right=14,margin_left=24,margin_bottom=36,margin_top=42",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
+	drm_cmdline_test_freestanding(ignored, &mode,
+			"margin_right=14,margin_left=24,margin_bottom=36,margin_top=42",
+			&no_connector);
 
-	FAIL_ON(mode.tv_margins.right != 14);
-	FAIL_ON(mode.tv_margins.left != 24);
-	FAIL_ON(mode.tv_margins.bottom != 36);
-	FAIL_ON(mode.tv_margins.top != 42);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -1082,23 +830,11 @@ static int drm_cmdline_test_freestanding_force_e_and_options(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("e,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
+	drm_cmdline_test_freestanding(ignored, &mode,
+			"e,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42",
+			&no_connector);
 
-	FAIL_ON(mode.tv_margins.right != 14);
-	FAIL_ON(mode.tv_margins.left != 24);
-	FAIL_ON(mode.tv_margins.bottom != 36);
-	FAIL_ON(mode.tv_margins.top != 42);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON);
 
 	return 0;
 }
@@ -1107,20 +843,17 @@ static int drm_cmdline_test_panel_orientation(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("panel_orientation=upside_down",
-							   &no_connector,
-							   &mode));
+	FAIL_ON(!drm_mode_parse_command_line_for_connector(
+				"panel_orientation=upside_down", &no_connector, &mode));
+
 	FAIL_ON(mode.specified);
 	FAIL_ON(mode.refresh_specified);
 	FAIL_ON(mode.bpp_specified);
 
+
 	FAIL_ON(mode.panel_orientation != DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
-- 
2.36.1

