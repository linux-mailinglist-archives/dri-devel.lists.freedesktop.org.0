Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2961DBBED91
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 19:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC1E10E443;
	Mon,  6 Oct 2025 17:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XtyVhEQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982DC10E443
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 17:49:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso4141223f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759772953; x=1760377753; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m97kyP3HTS70kAnw3EPRct0ZUapkHpzYxU+r81cO+AM=;
 b=XtyVhEQGUXChbF2UbMFvlnpTHDd6UAug+KlUzc76rnRrb4IL+wmdRZiMZdAJB4fdIW
 2SkikbuqoTvB3HYkuPZB6h8gJhjAEJV7tLJc5NEz7mdJqzjcCmv/an97z6Tyx4Cvfmm4
 GW4MJalCfegjIWVCmKdXE27CiBAPTER5nl9DGI1fbs+4BY762ACpW9h+1CRlqP5OsifU
 twOflY6eBSEGm6vJ6oJH56eCS2WtdGMdgmGNSmtiw5DSuOtHPwaHVy6b535EVkemmv9y
 Yvtu9VweK1j3H2EAmA5l4cNI9K27Sc2bxE+68HDGCnd1RA62LqZiYNAe8y+fgjYaMjUs
 XxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759772953; x=1760377753;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m97kyP3HTS70kAnw3EPRct0ZUapkHpzYxU+r81cO+AM=;
 b=ZytHItimYpeOq67CksMfIdVNqsRDdSZS4YhNj9yUFMCyrmA/QdeErUsadA66iw1JP6
 XyQq9N76Z2w8Mmi40/cnsrSIfOPp9J3TLiA8GA+lEuaWtzwKVo5W/qJ9ZHMrr5nSkTK4
 HIVPBLP6+Z2sy185nJhdpl/boLA9m/xiUsro7/oDEEUJWTh74ogy0x3ZJFm2mRHgDpWn
 62t9miERXEgq0ufiEtEioeznrr5ZIJOYDJm6yKfgUFaU0ZM/X9gyD7MwLvmEjHGHocwU
 GfkiHnbfctSgMxCod4cSP32dl53n66rmzL+l4f+EdW/sG1YoiyY+IN8MJJtinyI/6ng7
 TQ8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0V+iLfoyIQ2E1V8tqxHD8D0TOu3qBBWST2eUwDCdjemvKh6ZMzPOhXKCdb0pEKAWBlN/Ek7qVoUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyST2g6s0o4/sKw+LeCrAEAGPU+kBuybnyChpwEO8kUnmlhk+EB
 I7bTzvy8zbaVPnkzjLKr+ouThalNle088ujPn48BmSogryizNlFa3RKX
X-Gm-Gg: ASbGncsNQmFgFHtF7atpHDLKV8xpg0m3I1gzElCgYdmTsmh6CwYKKyWKaXODKSLaDbg
 dUYyuafZ+C+lJ+Z7whn+JT+0sRwHJTtNBAbYYdHO2uh4laiEQ9spXC7ZkgC289gJVC1yUQOjue3
 LmKJa2QtPjvbtMOq1RoboRcv3FnaiWp9dEfhLhyHsgEzuFLQ67xxFC5yXoZPeUpYfo/jqWAUU6K
 Sraz/4LxyLuyJSsH/eQgH4CY/EqPI7pLI31jWYSQ17K2wBH0PVEbCl3i51TB4dw1w7BD/X67Gsj
 YV1iBs3OkQI5ChyFI/jDa8IfJFVvFxX4oeOSlSoWjg6nZQrm8zSqu+tqQcoU+4T7WQCHDH3njyk
 OaK2UmeguTv5U4rjt8/c1mTMO5Ih+dPxg4623M5m91fs8aVRPrikFv9Q4binkiESFHkq9lkVsDt
 Q8RPmXIPgXL6Rf
X-Google-Smtp-Source: AGHT+IE2Pzmgs3VUZH/0TbCLMEfb48/r3e2i7E/BkZcZEo5ZwNdHsN2nAkcr5VfRqIzxaVDfKWYPyg==
X-Received: by 2002:adf:e58d:0:b0:425:82b4:a099 with SMTP id
 ffacd0b85a97d-42582b4a0bcmr165796f8f.0.1759772952950; 
 Mon, 06 Oct 2025 10:49:12 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723431f5sm165583805e9.2.2025.10.06.10.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 10:49:12 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 06 Oct 2025 19:48:55 +0200
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-st7920-v3-3-4f89d656fa03@gmail.com>
References: <20251006-st7920-v3-0-4f89d656fa03@gmail.com>
In-Reply-To: <20251006-st7920-v3-0-4f89d656fa03@gmail.com>
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

