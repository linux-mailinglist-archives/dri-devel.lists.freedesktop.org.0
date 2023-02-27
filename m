Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC396A41CC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 13:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEDC10E03A;
	Mon, 27 Feb 2023 12:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F1710E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 12:38:41 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id l1so5966896pjt.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 04:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:subject:to:date:from:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=knY8erri7Al7Rbw0Mlzq10z3XLQCpm6GRDGhp6tSwts=;
 b=fXMH3+1o3+BJ2szxXx3b0iQyiTiVOTXmeFKZeaqJZ1JU/CX9es95LdKY43NinQgRsN
 4JG/3xfV24tbvlcK7ymobth8Oey+sBEJlZypNl3cuERr7cp94QMRVFsMEfc51qSoBsu+
 K/eXbZv/f4lg3km11+rL7+ow+XOXh0ld7GNFwUJxv2+/PHB0l5+/E9/SYyVoa97WvieV
 QakiAX+XBUwIxUUWgKGqBz41KoVjl2ii3xqqBD7ClcSvERS7cggDYh8MpEL3B1c01oYl
 JAnq+Qxkv/b/ivQR6DUgLqri0Ju6eNWfiv+uK0Mn8sPhr1Q5I0ZxrEWPOFEwbXLip1E+
 ibTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:subject:to:date:from:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=knY8erri7Al7Rbw0Mlzq10z3XLQCpm6GRDGhp6tSwts=;
 b=kJvnBABLTNF6jZ1z2YcZYTs3aa/n15hRYVaUEsvnOGmPYR4KcU9BucvVQ4Ra65oRhC
 97bDQCzafXMDHiuVbzk+B6HcDlG5oy5zURGhVParjPloeiD1lvaKuq7tIASeWvRd5ZHH
 H8zicJ0vqZ01lwr6mOfAkqpLU+HXww22dyLgatf1eSt+ploLNL5aHhsUQW586HHGcBi5
 3AqBj4Ojo94IDRmMzN1MSw6MtKcdPVEbIJYsO868g5XIVOz9XB/Kgc3iz+qwBHUBx4t8
 5hOa/30pKydx9oXgWK/tB1me1DFd2t3NCtiiIYxtF/eMiWXbNUYoOPP7/EdziGcps3b8
 uQ8A==
X-Gm-Message-State: AO0yUKWoZDySeOn5/fdpiugGQhPHRH/Sx88MEYMQa0luy8OoaDet1TvN
 oZ6eyP9X/elrXwdfPVgj+MI=
X-Google-Smtp-Source: AK7set8kx3J/O+vfdEgH/w3+9Wpj+8KdJek3C4qPhbE/x323eGgBYYX6cc5sIq5PFSMvr32lTztNQg==
X-Received: by 2002:a17:903:234b:b0:196:595b:2580 with SMTP id
 c11-20020a170903234b00b00196595b2580mr29689685plh.0.1677501521385; 
 Mon, 27 Feb 2023 04:38:41 -0800 (PST)
Received: from sie-luc. ([124.89.8.225]) by smtp.gmail.com with ESMTPSA id
 jd1-20020a170903260100b001991942dde7sm4522195plb.125.2023.02.27.04.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:38:41 -0800 (PST)
Message-ID: <63fca451.170a0220.3cfe.698c@mx.google.com>
X-Google-Original-Message-ID: <20230227123743.GA25685@sie-luc.>
From: Luc Ma <onion0709@gmail.com>
X-Google-Original-From: Luc Ma <luc@sietium.com>
Date: Mon, 27 Feb 2023 20:38:36 +0800
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vram-helper: fix typos in vram helper doc
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Fixes: a5f23a72355d ("drm/vram-helper: Managed vram helpers")
Signed-off-by: Luc Ma <luc@sietium.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index d40b3edb52d0..f1539d4448c6 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -45,7 +45,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * the frame's scanout buffer or the cursor image. If there's no more space
  * left in VRAM, inactive GEM objects can be moved to system memory.
  *
- * To initialize the VRAM helper library call drmm_vram_helper_alloc_mm().
+ * To initialize the VRAM helper library call drmm_vram_helper_init().
  * The function allocates and initializes an instance of &struct drm_vram_mm
  * in &struct drm_device.vram_mm . Use &DRM_GEM_VRAM_DRIVER to initialize
  * &struct drm_driver and  &DRM_VRAM_MM_FILE_OPERATIONS to initialize
@@ -73,7 +73,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  *		// setup device, vram base and size
  *		// ...
  *
- *		ret = drmm_vram_helper_alloc_mm(dev, vram_base, vram_size);
+ *		ret = drmm_vram_helper_init(dev, vram_base, vram_size);
  *		if (ret)
  *			return ret;
  *		return 0;
@@ -86,7 +86,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
  * to userspace.
  *
  * You don't have to clean up the instance of VRAM MM.
- * drmm_vram_helper_alloc_mm() is a managed interface that installs a
+ * drmm_vram_helper_init() is a managed interface that installs a
  * clean-up handler to run during the DRM device's release.
  *
  * For drawing or scanout operations, rsp. buffer objects have to be pinned
-- 
2.25.1

