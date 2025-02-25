Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B9AA44939
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEFE10E780;
	Tue, 25 Feb 2025 17:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AN9iYZay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7698C10E6EE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:43 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-439a2780b44so37917105e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506382; x=1741111182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDEi+IB29m5kaXCQs1Xh/NAR1EeJ74QIHesF2OX+9WQ=;
 b=AN9iYZay1NjfMYCeYOSvPo4mH+sWW8fj4MmVgpAxfnRjWnWSQdWnj/FUoEQMd7iCNs
 vUSUG62M/eu01wzCRxnPRrpq4vVFYObXZWmOdCCSO/OS2Quef0jhtmBMMj6CeF8OypcD
 1mPhGaiIujvH+GlLWOl8nDEag6rONm8zo8Czny1kKgsbAhJopjqzrARPMafxpOYrjRNo
 KQb52rgBWbvcqi7bDjpPQTsQ3y16Zgcq8V6DBHn1vm2N2rfHpSlDeK5N7eWXnfhyGV1w
 8Lb1YED252QnjhPVog+YNCfYcZKmalWruOBEZgv4Dz5yUy2U5JtnVPWMEQAnuwJtOCyL
 PjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506382; x=1741111182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zDEi+IB29m5kaXCQs1Xh/NAR1EeJ74QIHesF2OX+9WQ=;
 b=b+DFCmfbBDUTRmuiuWS2mmA7ZQcEaQCs+/tDYcWfDAhqWxWYKptFwyxcUMi/CsAWFw
 HM0KPz+qd3YOQqeC6RMcjB/AxYawbkFb2szU64K1Hvhr/WTJcmj/5v4KXzFAVv1kCzYz
 Gds70jDwK+FZgUrnSTAiLqaE801f2jbZYhlpnxT5ryoLMOAs0DEIOP/PVTzqUhdmrAK4
 Q8KqOjF6xVuk0CReIoRt1+OrXyHQFiNYO+mVzqwH2mfU5z/dKqwQIaupoiAS2PL2c1QT
 olE9nkweAQnDHehTqCBrA/uwLvlKaBdeFBWn4C4dmjA9CZueQs0/WBikwzc/sSL81IxE
 KlUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1k/vDcTTFLw1dfLYJ/cuifxsEalAxrVdRbBf+1KUxHmf4bUTq9HOsSDSeaB8gSxcoXWTPfqq51OM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJplU3vzWfOA2kCBXaRbhLULjFvl0PBoJmNsfD+10YNw76LfBK
 m03CHh9cdIlI7lCCvDlSKoMbkuiEG7qgAc7zk51Es7gktFnMOYKQ
X-Gm-Gg: ASbGncsMSM1gfi4CJsW2NK0L1YWR4X/aTFwP0N1bxubATOLjQ3Kben5LcdX8EoAQhrF
 +gS0MqQKUXTR6JyVtCw3HVFENbeczyCsgnTQwusQcwhfvsmR0oTwho5Q8kKYsIK75D5fuRwckpA
 9yBoPaq7JfownyfDDXkzpztfYgESCUUk5qlkxVbkKVlG2O8I/Ol97TFGoiTrywM33yPQ8MI9lM9
 vbxp5+yDzU32t55zpFj/b+M7yb5XKl9rNIrI4abpprGxwTkQrvR4uEh5hv7Vpm6zUAr1RLj1qya
 6t9C1B9S3nu6cQdHTmcDnHkbma7S
X-Google-Smtp-Source: AGHT+IGLk9bjzumLU58MNpaygHhKj7RjQYegcaCcfgsinAKj5M6r6P6pmCzsRocIk9CriKFeU9tX1A==
X-Received: by 2002:a05:600c:4f0d:b0:439:98ca:e3a4 with SMTP id
 5b1f17b1804b1-43ab90169d5mr4187105e9.19.1740506381786; 
 Tue, 25 Feb 2025 09:59:41 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:40 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 01/16] drm/vkms: Expose device creation and destruction
Date: Tue, 25 Feb 2025 18:59:21 +0100
Message-ID: <20250225175936.7223-2-jose.exposito89@gmail.com>
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

In preparation for configfs support, expose vkms_create() and
vkms_destroy().

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index a24d1655f7b8..23817c7b997e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -146,7 +146,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev);
 }
 
-static int vkms_create(struct vkms_config *config)
+int vkms_create(struct vkms_config *config)
 {
 	int ret;
 	struct platform_device *pdev;
@@ -229,7 +229,7 @@ static int __init vkms_init(void)
 	return 0;
 }
 
-static void vkms_destroy(struct vkms_config *config)
+void vkms_destroy(struct vkms_config *config)
 {
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index a74a7fc3a056..2ad8e3da3b7b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -223,6 +223,26 @@ struct vkms_device {
 #define to_vkms_plane_state(target)\
 	container_of(target, struct vkms_plane_state, base.base)
 
+/**
+ * vkms_create() - Create a device from a configuration
+ * @config: Config used to configure the new device
+ *
+ * A pointer to the created vkms_device is stored in @config
+ *
+ * Returns:
+ * 0 on success or an error.
+ */
+int vkms_create(struct vkms_config *config);
+
+/**
+ * vkms_destroy() - Destroy a device
+ * @config: Config from which the device was created
+ *
+ * The device is completely removed, but the @config is not freed. It can be
+ * reused or destroyed with vkms_config_destroy().
+ */
+void vkms_destroy(struct vkms_config *config);
+
 /**
  * vkms_crtc_init() - Initialize a CRTC for VKMS
  * @dev: DRM device associated with the VKMS buffer
-- 
2.48.1

