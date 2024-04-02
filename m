Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B5F894F3D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 11:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3B210FBEE;
	Tue,  2 Apr 2024 09:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X6WqDdTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E6610FBEE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 09:56:26 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-56c583f5381so6522122a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 02:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712051785; x=1712656585; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Eiv2Gv97BeG+qqS2CUDwFb7TsuwaJxi4oFr7eU4Jkw4=;
 b=X6WqDdTlQE/9ghpfQKaSI+rX3e0Nkj1UWu23qRfEkIrsrZq9T1Ob3KyTnWSbisBKpW
 dkm72yh93DJL9zEITqag/9PWKYz2V+IxsLfyHBAFHONrUkdbVOQL1n+3GbnsZz04bYTz
 yW79Fqn5LgcSe96NRtwtGosoEDrVIPxMnHCNur2Kjwmtxr/tcX9PnxUM+FyuEYVOJppQ
 I3w1ehAjxTM69TGyL601yPSDE89Oq2BBeG0cwooE5BR2+bExWsVMyEGg3ZTVkSeM9/d9
 T2In2qUu0ATTS9ooDJtfy7AeSkObJnJIl2mOYWZt607DOpGMK7kT2O0czK+hoCwjtO0e
 7A+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712051785; x=1712656585;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eiv2Gv97BeG+qqS2CUDwFb7TsuwaJxi4oFr7eU4Jkw4=;
 b=o07QV3ttnf53/IrGQXpFc2s0RpoaropScGIb4ScD4xIk/msCk3cPZZ71O1y13tre9d
 H4xXu61Xd5pcUHfhnmIm84bJ/Jv5p3dc2Tj3DMIaW9odFqxPWuW57qfjrwBXn0mRjuBC
 kdkKK2j7Ge4RFsD6oErFUPgEilCEAkj+rDYZSr/mXBuzcHR+gYbtbzf/HGw1XoTGFhgv
 X2/GJ6T3yqAYoT/tM3L3FPd826ao8i4VB44MQGrobCjYELrBYfO3FH6Gpb5dmKgBWyD5
 HsBiTw56vtooXlCJAf5VujG/ifAfJVRXg0ip93+k7PijT5V4qAyA2n2IP5T+QwBMNgLq
 QOFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh6PVuWmn/aNNAmPnsJ4XaxEZ0G/8yqMYBF9seIWfHCwx7jplof0DEHNh/PgR4VC84E7nqGo1sA0zXt5ke9GAVL4dZ4bt20MFceejCXccs
X-Gm-Message-State: AOJu0Yx7KUOJGbzRYpRT0oj5pgnMlqdM1YGkmBJli3zKO23m02Kg5liG
 ydhVRM41c5KqwL+Q8JIgxlrN9cB50r3wiUb2NAv1BL+RspIHnbEA6B9E0dBrjlc=
X-Google-Smtp-Source: AGHT+IGco8HwCbD45dxh0cXo5f4RbSDoT35IhySsKpVpDkYvfjDKul3aeagzg+egPF4UF9e8RGBTWw==
X-Received: by 2002:a05:6402:35d6:b0:56d:c3f9:b8eb with SMTP id
 z22-20020a05640235d600b0056dc3f9b8ebmr8364382edc.12.1712051784449; 
 Tue, 02 Apr 2024 02:56:24 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 f5-20020a05640214c500b0056bf7f92346sm6683950edx.50.2024.04.02.02.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 02:56:23 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:56:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panthor: Fix error code in panthor_gpu_init()
Message-ID: <d753e684-43ee-45c2-a1fd-86222da204e1@moroto.mountain>
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

This code accidentally returns zero/success on error because of a typo.
It should be "irq" instead of "ret".  The other thing is that if
platform_get_irq_byname() were to return zero then the error code would
be cmplicated.  Fortunately, it does not so we can just change <= to
< 0.

Fixes: 5cd894e258c4 ("drm/panthor: Add the GPU logical block")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 0f7c962440d3..5251d8764e7d 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -211,8 +211,8 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 		return ret;
 
 	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "gpu");
-	if (irq <= 0)
-		return ret;
+	if (irq < 0)
+		return irq;
 
 	ret = panthor_request_gpu_irq(ptdev, &ptdev->gpu->irq, irq, GPU_INTERRUPTS_MASK);
 	if (ret)
-- 
2.43.0

