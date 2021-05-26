Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFF33912ED
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240026EC5D;
	Wed, 26 May 2021 08:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F4A6EC3C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:48:06 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso2908561wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nxy5VbUuJktWYoN5f56DsShh05RPtQyulwCzQanfG8c=;
 b=xiOe4mFhni6btU7/RAd8kfv+LqfSWalgP3f2ZIm7Rb3ksXK76sewdnNshZe2TuZOhI
 h3ytakn2HgyVRlYV+T6oSaydAt2VFLbS/m49aMBA6B0oIMfbijvQ6yy+x4zezyZrBUa9
 9aUt5xFjzyxuKLDmk6Xk/y0H8zreqHKRNE3A70BZEWwd7IOl00RUJeONgRUPgHmSGh4l
 6FZxtMzbNVYuD2HXHpnjVE33NcykFKLcH1GpeMaF8Y8csrykvsi0JYhlIJjGRVoZqSUX
 ZExAQbIG7mdvtFNOqF15xbWWKTSGIEs04nP4x33eRc8L7L2mrh97/SOCcNcFUgV8Wx8M
 N1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nxy5VbUuJktWYoN5f56DsShh05RPtQyulwCzQanfG8c=;
 b=rbYfRj0iJhFWuIoZEGwp5fH4RBJKyEBrl7i5D2fEZHKITbjLV4A3zTRMBPSwax0bKP
 rNtK0c187oGHiuLTELzRGDNm0k6G2L29okZFRLDxaDqPibyF7oyK7j/4P99Z8iljXWUS
 LvAkjMWoNXXESrZnh+pomO0JlSbz8bmVl1Jztdupq2R9TOkbnSUdWRNj5cauK7bg9m4Z
 QS6cwe5sx8bIul8FwZC1811ke5WH3g9f2v8XZWxeDrqI+xksnoCZLJtwt0GTLaN95ntd
 Qe1xCH13fvtg5fr/2pvtOUZyt1IZSNAXntrNbI8CcopWX2BKcHHVbN/sZY3HNCMYw9Yk
 Pjtg==
X-Gm-Message-State: AOAM531KdKVVKcgEOTSM3IoXoGCbvMVycG0xOILJ8LF9fpdjoOgBW305
 fpBDiCDOXJvEv/IK/tGn2f/cXw==
X-Google-Smtp-Source: ABdhPJwGH9LW1zlxMLp6/VgecZDFwPNMjdT5Q6ofmkGzeRbpsGwG9WIb3mzgYLBGcw+4227c0C/4pw==
X-Received: by 2002:a1c:f303:: with SMTP id q3mr2334263wmq.9.1622018885095;
 Wed, 26 May 2021 01:48:05 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:48:04 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 32/34] drm/exynos/exynos_drm_ipp: Fix documentation for
 'exynos_drm_ipp_get_{caps, res}_ioctl()'
Date: Wed, 26 May 2021 09:47:24 +0100
Message-Id: <20210526084726.552052-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos_drm_ipp.c:105: warning: expecting prototype for exynos_drm_ipp_ioctl_get_res_ioctl(). Prototype was for exynos_drm_ipp_get_res_ioctl() instead
 drivers/gpu/drm/exynos/exynos_drm_ipp.c:153: warning: expecting prototype for exynos_drm_ipp_ioctl_get_caps(). Prototype was for exynos_drm_ipp_get_caps_ioctl() instead

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 4f2b7551b2515..9ae8689353579 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -88,7 +88,7 @@ void exynos_drm_ipp_unregister(struct device *dev,
 }
 
 /**
- * exynos_drm_ipp_ioctl_get_res_ioctl - enumerate all ipp modules
+ * exynos_drm_ipp_get_res_ioctl - enumerate all ipp modules
  * @dev: DRM device
  * @data: ioctl data
  * @file_priv: DRM file info
@@ -136,7 +136,7 @@ static inline struct exynos_drm_ipp *__ipp_get(uint32_t id)
 }
 
 /**
- * exynos_drm_ipp_ioctl_get_caps - get ipp module capabilities and formats
+ * exynos_drm_ipp_get_caps_ioctl - get ipp module capabilities and formats
  * @dev: DRM device
  * @data: ioctl data
  * @file_priv: DRM file info
-- 
2.31.1

