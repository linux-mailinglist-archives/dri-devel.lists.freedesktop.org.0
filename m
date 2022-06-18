Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E67355047B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 14:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB92E10E5D2;
	Sat, 18 Jun 2022 12:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB38210E5D2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 12:32:00 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s1so8792794wra.9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxrfrrOtT2Oa/bD+7FBstHMfLsi5+SmAhxAWzjAkyZ0=;
 b=S2mJhG/EP2bvAoovp3+1EX915fqgCN7s5TTHRtk6gjrtEqOI/5G9b2iqkP8Hp2fPJT
 Xv7w9JM5mIzSBmUBnG5veKqEPc/MaxIruLrav0YlVhnIQlMG/M+wTnbgpcN0tcmr+tr2
 or89IY4gglZ6yWfGfoA+jfJEq4JsK9dvMaD2rRItnHWPYoJkG7IkTqJN1pM8cYB5TpdM
 9bGqfIt5FOQFRPbbNCxOn37acP1sIBQPp6tl26reXViVZmDuywOt0O5V9tWi+koaQg4c
 DJEmvefmmDhAvEMjrhz9P1n7uaAObdu8xiUcENoorbn9u8vIjZNy1IW7RHROc+mSnsUJ
 yKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxrfrrOtT2Oa/bD+7FBstHMfLsi5+SmAhxAWzjAkyZ0=;
 b=agxujZanYOCc8H3IRyuCrYM20gm+2fOhMbIrbnqXzfJADioTfu2+Dyay9BEe69Ouhc
 trHUy9zuywvSFqghk0zIjx+eUaQsiotaBTN9UC0e0DWA91bXlc43mMBbymuTXKpYyuKc
 MSWuaSoV9us9ys3bqLSWNm+KbLIE+Of2Q6C0v9/ZPZFWDkhXf3LmCykEj2vd+/iCthEE
 k5HqJDQH7ponU0jgqiV3pJXwz1eUCWIeMc+LOmcCLVqJcJFREy6I8elTFjDI/M/moAqq
 v66uWPq1VAhhoZTA8btr+qSFnJfPzBavym7k+IYFOPmEthm2eVpdku4DTnYvXsSNvRPl
 Z65Q==
X-Gm-Message-State: AJIora9piIjXnQJ8R3BVBiwYd2b3CjKu9wXdJlJv+YzccjhHgaotFxGN
 QDDsqPgWYGPY5I/D8V4Mol5J4Q==
X-Google-Smtp-Source: AGRyM1vo09vBquhwF3XuUkIoGOLL2MXJBKKEyvgcE2QTAi/5UKplOA45WdH+tRLIApC05LNQOZn4qQ==
X-Received: by 2002:adf:fd0f:0:b0:210:32d7:4cb5 with SMTP id
 e15-20020adffd0f000000b0021032d74cb5mr13971427wrr.565.1655555519244; 
 Sat, 18 Jun 2022 05:31:59 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:31:58 -0700 (PDT)
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
Subject: [PATCH 00/14] Canaan devicetree fixes
Date: Sat, 18 Jun 2022 13:30:22 +0100
Message-Id: <20220618123035.563070-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
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

Hey all,
This series should rid us of dtbs_check errors for the RISC-V Canaan k210
based boards (well, unless you enable W=1 but that's another days work).
I *DO NOT* have any Canaan hardware so I have not tested any of this in
anger. I based the series on next-20220617.

For the bindings, I am never sure about which of {unevaluated,additional}
Properties is correct to use, but the if statements in the binding didn't
work with additional so I used unevaluated...

@Mark, for your two bindings I was not sure about the properties that I
made depend on the compatible, but I looked in tree and was not able to
find other users to contradict what's in the Canaan devicetrees nor did
I get that much help from their docs.

@Rob, yesterday's removal of ilitek,ili9341.txt is moved to ths series
since I was editing the dt-schema binding here anyway.

Finally, @Palmer:
This + Atul's stuff + the sifive dts watchdog patch will get us sorted
in terms of dtbs_check errors. To make keeping it that way a little
easier, I changed the Canaan devicetree Makefile so that it would build
all of the devicetrees in the directory if SOC_CANAAN. Hopefully someone
with a device can test it - but my build log *looked* fine but that's
not exactly sufficient.

Thanks,
Conor.

Conor Dooley (14):
  dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
  dt-bindings: display: panel: allow ilitek,ili9341 in isolation
  ASoC: dt-bindings: convert designware-i2s to dt-schema
  dt-bindings: dma: add Canaan k210 to Synopsys DesignWare DMA
  dt-bindings: timer: add Canaan k210 to Synopsys DesignWare timer
  spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width for dwc-ssi
  riscv: dts: canaan: fix the k210's memory node
  riscv: dts: canaan: add a specific compatible for k210's dma
  riscv: dts: canaan: add a specific compatible for k210's timers
  riscv: dts: canaan: fix mmc node names
  riscv: dts: canaan: fix kd233 display spi frequency
  riscv: dts: canaan: use custom compatible for k210 i2s
  riscv: dts: canaan: remove spi-max-frequency from controllers
  riscv: dts: canaan: build all devicetress if SOC_CANAAN

 .../bindings/display/ilitek,ili9341.txt       | 27 ------
 .../display/panel/ilitek,ili9341.yaml         | 60 ++++++++----
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 35 +++++--
 .../bindings/sound/designware-i2s.txt         | 35 -------
 .../bindings/sound/snps,designware-i2s.yaml   | 93 +++++++++++++++++++
 .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 +++++++---
 .../bindings/timer/snps,dw-apb-timer.yaml     | 28 ++++--
 arch/riscv/boot/dts/canaan/Makefile           | 10 +-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  4 +-
 arch/riscv/boot/dts/canaan/k210.dtsi          | 25 ++---
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  2 +-
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  2 +-
 .../boot/dts/canaan/sipeed_maixduino.dts      |  2 +-
 14 files changed, 239 insertions(+), 134 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml


base-commit: 07dc787be2316e243a16a33d0a9b734cd9365bd3
-- 
2.36.1

