Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09FFB1B6B6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D10910E480;
	Tue,  5 Aug 2025 14:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="vu2b/PJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36DC10E683
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 14:39:55 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso3839534b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754404795; x=1755009595;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmaAeFFWA6mt3OmAOl1hmXirLGR6yM9w72q3d5laiXI=;
 b=vu2b/PJd4uPHhvRFNuT4Hp1KY9O1+s9JVNnqviUWUl6sTnpwGIPl6d/Lw7axOh5i7a
 XwpbEuPOkAh8re2JFaZh/PZkvioe+Ded8EGT3xxtXY0cmw/qeGVgcpqEEV/NJGl5lHFl
 0rmW6SVV4qgsWFaUWAaUEWNKaNc7VTeIzSOLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754404795; x=1755009595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmaAeFFWA6mt3OmAOl1hmXirLGR6yM9w72q3d5laiXI=;
 b=YMd/E7rvmZ37OUGLOdJwwHwb4FAnEV9Bp0VfpWxCObrJ2N9SwOFE1ve9TtSPSyE5/v
 TDCAV2ZZd5z8H2zZlIVrFsI+vTM0hQCdHkR+weQnk/oU1kChd1sLj3LVrOdbRTnqO2Jm
 fPkAkQc3igWVwwURJnUN0LqwAgLpkqYOhCIcC9xdvYc4b90t2j0yADWhEJKHUA2hXpG6
 ry8h5WEVGVw3koIittGLyMxIj+tUFYyNKcSE5nD5uV5Wumd8amR+EVV/HvFuz2y1WHpz
 jSgMR2DPRQdBg02DMCVX0vv+fopsFCjpvVXUwDLBb7/JKjK9Rt6Pk6zLAxlZ9k1d1HYG
 1MvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPygkhBch3NyDTeI9TkpRKDfHRKTs0jCaTEoBRWuHI74I186FOiSEUzRilrZt6nODW/bl8wpr11Qk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVZgj/a/zDEn02J3f0notjkcdEPks67I81iuICre/1APCm6Ivt
 qljaSo7QXYL3q2HAXRs9RnpRLymuq7f8BrHLDKLC+zTecbMTI4vZQMoUwt1Cs1l+OxU=
X-Gm-Gg: ASbGncty3YdMxSAa2vwHBxLIl38ABJyfrfIOYNY/yvybNftQuO78aMAQ7SyzyH6tYB2
 J6ztddiS5g6sHCjjU1vX8M9OoaRPm/Giwy9svH6619Ec8S90nLIMAfW5u1v7+lTFxFqsbr4REiX
 PeEhUbbPD1s6WJEEQvZt6OjYSSoMPm1vJ5Vfhua2gNW1lrog5MYqxdZVf7yOaE28rOrFR6o4r1r
 tdo4M9oPirDSak5O6KNaatga+b266TpXpWz7tZQvZDaYZB8hLRZxHbkvMGpUOJxUWOm4NRQhxoS
 cYxmVc98SfB0SeZCKrPrGEFpa5v+OZzcMz2fCDveGA9zWuO0BVXBmjEetb7aSX40zl00VJaKakH
 puq0lkVde8H0+gRMNzGn9h3be3Svqpuuw
X-Google-Smtp-Source: AGHT+IGXbnMufTQYhJbGUzUbCVyWyhz1lLbkM4HcM19cgNZrt6bqz6Zzz7JaYJTfGgS5AfKm+drr3w==
X-Received: by 2002:a05:6a00:3a04:b0:769:a6a2:fe1e with SMTP id
 d2e1a72fcca58-76bec48b167mr16563581b3a.11.1754404795277; 
 Tue, 05 Aug 2025 07:39:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf1c6d5dcsm7899757b3a.74.2025.08.05.07.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:39:54 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 3/9] drm/i915: Change mutex initialization in intel_guc_log
Date: Tue,  5 Aug 2025 11:38:58 -0300
Message-ID: <20250805143908.32343-4-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
References: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
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

The intel_guc_log->relay.lock is currently initialized in
intel_guc_log_init_early(), but it lacks a corresponding destructor,
which can lead to a memory leak.

This patch replaces the use of mutex_init() with drmm_mutex_init(),
which ensures the lock is properly destroyed when the driver is
unloaded.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 7135fdb0ebb4..469173791394 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -6,6 +6,8 @@
 #include <linux/debugfs.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_managed.h>
+
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
 #include "i915_irq.h"
@@ -512,7 +514,10 @@ static void guc_log_relay_unmap(struct intel_guc_log *log)
 
 void intel_guc_log_init_early(struct intel_guc_log *log)
 {
-	mutex_init(&log->relay.lock);
+	struct intel_guc *guc = log_to_guc(log);
+	struct drm_i915_private *i915 = guc_to_i915(guc);
+
+	drmm_mutex_init(&i915->drm, &log->relay.lock);
 	INIT_WORK(&log->relay.flush_work, copy_debug_logs_work);
 	log->relay.started = false;
 }
-- 
2.50.1

