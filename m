Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E080C5639AB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 21:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ADD113283;
	Fri,  1 Jul 2022 19:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E960110FE59
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 19:24:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 725C061F66;
 Fri,  1 Jul 2022 19:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5042FC341CA;
 Fri,  1 Jul 2022 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656703451;
 bh=eCsgbeuqchuCIFV9gDLlBeJCPGvuBnnluvULNww/3c0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I7wFmBWzKnbV2a3O8P8xFCl7JuejL2YyhbvlJHIovAocV4oa+UJ3Ql9YbeXBurW81
 iKT6KNGqonRpbL1rcaKLzrS6tpu4uEtfzymN2sAoVGhZNRg8w+s1wMv+Zz+zabbfLc
 O33G6aRN4GaUWXvXdws3ueL9L5GBHpo1iibUavODxwiiCfDNTQk2MPlvC00KGdbyKs
 DCovJAmGUoX4o5Kr4fat1IfjK5HUqWZCDH67Kizpp1b15XSbOMLTiGmK9+8oC7wwvb
 pLKIGTb/FP551AEoZb8CRlYg9aqcHhTuiRx7neZrc2B4i1IZZG3Qg+gmDtUD7qEwUA
 IZITfGnote9YQ==
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
Subject: [PATCH v4 06/14] riscv: dts: canaan: fix the k210's memory node
Date: Fri,  1 Jul 2022 20:22:52 +0100
Message-Id: <20220701192300.2293643-7-conor@kernel.org>
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

The k210 U-Boot port has been using the clocks defined in the
devicetree to bring up the board's SRAM, but this violates the
dt-schema. As such, move the clocks to a dedicated node with
the same compatible string. The regs property does not fit in
either node, so is replaced by comments.

Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 44d338514761..cd4eae82d8b2 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -69,11 +69,13 @@ cpu1_intc: interrupt-controller {
 
 	sram: memory@80000000 {
 		device_type = "memory";
+		reg = <0x80000000 0x400000>, /* sram0 4 MiB */
+		      <0x80400000 0x200000>, /* sram1 2 MiB */
+		      <0x80600000 0x200000>; /* aisram 2 MiB */
+	};
+
+	sram_controller: memory-controller {
 		compatible = "canaan,k210-sram";
-		reg = <0x80000000 0x400000>,
-		      <0x80400000 0x200000>,
-		      <0x80600000 0x200000>;
-		reg-names = "sram0", "sram1", "aisram";
 		clocks = <&sysclk K210_CLK_SRAM0>,
 			 <&sysclk K210_CLK_SRAM1>,
 			 <&sysclk K210_CLK_AI>;
-- 
2.37.0

