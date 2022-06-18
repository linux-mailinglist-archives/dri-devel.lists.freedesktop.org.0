Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E013550488
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 14:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F5010E5F6;
	Sat, 18 Jun 2022 12:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E570710E5ED
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 12:32:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i10so5053494wrc.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hvr7KGApLNCGFBglHD3dnfCRd3yjQwODkG+M5NRKmQI=;
 b=DDJ6xBBbhzIGoPiqSpo5MnWPGVLzU4ERv8vLSiBnnPAynNwKjWM49EcnFIFQEkgm/l
 doK52smtoMBCAMnt3+oFGMyw4xhf6W+5pMee3IBtco7DlzBypqqFxGPePkxlqPEw5tri
 SDLBm2agXeKviAcJotwY5RL1uBwFcjHga0K6SkH6mQCE6NwwTJxpZV0bQ6udBQCQ8t5X
 /ugUETlZEHQBi+kUxi5RSWCIVIQtoVjqwtn8FqK1wrZYFA5exI/WKKix1Zp5xujFsjOq
 WhKYuvAAICTLiFyGacSvPtjx9GD78ZZmFV4S8UwSg41UB0EBKvQ+vCEP9thO5HxmtSKW
 MnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hvr7KGApLNCGFBglHD3dnfCRd3yjQwODkG+M5NRKmQI=;
 b=LGrPopHIX17X8ffKdXLOBKnhFMRKF2lOwD0Riu19dS5+N386yCN6/4jR8BUpde2KDN
 eRt1oOcoTBtIu5ThvwzScONse4Q8csrPcyUBdw+aFwoPiL53Osff2bgdDTyvFbQGLTfQ
 zRP3b/9fWPJMmRuQnSkKuz1Vlwm/3r/7zEvISSqegBKfaaYlfLV46pHa+Syk8FcOLD/g
 d/kzhEpxXtzjugUwhoLTgJN/yBW+1NbHxFZFO7Xf+QROj2nfSpyoUvRR9U7ptqNtOfkU
 xkjuBcT1E0DUN0aKrqTB0xleJgLeeJCB0rmHd0ZPtlmOyNG+NZwNZPb9HOHNf9dACqpY
 ADxg==
X-Gm-Message-State: AJIora9eerg9X0zBjivHeCgXMKp3Ha48o+g8xL1/uW4HIs6Pkl/NE7ri
 PEZaHaoUFyOy6FzZyc3KOb7EBg==
X-Google-Smtp-Source: AGRyM1sRT/G1/Zc62fYFm4YsukPkHZCuylsLgzzu2NtDF1otkPHXpMjCG/oHMIlIy5/3wMzfMLCUWA==
X-Received: by 2002:a05:6000:147:b0:214:7d6e:cb1d with SMTP id
 r7-20020a056000014700b002147d6ecb1dmr13471356wrx.650.1655555545465; 
 Sat, 18 Jun 2022 05:32:25 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:24 -0700 (PDT)
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
Subject: [PATCH 14/14] riscv: dts: canaan: build all devicetress if SOC_CANAAN
Date: Sat, 18 Jun 2022 13:30:36 +0100
Message-Id: <20220618123035.563070-15-mail@conchuod.ie>
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

Testing & checking the Canaan devicetrees is inconvenient as only the
devicetree corresponding to SOC_CANAAN_K210_DTB_BUILTIN will be built.
Change the Makefile so that all devicetrees are built by default if
SOC_CANAAN but only the one specified by SOC_CANAAN_K210_DTB_BUILTIN
gets built as an object.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I don't have any Canaan hardware, but I build tested it and the log
looked correct with arch/riscv/boot/dts/canaan/k210_generic.dtb.o
getting successfully built.
---
 arch/riscv/boot/dts/canaan/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
index c61b08ac8554..befe4eb7527b 100644
--- a/arch/riscv/boot/dts/canaan/Makefile
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -1,3 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
+dtb-$(CONFIG_SOC_CANAAN) += canaan_kd233.dtb
+dtb-$(CONFIG_SOC_CANAAN) += k210_generic.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_bit.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_dock.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_go.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maixduino.dtb
+
+obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-- 
2.36.1

