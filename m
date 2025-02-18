Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCF3A39861
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D920D10E650;
	Tue, 18 Feb 2025 10:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NZVg29nf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA6110E659
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:12:37 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38f31f7731fso1788001f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873556; x=1740478356; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+xCFrURTppY63NVOBwqa8Qg4TsqZlxYnGgiayzWMgE=;
 b=NZVg29nfLwIi3PUZ/oD1N8tEjmLBLl7t2xaQe9lp26Qb1xlVC59Bh3kyEmHeIh97Ht
 +tAp2PBp3TQV420oVf+Zo0Fvr99lpr4SNgoCNcAhfkDwPiNafcufMUlhsI2QTxRM1lU9
 C72b+hrRK3/wQyImCITXbW5L9Ks/R6qsXedkM5w1eJq+EzmIyevKgWqLGs8w7PgElJ9c
 iLT847etO9P/nX2FpmLa0oNkui3FNRcPLAxPscJE7hf56+hdd49DzD1Pxw5+vW16WLZD
 pzyvLjYE0BkddbXcFHnX28aEgQTGuyk5rf/gqD1TcL1IM6dbdzXircEYMpxzbI87KG+g
 NoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873556; x=1740478356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h+xCFrURTppY63NVOBwqa8Qg4TsqZlxYnGgiayzWMgE=;
 b=gGugaR/ifh99eh05baSZGJ69ZyY6kq9y8bqxRf9pH/4GqPNF/Faox91gybrrWdsWFO
 yXLwje2CDJn60n3lnTZtIWYSDm8G84UvDiiB35LjnrNEHD2t2T5G/MsjQkIX3Wcp1zl3
 VGWkJUoM5lgk/QMWqf/j+ne+OmGLkBkDXWfycEcjdu17l4NSZvftX4lg5LvDJYuax5Im
 8ZwvEjwNNOfiV9gki4ZQg82T2SqTH8C0QpDK1JGQ+/y3G1DIA9qtFg4Uk0i7VFsAGkUh
 ruVB7BFL73xEaGkluN2TtMOYCA6aOGmcW/cGPDVee5AVeCEICENsWcUBKo9YV/XIBchY
 UrEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCOn+MLSmsjjz9KsrMsvF1KTtuq0HdkcdZ8R1MFrHbYWJkV/QQElm3E3C3R0Y/17lIbTOqYEIYYVs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+aPxxeSHLEWf1JQ69TqGZTxU8/eEr4wMETl8z9jclnaZSIpI3
 Peqmc0CC8grGcG1r/nteYTsPuwQiV9sMYjKwbbIjZSmNnbvmvrMs
X-Gm-Gg: ASbGncvtyodkhd6TrbMZlsG0pUdDd08jSLBNmuL+zsS8Vjovl1H2329pVKy/KRIkQMN
 hJkPJOHuNlg+Fr29pyKvDyM626biJwvcBUzxZf3vHKEqvB+DQoiVlMgyW1XgWQqco+m17d66lPm
 LF0a9/snU5E5bWzry8qmYCOL4PdefSkqmrXsSoMOKvZ/ogDYVs3fwwjN/BLC35yOALQJ+2j30fN
 KBc2k0i5PpcYbQPbTWrAsOPEKvU2gazsEBUiZRFlSjgyoY+7CG215ArkjiUsYqMY1JrAek+yVLi
 J1RMTHtDjSgEkC0Q7Q==
X-Google-Smtp-Source: AGHT+IH1fgM5ly1pG4PQnHCQHvU2qjuyGPQ9TH5SuTOagsYNNt7IikoLHxrhYwZdCW6vd8EuNSSdpQ==
X-Received: by 2002:a5d:598b:0:b0:38f:4e6e:22 with SMTP id
 ffacd0b85a97d-38f4e6e01a3mr4986452f8f.48.1739873556184; 
 Tue, 18 Feb 2025 02:12:36 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm14749720f8f.66.2025.02.18.02.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:12:35 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 14/14] drm/vkms: Allow to attach connectors and encoders
Date: Tue, 18 Feb 2025 11:12:14 +0100
Message-ID: <20250218101214.5790-15-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218101214.5790-1-jose.exposito89@gmail.com>
References: <20250218101214.5790-1-jose.exposito89@gmail.com>
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

Add a list of possible encoders to the connector configuration and
helpers to attach and detach them.

Now that the default configuration has its connector and encoder
correctly, configure the output following the configuration.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .clang-format                                 |   1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 102 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            |  64 +++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            |  29 +++++
 drivers/gpu/drm/vkms/vkms_output.c            |  33 +++---
 5 files changed, 216 insertions(+), 13 deletions(-)

diff --git a/.clang-format b/.clang-format
index ca49832993c5..7630990aa07a 100644
--- a/.clang-format
+++ b/.clang-format
@@ -694,6 +694,7 @@ ForEachMacros:
   - 'vkms_config_for_each_crtc'
   - 'vkms_config_for_each_encoder'
   - 'vkms_config_for_each_plane'
+  - 'vkms_config_connector_for_each_possible_encoder'
   - 'vkms_config_encoder_for_each_possible_crtc'
   - 'vkms_config_plane_for_each_possible_crtc'
   - 'while_for_each_ftrace_op'
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 610bcde3e018..ff4566cf9925 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -584,12 +584,32 @@ static void vkms_config_test_invalid_connector_number(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_valid_connector_possible_encoders(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	encoder_cfg = get_first_encoder(config);
+	connector_cfg = get_first_connector(config);
+
+	/* Invalid: Connector without a possible encoder */
+	vkms_config_connector_detach_encoder(connector_cfg, encoder_cfg);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_attach_different_configs(struct kunit *test)
 {
 	struct vkms_config *config1, *config2;
 	struct vkms_config_plane *plane_cfg1, *plane_cfg2;
 	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
 	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
+	struct vkms_config_connector *connector_cfg1, *connector_cfg2;
 	int err;
 
 	config1 = vkms_config_create("test1");
@@ -601,10 +621,12 @@ static void vkms_config_test_attach_different_configs(struct kunit *test)
 	plane_cfg1 = vkms_config_create_plane(config1);
 	crtc_cfg1 = vkms_config_create_crtc(config1);
 	encoder_cfg1 = vkms_config_create_encoder(config1);
+	connector_cfg1 = vkms_config_create_connector(config1);
 
 	plane_cfg2 = vkms_config_create_plane(config2);
 	crtc_cfg2 = vkms_config_create_crtc(config2);
 	encoder_cfg2 = vkms_config_create_encoder(config2);
+	connector_cfg2 = vkms_config_create_connector(config2);
 
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg1);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg2);
@@ -612,6 +634,8 @@ static void vkms_config_test_attach_different_configs(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg2);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg1);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg2);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg2);
 
 	err = vkms_config_plane_attach_crtc(plane_cfg1, crtc_cfg2);
 	KUNIT_EXPECT_NE(test, err, 0);
@@ -623,6 +647,11 @@ static void vkms_config_test_attach_different_configs(struct kunit *test)
 	err = vkms_config_encoder_attach_crtc(encoder_cfg2, crtc_cfg1);
 	KUNIT_EXPECT_NE(test, err, 0);
 
+	err = vkms_config_connector_attach_encoder(connector_cfg1, encoder_cfg2);
+	KUNIT_EXPECT_NE(test, err, 0);
+	err = vkms_config_connector_attach_encoder(connector_cfg2, encoder_cfg1);
+	KUNIT_EXPECT_NE(test, err, 0);
+
 	vkms_config_destroy(config1);
 	vkms_config_destroy(config2);
 }
@@ -816,6 +845,77 @@ static void vkms_config_test_encoder_get_possible_crtcs(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_connector *connector_cfg1, *connector_cfg2;
+	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
+	struct vkms_config_encoder *possible_encoder;
+	unsigned long idx = 0;
+	int n_encoders = 0;
+	int err;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	connector_cfg1 = vkms_config_create_connector(config);
+	connector_cfg2 = vkms_config_create_connector(config);
+	encoder_cfg1 = vkms_config_create_encoder(config);
+	encoder_cfg2 = vkms_config_create_encoder(config);
+
+	/* No possible encoders */
+	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
+							possible_encoder)
+		KUNIT_FAIL(test, "Unexpected possible encoder");
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg2, idx,
+							possible_encoder)
+		KUNIT_FAIL(test, "Unexpected possible encoder");
+
+	/* Connector 1 attached to encoders 1 and 2 */
+	err = vkms_config_connector_attach_encoder(connector_cfg1, encoder_cfg1);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	err = vkms_config_connector_attach_encoder(connector_cfg1, encoder_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
+							possible_encoder) {
+		n_encoders++;
+		if (possible_encoder != encoder_cfg1 &&
+		    possible_encoder != encoder_cfg2)
+			KUNIT_FAIL(test, "Unexpected possible encoder");
+	}
+	KUNIT_ASSERT_EQ(test, n_encoders, 2);
+	n_encoders = 0;
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg2, idx,
+							possible_encoder)
+		KUNIT_FAIL(test, "Unexpected possible encoder");
+
+	/* Connector 1 attached to encoder 1 and connector 2 to encoder 2 */
+	vkms_config_connector_detach_encoder(connector_cfg1, encoder_cfg2);
+	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
+							possible_encoder) {
+		n_encoders++;
+		if (possible_encoder != encoder_cfg1)
+			KUNIT_FAIL(test, "Unexpected possible encoder");
+	}
+	KUNIT_ASSERT_EQ(test, n_encoders, 1);
+	n_encoders = 0;
+
+	err = vkms_config_connector_attach_encoder(connector_cfg2, encoder_cfg2);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	vkms_config_connector_for_each_possible_encoder(connector_cfg2, idx,
+							possible_encoder) {
+		n_encoders++;
+		if (possible_encoder != encoder_cfg2)
+			KUNIT_FAIL(test, "Unexpected possible encoder");
+	}
+	KUNIT_ASSERT_EQ(test, n_encoders, 1);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
@@ -831,10 +931,12 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
 	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_connector_number),
+	KUNIT_CASE(vkms_config_test_valid_connector_possible_encoders),
 	KUNIT_CASE(vkms_config_test_attach_different_configs),
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
+	KUNIT_CASE(vkms_config_test_connector_get_possible_encoders),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index fbbdee6068ce..a1df5659b0fb 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -95,6 +95,9 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (IS_ERR(connector_cfg))
 		goto err_alloc;
 
+	if (vkms_config_connector_attach_encoder(connector_cfg, encoder_cfg))
+		goto err_alloc;
+
 	return config;
 
 err_alloc:
@@ -279,6 +282,22 @@ static bool valid_connector_number(const struct vkms_config *config)
 	return true;
 }
 
+static bool valid_connector_possible_encoders(const struct vkms_config *config)
+{
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
+	struct vkms_config_connector *connector_cfg;
+
+	vkms_config_for_each_connector(config, connector_cfg) {
+		if (xa_empty(&connector_cfg->possible_encoders)) {
+			drm_info(dev,
+				 "All connectors must have at least one possible encoder\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(const struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -306,6 +325,9 @@ bool vkms_config_is_valid(const struct vkms_config *config)
 	if (!valid_encoder_possible_crtcs(config))
 		return false;
 
+	if (!valid_connector_possible_encoders(config))
+		return false;
+
 	return true;
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_is_valid);
@@ -513,6 +535,11 @@ EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_encoder);
 void vkms_config_destroy_encoder(struct vkms_config *config,
 				 struct vkms_config_encoder *encoder_cfg)
 {
+	struct vkms_config_connector *connector_cfg;
+
+	vkms_config_for_each_connector(config, connector_cfg)
+		vkms_config_connector_detach_encoder(connector_cfg, encoder_cfg);
+
 	xa_destroy(&encoder_cfg->possible_crtcs);
 	list_del(&encoder_cfg->link);
 	kfree(encoder_cfg);
@@ -561,6 +588,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 		return ERR_PTR(-ENOMEM);
 
 	connector_cfg->config = config;
+	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
 
@@ -570,7 +598,43 @@ EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_connector);
 
 void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg)
 {
+	xa_destroy(&connector_cfg->possible_encoders);
 	list_del(&connector_cfg->link);
 	kfree(connector_cfg);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_connector);
+
+int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connector *connector_cfg,
+						      struct vkms_config_encoder *encoder_cfg)
+{
+	struct vkms_config_encoder *possible_encoder;
+	unsigned long idx = 0;
+	u32 encoder_idx = 0;
+
+	if (connector_cfg->config != encoder_cfg->config)
+		return -EINVAL;
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx,
+							possible_encoder) {
+		if (possible_encoder == encoder_cfg)
+			return -EEXIST;
+	}
+
+	return xa_alloc(&connector_cfg->possible_encoders, &encoder_idx,
+			encoder_cfg, xa_limit_32b, GFP_KERNEL);
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_connector_attach_encoder);
+
+void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
+					  struct vkms_config_encoder *encoder_cfg)
+{
+	struct vkms_config_encoder *possible_encoder;
+	unsigned long idx = 0;
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx,
+							possible_encoder) {
+		if (possible_encoder == encoder_cfg)
+			xa_erase(&connector_cfg->possible_encoders, idx);
+	}
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_connector_detach_encoder);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 73562c894102..0118e3f99706 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -99,6 +99,7 @@ struct vkms_config_encoder {
  *
  * @link: Link to the others connector in vkms_config
  * @config: The vkms_config this connector belongs to
+ * @possible_encoders: Array of encoders that can be used with this connector
  * @connector: Internal usage. This pointer should never be considered as valid.
  *             It can be used to store a temporary reference to a VKMS connector
  *             during device creation. This pointer is not managed by the
@@ -108,6 +109,8 @@ struct vkms_config_connector {
 	struct list_head link;
 	struct vkms_config *config;
 
+	struct xarray possible_encoders;
+
 	/* Internal usage */
 	struct vkms_connector *connector;
 };
@@ -164,6 +167,16 @@ struct vkms_config_connector {
 #define vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) \
 	xa_for_each(&(encoder_cfg)->possible_crtcs, idx, (possible_crtc))
 
+/**
+ * vkms_config_connector_for_each_possible_encoder - Iterate over the
+ * vkms_config_connector possible encoders
+ * @connector_cfg: &struct vkms_config_connector pointer
+ * @idx: Index of the cursor
+ * @possible_encoder: &struct vkms_config_encoder pointer used as cursor
+ */
+#define vkms_config_connector_for_each_possible_encoder(connector_cfg, idx, possible_encoder) \
+	xa_for_each(&(connector_cfg)->possible_encoders, idx, (possible_encoder))
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -405,4 +418,20 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
  */
 void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg);
 
+/**
+ * vkms_config_connector_attach_encoder - Attach a connector to an encoder
+ * @connector_cfg: Connector to attach
+ * @encoder_cfg: Encoder to attach @connector_cfg to
+ */
+int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connector *connector_cfg,
+						      struct vkms_config_encoder *encoder_cfg);
+
+/**
+ * vkms_config_connector_detach_encoder - Detach a connector from an encoder
+ * @connector_cfg: Connector to detach
+ * @encoder_cfg: Encoder to detach @connector_cfg from
+ */
+void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
+					  struct vkms_config_encoder *encoder_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 8920d6b5d105..8d7ca0cdd79f 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -8,10 +8,10 @@
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
-	struct vkms_connector *connector;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
 	int ret;
 	int writeback;
 
@@ -83,22 +83,29 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	connector = vkms_connector_init(vkmsdev);
-	if (IS_ERR(connector)) {
-		DRM_ERROR("Failed to init connector\n");
-		return PTR_ERR(connector);
-	}
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+		struct vkms_config_encoder *possible_encoder;
+		unsigned long idx = 0;
 
-	/* Attach the encoder and the connector */
-	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg) {
-		ret = drm_connector_attach_encoder(&connector->base, encoder_cfg->encoder);
-		if (ret) {
-			DRM_ERROR("Failed to attach connector to encoder\n");
-			return ret;
+		connector_cfg->connector = vkms_connector_init(vkmsdev);
+		if (IS_ERR(connector_cfg->connector)) {
+			DRM_ERROR("Failed to init connector\n");
+			return PTR_ERR(connector_cfg->connector);
+		}
+
+		vkms_config_connector_for_each_possible_encoder(connector_cfg,
+								idx,
+								possible_encoder) {
+			ret = drm_connector_attach_encoder(&connector_cfg->connector->base,
+							   possible_encoder->encoder);
+			if (ret) {
+				DRM_ERROR("Failed to attach connector to encoder\n");
+				return ret;
+			}
 		}
 	}
 
 	drm_mode_config_reset(dev);
 
-	return ret;
+	return 0;
 }
-- 
2.48.1

