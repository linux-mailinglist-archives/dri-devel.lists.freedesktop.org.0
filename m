Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9935639AD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 21:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219EE11AE2B;
	Fri,  1 Jul 2022 19:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3EE10FE59
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 19:24:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A72EB831A7;
 Fri,  1 Jul 2022 19:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AADC3411E;
 Fri,  1 Jul 2022 19:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656703463;
 bh=fl+M0630gBV/5K1ZzC9jI+KGP0mSH4+Lw2m+nTvKw7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iM6fKwrFdJt4L9OlaAkuI3hUCnZX7dzdjR7vyF1QG3s023EhetNcf1f0r5kvqBzVC
 qBB/yQ7SHD+qvhioVk4ipNIvhIIKq4uJibivLYbM87vhmbXTyZeRAI9ybRoJPKnWRY
 JGdjQ2c/xktJAh7yZlZlD85hUkHndP/7w3HK0NLERarcQR259v0TcZP5ozCC6hdfJ5
 ygGaMvIoJs8JEwYbHRP/joROrHJ3+LoT4glr0pGkDt0ZyZWScPb3i+GRNasQ8OsRd4
 IzVmBnFfv78+VFWoiK6bIHeSHhszoFBtXv8IQwNlB2FbUntHdeL0DAV8V5QTxuCh2W
 3NgRqhmx6Pd3w==
From: Conor Dooley <conor@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 08/14] riscv: dts: canaan: fix mmc node names
Date: Fri,  1 Jul 2022 20:22:54 +0100
Message-Id: <20220701192300.2293643-9-conor@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701192300.2293643-1-conor@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The newly-converted-to-dt-schema binding expects the mmc node name to be
'^mmc(@.*)?$' so align the devicetree with the schema.

Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts     | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 2 +-
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 039b92abf046..40992d495aa8 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -142,7 +142,7 @@ &spi1 {
 	cs-gpios = <&gpio0 16 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
-	slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		voltage-ranges = <3300 3300>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
index b9e30df127fe..5e809d0e11fb 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
@@ -189,7 +189,7 @@ &spi1 {
 	cs-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
-	slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		voltage-ranges = <3300 3300>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
index 8d23401b0bbb..4be5ffac6b4a 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
@@ -191,7 +191,7 @@ &spi1 {
 	cs-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
-	slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		voltage-ranges = <3300 3300>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
index 24fd83b43d9d..5c63f79b18ec 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
@@ -199,7 +199,7 @@ &spi1 {
 	cs-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
-	slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		voltage-ranges = <3300 3300>;
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
index 25341f38292a..59f7eaf74655 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
@@ -164,7 +164,7 @@ &spi1 {
 	cs-gpios = <&gpio1_0 2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
-	slot@0 {
+	mmc@0 {
 		compatible = "mmc-spi-slot";
 		reg = <0>;
 		voltage-ranges = <3300 3300>;
-- 
2.37.0

