Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECEEB20500
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EE810E420;
	Mon, 11 Aug 2025 10:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lR4JFVdB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8592610E419
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:15:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-459ddf8acf1so34917255e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754907340; x=1755512140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=InWEj8yfNZNXn9Ghid4W7lwyxvfYCt3pMVPvqhpg8n4=;
 b=lR4JFVdBaK/IYQ1+NtSAL/zsxS1ItMQ7X65ubvmNwDDWkA7ldbsNSJuIzRh2TPDnvy
 eLIr5cym9tGIcAK6uytrC5vdEf2b8as7LSg5Q9um2v8OkiTcWpbHHck3kTR9uyh8y4M4
 Ew5acEqg9Mkz99v4IzO9zJ/xn3NUbGqNloUmm7pecTFxv4cjLEIP1h69p0M+9clRSag0
 RpJGh9aTkMvHe3QYKPHYEXnDOnyPfhuiph9INxN7wIJL5j/MBGLvP1/Ip9I2XiF+P1tW
 Io2C2QeDo37F6XRQ7dW+H1ymKEDaL4rv4RCnFbahZn7cPrGbDVwHZzLlDb2jdaDhCGwg
 3GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907340; x=1755512140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=InWEj8yfNZNXn9Ghid4W7lwyxvfYCt3pMVPvqhpg8n4=;
 b=fhHTvKwCvKBBO7Rme+tKesCEGEe9WgwWsmMryUG/Hiq2yeW/Ae/3G5BL2Tf4y+6n4T
 5iwE3Wg0e+RB0wiMWJQrYqbU8h5YOzk/wN3oZUybM/4ZTksQIfnQrCC3IyKG6Jvrxu0M
 zb3aAIXnAJaTHD/cRUjSkY0T+uBHwHJlxR+mnO59OrfVb/mMkqVKE3LCis5GV2piRPGs
 fuw4yw+W2JvqydC61sEaJCVqUIajRU4+3BQnM432bWtADyZs9KVvCl+sYNDkMZPy2RIF
 mqsx0lINHi3vIy1hmtaHWoqDFLHqlYDkOxVt59K/Qn1omF2gSR5on2q+7ujLFnObcIhF
 xBsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhBPGBp36KoyfvJOs0+2xAP7lBFnEfeaUw0GehYy5CiMFtLbqUQ6pdkTpoh5uLg1MsuRXTehoGReg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/hNgTD2U4ObF2ikuHjO8V+TI0SnzO8vNECMkz/b8BH7hk1RF3
 P0lR9cVNVwhTpoIxZjR5P5fLnbHiHTC3lfAxG7IijalpodeCNepWyAPt
X-Gm-Gg: ASbGnctb09Y340zq5f61r8eK1NKP/v0b6P1dle1rdZDsgoe1F+vW6gAl8MdsKy/PPMu
 1OGXDk+4QeCvs7zM+f9ANqs8PXDzUoymueq4IG2mpr414Bgzy5qHkevCuCl4YabJqkb5y0Pzrrr
 SEG6BiwOODQRnNVHeRFjATjM3K6bobcn1BqO81VwarASQ2kLYwrCTN/RGoFxSPyiciCxV6ekwvC
 DGyXvIKCtB5ZrD6V10aWErSNJLlduAq0g71+DdqjnjWo9dVD4+vv2H1Mmq0lTMMhEOc2gX5ABfP
 1bQs/8zoML5r3lcb7VbpHKnuWdv4vLaLrcL/oMrXK2pEe4xj+2uBaQm9IaTuqojnzaA0X03XFtc
 vflonaq69Q//iLdcWgbI=
X-Google-Smtp-Source: AGHT+IGCO5Yz/McpdLbvstrjp9ON3bvmgmsZGX9z/NKfsYRx7kZ/KBKj5mqJ1Hqz+AjQN6N+krHxDA==
X-Received: by 2002:a05:6000:402a:b0:3b8:ffd1:80d2 with SMTP id
 ffacd0b85a97d-3b900b4d494mr10608677f8f.24.1754907339468; 
 Mon, 11 Aug 2025 03:15:39 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3c4d02sm38989438f8f.33.2025.08.11.03.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:15:38 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] drm/vkms: Assert if vkms_config_create_*() fails
Date: Mon, 11 Aug 2025 12:15:17 +0200
Message-ID: <20250811101529.150716-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Check that the value returned by the vkms_config_create_*() functions is
valid. Otherwise, assert and finish the KUnit test.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/aJTL6IFEBaI8gqtH@stanley.mountain/
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 51 +++++++++++++++++--
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index ff4566cf9925..b0d78a81d2df 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -200,6 +200,7 @@ static void vkms_config_test_get_planes(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, n_planes, 0);
 
 	plane_cfg1 = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg1);
 	vkms_config_for_each_plane(config, plane_cfg) {
 		n_planes++;
 		if (plane_cfg != plane_cfg1)
@@ -209,6 +210,7 @@ static void vkms_config_test_get_planes(struct kunit *test)
 	n_planes = 0;
 
 	plane_cfg2 = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg2);
 	vkms_config_for_each_plane(config, plane_cfg) {
 		n_planes++;
 		if (plane_cfg != plane_cfg1 && plane_cfg != plane_cfg2)
@@ -242,6 +244,7 @@ static void vkms_config_test_get_crtcs(struct kunit *test)
 		KUNIT_FAIL(test, "Unexpected CRTC");
 
 	crtc_cfg1 = vkms_config_create_crtc(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg1);
 	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
 	vkms_config_for_each_crtc(config, crtc_cfg) {
 		if (crtc_cfg != crtc_cfg1)
@@ -249,6 +252,7 @@ static void vkms_config_test_get_crtcs(struct kunit *test)
 	}
 
 	crtc_cfg2 = vkms_config_create_crtc(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg2);
 	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 2);
 	vkms_config_for_each_crtc(config, crtc_cfg) {
 		if (crtc_cfg != crtc_cfg1 && crtc_cfg != crtc_cfg2)
@@ -280,6 +284,7 @@ static void vkms_config_test_get_encoders(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, n_encoders, 0);
 
 	encoder_cfg1 = vkms_config_create_encoder(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg1);
 	vkms_config_for_each_encoder(config, encoder_cfg) {
 		n_encoders++;
 		if (encoder_cfg != encoder_cfg1)
@@ -289,6 +294,7 @@ static void vkms_config_test_get_encoders(struct kunit *test)
 	n_encoders = 0;
 
 	encoder_cfg2 = vkms_config_create_encoder(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg2);
 	vkms_config_for_each_encoder(config, encoder_cfg) {
 		n_encoders++;
 		if (encoder_cfg != encoder_cfg1 && encoder_cfg != encoder_cfg2)
@@ -324,6 +330,7 @@ static void vkms_config_test_get_connectors(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, n_connectors, 0);
 
 	connector_cfg1 = vkms_config_create_connector(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg1);
 	vkms_config_for_each_connector(config, connector_cfg) {
 		n_connectors++;
 		if (connector_cfg != connector_cfg1)
@@ -333,6 +340,7 @@ static void vkms_config_test_get_connectors(struct kunit *test)
 	n_connectors = 0;
 
 	connector_cfg2 = vkms_config_create_connector(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg2);
 	vkms_config_for_each_connector(config, connector_cfg) {
 		n_connectors++;
 		if (connector_cfg != connector_cfg1 &&
@@ -370,7 +378,7 @@ static void vkms_config_test_invalid_plane_number(struct kunit *test)
 
 	/* Invalid: Too many planes */
 	for (n = 0; n <= 32; n++)
-		vkms_config_create_plane(config);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vkms_config_create_plane(config));
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -395,6 +403,7 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 
 	/* Invalid: No primary plane */
 	plane_cfg = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
 	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
 	KUNIT_EXPECT_EQ(test, err, 0);
@@ -402,11 +411,13 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 
 	/* Invalid: Multiple primary planes */
 	plane_cfg = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
 	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
 	KUNIT_EXPECT_EQ(test, err, 0);
 
 	plane_cfg = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
 	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
 	KUNIT_EXPECT_EQ(test, err, 0);
@@ -419,11 +430,13 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 
 	/* Invalid: Multiple cursor planes */
 	plane_cfg = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
 	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
 	KUNIT_EXPECT_EQ(test, err, 0);
 
 	plane_cfg = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
 	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
 	KUNIT_EXPECT_EQ(test, err, 0);
@@ -437,12 +450,16 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	/* Invalid: Second CRTC without primary plane */
 	crtc_cfg = vkms_config_create_crtc(config);
 	encoder_cfg = vkms_config_create_encoder(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg);
+
 	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg);
 	KUNIT_EXPECT_EQ(test, err, 0);
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid: Second CRTC with a primary plane */
 	plane_cfg = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
 	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
 	KUNIT_EXPECT_EQ(test, err, 0);
@@ -486,7 +503,7 @@ static void vkms_config_test_invalid_crtc_number(struct kunit *test)
 
 	/* Invalid: Too many CRTCs */
 	for (n = 0; n <= 32; n++)
-		vkms_config_create_crtc(config);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vkms_config_create_crtc(config));
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -509,7 +526,7 @@ static void vkms_config_test_invalid_encoder_number(struct kunit *test)
 
 	/* Invalid: Too many encoders */
 	for (n = 0; n <= 32; n++)
-		vkms_config_create_encoder(config);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vkms_config_create_encoder(config));
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -531,12 +548,15 @@ static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
 
 	/* Invalid: Encoder without a possible CRTC */
 	encoder_cfg = vkms_config_create_encoder(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg);
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid: Second CRTC with shared encoder */
 	crtc_cfg2 = vkms_config_create_crtc(config);
-
 	plane_cfg = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg2);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
+
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
 	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg2);
 	KUNIT_EXPECT_EQ(test, err, 0);
@@ -577,7 +597,7 @@ static void vkms_config_test_invalid_connector_number(struct kunit *test)
 
 	/* Invalid: Too many connectors */
 	for (n = 0; n <= 32; n++)
-		connector_cfg = vkms_config_create_connector(config);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vkms_config_create_connector(config));
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -669,13 +689,19 @@ static void vkms_config_test_plane_attach_crtc(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
 	overlay_cfg = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, overlay_cfg);
 	vkms_config_plane_set_type(overlay_cfg, DRM_PLANE_TYPE_OVERLAY);
+
 	primary_cfg = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, primary_cfg);
 	vkms_config_plane_set_type(primary_cfg, DRM_PLANE_TYPE_PRIMARY);
+
 	cursor_cfg = vkms_config_create_plane(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cursor_cfg);
 	vkms_config_plane_set_type(cursor_cfg, DRM_PLANE_TYPE_CURSOR);
 
 	crtc_cfg = vkms_config_create_crtc(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg);
 
 	/* No primary or cursor planes */
 	KUNIT_EXPECT_NULL(test, vkms_config_crtc_primary_plane(config, crtc_cfg));
@@ -735,6 +761,11 @@ static void vkms_config_test_plane_get_possible_crtcs(struct kunit *test)
 	crtc_cfg1 = vkms_config_create_crtc(config);
 	crtc_cfg2 = vkms_config_create_crtc(config);
 
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg2);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg2);
+
 	/* No possible CRTCs */
 	vkms_config_plane_for_each_possible_crtc(plane_cfg1, idx, possible_crtc)
 		KUNIT_FAIL(test, "Unexpected possible CRTC");
@@ -799,6 +830,11 @@ static void vkms_config_test_encoder_get_possible_crtcs(struct kunit *test)
 	crtc_cfg1 = vkms_config_create_crtc(config);
 	crtc_cfg2 = vkms_config_create_crtc(config);
 
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg2);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg2);
+
 	/* No possible CRTCs */
 	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc)
 		KUNIT_FAIL(test, "Unexpected possible CRTC");
@@ -863,6 +899,11 @@ static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
 	encoder_cfg1 = vkms_config_create_encoder(config);
 	encoder_cfg2 = vkms_config_create_encoder(config);
 
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg2);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg2);
+
 	/* No possible encoders */
 	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
 							possible_encoder)
-- 
2.50.1

