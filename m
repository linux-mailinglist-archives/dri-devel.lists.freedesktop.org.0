Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA6135FC4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691016E93B;
	Thu,  9 Jan 2020 17:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0444E6E3C1;
 Thu,  9 Jan 2020 09:07:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so6483115wrw.8;
 Thu, 09 Jan 2020 01:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OZjGs6UaTVRsqD7bMcmmmmdB5ZvGFZd3+9egdXlSicM=;
 b=mTrUtVuUIgMGMeKiU3qViZO4W1gDjq0b1y5RuoDM/aFt4XoqNTHLGJQVabcB1LrKIQ
 iwC6NKhxaZQbazMlWOJ/Ng3mHn7vj29OSM0Vqor+RkQiWPTI8pVMCCcYEJcc7GqItlkL
 jOXRR1Jjn7htMPtWKITbvLNrboggGbVRebPzRg9ZfR73/heOcRifuOIjp6m+4RgM3qSK
 rNBmkYt2Wsr39XhhMLkTcWBYMSySDDdVOlVHa/l+Vh14E5HOhnJ5hsy/KlCqDCP2xHDT
 dkvr65sEz90V4v7jR/SUITLIkCcGpX7+GcEm/fwwcmCPdGl4HiHF37+YVNXxHcEfGv5A
 sGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OZjGs6UaTVRsqD7bMcmmmmdB5ZvGFZd3+9egdXlSicM=;
 b=nV+h/hlGxwfzQChZy+29ezLzvbuHLsXTRpQ9WfWonn+X3coZN0Edn8Nuzd+t35zYXS
 eEsJ+AL6UXGD44VUkmAuuPiSUJNszVCLCq+V4onWYxJ7mfvjvPdk500eY5qu4/dEvXhe
 E9+vd/OyfB2gxqaeAhoGeLJiXkKEY6GXTx7ARD2qIeF99S4nILxKIhLx//25D/VPQo1f
 stbUiC53jQtjFsOWix8RPVp6kqIK2KkClLlRlNKFsJf2/n+q+S9/0UqAaGZ/4kF79h+1
 u3+I5UjzY+v4NOuXvfy8lXyX2LJD+wJibZnmDNUNeAx6c9ubqHGXSSI4moQL1yiSGSEh
 mByQ==
X-Gm-Message-State: APjAAAWwP4qHTSk4U95G8NrPJrosRd39YuD2XiDJkW5irpRilVmY+pJB
 jNONh0G6qLPtZl4EnQAWk4c=
X-Google-Smtp-Source: APXvYqyy6dELvru4OOP3T6y3Yj7E8EV8t3vnuNoSlszG4R1U2avG9l79QFwVBUUis2bzJ3P8u3dXpA==
X-Received: by 2002:a5d:690e:: with SMTP id t14mr9518982wru.65.1578560823717; 
 Thu, 09 Jan 2020 01:07:03 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i8sm8004734wro.47.2020.01.09.01.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 01:07:03 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 4/5] drm/i915: convert to new logging macros in
 i915/intel_gvt.c
Date: Thu,  9 Jan 2020 12:06:45 +0300
Message-Id: <44f3839820a32ed03d73dc56a6ef3581994802c9.1578560355.git.wambui.karugax@gmail.com>
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

This converts the use of printk based logging macros in i915/intel_gvt.c
with the new struct drm_device based logging macros.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/intel_gvt.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 2b6c016387c2..38ebd5562c7c 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -67,12 +67,13 @@ void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
 		return;
 
 	if (intel_vgpu_active(dev_priv)) {
-		DRM_INFO("GVT-g is disabled for guest\n");
+		drm_info(&dev_priv->drm, "GVT-g is disabled for guest\n");
 		goto bail;
 	}
 
 	if (!is_supported_device(dev_priv)) {
-		DRM_INFO("Unsupported device. GVT-g is disabled\n");
+		drm_info(&dev_priv->drm,
+			 "Unsupported device. GVT-g is disabled\n");
 		goto bail;
 	}
 
@@ -99,18 +100,20 @@ int intel_gvt_init(struct drm_i915_private *dev_priv)
 		return -ENODEV;
 
 	if (!i915_modparams.enable_gvt) {
-		DRM_DEBUG_DRIVER("GVT-g is disabled by kernel params\n");
+		drm_dbg(&dev_priv->drm,
+			"GVT-g is disabled by kernel params\n");
 		return 0;
 	}
 
 	if (USES_GUC_SUBMISSION(dev_priv)) {
-		DRM_ERROR("i915 GVT-g loading failed due to Graphics virtualization is not yet supported with GuC submission\n");
+		drm_err(&dev_priv->drm,
+			"i915 GVT-g loading failed due to Graphics virtualization is not yet supported with GuC submission\n");
 		return -EIO;
 	}
 
 	ret = intel_gvt_init_device(dev_priv);
 	if (ret) {
-		DRM_DEBUG_DRIVER("Fail to init GVT device\n");
+		drm_dbg(&dev_priv->drm, "Fail to init GVT device\n");
 		goto bail;
 	}
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
