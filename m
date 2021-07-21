Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BEB3D15AB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DC86EB67;
	Wed, 21 Jul 2021 17:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCFE6EB3C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:55:50 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id ay16so1333010qvb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0pycXB2ultmLkKc35aeNj2U+LPhWXxWP52T2qDeRhjs=;
 b=VQnE8G+T99lqj+jpc8gjTrDIq60JvIspB210ozZeqOOMmMWKPswtglKyQ/zpgkH8xf
 nSzdznQC/pcNlTb+rokrH057TouO69ecT3IdtH4UMAttClC7sNr660xpBHvAE0AIXAjR
 xGj3wmsOPr3Iy23GWqOeN2yjeLnpugyXQDEs/TM10uBJUuXbqQQRB2MOQhR9gc2S0yZ6
 ieMFY38yfiEuI3efFX25D9oEN0kxhojGFGP6MQ7iLMoK2Lp5uxhiFV5GbBvf36oO3sbx
 e/WRldFNXL8dyuTodbz8ocXxzsjHcGIGW1ADfUiDnv5p6eTBMHtAkv5d8YSKh8Hk86H8
 v+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0pycXB2ultmLkKc35aeNj2U+LPhWXxWP52T2qDeRhjs=;
 b=Ym/wpnfVI8ypGdzo8GUPfILA5phH0TVjrKCJlwyCDiX6WYEUa7oozxrmx8D27ebply
 1N4Q3b8U4D/jMtNMHbMv+AJnhgxI77dXdH6pN9liPhQTirFk3OExI4/ojPPz6QldBpd7
 Ym6kuKEtZLbnDBq7Mi0n6v5Ma3JkpVT/b+0Qr/ib/QIqUBhxj7pUG9m8lTydIjJFZmL+
 b8pDz6Ptmb4Ene8v4JsjybW8MELYBD1xKYHU8PyeFmjHb4wC+sD24uNQVW43vI8ddM08
 I11dglNVjuOlHfFkYZNLfuW6ZM1Jd8OiInjdgaiidQe0DyJcjXykcdGuH0C9YgECWTdD
 xqpg==
X-Gm-Message-State: AOAM533+faMmJ5Zl6x85TjM0tljaUTFfpmu4q6dPIPFKotObiXEknfCy
 rKqBMbI1OaxRGucvOR5VdH/DEGcj0cipkQ==
X-Google-Smtp-Source: ABdhPJz/2XnWjDEIVkqQXiPb5u4xelAKiOrD8F4Pkyijtn6fTUroFWIgLbFDelftl6codkhebYsC4Q==
X-Received: by 2002:ad4:538c:: with SMTP id i12mr37924550qvv.51.1626890149955; 
 Wed, 21 Jul 2021 10:55:49 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id j8sm9492446qti.20.2021.07.21.10.55.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:55:49 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 04/14] drm/msm/dpu: Replace definitions for dpu
 debug macros
Date: Wed, 21 Jul 2021 13:55:11 -0400
Message-Id: <20210721175526.22020-5-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The debug messages shouldn't be logged as errors when debug categories
are enabled. Use the drm logging helpers to do the right thing

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-5-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 323a6bce9e64..c33164d3944a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -31,27 +31,15 @@
  * DPU_DEBUG - macro for kms/plane/crtc/encoder/connector logs
  * @fmt: Pointer to format string
  */
-#define DPU_DEBUG(fmt, ...)                                                \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_KMS))                         \
-			DRM_DEBUG(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
+#define DPU_DEBUG(fmt, ...) DRM_DEBUG_KMS(fmt, ##__VA_ARGS__)
 
 /**
  * DPU_DEBUG_DRIVER - macro for hardware driver logging
  * @fmt: Pointer to format string
  */
-#define DPU_DEBUG_DRIVER(fmt, ...)                                         \
-	do {                                                               \
-		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
-			DRM_ERROR(fmt, ##__VA_ARGS__); \
-		else                                                       \
-			pr_debug(fmt, ##__VA_ARGS__);                      \
-	} while (0)
-
-#define DPU_ERROR(fmt, ...) pr_err("[dpu error]" fmt, ##__VA_ARGS__)
+#define DPU_DEBUG_DRIVER(fmt, ...) DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)
+
+#define DPU_ERROR(fmt, ...) DRM_ERROR(fmt, ##__VA_ARGS__)
 
 /**
  * ktime_compare_safe - compare two ktime structures
-- 
Sean Paul, Software Engineer, Google / Chromium OS

