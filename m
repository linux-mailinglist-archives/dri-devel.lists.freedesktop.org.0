Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B83C5560982
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3D010E7EC;
	Wed, 29 Jun 2022 18:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F58810E8DF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:44:57 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n1so23765462wrg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DNX3NBBxUOgIEO6d1lHfUfaMyrVEXszXHZidwPOOZLs=;
 b=fJt0TNmcrxv1196YlKy+XtUiL3qH5Bi1DNi6jONPKjO1mK09TYQ50TbpaXiImC6SPX
 wM/EbNLO8vHZI1fRyjVLA9dMDJM2IzSkNGcYb8su5xVZty48AsSus2QsfnunOQseVfNv
 26Lk9YDEyevHgKK71onh/RYN+LNvQK+0n0ZCaKB/sLR6D7gNVndjsNGmzxOhOAuKtXzY
 V4yiWGtn92sMUCDzfN2CyLwP/OZPoElHkS8QhNADh2m9p6pJlyepKXQV1JHQMFLnVYJj
 RoZPOLARyx46D/J6WfBlen6szXY1KjfBMMjmyqEFn+lQH6ghSIH4H0/0xAsvL1vPoosm
 JgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DNX3NBBxUOgIEO6d1lHfUfaMyrVEXszXHZidwPOOZLs=;
 b=DB0Sj8nuzPMqKjiNVC85ZMEHn0E1ciwRBf40w7V+0MWHfx23+sVJmGJ3MbR72d2UqY
 G8MI0QrKb7sytVaSN9D8Q59dEXX2B/qPYwS3n6v69HUfkI/0b1FWztghIUFWLxgcQrpp
 eAFi4nqLsYb3caZWj38m/yW0FdlwfZ7JaC136MPHpUt2P9qyE34nGCSj02QBYuyJaz6i
 CeWE2EJpQ0AfmXH0uBuOxy+n/5j/rvPgfL9HwTzskwnBYpI2IlivJGR3yKhg7F2rxzM0
 NwQtIztBj/n1sduRlusiUM+1m9gfms6Pz1e49Oe5E4/tczRME82m0s7p/Am1DZwyWbq4
 4g8Q==
X-Gm-Message-State: AJIora/xh7FcEXYSj0009Yvc/Bhpv+WdjPL3zTqmKIp2jrgMYG4TxsNT
 MJn267jEe3YQwLxqYgideo9lbw==
X-Google-Smtp-Source: AGRyM1slaB4pDiCS7kZfgH/dw/atIFKm5WMyJcMLooWgGiA6eNc01E7pK2ozv/LYUkHNxKQ7FdQ+ug==
X-Received: by 2002:a5d:518f:0:b0:21b:8a8c:ce4 with SMTP id
 k15-20020a5d518f000000b0021b8a8c0ce4mr4710896wrv.614.1656528295858; 
 Wed, 29 Jun 2022 11:44:55 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:55 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 12/15] riscv: dts: canaan: remove spi-max-frequency from
 controllers
Date: Wed, 29 Jun 2022 19:43:41 +0100
Message-Id: <20220629184343.3438856-13-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

spi-max-frequency is a device, not a controller  property and should be
removed.

Link: https://lore.kernel.org/lkml/20220526014141.2872567-1-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 900dc629a945..948dc235e39d 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -451,7 +451,6 @@ spi0: spi@52000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI0>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -467,7 +466,6 @@ spi1: spi@53000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI1>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -483,8 +481,7 @@ spi3: spi@54000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI3>;
 				reset-names = "spi";
-				/* Could possibly go up to 200 MHz */
-				spi-max-frequency = <100000000>;
+
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
-- 
2.36.1

