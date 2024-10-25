Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424ED9B0ABE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9228D10EB2F;
	Fri, 25 Oct 2024 17:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MARRE6km";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7629010EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-37d4c1b1455so1467743f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876569; x=1730481369;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GHIbxCZv7ndlL/NngNJdWVaw8pnmec8lE+r1y4sRvZg=;
 b=MARRE6km/eTYiTCYH5+8M8g2l9LrvLB4HqgjS/t849CBk5iRrsPBOxlUx9KiCWfSmN
 jKUu5v76dLuiRCfZ1flMpUWOwNqHAShxe90SN1muX8eB7fE/XaRDSOKM18ytBMDeh7FK
 nr6OB+NrojEBEE3qDOHYTwP6Yc7XsRTMjaQ1er0LHy85JTp02+evR26E7vReIbKhsML5
 dSjyStKdhEJaH70I9cUPe+cFiU+PEsU9g8lqIhMMnxIWkIB1/677sAfaN7Wmx3WMZNzo
 0IdCZZRlfh6ICwW6DsgFkH5NFQ1U97jCqW+1lDsPvWh2Q9zLTV4nhibvO8gaM4Ztq8tb
 PRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876569; x=1730481369;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHIbxCZv7ndlL/NngNJdWVaw8pnmec8lE+r1y4sRvZg=;
 b=u3P6CJE+1EwCHa5burG0xShpIoGudJdFS9aAWlkXJxaYaJS/KPuJ7Npm1XlueotzQO
 6ZbkS+zh3ab0j307w2dnYnm9iBMSoR7wqp+S/Rw4h9YldiNtGr8lx/3d4J9dhI8XpPKu
 y24Ylfq7wHOf0+piWDjqBKYlkyV+81pjQUDp1by3eq/NqKAm+QxwlNaiWwtxCnr11/3c
 731VYdp6eS0Ku07ci7f/ae5+SPuy/NYqhSUqW+1QCZ5D6BWCy6LnG8SL9YbOyf6epQcp
 b6HWNXfIIItQ2/H4O0UxORMvUlgYI1oEIg2D96SKXunVKVTC8+2yNOtbzJVfWpgFh4tv
 ny/g==
X-Gm-Message-State: AOJu0Yw9srUJZKgA9QIqQSZXd05N/WMzyyA7Cs2MIixgO+a9eUCn20eC
 lJwEyJAeveCJu6iOlN42PeQ7ZtBgXsVm86nOFmuY4AI9SQrOcmDGwL1L1oHwTYs=
X-Google-Smtp-Source: AGHT+IEtkqmEo1cHWR2W1weuYPM4uWgJxftiucw4MZPmb7qQfL+iD3mzdPD9IiAb9rW3E2dTgpbMnA==
X-Received: by 2002:a5d:6082:0:b0:374:baeb:2ec with SMTP id
 ffacd0b85a97d-38061122a87mr106867f8f.19.1729876568721; 
 Fri, 25 Oct 2024 10:16:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:08 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:39 +0100
Subject: [PATCH v2 08/36] dt-bindings: display: Add BCM2712 KMS driver bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-8-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 SoC comes with a new variation of the videocore display
pipeline. Let's create a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
index 49a5e041aa49..2aa9d5d2afff 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2711-vc5
+      - brcm,bcm2712-vc6
       - brcm,bcm2835-vc4
       - brcm,cygnus-vc4
 

-- 
2.34.1

