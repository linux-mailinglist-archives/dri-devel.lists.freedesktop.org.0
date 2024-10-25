Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC7F9B0ABD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873F910EB2C;
	Fri, 25 Oct 2024 17:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nmnwtwp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847C710E3F7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso22136225e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876568; x=1730481368;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fLIH9tyCJziS0oZVp659ectLCUh/04IQKJ1VKaLHRLQ=;
 b=nmnwtwp5bZKA6yCGt9izuhkMlWuE10PLDk08g453cic55Z5Gd8nVNioYqFwprnbbYH
 qPgvnOBfBddfGrDquYbBoWjlhlbpPGbELQXeHKjXR8ppHSea8DsN1VVRfx3R/ibTebWN
 uzAzzAHPrh7WSGbf98mw+eXthUaG9NpY9++hZ+OkRRrIxCT6nubScrhbQk3TtQjWtd8O
 n6DTVdcZH51HwJW+w/XLjjk3AmF+2HeMCEw7NEtAw+Ytx7fbAyLGVRmoRzkCjll55sPC
 7FoDBU6SWuwKUevA/FmlrLQBTqj8K7QN9OHZ4CfhBHPSlt51S01NIvsO03fP+wcAp+MB
 wC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876568; x=1730481368;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLIH9tyCJziS0oZVp659ectLCUh/04IQKJ1VKaLHRLQ=;
 b=and3MhzuBus2uDXi+vzQt6OawijXGx4lFAf88iasGSabh5zIuh2JgWMfEd8EYaKXAO
 El5JZZHM6JUyWC/Si1TEwY33ByRQ8dQhbf5f2L58Uj6eyJ8kZToxvi603tgb9z8ba+pZ
 3lMH4lWqfM8m8UTw7ExFvmyC2wUg6a5PycsoQUdfWFQR9Vfx5FzZfe/+E2LCjcOh6dcG
 Og9o+2XbkGoIXMNqgHZ2nNBHSsNFbVLzVFYcsDFKZ0hmqWlFR3RA1wz4f6B0zH3ymjsv
 euc73YaKIm/sodc2f8RnF0waxDWEoE2sQqBeFIGB8UnDPffD+91Qd2JrUodKCE9YEIkO
 wSjA==
X-Gm-Message-State: AOJu0YwaTbG6jbWN1N/sguDZagWpYVk9MzvdWZo1QclfXGcbUX04qze2
 SNsRD/XhvMczmAd8MGHnUBLusbfbuyMwmw3tV5pbvWQ05Jp3sjjU9Lg2V95dhM4=
X-Google-Smtp-Source: AGHT+IHeSVH8WqDyVkxiZojUuOptC1WUDDZpkGk6AneCSrSzoFw3bb8pQ04irSZpkbra+Ogj57FSIw==
X-Received: by 2002:a05:600c:3b96:b0:431:50cb:2398 with SMTP id
 5b1f17b1804b1-431841e13fdmr91410915e9.2.1729876567815; 
 Fri, 25 Oct 2024 10:16:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:07 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:38 +0100
Subject: [PATCH v2 07/36] dt-bindings: display: Add BCM2712 MOPLET bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-7-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 has a MOPLET controller which is basically a TXP without the
transpose feature.

Express that by adding a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
index c9c08042cffc..16f45afd2bad 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2712-mop
+      - brcm,bcm2712-moplet
       - brcm,bcm2835-txp
 
   reg:

-- 
2.34.1

