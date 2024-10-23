Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2941C9AD162
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA3210E831;
	Wed, 23 Oct 2024 16:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aaf59b69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9513710E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so70318135e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702215; x=1730307015;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4FUFXgI6QaPA6jQr/YtcQOxmD1Pid9zdxxQkfAdgTGE=;
 b=aaf59b69Ofgi9sK76rQ/bYK6ecBDIIJ7Ek3tRVabl85+HNQY74ronjA+uerdOMwJEA
 5/swwyp3Rm3FPdJmnUFmmoT/ytL66sxia0SmF2KmjHV9XH4e2k68YnHccdBWOljQVsMw
 dFHlhBJCvVZlhoEmZofVnPTvjhGFQUU7eEE1cI8yAJpaGCbAGtiO9dlkHaikur/q7X2B
 KqC0FEDdVYjZowauXF2eqcy9dl7guS8osqJ8XmUmCFuGUMhXBMA3Om50dHZ2YQQpKrVD
 a23TgqP82pbWWeVYbc/eR8wiqO9RZjnOQ6wbp2T7Gg3gZYxG35nUprRuAiX+DssvBVeY
 423A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702215; x=1730307015;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FUFXgI6QaPA6jQr/YtcQOxmD1Pid9zdxxQkfAdgTGE=;
 b=wzduIw+0RQmERXOFtM9QQcxHr4gAiHsAdkNyt7jGKrHK3mRpdV2+pohi74HpQUo7WN
 nzjDo214/ZKA7XG4P21hxkurkO7FEy4Vnq6SL7ghc3PMoloxVFdpt6CU2goCQgtnTEGU
 s3y7FQAVHjW+tg0xLIOTw6i8u68RBzRq4/1vTw9sXG4HCamfp5b/dLn5GL4mrjMYuEne
 XI1f14NsckSjMLBw7883rAnu1Mqptd52/LkxySSUX4VHZeA41CUMJhkRrWnKCcxMM86l
 spIH0GqZgUNS9IP5p1fPQVmhPGNnlW1zU9DiQ6goQXodFEhwX/Gg7ODxvqRPws1qWX4O
 yUvw==
X-Gm-Message-State: AOJu0YxQWghkpirRAsYOAQT0bga3g//8IEWQWY6xKXiWqQp1yyfUYKe7
 xD4aDpC04aW9u+Abf901fPFD2HgLsI8tbp8mAdMeaXhvWmToY9bkihtFY4u2P3M=
X-Google-Smtp-Source: AGHT+IHIUSOHmyQPqkYRz55BazSmKBq/h2kF4iw8nhK8CZovAtLyhCKZ0YMIVAUaEiQvYpcstK2LyA==
X-Received: by 2002:a05:600c:4f86:b0:431:5df7:b337 with SMTP id
 5b1f17b1804b1-4318413e293mr25123795e9.8.1729702214888; 
 Wed, 23 Oct 2024 09:50:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:14 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:04 +0100
Subject: [PATCH 07/37] dt-bindings: display: Add BCM2712 MOP bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-7-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

From: Maxime Ripard <mripard@kernel.org>

The BCM2712 has a MOP controller which is basically a new revision of
the TXP.

Express that by adding a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
index bb186197e471..c9c08042cffc 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm2835-txp
+    enum:
+      - brcm,bcm2712-mop
+      - brcm,bcm2835-txp
 
   reg:
     maxItems: 1

-- 
2.34.1

