Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6F4A8B76B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 13:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A201A10E8CF;
	Wed, 16 Apr 2025 11:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EXZH9W3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CDF10E8CF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 11:09:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so71559045e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 04:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744801765; x=1745406565; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JF0Z7gGf1sTr4yNTYDi/uIElOA7c6FMutBpGSopg3TE=;
 b=EXZH9W3kIAAebIRf4uaIvmYGjv1ADdxpuak5t/HENlh0lqysdXYPJJhBWZgavFuZ2K
 cPtxfkdOIPGIbSGt5/PrlwAkQh+Q5RhJ8OA8yHjediNWDY5evyknIBSBgJsEn4IGeH+g
 XJwQD6I4pE7XgZ2e4beuMtaJV06Uh5WOs2xBwSCHlclSBn6TQhmil93Oh9FnC+p4IDKi
 wgNG/YxFgHHkaN4UogZVHsTBlLLdF1vx/axrTy7ht2b9dKuINRhWRnMKtXoqPlHRre/7
 J1CNk0/5OFiE9J10puJjqvNUhiyiuS58sT8DfYDjiICgMVm0ykqtWnkaqJ2mirnwNXIa
 OeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744801765; x=1745406565;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JF0Z7gGf1sTr4yNTYDi/uIElOA7c6FMutBpGSopg3TE=;
 b=Oq5ja9V+CK4TldbjFkr3RTkA97Xt6ahvv5zU2urhCNLZEPaCr8x1KpDifWfBYtJ3L9
 Xijlz1iiyoDN3hj9RYSHowaG94FwtzM/x9FYUoS3DSqeWY6kjRV8L3xQsrJFxL48rIEW
 tUnEtG4jxSjwajJoQNwxeHTwyLsBbbT5ePGfBDEihFakS33KErTexGGL5JNFOnL/lsMW
 h/Z/doJWU0ZfQdBdH3wc5pJAKd1O20hWiCrzR+UGJewKbVympNGyzJsk3sM2/1XXcuiH
 PJ0FGXx0XpTyJHHJXJYfXdeVZ4fNRzgVm5yenRRgi+0jsvQUcr1HMW6dFv/mb77p5eDU
 L1Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvxc8Zq+2giCjg0yGaKOkeZ38ZC0I1tSWfs1Icobjv094es2fwmvmjQ+CrArxMNg2COKJPKOZ/WNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiVQ3iShj+B37xJ7GNL+ccNlOSeGe0ULHPLWDwjUSkbjGIqVGc
 4hKD0diC0yPEcuJ+mpGkHJd1F1VWmHR2wIhL48n4xxJ90DtiAJPIUnBqfT/hkIA=
X-Gm-Gg: ASbGncsQu+g64fvDBdt49SShDg5Ka8JHDQpTwCn1RYEEf5cRhxI+0zhm/ZcoAibthzN
 JDbERtCqis2zA6bA9ZqtaRVHTbumkfI+hwNUfJPQ4elrZkI4Y0NEc+5WXwblEu0TG8V5ZP1Pm6l
 m8XS7erSmOnT2UeZQjbuQuvGgnC1mBa8IhTt26/eSUNMyEVohEp4wzUzzxkqL4/j2gzwNz1StHY
 qaWAjGlMgrYiBXehjjRvf70m3I3hWxO7QdqxKikVvpNB/Nt+Mx0MpcF/ElZUbKEfU0ZP/hMo4tQ
 /yX/N/usIjDT0W8knxQOTb4VJo+Y3XLXiy8BQx8yaooyEg==
X-Google-Smtp-Source: AGHT+IE0M2ogmZ3Kz2Re9Yfivx+X34a5bjUap/WvGE5uPRjHdo77GDmKa2/LSpuLxrJNZcmScbAtOg==
X-Received: by 2002:a05:600c:3d14:b0:43c:ef55:f1e8 with SMTP id
 5b1f17b1804b1-4405d6255efmr15632385e9.13.1744801764696; 
 Wed, 16 Apr 2025 04:09:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4405b5a9846sm17583005e9.35.2025.04.16.04.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:09:24 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:09:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/udl: Set error code in udl_init()
Message-ID: <Z_-P4N4_U-xTC9-O@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

Return -ENOMEM if udl_alloc_urb_list() fails.  Don't return success.

Fixes: fb10144ba426 ("drm/udl: Support adapters without firmware descriptor")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/udl/udl_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3dfeb88cf918..bc58991a6f14 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -361,6 +361,7 @@ int udl_init(struct udl_device *udl)
 
 	if (!udl_alloc_urb_list(udl, WRITES_IN_FLIGHT, MAX_TRANSFER)) {
 		DRM_ERROR("udl_alloc_urb_list failed\n");
+		ret = -ENOMEM;
 		goto err;
 	}
 
-- 
2.47.2

