Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B129AD181
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02AF10E83F;
	Wed, 23 Oct 2024 16:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dOmgLKJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566D710E82D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:59 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-37ec4e349f4so4185968f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702258; x=1730307058;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SOV7jAWhbFwwjw/OJ7O7LtE/DWvJ9qhDH2QMAsU+FWw=;
 b=dOmgLKJILPBjD6O49WO6LxCitjz9ZpOqkGCQU4s78WkqrNnc3tH7G7p7DGlf5uCWOU
 tgYpiatHk/t7EZNp7ZZr9pbKbN43nhT3tArHUg0UbQ6Sz8I7WWDJkO0wy46zUU74za6F
 IPyNVc0wNnp4zuklkmj2XFJPEprSvme3fm7YQoDdRHntTiXma/k9ZE9SHUkKt+nJUa0T
 NoBoc3fBjZougw/b0FpR0vHnwmDgrxQSI0zff0U76dVYajMuHoVEn+wgc8dUlk4Rp2G/
 aGOT2GCyQX2NmVIzSrvzjTq0hLIuNvAHNpLLvcg461G/R/+s865jeM1u1Dz6t0LKcAJ7
 N/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702258; x=1730307058;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SOV7jAWhbFwwjw/OJ7O7LtE/DWvJ9qhDH2QMAsU+FWw=;
 b=wPe2YbuvbL6PrfEM62ov8BjEMgcsVpb/her+touQt/Wxa8R5OAAh1r7oTSrlk3qmrv
 KTuvBJ3uM+O7pbLIJy4xngzI5OPW/rN3hyc+k60vS9VkRxuxyrPzxV1dWWn9WJqacuGy
 1tL87YlbgDqbrdry0bASDNXIdSmEwOHHw9GmlN+Kcde0AyLBly1zkJtBx+1jM2UsCn1E
 RD6cF8rKMfLZClpyAIurWM/KmaSyezs6v5/tNKQ+sSahaLA1gzbSoZ0dIJ2h0RLW5hXM
 fA4Zhlm+1SjDMtFcQWZ3XXTRu9RNOPYPoHNFkMXlPNSSHpBUjZZKQ5B69tW3rK8kq6vp
 nPCg==
X-Gm-Message-State: AOJu0Yzzm5P8Z96A42sGI45SE1FO2y3d0vvyP+AhLkXcf5/hAy0W68o6
 lpoMnGsUJEH58JesU+OSq3SQ9+FGVm90UjcvVGLzHtaAH2b/mA80hDv569Bp7x8=
X-Google-Smtp-Source: AGHT+IHyDo7gKJ/IShXkUH9eaVP+PbzXws85gi+26NgIg+img0yXRqlCHCujQCnuXRFKsSClohiLPQ==
X-Received: by 2002:a5d:6102:0:b0:37d:509e:8742 with SMTP id
 ffacd0b85a97d-37efceee7d5mr2193265f8f.1.1729702257644; 
 Wed, 23 Oct 2024 09:50:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:56 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:34 +0100
Subject: [PATCH 37/37] arm64: dts: broadcom: Add DT for D-step version of
 BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-37-1cc2d5594907@raspberrypi.com>
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

The D-Step has some minor variations in the hardware, so needs
matching changes to DT.

Add a new DTS file that modifies the existing (C-step) devicetree.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/Makefile              |  1 +
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 92565e9781ad..3d0efb93b06d 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
 			      bcm2712-rpi-5-b.dtb \
+			      bcm2712-d-rpi-5-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
new file mode 100644
index 000000000000..7de24d60bcd1
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "bcm2712-rpi-5-b.dts"
+
+&gio_aon {
+	brcm,gpio-bank-widths = <15 6>;
+
+	gpio-line-names =
+		"RP1_SDA", // AON_GPIO_00
+		"RP1_SCL", // AON_GPIO_01
+		"RP1_RUN", // AON_GPIO_02
+		"SD_IOVDD_SEL", // AON_GPIO_03
+		"SD_PWR_ON", // AON_GPIO_04
+		"SD_CDET_N", // AON_GPIO_05
+		"SD_FLG_N", // AON_GPIO_06
+		"", // AON_GPIO_07
+		"2712_WAKE", // AON_GPIO_08
+		"2712_STAT_LED", // AON_GPIO_09
+		"", // AON_GPIO_10
+		"", // AON_GPIO_11
+		"PMIC_INT", // AON_GPIO_12
+		"UART_TX_FS", // AON_GPIO_13
+		"UART_RX_FS", // AON_GPIO_14
+		"", // AON_GPIO_15
+		"", // AON_GPIO_16
+
+		// Pad bank0 out to 32 entries
+		"", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
+
+		"HDMI0_SCL", // AON_SGPIO_00
+		"HDMI0_SDA", // AON_SGPIO_01
+		"HDMI1_SCL", // AON_SGPIO_02
+		"HDMI1_SDA", // AON_SGPIO_03
+		"PMIC_SCL", // AON_SGPIO_04
+		"PMIC_SDA"; // AON_SGPIO_05
+};

-- 
2.34.1

