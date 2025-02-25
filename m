Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50BAA4494A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D3210E788;
	Tue, 25 Feb 2025 18:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DAQS234X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07CB10E6EE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:55 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4399d14334aso52021035e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506394; x=1741111194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIdjBnojDe9JlRJkQtXkq6PiLeEhZjPQxZt/O+Cfesg=;
 b=DAQS234X21iJx4/WMVP3FsirgwB+05ytsU+AB2ySSxQkfjmQKR719/48rZgdeowiLr
 vUUsb2nFgJDYrUU8oXMDprqDNYJR48nQl2lW/3ckmXWimNFz+iEAyyII+eNVZYpIoFwm
 1DH0yss+PSe1RUwsJOcr7ObfnZyVmIAo6SfywR8S2ofT52Y8Xi0G4KHq1o9nxaZE3ilF
 M97T8Oloj4CgC4b+pq98uz43PNdTbnMYCE51BD0n/WyjS+PwHRBn4yIoLHQ5fcIrQML7
 IG22SU/kLsCyxoy+tzEre8iG+BEM4xX9UOehZ7U9yDq2zuVsoNpaGktKcbO/FCflznCu
 cXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506394; x=1741111194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zIdjBnojDe9JlRJkQtXkq6PiLeEhZjPQxZt/O+Cfesg=;
 b=Xb2nOSj0Sk927ZrWRypgZP32+VRXB6XkRvtWxhqYdLfb/MA5mARH8Yd2QU4YI1RhK1
 rzuKvOlox2uIU1JW5ffgZWne4Txj17y8DwmCAmxnxqoj21sKy425lzjleZU8Gn1AkvRX
 1NiuCOM/3JN+uuJiABNfLFbh9BD2d1yA3Fp+/+gbNoZ7PxKEDBmvONQFP6IKQWKNCQYJ
 pb7dhcBSD9wylS4Zm6H2EJN0YnA8Mqt1Kb/22Fvi8DpcrT2IvB4om5er4js7u0Lief+R
 3KkE4JXkNmx5LKOPTVCRKPxs3IFdjIhN2zE1kgq9ZZEC6dI9xdJZJgbjJZv+K8bY7Pot
 aWmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUe1koJxEXRz4z/BQI7671+cWXfWHo7mWjZzaTENi2kLYRLxW8KVkWXd/JDZmQP6RoXUrz7GQwaIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzehYlL7CCukvn31yO+MVhkY7X5ZOHDDRAp/pDl2JHeJRN7agdQ
 /2/6XFUdEeXeT72/PEDrYtc60I5eYuOtdKX5t4ciTKG20wlpksG2
X-Gm-Gg: ASbGnctnmETu7kiwLKGSMt53LqS0hWPzmZFS4oMvCXH+cCsL7YCBORXrfuf7lJIBXBd
 WuYqGkfMSSALJJszsjXYKc/yxElA2Lb1vWIxzRc4676vHx5SWh/CpRdr74EzlVoNjZ2+tJlQYIL
 Y/MTxge+BxjHNi0Tr9sdE0SFtaPnf2BpLcR11FTmdH09EVmey7i7ojBdInrmeemAMy4etuUr8Vq
 CZNTdRcHPmZ1WUAmK3UPt8YpPV92+1LaOT5bCP+pVd02l6ExhUsIXXn4THK24ZBQEWwKfrvXbLl
 XTGkkUbMlAC8rgsBotIm1e3+sG2R
X-Google-Smtp-Source: AGHT+IEDK6mCAOgu8hG/ZIDX6sti+i4PgULEycQ5M/TU5713F8zbTbDTErKhL+ginH4PGoNCQwXC+A==
X-Received: by 2002:a5d:68cc:0:b0:38f:330a:acbc with SMTP id
 ffacd0b85a97d-390d4fb02b6mr136963f8f.54.1740506394420; 
 Tue, 25 Feb 2025 09:59:54 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:53 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 12/16] drm/vkms: Allow to configure the default device
 creation
Date: Tue, 25 Feb 2025 18:59:32 +0100
Message-ID: <20250225175936.7223-13-jose.exposito89@gmail.com>
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
2.48.1

