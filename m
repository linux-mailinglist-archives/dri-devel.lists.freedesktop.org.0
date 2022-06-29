Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DCD560985
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265C910EA06;
	Wed, 29 Jun 2022 18:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7698810E9AB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:44:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e28so18634340wra.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=At25po1Wc0Z0LVVscrUsguBv2A3DKxx2gWOZDMIuiaM=;
 b=WijjS3QGog80xtGqzblrYaaoGoUeqfb6SjDeiBhfRNzBdio44L6EGW9/Z8tdELkAW6
 L9clreZk2UZKoJ9JIA0XqRhuszwyomm61dIFCzrch88g2jAODCY8XeiVZ+uZMBMMZF1X
 28C8fpv0EZnh/al+rSxiF0l0uZHN5U//tuhTMK28cuEWxNRsQ54aVcWsQV3O7n03gcGG
 t4zqFpt8r4DzKJg4IgbJ+vvKARa431qC4A2nW221KIGHoQVqbA3M3NgW9bZPPPd+b06/
 9B4lhXNF7nJEA+yeIQbLhq59zdV268Ah0KGtuDIt7O1tHoewRNFl9Nzs7ADpYfcvKEXK
 YCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=At25po1Wc0Z0LVVscrUsguBv2A3DKxx2gWOZDMIuiaM=;
 b=W/NlJZCqvuefd4bZtTknx5G3YFvEHGULIoNjsjifJEeVAGjRKJaC4oC74XrVDY+iUU
 gm2SXH0RQFp2s+KOPVJgdG2xNg28Zq5TyPrJ/r2b7iK0DjTrZCt5+d/GngI1cFHavW9a
 EiqAV0BoMFuNRRDYoTcEJOo8JxME9JJPhECOmmo39xvp1nfWh1zTvj6l2Sv8flShNn0R
 jmvZQ6BpwXtqeZTP/m5YyU5SxlgSrQFAnp980AtGhk2Mp4YlWmQCTbZ1vqYAKm+nqhyo
 ph461xUmrbihj47daeXCNBZ5zdIpaxMKwuldQmZp96HMKjYJbz5yU9Kvr3CRa2Tui8JJ
 912Q==
X-Gm-Message-State: AJIora9tvG0uPlY1wymX3Vvie2CxugFt46ubehId/zeDUubsgH8NGQPr
 XsT+7AWht6a722ybB6OAOvHn9Q==
X-Google-Smtp-Source: AGRyM1tFdtxNpzN6iXVKryB/C/h+KEXfAJwTszphJPZwHiXExUEtPjYGqRR55VLOxlslhU0/OHZqag==
X-Received: by 2002:a5d:4b04:0:b0:21b:8640:273f with SMTP id
 v4-20020a5d4b04000000b0021b8640273fmr4644814wrq.195.1656528297564; 
 Wed, 29 Jun 2022 11:44:57 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:57 -0700 (PDT)
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
Subject: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg} warnings
Date: Wed, 29 Jun 2022 19:43:42 +0100
Message-Id: <20220629184343.3438856-14-mail@conchuod.ie>
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

The k210 devicetrees warn about missing/empty reg and/or ranges
properties:
arch/riscv/boot/dts/canaan/k210.dtsi:408.22-460.5: Warning (unit_address_vs_reg): /soc/bus@52000000: node has a unit name, but no reg or ranges property
arch/riscv/boot/dts/canaan/k210.dtsi:352.22-406.5: Warning (simple_bus_reg): /soc/bus@50400000: missing or empty reg/ranges property

Add reg and ranges properties that naively cap the buses after the
allocation of their last devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 948dc235e39d..6a34dc4f3e51 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -163,7 +163,8 @@ apb0: bus@50200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			regs = <0x50200000 0x200000>;
+			ranges = <0x50200000 0x50200000 0x200000>;
 			clocks = <&sysclk K210_CLK_APB0>;
 
 			gpio1: gpio@50200000 {
@@ -382,7 +383,8 @@ apb1: bus@50400000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			regs = <0x50400000 0x40100>;
+			ranges = <0x50400000 0x50400000 0x40100>;
 			clocks = <&sysclk K210_CLK_APB1>;
 
 			wdt0: watchdog@50400000 {
@@ -437,7 +439,8 @@ apb2: bus@52000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-pm-bus";
-			ranges;
+			regs = <0x52000000 0x2000200>;
+			ranges = <0x52000000 0x52000000 0x2000200>;
 			clocks = <&sysclk K210_CLK_APB2>;
 
 			spi0: spi@52000000 {
-- 
2.36.1

