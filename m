Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA0362289
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED9D6EC11;
	Fri, 16 Apr 2021 14:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4CD6EC08
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:48 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g17so31848319edm.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BenSWVQP2zN1koiPW0t4kws5hTFRiEoau/BE1y9GfNM=;
 b=HIAesytEg5S3sduMFPZ6ZtYIe1kNf+o5CbxfxLRVidE4pbMb2kNGB64UxIGQU2qRyM
 enc++rAblmvxbBCHBLncASVRGti1rSEsilx9FwhuOehh6gVuXXsI6Re/bG3gJuv+y+in
 CSCstZfPkCUC7FIEyTX+0I7CB1NSsmmH1fDey0abB0EpwuZKW6ueLNv/XdiZ2V2UEJn4
 NQlDG1UkwPm+gpcJ6bieuV8UmL8z8ZF5GAWLN11J0ywRM/zGDAJQ0Cf9a8fI/BrQfWR+
 FtPDM926uNLX5X90uAItZowa8ttUBbcgMOz/r7cf9oZZHYVBD/Bl8g0a8NvPX7M/jDkE
 Lu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BenSWVQP2zN1koiPW0t4kws5hTFRiEoau/BE1y9GfNM=;
 b=WpL/dyAxOYgnv8MKZJD7FWV90XbBqug0HklAlcFwnCWmyflsYUi1if9ibw09nEupgb
 AsMIoypVWS4d8j1MxbQgvaINKuNIVFUT8u/ees8NuIOvR0fa9TLjP5nMJwToFxv9ruWy
 VtqdDlOFovuOOa5cwZJgLO9DkLSDd6ABpU6wIsJlDBBr+JK7/eAe06bs2tULB5ZJRW3g
 E5I/6d2pNxRXmENjzFCzpZS7pj9tPvldbYFuTYrKINmDz11cVkK4yxBdVRZZBYjsG8RZ
 XW4uCEonb2Ra07cN4bg7a1HhE/mVXVGrot7O/L5eOXRSiCKfTBYtfVC+Fd5HjzO7dOBN
 mSRg==
X-Gm-Message-State: AOAM531qDRPW32rbSE66D565prP/WHNxF9OyWU/IXIrzS5Cq1hnMg7dA
 JXlJMzm+SbYgP8OjL5r6nLBdhQ==
X-Google-Smtp-Source: ABdhPJy03x/bQOosuLTJJIEEGcLYhuxCxgQFnP3tHnQy4iOpxU3Fu9WUEZt8yiBzKt28dhZZF24//Q==
X-Received: by 2002:a05:6402:518b:: with SMTP id
 q11mr10396198edd.151.1618583867088; 
 Fri, 16 Apr 2021 07:37:47 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/40] drm/nouveau/nouveau_ioc32: Demote kernel-doc abuse to
 standard comment block
Date: Fri, 16 Apr 2021 15:37:01 +0100
Message-Id: <20210416143725.2769053-17-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index 8ddf9b2325a42..2af3615c5205c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -38,7 +38,7 @@
 
 #include "nouveau_ioctl.h"
 
-/**
+/*
  * Called whenever a 32-bit process running under a 64-bit kernel
  * performs an ioctl on /dev/dri/card<n>.
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
