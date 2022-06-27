Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA6C55BBCB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466E811B2C0;
	Mon, 27 Jun 2022 19:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623C211B2B8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q9so14486054wrd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0yX9mBCtyn3dt/LFcnWYLnHjmmtyKFR5605f1mLuzSM=;
 b=AtMYN6PSkLA1y0PqfjVZ9B2anDv7fpdxjk9Z2GEBmdgR3Y/a5AVf7ucMgQk3IvAslk
 Q0FldXcJOm2h1zMZQtoN6HX/VUa9z6V+celDZ6Cf6uyoZ436qN3qrQ4XzyB4kEaC/OCy
 hcHOUjibIOU8Lfa1bhhnNuso3DiXNufNqD3OC3JF6FBFpZWJXFeM2Ph8krHKA6xsWkzO
 fu96DPwW+8Wa2B9/eZ4mV4u23G09Fp5aWq/QeIOVXKmMAqyQFsynIPrm59xnsG6Zk4C0
 oWRHhkY277ATUfplHzV4oeIn1Ke23xrVrGkP/kyz5t1D04Mi19ZmsHObET6qcXxwAAAm
 jXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0yX9mBCtyn3dt/LFcnWYLnHjmmtyKFR5605f1mLuzSM=;
 b=aTzNeqUOe25kNOEovCA+fqnZU6io9BcIdfrabfpvMQAEAT2cT2azet5rwxQh60B1vz
 NcQTbRGwxMd2dJh4PkSNnkMTCq98VQbuRvbmPwwNYLClpJDuoD1DQH5M+BxSokgn579Z
 NoP+G7bZDQNAVNu5RzBqWsJeC0oum44P1N2shR4DCTqd3BscEOJaV8+J06xnNPbFFpqq
 4W+ofBlZH7hC04G1C7LQ6s75hM8fUYOKSMYAUuf4N+1lWTWLsfqRgg4dKESElnml9hEM
 YMcNz44s71w0KipY98wdhFZmaK4EsDZea5DtwuTyaGIJfBMZwTF+L6QwaqqhhDmK0Uj8
 e3lA==
X-Gm-Message-State: AJIora8WxCsUeiMDrbVJIArt21lzSvnRr+ga+tH8Vg1gD7MLjgPgjLbS
 xcGtlh/W9V4Wh/UIZ3tbU9QCDg==
X-Google-Smtp-Source: AGRyM1v+CiQCqjbnq4vRMZqSCSRDlEuyAPNKkRp+mF7UYQN9jimLW4SxHvA7KTYHLOBZVxNPsqPSbA==
X-Received: by 2002:a5d:584f:0:b0:21b:a557:98fa with SMTP id
 i15-20020a5d584f000000b0021ba55798famr13392886wrf.462.1656358893163; 
 Mon, 27 Jun 2022 12:41:33 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:32 -0700 (PDT)
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
Subject: [PATCH v2 10/16] riscv: dts: canaan: add a specific compatible for
 k210's timers
Date: Mon, 27 Jun 2022 20:39:58 +0100
Message-Id: <20220627194003.2395484-11-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
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

The timers on the k210 have non standard interrupt configurations,
which leads to dtbs_check warnings:

k210_generic.dtb: timer@502d0000: interrupts: [[14], [15]] is too long
From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml

Change to using the newly added canaan k210 specific binding to avoid
the warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 45ccab36618a..be42c56e770c 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -318,7 +318,7 @@ fpioa: pinmux@502b0000 {
 			};
 
 			timer0: timer@502d0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502D0000 0x100>;
 				interrupts = <14>, <15>;
 				clocks = <&sysclk K210_CLK_TIMER0>,
@@ -328,7 +328,7 @@ timer0: timer@502d0000 {
 			};
 
 			timer1: timer@502e0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502E0000 0x100>;
 				interrupts = <16>, <17>;
 				clocks = <&sysclk K210_CLK_TIMER1>,
@@ -338,7 +338,7 @@ timer1: timer@502e0000 {
 			};
 
 			timer2: timer@502f0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502F0000 0x100>;
 				interrupts = <18>, <19>;
 				clocks = <&sysclk K210_CLK_TIMER2>,
-- 
2.36.1

