Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A17E550484
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 14:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DB610E5E7;
	Sat, 18 Jun 2022 12:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B604A10E5E3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 12:32:16 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id o8so8815489wro.3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 05:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ANXJKxbxI6u0tRhbN1AR4RFN+HN2j5iiePXGo5syCSs=;
 b=ErRXmSLorMjbdC5xWyP7urzRERR22/20eLl2XT0de71YUvLq9olsxJGpQ3PYt53udC
 MVVWn2OjFLzgo73dqk3/65ggchSO1J6/nfMBeW38N005pku7I4zSrpTv/zuaPfLKqJXk
 qjB07OxZX64wGSSlEDl91/abWVL2GYNDo4+scSLK83C9i4JROcieRdmp2gRhc8Fbnv7b
 b+9kOPXlfRJAEYkP1FzaLttvE+ReKggwoO5cB1Sf7ynv7N/LnmCtOMTXn+ccH3yxMsLw
 zDc7cjrPkXazBBOkKzNLuqxuVA3FOYoudEVTiel9Zmf2Ygdp7uXNnHjAvJ2fnRfqPbuk
 SpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ANXJKxbxI6u0tRhbN1AR4RFN+HN2j5iiePXGo5syCSs=;
 b=hYanu4uL0ORp0hHgWvwuxqhBG8e99epS6DfjeHMuBNReYTkCdp65zDvu331GKR9dQK
 wn7/KaY7Vq1I06Z8X0TZxEbvNsENy18EF0wUzNSrJkvdDmFZbujFdr+8l/ejm3c68ujL
 InZN/E5+q+5oC6+XqoWGZ8QKA0K1xZiF4+SfErdPMB/uiBMYIVqnaINrrvt406LyOjfc
 lID5fYmly3+XTYOf2zqECr8CGicjmwSBGrSI1qmmiyITCXg7YnvXL1NjwOoNhhPf+ASU
 68t8sLPaZKaY9EZC5cYC0uG83vtM1GVfC8GUzN8ylfjRdLqrSDL7U1hQQLBmf29pjXhf
 oD8Q==
X-Gm-Message-State: AJIora9p45GMPH3xvHi8Xa32plO+2/Q0JJLYxgmU+lECg0YH7KtE/D1B
 Um4ov8f2+DMVoHIVHhqJUCB06A==
X-Google-Smtp-Source: AGRyM1tbrkXYGfjWsBsEjmtzpjiA7Ap83fqu9IJcwCnfQzpYaSuFuxLt2MogvQUzBnMlTPtFn6izqg==
X-Received: by 2002:a5d:584d:0:b0:216:a2a9:5f2c with SMTP id
 i13-20020a5d584d000000b00216a2a95f2cmr14168978wrf.184.1655555535278; 
 Sat, 18 Jun 2022 05:32:15 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:14 -0700 (PDT)
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
Subject: [PATCH 09/14] riscv: dts: canaan: add a specific compatible for
 k210's timers
Date: Sat, 18 Jun 2022 13:30:31 +0100
Message-Id: <20220618123035.563070-10-mail@conchuod.ie>
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
index 314f6da5d7f6..ef46ddf3c00c 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -310,7 +310,7 @@ fpioa: pinmux@502b0000 {
 			};
 
 			timer0: timer@502d0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502D0000 0x100>;
 				interrupts = <14>, <15>;
 				clocks = <&sysclk K210_CLK_TIMER0>,
@@ -320,7 +320,7 @@ timer0: timer@502d0000 {
 			};
 
 			timer1: timer@502e0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502E0000 0x100>;
 				interrupts = <16>, <17>;
 				clocks = <&sysclk K210_CLK_TIMER1>,
@@ -330,7 +330,7 @@ timer1: timer@502e0000 {
 			};
 
 			timer2: timer@502f0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502F0000 0x100>;
 				interrupts = <18>, <19>;
 				clocks = <&sysclk K210_CLK_TIMER2>,
-- 
2.36.1

