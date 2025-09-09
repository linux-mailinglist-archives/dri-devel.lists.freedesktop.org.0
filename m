Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D674CB50F53
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD4510E868;
	Wed, 10 Sep 2025 07:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UvoenBvS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C04B10E263
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 16:53:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45de56a042dso18000905e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 09:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757436797; x=1758041597; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m97kyP3HTS70kAnw3EPRct0ZUapkHpzYxU+r81cO+AM=;
 b=UvoenBvS6W0qMoTuQrnXxlIIySDKFPnvV7MKNdxOtgQH9AdizJvB0PpN86aRFHLvJt
 iwYVyZMlkFo8VguS9rb3pLp4nAeiqsZ2C5PMHYycXLuM0jWwbrXSEmGfY4oLexw8G0jl
 3B7wDFNeK7cK3OpMZ39d3EqD3ZerS8PIOUDK0JomaFUJ99ZBASCftbInzQBVdpiSVORi
 arh5t9Mh4yZec7gtsnC/BOKFC7eyGlGykFuzA/J2c6VDwARXB5QTJvq9acgIhC4Mv9kv
 pqRb5WyMBUxgZ2b9iDkugatgcPE94y2c4fNWbhfd4cmbU3iw+HkGNU4Ci/Ul/6mJe5Dj
 ghAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757436797; x=1758041597;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m97kyP3HTS70kAnw3EPRct0ZUapkHpzYxU+r81cO+AM=;
 b=qzUFCYW81dJZZnPZIJM+nI6QIO6X4p4BQS5fHB5m8GyqeRq1/sui1rnfySPsH2CtBV
 JSj4KNzYa/586jTUan96fUh+kuR/e1s0dtEfMLenPthM4Mfa7WiGg8l0ReAQkcTpgw5j
 ry9dUONSHvhOADP5G5KG8gBKXb+h3ie788wjixVCmIa2j5POYcMte+0fS9zl2RSIOtjR
 X7jx+E9PMylm6hE2UZPg9cmvTf6R+7oscMK/DgpmPeIWTYcyVdA6r73cpYPCPzcCKts3
 4lO/slCdGW4rTzlJ1qxmMHbF8l4eVb5tsVSxuaDWAkY4GHDfOGHavCjyy1RkgUITMK3q
 vGng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd+fsiA4PiDi5mCjA5haKXThdS7PmL4arPBaCbPiYq7m6D4jsqVyj2Nr1qVFM0Sqj8qszIawp8EGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVD7dtVchht8ohHL+m6ZhTv3BNmzmU+piDrHGHsVVpsIuQUFzE
 MS1Y/OspXocYQFwYFtld4WxxTud9g4riTAx8tlrdxH9LYbgBSSLDbNgt
X-Gm-Gg: ASbGnctSgJrzP4uzrjIuDK6DCF2t2/naYi86aL1wkMcOYOFltjSLG6XyJFWFu3DRSdx
 lP+kTFtz+kxgvA7pboKrFeFcC7QioNYuU2Aa3CebK2ZBfYX7i2Nx6su7nD/tBaDZJGwdnKaFu6+
 xnBdur6r33cJATBUrVfvq9CIh0udggFxgi/b6rf6FsBQXhP6uWPju7HZBxZDmK/DFyoYf2dACkj
 IqA59C1IESOD2zHCYOHKeH+YD7f0VVgvkSZAX3L6wYrULnVYMEK2FkndTvUpbJftbLa6fBIhULs
 NWpii7dEVxG9CO9Ou9eJyL0PQkDcwOKnMvOjvNdZH4X6TrT1IrubjrfxMfcesL6r64323flMOC6
 pMIgaW5kU4t58Gq2q89hknywI2y7bNXFR7RlzOadKHXYGmNBiQjuXYBHsvvB/kBNC
X-Google-Smtp-Source: AGHT+IEqBRl9J8D3sxXoUKww47Xb7qU0+nNIVTgF1/LB1fSoYc69LlXxBvnR0fTOpf1FSeIqKxSZEQ==
X-Received: by 2002:a05:600c:a08c:b0:45b:8a0e:cda9 with SMTP id
 5b1f17b1804b1-45dddf22ecdmr100621285e9.2.1757436796956; 
 Tue, 09 Sep 2025 09:53:16 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9ab7c7dbsm314379085e9.11.2025.09.09.09.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 09:53:16 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 09 Sep 2025 18:52:45 +0200
Subject: [PATCH v2 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-st7920-v2-3-409f4890fb5f@gmail.com>
References: <20250909-st7920-v2-0-409f4890fb5f@gmail.com>
In-Reply-To: <20250909-st7920-v2-0-409f4890fb5f@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Wed, 10 Sep 2025 07:28:23 +0000
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

Add Iker as ST7920 driver maintainer.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ddf37f0acc960039422ef988cadfa7176972fc5..79b8a277e38b55ebcff05450d6c565c0d87c6b51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7861,6 +7861,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
 F:	drivers/gpu/drm/sitronix/st7735r.c
 
+DRM DRIVER FOR SITRONIX ST7920 LCD DISPLAYS
+M:	Iker Pedrosa <ikerpedrosam@gmail.com>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/sitronix,st7920.yaml
+F:	drivers/gpu/drm/sitronix/st7920.c
+
 DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained

-- 
2.51.0

