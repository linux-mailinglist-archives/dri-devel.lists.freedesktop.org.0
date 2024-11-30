Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94259DEE6E
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5306B10E5BA;
	Sat, 30 Nov 2024 01:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sTJgPquW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A0610E5BA
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:52:47 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53df119675dso2969573e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931566; x=1733536366; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9ZLmc4ldEZMEINodQt+XcOaL2uCpfas5CxnR9KYEiKA=;
 b=sTJgPquW0L3h8auaORHfEjbOVuezlHL4PNn55Y77K7ZEk8pQe68CYx0JqDDFS4PD53
 jzhM4W9z5W51hEuMw8OVoi6rhaSH0KKh4v7ofSWmRXXsan9o3LGa3FqoZP8SU+A2tejU
 ERIABvtni7cHtU0wZaaBYvXp+KZP9pzgs95GdVE3V9E/6JAdWZE+5Cpbv0R+kRZrTo2N
 e0LVe5pci3j/wEO2Y8zOOB9XLl3b8yFgz6ZnwSAeAzL1SsUH+PQFrnzEhTIfqdihvR23
 Aq7kQPRXk16aBhXSgIKuPWc2xx++NVeutb5f/0wgGKw+Bx50a+5PEPpb8uB3lkEE1WIg
 q9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931566; x=1733536366;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ZLmc4ldEZMEINodQt+XcOaL2uCpfas5CxnR9KYEiKA=;
 b=MQbj48vtwcK58Sj4t2wMNxWRu15SMl4WW3o6otUTu7qtjEL5i8E7NjXF5Lxxb8hWtV
 PB0cV0v9dD/1L7MVo2QFKlMoh+fKTDN9dRQI9leK3BjrexnVPi55HKkpRBooy8R1SrJe
 VA/azTM0aqxQ21jQnmTea+63HRMFYehtXHVmnEriI0AX5sdyxXjSFEFceY/Pq09MOPR3
 Sy7Ez7/zMYadr8EnWtkWaKGUXbw3Zhy6l1l+q4dj37QG+hGLdesasYBWfkmGf4u4Gmh2
 byusBL9oo1JSp/Doy6WkDoI4nzZP76QJxC46zvr4wS6mPC2PoepQrukpmpRLKddT5/nG
 DvkQ==
X-Gm-Message-State: AOJu0YxR6nN1P4ntnW7p9LP6ln/9RsZhyl8xWCWLNHDHbYeA1WX8JGHY
 BJuN5LTSAQE6IIFVkgohvqa14fyn8vSlHMy4M7wRZdrtLPRSOIsgNdXgoumYjUU=
X-Gm-Gg: ASbGnctCMGTHVMxnl8CcZtuXjCytIjWd9U7jMhv8pAuUCyEUWjBSx2Lfjegz8NtSAum
 uCP+uQcmb62PY1hJtOGDCKttNT8vjZgvRq7vANmkOqUfKIKBReqHkJugh/z9Zg5PZzay3lapaJI
 Y5HYNq44r3jA1Y+7+3/pdRd8RvoBXd7SIglIE4pOoaBZOjXuq/2bNcF8k1ct5X/FtzBduEFkWAU
 zjM/Kd0YTbPGWxYBs8+EZoqFiWjt1h2DjnTM6ybSQV/+p275+Rb8T8Eug==
X-Google-Smtp-Source: AGHT+IEOFuLEJ9vpWWhQ+kw0FCr8rUhq7mRbiidKxbfiaszDg5XlFH7v6/saHBl9DYWJ56XUYR182Q==
X-Received: by 2002:a05:6512:b98:b0:53d:ede3:3d5 with SMTP id
 2adb3069b0e04-53df00d11c8mr8780934e87.22.1732931565710; 
 Fri, 29 Nov 2024 17:52:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:52:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:29 +0200
Subject: [PATCH v5 04/10] drm/display: hdmi: add generic mode_valid helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-4-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15861;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=24h86ZY7bzN0OoxVx8Xf6k2a8m9A8BoQoimDyco+2fg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/gMPsPrRLVtrQPZDm3RuddWefA9AYsqGQPB
 VsrZe+UgpCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4AAKCRCLPIo+Aiko
 1fXZCACWw6YLkq/HrwCOD+APAUdA7sjH8ciYl7lU0ff38EV1zvKJGQfBgwxh9UvPp/OZSW0DGKl
 BAUFNfL6+U7j5wN1nzMf6u7WNYscxwurxCQkokROsLpk3OMgnn+fAYC9DDCm3S9/09TNf/uNpkh
 1RkGaMx9aNr0xo4qVpfvM6VVQT9c9lEG7sN5QR0+snOfdxQbqkiaAN45FsVrGIPnf/N0rAsw3a/
 3k1vi6YebJNFcQaDQ6Bzx7Cout66YmuJoXTj9l6gjc+Oji5VrfChOG6dQ2AMCn7ZuKyvsQdOSle
 ODQ+g46EXah9stTet+5g4mVbe9LShjE0uN1hDeZA/gUFgxvV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
It can be either used directly or as a part of the .mode_valid callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  21 +++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 180 ++++++++++++++++++++-
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 102 ++++++++++++
 include/drm/display/drm_hdmi_state_helper.h        |   4 +
 4 files changed, 302 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..80bf2829ba89b5f84fed4fa9eb1d6302e10a4f9e 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -521,6 +521,27 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
 
+/**
+ * drm_hdmi_connector_mode_valid() - Check if mode is valid for HDMI connector
+ * @connector: DRM connector to validate the mode
+ * @mode: Display mode to validate
+ *
+ * Generic .mode_valid implementation for HDMI connectors.
+ */
+enum drm_mode_status
+drm_hdmi_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode)
+{
+	unsigned long long clock;
+
+	clock = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	if (!clock)
+		return MODE_ERROR;
+
+	return hdmi_clock_valid(connector, mode, clock);
+}
+EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
+
 static int clear_device_infoframe(struct drm_connector *connector,
 				  enum hdmi_infoframe_type type)
 {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 19384b5ff28100b96add35cee86d40cd7d555f1f..c3b693bb966f1f8b04066d19f520bfa4bf11c23d 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -124,6 +124,18 @@ static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
 };
 
+static enum drm_mode_status
+reject_100MHz_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+					     const struct drm_display_mode *mode,
+					     unsigned long long tmds_rate)
+{
+	return (tmds_rate > 100ULL * 1000 * 1000) ? MODE_BAD : MODE_OK;
+}
+
+static const struct drm_connector_hdmi_funcs reject_100_MHz_connector_hdmi_funcs = {
+	.tmds_char_rate_valid	= reject_100MHz_connector_tmds_char_rate_valid,
+};
+
 static int dummy_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
@@ -146,6 +158,7 @@ static int dummy_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
 	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
 	.get_modes	= dummy_connector_get_modes,
+	.mode_valid	= drm_hdmi_connector_mode_valid,
 };
 
 static void dummy_hdmi_connector_reset(struct drm_connector *connector)
@@ -163,9 +176,10 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_kunit_helper_connector_hdmi_init(struct kunit *test,
-				     unsigned int formats,
-				     unsigned int max_bpc)
+drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
+					   unsigned int formats,
+					   unsigned int max_bpc,
+					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
@@ -207,7 +221,7 @@ drm_kunit_helper_connector_hdmi_init(struct kunit *test,
 	ret = drmm_connector_hdmi_init(drm, conn,
 				       "Vendor", "Product",
 				       &dummy_connector_funcs,
-				       &dummy_connector_hdmi_funcs,
+				       hdmi_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
 				       NULL,
 				       formats,
@@ -219,7 +233,24 @@ drm_kunit_helper_connector_hdmi_init(struct kunit *test,
 
 	drm_mode_config_reset(drm);
 
-	ret = set_connector_edid(test, conn,
+	return priv;
+}
+
+static
+struct drm_atomic_helper_connector_hdmi_priv *
+drm_kunit_helper_connector_hdmi_init(struct kunit *test,
+				     unsigned int formats,
+				     unsigned int max_bpc)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
+							  formats, max_bpc,
+							  &dummy_connector_hdmi_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	ret = set_connector_edid(test, &priv->connector,
 				 test_edid_hdmi_1080p_rgb_max_200mhz,
 				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
 	KUNIT_ASSERT_GT(test, ret, 0);
@@ -1733,9 +1764,148 @@ static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
 	.test_cases	= drm_atomic_helper_connector_hdmi_reset_tests,
 };
 
+/*
+ * Test that the default behaviour for drm_hdmi_connector_mode_valid() is not
+ * to reject any modes. Pass a correct EDID and verify that preferred mode
+ * matches the expectations (1080p).
+ */
+static void drm_test_check_mode_valid(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 1920);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1080);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 148500);
+}
+
+/*
+ * Test that the drm_hdmi_connector_mode_valid() will reject modes depending on
+ * the .tmds_char_rate_valid() behaviour.
+ * Pass a correct EDID and verify that high-rate modes are filtered.
+ */
+static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
+							  BIT(HDMI_COLORSPACE_RGB),
+							  8,
+							  &reject_100_MHz_connector_hdmi_funcs);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
+	KUNIT_ASSERT_GT(test, ret, 0);
+
+	/*
+	 * Unlike the drm_test_check_mode_valid() here 1080p is rejected, but
+	 * 480p is allowed.
+	 */
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
+}
+
+/*
+ * Test that the drm_hdmi_connector_mode_valid() will not mark any modes as
+ * valid if .tmds_char_rate_valid() rejects all of them. Pass a correct EDID
+ * and verify that there is no preferred mode and no modes were set for the
+ * connector.
+ */
+static void drm_test_check_mode_valid_reject(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
+							  BIT(HDMI_COLORSPACE_RGB),
+							  8,
+							  &reject_connector_hdmi_funcs);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	/* should reject all modes */
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NULL(test, preferred);
+}
+
+/*
+ * Test that the drm_hdmi_connector_mode_valid() will reject modes that don't
+ * pass the info.max_tmds_clock filter. Pass crafted EDID and verify that
+ * high-rate modes are filtered.
+ */
+static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_max_100mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_100mhz));
+	KUNIT_ASSERT_GT(test, ret, 0);
+
+	KUNIT_ASSERT_EQ(test, conn->display_info.max_tmds_clock, 100 * 1000);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
+}
+
+static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tests[] = {
+	KUNIT_CASE(drm_test_check_mode_valid),
+	KUNIT_CASE(drm_test_check_mode_valid_reject),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
+	{ }
+};
+
+static struct kunit_suite drm_atomic_helper_connector_hdmi_mode_valid_test_suite = {
+	.name		= "drm_atomic_helper_connector_hdmi_mode_valid",
+	.test_cases	= drm_atomic_helper_connector_hdmi_mode_valid_tests,
+};
+
 kunit_test_suites(
 	&drm_atomic_helper_connector_hdmi_check_test_suite,
 	&drm_atomic_helper_connector_hdmi_reset_test_suite,
+	&drm_atomic_helper_connector_hdmi_mode_valid_test_suite,
 );
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
index 107559900e977119d451b00a647f0bd6ab598f63..6358397a5d7ab0bcdea1c824fc9fd382560f4b0e 100644
--- a/drivers/gpu/drm/tests/drm_kunit_edid.h
+++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
@@ -61,6 +61,108 @@ static const unsigned char test_edid_dvi_1080p[] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xab
 };
 
+/*
+ * edid-decode (hex):
+ *
+ * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
+ * 00 21 01 03 81 a0 5a 78 02 00 00 00 00 00 00 00
+ * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
+ * 01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c
+ * 45 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
+ * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 32
+ * 46 1e 46 0f 00 0a 20 20 20 20 20 20 00 00 00 10
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 92
+ *
+ * 02 03 1b 81 e3 05 00 20 41 10 e2 00 4a 6d 03 0c
+ * 00 12 34 00 14 20 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 e4
+ *
+ * ----------------
+ *
+ * Block 0, Base EDID:
+ *   EDID Structure Version & Revision: 1.3
+ *   Vendor & Product Identification:
+ *     Manufacturer: LNX
+ *     Model: 42
+ *     Made in: 2023
+ *   Basic Display Parameters & Features:
+ *     Digital display
+ *     DFP 1.x compatible TMDS
+ *     Maximum image size: 160 cm x 90 cm
+ *     Gamma: 2.20
+ *     Monochrome or grayscale display
+ *     First detailed timing is the preferred timing
+ *   Color Characteristics:
+ *     Red  : 0.0000, 0.0000
+ *     Green: 0.0000, 0.0000
+ *     Blue : 0.0000, 0.0000
+ *     White: 0.0000, 0.0000
+ *   Established Timings I & II:
+ *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
+ *   Standard Timings: none
+ *   Detailed Timing Descriptors:
+ *     DTD 1:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (1600 mm x 900 mm)
+ *                  Hfront   88 Hsync  44 Hback  148 Hpol P
+ *                  Vfront    4 Vsync   5 Vback   36 Vpol P
+ *     Display Product Name: 'Test EDID'
+ *     Display Range Limits:
+ *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150 MHz
+ *     Dummy Descriptor:
+ *   Extension blocks: 1
+ * Checksum: 0x92
+ *
+ * ----------------
+ *
+ * Block 1, CTA-861 Extension Block:
+ *   Revision: 3
+ *   Underscans IT Video Formats by default
+ *   Native detailed modes: 1
+ *   Colorimetry Data Block:
+ *     sRGB
+ *   Video Data Block:
+ *     VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
+ *   Video Capability Data Block:
+ *     YCbCr quantization: No Data
+ *     RGB quantization: Selectable (via AVI Q)
+ *     PT scan behavior: No Data
+ *     IT scan behavior: Always Underscanned
+ *     CE scan behavior: Always Underscanned
+ *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
+ *     Source physical address: 1.2.3.4
+ *     Maximum TMDS clock: 100 MHz
+ *     Extended HDMI video details:
+ * Checksum: 0xe4  Unused space in Extension Block: 100 bytes
+ */
+static const unsigned char test_edid_hdmi_1080p_rgb_max_100mhz[] = {
+	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
+	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
+	0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a, 0x80, 0x18, 0x71, 0x38,
+	0x2d, 0x40, 0x58, 0x2c, 0x45, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
+	0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
+	0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x32,
+	0x46, 0x00, 0x00, 0xc4, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+	0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x41, 0x02, 0x03, 0x1b, 0x81,
+	0xe3, 0x05, 0x00, 0x20, 0x41, 0x10, 0xe2, 0x00, 0x4a, 0x6d, 0x03, 0x0c,
+	0x00, 0x12, 0x34, 0x00, 0x14, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0xe4
+};
+
 /*
  * edid-decode (hex):
  *
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..d6d65da6d8f9ee46de33114cce2d6fbe6098a862 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -20,4 +20,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 
+enum drm_mode_status
+drm_hdmi_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.39.5

