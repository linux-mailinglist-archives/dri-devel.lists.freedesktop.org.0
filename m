Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87896A39855
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B0C10E653;
	Tue, 18 Feb 2025 10:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g3OEmjKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314A710E650
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:12:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso3806097f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873543; x=1740478343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T6WlJ6G+D4bbUKndbktll+9YSW21OZOtswUdeB6r15c=;
 b=g3OEmjKv6jucmpFgr/F5lw5FQ9kOqBIEXGjRcvYKkg9E/SCeA5rO1m7XFIuNwEaP06
 o+kQSamv1X2nQmM1VijG+aL6a1+kyX3yfylpTK1PEu49SBE4S/DQGfkUr2B6TrjLu9tY
 r4I15IPvyYyNXASP9dZIStfYXOrWj6VMhZNCKMiURR8vzTtKINDb6QV+lY9xNqNqqtSd
 X7AiCi5s0PUk6QIsbBcqD0yQcg8x/IBO+8m7MdTvWQgEqoMmYPW3eEAyK/0Vi63XOLor
 O9xqWIgQuJK567ZciRhFhNPyVm7TjmjeOhvFKiRoLNEQrVEaXfxQmS+8DMmprtrUgw8P
 b5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873543; x=1740478343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T6WlJ6G+D4bbUKndbktll+9YSW21OZOtswUdeB6r15c=;
 b=I4I4yg339OYKb9kwCldcIp9lb5O8cCXraMHxsBHPPvSvFuBEfd6kAyYf6jdDcbPqXy
 9oQUxI3Q5huDInZNzKov8MAJ/Zv//hujEksnbBu8ZZLdUtd14BqrDKSL7TwJPujobH7j
 uI0QobuWkQV+DBE7pTdOc+2Dvrsvll/1AVqEpH2hX0qO/ceBuuq9u6TVbQb8uFzS90SQ
 Q8Khl4dalrhhPrAPBPysYnyB+TJvHvw4f50YhdVqX3vCqvsWf2qWFZhCz4CCvPsAjlsC
 MFffREOYptdjhaI3i0ROdujWzKX7YVKvBq8sT3sICQBEpSCeRNZlDIvVa2VHCHVUVqvH
 huHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN6kV/3nvmiPE+Ytnz3USJatGNiFMh+smpPrPZKBzOkhE0e4w938ckuavSMWx94/uhmyD3R9vL15Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw6Hfo+54Pc+qXndrns+KABdrH5scURutqdbLFo5i/pKQ+f5D8
 rzuX7aJ3LaoEJvLaSV4MTd08SZ/wLMEzOfvIUUdclWhiRH3QbVx3
X-Gm-Gg: ASbGncs4eUS6C5NOmOUoBO2gwEFaWMHp/2pBIyYNrXUkSbt8yW8he+wvzoXrrgBjOs3
 62OeYF9zVAryw9+cN6kf7Gv2yb8+oe3880T2K+AfTvRDYP8g/K4Zh+6XzPrydKfbUrehYSqqfSq
 BUnc5f13M+0/4IV1eKIpZOfp2utq39GNSrzGP1R8trmd8mKXXb4NrNOHPwNl50emNUpjaaeLT0B
 PfF0S7GyEFe2obZMZE7N69P83I2JykvrfcKJYwbh7xTnMswA2jEOdVz8HzwwL5xdKYVYrsg6jp8
 2eiHf64Wkqba3rJ/Eg==
X-Google-Smtp-Source: AGHT+IEEW0iAE4qEj9av2UeE33E//jpTafczPlcz+BtPwrsJYFsIUM8ZKgX34LtrMnVDl4nvC1vyPQ==
X-Received: by 2002:adf:b34b:0:b0:38f:3e0a:ca6a with SMTP id
 ffacd0b85a97d-38f3e0acb08mr5579751f8f.2.1739873542277; 
 Tue, 18 Feb 2025 02:12:22 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm14749720f8f.66.2025.02.18.02.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:12:21 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 01/14] drm/vkms: Extract vkms_connector header
Date: Tue, 18 Feb 2025 11:12:01 +0100
Message-ID: <20250218101214.5790-2-jose.exposito89@gmail.com>
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

Up until now, the logic to manage connectors was in vkms_output.c.

Since more options will be added to connectors in the future, extract
the code to its own file.

Refactor, no functional changes.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Makefile         |  3 +-
 drivers/gpu/drm/vkms/vkms_connector.c | 50 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.h | 17 +++++++++
 drivers/gpu/drm/vkms/vkms_output.c    | 41 +++-------------------
 4 files changed, 73 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h

diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..6b0615c424f2 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -6,6 +6,7 @@ vkms-y := \
 	vkms_formats.o \
 	vkms_crtc.o \
 	vkms_composer.o \
-	vkms_writeback.o
+	vkms_writeback.o \
+	vkms_connector.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
new file mode 100644
index 000000000000..fc97f265dea6
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_probe_helper.h>
+
+#include "vkms_connector.h"
+
+static const struct drm_connector_funcs vkms_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int vkms_conn_get_modes(struct drm_connector *connector)
+{
+	int count;
+
+	/* Use the default modes list from DRM */
+	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
+	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+
+	return count;
+}
+
+static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
+	.get_modes    = vkms_conn_get_modes,
+};
+
+struct drm_connector *vkms_connector_init(struct vkms_device *vkmsdev)
+{
+	struct drm_device *dev = &vkmsdev->drm;
+	struct drm_connector *connector;
+	int ret;
+
+	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
+
+	return connector;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
new file mode 100644
index 000000000000..beb5ebe09155
--- /dev/null
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _VKMS_CONNECTOR_H_
+#define _VKMS_CONNECTOR_H_
+
+#include "vkms_drv.h"
+
+/**
+ * vkms_connector_init() - Initialize a connector
+ * @vkmsdev: VKMS device containing the connector
+ *
+ * Returns:
+ * The connector or an error on failure.
+ */
+struct drm_connector *vkms_connector_init(struct vkms_device *vkmsdev);
+
+#endif /* _VKMS_CONNECTOR_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 22f0d678af3a..b01c3e9289d0 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -1,32 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "vkms_connector.h"
 #include "vkms_drv.h"
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_probe_helper.h>
-
-static const struct drm_connector_funcs vkms_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int vkms_conn_get_modes(struct drm_connector *connector)
-{
-	int count;
-
-	/* Use the default modes list from DRM */
-	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
-	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
-
-	return count;
-}
-
-static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
-	.get_modes    = vkms_conn_get_modes,
-};
 
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
@@ -73,21 +49,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
-	if (!connector) {
-		DRM_ERROR("Failed to allocate connector\n");
-		return -ENOMEM;
-	}
-
-	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
-				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
-	if (ret) {
+	connector = vkms_connector_init(vkmsdev);
+	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
-		return ret;
+		return PTR_ERR(connector);
 	}
 
-	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
-
 	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
 	if (!encoder) {
 		DRM_ERROR("Failed to allocate encoder\n");
-- 
2.48.1

