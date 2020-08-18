Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D088248FDE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CE96E15C;
	Tue, 18 Aug 2020 21:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079E86E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:26 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id v22so16264963qtq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=a8L8AwV4qdE5/njGYAQ33CWoirWxJ55I+ZVhtLU2cMw=;
 b=O1OryiM/3TYvVnczNJDJOxCAkvfj7WnKzIXQ8NORcXdoEg3bLsnBP3RhYVJXn7NMUd
 aqAP3i+/L14qpRPdTZFss6BYhvaQL4/z9z9bupAEBwJgF0UVm09XaFA3MIJCbMG5cbj+
 MhOB8wB96rXpVpdE+i5UVxR9vk9gSUCOIeZ0gE0HV1rZYC9XnvOnm5mvYTgLRdWT30BJ
 GcIEpH/TH4/QdII6dXVb7HNJF0g7B4/Igz6jerBz6yWIqyKHxGg8PNdhpW5Co6b6DaYr
 p4OzfNFP2a5/tIIqy0AJHPcBFU1oO6uqfSKFHGRH8b1zquJOZuUE2L/X48Ex79YcSm5j
 +A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=a8L8AwV4qdE5/njGYAQ33CWoirWxJ55I+ZVhtLU2cMw=;
 b=IF617vZCSDgkN1uhA6AZ69jNd/WI2oDHJ3mNwXlfxAhAbxZntaVcwHHilRrNrzKjEr
 xvrGHYMnWKlxPNj1kBUey+5Yf93/Z44X+08rU2UxeYdTrSTkoBIylvapnWuY67J4CGch
 xIeNQcsEJd25yLQt0/nYs5h3vlhyAjhqB0xANmY91Z0yRp3EBBi0LgBoY71S1jGOKqgN
 53KetrAaTV5sXbi/SCzEgTAMNrQPkFPs3WapAG0WQ2jR9nlVogKTtU4SiMp603hVA/GQ
 DYd/CVi2hzop7UoRupQWnpBctvkUyxABg3JVk9gxsbL/C/yj4VBW8CWO78YFtLL15hUQ
 jkVA==
X-Gm-Message-State: AOAM5337+tZEHNVkkscB3cwBzPw0OjJ91VnrVr7eeUG8SEJ5BKdV+7Nq
 TpmXCJYgafyY9OkeisF8vz2sobW2Mng0/Q==
X-Google-Smtp-Source: ABdhPJwhvVHMowC+R8msjTRtVNOFVC/43SpUhUgAQKBGZh+58VrI3l8xbb99EXPB622TBIKOylS4yQ==
X-Received: by 2002:ac8:6647:: with SMTP id j7mr19426985qtp.335.1597784725019; 
 Tue, 18 Aug 2020 14:05:25 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id u8sm12711328qkj.9.2020.08.18.14.05.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:24 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 04/14] drm/msm/dpu: Replace definitions for dpu debug macros
Date: Tue, 18 Aug 2020 17:05:00 -0400
Message-Id: <20200818210510.49730-5-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index e140cd633071..b1e9c529d3b5 100644
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
