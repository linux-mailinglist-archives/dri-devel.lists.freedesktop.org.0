Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE8556798E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4BF919F9;
	Tue,  5 Jul 2022 21:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90324919F9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:52:25 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a5so4697866wrx.12
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jToajnsA4DU5smbwrysnmFLqWjh8sTt0F9m0x429/q4=;
 b=XmxSBKEpjSnQARyzuVYMJKjypQCp5lKnVdlxVzwpWMB1XPSS5Jnbf89SFyjabdDH/I
 S5WYH7VXCVTuW5KVlHLalRqyOmGh7iwze5Q4WVyyREJjwcydIx7m9+tvt+KXpcXrQnSt
 JjPnqwlaWCTT+BOzLzTFtUofPCiZ3EUYjGkURzUr+/XHlH0BrcvB5gX5/BP/l8ubykLq
 U95Hj0mIPRMnGY1xr70iImh+U0NTZpK8XpOaT541iaSW41WZBQ8qzp4ArM2piFfOy0OV
 HhSBRZt5V0kQNYvK2cUUXhwHfJTU0HUH1LFEZYKZBlNeD+MB4lI/FNyrn89QgIihkw6X
 5QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jToajnsA4DU5smbwrysnmFLqWjh8sTt0F9m0x429/q4=;
 b=uxj6KF6qbdjK59g2SHq/6c1IhuB+IpdcPLBGTUso5pqesPNCb00CLdmLs2WVDnHXE8
 CnC3jNQ2CNUJzCMLIvKi+6hjy4KRc+7wnutCPEg//SPuAuee7HAkSBc0J55rviFSSEcS
 8+I9T7YjOOuKrsTZSwVt+i7nvV7JN9byjIgyK8x60/5S1wPBdg6zNGnKcqY/0KPbs8sH
 XmJY3e5/itWb37G7C4gN6HEoDBuRGVk14v4CX1X2Z+VkJ/x9lMZN378z0GkBK7RVeYT/
 aV7/dEZjSjmhzBkFz4n9Q+qySwlV8cPbq3Vi+8orVcIpUZePa530qS+4v1Pd4dt/GmSR
 rRNQ==
X-Gm-Message-State: AJIora+jiZnWjXTdU92ejmpzpQ+FpedPeALFA//6CJOv/MwactUUWCWK
 +B8Fg9t7Jvo3KRZK31h6ozzKMA==
X-Google-Smtp-Source: AGRyM1vyBLDyP4wKhE8IVBi2uODjJWvmtgPZ8crZRHD5rVX2f2UGPFzr5mMHIM4YLdqq6OGo2l9xyQ==
X-Received: by 2002:adf:ef47:0:b0:21d:6a93:9de8 with SMTP id
 c7-20020adfef47000000b0021d6a939de8mr11946273wrp.326.1657057943782; 
 Tue, 05 Jul 2022 14:52:23 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:52:23 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 00/13] Canaan devicetree fixes
Date: Tue,  5 Jul 2022 22:52:01 +0100
Message-Id: <20220705215213.1802496-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
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

Hey all,
This series should rid us of dtbs_check errors for the RISC-V Canaan k210
based boards. To make keeping it that way a little easier, I changed the
Canaan devicetree Makefile so that it would build all of the devicetrees
in the directory if SOC_CANAAN.

I *DO NOT* have any Canaan hardware so I have not tested any of this in
action. Since I sent v1, I tried to buy some since it's cheap - but could
out of the limited stockists none seemed to want to deliver to Ireland :(
I based the series on next-20220617.

Thanks,
Conor.

Changes since v4:
- add Rob's tags from v3
- sram: rephrase the binding description
- ASoC: dropped the applied binding

Changes since v3:
- dts: drop the bogus "regs" property pointed out by Niklas
- dma/timer: add Serge's reviews (and expand on the dma interrupt
  description)
- dts: add Niklas' T-b where I felt it was suitable. lmk if you think it
  applies more broadly
- spi: drop the applied spi dt-binding change. Thanks Mark.

Changes since v2:
- i2s: added clocks maxItems
- dma: unconditionally extended the interrupts & dropped canaan
  compatible
- timer: as per Sergey, split the timer dts nodes in 2 & drop the
  binding patch
- ili9341: add a canaan specific compatible to the binding and dts

Changes since v1:
- I added a new dt node & compatible for the SRAM memory controller due
  Damien's wish to preserve the inter-op with U-Boot.
- The dw-apb-ssi binding now uses the default rx/tx widths
- A new patch fixes bus {ranges,reg} warnings
- Rearranged the patches in a slightly more logical order

Conor Dooley (13):
  dt-bindings: display: convert ilitek,ili9341.txt to dt-schema
  dt-bindings: display: ili9341: document canaan kd233's lcd
  dt-bindings: dma: dw-axi-dmac: extend the number of interrupts
  dt-bindings: memory-controllers: add canaan k210 sram controller
  riscv: dts: canaan: fix the k210's memory node
  riscv: dts: canaan: fix the k210's timer nodes
  riscv: dts: canaan: fix mmc node names
  riscv: dts: canaan: fix kd233 display spi frequency
  riscv: dts: canaan: use custom compatible for k210 i2s
  riscv: dts: canaan: remove spi-max-frequency from controllers
  riscv: dts: canaan: fix bus {ranges,reg} warnings
  riscv: dts: canaan: add specific compatible for kd233's LCD
  riscv: dts: canaan: build all devicetress if SOC_CANAAN

 .../bindings/display/ilitek,ili9341.txt       | 27 -------
 .../display/panel/ilitek,ili9341.yaml         | 49 +++++++++----
 .../bindings/dma/snps,dw-axi-dmac.yaml        |  7 +-
 .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++
 arch/riscv/boot/dts/canaan/Makefile           | 10 ++-
 arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  6 +-
 arch/riscv/boot/dts/canaan/k210.dtsi          | 73 +++++++++++++------
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  2 +-
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  2 +-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  2 +-
 .../boot/dts/canaan/sipeed_maixduino.dts      |  2 +-
 11 files changed, 159 insertions(+), 73 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9341.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml


base-commit: b6f1f2fa2bddd69ff46a190b8120bd440fd50563
-- 
2.37.0

