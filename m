Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D2756097F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 20:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD8D10E6E6;
	Wed, 29 Jun 2022 18:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DB510E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 18:44:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 v193-20020a1cacca000000b003a051f41541so163284wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
 b=UAll3MyHfXcJWjHvJItFiKt+q0UDpdoZitVUmDKi17Z3tEqFaYeAa5I62dF9Ntp9ll
 izJeCsDmziR+qqGG6d1KJvui6VvkxYr1DY3A0DkU5WcyCeCJ4cFVVbKi7eEA/X3QMXIB
 UVs2gxxjHW0kQZtZLt5O6Wii36mOWwxTj9V35BJEEDO+hl7N3eUDwy36Of2SyBsE6UIj
 H6j75OklTOzvxdWOtJNtMBOCzCMI2H5xrFLsH2RNlvYtcVfpNE2mYlA6uIbBS1CmLl2f
 vmt9cLRnDkXhmABiQE/7jTone6UNsxp186B1ayF3xci6EtiTdGhbee1QsMAcImYigN9g
 Ti+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
 b=RxabNr1IFohDeP0IKEZ0TCKgeP9uFwbvmfJbs4QcG1OPw11BQsPkONDYMrZwAppgGQ
 rpFqbY4WQLtTJaIu6dGeOM6CE2Lt54VQA/m7s27Gt0PGDcSFG/52QU9tBs+/vzCJHj5d
 feZIz+ZJ+MOmWGRuedmIIMYMPHm6uJLdaO0V/h0eETWR6soYS0+3cSXvvK2tqO7oXvef
 UBfI/ZTHleqT6ykFZ5+ftLIRyzNl4UyJ2TNeL3aONvKNqV56wvUPu0ObUAoZmzxW/t+X
 nLneVlFzxs8jUqw9y3HT9q1LF7qa6FbiwyMxJI9qlQTzhQPlWnR7mLny9BWFxbfk+ecy
 VPWw==
X-Gm-Message-State: AJIora/VEpXnfGcqzagzGDInq9/5WcBplvm3m5iSi9/QW/v7h6VPmoLz
 vxML+0Onag0wmTiKxpDcGiXq+g==
X-Google-Smtp-Source: AGRyM1siRoebXeOTAi1aRlb3B7Y2ytiMC6ZasSqJOtJlLU+5gBlJlHVkI1lfg9OpYTZWjusZH35PlA==
X-Received: by 2002:a05:600c:19c8:b0:3a1:7399:861d with SMTP id
 u8-20020a05600c19c800b003a17399861dmr3088575wmq.170.1656528292500; 
 Wed, 29 Jun 2022 11:44:52 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 11:44:52 -0700 (PDT)
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
Subject: [PATCH v3 10/15] riscv: dts: canaan: fix kd233 display spi frequency
Date: Wed, 29 Jun 2022 19:43:39 +0100
Message-Id: <20220629184343.3438856-11-mail@conchuod.ie>
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

