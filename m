Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FF4B0A846
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DD210E9FC;
	Fri, 18 Jul 2025 16:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="owJSytm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F8D10E9FE
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:17:33 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7e32c95778aso119081185a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1752855452; x=1753460252;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZJAr01vEkmdKcFLK4S5+N5ofw3RRu4km5B0NpQHBuQ=;
 b=owJSytm3aQu64q8Da9x7xnqazC9VqrMpr8c05eEOzFWu0M9Mn844zGEFFzNC0BjVOe
 d631K/PBzIQ0xs/Oa3SbkIjmg4K4wJjX0cGESv8nFz6wEBbD9Vl4Ujz86l9mtHqtPiRX
 BKXmWx2AL71FScLF38Pkn1havpwP4oAKEz5fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752855452; x=1753460252;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ZJAr01vEkmdKcFLK4S5+N5ofw3RRu4km5B0NpQHBuQ=;
 b=LXhhHnQnYvq3c66r4u6QSvMLBH+CS8l44LrkcjOnhMyC/AdSCyRrIa6KKWwfU/YbQl
 RamcK9OQLo6k74wpOkeXLnv1zvCppo8X5Km187O1vsIVxaS68Vg7m85fn4uKbTIpS6nn
 vjgMbNR7u5RVUedDunQwTgyEO8f2eiUnrWSGW6qSCX9qMj9nDHjgG1z95VdRvoo49Vp3
 cksFV707L34fX8QxoHhOF/jnYVftiFLiq1CyXU0S6wR1uqZIeQDlv1DzhNOhh3LK9Mb9
 oUJ5KpT0/52FJcc46LsXeuBBHTwKyckuXrH+WH0n53SdZ42H7yASrBUDCy3PUobpOwOY
 1Yng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl57yVje2DNZTy4LjCsbbZFdcafjMfPSgbVBhh5eKSz6VOa4GqTI+BqqSBZgjiOj/Tke7lqGBCDJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBlxC74X0HoCafICFXTRKfzJ3GdTv51I3I3DK2FUHLeMi/Vy1M
 Zevi8kPw67CknJuF1GLkl+NBRMeuPn78SO2j+ywLxlDRhlnm1nBJv2D5Hi8QOX0VomA=
X-Gm-Gg: ASbGncsZ7UFp5Qgk9v8rBUm5Uu4SiUq6ytAXyBNkpF/gXYcn5Dxmv+zFnwS0jkGSpdz
 6Ab+V2bZS4RDYhFByYciB6csucuDKDsws+wO1sh3it2K8HHnTmWJdBWkYLzsGokc9/lm23OyVaO
 3wu1oYHloZqHHmzWmZH5gJ/ZxrWF/CFZE1Bv3hbe5i0+MbIjMeFmcxdta94rp1XRMzDRR6wTFtB
 nq35DvKOTIc5puk6XEQbRGlMtup+dr8jcWRBZhpkr9qdtB1JHi2HlPCsFAVo6g5RV8uj4ubaS68
 PuqIwqPeeA/yHY5pxct4jCAwQau+noeABu/jXtdtYW1CxpZ/KHSduD4k85nPjEPdBSmlFIZ+tRd
 Q7HxJ3/K47nPRgVZy7KryOmr+INgBOjC8OUa2nj9H6jEKI8tBK8epE2gHsdpEL50=
X-Google-Smtp-Source: AGHT+IHu+Nl/YESfBVlH8WyKKX0Gl07Nau3uTqsG7jG0fDyglwA/Py9MqCyV5BmP0ZQezCzy+Uubrg==
X-Received: by 2002:a05:620a:45a4:b0:7e3:57ea:c6d7 with SMTP id
 af79cd13be357-7e357eac6ddmr473613285a.15.1752855451991; 
 Fri, 18 Jul 2025 09:17:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:2894:c100:61f6:9607:54a9:55b1:8d3])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-88b0ad603easm677844241.16.2025.07.18.09.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 09:17:31 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: airlied@gmail.com,
	jani.nikula@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH] drm/i915: move struct_mutex from drm_device to
 drm_i915_private
Date: Fri, 18 Jul 2025 13:17:25 -0300
Message-ID: <20250718161725.289944-1-luiz.mello@estudante.ufscar.br>
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

i915 is the only remaining user of struct_mutex lock.

Move it from drm_device to drm_i915_private so it is only used within
the i915 driver.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 4 ++--
 drivers/gpu/drm/i915/i915_drv.h            | 8 ++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

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
 
-- 
2.49.0

