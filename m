Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F339EEFA6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D7610EE33;
	Thu, 12 Dec 2024 16:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MOhvhoS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E401A10EE2D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 16:19:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so1303914f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734020349; x=1734625149;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
 b=MOhvhoS4XsGmTn1X/xtzAIyHZDtBg79CbmA8yV0Gm73SxhG1eOpmID6sck4jcbwCMF
 RIoFmF07G4blRhRB3uT8X36xpeCnkTTByDdNyvE4Y/obqkFYpRN1NIXL2V8fqd8XR+3p
 4vjsS0PdKTzRJaPu/ZGiUFJ/p3hTNmdy99sd13S1NyrwP9yJO11P5qkH0sDtX8wIHKT4
 ErkmDuABDTNfDEbhmvI9I8IMLHBwXcdCaKxtEOdNj0/o+q5lx44t+o28BW66b2y15pjj
 gwIenWtazhopS3SC/uWNgRgMrJV5CodILeASJ9t7qS6ndmx+ntWOlKDGIrfNJ0xySmYR
 BCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734020349; x=1734625149;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
 b=EhukCw3nZ/AaVgIbL4U1MwspQEraGozQV57WIpUnaskqIBLBtQXTeu2+StdFikg0mo
 bPK7vAc92IRKQ0UzY0ocrWSinbiu7NRytQEb2SFlG0d/ccIXLe06pGKpDZ+huPktLWRj
 G9GiTRiS2nasTx7XRqVEeUuFK/NYPo5V4L2mpt4V1Dlrn72Qy3Pf8E/5BRQfSnKvmWN6
 HQ+A2jjpOeCz9ZFvbwG/lr7lrckm2fkgnYncRXZiRrNrvwZjaNCrlYdNhX841EPnZepd
 FaowwdN/qIfECNWdG/0/VMmab3QL0gfLoTwMraqCMhYirINLlKQcKm5oMX/hoLQuttUX
 gdMg==
X-Gm-Message-State: AOJu0YyKRL9F0D3SMkCIPEFduqsCDaMovI3G+NfsXvsNys3XijHpivvg
 IH2Fw9MsCabtH1SaHOB2IKaVcwRF67v48P17rp0FTY0M5LGg7kDxkZx+Qs50po8=
X-Gm-Gg: ASbGnctWwZXekV8yc4cQslyF2I8nO+maM3QN0jTE/52McEVwr/TFOMKF1OEjbeHj2X4
 ljAwL09DUWOBMLTjpEwGwl8N+E2PnWFVYHuwo18MlSJsqRCcTxytBpxoeeYy5EDOnjUCO+eYwWK
 BLa5J18EPe/VntphhA1N1/iiUawl2AqHZIgUhLjuODJr4Mx/cQmcH6NtjOS/h2NPwBVfME2uVa0
 Iv033VOqdJ28rTkeIJoMihP0dbMXGfBFRHRLqoqbHmUGB19
X-Google-Smtp-Source: AGHT+IF5fGK4r7ZLa2m+qI5r0OgFGblEAcI0fkSDXGfPScJLkRcm9817axtMEaqmzm5LoWtpIkmCVA==
X-Received: by 2002:a5d:64ae:0:b0:386:321e:f124 with SMTP id
 ffacd0b85a97d-387887fe47cmr2895855f8f.13.1734020349363; 
 Thu, 12 Dec 2024 08:19:09 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 08:19:08 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:55 +0000
Subject: [PATCH v2 5/7] arm64: dts: broadcom: Rename bcm2712 interrupt
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-5-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
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

