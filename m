Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E39B0AC7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6857610EB2B;
	Fri, 25 Oct 2024 17:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="am2DU2g5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E68E10E3F7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:07 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-37d4c1b1455so1467691f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876566; x=1730481366;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uvy6mw3HkfOGNiDeKKmifz1sEp4TpAMlLMBCwtNZJJ8=;
 b=am2DU2g5/JN3QVNxzA4EFdaIvvE4KUtStEY+B8HEP6or+y0tFcRdZciqplHPdsWLlG
 JIybjEfVqVUWxHrn2qKhEiHvI9zBILhc+ARezHif1IRpleS4u5TjqTsTkXcbFryEHLBY
 GkwZVXRTLAh8OW/VGIYSPAKwz13inkoX/A79oj2KHF4JuQLM9QWkS5JZFKoVy026vG7h
 ptHmwREVJS9ZjqY5TLZ9T54xCzFm3WV7sP7RigKJnjW0ViCgbqcWLhlBgxJEvcFhStFS
 gXfIhixT4Gcu74wFzTCW+4KzdNZnpVHvq0sPxsOrTFGaqBTn7kakRAhNAiToscxluNKN
 LfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876566; x=1730481366;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uvy6mw3HkfOGNiDeKKmifz1sEp4TpAMlLMBCwtNZJJ8=;
 b=DKWdXoJtRa54THn25KkvYvVlrIMFcwFuMZ+ZoXwlrSZ+f2mysVK4Cv5aXoow6RsZGN
 N2ZML3WFxM1/IcqSqpa3/LfpiN4TQJGEjJQFfmm6p2NBr0D2Xr9nn/wQh8HTgDBxZMHn
 5QxggThQFZcMjrpAeF1IU0OJT5ERx8TIQ7zAgfMNnPfRKwppeX/8ObaPEUh8Wr+1aJAY
 azzjn0pALlOlb6s1kgQq9PQj/+BTjohoU1SJXD9e+/UzRHWdTjojEar6CQahi74jnPn5
 +Ccmrxk0ZEIJ+yckgL6JeMZaccvotDwMWS2VEjBEzlNygGAuDa/BB6rRCrvme+YdW9qd
 XsMQ==
X-Gm-Message-State: AOJu0Yy1ZZMZRXzWZE6TKd6BbHNz6RkkELEO1hwAylBPWr0vNWJiKTuB
 mNAl1HpEzbBYESgdBeruBjvEzCD/EcZY2IV1sM2Or9cTzuGRj8pmG33Ai//EHEI=
X-Google-Smtp-Source: AGHT+IHirezA1gYr0G/DUtQrSt/DP/1VMOY/GWyL0+CDPDCZHRfOmDWirKI9sgtwCb0jA2Kn8vQ++g==
X-Received: by 2002:adf:ea8d:0:b0:37c:ddab:a626 with SMTP id
 ffacd0b85a97d-380610e69f9mr139123f8f.7.1729876565769; 
 Fri, 25 Oct 2024 10:16:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:05 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:36 +0100
Subject: [PATCH v2 05/36] dt-bindings: display: Add BCM2712 PixelValve bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-5-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 has 3 different pixelvalves that are similar to the ones
found in the previous generations but with slightly different
capabilities.

Express that using a new set of compatibles.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

