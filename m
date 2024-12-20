Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0059F992B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 19:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB7110F024;
	Fri, 20 Dec 2024 18:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Eo5vBRJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C0310F022
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 18:11:27 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43622354a3eso15511495e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 10:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734718286; x=1735323086;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
 b=Eo5vBRJyJq9zf6p6h6mdTs1obc8ewDJmW1rUgZHrxjhFbviWosdkf6pn8ZEwrzik72
 y+BAGQZiEAvzysmLFFaLMlEmxdQr6xiVEJ8w/Mt5PfbLCwlk6GrJuUjMSuiHmZi2KsX/
 o1uyqKQuc7L4L7AQpsXQr+hmztQ/6AATLK3vykCLBX8sRLdkiBemBN9WLfOlfboTIqYf
 wBZY6y1zMdsUBKDb6tBqUNSn+flNK2R+TEPnHezvIDCyA5mDN0C36Q633YGUUgioxUaf
 zPVyO240WZtpTkDJy4eKuI864BQ2Ia8ZnBAFII7fZiyQHzEsf5NOqkKYISCjFfwaH4GI
 ltSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734718286; x=1735323086;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
 b=ii9tkQtd/NAi1hbo34oZPPPhZpINjHAR6kHpflWkmIotc0TyRevCoHzuADPr2W7EcC
 k3MHOafQpzb43drrZPRBkcN5urTMdut8cKZf2W0KOXegi4UMALzghz/HFZabgSSg2FFg
 tiDAA+8GZVEPjwTMAZMqrZy5QjkTyp/RB96KoZFXzUktLe0el1SvQxfVscGY45lTlWfU
 sBfX/HUeQc9R1kjCW6r12vocE375+yeg89Nw9q39oZMUi3HqCLqyI7CgxS/+qWRPbM8w
 tpddKKNgQrZs34e9yesodDe2dpcOhQp+cAi/Apc0mlHKjluuQIhacUUS/esaUXqHOYWx
 RxxA==
X-Gm-Message-State: AOJu0YxzC9F2eNVlddAD8KDDKN0plmlBkwalGyj+MEg0YPmvtpQ2F3He
 rRQWSQ5aauWWwD8Xy2j6XiI0DhToyHJWpmRCzXBLJaoo+m5taYW9OeDPMvBjthQ=
X-Gm-Gg: ASbGncskFvl6FDaB8i2u3rFxjkjsc2hgijAtIISl5hay2LlnJqvPTkvPc90p4p6goK+
 zEOFIlxyIxvmtuDrd2KF8Wiox5KQL9jImasv5LHBaieR89/ODuBb9MIw6GKRZ/a+OkbsR7j3Icc
 LZjtA1t0MsgrKeRSkN7Jji5SjcLVyT2DoBPYrpNN6y6kfM7IS/Q6KxRomNFlKadLpsz74NJoqzV
 47Vy/DpPSk6CJVK1lKOU+sSXrYDJORArEOuUxHJR0iaFv+X
X-Google-Smtp-Source: AGHT+IGkUJ6wiQ+PFzhrRg9QEs0JFLnzOAYHhAM3qA2cpb4nCgeQZdE914UHndE0hNBgPmIssevaTg==
X-Received: by 2002:a05:600c:4586:b0:434:a902:97cd with SMTP id
 5b1f17b1804b1-4366864364dmr37590895e9.12.1734718286362; 
 Fri, 20 Dec 2024 10:11:26 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4366127c488sm51460075e9.27.2024.12.20.10.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 10:11:25 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 18:11:13 +0000
Subject: [PATCH v5 3/3] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dt-bcm2712-fixes-v5-3-cbbf13d2e97a@raspberrypi.com>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
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
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

