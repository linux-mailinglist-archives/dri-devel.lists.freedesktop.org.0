Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04474135FBE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385A66E939;
	Thu,  9 Jan 2020 17:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47B86E3CB;
 Thu,  9 Jan 2020 09:06:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so1936481wmb.0;
 Thu, 09 Jan 2020 01:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kvdfo5p7rGw6kjZkh9zkMAcibuMahAFzCWtpfQCY54I=;
 b=Q7ic9Z2e9nve5H4Tkmw1sEa3snMzPEKbOpJC+93YR6BjyzubO6YRlLXrTNYQmv/Mfx
 KUrQKWtbAx3s/XgHEJwYz3q1lKgoy04GLeGJcoC0XfwozQuHczFKZyW6TMOS6yULtXol
 cA+hqjdYmRUAdM0aTcRIOpiSq+GllGzA+v8iKE54owjsx8hIiVHNU2HTWcECOc+je4PB
 CTm3bj7Xe5tJL/Bbp9OM0qffAd3e1ciM93jVuAwR48NDAGlR7rY9c5N6AUJNk9jnviN0
 /IaBe3F0gNYnU/rrJShNwOCK9/JM3l7tI/jha5wCzPdj1lzDtWpVcaxi8oHvjG6L584Y
 1cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kvdfo5p7rGw6kjZkh9zkMAcibuMahAFzCWtpfQCY54I=;
 b=gkw+7EMXYoOxKya/UmWzy8veOIRGpCcgytFOKpaxkSDps11J/EjrFA/9ErNfmohDPc
 kIM0tV4G08aGVRdjMmYisNsI3WWtBu8/u/1SVYcUn0Pw1WEIMKdDMMKFkOe46dx19GYR
 +AKM0hZpiL0FgWnWcfK2qzH4RU9qfXjmZrCVWMF61C/S9Kx4ODKJRtKRMeyM7Ga3aD9o
 bO1hlzuXjHkf5EdeIEx7OzhUwIuVI419sxB9k5yUXFQs7/R2gQQdANTcztb8O2hHWqB0
 LI+7spyafycyoYvp0Xk5nH19vfz9H9mGC1pyGi2z4aRtrDc/Z2p8AZ7jN7Rf14YNTgrh
 j1Ag==
X-Gm-Message-State: APjAAAUQP41hDFW16y8RWIswM6cHHY+a4FSttUTAegwYd4vMLD+BsMqL
 m4Z/bKJsZK6IMwtQ/8cxd/s=
X-Google-Smtp-Source: APXvYqwVuHDn92wUI+VKXs8iqgeYtS2XopG9hgSpBEVm6ExhW37DQkykMGyIQyid+gDpQ/m4FoqLEg==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr3393989wmb.73.1578560817414;
 Thu, 09 Jan 2020 01:06:57 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i8sm8004734wro.47.2020.01.09.01.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 01:06:56 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/5] drm/i915: conversion to new logging macros in
 i915/intel_csr.c
Date: Thu,  9 Jan 2020 12:06:43 +0300
Message-Id: <0ea8e0f39013a73ed66052893a8f8abf8cc23ba6.1578560355.git.wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578560355.git.wambui.karugax@gmail.com>
References: <cover.1578560355.git.wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of printk and struct device based logging macros with
the new struct drm_device based logging macros in i915/intel_csr.c

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/intel_csr.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_csr.c b/drivers/gpu/drm/i915/intel_csr.c
index 09870a31b4f0..85e41db7dc0e 100644
--- a/drivers/gpu/drm/i915/intel_csr.c
+++ b/drivers/gpu/drm/i915/intel_csr.c
@@ -298,12 +298,14 @@ void intel_csr_load_program(struct drm_i915_private *dev_priv)
 	u32 i, fw_size;
 
 	if (!HAS_CSR(dev_priv)) {
-		DRM_ERROR("No CSR support available for this platform\n");
+		drm_err(&dev_priv->drm,
+			"No CSR support available for this platform\n");
 		return;
 	}
 
 	if (!dev_priv->csr.dmc_payload) {
-		DRM_ERROR("Tried to program CSR with empty payload\n");
+		drm_err(&dev_priv->drm,
+			"Tried to program CSR with empty payload\n");
 		return;
 	}
 
@@ -636,16 +638,16 @@ static void csr_load_work_fn(struct work_struct *work)
 		intel_csr_load_program(dev_priv);
 		intel_csr_runtime_pm_put(dev_priv);
 
-		DRM_INFO("Finished loading DMC firmware %s (v%u.%u)\n",
-			 dev_priv->csr.fw_path,
-			 CSR_VERSION_MAJOR(csr->version),
+		drm_info(&dev_priv->drm,
+			 "Finished loading DMC firmware %s (v%u.%u)\n",
+			 dev_priv->csr.fw_path, CSR_VERSION_MAJOR(csr->version),
 			 CSR_VERSION_MINOR(csr->version));
 	} else {
-		dev_notice(dev_priv->drm.dev,
+		drm_notice(&dev_priv->drm,
 			   "Failed to load DMC firmware %s."
 			   " Disabling runtime power management.\n",
 			   csr->fw_path);
-		dev_notice(dev_priv->drm.dev, "DMC firmware homepage: %s",
+		drm_notice(&dev_priv->drm, "DMC firmware homepage: %s",
 			   INTEL_UC_FIRMWARE_URL);
 	}
 
@@ -712,7 +714,8 @@ void intel_csr_ucode_init(struct drm_i915_private *dev_priv)
 	if (i915_modparams.dmc_firmware_path) {
 		if (strlen(i915_modparams.dmc_firmware_path) == 0) {
 			csr->fw_path = NULL;
-			DRM_INFO("Disabling CSR firmware and runtime PM\n");
+			drm_info(&dev_priv->drm,
+				 "Disabling CSR firmware and runtime PM\n");
 			return;
 		}
 
@@ -722,11 +725,12 @@ void intel_csr_ucode_init(struct drm_i915_private *dev_priv)
 	}
 
 	if (csr->fw_path == NULL) {
-		DRM_DEBUG_KMS("No known CSR firmware for platform, disabling runtime PM\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "No known CSR firmware for platform, disabling runtime PM\n");
 		return;
 	}
 
-	DRM_DEBUG_KMS("Loading %s\n", csr->fw_path);
+	drm_dbg_kms(&dev_priv->drm, "Loading %s\n", csr->fw_path);
 	schedule_work(&dev_priv->csr.work);
 }
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
