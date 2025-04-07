Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B78A7D759
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5EE10E3B2;
	Mon,  7 Apr 2025 08:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hZPZcDhD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E778E10E3A9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so19524295e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013689; x=1744618489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDAURXwAx1KsBXr4riUk4MzDkYMXGUuztgEFx9hlcRg=;
 b=hZPZcDhDeHbOInHGTr73Zj6Z4ffmd1HzKlSrvrEdJ/RvDd4yERGofJIdcBCJqRWpnY
 USi/kQcmaEDrqphqOaAqYVcDCS9/CNmz15mKWSYzb4u6rXCFESUnX3HUxK9DxDfSxEnL
 1rxDQGPCDyR4WpLMBAiwaDA5+Qm/qRD7ShRx42zcNTUbKcityurSZ5KBSPsoACXb3/KA
 31NarOEXC5BWkRd+zpT940VNfgGOkIkngtMFu+gPI782Jqv6xf8+F7E3gn8NHL9syCBm
 KEIPLSt0Lb+Zi7snS+1jW16v5KM9HIf+hjF0m116zJLul0yxUqa4uX310QGgOFyohv6B
 GCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013689; x=1744618489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDAURXwAx1KsBXr4riUk4MzDkYMXGUuztgEFx9hlcRg=;
 b=TbNSqhTBuLeydCjYaQU+F9yqARFfnewHHiTmjenF6ZfIPoVpxUerfJH1djPfDcswdF
 j0KbSgGiiia2PMC5pxu8/FawDdZzuTjn/UApDXQbdvv1kmhDhfZ9Yxg9O/nA1GE/ABsh
 c9U9Lr+KLN0sQMQUPGr30BK4WF6j0SnBQnwk8r6O6d+p/fQ5Sp+Me7ENmOqEF2CgnC3h
 q4Mjdc32D0latW69Q/a9ylT+K3v991ADOl/zCfyY7s72LPEguzhFHrl/QPDWAeAhGA77
 POjigtp5i/FXKIBURyOJWAmlbF4v0K7D2a4uT6wWi6D4TQmIGsWxD0DU3WDrQl2gaGg7
 hGWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5clcngz/FfYn7pV5w0buwvOCAURdRcKcuHb9QTeG+TXm4x9jWOImyRIBRtM+001LAf2+Ft0kieh0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhOFPaxvOu1P6UQPiHKwmF9Xjre7t4EnjZHTsQVs050GcrLz+I
 bdagDs2Wu7ad+TVsZVluF7x1KNnVZOzachPpGZaRHoJe24un6K6l
X-Gm-Gg: ASbGncvLKS8BZCC98V4OrddbYpwtBTtM2oYJd1Jg6KCNAULRhcMwLtK2znCBB1c2ZgK
 46gYyjIHXhhp+ialDkyY7ONFLrFVKJRnjIDM5KMkbpQXrs+rOBxyEph3ywcLE2G026Ufp9ywE2H
 /ufISzSFLeLnpoKFuCw7wZhKAWFScAsoK3Dto8KTlAsriERWLtMfxkdAkJYeAi2PaFLm8tqoaOi
 E5Ll37Z3fb2DtttdxBiiSo1iJA9VZWOB/C1NPkOxOvrnX01y9e28sBfe8pIYNBieLwk0VG0/nCq
 Dq3LEBRkyuyxAMHzXMJVlJ4Itd+T6c6Ps48VceyU/yDf
X-Google-Smtp-Source: AGHT+IE6f6M1KHra/q4Is21z/AjbgrdNm1sf0V7pCHxLyOu0BmuTArVc0H+2ckarFreLsYNWXyZx+g==
X-Received: by 2002:a05:600c:1c02:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-43ecf9c3318mr89313545e9.26.1744013689269; 
 Mon, 07 Apr 2025 01:14:49 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 14/16] drm/vkms: Allow to configure connector status
Date: Mon,  7 Apr 2025 10:14:23 +0200
Message-ID: <20250407081425.6420-15-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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

