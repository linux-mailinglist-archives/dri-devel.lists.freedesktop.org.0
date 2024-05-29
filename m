Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C38D2F10
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB85D113432;
	Wed, 29 May 2024 08:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 23C2C10F10A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:01:32 +0000 (UTC)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp
 [111.234.128.6])
 by sakura.ysato.name (Postfix) with ESMTPSA id D3AA91C0078;
 Wed, 29 May 2024 17:01:27 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren <guoren@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anup Patel <apatel@ventanamicro.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [DO NOT MERGE v8 00/36] Device Tree support for SH7751 based board
Date: Wed, 29 May 2024 17:00:46 +0900
Message-Id: <cover.1716965617.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an updated version of something I wrote about 7 years ago.
Minimum support for R2D-plus and LANDISK.
I think R2D-1 will work if you add AX88796 to dts.
And board-specific functions and SCI's SPI functions are not supported.

You can get it working with qemu found here.
https://gitlab.com/yoshinori.sato/qemu/-/tree/landisk

v8 changes.
- rebase v6.10-rc1
- sh/Konfig: Keep compatibility for non-DT.
- renesas,sh7750-cpg.yaml: cleanup.
- smi,sm501.yaml: rewrite register definition.
- sm501.c: remove unneeded changes.
- renesas,sh7751-irl-ext.yaml: fix intetrupt-cells.
- renesas,sh7751-pci.yaml: remove duplicate.
- clk-divider.c: cleanup.
- clk-gate.c: cleanup.
- sh_tmu.c: cleanup.
- pci-sh7751.c: cleanup.

v7 changes.
- sh/kernel/setup.c: fix kernel parameter handling.
- clk-sh7750.c: cleanup.
- sh_tmu.c: cleanup.
- irq-renesas-sh7751.c: IPR definition move to code.
- irq-renesas-sh7751irl.c: update register definition.
- pci-sh7751.c: Register initialization fix. 
- sm501 and sm501fb: Re-design Device Tree properties.

v6 changes.
- pci-sh7751: merge register define.
- pci-sh7751: use 'dma-ranges' property.
- pci-sh7751: rename general PCI properties.
- sm501 and sm501fb: Re-design Device Tree properties.
- sh/kernel/setup: cleanup command line setup.
- irq-sh7751.c: some cleanup.

v5 changes.
- pci-sh7751: revert header changes. and some fix in previuous driver.
- sh/kernel/iomap.c: Use SH io functions.
- sm501 and sm501fb: re-write DT support.

v4 changes.
- cpg-sh7750: use clk-divider and clk-gate.
- pci-sh7751: unified header files to old PCI driver.
- irq-renesas-sh7751: IPR registers direct mapping.
- irq-renesas-sh7751irl: useful register bit mapping.
- sm501 and sm501fb: re-write dt parser.
- j2_minus: fix build error.
- dt-binding schema: fix some errors.
- *.dts: cleanup.

v3 changes.
- Rewrite clk drivers.
- Added sh_tmu to OF support.
- Cleanup PCI stuff.
- Update sm501 and sm501fb OF support.
- Update devicetree and documents.

v2 changes.
- Rebasing v6,6-rc1
- re-write irqchip driver.
- Add binding documents.
- Cleanup review comment.

Yoshinori Sato (36):
  sh: passing FDT address to kernel startup.
  sh: Kconfig unified OF supported targets.
  sh: Enable OF support for build and configuration.
  dt-bindings: interrupt-controller: Add header for Renesas SH3/4 INTC.
  sh: GENERIC_IRQ_CHIP support for CONFIG_OF=y
  sh: kernel/setup Update DT support.
  sh: Fix COMMON_CLK support in CONFIG_OF=y.
  clocksource: sh_tmu: CLOCKSOURCE support.
  dt-binding: Add compatible SH7750 SoC
  sh: Common PCI Framework driver support.
  pci: pci-sh7751: Add SH7751 PCI driver
  dt-bindings: pci: pci-sh7751: Add SH7751 PCI
  dt-bindings: clock: sh7750-cpg: Add renesas,sh7750-cpg header.
  clk: Compatible with narrow registers
  clk: renesas: Add SH7750/7751 CPG Driver
  irqchip: Add SH7751 INTC driver
  dt-bindings: interrupt-controller: renesas,sh7751-intc: Add
    json-schema
  irqchip: SH7751 external interrupt encoder with enable gate.
  dt-bindings: interrupt-controller: renesas,sh7751-irl-ext: Add
    json-schema
  serial: sh-sci: fix SH4 OF support.
  dt-bindings: serial: renesas,scif: Add scif-sh7751.
  dt-bindings: display: smi,sm501: SMI SM501 binding json-schema
  mfd: sm501: Convert platform_data to OF property
  dt-binding: sh: cpus: Add SH CPUs json-schema
  dt-bindings: vendor-prefixes: Add iodata
  dt-bindings: ata: ata-generic: Add new targets
  dt-bindings: soc: renesas: sh: Add SH7751 based target
  sh: SH7751R SoC Internal peripheral definition dtsi.
  sh: add RTS7751R2D Plus DTS
  sh: Add IO DATA LANDISK dts
  sh: Add IO DATA USL-5P dts
  sh: j2_mimas_v2.dts update
  sh: Add dtbs target support.
  sh: RTS7751R2D Plus OF defconfig
  sh: LANDISK OF defconfig
  sh: j2_defconfig: update

 .../devicetree/bindings/ata/ata-generic.yaml  |   2 +
 .../bindings/clock/renesas,sh7750-cpg.yaml    | 107 ++++
 .../bindings/display/smi,sm501.yaml           | 443 ++++++++++++++++
 .../renesas,sh7751-intc.yaml                  |  53 ++
 .../renesas,sh7751-irl-ext.yaml               |  57 +++
 .../bindings/pci/renesas,sh7751-pci.yaml      |  75 +++
 .../bindings/serial/renesas,scif.yaml         |   1 +
 .../devicetree/bindings/sh/cpus.yaml          |  63 +++
 .../devicetree/bindings/soc/renesas/sh.yaml   |  27 +
 .../bindings/timer/renesas,tmu.yaml           |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/sh/Kconfig                               |  11 +-
 arch/sh/boards/Kconfig                        |  23 +-
 arch/sh/boards/of-generic.c                   |  28 +-
 arch/sh/boot/compressed/head_32.S             |   5 +-
 arch/sh/boot/dts/Makefile                     |   5 +
 arch/sh/boot/dts/j2_mimas_v2.dts              |   2 +-
 arch/sh/boot/dts/landisk.dts                  |  77 +++
 arch/sh/boot/dts/rts7751r2dplus.dts           | 172 +++++++
 arch/sh/boot/dts/sh7751r.dtsi                 | 105 ++++
 arch/sh/boot/dts/usl-5p.dts                   |  85 ++++
 arch/sh/configs/j2_defconfig                  |  11 +-
 arch/sh/configs/landisk-of_defconfig          | 102 ++++
 arch/sh/configs/rts7751r2dplus-of_defconfig   |  77 +++
 arch/sh/drivers/Makefile                      |   2 +
 arch/sh/include/asm/io.h                      |   8 +
 arch/sh/include/asm/irq.h                     |  10 +-
 arch/sh/include/asm/pci.h                     |   4 +
 arch/sh/kernel/cpu/Makefile                   |   6 +-
 arch/sh/kernel/cpu/irq/imask.c                |  17 +
 arch/sh/kernel/cpu/sh4/Makefile               |   3 +
 arch/sh/kernel/iomap.c                        |  18 +
 arch/sh/kernel/setup.c                        |  31 +-
 arch/sh/kernel/time.c                         |  12 +
 drivers/clk/clk-divider.c                     |  41 +-
 drivers/clk/clk-gate.c                        |  49 +-
 drivers/clk/renesas/Kconfig                   |  13 +-
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-sh7750.c              | 480 ++++++++++++++++++
 drivers/clocksource/sh_tmu.c                  | 198 +++++---
 drivers/irqchip/Kconfig                       |  15 +
 drivers/irqchip/Makefile                      |   3 +
 drivers/irqchip/irq-renesas-sh7751.c          | 282 ++++++++++
 drivers/irqchip/irq-renesas-sh7751irl.c       | 221 ++++++++
 drivers/mfd/sm501.c                           | 238 +++++++++
 drivers/pci/controller/Kconfig                |   9 +
 drivers/pci/controller/Makefile               |   1 +
 drivers/pci/controller/pci-sh7751.c           | 335 ++++++++++++
 drivers/tty/serial/Kconfig                    |   2 +-
 drivers/tty/serial/sh-sci.c                   |   6 +-
 drivers/video/fbdev/sm501fb.c                 |  87 ++++
 include/dt-bindings/clock/sh7750-cpg.h        |  26 +
 .../renesas,sh7751-intc.h                     |  19 +
 include/linux/clk-provider.h                  |  20 +-
 include/linux/sh_intc.h                       |   7 +-
 55 files changed, 3539 insertions(+), 160 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
 create mode 100644 Documentation/devicetree/bindings/display/smi,sm501.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,sh7751-pci.yaml
 create mode 100644 Documentation/devicetree/bindings/sh/cpus.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/sh.yaml
 create mode 100644 arch/sh/boot/dts/landisk.dts
 create mode 100644 arch/sh/boot/dts/rts7751r2dplus.dts
 create mode 100644 arch/sh/boot/dts/sh7751r.dtsi
 create mode 100644 arch/sh/boot/dts/usl-5p.dts
 create mode 100644 arch/sh/configs/landisk-of_defconfig
 create mode 100644 arch/sh/configs/rts7751r2dplus-of_defconfig
 create mode 100644 drivers/clk/renesas/clk-sh7750.c
 create mode 100644 drivers/irqchip/irq-renesas-sh7751.c
 create mode 100644 drivers/irqchip/irq-renesas-sh7751irl.c
 create mode 100644 drivers/pci/controller/pci-sh7751.c
 create mode 100644 include/dt-bindings/clock/sh7750-cpg.h
 create mode 100644 include/dt-bindings/interrupt-controller/renesas,sh7751-intc.h

-- 
2.39.2

