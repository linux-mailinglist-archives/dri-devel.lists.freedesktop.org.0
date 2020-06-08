Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EB01F2132
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 23:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CB56E99B;
	Mon,  8 Jun 2020 21:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75B36E99B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 21:05:45 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id q14so15923260qtr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 14:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l260Oczt5NYvBAM8JWGWfwlC6xbJl17o2VEf10AzS44=;
 b=CseeuErBEfArFH/qvOm2e4aOzEu/535Sq9CuJsWO1Q85F5s0ZS6M7UdDa5H4jhBgGa
 mYOopnpofEfIk8y1bVHZIwXOVLbImEkLkXO3i6I8C9ZoZgeRZKZxaigphcgOXPBTEm6e
 GTMuVEQV35zYYmlj2g+7ofAGHlHaNf7z9t4NgGFjBtQmJW1LPjapU5eyBeyw1NX4SoJ6
 7oCK5TGSqKR3jgn6fDhvNkX+YFV9xSIRKs1rpLc6/DvOV3A4ebbC3ZpAYqvuw3wFZcB2
 S0XR8qMXnZ6WDHwEw9SUOxjQq3IOaA90FyIleE5dHV5Sp/aSVA445nB2Cw+X2J2Akfs+
 VozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l260Oczt5NYvBAM8JWGWfwlC6xbJl17o2VEf10AzS44=;
 b=OFae7+TakegDYCWjHDKME9n1JeVFQuoOUOWFbyjoOWa0OfX52wm1DshD3tO6BtwcTy
 YcEfwTydi70EMcx4ATEbDgr0TVWmvT839ibb11JJbSLdJzS2NIp/XzlYnuPWQV73grms
 242LhSVMct1GbC2Laa0DvHkWsat6H29+ECM9dSv+shHv7CqnM7Hwv32wI+R71ry1N97e
 CHaD9HYMyFfTWph+kALQqntjaVIKn/bB/RKIrzaoSVYdLNqdWZoLZ2LiSYnAyP6s7d/R
 ffM+oPd/Z/JE9DgvrcoqzXlOOfuK7u5eIU+8N5ZjWweJLnufcUk/+OvdhDBSSZvDIKnR
 LF4g==
X-Gm-Message-State: AOAM531PLt985/PT8wI/NhPY6+MYwFX+MZFFPaD05v98US46XcAS8c6X
 dES0BgXr9c8ptH74K/fE4S1fWpaAk4E=
X-Google-Smtp-Source: ABdhPJz+V6uEQOV6V65xXTa5fOfwbjDQhqzzFkU5HU0ppoPhtj/oZgEmG1jcwSwRc3m01YVKe+vcTA==
X-Received: by 2002:ac8:342b:: with SMTP id u40mr24513501qtb.59.1591650344787; 
 Mon, 08 Jun 2020 14:05:44 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id z19sm9028902qtz.81.2020.06.08.14.05.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:05:44 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 04/13] drm/msm/dpu: Replace definitions for dpu debug macros
Date: Mon,  8 Jun 2020 17:04:54 -0400
Message-Id: <20200608210505.48519-5-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The debug messages shouldn't be logged as errors when debug categories
are enabled. Use the drm logging helpers to do the right thing

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 4e32d040f1e6..89c444ec3bb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -29,27 +29,15 @@
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
