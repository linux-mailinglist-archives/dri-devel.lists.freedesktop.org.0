Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE678C05D81
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4FC10EA29;
	Fri, 24 Oct 2025 11:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N9TvZp0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E60710EA29
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:15:29 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47112a73785so12518305e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761304528; x=1761909328; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tjnWrdwJJM6Xkd6ejbGWp0lF4mtBxwGKExhzOcwx4QM=;
 b=N9TvZp0xCciirgSHC/B1UA7kAH/Nzc4vaD0mOWkUurpIBWBRL09KAzYauN2b30R8ar
 9iJ1mrseVjGUB3g+EQVseExMCL8z7uRR/GqT4lUJbSIEbVTpXRfgrVHDiJhzoVPK1hGj
 rQHt7MWsJXmy4Wgkk0CXXz/9XlhkUX/Fo7gS2v3ibuPWKPY8QdmqlQG4wBpWrBwFQNNL
 z6UkUM12VNRu4acOj/OV70xUNM7zrM6Glys3xezB5rmpDHFDNCWDXzVrW2ANTEJzQVok
 5JOwCF/i+sR852PIoplju7+maYEFBIdU6eV4orJOk/mNM5VNrug3zTfz2EIQ2+ZZ+j02
 WajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761304528; x=1761909328;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tjnWrdwJJM6Xkd6ejbGWp0lF4mtBxwGKExhzOcwx4QM=;
 b=dyooXkMQ4/e6y181il0p74wMphKlG7p53K3G4iF08lxIOiVV97eR3nvUCi4CNafiPF
 dxJxBKc+lQgJVvfhsVRSsm2nxIpk8LzmkIpZy2NGra0EbUm5NqdEcvQN78f2GLUnjGqT
 UTRBjUfogCmhpL9VRlrRayPJMT/nmADUnDkbB1LJymwbtL7If1CZwhuRaTXZcvwWi6oN
 YUQJpYKMmIhaqwj9eu50X7130NVj9sEuppTBK1d/eQUINByH5IYhNDbFVlhvkYdKEmaf
 ncOEMMvzhiwtXoiqVCQs8e3egH8EBwU5DRoMeL60b66wGwAaji+4fBnDhQ7GJ1VZv/00
 4jBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvzfKvYVjbwgidQFHitka2ejFnFDoz2gkn9dq6OnhTsEWTC5YC2o6ijoLDYC7WxHNpCZ40E+yfEz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBvnXpsevHUvAmxkbPSsz9sLYTQqNbbsor2j+NQcvVDSFvq61p
 ylcvnkctz27+phfUqwB+QGasbleeY5oKUVi+vMjUJ0GsqzpHE1iCPswht4UmjkFcuJA=
X-Gm-Gg: ASbGnctHk1zrMxWdNS7lxD/34fEQ2SV4ILbVDOiTOQkAkRLzpfc83mz8rcptRY04ngS
 X1ntndTEI8z4iNHWT9+D9yaLg/TXuN86LMjdA9LANtzkEloc63bBNcaAZLuSaGQqUSzT5glpbkd
 YpsRTMXIngD0y3gPoSViFXzEywDSRWVLSsZbypj7f+QNzT0RBJJI0yH5JBjboWrb2+dwl0qkE+Y
 a4RSOiNVSSpBj5tXU5vreTs7fQvW5a//ZQ0xKsljWK86yAtwG7yFut9Hc8vvFZQZaIUiBBCu0Sx
 1STvCq3JKRpADceqiUgCwT49KjNUCerwT+AITIXuTxKUP3gsq+0w7Z2i9WLcsW2r1JD8UxfKVtH
 a+2JhqnvCdx4swyhBBN1FvjatW7hYnb4Zy99+RRYNrEyhFW0AXVMYvqtsVPSCw3BotMeNexX5gA
 W0bypIHg==
X-Google-Smtp-Source: AGHT+IHppQw7OhXyE1vh506SaVqjXNUIJ+8VzvhstGEr4RfM3xhdsHlPAMgvjfWhOUYwQyK4GXMIgQ==
X-Received: by 2002:a05:600c:5287:b0:46e:6a6a:5cec with SMTP id
 5b1f17b1804b1-47117876738mr245432555e9.2.1761304527664; 
 Fri, 24 Oct 2025 04:15:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-429897f5696sm9120866f8f.14.2025.10.24.04.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:15:27 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:15:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/vkms: Fix use after frees on error paths
Message-ID: <aPtfy2jCI_kb3Df7@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

These error paths free a pointer and then dereference it on the next line
to get the error code.  Save the error code first and then free the
memory.

Fixes: 3e4d5b30d2b2 ("drm/vkms: Allow to configure multiple CRTCs via configfs")
Fixes: 2f1734ba271b ("drm/vkms: Allow to configure multiple planes via configfs")
Fixes: 67d8cf92e13e ("drm/vkms: Allow to configure multiple encoders via configfs")
Fixes: 272acbca96a3 ("drm/vkms: Allow to configure multiple connectors via configfs")
Fixes: 13fc9b9745cc ("drm/vkms: Add and remove VKMS instances via configfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 07ab794e1052..506666e21c91 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -204,6 +204,7 @@ static struct config_group *make_crtc_group(struct config_group *group,
 {
 	struct vkms_configfs_device *dev;
 	struct vkms_configfs_crtc *crtc;
+	int ret;
 
 	dev = child_group_to_vkms_configfs_device(group);
 
@@ -219,8 +220,9 @@ static struct config_group *make_crtc_group(struct config_group *group,
 
 		crtc->config = vkms_config_create_crtc(dev->config);
 		if (IS_ERR(crtc->config)) {
+			ret = PTR_ERR(crtc->config);
 			kfree(crtc);
-			return ERR_CAST(crtc->config);
+			return ERR_PTR(ret);
 		}
 
 		config_group_init_type_name(&crtc->group, name, &crtc_item_type);
@@ -358,6 +360,7 @@ static struct config_group *make_plane_group(struct config_group *group,
 {
 	struct vkms_configfs_device *dev;
 	struct vkms_configfs_plane *plane;
+	int ret;
 
 	dev = child_group_to_vkms_configfs_device(group);
 
@@ -373,8 +376,9 @@ static struct config_group *make_plane_group(struct config_group *group,
 
 		plane->config = vkms_config_create_plane(dev->config);
 		if (IS_ERR(plane->config)) {
+			ret = PTR_ERR(plane->config);
 			kfree(plane);
-			return ERR_CAST(plane->config);
+			return ERR_PTR(ret);
 		}
 
 		config_group_init_type_name(&plane->group, name, &plane_item_type);
@@ -472,6 +476,7 @@ static struct config_group *make_encoder_group(struct config_group *group,
 {
 	struct vkms_configfs_device *dev;
 	struct vkms_configfs_encoder *encoder;
+	int ret;
 
 	dev = child_group_to_vkms_configfs_device(group);
 
@@ -487,8 +492,9 @@ static struct config_group *make_encoder_group(struct config_group *group,
 
 		encoder->config = vkms_config_create_encoder(dev->config);
 		if (IS_ERR(encoder->config)) {
+			ret = PTR_ERR(encoder->config);
 			kfree(encoder);
-			return ERR_CAST(encoder->config);
+			return ERR_PTR(ret);
 		}
 
 		config_group_init_type_name(&encoder->group, name,
@@ -637,6 +643,7 @@ static struct config_group *make_connector_group(struct config_group *group,
 {
 	struct vkms_configfs_device *dev;
 	struct vkms_configfs_connector *connector;
+	int ret;
 
 	dev = child_group_to_vkms_configfs_device(group);
 
@@ -652,8 +659,9 @@ static struct config_group *make_connector_group(struct config_group *group,
 
 		connector->config = vkms_config_create_connector(dev->config);
 		if (IS_ERR(connector->config)) {
+			ret = PTR_ERR(connector->config);
 			kfree(connector);
-			return ERR_CAST(connector->config);
+			return ERR_PTR(ret);
 		}
 
 		config_group_init_type_name(&connector->group, name,
@@ -756,6 +764,7 @@ static struct config_group *make_device_group(struct config_group *group,
 					      const char *name)
 {
 	struct vkms_configfs_device *dev;
+	int ret;
 
 	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
 		return ERR_PTR(-EINVAL);
@@ -766,8 +775,9 @@ static struct config_group *make_device_group(struct config_group *group,
 
 	dev->config = vkms_config_create(name);
 	if (IS_ERR(dev->config)) {
+		ret = PTR_ERR(dev->config);
 		kfree(dev);
-		return ERR_CAST(dev->config);
+		return ERR_PTR(ret);
 	}
 
 	config_group_init_type_name(&dev->group, name, &device_item_type);
-- 
2.51.0

