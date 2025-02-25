Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA438A44944
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4885C10E77C;
	Tue, 25 Feb 2025 18:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z3kI3CPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F7010E6EE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43989226283so40905445e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506397; x=1741111197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDAURXwAx1KsBXr4riUk4MzDkYMXGUuztgEFx9hlcRg=;
 b=Z3kI3CPYJL+uXqzIC12cjSyDWB8obTs2HE3wh8tGk9CYm/GUursVB0qFQxa2j7bIas
 /xMPSPbz8Mtg1Ksz7lKNkF99yhCNcugHUWcHSfDgKSHhx/uHkyd0qISCqs7eviK3p5d2
 ddr1MZvehotJ3YlK+BiauGJWydh1oiFVv1vt6iDIs65oTS4k6/Z9kNlSMC6q9oeCjTWA
 YxoxRQ5AdUdylkF1mRUYMo4AxPTI7htw3Yysz+XeEeQ8l8tvpVRAo7IQseW6Nj2Dxwd0
 pnCr728A1WrfTv2JduMN0Th6XJZAOtK1QHKqkvXx8XbKjHHmOXbSaK9eX16y5nscJDsE
 gzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506397; x=1741111197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDAURXwAx1KsBXr4riUk4MzDkYMXGUuztgEFx9hlcRg=;
 b=wocI3STm2dAQOko/Bn5elaZPEK50Egf856o0YD7HM1FAwzUVFAg7d6zZTaN1dXcGgy
 qAFQ5rHXh729P1t+DQuqtL8U/h625QLA3eRw9ik0PZtawG8ie77eYpJFqtq5ur+VZE4T
 NaTozDrTmrvn4ULEaMnvJnEZaNruxWnNDwoJXYehmmawX5zAV1jBoM0FOjqXVHExZxTq
 B0J1mxDH0XK01WAZS4fW7gIYB+Rvlx97Llc9Sxf9cLJcEGdc7tpp/zO4ChTYMiTkPGxK
 lcVDUFumNm4+TTZp3nO44q4Gvq3g0gZyXCGCvXgcsPmKVoCMosQuSIjRTI9fjfRcHwN5
 w9lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSjIL+i071nfCtdjHFG8dccYONOkMqBMl5xqv3pPhL4PF8zb0v3fPH0Eygji4Ihn8IqfdIe+1jcNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww9OV/xOm3Kaw3XoWKlVLzIz3C9rbWM2mIcyykGuVfd6pQYl1E
 iYXWQpvf//McgTn8KHwcznUBFWAYZgsvWkc0LIcnlS1ywx+tR5NG
X-Gm-Gg: ASbGnctxcZ35t3UhT4F98EHsEucwvoadjKRZKJshmSltoeIZCf/17WwF0wKuhZB8Uoo
 gMD7Gnb0SVutYmPMjPHmQ4eLJvSp8dlrcNXiricZacQ9vsafr0Lyz2+R4He4uarKpL+9NghEUuL
 Bnt4mCzVyYkEHRHA0DYDZ19RbS0hpm3hEulXIAEeXjPR6vzHtOI9LbOPhlb78c7cbWyKIPXk2Ls
 EDCnxEAlfMfklvTdBfG0dntPyhiZ0bDE59VPtFCxiUvkB/p+7GVK7vWgzS75JRhUddcGtjhGfGI
 RBLIo7fCOTIOC/qeNidtG5m7xO4m
X-Google-Smtp-Source: AGHT+IHoNrE7lElorE2nBrogemoz9GreX5xiOI4tcL2igHg9mmoHPhzuv6lZfljM8vKeq46S3NNwkA==
X-Received: by 2002:a05:600c:3582:b0:434:f131:1e64 with SMTP id
 5b1f17b1804b1-439ae1e960dmr143520395e9.9.1740506396488; 
 Tue, 25 Feb 2025 09:59:56 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:55 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 14/16] drm/vkms: Allow to configure connector status
Date: Tue, 25 Feb 2025 18:59:34 +0100
Message-ID: <20250225175936.7223-15-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225175936.7223-1-jose.exposito89@gmail.com>
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
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

Allow to store the connector status in vkms_config_connector and add a
getter and a setter functions as well a KUnit test.

This change only adds the configuration, the connector status is not
used yet.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 24 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            |  8 ++++--
 drivers/gpu/drm/vkms/vkms_config.h            | 26 +++++++++++++++++++
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index ff4566cf9925..3574a829a6ed 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -916,6 +916,29 @@ static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_connector_status(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_connector *connector_cfg;
+	enum drm_connector_status status;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	connector_cfg = vkms_config_create_connector(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg);
+
+	status = vkms_config_connector_get_status(connector_cfg);
+	KUNIT_EXPECT_EQ(test, status, connector_status_connected);
+
+	vkms_config_connector_set_status(connector_cfg,
+					 connector_status_disconnected);
+	status = vkms_config_connector_get_status(connector_cfg);
+	KUNIT_EXPECT_EQ(test, status, connector_status_disconnected);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
@@ -937,6 +960,7 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_connector_get_possible_encoders),
+	KUNIT_CASE(vkms_config_test_connector_status),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index a1df5659b0fb..f8394a063ecf 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -361,8 +361,11 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
 		seq_puts(m, "encoder\n");
 
-	vkms_config_for_each_connector(vkmsdev->config, connector_cfg)
-		seq_puts(m, "connector\n");
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+		seq_puts(m, "connector:\n");
+		seq_printf(m, "\tstatus=%d\n",
+			   vkms_config_connector_get_status(connector_cfg));
+	}
 
 	return 0;
 }
@@ -588,6 +591,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 		return ERR_PTR(-ENOMEM);
 
 	connector_cfg->config = config;
+	connector_cfg->status = connector_status_connected;
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 0118e3f99706..e202b5a84ddd 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -7,6 +7,8 @@
 #include <linux/types.h>
 #include <linux/xarray.h>
 
+#include <drm/drm_connector.h>
+
 #include "vkms_drv.h"
 
 /**
@@ -99,6 +101,7 @@ struct vkms_config_encoder {
  *
  * @link: Link to the others connector in vkms_config
  * @config: The vkms_config this connector belongs to
+ * @status: Status (connected, disconnected...) of the connector
  * @possible_encoders: Array of encoders that can be used with this connector
  * @connector: Internal usage. This pointer should never be considered as valid.
  *             It can be used to store a temporary reference to a VKMS connector
@@ -109,6 +112,7 @@ struct vkms_config_connector {
 	struct list_head link;
 	struct vkms_config *config;
 
+	enum drm_connector_status status;
 	struct xarray possible_encoders;
 
 	/* Internal usage */
@@ -434,4 +438,26 @@ int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connect
 void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
 					  struct vkms_config_encoder *encoder_cfg);
 
+/**
+ * vkms_config_connector_get_status() - Return the status of the connector
+ * @connector_cfg: Connector to get the status from
+ */
+static inline enum drm_connector_status
+vkms_config_connector_get_status(struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->status;
+}
+
+/**
+ * vkms_config_crtc_set_writeback() - If a writeback connector will be created
+ * @crtc_cfg: Target CRTC
+ * @writeback: Enable or disable the writeback connector
+ */
+static inline void
+vkms_config_connector_set_status(struct vkms_config_connector *connector_cfg,
+				 enum drm_connector_status status)
+{
+	connector_cfg->status = status;
+}
+
 #endif /* _VKMS_CONFIG_H_ */
-- 
2.48.1

