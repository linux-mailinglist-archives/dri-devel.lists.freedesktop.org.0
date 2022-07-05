Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD485679A8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076E191B02;
	Tue,  5 Jul 2022 21:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637D791A93
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 c131-20020a1c3589000000b003a19b2bce36so4934220wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UPBn59oLWa4WN0TM+d54cWfp0e3Yu26JBz3nIt6z28k=;
 b=Fy14/PvPj9PtUJSEWAsIoJtFk/QLAh+zpJW/GcdBuZm50Q5pLRFJxjVDsTQKO0jlNY
 wJEhEFKcJ5jxv6DRNmvwQzfS2yJogdZFiP8ZdIrNQl6Bottomg6ONQGpr/VfsdGYeB/N
 ND5Ib9C8J0JM8tXLAOqtqq8gufvNQQl45ZsHqL4Uj7+WAIQPsLAbZqQFWRiE0rUHtqzP
 becDXpKRWZUyde0rVYxaUYFI2eG27lKUswHmHJCDuX/QVyN3tS9z6hbfBG61zxiJlXb7
 2JG3cOJS+O+N5O45JGX8/QxjmcaDKeRngl+PnlPwot8S54C/CJA9gNgldo5hidh9YXiG
 RGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UPBn59oLWa4WN0TM+d54cWfp0e3Yu26JBz3nIt6z28k=;
 b=oKCs8Cl/QIbbwMHAcOsVkETFSz8LekL0ByP2PmHjOZ36AsUY+6ZTP1Yq2ngr1kvj6D
 uzkY+pKXm/skotpfK2k6W+bTsvKplOKuu6P6zLfYZaqwbt6DA2aWr3m0aLkV/GbIL01e
 T1MhBOJJWq58XjSLufee8IvUoJayqci80NSgQiKgTovmiHKf7u6MVDNNO8F7HAZQfMeX
 TO6G05ql1jXRyENWRHeK5biaQfK/NNwUvCtLzRxYz8JvCC62omq9OMMOmrtu4mxtEFit
 MqF5DMEKVXo4uOdHcO0H+0c1ly/+1nGySYF9qvwvIuykWVQEEaBKduSHrsISeDvMeNkS
 /BeA==
X-Gm-Message-State: AJIora+QWOzVRhO0y8Y5HNVkpuNwP/8k+01FN7x6qE790u7pP3X/GlR8
 YcrE7aCVL8n77rW5/y0PJrfeEA==
X-Google-Smtp-Source: AGRyM1tsCEz43LIslI9FUHHd/xucvxD7qU2yykMq/Seu+ezPnUEgazknOGEg2oVZ51mnn77ZaJweNw==
X-Received: by 2002:a05:600c:34ce:b0:3a0:3b4b:9022 with SMTP id
 d14-20020a05600c34ce00b003a03b4b9022mr40062698wmq.66.1657057957885; 
 Tue, 05 Jul 2022 14:52:37 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:37 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 10/13] riscv: dts: canaan: remove spi-max-frequency from
 controllers
Date: Tue,  5 Jul 2022 22:52:11 +0100
Message-Id: <20220705215213.1802496-11-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

spi-max-frequency is a device, not a controller  property and should be
removed.

Link: https://lore.kernel.org/lkml/20220526014141.2872567-1-robh@kernel.org/
Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
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
2.37.0

