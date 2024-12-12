Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB39EFB20
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0033110EE68;
	Thu, 12 Dec 2024 18:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KGPs282p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C67D10EE5F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 18:36:47 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43618283dedso8951025e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734028605; x=1734633405;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fMHTsU0ZjvRQjwquvG/Hg5h2182Nwlr0NKl2ofXPRL8=;
 b=KGPs282pQogAVjJL4X78d98MZDPjomMTAp1dr5dPZIEYPgEhdPZEurlKgwoJxgpAHl
 GRYehcZHeeLxuIYVuF7htsSATdpNxlIGpRawjq/O0xGZBEjZQB1+IVPXYteCv2zDPYCo
 w+coDNlE/RIBrydUj+UW6xE6IJ7vOPmxI4yBhKipsJ8XrPxuLJZ1bJXJy20WMm0NCVh2
 DcnmB7FrfzlQwcxANteN1OLQfBV+kwSBUaPX0hjUOUr+IvAZZlPJGGvVSXQiGpnByAOp
 eZRYFjjldmk8xQSljdYBSI+rryAewI6XzCgGN7OPkGwJdzh6PwCtsDarCx8d3f2xcz6W
 BN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734028605; x=1734633405;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fMHTsU0ZjvRQjwquvG/Hg5h2182Nwlr0NKl2ofXPRL8=;
 b=Upa22hR/RHc3SPWjpPypfoyjmlbjcCBuErx9kGg+kC/4pARIKwy720WwtdWRtLWAsk
 qMMtsHw+cum4k2mhc96igg1sLb+C5WEjx2jXCTAX6fi1+U0QFuOK36gJ7c3eeO4lbwAg
 o45Fs6Jp/8zrNzz3sKfG8cRoX0HbAExmpIUFKzE6rIYC3JvZ1Lk+iTQhy2wD5B9kjz/v
 mVXLI2SLM+yM+U1CPD/eNiNDdDsFuU6WKGwR7dRQe997/KBSIZyPnUA9LrQdNJPotb12
 5O/eK7rmSYFx3+COWHJ1D9pnXYODAjNFkbZNmQQNfExJbBMU4ZFxkODYEP9J4T0dTu0g
 ZZsg==
X-Gm-Message-State: AOJu0YyKw5e+hXvKYsom/+cah5xzWVkG9/CMlVC3Vc8ebymrw3YypxAL
 +bmYiLkLLL5Vf9Licsgas+uBMO7uy/vPcSB97RfxF524mQyTxGkm2G7BVH7inOU=
X-Gm-Gg: ASbGnctpEAxwbNMH+0brXGq9NGKa4JF7RDcMvK9/bRFOkDmNN/xAD9SWfylMHvI3omu
 3zZQVUrfWU45CynPLF7JWb1yr3I0J+zGDNw1DWklnuL9cZdcOyukFqwNbYyp+bam/mrK5Kh5Jp4
 nn0yxjzKKXmK50vwVofWgJN/wR6Bodd3YKOBBH/UPN0IKJiS/Tp4MTbOmd/vrhRASIU7cDkw1GO
 cn18MOkML/Og4l8ThkfccJMLp4q4HDnfEOMrtW7a4UiGvGF
X-Google-Smtp-Source: AGHT+IG4dP9KmyH272DNzwrKy7iYqqOHD3rxD7Qawn80ZhvjM1j+yRssRbMddmKcTh1pYEKJi0HQLA==
X-Received: by 2002:a05:600c:548a:b0:436:17e4:ad4c with SMTP id
 5b1f17b1804b1-43622823c62mr36013125e9.6.1734028605564; 
 Thu, 12 Dec 2024 10:36:45 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 10:36:45 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:31 +0000
Subject: [PATCH v3 4/7] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-4-44a7f3390331@raspberrypi.com>
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

Since commit 88bbe85dcd37 ("irqchip: bcm2836: Move SMP startup code to
arch/arm (v2)") the bcm2836-l1-intc block on bcm2711 is only used as a
base address for the smp_boot_secondary hook on 32 bit kernels. It is
not used as an interrupt controller.

Drop the binding requirement for interrupt-controller and interrupt-cells
to satisfy validation on this platform.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml  | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
index 5fda626c80ce..2ff390c1705b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
@@ -34,8 +34,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupt-controller
-  - '#interrupt-cells'
 
 additionalProperties: false
 

-- 
2.34.1

