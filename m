Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6CFB8F3D7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 09:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7989B10E3C2;
	Mon, 22 Sep 2025 07:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IlQKsRne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E4010E38F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 02:57:42 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-77f429ea4d5so132350b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 19:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758509862; x=1759114662; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Hn5nOt3o6tJ4bZAjN+4kfHo/FZFsXJw50TfEglXGXQ=;
 b=IlQKsRneeXknaXYz4BGIYhvJNAZEAdGh69QwjXZ4p7o6MXGzvOMfO5D0o/Cm7MObkX
 lOVnDuOFXbG6pdwjs7hS/2NE/1C629/9bdunLAZJjS0dcEMyHDiFmNN/4pEXC4+d2jxK
 SCGE9XeiR01jK6ncUQGxnXajX9n0PFllXrGKWgpbaFvE0nbKB5ke9JoVTQFC2Wgww4Im
 4FKFYmmfl5vuj1+c11h94PtUPzW8IVQOP1hWEhXQcOSsEyWet4xqgikOdgK9asC2VSzY
 r5kh+wxglmTaKsfarp/86uCcFbzBZQH+ZzmHwRKCS77WzkR7amzs+o6Pi6M50+xjjfwW
 juFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758509862; x=1759114662;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Hn5nOt3o6tJ4bZAjN+4kfHo/FZFsXJw50TfEglXGXQ=;
 b=weag2WANwNXiNisUu9dkeeF4eDPoXiQf1VMvvUTwKbZDuQY/VGAIIZ/Sp38weU9j9S
 hO1dIAzRTYzb3+r5rbPFzJtEp9jMZ1D9dmzXyOD63bHdml5p3xUMnpl7f6PHSuvFxu3B
 2CNEN7g9l+2azI/j1UgBlGV+t2VSmu2QdnWX4R3bWUc0nfsl7RSJZiih90UOnMbtDUjg
 UjQb3GxT9R3ofwRS70Mmzutuo+jlloqYYrGiKuar03wOlWws1mD0izpZ+TydSsD9sk2r
 4OPja/xRddLpakoG+P4YaJIUKXdHYJPmzhLKd9bp0cUP7+TqOP/XDJhytZNUVuW8zgQk
 1AUw==
X-Gm-Message-State: AOJu0YyaWcP1GHFTgtqBfIndLoOJxFaRvfZ/81faK5MC8zFdttC3EC4Y
 4pbOW978EW7/YCl2bcKgjsifdz91mCQurBTiGunmNGuOEexDjeBftKcZ
X-Gm-Gg: ASbGncvzXMO7xbffovyeRf64JNfxgo5hlRfYxe0mRqiAP5ZByCT9ykC5jx5159yzT9e
 6NtqS/7GV7sQWlEbqGLOcTk0eLEgu2I8hMHyu8U6S//6i6e7DUOOg+oiUqpEsLI7WMieawYfz6l
 4ifMGOd/aEzRUdH60e86lW74juiHtZs3MWTtkW09jgwDt80NspBxkkSISgbPg91p95ya48Pt5yc
 P+Uy04be9jZB1EYAjEQA3cnWJ7N3rhNLOGVeCqR50Q2YGk540CPfCqP5x7lvu5mPkzDFW2mt2eC
 uzOaacILyiINoAPj7E5aO6YfNTNgcZ6dwXkYDN/27PSWct/GF9p/s6Na0+4Vdx7oIV+erm5pX6U
 2xVh6Nwaw7KphyqiMF5LAQ00oPWdcwxgR5hP7/MEL6WKwE8LPrBpMm9Z86mOwrA==
X-Google-Smtp-Source: AGHT+IFjMgNZjpmTloPgv57R4zc0ax4KAplY7viQDnpXjQ6wfKrJH/nZWUk7ml/DBLF/33o3g5U24w==
X-Received: by 2002:a05:6a21:3384:b0:24e:95c2:907f with SMTP id
 adf61e73a8af0-2925ca294famr16240784637.2.1758509861552; 
 Sun, 21 Sep 2025 19:57:41 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b55156734a4sm8343111a12.4.2025.09.21.19.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 19:57:41 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Mon, 22 Sep 2025 10:57:34 +0800
Subject: [PATCH] drm/tiny: pixpaper: Fix missing dependency on
 DRM_GEM_SHMEM_HELPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-bar-v1-1-b2a1f54ace82@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB270GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMj3aTEIt3kFMM041QLY5NUcwsloMqCotS0zAqwKdGxtbUADCz+SVU
 AAAA=
X-Change-ID: 20250922-bar-cd1f3e834e78
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758509859; l=1838;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=4a8JeN2uyVnaN5neLm35KD+FvaZjZ1l+wsL+PM10Ld0=;
 b=b2Lz634TMQd2uje5PtB9StbLsC7xXco/bfRnNf9wPOoWFtgWCIadUantM2fog7BKUmxtP9X+v
 U2tYq/DQszsAWnhkk8gWhWyDL9INPMlXvg/Mup2H6pGP+qeJ0FcxX3Y
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Mon, 22 Sep 2025 07:13:37 +0000
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

The driver uses drm_gem_shmem_prime_import_no_map() and
drm_gem_shmem_dumb_create(), but the Kconfig currently selects
DRM_GEM_DMA_HELPER instead of DRM_GEM_SHMEM_HELPER. This causes
link failures when DRM_GEM_SHMEM_HELPER is not enabled.

Select DRM_GEM_SHMEM_HELPER to fix the build.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509220320.gfFZjmyg-lkp@intel.com/
Fixes: c9e70639f591 ("drm: tiny: Add support for Mayqueen Pixpaper e-ink panel")

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch fixes a build failure in the Pixpaper DRM tiny driver caused by
a missing dependency on DRM_GEM_SHMEM_HELPER. The driver calls
drm_gem_shmem_prime_import_no_map() and drm_gem_shmem_dumb_create(), which
require CONFIG_DRM_GEM_SHMEM_HELPER to be enabled.

The issue was reported by the 0-day kernel test robot. This patch updates
the Kconfig to select DRM_GEM_SHMEM_HELPER instead of DRM_GEM_DMA_HELPER.
---
 drivers/gpu/drm/tiny/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 94a5bf61a115929640022128e20c723ab7c0e735..7d9e85e932d7fd7bdb6ad7a4c6ba0f835841f623 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -86,7 +86,7 @@ config DRM_PIXPAPER
         tristate "DRM support for PIXPAPER display panels"
         depends on DRM && SPI
         select DRM_CLIENT_SELECTION
-        select DRM_GEM_DMA_HELPER
+        select DRM_GEM_SHMEM_HELPER
         select DRM_KMS_HELPER
         help
 	  DRM driver for the Mayqueen Pixpaper e-ink display panel.

---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250922-bar-cd1f3e834e78

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

