Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACF68059C5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710AC10E5C3;
	Tue,  5 Dec 2023 16:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id B79C810E4E0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:55:33 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 9924C1C012C;
 Tue,  5 Dec 2023 18:46:00 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v5 00/37] Device Tree support for SH7751 based board
Date: Tue,  5 Dec 2023 18:45:19 +0900
Message-Id: <cover.1701768028.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Dec 2023 16:16:42 +0000
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Baoquan He <bhe@redhat.com>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an updated version of something I wrote about 7 years ago.
Minimum support for R2D-plus and LANDISK.
I think R2D-1 will work if you add AX88796 to dts.
And board-specific functions and SCI's SPI functions are not supported.

You can get it working with qemu found here.
https://gitlab.com/yoshinori.sato/qemu/-/tree/landisk


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

Yoshinori Sato (37):
  sh: passing FDT address to kernel startup.
  sh: Kconfig unified OF supported targets.
  sh: Enable OF support for build and configuration.
  dt-bindings: interrupt-controller: Add header for Renesas SH3/4 INTC.
  sh: GENERIC_IRQ_CHIP support for CONFIG_OF=y
  sh: kernel/setup Update DT support.
  sh: Fix COMMON_CLK support in CONFIG_OF=y.
  clocksource: sh_tmu: CLOCKSOURCE support.
  dt-bindings: timer: renesas,tmu: add renesas,tmu-sh7750
  sh: Common PCI Framework driver support.
  pci: pci-sh7751: Add SH7751 PCI driver
  dt-bindings: pci: pci-sh7751: Add SH7751 PCI
  dt-bindings: clock: sh7750-cpg: Add renesas,sh7750-cpg header.
  clk: Compatible with narrow registers
  clk: renesas: Add SH7750/7751 CPG Driver
  irqchip: Add SH7751 INTC driver
  dt-bindings: interrupt-controller: renesas,sh7751-intc: Add
    json-schema
  irqchip: SH7751 IRL external encoder with enable gate.
  dt-bindings: interrupt-controller: renesas,sh7751-irl-ext: Add
    json-schema
  serial: sh-sci: fix SH4 OF support.
  dt-bindings: serial: renesas,scif: Add scif-sh7751.
  dt-bindings: display: smi,sm501: SMI SM501 binding json-schema
  mfd: sm501: Convert platform_data to OF property
  dt-binding: sh: cpus: Add SH CPUs json-schema
  dt-bindings: vendor-prefixes: Add iodata
  dt-bindings: vendor-prefixes:  Add smi
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
 .../bindings/clock/renesas,sh7750-cpg.yaml    | 103 ++++
 .../bindings/display/smi,sm501.yaml           | 134 +++++
 .../renesas,sh7751-intc.yaml                  | 105 ++++
 .../renesas,sh7751-irl-ext.yaml               |  83 +++
 .../bindings/pci/renesas,sh7751-pci.yaml      | 128 +++++
 .../bindings/serial/renesas,scif.yaml         |   1 +
 .../devicetree/bindings/sh/cpus.yaml          |  73 +++
 .../devicetree/bindings/soc/renesas/sh.yaml   |  32 ++
 .../bindings/timer/renesas,tmu.yaml           |  11 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/sh/Kconfig                               |  11 +-
 arch/sh/boards/Kconfig                        |  24 +-
 arch/sh/boards/of-generic.c                   |  28 +-
 arch/sh/boot/compressed/head_32.S             |   5 +-
 arch/sh/boot/dts/Makefile                     |   5 +
 arch/sh/boot/dts/j2_mimas_v2.dts              |   2 +-
 arch/sh/boot/dts/landisk.dts                  |  74 +++
 arch/sh/boot/dts/rts7751r2dplus.dts           | 157 ++++++
 arch/sh/boot/dts/sh7751r.dtsi                 | 150 ++++++
 arch/sh/boot/dts/usl-5p.dts                   |  84 +++
 arch/sh/configs/j2_defconfig                  |  11 +-
 arch/sh/configs/landisk-of_defconfig          | 111 ++++
 arch/sh/configs/rts7751r2dplus-of_defconfig   |  93 ++++
 arch/sh/drivers/Makefile                      |   2 +
 arch/sh/drivers/pci/pci.c                     |   6 -
 arch/sh/include/asm/io.h                      |   6 +
 arch/sh/include/asm/irq.h                     |  10 +-
 arch/sh/include/asm/pci.h                     |   4 +
 arch/sh/kernel/cpu/Makefile                   |   6 +-
 arch/sh/kernel/cpu/irq/imask.c                |  17 +
 arch/sh/kernel/cpu/sh4/Makefile               |   3 +
 arch/sh/kernel/iomap.c                        |  24 +
 arch/sh/kernel/setup.c                        |  51 +-
 arch/sh/kernel/time.c                         |  12 +
 drivers/clk/clk-divider.c                     |  56 +-
 drivers/clk/clk-gate.c                        |  56 +-
 drivers/clk/renesas/Kconfig                   |  16 +-
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-sh7750.c              | 498 ++++++++++++++++++
 drivers/clocksource/sh_tmu.c                  | 161 ++++--
 drivers/irqchip/Kconfig                       |  15 +
 drivers/irqchip/Makefile                      |   3 +
 drivers/irqchip/irq-renesas-sh7751.c          | 290 ++++++++++
 drivers/irqchip/irq-renesas-sh7751irl.c       | 227 ++++++++
 drivers/mfd/sm501.c                           |  99 ++++
 drivers/pci/controller/Kconfig                |   9 +
 drivers/pci/controller/Makefile               |   1 +
 drivers/pci/controller/pci-sh7751.c           | 302 +++++++++++
 drivers/pci/controller/pci-sh7751.h           |  76 +++
 drivers/tty/serial/Kconfig                    |   2 +-
 drivers/tty/serial/sh-sci.c                   |   6 +-
 drivers/video/fbdev/sm501fb.c                 |  82 +++
 include/dt-bindings/clock/sh7750-cpg.h        |  26 +
 include/dt-bindings/display/sm501.h           |  25 +
 .../interrupt-controller/sh7751-intc.h        |  21 +
 include/linux/clk-provider.h                  |  22 +-
 include/linux/sh_intc.h                       |   7 +-
 58 files changed, 3396 insertions(+), 177 deletions(-)
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
 create mode 100644 drivers/pci/controller/pci-sh7751.h
 create mode 100644 include/dt-bindings/clock/sh7750-cpg.h
 create mode 100644 include/dt-bindings/display/sm501.h
 create mode 100644 include/dt-bindings/interrupt-controller/sh7751-intc.h

-- 
2.39.2

