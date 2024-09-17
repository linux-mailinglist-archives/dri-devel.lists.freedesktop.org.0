Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783CD97AF6A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 13:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBCD10E213;
	Tue, 17 Sep 2024 11:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VmFtt50N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F52110E46C;
 Tue, 17 Sep 2024 11:14:33 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5c4226a5af8so5365546a12.1; 
 Tue, 17 Sep 2024 04:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726571672; x=1727176472; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XuxR3jfC4KGpIF8SEWZEG4Rd8w+GT5DWDiO6Yllrbvc=;
 b=VmFtt50NnrMF9LSkx5J5Dojx/U7mDxlfSeZi/HSHfqX0pu2WD3rN0OikSKvq8Ykhb1
 abxe4Dne9Fjefx0pp+h1890YuIYQWbGzI7+qXoTDgnLOb26uxwrCSIaIsSaaYihUZ3IK
 QWKqQGR+dRoCQIizp77d0ZsLczDWLNfETXJy5NvL4fndOB4UueA5oejchheJY8lrm9rd
 b/WzMSgQ6Lk24SW0VZSwp8veH6Ozgq7OsFJwglN7S4g81+rSu0yA68jOVsm6LMa/AEz5
 u7aPG5S1jIr6EJQczdWrAqc4v07lWN72fPtaHsM9d6ZXS7hKY1M8ddAm7xBqbwNgAuq3
 N0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726571672; x=1727176472;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XuxR3jfC4KGpIF8SEWZEG4Rd8w+GT5DWDiO6Yllrbvc=;
 b=AjHF5PdNAtacngO0YnY36TM/N3AGl/Cx5SbYPffXz0WZjCNpRtR7ovqIB8hAdXTSHm
 quQoNTZWrGrbf6QScdO81hFvgYUTocbSDYy3+rlnbMuY8F4RpI9L/tCixwbaPpHv4Gcd
 ekogXsgMSbUAFa79uwE8eiHruvPKim6OgZPHV+YxF50fDF6Yp5gnaF/o059Rw7gxySwn
 Zg/r7HkIO1NvKnr+UDLY0EQ7uFJawmU2Eg8kBO7Kq+oHH9m9kNQ8GUN5PzQdfiGwgb+w
 wIc3vsG0BisTAoP5ZtkkCj7R6YTogMOso3+gxnQ/XuoHYaUeVvONLeOkl3em2bgMbBF6
 caRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfL3lClYWr9RuTTCi0sgtQK7bEDRDR/wF3zvOrylVjuQg8Pmz56K7e4gck4M6tj5lo1ZOsKLXuL9M=@lists.freedesktop.org,
 AJvYcCXEdBikoH9ELMLpodv6TvnN7J6bMzp+i51Q4KgSFG6kn6cTjdbO2hY3CDqXCPRk8lIwWUpCjHjbWxcp@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw495/ykMp+U2k5fsF9cV5SBVJPXStyrwdFU6IUnnorPnDUu4l1
 g3tj5vLx9I+mGE2DiD9L99Yl4nFLzpIs+QOM0gqleuiWPpmlah9E
X-Google-Smtp-Source: AGHT+IEFbl5eP/8hHQSK7oCw/f7NgyjOx4ej01rgi8K9UZxyYfKhrU83g7TuGvWIseCmmQOBQX3IGA==
X-Received: by 2002:a17:906:478a:b0:a8a:8c04:ce9f with SMTP id
 a640c23a62f3a-a90296eabbemr2165571066b.52.1726571671751; 
 Tue, 17 Sep 2024 04:14:31 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it.
 [82.51.105.30]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 04:14:31 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:20 +0200
Subject: [PATCH v4 10/11] drm/msm/A6xx: Enable preemption for A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-10-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=3440;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=S/uPk1A6L6zoLEK5e3/J6SuTUVklEoPewqPKULcqefU=;
 b=3YqKkgH7Z0NA1nK01EBqUUZp8DWABMJ2ebOhsRZhphQvyRK90H56chUPa/k59UjjCahsUXi6K
 m6Fm5Zp246uDlqeR1vwHVA/SmqMX9XiUgIxWVgpvFgye9X25nwgWaul
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Initialize with 4 rings to enable preemption.

For now only on A750 as other targets require testing.

Add the "preemption_enabled" module parameter to override this for other
A7xx targets.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 6 +++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 drivers/gpu/drm/msm/msm_drv.c             | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 316f23ca9167..0e3041b29419 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1240,7 +1240,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = 3 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index edbcb6d229ba..4760f9469613 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2529,6 +2529,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
+	extern int enable_preemption;
 	bool is_a7xx;
 	int ret;
 
@@ -2567,7 +2568,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (is_a7xx)
+	if ((enable_preemption == 1) || (enable_preemption == -1 &&
+	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
+	else if (is_a7xx)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
 	else if (adreno_has_gmu_wrapper(adreno_gpu))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 87098567483b..d1cd53f05de6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -56,6 +56,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
+#define ADRENO_QUIRK_PREEMPTION			BIT(5)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9c33f4e3f822..7c64b20f5e3b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -58,6 +58,10 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+int enable_preemption = -1;
+MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
+module_param(enable_preemption, int, 0600);
+
 #ifdef CONFIG_FAULT_INJECTION
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);

-- 
2.46.0

