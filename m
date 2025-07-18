Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637DAB0A87D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CC010EA0D;
	Fri, 18 Jul 2025 16:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="lLGLlvOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED7C10EA0D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:34:23 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-87f234ba1abso1124569241.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1752856462; x=1753461262;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Jw4cD5ienRYpAlgcPz02KR5nIM7xo4Tb+Cfzl+BIW8=;
 b=lLGLlvOchWJArABuEd4r5AvxwYSMhROBdXqoEYDl0KaFiVvr6STBbCkG+bi5+f4pme
 POtAzZUAHLDda4EtcKAG4LTE24ftNCZ0z6Q3UKr6YsNeNXIZsnJELJbDRSH6TIy5DUjt
 FY/SzT/a9XkSWYqn5BUHUyl8OmnfzCNXW+UFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752856462; x=1753461262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Jw4cD5ienRYpAlgcPz02KR5nIM7xo4Tb+Cfzl+BIW8=;
 b=V6Vkyo+y6Eo8duvRIlZSrHAr06gN+bwJv2644wjt1XzjhLUa97ImSfkbuI/y12NMLA
 hJTDLZOFCbGZOkJ8ws2tbi/bHTWtpPxzxiZ3EPNC1mgpzFZJki5TFnVDmhxqhLfU6dwg
 tysvjFk/faE4pN7ZjmjG7QCzHLSr/trYJB56+iFw3IVLdegJkilUNTgu3PW01O/d0V6l
 TEuNLFu3yDn8VynACVW2TSdCLcFWDgV9cMNL/LR09kaf++OE28mtPgxnnkGxemwHV/Dl
 2Re0pjRhvnnLAHRZHRtSjVPx36uYPXrZ3cbLvntlZfQThqWhHi1u8EidopfFSL75suMR
 CVnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdfnWlwYOrFhg3MdPYLRkUcy/zUnGQSVap6ZlkSFLgfE79nxnFjco1sJVJ7Zsp/3PgRyDxuQWdQ3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMpTtSh7mghOInPYxnDiFDJwc2p3nOJ3MC1S79ICZnNKjzPAYL
 prO+2RnjLyrFHVPoDAHa8x6MIx5X8/C4gBuLL91PFK9ofKSx0onWzKKjoeP9Bs3I8PE=
X-Gm-Gg: ASbGnctMCvRRZWBay3uA8velrHkSi6liFB6ZiBdZXVvtmkHTSr/PhONT8ieyEEX0SI+
 mWbDhvAsD+fQ7ZW6P3aGZLGP4o1XyNEjMocoSNzBzQ9pu8GJwaa+u0o+2r7EzFYNIpjeYE47so0
 IZ2LmArYEH79otpDZxmOcFi/9NGDwJxhoTvBlv19vWAKTYpUsElqvXS4I2iwKEXPskpDotiOuj2
 r93Rc0pXESS+MxiE6RD26hPO5w2eQtbB/n9LCaW5chp2XSLw3KYalv4+wb2dy7rKS4Fm7E0XVjs
 +U/EVCJDbMGhBO0m3D+AhWT/pwG6/LqCuBnnV8jqb7u+vc8Zj9uhoZi5eDxiI9p3oufpUIZvThF
 dYzY/6VGknE9SQ3XUhkwpiALVNNmLCZGiVmSMjrFMIXcmNJ35G09m
X-Google-Smtp-Source: AGHT+IErqScymnZiT55Vrn2hztIgboOZgnnl+lMHooKzbNzjAGu84uPUafAubcOLZgs6B0DzcHa3xA==
X-Received: by 2002:a05:6102:1613:b0:4f6:25ca:e797 with SMTP id
 ada2fe7eead31-4f95f59130amr5739846137.25.1752856462070; 
 Fri, 18 Jul 2025 09:34:22 -0700 (PDT)
Received: from localhost.localdomain ([2804:2894:c100:61f6:9607:54a9:55b1:8d3])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-88b0ac45574sm645545241.9.2025.07.18.09.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 09:34:21 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: airlied@gmail.com,
	jani.nikula@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH] [PATCH v2] drm/i915: move struct_mutex from drm_device to
 drm_i915_private
Date: Fri, 18 Jul 2025 13:34:13 -0300
Message-ID: <20250718163413.291909-1-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
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

Includes the missing file drm_device.h, which was unintentionally
omitted in v1.

i915 is the only remaining user of struct_mutex lock.

Move it from drm_device to drm_i915_private so it is only used within
the i915 driver.

Also update intel_guc_log.c to use the new location of struct_mutex.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  4 ++--
 drivers/gpu/drm/i915/i915_drv.h            |  8 ++++++++
 include/drm/drm_device.h                   | 10 ----------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index e8a04e476c57..7135fdb0ebb4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -678,7 +678,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
 		return -EINVAL;
 
-	mutex_lock(&i915->drm.struct_mutex);
+	mutex_lock(&i915->struct_mutex);
 
 	if (log->level == level)
 		goto out_unlock;
@@ -696,7 +696,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 	log->level = level;
 
 out_unlock:
-	mutex_unlock(&i915->drm.struct_mutex);
+	mutex_unlock(&i915->struct_mutex);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index d0e1980dcba2..c585569b6036 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -224,6 +224,14 @@ struct drm_i915_private {
 
 	bool irqs_enabled;
 
+	/*
+	 * Currently, struct_mutex is only used by the i915 driver as a replacement
+	 * for BLK. 
+	 * 
+	 * For this reason, it is no longer part of struct drm_device.
+	*/
+	struct mutex struct_mutex;
+
 	/* LPT/WPT IOSF sideband protection */
 	struct mutex sbi_lock;
 
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index e2f894f1b90a..c374c58fb975 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -177,16 +177,6 @@ struct drm_device {
 	/** @unique: Unique name of the device */
 	char *unique;
 
-	/**
-	 * @struct_mutex:
-	 *
-	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
-	 *
-	 * TODO: This lock used to be the BKL of the DRM subsystem. Move the
-	 *       lock into i915, which is the only remaining user.
-	 */
-	struct mutex struct_mutex;
-
 	/**
 	 * @master_mutex:
 	 *
-- 
2.50.1

