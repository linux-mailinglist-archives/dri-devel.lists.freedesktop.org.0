Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E1B1DC42
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 19:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EDC10E87E;
	Thu,  7 Aug 2025 17:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="w1TISj8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABA910E87E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 17:03:51 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-24041a39005so8518705ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754586231; x=1755191031;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2xuymiBz9zDhJ/J15SWyQyrOAuhc3eaf/Fda6FdMCk=;
 b=w1TISj8S4LDgFaxJcc043m37LtAhoSEb50US4Gtij8syxelV9wyXrIxzITOo/VsRXZ
 nvTQBDsmYRjroWcbycn8DP+voKJk59HfXJqMoRS2uG9pkSqrlPf0IkBf2XKYa+mK2uQS
 Ksyj4bU3ozifgfN5MIfbR2BfdvjzJC/0tjj0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754586231; x=1755191031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p2xuymiBz9zDhJ/J15SWyQyrOAuhc3eaf/Fda6FdMCk=;
 b=kWKzYJVL5bSiCvSiO0AC0V5gQbyntkTVPSzWKkN1yHvVq+LTeIm5WWzaqPzsiTadxu
 5aS4BGbV7hb0d7hNfPMkCge343GaLVe5UX/2TR+MMmQhG677SfpYJ4YvLaAgr/3593J/
 YoN8Z5OmIXPqshoeq3zYlRnyYF56qD59BwSDnBQv9HTD8xdVxfvE4yF1O9XrPY89mmeG
 AsJDqUAFH4SfIPmz83DWevZv+1N4tHbI+OztxWWfWDs0QAjrsSZXZletFAerdMGtr7Po
 4TwK1u8211aN56OLUf+6DpDGdFwoHfAlWNWhB/VDgHAeIqqaFAzBbMuJIjM3jAKhxeYP
 0RxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLIjGs6WwviuB0n1/ixUFz8gtRLBrfBQTowQVm08cGN8hUcS6Pwu69/YV5sECKHALv/RotZ+CaVFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8pCnHV8MJSV1ujyaxALOsqMFRMFOBk9ic+ldTURFySAYYb6dP
 Fm8hasmwhC5DOS5JGfh92J+o7QzLXf+9ResOAE3aKiePRQaBYFw16RZ6ofkRw2U0Yw4=
X-Gm-Gg: ASbGncutU8R945mFNrHFIm34yW0PntUHc2FtHPl9oq6v/T2izhKg7Es+E4w3mzXLBUV
 3JuN3l4zUdfFh8EgiR7Y8gZPUQdyxwE46vGHE+kqxPUQRMLkfMyrlA0fnL6bkHgtDkLKBqKthuK
 LlRbOoJTLjk/JGKip54idM1CKdM99DFJz2rQx0CJCnCsHpJU1QK2Emg+4wD8D03LBWJrN78alOO
 T1arKSQ93cE88jf+bq2qgc3Wv1dIZvWjnczo/LY4nOyrZv/H7r11T3YMAcds2GwOsOWjmgwROP4
 6vwp3kNxmgjfZCja8xwYrONUBMwRmaMnQxSzh2BPZwAtTqp8YB2pNkNH/kM5SA7X5GK7zWCVm89
 XnqEdquHtKakNe6q6dzoM7jlrku1coEVN
X-Google-Smtp-Source: AGHT+IGwRBuGDTbeGTzwyG5b2WmBceJkrYjGEdZqKwwOZ6Kpy6/3GldZk8RdkTcNIJ/lgTeRZX+68g==
X-Received: by 2002:a17:902:ce8b:b0:23f:c005:eab0 with SMTP id
 d9443c01a7336-242a0bb69cemr117062955ad.40.1754586229736; 
 Thu, 07 Aug 2025 10:03:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7c30sm188804875ad.37.2025.08.07.10.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 10:03:49 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 8/9 v2] drm/i915: Remove unused struct_mutex from
 drm_i915_private
Date: Thu,  7 Aug 2025 14:02:07 -0300
Message-ID: <20250807170212.285385-9-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
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

The struct_mutex field in drm_i915_private is no longer used anywhere in
the driver. This patch removes it completely to clean up unused code and
avoid confusion.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
---
 drivers/gpu/drm/i915/i915_driver.c | 2 --
 drivers/gpu/drm/i915/i915_drv.h    | 8 --------
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d1559fd8ad3d..c6263c6d3384 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -233,7 +233,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_sbi_init(display);
 	vlv_iosf_sb_init(dev_priv);
-	mutex_init(&dev_priv->struct_mutex);
 	mutex_init(&dev_priv->sb_lock);
 
 	i915_memcpy_init_early(dev_priv);
@@ -292,7 +291,6 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 	i915_workqueues_cleanup(dev_priv);
 
 	mutex_destroy(&dev_priv->sb_lock);
-	mutex_destroy(&dev_priv->struct_mutex);
 	vlv_iosf_sb_fini(dev_priv);
 	intel_sbi_fini(display);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index e8cb94962482..5a8ac1a52849 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -221,14 +221,6 @@ struct drm_i915_private {
 
 	bool irqs_enabled;
 
-	/*
-	 * Currently, struct_mutex is only used by the i915 driver as a replacement
-	 * for BKL. 
-	 * 
-	 * For this reason, it is no longer part of struct drm_device.
-	*/
-	struct mutex struct_mutex;
-
 	/* LPT/WPT IOSF sideband protection */
 	struct mutex sbi_lock;
 
-- 
2.50.1

