Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F64363D40
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 10:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A4089B55;
	Mon, 19 Apr 2021 08:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16EF89B3B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 08:18:13 +0000 (UTC)
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lYP6i-0007yh-Ej
 for dri-devel@lists.freedesktop.org; Mon, 19 Apr 2021 08:18:12 +0000
Received: by mail-ed1-f70.google.com with SMTP id
 c15-20020a056402100fb029038518e5afc5so3202797edu.18
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 01:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tZdoK9AnFm+X6XIXiCrNrIs4gAmD/r+wn1T8dtom1To=;
 b=j3H6VigHUX2uExPyMBAxbe3ITYmpaCjwY6YwupjM3hVHfpBIkcjblwUrXCgUFc1v0u
 yww0KW3RxXOkgnpCrYFlx8xfiy/E6udEK2DFMFUE0gja/kSvODxnYYYlIyOWFDQ3/pfV
 6gVNkOJMgi56xJrOxCl6Cf/EsdZu+vl3DSIgj7c+1fwOVaM/0/vA6bNVjx4menhOZFQz
 KhYpXCMjMOmmRymgf+dSs/Z7UiYr/YiN3/Wy/Hx3/eY0zskwZrlaSxanKfXlYRvS0R5f
 k7f8pj6QYkQ9zOLzjr2qpczFBLzeqe3B7qdnYSJ3WXYb+Cfe2yPQenApgTTKIsOQHIwN
 ojOA==
X-Gm-Message-State: AOAM533SREZOQhKSGifBPFpeadSkLdRk1HMSrmYarNPlRFngDvl3QaMi
 +bXSuVPGLo8ys2ufS8Nea+7lYfZ6xAQ9WN9b+PovUzmlwwQxj+CBL/WNyC4Ry7M0F0oFpe2rfF/
 IzGkVH+uaqkBjdGlxcisPHRmcrRrK9fh1kPmoaYdbpW9MlQ==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr23996825edv.44.1618820292209; 
 Mon, 19 Apr 2021 01:18:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKM9EgTFnfB1iGFoLTEYoEK90BtoYW0DSj8m9Xd9XtAHIt9z9ELEjhNtx3pNycDFhIF7NUYA==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr23996809edv.44.1618820292058; 
 Mon, 19 Apr 2021 01:18:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id u1sm12093563edv.90.2021.04.19.01.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 01:18:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/gma500: correct kerneldoc
Date: Mon, 19 Apr 2021 10:18:06 +0200
Message-Id: <20210419081807.68000-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct kerneldoc (remove wrong /** marker and adjust function name) to
fix W=1 warnings:

  drivers/gpu/drm/gma500/cdv_intel_lvds.c:27: warning:
    expecting prototype for LVDS I2C backlight control macros(). Prototype was for BRIGHTNESS_MAX_LEVEL() instead

  drivers/gpu/drm/gma500/intel_gmbus.c:386: warning:
    expecting prototype for intel_gmbus_setup(). Prototype was for gma_intel_setup_gmbus() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 2 +-
 drivers/gpu/drm/gma500/intel_gmbus.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 5bff7d9e3aa6..8a2219fcf9b4 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -21,7 +21,7 @@
 #include "psb_intel_drv.h"
 #include "psb_intel_reg.h"
 
-/**
+/*
  * LVDS I2C backlight control macros
  */
 #define BRIGHTNESS_MAX_LEVEL 100
diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
index eb0924473a21..c17cbafa468a 100644
--- a/drivers/gpu/drm/gma500/intel_gmbus.c
+++ b/drivers/gpu/drm/gma500/intel_gmbus.c
@@ -379,7 +379,7 @@ static const struct i2c_algorithm gmbus_algorithm = {
 };
 
 /**
- * intel_gmbus_setup - instantiate all Intel i2c GMBuses
+ * gma_intel_setup_gmbus() - instantiate all Intel i2c GMBuses
  * @dev: DRM device
  */
 int gma_intel_setup_gmbus(struct drm_device *dev)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
