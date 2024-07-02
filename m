Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C9924AC9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855D010E725;
	Tue,  2 Jul 2024 21:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D3docQFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9985210E729;
 Tue,  2 Jul 2024 21:59:34 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7eba486df76so882039f.0; 
 Tue, 02 Jul 2024 14:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957574; x=1720562374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3JTbEivvcQUwAcXrAriYcuJGP77J1qAidh1sZIrKRVg=;
 b=D3docQFfVqACrI0Q5tapAYbw/UAj5TDORLVUlq/CCUnPwt6xqTJPrVozuzqfNA+2jx
 sjDlThH0rSsegx/yFsqwrtNQSq2IECfbuHp0JajnnhwhPqwkSjfNaba8RiecE/ODybvc
 nYaKNITFX7P72cm6JQovj1gu2NmKkPG8GBv35MxAu6Q+jwtFR8vUGLkJR5rAMlKBKmBx
 xH6oJJqJkT1AEyBYJn+KYcIW4l/uO3fUXkfnkbVTVWANpntUHF/xOZtBKwwoBz0yVBYP
 nmnQDffvC71QUtHCTKKLa3ee/oLs1qrcPxGK/Fmjtj5UZELb9P5Ib1gfsTIcZxdzFoQB
 zbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957574; x=1720562374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3JTbEivvcQUwAcXrAriYcuJGP77J1qAidh1sZIrKRVg=;
 b=gml+9iMJ2ZyEADYwKfJSkIrwozNq1XU+VfwydQglsBUOjU3nvq5I/tmIV+mC1/XTMI
 gvzYzQ9q7Yiz1Ebl0wH5fS7rvLp4UQLspYKzYiuP1TIcWI3otWqj7Al+7WlX3R3CnuPq
 tXpCEQRwyF+awq9j6PMWGxZM6vJIVMft/5PXL51X37x0/rKYlx/pTvQi7T9SC/+tH2eG
 /6h0xQhoTOApz9oVY4Lc2D8glvz2s/TWaIJMhheTy3fVq6jB53etkv9SxVrORMj/QzZ9
 ThH5PxBr/Z03tDie8mIz8nR/8yq2CZ4vYbg22ySkaFWsnlJEpieKALD1YLqheNAN813N
 ZlkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJHwwpr81Nn+/RYWGXoeJHZuz761XI/k3Fwp747HyVYiW5U4wkYGKWxroBye+r336LaNlBfBf1bXV6t0Cogh13LPBLq5aMP5neRNWN2CYo7+FTGZcNngZ28+C/iLUjIq0BHDbZbOyjxAM9dErTO0zpvZ6a7QXMsp4Cts0775MfH9P8syATOaej8b9bEnNEvZzK4/YqbpGg5J4UopdNPpPU7N2ocU5fUwAYCJoHcCF6YI4X4GE=
X-Gm-Message-State: AOJu0YyOM8xOjuyqCY5S9fmqJDv0wqOjbWO0woa89InA9adP1ude5voY
 ur0czzk+WRL0hzfLIRailiT3AYHpXQd8OG9PryvoNRHjJHLxPjq+
X-Google-Smtp-Source: AGHT+IHm0jXqTVtk7QVjjSb+zomWmd/7d6iWmMvK3abb0BF2wBUE0rEZf9n+FnhAA07EmTqJ9TZwcg==
X-Received: by 2002:a05:6602:45b:b0:7f6:4c8b:efdc with SMTP id
 ca18e2360f4ac-7f64c8bf2a0mr206658639f.2.1719957573878; 
 Tue, 02 Jul 2024 14:59:33 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 50/52] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Tue,  2 Jul 2024 15:57:59 -0600
Message-ID: <20240702215804.2201271-70-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index beee5563031a..1971bfa8a8a6 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -65,6 +65,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.45.2

