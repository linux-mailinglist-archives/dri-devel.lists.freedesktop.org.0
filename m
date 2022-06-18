Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D879E550487
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 14:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F1410E5ED;
	Sat, 18 Jun 2022 12:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C36C10E5ED
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 12:32:21 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c21so8821109wrb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
 b=BPAP4EOMpcTLtigvaPPAmrkhyUhM2es3mn99xXabOD36beL2UV5x4oZfV2njhaHRDu
 6CJGk2QVhn6oPqlOR2djhrL2247MI0pKKag+FDbmQ4H1hZD3+mmDz6hqN32wihfedwv8
 0JY3Dc3Cdrb0deOAs1Y2GOWa/xJwK81U2UBuCQMBHxKmg45ip5zSneSbL7BpIz3+F9U/
 HD9dL2+AWfZ418nW0lUl3ciiJOF84+lcioBfjjBShBTDpTsuwqj7tIBkBiNbmNeX1w9i
 bBklT1NVM2cTV5b3a0VEOCSBXAlFbb9ESoUAC/KWlmIDjjTCsZX275Q9n2aNWJYhq+7O
 e64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
 b=NkDi2zCt98Kbfp3HvZBa2AO/nyxovz2dUgyrwEH1GxL+uctHgZzSsTqp1wrtI7J5Is
 GpxfNI3XWeHXpnHDYqlYmVRz8r5sd6CZvhKWHzx9XfpnIbyRPW/9i+aJMs6WBfCrplzy
 8U91NBXEtTjS+v8faAWhTWsIo8RbO3IsLud2L8GlTgcguiI9cfm75/tO+UVy1oNWfBUJ
 B6/Q3RaLyEHLYDSYX8X4zZv/SMKjzogrDdBAjR+xMyDPlrtURY4tIDOW3HOk9YsChGhW
 JEGpVKHRrTJdF64/fFG2/9s27k1x7JIrP2JmPMjVJQhMnw2D+en2hoz3aJlVIHNQ7X//
 lK6A==
X-Gm-Message-State: AJIora/A2yCZ27CtHH1rE/BV1bgfMNzp5qhsURDkXcYwWWSsczSwULo/
 kXDN0pe+e/B5ANevzf/30q+Mkg==
X-Google-Smtp-Source: AGRyM1uZgNeRAWVSfV/hT8p8ffzeOsYwkUHkdfjgJGx3PbBuSC2KESMglEYy9aDYjH9MqXxklw0uUQ==
X-Received: by 2002:a05:6000:695:b0:21a:3a1a:7b60 with SMTP id
 bo21-20020a056000069500b0021a3a1a7b60mr10579808wrb.441.1655555539583; 
 Sat, 18 Jun 2022 05:32:19 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:18 -0700 (PDT)
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
Subject: [PATCH 11/14] riscv: dts: canaan: fix kd233 display spi frequency
Date: Sat, 18 Jun 2022 13:30:33 +0100
Message-Id: <20220618123035.563070-12-mail@conchuod.ie>
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

The binding for the ili9341 specifies a const spi-max-frequency of 10
MHz but the kd233 devicetree entry has it listed at 15 Mhz.
Align the devicetree with the value in the binding.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 40992d495aa8..4a540158f287 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -130,7 +130,7 @@ panel@0 {
 		compatible = "ilitek,ili9341";
 		reg = <0>;
 		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
-		spi-max-frequency = <15000000>;
+		spi-max-frequency = <10000000>;
 		status = "disabled";
 	};
 };
-- 
2.36.1

