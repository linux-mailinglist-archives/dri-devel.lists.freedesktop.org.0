Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD1BC478F6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF11E10E40B;
	Mon, 10 Nov 2025 15:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="hBCKe4yA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C6710E400
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:33:07 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-640b0639dabso5439766a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 07:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1762788786; x=1763393586; darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MhhZbSaUsVQtnfyfSsZMoa+Z0ZmaAqoEvexpVHXnJtU=;
 b=hBCKe4yA1k2gC7e9XdPMkKOK+fvuzZa86d8qjt/ndgI785OWzMEiCCRNsCdjTdyhNH
 pftA4aeH0U0dJgx6WE6dhbdgyNCn8A8Y7PYLjzaEIkLQVoI2ljO43YBxWiqjTojgVdTn
 jntuO++1tIl5BRGgmAT9IqTc1cEqAB1gSP193y6923TGq6u+5l3yQ49hVwsIZbrGCxre
 4I+G0zdI+8utLcx9LXnhiTlr73OiLBE6pLTVPDULNh4Tmzy+M01OIHe97jM7isdntjGB
 LBl1aE2EOpcfbde+MGwAY/LiOBnx+yPrT65A6htydylffK2GOGzxJbzClnc4CqAb+czC
 zWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762788786; x=1763393586;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MhhZbSaUsVQtnfyfSsZMoa+Z0ZmaAqoEvexpVHXnJtU=;
 b=J+VNUZjexqvS63DT851OmxZCY6WuSlOqUWnd+WvGT2QQGC3gVEP3S7sYubwhDg/Fp6
 BmS1eBNUQjM3J/H1AkHr5QPL8+uo6sO7RNqUg8AYi0/tbM6sc7Hg27cBWCw2MuJMjNWK
 LmbzQhpmoaQ4qFQnYIWeE5074UQV1OOmPFtCNBob/A4TnM0BdpE9gpF7GlatcT+qm4Bd
 xJ2dmpm9XzdlLUzLA2OY7LuWxbYoGpkijaEInG31hegHSuTavGJnB+jy2I8ZYY8wYQWD
 WgNXxHHuFRp3ub9xhPhCGVMw/9rym8q3bJh/W3PL2quLGxf0JgrOmP0JVoarC+FChjkp
 gQ/Q==
X-Gm-Message-State: AOJu0Ywj15SRNGnvQFQTHfKUbAtQALXRPQFT1y40zrd/dbdmh9GpRgFd
 FBuPBwYg0BOaClrtDYaii15RfT0bf8wEJkbXq+8dEEbcT0mBHRIQJMsbDbx6ixwOOUk=
X-Gm-Gg: ASbGncvVTAvvzgXmzFLsB3NnWv0oCSc85lQOKOX+IqksyXkiFIP0BxhnO+y1C0N0Q56
 /E0rikPsAxdYoK7lYJvvEWEnmbFD4oPxu0ytZz/4Ieb4KJx/jamh+v0TEfJFX9vHbliLa5p/v8u
 /BDSTV7ME3cpV3IQdJZQ+aQUYsJr3TVrWplRHf//oS2F8dzbrJPx7emxnSAG8FlLCG09Zau/0Kn
 oeE7jW7wC24c300P0I2I2rjUSeo5CSSov+b1ZF3F+jMDsLttUZI0M6vy7MSGc0VvsMXc/Jp2LCm
 qXu6lfhaJSnFqM9zjWkqCQ+332ypN13vGfNmkSulZXqW34kiaKoA1dmZu6pmejoH4e9dYYp3fys
 lcdzTBxGehDG6Pz/grofx6m7vVuTuqYZ66ktY4mbFUBlEAlrPkg9YYEA48+FDvLa7NzX1Wv2Bh7
 OKC94R7m6xtOQ6a8t34qBI1SYKImXn8gObTVlXEPRsATk2f/XkZn6FIzJ1S4sc
X-Google-Smtp-Source: AGHT+IGuCDl8/NKwayI0umUFRt4zezOzmyPdXdzg64sqFdiOt0b+BRNMtdKq/wRK1BA8tF9mTTYKDA==
X-Received: by 2002:a17:907:7fa6:b0:b70:c6ee:894b with SMTP id
 a640c23a62f3a-b72e055ffe0mr832947066b.51.1762788786091; 
 Mon, 10 Nov 2025 07:33:06 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf7231dcsm1115978466b.31.2025.11.10.07.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 07:33:05 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Date: Mon, 10 Nov 2025 16:33:00 +0100
Subject: [PATCH v6 5/5] drm/nouveau/drm: Bump the driver version to 1.4.1
 to report new features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-nouveau-compv6-v6-5-83b05475f57c@mary.zone>
References: <20251110-nouveau-compv6-v6-0-83b05475f57c@mary.zone>
In-Reply-To: <20251110-nouveau-compv6-v6-0-83b05475f57c@mary.zone>
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
 James Jones <jajones@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
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

From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>

The HW can only do compression on large and huge pages, and enabling it on
4K pages leads to a MMU fault. Compression also needs kernel support for
handling the compressed kinds and managing the compression tags.

This increments the nouveau version number which allows NVK to enable it
only when the kernel actually supports both features and avoid breaking
the system if a newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mary Guillemard <mary@mary.zone>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 84a275b06295..0e409414f44d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,7 +10,7 @@
 
 #define DRIVER_MAJOR		1
 #define DRIVER_MINOR		4
-#define DRIVER_PATCHLEVEL	0
+#define DRIVER_PATCHLEVEL	1
 
 /*
  * 1.1.1:
@@ -35,6 +35,8 @@
  *        programs that get directly linked with NVKM.
  * 1.3.1:
  *      - implemented limited ABI16/NVIF interop
+ * 1.4.1:
+ *      - add variable page sizes and compression for Turing+
  */
 
 #include <linux/notifier.h>

-- 
2.51.1

