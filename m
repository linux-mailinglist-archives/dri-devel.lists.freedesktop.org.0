Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA59AD15E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D2210E82A;
	Wed, 23 Oct 2024 16:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="FcIhL0N9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46C910E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4315baec69eso66519335e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702213; x=1730307013;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IRsyBqkiezxBnssjhK1B67iF/aAHVHcHQNujZZby09I=;
 b=FcIhL0N9MvgoRn7Uc3XGjm4xjgpAoUPxZKEUC6B3dn2600GQz+ZD9nxJG+l1ZAGKJR
 6Jny7bL1NpycBcbba6nY3yWQsVzY/lIoivdwWB9rePWNxVeHF8hfyGD97oOfRGbGtPX7
 1hutXVWscNg9EbbY2nJBcOK7nXMk6XJXy9NRZ67B2yN7pl/5hg21Sm6WSZ1S3a+yIUHH
 BtbSPCLNmFc2RhdQOE3XqoDlZQQbzd7bhm/9Ex/jKdCCqzSqRXDLc7Dm0hpSBhQ0++dh
 3UwQ9eOcookiFM24Epvp179Xwp6CcD/2xj5+6UkELE5ZvMjD5cPY4LKUMs6wZqfDCQL8
 kG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702213; x=1730307013;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRsyBqkiezxBnssjhK1B67iF/aAHVHcHQNujZZby09I=;
 b=rPbwxgk6mVIkbof/OYqyeEHndv1Dr2REwM85GyQS2FxoNWneGy/eK89OgCbsNAlZQk
 WfWgX6NtvaozVP3GYtlnkAxjCxQsDxVpW8uRQdTV+6yVrvg4YhMySYFWMi0PnUo1HytL
 KpKsG7OoSNHHz2OrK1UrJkJZUEWHgbVfID7oEGwnsvRmYgog6lwZen/7yHQ2CphNAbbg
 DRENUGkqQk1rv+8mdXEMlNWyimF8FhczjStmYafuKBCdl4gkbsFSsCy63XJEpNZe4/L8
 25wdgEFSmcZkl1/1sowejf9VEG9XjUd/DGQZIznco6x28BH7/CfuvhY1rapSpqmCwUpl
 eC5g==
X-Gm-Message-State: AOJu0Yz8XiocDTgc9p/K/o2tpDLGFKzibyoVWZB+hy+26tTV8jcSsKG0
 dMXHfBLtkltR06duf0EYW0CSHf1kRzu5+eXkIVb/7izvPs7xQ0X8o+9FV9Xl6Ho=
X-Google-Smtp-Source: AGHT+IGDZgGkDPQj1asKApxHb+1RRVP4pBKwGrn8gf3ud6Z4Zj4ffcb+iWXuf3VXHoFcZCsz0HsC3w==
X-Received: by 2002:a05:600c:35d3:b0:431:1575:2e83 with SMTP id
 5b1f17b1804b1-43184201b28mr30823345e9.10.1729702213156; 
 Wed, 23 Oct 2024 09:50:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:12 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:02 +0100
Subject: [PATCH 05/37] dt-bindings: display: Add BCM2712 HVS bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-5-1cc2d5594907@raspberrypi.com>
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

The BCM2712 has a completely different HVS than the previous
generations, so let's add a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index 2e8566f47e63..f91c9dce2a44 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2711-hvs
+      - brcm,bcm2712-hvs
       - brcm,bcm2835-hvs
 
   reg:
@@ -36,7 +37,9 @@ if:
   properties:
     compatible:
       contains:
-        const: brcm,bcm2711-hvs
+        enum:
+          - brcm,bcm2711-hvs
+          - brcm,bcm2712-hvs
 
 then:
   required:

-- 
2.34.1

