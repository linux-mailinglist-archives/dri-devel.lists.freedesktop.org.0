Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989195AD764
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C16010E43F;
	Mon,  5 Sep 2022 16:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDE810E448
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:22:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j14so13782359lfu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=+0xeOKHeEO3SBUKrEEK5P9cL03hyW/hh1gDx90V1FJ8=;
 b=hassXCF0UPyuA9rznKo+hnKS0oBrZ9VJmU6fNR8XjFYPHTg1vaMLmB2WqXF5LeekbP
 6F1V3RZhukCO9+R0Urs7qgq4rMtEBw4NH1r+con2nefnoDixMmwLc3E4v7732fUI9LRg
 COhXS0SDbPIppB+MHgYVciyNYGDUY+j6AcslcZIqV1r/Dy01cR7gGPrCHjzt9aCZxdwi
 IfEOm1XudUTaIadW0U401DTXzRcTvwEnZIfqzeP+U5i03o0pCCFRhzN25wn2fw7wUBab
 MKYmV7vjUR6kqL7Z9yiOHk4Q4lkpeazeU9VFzJNdG+vns8FLVbZ64GpbFAErCgQTJ+q8
 UPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+0xeOKHeEO3SBUKrEEK5P9cL03hyW/hh1gDx90V1FJ8=;
 b=FyQqXfZ6liQCY01pcnNzXfItFzgsUv52cjlHVou/NjK2CBMRdGIGF0iqMk/65n1vEZ
 QdQsIYhD4TuT0PbAKm+qjF5CZ08AEx58ql4MP8Q9iYoXSBBM8IPjCeNzhv6zhMRHv9U+
 pcFBU46jWvx0UUqhAOihEyxwPJhWo91dPbPhzW/A9/V9K35zAT3WJUgcWYNvi9bgiXRI
 UpBydbGoEh221vE2KDmhGxDyuy2pKKu5ogeeQ9hq+rz1rjOzuDEbEygfTQU5FG1/3sWu
 3LGFfqKHDrSI1SJK6v7ze1Lwm8JbcK4sgCSDgt9CUXVSKdceARpkCExwevfJMFSmOwh3
 6ETg==
X-Gm-Message-State: ACgBeo2BnbAc2mvirJMq+69Q4ba8nKsA+CsKm6iRaV1syIIAFUW2TH5Y
 I+3IMheUlkC3lbjIUUT9OUY=
X-Google-Smtp-Source: AA6agR6+uJXBeFXN959/ARhT/rsNX+FO0o6Eu52tfgjH3FK7lQbSQxOXRJFJbsAkoANU6/G7NwmcrA==
X-Received: by 2002:a19:650f:0:b0:494:827e:5ef5 with SMTP id
 z15-20020a19650f000000b00494827e5ef5mr8685882lfb.411.1662394965851; 
 Mon, 05 Sep 2022 09:22:45 -0700 (PDT)
Received: from localhost
 (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a056512202f00b0048a8c907fe9sm1231574lfs.167.2022.09.05.09.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:22:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/aperture: Fix some kerneldoc comments
Date: Mon,  5 Sep 2022 18:22:41 +0200
Message-Id: <20220905162241.391226-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Reword some kerneldoc comments for the DRM aperture handling code.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/drm_aperture.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index fdb7d5c17ba1..3b8fdeeafd53 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -74,7 +74,7 @@
  * given framebuffer memory. Ownership of the framebuffer memory is achieved
  * by calling devm_aperture_acquire_from_firmware(). On success, the driver
  * is the owner of the framebuffer range. The function fails if the
- * framebuffer is already by another driver. See below for an example.
+ * framebuffer is already owned by another driver. See below for an example.
  *
  * .. code-block:: c
  *
@@ -112,7 +112,7 @@
  *
  * The generic driver is now subject to forced removal by other drivers. This
  * only works for platform drivers that support hot unplug.
- * When a driver calls drm_aperture_remove_conflicting_framebuffers() et al
+ * When a driver calls drm_aperture_remove_conflicting_framebuffers() et al.
  * for the registered framebuffer range, the aperture helpers call
  * platform_device_unregister() and the generic driver unloads itself. It
  * may not access the device's registers, framebuffer memory, ROM, etc
@@ -164,7 +164,7 @@ EXPORT_SYMBOL(devm_aperture_acquire_from_firmware);
  * @primary: also kick vga16fb if present
  * @req_driver: requesting DRM driver
  *
- * This function removes graphics device drivers which use memory range described by
+ * This function removes graphics device drivers which use the memory range described by
  * @base and @size.
  *
  * Returns:
@@ -182,8 +182,8 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
  * @pdev: PCI device
  * @req_driver: requesting DRM driver
  *
- * This function removes graphics device drivers using memory range configured
- * for any of @pdev's memory bars. The function assumes that PCI device with
+ * This function removes graphics device drivers using the memory range configured
+ * for any of @pdev's memory bars. The function assumes that a PCI device with
  * shadowed ROM drives a primary display and so kicks out vga16fb.
  *
  * Returns:
-- 
2.37.2

