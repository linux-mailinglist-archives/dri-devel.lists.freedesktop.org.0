Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8299EFB1C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7DF10EE5F;
	Thu, 12 Dec 2024 18:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JGZ4SU4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F6410EE5F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 18:36:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361ecebc4dso7080225e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734028606; x=1734633406;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
 b=JGZ4SU4txaqjg9o/70Vdxj3KSb2wtPop+8KD00lpmkksi8OUSD3wR0T26EjESYEnMO
 JXREWTrDv3DaKXFyvBv5euy4+M5Q4lCYI+A4FUmCJLAtZbz2bI5v+Sc0ABzrN7oy35oK
 BJzGsKrJ3ZpJ4lNF0tboe66YeRTRWj87IOsa76Y/rwCsAOxsl4QvfPoOnFF/E2BvEIE5
 yjvYJwSgTAZeu+6fMaxD6zJ0YiRMu2I621Y176IGj247d17IroU9ZsoDIr1UEFodqXEw
 bkBfnEyM4FaNSLhiiUStKQurfrSE776NlOZAuLRTXYdw+bIiMu3aIBz+1bujTQlkV9HG
 X65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734028606; x=1734633406;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
 b=CmYph09n5z/1IzoB7t24HiUm8btNxdX5QbhdNTfVIVDqzxvVDBORlgcQR5vyYlDTOR
 cJxNJipzjmrHwuPVsXdT92cxzgmCTYtVRLk9MXP2r7Y5vWZXRU9+tlieJo115/vhUN1l
 nJ/4mqYZMkVxWiITmSWA0MFFqJaplaMyUuSvgW3ORW6DXTyVLW2I4cZdBTkJ5DjZjQm0
 kWYvJ2aMd+Uvkqp7Fbg2a9/UAw9qSbJJCf6AktV13m2MHIg9qnOl9Ijin9iqDMR43r2/
 KaQjkfN19U7c9Q/gw7it6OW2eWGR0XbKnSBaiwPTVAcYeCbL3Gp6QxbbkGotmvv5qFM/
 Fkbg==
X-Gm-Message-State: AOJu0YyGCYFxy4J1aUBP3jF5YxyUHRYgDO5h8vLnsZl/mAjsQDZi9N/f
 eSe5oUwfOGpb2RdgzhfbKR4AkcmVtVa94DVJGHJSXRtuBmY54byMvY1Z2WT4M44=
X-Gm-Gg: ASbGncupuoAqjhJXyLBBuWkUUVOuD0uMEgXDWnzQYu/E00a2oK8o3tRd7+sCa5husz8
 AehSEdugYXQ9CuGDQKkFb2y53L7U5KA5AowRVZMntGqE6hew4t71fkyVCnhhJvh9siooeJ2v+hU
 s8icIExd7yoZoJMnbnPhdbPswrH1BdNCWeDFci6Cd4m2YQwv4NvsRwhoCBsKRLqKyzB9mS7ZBvL
 qInx/WY1EUeAKofz1kVDCjNifUEvODe44/K6NKGPMXwyawT
X-Google-Smtp-Source: AGHT+IGL4E9j9A1tMS6SuUyiiajyBjok8IwHS0bLS9tymQ53Yae5HQb0IhaVfgk6fsEuOcpfD85mUQ==
X-Received: by 2002:a05:600c:1d2a:b0:431:3bf9:3ebb with SMTP id
 5b1f17b1804b1-4362285f769mr38353035e9.24.1734028606518; 
 Thu, 12 Dec 2024 10:36:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 10:36:46 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:32 +0000
Subject: [PATCH v3 5/7] arm64: dts: broadcom: Rename bcm2712 interrupt
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-5-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
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

CHECK_DTBS produces errors on bcm2712-rpi-5-b.dtb and bcm2712-d-rpi-5-b.dtb
of:
intc@7d508380: $nodename:0: 'intc@7d508380' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
        from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
intc@7d508400: $nodename:0: 'intc@7d508400' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
        from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#

Rename the nodes from intc to interrupt-controller.

Fixes: f66b382affd8 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 39305e0869ec..bd78af0211b6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -336,7 +336,7 @@ ddc1: i2c@7d508280 {
 			#size-cells = <0>;
 		};
 
-		bsc_irq: intc@7d508380 {
+		bsc_irq: interrupt-controller@7d508380 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d508380 0x10>;
 			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
@@ -344,7 +344,7 @@ bsc_irq: intc@7d508380 {
 			#interrupt-cells = <1>;
 		};
 
-		main_irq: intc@7d508400 {
+		main_irq: interrupt-controller@7d508400 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d508400 0x10>;
 			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.34.1

