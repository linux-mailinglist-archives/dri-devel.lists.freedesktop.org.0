Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C422936228C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E656EBA5;
	Fri, 16 Apr 2021 14:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D126EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:50 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id r12so42510627ejr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=77KORMvjycuosDmjlDlE5rkJsrZos9ee6jXmEuSJFYU=;
 b=HPaBNGTBopwSRGzFIlqBdzxoh9v8tKGDodE6bsGoO8t2VUZO/SxuVnkNG9JnqDCbGE
 VojMx5Hv47p3/y6Fyv1MNHvDV1eia1HKQeYArX0WlBkzBrPbItLWOuFSWHI1owP5l9CM
 MvLa8jw5+ntXAixaJz9MmS0dkOZwTx0+4fVEZm6lf6/KvCWrYnuLJbxRg24OtYcK7tZS
 8SNXAB5bWdX7zoJW/Xi9x78O8THiDfx0uRWPY78zqAFoYUxtFgJS693oKm5Gb5xlJK8T
 tKU0/X1g2YCb6T9AqWYqwzFuHDR6wNLFSipYp2GwbyW/LTk6ppVhcUDNE5pkfSVYW6B2
 ZrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=77KORMvjycuosDmjlDlE5rkJsrZos9ee6jXmEuSJFYU=;
 b=XfOyDOUuGaR2VKgMdKO0rokqUFn/4xMZLzD1NubfLiZYblFaOlB5KgBz4Q1bbv1Cyi
 mt5JHQWxrHQDgW/pu2y2kr/m2rY/qZnYcAttXnOylHFYMErctJyLLw6FyvEOgCErdrY9
 jNGYgzlAX/UUGQnG6Ba3GoO/MJGsAe4B2h97V5viIfMIalneqy4qWeBw/DCz/GDU6+ll
 vna/KA3/u81wuw93Ji6Q44bHOjVxFPX/afRv0Dt89QyY8wvO4lkTsEeV0FEwShe8QL2y
 Q6RLHSoi3p1isOhjyy+ShQRAw19xYGp/fy46yBmMXClT3UsIJVSvU6QGT7TwNeWnQ+m5
 KtZQ==
X-Gm-Message-State: AOAM531kf4GPb6Q1qDHsSEuYjcoUpMRqBCNb2B6VovQxkLn61/khctuw
 7DsUsaqb2dyszHPxp/VmZQgK2g==
X-Google-Smtp-Source: ABdhPJzqQgFU7n08Qr/b5rOK9sbCAd1su0qR5zRs5qHTAnyG7RJlaa/5uaHYH3FzGTjDbsEGgdGDcw==
X-Received: by 2002:a17:906:94d2:: with SMTP id
 d18mr8641752ejy.531.1618583869107; 
 Fri, 16 Apr 2021 07:37:49 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:48 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/40] drm/omapdrm/omap_irq: Fix a couple of incorrectly
 documented functions
Date: Fri, 16 Apr 2021 15:37:03 +0100
Message-Id: <20210416143725.2769053-19-lee.jones@linaro.org>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <rob.clark@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/omapdrm/omap_irq.c:114: warning: expecting prototype for enable_vblank(). Prototype was for omap_irq_enable_vblank() instead
 drivers/gpu/drm/omapdrm/omap_irq.c:140: warning: expecting prototype for disable_vblank(). Prototype was for omap_irq_disable_vblank() instead

Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <rob.clark@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/omapdrm/omap_irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index 15148d4b35b57..dff095c864909 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -99,7 +99,7 @@ int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
 }
 
 /**
- * enable_vblank - enable vblank interrupt events
+ * omap_irq_enable_vblank - enable vblank interrupt events
  * @crtc: DRM CRTC
  *
  * Enable vblank interrupts for @crtc.  If the device doesn't have
@@ -129,7 +129,7 @@ int omap_irq_enable_vblank(struct drm_crtc *crtc)
 }
 
 /**
- * disable_vblank - disable vblank interrupt events
+ * omap_irq_disable_vblank - disable vblank interrupt events
  * @crtc: DRM CRTC
  *
  * Disable vblank interrupts for @crtc.  If the device doesn't have
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
