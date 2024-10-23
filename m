Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FA39AD164
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E2310E832;
	Wed, 23 Oct 2024 16:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="X1X2/Y9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB4A10E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:17 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43161e7bb25so57700525e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702216; x=1730307016;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5yIqSMQIbhgYZ5JV0ptgvT7eERweCUm7MDofNLmccWE=;
 b=X1X2/Y9QL23wsM7WifPnyqUvR1zzuZKnC2Jz8V+M6Bq8+kNAE+Yu6x5Tei3qSJIo56
 0lGZETVw/ZsDug+nuMx1QIQglATJ6ONO5D4i42qaipX23pNUoJpjPd7cp/do8gxNa0qW
 uB/LRLc6pHq/hHTBSttoIDQ2rMbRhUDXzbIbRkhQ4bhS9fygGX1nNsWL8Fi89LZYaffQ
 QjUzoM6VgptKNl3lHBx0+5kfxxxkforaowGhnVcFXTfDXBPa+D278jaDXaGDgoGUfJ3e
 ZNtmEjhbpZzErxiiNTcCE7Z2zkAr2/Wbk4+m0huFvchuEll2EAToxVf7zj3T5iykr/6j
 UR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702216; x=1730307016;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yIqSMQIbhgYZ5JV0ptgvT7eERweCUm7MDofNLmccWE=;
 b=ETBUagAy5cjD+Q7BCgQZXRlz+W+yDEyEHxNjAPyd0E52Kd3yo8NWlMBL87SykYN4BH
 v/b6CG+Rp76GV1Eq26yN8sixhGsqCHWUFlFM5yS0Xb9aN0BOMf1kEXeCcS6ouUUBT/Z5
 TXvktaId2htAFDvJlKBFdKtlPhr+wPu3khpuLKT5Ang3+PsUF3Sj/U7XTBOhSze/3Wwb
 4XewyqZnObXIY07UBGQu/XAZq3tLep+nwbwTk8Qm6QFCaRV0SbRW6TaxLkGpnZD2EKc3
 BD8SAoFOwvm8NSr0YY6/cnLpfA4w/9TazL+1Ksc+rRQ9X8Tzlunxrbvb4bW9WkGUKHhh
 3nDw==
X-Gm-Message-State: AOJu0Yy7RLZJQXfs7Ty17tO4nKoUB0v4xgrsJ195m/Jn20GSsJECYlOj
 4xpylSXS+PCiYC7zmlFYNKY/cHSzB2J17xNp0SOY9T0mHTHEBLzY+mWSuzJ5Ix8=
X-Google-Smtp-Source: AGHT+IFhoWS1TvVBeb/zedIzvkvu/wsYZ/e4vvOHGOZFIjQ6RHyIgZHgWxuLAsd/TW4PoufcpONuBQ==
X-Received: by 2002:a05:600c:3b86:b0:42c:b80e:5e50 with SMTP id
 5b1f17b1804b1-4318408b348mr29910635e9.0.1729702215724; 
 Wed, 23 Oct 2024 09:50:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:15 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:05 +0100
Subject: [PATCH 08/37] dt-bindings: display: Add BCM2712 MOPLET bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-8-1cc2d5594907@raspberrypi.com>
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

The BCM2712 has a MOPLET controller which is basically a TXP without the
transpose feature.

Express that by adding a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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

