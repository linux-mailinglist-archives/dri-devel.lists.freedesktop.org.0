Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F199EEFA7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A382610EE35;
	Thu, 12 Dec 2024 16:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ftX9Hl03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ACD10EE2D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 16:19:13 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso5267215e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734020352; x=1734625152;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=;
 b=ftX9Hl03wRe9RAG/8k3i9CN4nvfBv4v3+aVRE4yDKSvaq/q6cyEskWfJiKQwRaKwYt
 TgN2UqYkLsu8dKJwX2CS6HDhC6XXdfokLgKwtcqmjdSKhtct0+CVyyL5+lZtnbx3AMiJ
 GKN/+LMp033G2H6gSRZC01cW3BwjX+8krZrqgwaJe/YUdQFdI2jmMlj9NkBnjxI0qUuJ
 ZoL+Utf+p9voI39gdiMlinBtdX8o/sHN1Ouy+kExZStdCgtWd9Wtpm3Xj0SiqqmXw9Sd
 1idkjpTAFtp1NfLOx4gNPiU41bqjWg4LoewhYWwEPDrxLfO5IrcbS3eJrls+7KPQSEik
 YLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734020352; x=1734625152;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=;
 b=JNGn+1kGsTAQLbV+uqLaI67sx1APH8AEgQEDT+faVZ2WADHUGk0l42bV3DWJvdHhUZ
 euPK767TOWz3y9xPYYPv+4v/2ODZeqh63NzYcwc9Nkw0RwF1vXArPxUMD0zz4WDO5ImP
 tig6sP8l74PXzie8cw+Mb1FzgBhVvdLCvM3xiqblPuj+32HwqpC1sodhudPenpzSjq11
 7E/69RkNMrX6j8lj5xyuyg1sFHi+XUpvynfCOgyyAkX8RUxlDCSa4eRAMEdUFmzRnRHJ
 UBNtnmosgJHD/YCbsMi1aAILGEv19zXKOdPBROyQKhGpWPfQRPSarWeO6Bnmdc3jIeN+
 GDmA==
X-Gm-Message-State: AOJu0YxDuFLQFhy8Jn6z5RyCErA8/lJ7Dd/HMFO34/APAlNPRvfgw6gG
 dypJRlutewnmZgRp9/CwBt6GHEbp5jk+aG2b6V7DyQ11CdV3ogi8KMrdiHNrQ4k=
X-Gm-Gg: ASbGncsq3C01r43cN0i2uc4i7zya8XgiR5hn3ivB6U2NJaEDkNDeUsfzTw4t5L+Sv3w
 9wOAZasY0QVEJywVwhOw17HLByVkElVP2MmT1l2CqEZ1qtl34n3FWkZdCmqAUbzCAjQgLLXYcaQ
 b1pqVmkTgB1t2xyyJ44pZa6tdM5IVkX5Md2qh1+2pNcORzGyjnZeq5vT+PYqSBj8AYIsIEkcbo7
 dolua+Qq8eiTk0r26IsT4JV+TdyrzV4lwrOoIuArEJWlU16
X-Google-Smtp-Source: AGHT+IH8oJmO1yg1ubSZ+z90KdtGpUstGhHd0JFOT72Tqf8VNjDPTT60N6GaHw5YeT5mJn8XmnjWIQ==
X-Received: by 2002:a05:600c:c8c:b0:434:f9ad:7222 with SMTP id
 5b1f17b1804b1-436230dfe7cmr29162515e9.7.1734020351732; 
 Thu, 12 Dec 2024 08:19:11 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 08:19:11 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:57 +0000
Subject: [PATCH v2 7/7] arm64: dts: broadcom: Remove intc controller on
 BCM2712.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-7-35986e04d0f4@raspberrypi.com>
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

The brcm,bcm2836-l1-intc controller isn't used on this platform.
It is used on 32-bit kernels for the smp_boot_secondary hook, but
BCM2712 can't run a 32-bit kernel.

Remove the node.

Fixes: e1417095a139 ("arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index f42fad2d8b37..9a426aa27c74 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -221,11 +221,6 @@ mailbox: mailbox@7c013880 {
 			#mbox-cells = <0>;
 		};
 
-		local_intc: interrupt-controller@7cd00000 {
-			compatible = "brcm,bcm2836-l1-intc";
-			reg = <0x7cd00000 0x100>;
-		};
-
 		uart10: serial@7d001000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x7d001000 0x200>;

-- 
2.34.1

