Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B58A55BB03
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 18:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC50510ED70;
	Mon, 27 Jun 2022 16:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB91C10E675
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:13:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id f190so5453107wma.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XYw7CGFO//CItwO+VZ/QzzGgwBzkgCzOgnZsxxYoTY4=;
 b=AP8G17ouwX9ay9Nsklm0TKFMzxwv/NWaVziOluPLmZmnWmq03RlfjWfSxM4UQ1GMN5
 U5vTf22WStIu22sjeRwc9g+ixi0h4/mXIPo+l9qTyT+Oc7M/30OSU3I3JXJw7kEWIDhD
 RXMwPqnmRCEj8vK5iOJB/LkRl+Bq6gDTMKt4JQAFS+erDyP2268MyPD2N5ydzDKli0xO
 g9om5V+4vfKqDYHURINaY1jMLBOtbAesc1f86f81qyOcdp/wVbjSIRbzuhpwq7W8sD8m
 b9N7+VZAkfIaGnJthH9lrfhhmfncxx+yQvC2BGsGC8g9cBegS8WF4+tZbyhPTqXRY3NL
 Adeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XYw7CGFO//CItwO+VZ/QzzGgwBzkgCzOgnZsxxYoTY4=;
 b=0xzSP1/UHY7p3KsN3VAl7pAVJ8IImfxkP2T+zCh/Y80h2ieVy8eVjPEqt127m84e0l
 UawgA9VvyZP0JgBI3IVyXR65zYd8L6vB60+CxsjYoR+yjjTux0JVpN5i/1EXLe4kTamw
 vQQUczaSIIxjR5oBm8TurzDySQpCvZa8OB6LuJxV2qZgDZHL1hmu7xQyyc5D5rIo8yRl
 rtsjuVfe2KQ+xyXzIStS6g4j12atXkoPREFGPJ/PjFCL6mXMlfGdbr7US3I66zG99kJU
 pN8SdxCx/CyMZdYs39ygLt1fbrNgNt9Mn1YI7m0uJI69oSBJnXGHTqdxaHAbBmDObWkx
 cfFA==
X-Gm-Message-State: AJIora+UsGnsu5S5+1twnye6Q43z2GT9P/QMJtaSlfFeRCtIBMAEOags
 bYHkEO497AbofqA0Eh/fATZx9ntBMkQZHQ==
X-Google-Smtp-Source: AGRyM1vVUM1sq3THYxF0+f/5T7IB/yfC/bim5nxm8lDQImUcWMPfgAI5TeGngQaDoMUY2LCxuGReIA==
X-Received: by 2002:a1c:7414:0:b0:3a0:201c:5b7f with SMTP id
 p20-20020a1c7414000000b003a0201c5b7fmr21074157wmc.170.1656346389529; 
 Mon, 27 Jun 2022 09:13:09 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b0021b9504cc83sm10883600wrs.31.2022.06.27.09.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 09:13:09 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH 4/4] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb565()
Date: Mon, 27 Jun 2022 18:11:32 +0200
Message-Id: <20220627161132.33256-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627161132.33256-1-jose.exposito89@gmail.com>
References: <20220627161132.33256-1-jose.exposito89@gmail.com>
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
 dlatypov@google.com, linux-kernel@vger.kernel.org, tales.aparecida@gmail.com,
 davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the existing test cases to test the conversion from XRGB8888 to
RGB565.

The documentation and the color picker available on [1] are useful
resources to understand this patch and validate the values returned by
the conversion function.

[1] http://www.barth-dev.de/online/rgb565-color-picker/

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 100 +++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 52dc41cc7c60..3fbe8026bccc 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -48,7 +48,7 @@ struct convert_xrgb8888_case {
 	unsigned int pitch;
 	struct drm_rect clip;
 	const u32 xrgb8888[TEST_BUF_SIZE];
-	struct convert_xrgb8888_result results[1];
+	struct convert_xrgb8888_result results[3];
 };
 
 static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
@@ -64,6 +64,26 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				.dst_pitch = 0,
 				.expected = { 0xE0 },
 			},
+			{
+				.dst_format = DRM_FORMAT_RGB565,
+				.has_swab = true,
+				.conv_swab = {
+					.func = drm_fb_xrgb8888_to_rgb565,
+					.swab = false,
+				},
+				.dst_pitch = 0,
+				.expected = { 0x00, 0xF8 },
+			},
+			{
+				.dst_format = DRM_FORMAT_RGB565,
+				.has_swab = true,
+				.conv_swab = {
+					.func = drm_fb_xrgb8888_to_rgb565,
+					.swab = true,
+				},
+				.dst_pitch = 0,
+				.expected = { 0xF8, 0x00 },
+			},
 		},
 	},
 	{
@@ -81,6 +101,26 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				.dst_pitch = 0,
 				.expected = { 0xE0 },
 			},
+			{
+				.dst_format = DRM_FORMAT_RGB565,
+				.has_swab = true,
+				.conv_swab = {
+					.func = drm_fb_xrgb8888_to_rgb565,
+					.swab = false,
+				},
+				.dst_pitch = 0,
+				.expected = { 0x00, 0xF8 },
+			},
+			{
+				.dst_format = DRM_FORMAT_RGB565,
+				.has_swab = true,
+				.conv_swab = {
+					.func = drm_fb_xrgb8888_to_rgb565,
+					.swab = true,
+				},
+				.dst_pitch = 0,
+				.expected = { 0xF8, 0x00 },
+			},
 		},
 	},
 	{
@@ -110,6 +150,36 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 					0xFC, 0x1F,
 				},
 			},
+			{
+				.dst_format = DRM_FORMAT_RGB565,
+				.has_swab = true,
+				.conv_swab = {
+					.func = drm_fb_xrgb8888_to_rgb565,
+					.swab = false,
+				},
+				.dst_pitch = 0,
+				.expected = {
+					0xFF, 0xFF, 0x00, 0x00,
+					0x00, 0xF8, 0xE0, 0x07,
+					0x1F, 0x00, 0x1F, 0xF8,
+					0xE0, 0xFF, 0xFF, 0x07,
+				},
+			},
+			{
+				.dst_format = DRM_FORMAT_RGB565,
+				.has_swab = true,
+				.conv_swab = {
+					.func = drm_fb_xrgb8888_to_rgb565,
+					.swab = true,
+				},
+				.dst_pitch = 0,
+				.expected = {
+					0xFF, 0xFF, 0x00, 0x00,
+					0xF8, 0x00, 0x07, 0xE0,
+					0x00, 0x1F, 0xF8, 0x1F,
+					0xFF, 0xE0, 0x07, 0xFF,
+				},
+			},
 		},
 	},
 	{
@@ -133,6 +203,34 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 					0xA0, 0x6D, 0x0A, 0x00, 0x00,
 				},
 			},
+			{
+				.dst_format = DRM_FORMAT_RGB565,
+				.has_swab = true,
+				.conv_swab = {
+					.func = drm_fb_xrgb8888_to_rgb565,
+					.swab = false,
+				},
+				.dst_pitch = 10,
+				.expected = {
+					0x33, 0x0A, 0x60, 0x12, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00,
+					0x8E, 0x6B, 0x33, 0x0A, 0x60, 0x12, 0x00, 0x00, 0x00, 0x00,
+					0x00, 0xA8, 0x8E, 0x6B, 0x33, 0x0A, 0x00, 0x00, 0x00, 0x00,
+				},
+			},
+			{
+				.dst_format = DRM_FORMAT_RGB565,
+				.has_swab = true,
+				.conv_swab = {
+					.func = drm_fb_xrgb8888_to_rgb565,
+					.swab = true,
+				},
+				.dst_pitch = 10,
+				.expected = {
+					0x0A, 0x33, 0x12, 0x60, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00,
+					0x6B, 0x8E, 0x0A, 0x33, 0x12, 0x60, 0x00, 0x00, 0x00, 0x00,
+					0xA8, 0x00, 0x6B, 0x8E, 0x0A, 0x33, 0x00, 0x00, 0x00, 0x00,
+				},
+			},
 		},
 	},
 };
-- 
2.25.1

