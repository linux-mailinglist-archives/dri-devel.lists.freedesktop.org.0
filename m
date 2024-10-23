Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18029AD163
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E9210E82F;
	Wed, 23 Oct 2024 16:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bQXO4MsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04A810E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d518f9abcso4769580f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702214; x=1730307014;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KsBVoQZ8zap5DslrzzzsVJMIsK4Q16E87oM6AvNUOjA=;
 b=bQXO4MsFz5uj+wQblpo+b6r5X7f56srAGT7VmvTI6BsRluYDR9ALPHB1U8ALXH6mms
 3pokq4UAaM97l8F6eCP+uLIe7SNLU0odfIVpK/3jxm5ZXSHMUjgIjGluChtmvmMfOSe1
 HcHD8uGTEjNgTOhP3yli1ZDyylg4nntqVBmiaCE/xIHaO1nWSeXpcFIsUs37sirgMPeM
 QF+1tSA6ea3HAl7/83Hxp0f+nqfKeMOsx+KMVizbYyOpbIXBI4jLfRBxZ7K/KixzXgdw
 eilRi8KgAyaOeWEqx5OngrM7V/Yt2uWJFa19VRjskBbuCnSHAPpnnOmwhyie+ybBZhQ5
 SjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702214; x=1730307014;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KsBVoQZ8zap5DslrzzzsVJMIsK4Q16E87oM6AvNUOjA=;
 b=rUNDkh3rtGtp+Nd46iicgtQc37rUYeBIZVXuUtGBDZMtoJMhteTqB4GPmaCKh1yr4D
 B0YcBQ0+8t3BQ/mtemtW+r8vkoL/8LUu6i+whRZHt9Mwg5N5XQaOL596tC2ofmV2a8jf
 5C14Ped/S3GY1HFxn5Wb5099UeifDWFtmtJJpP5xGyeV2647uFMX5EeP68XNHxI9M2kr
 fVPLqtkkV+pYW5J6cLs+chfzLdGPcZXfZYMWmdwpjZOYI5SYhg+u3BH3R1YxXCKDjcjh
 xF88ZDIiFQHGsqX9rKw/44YYEnDrdvYbyy28+Og3lLfjprheTO8zxuSUeOf8L9IGI4/R
 ZgXA==
X-Gm-Message-State: AOJu0YxkUoX3FPKb2U1oS7JLIoo6pEeCY98XIByU1SPkZ+JLrQ8z0zqh
 ziZOUD9fRT9hOc/iJuPP5VkgMhpfgJGKbOe5nhNdO73ShGK5rIsxqn4ztGB+qvk=
X-Google-Smtp-Source: AGHT+IEPMevLaP10jHP2kjP5QjuvQyoeAseVICs2i6vuIJvW5BstXAY25poTAtlyrCUn0K4+h2nj6Q==
X-Received: by 2002:adf:f6d1:0:b0:37c:cfba:d16b with SMTP id
 ffacd0b85a97d-37efcf84673mr2298249f8f.44.1729702214024; 
 Wed, 23 Oct 2024 09:50:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:13 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:03 +0100
Subject: [PATCH 06/37] dt-bindings: display: Add BCM2712 PixelValve
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-6-1cc2d5594907@raspberrypi.com>
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

The BCM2712 has 3 different pixelvalves that are similar to the ones
found in the previous generations but with slightly different
capabilities.

Express that using a new set of compatibles.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
index 4e1ba03f6477..6b5b1d3fbc0b 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
@@ -20,6 +20,9 @@ properties:
       - brcm,bcm2711-pixelvalve2
       - brcm,bcm2711-pixelvalve3
       - brcm,bcm2711-pixelvalve4
+      - brcm,bcm2712-pixelvalve0
+      - brcm,bcm2712-pixelvalve1
+      - brcm,bcm2712-pixelvalve2
 
   reg:
     maxItems: 1

-- 
2.34.1

