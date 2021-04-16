Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0E3622A2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6608A6EC2B;
	Fri, 16 Apr 2021 14:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB0B6EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:59 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id i3so6881016edt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OtJJGzKSHczA5bNxqqkJUwGtlpEbmjnBJdKzpKDEnCY=;
 b=yqJ3UFcVv2gARKiV72xCrq0tI5R1O8jjDny5TfNTybJygWqlFnLk1n559dd4JdWHIa
 Mv9cWET1zGWtkY1m95oCj6PTPqfWOOBgw3ijHcxb6gtY5xJo1GbfGUqjuvHAQAeYALFu
 egFNwiC82OUdr53tLKhaq2fA+vvVXQ/bIMiWBTpdtCoQkk3AFJngC0N4XCi5Mo8A0jXa
 GZI6fcZf2/PuH7pjYG75Usus7CYTj/a/HEo82nMnwljU+tnDRScD9O7Eqzbj5ZAx8mEm
 eNa21fKg1D9KvQ/XF2i2e3sP4rEdUVZnA2OiQANGSy438qulqZKIH0RgprxXSxOtNaYu
 MEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OtJJGzKSHczA5bNxqqkJUwGtlpEbmjnBJdKzpKDEnCY=;
 b=mZq+rRU58GCG+nX++hHyxyXXMF8g4CAetV+SWPJCbkoUs8bioJ0BIWJwIfEMYh0tae
 XkXoODuz4GwRSsNabVD/t2pMWLN5jvhjSGORM5Bzi4L/j/7F8kwzYNaKbvTOZYAcdbK2
 xVeADeumIkaHVvHEMoox54ACR2toAWY9DrwqIGrQFiqFmV7rsNcdc5zjKmK1OHZdn/dX
 yD3D/qhCplXpPxlt9w/x6xfVsNl7ejL1e/FFGaS2gU9aNza4SZo9IwMdDO1pmFzhWB8W
 FpH84Q2cCzxssEDJxzBcrdayN7IaiVF9QI1iAYIuOw7HMlBEyeQgxMlUjmWsZProb7sy
 3NkA==
X-Gm-Message-State: AOAM533LiA9h1ry41yHnp4ezRCMJ594cMshxMHyljWIs1BQnIi4SW17V
 AHaeaCmeNDPyU6uLQaXr7TaxLQ==
X-Google-Smtp-Source: ABdhPJxLFtxGxCrP9noPgUReurWM0Eh0qHFdofj6JgkNOBdbRgqYvm35tfMFnhk/mpV0idHiLOKZcw==
X-Received: by 2002:aa7:dd98:: with SMTP id g24mr10283531edv.75.1618583878480; 
 Fri, 16 Apr 2021 07:37:58 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:58 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/40] drm/ttm/ttm_device: Demote kernel-doc abuses
Date: Fri, 16 Apr 2021 15:37:12 +0100
Message-Id: <20210416143725.2769053-28-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_device.c:42: warning: Function parameter or member 'ttm_global_mutex' not described in 'DEFINE_MUTEX'
 drivers/gpu/drm/ttm/ttm_device.c:42: warning: expecting prototype for ttm_global_mutex(). Prototype was for DEFINE_MUTEX() instead
 drivers/gpu/drm/ttm/ttm_device.c:112: warning: Function parameter or member 'ctx' not described in 'ttm_global_swapout'
 drivers/gpu/drm/ttm/ttm_device.c:112: warning: Function parameter or member 'gfp_flags' not described in 'ttm_global_swapout'
 drivers/gpu/drm/ttm/ttm_device.c:112: warning: expecting prototype for A buffer object shrink method that tries to swap out the first(). Prototype was for ttm_global_swapout() instead

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 9b787b3caeb50..a8bec8358350d 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -36,7 +36,7 @@
 
 #include "ttm_module.h"
 
-/**
+/*
  * ttm_global_mutex - protecting the global state
  */
 DEFINE_MUTEX(ttm_global_mutex);
@@ -104,7 +104,7 @@ static int ttm_global_init(void)
 	return ret;
 }
 
-/**
+/*
  * A buffer object shrink method that tries to swap out the first
  * buffer object on the global::swap_lru list.
  */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
