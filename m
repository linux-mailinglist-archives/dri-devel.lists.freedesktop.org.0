Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCB89EFB22
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868B710EE6B;
	Thu, 12 Dec 2024 18:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nJA8f6Fz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FDB10EE6B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 18:36:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43622354a3eso7034595e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734028607; x=1734633407;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
 b=nJA8f6FzhFNF3zZqwjd45RGg/kCQZU/pVlAvElPxj3oB6MQruoO3/aWlDmNzlU47Vx
 7RHQB1jNw6WQVX/pQgw6t9VnA+PUZDeZD8M8hQjo3LHk+Sn3HDhtZ7ZQsDTvQq45XHQN
 eOEt2thQquX0OHPQfn6bgndfMd07CC0/BHcQ0XJ97N6kiEejh8ffw6/lfb9NP25PMWOF
 9PjzSVCfBZf4085RUaA6mewzJNaA9uQIY573OHPxDjaNbsQtZei3/7m++yAOZXri/J+J
 EWunB5j7HBnzRGkxyhlgykK+3G80TU80/eZK9BwNDN8GhzboZgKhTX1jfAZwifVUz+W+
 zKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734028607; x=1734633407;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
 b=pY+3azbUVbzjzAwaJ9ky7hx2F9pmY3MeNVQ9j2ToQexOQxW10+e2VLUoZQZT6akcRc
 mqZf0SK534qYDPVWtutzd2D7s88Zl6mEbbkDM19BcE0LNx2bhdVCPA7P9sDxeuNxejfx
 M0uc95bc3B+rLteuT9HF7E7ifhJob8e5fS3uzaCJvWVrP1YYLZwzTAFguPN+tmTN+UP1
 y9/PmPUG8pY0ROEssCt+X+A0CVqqzNOMofxlrmyPAMnOcFDIpowdyYPw0nM/WNWIgoZ+
 2ay1jfBWM5JyVnDXThCPpQR6QHw8RnHLr5ugledQ99an4Wo7pW1+dBPe4g32LUn6UGt3
 IzAw==
X-Gm-Message-State: AOJu0Yzrf+qZ96o8Avbotmf19H9eXEusWbhX3/WLODlYdw++UDKMWEIh
 b35ZTMtQM30M2sJ2f4FTuqcQg4kxkfAYc/kio1iETF6FHCECS/Iq4936UzbghrE=
X-Gm-Gg: ASbGncvmjIPuGPbu866CIGRm+vpL4674quNGNaQs8I1dVIDNl0APmmmyNDRhO2363mR
 kmjzz7fPzDydDRul+z1wn2xVh03OfIYP22mGbkTesijl04uQBDsG3Se5keBLI9fwYxcMFtcGyQF
 5AXjrH34EasaZNfSZBMBMCIgT2Gc+peqao/Bx42ItgFsObYH6otSWYSy20N6Ot6i6gsqKUmNQDX
 Ogc/ziIiQw3QNL7Pe+H0xFuZRXvNYN0V0fbybmsOkf/wzeJ
X-Google-Smtp-Source: AGHT+IEu2xL/+FXU63UNRhzK1AOzvmFc4RtXIaDc5vdsewo82JD1gWWmf7YI8MTxRmnxwh6YKbXzGQ==
X-Received: by 2002:a05:600c:19cd:b0:434:a07d:b709 with SMTP id
 5b1f17b1804b1-4361c441bcdmr59652015e9.29.1734028607573; 
 Thu, 12 Dec 2024 10:36:47 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 10:36:47 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:33 +0000
Subject: [PATCH v3 6/7] arm64: dts: broadcom: Correct hdmi device node
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-6-44a7f3390331@raspberrypi.com>
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

The names of the hdmi0 and hdmi1 nodes had addresses that
didn't match the reg properties for the nodes.

Fixes: f66b382affd8 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index bd78af0211b6..f42fad2d8b37 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -352,7 +352,7 @@ main_irq: interrupt-controller@7d508400 {
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

