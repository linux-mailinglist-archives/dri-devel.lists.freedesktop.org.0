Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9CC9E050A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3B610E76F;
	Mon,  2 Dec 2024 14:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GYTSf6CL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F233810E767
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:32:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-434a1fe2b43so39079825e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 06:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1733149939; x=1733754739;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p56iPdWdF4pt0TGa+sJ5O54kl+ln7VnNVSZs+/e+76c=;
 b=GYTSf6CL3Lpy/VdrigjG3nYzktoG7zXiXc11qeIThCy/NWvd2PkWp6i3qkvXF8pkx7
 IsRpDwqfL/jskE3vQkJYn9iNuBIr7omdTBH+C7BySC7xaKyRiQDnLIvahTctPLp3P4BN
 wUwFl2/2AkXcch6Gzxc2cBFktIEhr/zfWzCcNG6VpiRNoRuNSBWdlrXhiBaC/qdkuRQR
 0dRhlPdiZnuHDN+dnCquW8FkVbsvXEZH8eLRvpZhUgUaExgkw+X0AKkUTWFtHcevcGQA
 dgK2oBdNTbUiBYTVkWQsnLbBlCI8BGRzaJQl1DtiNFMXbG7HOvG0XnVtt3V3IG4eiU9+
 BKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149939; x=1733754739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p56iPdWdF4pt0TGa+sJ5O54kl+ln7VnNVSZs+/e+76c=;
 b=M92kr6CnBaFwcK1GdKH9ycH+A9zmxGUPob5QugPn7yFGRxNwGok2/PVDvBW9Tsq5s5
 Oxk6hishMKxfcHqRPV0bW9uEYsb7h9Sz/u7BJxZT1bVFovXOnzNqH7jAg0u2qNtrQY3G
 T3y51lM9VXIjqzqR4+TcbrdVbsymf/3ySm6TgoUBN+GJdznwD3D3cnN2XChdkm3LYolg
 17G/1kX7CeKkTxbwpK0WKSjTUsPGJZqtwi4HwJqI0PpX9uAMzq4o4A9+lsYG+VIfXSF/
 vGauvNR4iiVsvcXGH+IWFFcAs6zozM/uIdGwnh+wshv8JSna7GjiyXjOc71OTpFrd6D8
 o3Mg==
X-Gm-Message-State: AOJu0YwrjFQUNNQBO045NRfUaKWdS7evWgMTGBBkXwp+GRPt8knC5sf3
 qKBYyHu47t4TBZQPHpMH4tJcZeTmQJOFWhzgtqI/CP7fkz+LOLgGwmCmE97CvbA=
X-Gm-Gg: ASbGnctshfAujeTBvFf/J1L/ygsy5/jyzJRm3e796PAHIn3eZzx9diZqG6PRsLnFJCq
 YllQKeHb6ns75fo/FgGL/LwoDF2bAOa+XSwkJ7U9kdnNgcMwJ4+3UBe1ttNC+LztSvISfxIYc2O
 bsvSWh6Yg9CNnh10uqpgHivb4RyKqi2B5nuNFTK/xD2nZ3PIFTgLptyjaDeOsHMHayQQUHadePM
 14BVVJQ7BZBWPzHiYCjCzm0m9/4mC+eU7oeJP2d3A==
X-Google-Smtp-Source: AGHT+IE4Z97WqPTY6whDYYFojroLMECZvQLJmvdqsAduNjh17iqwixHR8OU1x0n8ZEx4yAwnePdiwQ==
X-Received: by 2002:a05:600c:4e8b:b0:431:93d8:e1a1 with SMTP id
 5b1f17b1804b1-434a9df1f34mr200128515e9.27.1733149939226; 
 Mon, 02 Dec 2024 06:32:19 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 06:32:18 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:57 +0000
Subject: [PATCH 4/7] arm64: dts: broadcom: Fix device tree warnings for
 BCM2712 display pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-4-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
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
 Bartosz Golaszewski <brgl@bgdev.pl>
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

Fixes up errors on HDMI and interrupt controllers that weren't
noticed before merging.

Fixes: de9bc2dba3db ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 39305e0869ec..f42fad2d8b37 100644
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
@@ -352,7 +352,7 @@ main_irq: intc@7d508400 {
 			#interrupt-cells = <1>;
 		};
 
-		hdmi0: hdmi@7ef00700 {
+		hdmi0: hdmi@7c701400 {
 			compatible = "brcm,bcm2712-hdmi0";
 			reg = <0x7c701400 0x300>,
 			      <0x7c701000 0x200>,
@@ -381,7 +381,7 @@ hdmi0: hdmi@7ef00700 {
 			ddc = <&ddc0>;
 		};
 
-		hdmi1: hdmi@7ef05700 {
+		hdmi1: hdmi@7c706400 {
 			compatible = "brcm,bcm2712-hdmi1";
 			reg = <0x7c706400 0x300>,
 			      <0x7c706000 0x200>,

-- 
2.34.1

