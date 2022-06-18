Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338BB550486
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 14:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F4910E5F2;
	Sat, 18 Jun 2022 12:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E3710E5ED
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 12:32:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id o16so8803403wra.4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 05:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xINpJVKkZcc5JKohFXfQpBMJJJBAJkhRdFvXLAdWINc=;
 b=V5PCq8ERofmOM5w5PRA0gL0n8OYBdm40lWb/asUOIntNfey82bGRsIn/7z+pxrNbjf
 4HTP30/j7DUAESFSB807hhF4Bn26V6IuYZIKFHoYEcp2foIsgjbMA8wAurn/dzRXLewU
 52ItLX9xQP38z8uMvLEfCM20A/gU6lUTh3j5F2TLw9cN7r3egdv+mFSv6ttkSKGiktCM
 4cZy3+rmKIWV13Hk4eddQtK9JA4//kbz9TiLmNmn6H/45fTkDeYaDf5zd/9LWbt7E4MA
 qvUYvHicfErpLqf59Y2120u88J/KmXmj/YaQstAYe0YdqaXfHU8uztd1zwCarccd64Pm
 J8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xINpJVKkZcc5JKohFXfQpBMJJJBAJkhRdFvXLAdWINc=;
 b=2eA1j0wigwwJmtjhY2oy6fOgw5VRFXe2C65s7aZ5hzdFfcNIMa0Ud1P7Fc3dEY5fuJ
 xaduEfGFIzlAHDtFndjvYpnFnbrsUF7QKpNfEspIbwRnDzMWs6GL3gvhdakRF1PwB2k8
 pPUJL5LUlCGhv/rwz6HBNjvZ0bpdyxslTdg1p2Vjirrqbebx8p3JTCA9Q/hjPQWlsN71
 DbNcLIex58P01f0QKbTAYfP3MbAKEkqi0EHcVOEhNIB5OdKdXC0c5BQAsz+9cVv3PSn4
 dlHVUGizl6gxBKAruMXYhrWT9shl6eBJHSekJHbnm46imULPMOdNuv6MZlWgm4SMUWIv
 8iwQ==
X-Gm-Message-State: AJIora9nQrWiq9ColHx0pgHqup1M94fhjZhd0NGwtQ5zntLcKTjQNHRP
 O0kfp7u6ppUN/ZAgjt6tsHLrQA==
X-Google-Smtp-Source: AGRyM1v9n76uzuiNQWIsMBMB4JQ7qpatVYHsEQGM4nI7CyfeZc8UgP+B/KjNDavOA6Fd5fJcVw4QCQ==
X-Received: by 2002:a05:6000:1b03:b0:216:43b4:82f1 with SMTP id
 f3-20020a0560001b0300b0021643b482f1mr13888381wrz.232.1655555541458; 
 Sat, 18 Jun 2022 05:32:21 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:20 -0700 (PDT)
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
Subject: [PATCH 12/14] riscv: dts: canaan: use custom compatible for k210 i2s
Date: Sat, 18 Jun 2022 13:30:34 +0100
Message-Id: <20220618123035.563070-13-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
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
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The devicetrees using the Canaan k210 all have a sound-dai-cells value
of 1, whereas the standard binding example for the DesignWare i2s and
other use cases suggest 0. Use a k210 specific compatible which
supports this difference.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index ef46ddf3c00c..5eb6b69c1170 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -243,7 +243,7 @@ spi2: spi@50240000 {
 			};
 
 			i2s0: i2s@50250000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50250000 0x200>;
 				interrupts = <5>;
 				clocks = <&sysclk K210_CLK_I2S0>;
@@ -252,7 +252,7 @@ i2s0: i2s@50250000 {
 			};
 
 			i2s1: i2s@50260000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50260000 0x200>;
 				interrupts = <6>;
 				clocks = <&sysclk K210_CLK_I2S1>;
@@ -261,7 +261,7 @@ i2s1: i2s@50260000 {
 			};
 
 			i2s2: i2s@50270000 {
-				compatible = "snps,designware-i2s";
+				compatible = "canaan,k210-i2s", "snps,designware-i2s";
 				reg = <0x50270000 0x200>;
 				interrupts = <7>;
 				clocks = <&sysclk K210_CLK_I2S2>;
-- 
2.36.1

