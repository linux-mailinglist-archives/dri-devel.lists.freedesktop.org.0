Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC4E9EFB24
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072A410EE71;
	Thu, 12 Dec 2024 18:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gisSUcDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B5910EE6B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 18:36:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so10131115e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734028609; x=1734633409;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=;
 b=gisSUcDWDISv0XakZ8yk3YW6Wkgg5zsOMsP99gIXrLdqnBqilWNfYW7Qdn3yg5o54o
 QreIvW4mhHxj1i1xyhN7yIypLvRkv94Q0YOXGRrVGVBMMqvfXMnOY967OokkXrOSAwhc
 F6e/YfPh3Tj6+GSH/P4a71cnqCBk2ImgnGI0JBGALl9xJFNz2qHCMFUkkQ0b4ccvqs2J
 ACy50NB80brfMC1SoL+Oy4+i1C3Qk9BruZTD5GY/1uk41NxarTCiAs/jcFWoKFNQ9974
 H5mKbun/GWxa/zLnGP7pjRpeRQOtXcxRU4UZkQqBOcVE5idcGXQsy90ZYU2r0Md69Jgg
 ckIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734028609; x=1734633409;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=;
 b=m0jji1po7llMyAQrpjy7NbOGOFUb12TaZ9Y8tFIOz0ey+p+7qr7XofGPZZPfOdJ6Wr
 joNpEK9hFArA3CJoiO4X7IBaGSHfDWDyMYy1XQqSQSetmIYhN/n1y/SqLnN0K6ZEPMVv
 2fcl6xSLCK5l5GBprvv62QNamJWpqadtfnZzbSKFScL63WLR8qF4Zt47oC/Va2XlY41A
 Grp6yaQIX5ZCj/0USq5uEgMya/n7NNkPuqZqi8/RN2psTG8nl5FRdZ2ntSTtMt+IQ7Qw
 m5VrNuht7zGcg48JJpyiEill/YObJolu7+2x288sw90x7+PTguWYg+a9QZfEaaXNHrp8
 +wQA==
X-Gm-Message-State: AOJu0YzZvD0pkUGM4XvLt8Xo3860hUqhdeMcnhaicg6FeAsOszfc8nBF
 p/BziszunUCcb3RJJMFmClo9z2pUoypMScQcQaurE0cpBr6xlQmSFEVcAgdx5K8=
X-Gm-Gg: ASbGnctfPTkPKtcsTGBVMOFEBH55gg+4dQ40PLpJDuGixTrgKIahBT/8PkqfIYYzYvt
 leO1XhPQJ4spym4EI9TR7XPJfF/PXUAQLb72F3m2fqrYmRaUs5G+5m3q/T9gk+yf8dKPjSZdCgt
 z1roziCCPoqbhgE585tmYA0giQ0Tpo/wSrcZbuUox95tTR1/mXS4fxDJZ7pdlvGXlvXxUDss0oz
 /FQAUNpbqTrMqBBZ2TgFAtxsDmP6PQNiy30ODyMPjVJ23f6
X-Google-Smtp-Source: AGHT+IHxOChpNRcv2gtV3EutMkkx5eEcKsuaWzHm1MNie1E2mh6dZNeg/6vYwQX7jygVWMDmg6R6rw==
X-Received: by 2002:a05:600c:4e49:b0:434:edcf:7474 with SMTP id
 5b1f17b1804b1-43622883cd8mr39952895e9.33.1734028609546; 
 Thu, 12 Dec 2024 10:36:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 10:36:48 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:34 +0000
Subject: [PATCH v3 7/7] arm64: dts: broadcom: Remove intc controller on
 BCM2712.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-7-44a7f3390331@raspberrypi.com>
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

