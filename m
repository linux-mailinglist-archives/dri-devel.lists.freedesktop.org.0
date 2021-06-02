Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1019A398D00
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D7F6ECCD;
	Wed,  2 Jun 2021 14:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068926ECD1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so1852234wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nxy5VbUuJktWYoN5f56DsShh05RPtQyulwCzQanfG8c=;
 b=x+eowQOPBexKc0gjdhN++Ps5HQm+5bGTLWuF+UQ6C3gZgripNSo2eBrgQ4v/c7P3B/
 +E+x9qPTRf1nF0Ab63hAIQpqRfG45A67ClrHAnxEyX++oCDb5wVHYSAMDWqmCuaLdRWO
 DCEMoQS1tVfwxxlCAGr6k3nOzuwIwMxs4A/rucgb9RFiQkVR9VibqzKVMKuXuIuj5HgF
 rij0SkVqrI3igYoqn331Lrve+WQ/wsDp1xY5XiCL2+NuGoTui+tN/YSZu3gsU5AlAJcI
 GTWDQ+WlcukducWQBP3VHgu0bmDqVX/nmeDicehdPudN1uXapqOWz+qTWnXKjnRz2Es8
 mfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nxy5VbUuJktWYoN5f56DsShh05RPtQyulwCzQanfG8c=;
 b=NUa6XRVNwcK4CgrremzoLSaT7jtI9jYJ4En/sqUxIet4VZXnVLd7EPAIJb2VNNrAc8
 c362VMHxxiIKslaNQV47bT4z34EQEMHEM+NFakHqYUVFlKYaFlfFl/iaZ9uZ0NolROss
 CHgMZMfxiMefWEo7rDOJB0imi3AN6cTT9wvD4V2UdocEOQoOlonV63EWRqmYol07YtCM
 hOK3yfeqmx2l6yPF2YkufHJemmfzfAqp6aYYlQxoYi1jOYbg3eJH3lMrY5fk2snsIRLi
 P3YOjp0ZmOtjp4uez3ZoRnvlzbWa+BbDOqX53jpeJTCylYtUIO8Qt7wO/Abj5qr2y0ls
 sr4Q==
X-Gm-Message-State: AOAM530U0F2rYk3MhyDPAaz0ArcOaw88MSsBKkLRXWgQx/SBuG+NP/8v
 hfqHOKFzwAbZNbolVIH3gZL7sg==
X-Google-Smtp-Source: ABdhPJx+xBu1BihQ5vQP4ImfnxY1U8nE9Hks2Zw/N4egBmVyT9aUFGosvKogM2eahWcVW20UK7GNQw==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr5534912wmh.69.1622644414673;
 Wed, 02 Jun 2021 07:33:34 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:34 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 24/26] drm/exynos/exynos_drm_ipp: Fix documentation for
 'exynos_drm_ipp_get_{caps, res}_ioctl()'
Date: Wed,  2 Jun 2021 15:32:58 +0100
Message-Id: <20210602143300.2330146-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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

