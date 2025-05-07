Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8CEAAE18F
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2652F10E803;
	Wed,  7 May 2025 13:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N7E065jS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E36E10E7FE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:54:51 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso67141505e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746626090; x=1747230890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YuRwz8f2hm9m7I6mJzRn6e33kisXWPP7uKIXupdFzE=;
 b=N7E065jSbZJ2SS268Hv97g5J4oIPvcdrUjBwD6Yygy8S4ucO8pi5yUCOgrYVOXrUC2
 WtStp0zhPPhRYZJeqXKykEVGS3XuwF8ZfRnkWMCOhjuBZuuDP0eDjcE3dzcPg8zyWV4S
 OHgQN2xbfhJO1UfqZi0eAs1uFDm+TtCgrIiVxu5WBg/waORyrnFmUP4sis+tNzszB/1i
 pp22Bs1UMgRrFdshaFX4158zOE2YNC8ySX8YBwfCeb84vUsazgda+gIwKJiLjEVIPNc2
 H2BUCzsuNOJdK98S6eOEBMRYjBjGFSMGUFuF77B0TxaRfJUL+K2n6aMrYpo+KfVec3G9
 SV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746626090; x=1747230890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+YuRwz8f2hm9m7I6mJzRn6e33kisXWPP7uKIXupdFzE=;
 b=ix+5XR3MrUvUlOstpdYveN+F/dzUwEHWFQB0a4jd2f03CLkvMjMpZ9z+CmWme0w7Bw
 BtcLkRJxcFZxT/edytr3v+2nbleoBdkzY4xmtZ9D5Zp2y+YP5ODz3n3ymoRsaX1ysiUS
 +3fz8hDAeQ5dPCRVVCeK0IHjAaeExWYAszedhpUMhqUESJs3kgGWy2UoCU60aOKQ8xel
 Z6MZB2UNlO7bF1Sq7CIYXcE2tYwFD4G4BL+L5qZ/6DHIV6oN7649oJVGTZaPFX2ufszc
 t7uwMnohreF+w5AV4ELjuNFcBx/GTFUQsamxDzmAADTpb4Di0vEQlv/xbcLNHRS7v6Qt
 ADMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnpy9caX2ADbmDF5tcPsq3GTUBSX10Mo7erKIeUI39VH53cJe99UD3PUu1orYkarzIlHmonk4GTrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFK3HxjarNh12pHJ4n0VddTJ3I+/ORL/Ko4RzXAVspL2GwYN5f
 eL2btfUaA6YWC9yXIrMGxVs90p8BbLc8gnTkdE3qVTX8tcrxINdn
X-Gm-Gg: ASbGncs+zt3SaF6/VyZ79EEkHNmhRNsA9Qn/8YaWRMffejnxw7XfA1LTmK9Vu7W93SV
 J1vP1V8J7YdePMQbcLxkg5FJo590Am1ZJqATtpVODlhh3ZcbSwKkvsDyGv/OgtP3hfbCxXQXZV/
 NVM69/mQuSF1g0cxB7UaLTQLK+JKLEMXBtqKf0yIUiHYNKP6fOz9rmESVYYr5y+8BATVmF1L4g6
 iYsmUZ3kpqbOeZtphVFudiieejzCy0pLTpmwjQPYWbf3Wvvsjgtth2Zgw9BaY9BbeNiwL8zpKz4
 B/XmAnivj1/EukHwZdsno/H+qte/IivmZD49BBKpvg==
X-Google-Smtp-Source: AGHT+IGgEkenNlvKaapknt+N0+kCv1udjBqtfUNTUtiVhvLQ4hCJxf/W2wwohiE2nA/36QexVoD1Jg==
X-Received: by 2002:a05:600c:4454:b0:441:b19c:96fe with SMTP id
 5b1f17b1804b1-441d44c3353mr31394405e9.10.1746626089945; 
 Wed, 07 May 2025 06:54:49 -0700 (PDT)
Received: from fedora.. ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:49 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 12/16] drm/vkms: Allow to configure the default device
 creation
Date: Wed,  7 May 2025 15:54:27 +0200
Message-ID: <20250507135431.53907-13-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
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

Add a new module param to allow to create or not the default VKMS
instance. Useful when combined with configfs to avoid having additional
VKMS instances.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5bcfbcb6c0c5..b4ed19c97576 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -50,6 +50,10 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static bool create_default_dev = true;
+module_param_named(create_default_dev, create_default_dev, bool, 0444);
+MODULE_PARM_DESC(create_default_dev, "Create or not the default VKMS device");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
@@ -219,6 +223,9 @@ static int __init vkms_init(void)
 	if (ret)
 		return ret;
 
+	if (!create_default_dev)
+		return 0;
+
 	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
-- 
2.49.0

