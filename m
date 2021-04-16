Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622C93622A3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC486EC2C;
	Fri, 16 Apr 2021 14:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B594C6EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:11 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id u21so42487596ejo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=41LgwOuoq22rGgsCktNaBese4amMVfNYLTWP6zyN98Q=;
 b=SdxKlv+fNXg5L8kGoNDlYldYsqKcpPLAo7SNh4UKeExvT+lzMSwwhYTQgAkyNW9XV1
 63a1JDzirzFBEbKuUKIuNOxi9MSJjlGxn4M3fV3HctPcinrNVovY6FlDNzSTVZ92KF+o
 XIk3NOOnT5B91RxZoU8MtBX+p3GuXccPlgOW5xfBBnG3UrYm0xApChnqyq6w3iu3Oe9j
 lE1286wLw82FuzX9IBZjoe3AXA+PeNjmQTiulNd5wH2OOPghylJzXQcb1Xu6CSnNgEHC
 dsZisdfzr5StyHwyG5CNaHmFfL+M9iwvAx32Z/rwAWgZDEmk+ytaEasqOsL58RLMkWX3
 zsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=41LgwOuoq22rGgsCktNaBese4amMVfNYLTWP6zyN98Q=;
 b=mjy3SB4o8+hBL4TDXyLoum3dzxPQtyPjsgaAAEdpoUfSsJ3Q5Fnb5uKPZ/Ddq44/Jq
 gQu/uMo+MixTCkPXoDDzp74PUSl4FtAymHprETlx/k6Iz3MJ52i5ovcv1gOrqsZ/tJ63
 amzZb0SEoYLyPD1dL4M7Fnh8QT46+87NKv8gKPYkvyN33Akj1mOHaHKK0YTU77Y1fvg0
 cslEwQ+nI/MZb+sQWfEehyWGtOu4fAyCJD9cCvXVe1vlVBbhlUr/AAir5y5ioQM4VmPL
 j0JJ6jDAlvltV5NgrKgcS8rWRalo51l8UKT7q1hZNWaAEdAkjuEBcKJhyGOw05IXZtkn
 0JOg==
X-Gm-Message-State: AOAM531BPaSLv8q6V8ziY+HFnEP2KJXSSjD0e3TznZFBFEELZQIHEtxE
 /gHjfUC4uMZsabF1IVqnfRD/RA==
X-Google-Smtp-Source: ABdhPJxvfI/125JkkMmqblbXT2TRLpBJYLh7O+FA3oUYUCfjmPOCcTm/RwOmqUq72nMdaj0sKo9gcg==
X-Received: by 2002:a17:906:b52:: with SMTP id
 v18mr8565368ejg.485.1618583890433; 
 Fri, 16 Apr 2021 07:38:10 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 38/40] drm/exynos/exynos_drm_ipp: Fix some function name
 disparity issues
Date: Fri, 16 Apr 2021 15:37:23 +0100
Message-Id: <20210416143725.2769053-39-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
