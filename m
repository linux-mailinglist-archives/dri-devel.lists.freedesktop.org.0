Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BD023E03F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 20:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF89689BF8;
	Thu,  6 Aug 2020 18:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE7D89BF8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 18:20:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 198BF22CBB;
 Thu,  6 Aug 2020 18:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596738010;
 bh=R5A9IeePeMF+pCGC5xH+0WgwaMmWCizdpdQifAYCfUs=;
 h=From:To:Cc:Subject:Date:From;
 b=VZ8bcV46yXQaPthlqBYNYi49Puh3Evt9G+FZ9Ace+uGw5LrBt/vch1JlWmZUaSr11
 azRul/vUju/2jB7cmr2pYUjq3nANo2bJ67LYRGkOJ4XYtjzdYQKPZ+wTMlvn6znbXu
 ZX95QY6cH7OCD+BX5XAcb7YfPSReVyrKz5Yso69Y=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ben Dooks <ben-linux@fluff.org>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>,
 Andi Shyti <andi@etezian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 00/41] spi / fbdev / cpufreq / usb / mmc / hwmon / ARM:
 Prepare for multiplatform S3C
Date: Thu,  6 Aug 2020 20:19:32 +0200
Message-Id: <20200806181932.2253-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Shortly
=======
This is a continuation of Arnd's work from 2019 [1].  The goal is to
cleanup, merge and finally make the Samsung S3C24xx and S3C64xx
architectures multiplatform.  The multiplatform did not happen yet
here... just cleaning up and merging into one mach-s3c.

I intend to take it through Samsung SoC tree so all Acks are welcomed.

Changes since v1
================
1. Rebased,
2. Addressed comments (including mine),
3. Few new patches.

Please see individual changelogs (per patch).

[1] https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=185855&state=*

Best regards,
Krzysztof


Arnd Bergmann (37):
  ARM: s3c24xx: fix mmc gpio lookup tables
  ARM: s3c24xx: iotiming: make functions static
  ARM: s3c24xx: make S3C24XX_MISCCR access indirect
  ARM: s3c24xx: simplify mach/io.h
  usb: gadget: s3c: use platform resources
  usb: gadget: s3c-hsudc: remove platform header dependency
  ARM: samsung: don't build plat/pm-common for Exynos
  ARM: samsung: remove s3c_pm_debug_init()
  ARM: samsung: make pm-debug platform independent
  ARM: samsung: move CONFIG_DEBUG_S3C_UART to Kconfig.debug
  ARM: exynos: use private samsung_cpu_id copy
  ARM: exynos: stop selecting PLAT_SAMSUNG
  ARM: samsung: move pm check code to drivers/soc
  ARM: s5pv210: use private pm save/restore
  ARM: s5pv210: don't imply CONFIG_PLAT_SAMSUNG
  ARM: s3c64xx: remove mach/hardware.h
  ARM: s3c24xx: move regs-spi.h into spi driver
  ARM: s3c24xx: move irqchip driver back into platform
  ARM: s3c: adc: move header to linux/soc/samsung
  ARM: s3c24xx: move spi fiq handler into platform
  ASoC: samsung: h1940: turn into platform driver
  ASoC: samsung: neo1973: turn into platform driver
  ASoC: samsung: rx1950: turn into platform driver
  ASoC: samsung: s3c2412-i2s: avoid hardcoded S3C2410_PA_IIS
  ARM: s3c24xx: move iis pinctrl config into boards
  ARM: s3c24xx: move s3cmci pinctrl handling into board files
  ARM: s3c24xx: include mach/irqs.h where needed
  ARM: s3c24xx: spi: avoid hardcoding fiq number in driver
  ARM: s3c24xx: bast: avoid irq_desc array usage
  fbdev: s3c2410fb: remove mach header dependency
  cpufreq: s3c24xx: split out registers
  ARM: s3c: remove cpufreq header dependencies
  cpufreq: s3c2412: use global s3c2412_cpufreq_setrefresh
  cpufreq: s3c24xx: move low-level clk reg access into platform code
  ARM: s3c24xx: stop including mach/hardware.h from mach/io.h
  ARM: s3c: move into a common directory
  ARM: s3c: make headers local if possible

Krzysztof Kozlowski (4):
  ARM: s3c: Remove unneeded machine header includes
  mmc: s3cmci: Remove unneeded machine header include
  ARM: s3c24xx: pass pointer to clk driver via platform data
  MAINTAINERS: Add more name matches for Samsung SoC entries

 MAINTAINERS                                   |  21 +-
 arch/arm/Kconfig                              |   5 +-
 arch/arm/Kconfig.debug                        |  18 +-
 arch/arm/Makefile                             |   7 +-
 arch/arm/mach-exynos/Makefile                 |   4 -
 arch/arm/mach-exynos/common.h                 |   6 +-
 arch/arm/mach-exynos/exynos.c                 |  21 +-
 arch/arm/mach-exynos/include/mach/map.h       |  18 --
 arch/arm/mach-exynos/platsmp.c                |   4 +-
 arch/arm/mach-exynos/pm.c                     |   8 +-
 arch/arm/{plat-samsung => mach-s3c}/Kconfig   |  62 +----
 .../Kconfig => mach-s3c/Kconfig.s3c24xx}      |   7 -
 .../Kconfig => mach-s3c/Kconfig.s3c64xx}      |   0
 arch/arm/{plat-samsung => mach-s3c}/Makefile  |  15 +-
 .../{mach-s3c24xx => mach-s3c}/Makefile.boot  |   0
 .../Makefile => mach-s3c/Makefile.s3c24xx}    |  23 +-
 .../Makefile => mach-s3c/Makefile.s3c64xx}    |  32 +--
 .../include/plat => mach-s3c}/adc-core.h      |   0
 arch/arm/{plat-samsung => mach-s3c}/adc.c     |   4 +-
 arch/arm/{mach-s3c24xx => mach-s3c}/anubis.h  |   0
 .../ata-core-s3c64xx.h}                       |   6 +-
 .../backlight-s3c64xx.h}                      |   6 +-
 .../arm/{mach-s3c24xx => mach-s3c}/bast-ide.c |   3 +-
 .../arm/{mach-s3c24xx => mach-s3c}/bast-irq.c |   8 +-
 arch/arm/{mach-s3c24xx => mach-s3c}/bast.h    |   0
 .../common-smdk-s3c24xx.c}                    |  13 +-
 .../common-smdk-s3c24xx.h}                    |   0
 arch/arm/{plat-samsung => mach-s3c}/cpu.c     |  21 +-
 .../include/plat => mach-s3c}/cpu.h           |  12 -
 .../cpufreq-utils-s3c24xx.c}                  |  40 +++-
 .../cpuidle.c => mach-s3c/cpuidle-s3c64xx.c}  |   8 +-
 .../arm/{mach-s3c64xx => mach-s3c}/crag6410.h |   2 +-
 .../dev-audio-s3c64xx.c}                      |   9 +-
 .../dev-backlight-s3c64xx.c}                  |   6 +-
 .../dev-uart-s3c64xx.c}                       |   5 +-
 .../arm/{plat-samsung => mach-s3c}/dev-uart.c |   2 +-
 arch/arm/{plat-samsung => mach-s3c}/devs.c    |  57 ++++-
 .../include/plat => mach-s3c}/devs.h          |   0
 .../mach/dma.h => mach-s3c/dma-s3c24xx.h}     |   0
 .../mach/dma.h => mach-s3c/dma-s3c64xx.h}     |   0
 arch/arm/mach-s3c/dma.h                       |   9 +
 .../fb-core.h => mach-s3c/fb-core-s3c24xx.h}  |   6 +-
 .../include/plat => mach-s3c}/fb.h            |   0
 .../plat => mach-s3c}/gpio-cfg-helpers.h      |   0
 .../include/plat => mach-s3c}/gpio-cfg.h      |   0
 .../include/plat => mach-s3c}/gpio-core.h     |   2 +-
 .../gpio-samsung-s3c24xx.h}                   |   2 +
 .../gpio-samsung-s3c64xx.h}                   |   0
 .../{plat-samsung => mach-s3c}/gpio-samsung.c |  18 +-
 arch/arm/mach-s3c/gpio-samsung.h              |   9 +
 arch/arm/{mach-s3c24xx => mach-s3c}/gta02.h   |   2 +-
 .../h1940-bluetooth.c                         |   7 +-
 arch/arm/{mach-s3c24xx => mach-s3c}/h1940.h   |   0
 .../hardware-s3c24xx.h}                       |  13 +-
 .../include/plat => mach-s3c}/iic-core.h      |   0
 arch/arm/mach-s3c/include/mach/io-s3c24xx.h   |  50 +++++
 arch/arm/mach-s3c/include/mach/io.h           |   8 +
 .../include/mach/irqs-s3c24xx.h}              |   0
 .../include/mach/irqs-s3c64xx.h}              |   0
 arch/arm/mach-s3c/include/mach/irqs.h         |   9 +
 .../plat => mach-s3c/include/mach}/map-base.h |   0
 arch/arm/{plat-samsung => mach-s3c}/init.c    |   4 +-
 .../iotiming-s3c2410.c                        |  14 +-
 .../iotiming-s3c2412.c                        |   6 +-
 .../irq-pm.c => mach-s3c/irq-pm-s3c24xx.c}    |  16 +-
 .../irq-pm.c => mach-s3c/irq-pm-s3c64xx.c}    |   8 +-
 arch/arm/mach-s3c/irq-s3c24xx-fiq-exports.c   |   9 +
 .../arm/mach-s3c/irq-s3c24xx-fiq.S            |  10 +-
 .../arm/mach-s3c}/irq-s3c24xx.c               |  23 +-
 .../irq-uart-s3c64xx.h}                       |   0
 .../include/plat => mach-s3c}/keypad.h        |   0
 .../mach-amlm5900.c                           |  35 ++-
 .../{mach-s3c24xx => mach-s3c}/mach-anubis.c  |  12 +-
 .../{mach-s3c64xx => mach-s3c}/mach-anw6410.c |  17 +-
 .../mach-at2440evb.c                          |  26 ++-
 .../{mach-s3c24xx => mach-s3c}/mach-bast.c    |  18 +-
 .../mach-crag6410-module.c                    |   2 +-
 .../mach-crag6410.c                           |  31 ++-
 .../{mach-s3c24xx => mach-s3c}/mach-gta02.c   |  55 ++++-
 .../{mach-s3c24xx => mach-s3c}/mach-h1940.c   |  64 ++++--
 .../arm/{mach-s3c64xx => mach-s3c}/mach-hmt.c |  13 +-
 .../{mach-s3c24xx => mach-s3c}/mach-jive.c    |  25 ++-
 .../mach-mini2440.c                           |  40 +++-
 .../mach-mini6410.c                           |  24 +-
 .../arm/{mach-s3c24xx => mach-s3c}/mach-n30.c |  34 ++-
 .../arm/{mach-s3c64xx => mach-s3c}/mach-ncp.c |  11 +-
 .../mach-nexcoder.c                           |  18 +-
 .../mach-osiris-dvs.c                         |   4 +-
 .../{mach-s3c24xx => mach-s3c}/mach-osiris.c  |  18 +-
 .../{mach-s3c24xx => mach-s3c}/mach-otom.c    |  14 +-
 .../{mach-s3c24xx => mach-s3c}/mach-qt2410.c  |  36 ++-
 .../mach-real6410.c                           |  20 +-
 .../{mach-s3c24xx => mach-s3c}/mach-rx1950.c  |  55 ++++-
 .../{mach-s3c24xx => mach-s3c}/mach-rx3715.c  |  24 +-
 .../mach-s3c2416-dt.c                         |   8 +-
 .../mach-s3c64xx-dt.c                         |   6 +-
 .../{mach-s3c64xx => mach-s3c}/mach-smartq.c  |  18 +-
 .../{mach-s3c64xx => mach-s3c}/mach-smartq.h  |   0
 .../{mach-s3c64xx => mach-s3c}/mach-smartq5.c |  16 +-
 .../{mach-s3c64xx => mach-s3c}/mach-smartq7.c |  16 +-
 .../mach-smdk2410.c                           |  14 +-
 .../mach-smdk2413.c                           |  21 +-
 .../mach-smdk2416.c                           |  23 +-
 .../mach-smdk2440.c                           |  25 ++-
 .../mach-smdk2443.c                           |  14 +-
 .../mach-smdk6400.c                           |  11 +-
 .../mach-smdk6410.c                           |  29 ++-
 .../mach-tct_hammer.c                         |  22 +-
 .../{mach-s3c24xx => mach-s3c}/mach-vr1000.c  |  13 +-
 .../{mach-s3c24xx => mach-s3c}/mach-vstms.c   |  18 +-
 .../include/plat => mach-s3c}/map-s3c.h       |  12 +-
 .../mach/map.h => mach-s3c/map-s3c24xx.h}     |   6 +-
 .../mach/map.h => mach-s3c/map-s3c64xx.h}     |   4 +-
 .../include/plat => mach-s3c}/map-s5p.h       |   4 +-
 arch/arm/mach-s3c/map.h                       |   9 +
 .../nand-core-s3c24xx.h}                      |   6 +-
 .../onenand-core-s3c64xx.h}                   |   6 +-
 arch/arm/{mach-s3c24xx => mach-s3c}/osiris.h  |   0
 arch/arm/{mach-s3c24xx => mach-s3c}/otom.h    |   0
 arch/arm/{mach-s3c64xx => mach-s3c}/pl080.c   |   6 +-
 .../{plat-samsung => mach-s3c}/platformdata.c |   4 +-
 .../{mach-s3c24xx => mach-s3c}/pll-s3c2410.c  |   4 +-
 .../pll-s3c2440-12000000.c                    |   4 +-
 .../pll-s3c2440-16934400.c                    |   4 +-
 .../{plat-samsung => mach-s3c}/pm-common.c    |   2 +-
 arch/arm/mach-s3c/pm-common.h                 |  40 ++++
 .../pm-core.h => mach-s3c/pm-core-s3c24xx.h}  |  10 +-
 .../pm-core.h => mach-s3c/pm-core-s3c64xx.h}  |  50 +----
 arch/arm/mach-s3c/pm-core.h                   |   9 +
 arch/arm/{plat-samsung => mach-s3c}/pm-gpio.c |   6 +-
 .../arm/{mach-s3c24xx => mach-s3c}/pm-h1940.S |   5 +-
 .../{mach-s3c24xx => mach-s3c}/pm-s3c2410.c   |  11 +-
 .../{mach-s3c24xx => mach-s3c}/pm-s3c2412.c   |  12 +-
 .../{mach-s3c24xx => mach-s3c}/pm-s3c2416.c   |   6 +-
 .../pm.c => mach-s3c/pm-s3c24xx.c}            |  14 +-
 .../pm.c => mach-s3c/pm-s3c64xx.c}            |  74 +++++-
 arch/arm/{plat-samsung => mach-s3c}/pm.c      |  20 +-
 .../include/plat => mach-s3c}/pm.h            |   2 +-
 .../include/plat => mach-s3c}/pwm-core.h      |   0
 .../include/plat => mach-s3c}/regs-adc.h      |   0
 .../regs-clock-s3c24xx.h}                     |   2 +
 .../regs-clock-s3c64xx.h}                     |   0
 arch/arm/mach-s3c/regs-clock.h                |   9 +
 .../regs-dsc-s3c24xx.h}                       |   6 +-
 .../regs-gpio-memport-s3c64xx.h}              |   0
 .../regs-gpio-s3c24xx.h}                      |   2 +
 .../regs-gpio-s3c64xx.h}                      |   0
 arch/arm/mach-s3c/regs-gpio.h                 |   9 +
 .../regs-irq-s3c24xx.h}                       |   2 +
 .../regs-irq-s3c64xx.h}                       |   0
 arch/arm/mach-s3c/regs-irq.h                  |   9 +
 .../include/plat => mach-s3c}/regs-irqtype.h  |   0
 .../regs-mem-s3c24xx.h}                       |   2 +
 .../regs-modem-s3c64xx.h}                     |   0
 .../mach => mach-s3c}/regs-s3c2443-clock.h    |  50 +++++
 .../regs-srom-s3c64xx.h}                      |   0
 .../regs-sys-s3c64xx.h}                       |   0
 .../regs-syscon-power-s3c64xx.h}              |   0
 .../regs-usb-hsotg-phy-s3c64xx.h}             |   0
 .../rtc-core-s3c24xx.h}                       |   6 +-
 arch/arm/{mach-s3c24xx => mach-s3c}/s3c2410.c |  21 +-
 .../s3c2412-power.h                           |   0
 arch/arm/{mach-s3c24xx => mach-s3c}/s3c2412.c |  24 +-
 .../include/mach => mach-s3c}/s3c2412.h       |   2 +
 arch/arm/{mach-s3c24xx => mach-s3c}/s3c2416.c |  34 +--
 arch/arm/{mach-s3c24xx => mach-s3c}/s3c2440.c |  17 +-
 arch/arm/{mach-s3c24xx => mach-s3c}/s3c2442.c |  17 +-
 arch/arm/{mach-s3c24xx => mach-s3c}/s3c2443.c |  29 +--
 arch/arm/{mach-s3c24xx => mach-s3c}/s3c244x.c |  20 +-
 .../common.c => mach-s3c/s3c24xx.c}           |  26 ++-
 .../common.h => mach-s3c/s3c24xx.h}           |   1 +
 arch/arm/{mach-s3c64xx => mach-s3c}/s3c6400.c |  16 +-
 arch/arm/{mach-s3c64xx => mach-s3c}/s3c6410.c |  21 +-
 .../common.c => mach-s3c/s3c64xx.c}           |  26 +--
 .../common.h => mach-s3c/s3c64xx.h}           |   0
 .../include/plat => mach-s3c}/sdhci.h         |   2 +-
 .../setup-camif-s3c24xx.c}                    |   4 +-
 .../setup-fb-24bpp-s3c64xx.c}                 |   6 +-
 .../setup-i2c-s3c24xx.c}                      |   8 +-
 .../setup-i2c0-s3c64xx.c}                     |   4 +-
 .../setup-i2c1-s3c64xx.c}                     |   4 +-
 .../setup-ide-s3c64xx.c}                      |   9 +-
 .../setup-keypad-s3c64xx.c}                   |   6 +-
 .../setup-sdhci-gpio-s3c24xx.c}               |   8 +-
 .../setup-sdhci-gpio-s3c64xx.c}               |   6 +-
 .../setup-spi-s3c24xx.c}                      |   6 +-
 .../setup-spi-s3c64xx.c}                      |   4 +-
 .../setup-ts-s3c24xx.c}                       |   5 +-
 .../setup-usb-phy-s3c64xx.c}                  |  10 +-
 .../{mach-s3c24xx => mach-s3c}/simtec-audio.c |  11 +-
 .../{mach-s3c24xx => mach-s3c}/simtec-nor.c   |   2 +-
 .../{mach-s3c24xx => mach-s3c}/simtec-pm.c    |  10 +-
 .../{mach-s3c24xx => mach-s3c}/simtec-usb.c   |   6 +-
 arch/arm/{mach-s3c24xx => mach-s3c}/simtec.h  |   0
 .../sleep-s3c2410.S                           |   9 +-
 .../sleep-s3c2412.S                           |   5 +-
 .../sleep.S => mach-s3c/sleep-s3c24xx.S}      |   7 +-
 .../sleep.S => mach-s3c/sleep-s3c64xx.S}      |   4 +-
 .../spi-core-s3c24xx.h}                       |   6 +-
 .../include/plat => mach-s3c}/usb-phy.h       |   0
 arch/arm/{mach-s3c24xx => mach-s3c}/vr1000.h  |   0
 .../{plat-samsung => mach-s3c}/wakeup-mask.c  |   4 +-
 .../include/plat => mach-s3c}/wakeup-mask.h   |   0
 arch/arm/mach-s3c24xx/include/mach/fb.h       |   2 -
 arch/arm/mach-s3c24xx/include/mach/io.h       | 212 ------------------
 arch/arm/mach-s3c64xx/include/mach/hardware.h |  17 --
 arch/arm/mach-s5pv210/Kconfig                 |   1 +
 arch/arm/mach-s5pv210/Makefile                |   7 -
 arch/arm/mach-s5pv210/pm.c                    |  51 ++++-
 arch/arm/mach-s5pv210/regs-clock.h            |   4 +-
 arch/arm/mach-s5pv210/s5pv210.c               |   2 -
 drivers/clk/samsung/clk-s3c2410-dclk.c        |  15 +-
 drivers/cpufreq/Kconfig.arm                   |   2 -
 drivers/cpufreq/s3c2410-cpufreq.c             |  10 +-
 drivers/cpufreq/s3c2412-cpufreq.c             |  44 ++--
 drivers/cpufreq/s3c2440-cpufreq.c             |  29 ++-
 drivers/cpufreq/s3c24xx-cpufreq-debugfs.c     |   2 +-
 drivers/cpufreq/s3c24xx-cpufreq.c             |  14 +-
 drivers/hwmon/s3c-hwmon.c                     |   2 +-
 drivers/input/touchscreen/s3c2410_ts.c        |  37 ++-
 drivers/irqchip/Makefile                      |   1 -
 drivers/mmc/host/Kconfig                      |   2 +-
 drivers/mmc/host/s3cmci.c                     |  72 ++----
 drivers/power/supply/s3c_adc_battery.c        |   2 +-
 drivers/pwm/Kconfig                           |   2 +-
 drivers/soc/samsung/Kconfig                   |  48 +++-
 drivers/soc/samsung/Makefile                  |   3 +
 .../soc/samsung/s3c-pm-check.c                |   2 +-
 .../soc/samsung/s3c-pm-debug.c                |  26 +--
 drivers/spi/Kconfig                           |   2 +-
 drivers/spi/Makefile                          |   1 -
 .../spi/spi-s3c24xx-regs.h                    |   9 +-
 drivers/spi/spi-s3c24xx.c                     |  28 +--
 drivers/tty/serial/Kconfig                    |   2 +-
 drivers/usb/gadget/udc/s3c-hsudc.c            |  55 +----
 drivers/usb/gadget/udc/s3c2410_udc.c          |  31 +--
 drivers/usb/gadget/udc/s3c2410_udc.h          |   1 +
 .../usb/gadget/udc/s3c2410_udc_regs.h         |   0
 .../video/fbdev/s3c2410fb-regs-lcd.h          |  28 +--
 drivers/video/fbdev/s3c2410fb.c               |  16 +-
 include/linux/platform_data/clk-s3c2410.h     |  19 ++
 .../linux/platform_data}/fb-s3c2410.h         |  33 ++-
 include/linux/platform_data/mmc-s3cmci.h      |   2 +
 include/linux/platform_data/s3c-hsudc.h       |   2 +
 .../linux/soc/samsung/s3c-adc.h               |   6 +-
 .../linux/soc/samsung/s3c-cpu-freq.h          |   4 +
 .../linux/soc/samsung/s3c-cpufreq-core.h      |  14 +-
 .../linux/soc/samsung/s3c-pm.h                |  69 +++---
 .../linux/spi/s3c24xx-fiq.h                   |  10 +
 include/linux/spi/s3c24xx.h                   |   2 +-
 sound/soc/samsung/Kconfig                     |   2 +-
 sound/soc/samsung/h1940_uda1380.c             |  71 ++----
 sound/soc/samsung/neo1973_wm8753.c            |  85 +++----
 sound/soc/samsung/rx1950_uda1380.c            |  72 ++----
 sound/soc/samsung/s3c-i2s-v2.c                |   3 +-
 sound/soc/samsung/s3c-i2s-v2.h                |   3 +-
 sound/soc/samsung/s3c2412-i2s.c               |   9 +-
 sound/soc/samsung/s3c24xx-i2s.c               |   7 -
 258 files changed, 1834 insertions(+), 1716 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/include/mach/map.h
 rename arch/arm/{plat-samsung => mach-s3c}/Kconfig (72%)
 rename arch/arm/{mach-s3c24xx/Kconfig => mach-s3c/Kconfig.s3c24xx} (98%)
 rename arch/arm/{mach-s3c64xx/Kconfig => mach-s3c/Kconfig.s3c64xx} (100%)
 rename arch/arm/{plat-samsung => mach-s3c}/Makefile (65%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/Makefile.boot (100%)
 rename arch/arm/{mach-s3c24xx/Makefile => mach-s3c/Makefile.s3c24xx} (79%)
 rename arch/arm/{mach-s3c64xx/Makefile => mach-s3c/Makefile.s3c64xx} (58%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/adc-core.h (100%)
 rename arch/arm/{plat-samsung => mach-s3c}/adc.c (99%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/anubis.h (100%)
 rename arch/arm/{mach-s3c64xx/ata-core.h => mach-s3c/ata-core-s3c64xx.h} (78%)
 rename arch/arm/{mach-s3c64xx/backlight.h => mach-s3c/backlight-s3c64xx.h} (78%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/bast-ide.c (97%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/bast-irq.c (95%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/bast.h (100%)
 rename arch/arm/{mach-s3c24xx/common-smdk.c => mach-s3c/common-smdk-s3c24xx.c} (96%)
 rename arch/arm/{mach-s3c24xx/common-smdk.h => mach-s3c/common-smdk-s3c24xx.h} (100%)
 rename arch/arm/{plat-samsung => mach-s3c}/cpu.c (62%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/cpu.h (89%)
 rename arch/arm/{mach-s3c24xx/cpufreq-utils.c => mach-s3c/cpufreq-utils-s3c24xx.c} (68%)
 rename arch/arm/{mach-s3c64xx/cpuidle.c => mach-s3c/cpuidle-s3c64xx.c} (92%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/crag6410.h (95%)
 rename arch/arm/{mach-s3c64xx/dev-audio.c => mach-s3c/dev-audio-s3c64xx.c} (97%)
 rename arch/arm/{mach-s3c64xx/dev-backlight.c => mach-s3c/dev-backlight-s3c64xx.c} (98%)
 rename arch/arm/{mach-s3c64xx/dev-uart.c => mach-s3c/dev-uart-s3c64xx.c} (95%)
 rename arch/arm/{plat-samsung => mach-s3c}/dev-uart.c (97%)
 rename arch/arm/{plat-samsung => mach-s3c}/devs.c (96%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/devs.h (100%)
 rename arch/arm/{mach-s3c24xx/include/mach/dma.h => mach-s3c/dma-s3c24xx.h} (100%)
 rename arch/arm/{mach-s3c64xx/include/mach/dma.h => mach-s3c/dma-s3c64xx.h} (100%)
 create mode 100644 arch/arm/mach-s3c/dma.h
 rename arch/arm/{mach-s3c24xx/fb-core.h => mach-s3c/fb-core-s3c24xx.h} (78%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/fb.h (100%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/gpio-cfg-helpers.h (100%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/gpio-cfg.h (100%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/gpio-core.h (99%)
 rename arch/arm/{mach-s3c24xx/include/mach/gpio-samsung.h => mach-s3c/gpio-samsung-s3c24xx.h} (99%)
 rename arch/arm/{mach-s3c64xx/include/mach/gpio-samsung.h => mach-s3c/gpio-samsung-s3c64xx.h} (100%)
 rename arch/arm/{plat-samsung => mach-s3c}/gpio-samsung.c (99%)
 create mode 100644 arch/arm/mach-s3c/gpio-samsung.h
 rename arch/arm/{mach-s3c24xx => mach-s3c}/gta02.h (94%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/h1940-bluetooth.c (96%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/h1940.h (100%)
 rename arch/arm/{mach-s3c24xx/include/mach/hardware.h => mach-s3c/hardware-s3c24xx.h} (54%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/iic-core.h (100%)
 create mode 100644 arch/arm/mach-s3c/include/mach/io-s3c24xx.h
 create mode 100644 arch/arm/mach-s3c/include/mach/io.h
 rename arch/arm/{mach-s3c24xx/include/mach/irqs.h => mach-s3c/include/mach/irqs-s3c24xx.h} (100%)
 rename arch/arm/{mach-s3c64xx/include/mach/irqs.h => mach-s3c/include/mach/irqs-s3c64xx.h} (100%)
 create mode 100644 arch/arm/mach-s3c/include/mach/irqs.h
 rename arch/arm/{plat-samsung/include/plat => mach-s3c/include/mach}/map-base.h (100%)
 rename arch/arm/{plat-samsung => mach-s3c}/init.c (98%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/iotiming-s3c2410.c (97%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/iotiming-s3c2412.c (98%)
 rename arch/arm/{mach-s3c24xx/irq-pm.c => mach-s3c/irq-pm-s3c24xx.c} (93%)
 rename arch/arm/{mach-s3c64xx/irq-pm.c => mach-s3c/irq-pm-s3c64xx.c} (97%)
 create mode 100644 arch/arm/mach-s3c/irq-s3c24xx-fiq-exports.c
 rename drivers/spi/spi-s3c24xx-fiq.S => arch/arm/mach-s3c/irq-s3c24xx-fiq.S (94%)
 rename {drivers/irqchip => arch/arm/mach-s3c}/irq-s3c24xx.c (99%)
 rename arch/arm/{mach-s3c64xx/irq-uart.h => mach-s3c/irq-uart-s3c64xx.h} (100%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/keypad.h (100%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-amlm5900.c (85%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-anubis.c (98%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-anw6410.c (96%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-at2440evb.c (89%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-bast.c (98%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-crag6410-module.c (99%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-crag6410.c (98%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-gta02.c (90%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-h1940.c (92%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-hmt.c (97%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-jive.c (98%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-mini2440.c (95%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-mini6410.c (97%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-n30.c (95%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-ncp.c (94%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-nexcoder.c (92%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-osiris-dvs.c (98%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-osiris.c (97%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-otom.c (91%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-qt2410.c (89%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-real6410.c (96%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-rx1950.c (93%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-rx3715.c (90%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-s3c2416-dt.c (92%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-s3c64xx-dt.c (94%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-smartq.c (97%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-smartq.h (100%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-smartq5.c (94%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-smartq7.c (94%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-smdk2410.c (89%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-smdk2413.c (90%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-smdk2416.c (95%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-smdk2440.c (89%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-smdk2443.c (93%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-smdk6400.c (93%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/mach-smdk6410.c (97%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-tct_hammer.c (83%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-vr1000.c (98%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/mach-vstms.c (91%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/map-s3c.h (87%)
 rename arch/arm/{mach-s3c24xx/include/mach/map.h => mach-s3c/map-s3c24xx.h} (97%)
 rename arch/arm/{mach-s3c64xx/include/mach/map.h => mach-s3c/map-s3c64xx.h} (98%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/map-s5p.h (85%)
 create mode 100644 arch/arm/mach-s3c/map.h
 rename arch/arm/{mach-s3c24xx/nand-core.h => mach-s3c/nand-core-s3c24xx.h} (77%)
 rename arch/arm/{mach-s3c64xx/onenand-core.h => mach-s3c/onenand-core-s3c64xx.h} (82%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/osiris.h (100%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/otom.h (100%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/pl080.c (98%)
 rename arch/arm/{plat-samsung => mach-s3c}/platformdata.c (96%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/pll-s3c2410.c (97%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/pll-s3c2440-12000000.c (97%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/pll-s3c2440-16934400.c (98%)
 rename arch/arm/{plat-samsung => mach-s3c}/pm-common.c (98%)
 create mode 100644 arch/arm/mach-s3c/pm-common.h
 rename arch/arm/{mach-s3c24xx/include/mach/pm-core.h => mach-s3c/pm-core-s3c24xx.h} (94%)
 rename arch/arm/{mach-s3c64xx/include/mach/pm-core.h => mach-s3c/pm-core-s3c64xx.h} (58%)
 create mode 100644 arch/arm/mach-s3c/pm-core.h
 rename arch/arm/{plat-samsung => mach-s3c}/pm-gpio.c (99%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/pm-h1940.S (80%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/pm-s3c2410.c (96%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/pm-s3c2412.c (94%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/pm-s3c2416.c (95%)
 rename arch/arm/{mach-s3c24xx/pm.c => mach-s3c/pm-s3c24xx.c} (93%)
 rename arch/arm/{mach-s3c64xx/pm.c => mach-s3c/pm-s3c64xx.c} (81%)
 rename arch/arm/{plat-samsung => mach-s3c}/pm.c (94%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/pm.h (98%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/pwm-core.h (100%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/regs-adc.h (100%)
 rename arch/arm/{mach-s3c24xx/include/mach/regs-clock.h => mach-s3c/regs-clock-s3c24xx.h} (99%)
 rename arch/arm/{mach-s3c64xx/include/mach/regs-clock.h => mach-s3c/regs-clock-s3c64xx.h} (100%)
 create mode 100644 arch/arm/mach-s3c/regs-clock.h
 rename arch/arm/{mach-s3c24xx/regs-dsc.h => mach-s3c/regs-dsc-s3c24xx.h} (77%)
 rename arch/arm/{mach-s3c64xx/regs-gpio-memport.h => mach-s3c/regs-gpio-memport-s3c64xx.h} (100%)
 rename arch/arm/{mach-s3c24xx/include/mach/regs-gpio.h => mach-s3c/regs-gpio-s3c24xx.h} (99%)
 rename arch/arm/{mach-s3c64xx/include/mach/regs-gpio.h => mach-s3c/regs-gpio-s3c64xx.h} (100%)
 create mode 100644 arch/arm/mach-s3c/regs-gpio.h
 rename arch/arm/{mach-s3c24xx/include/mach/regs-irq.h => mach-s3c/regs-irq-s3c24xx.h} (98%)
 rename arch/arm/{mach-s3c64xx/include/mach/regs-irq.h => mach-s3c/regs-irq-s3c64xx.h} (100%)
 create mode 100644 arch/arm/mach-s3c/regs-irq.h
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/regs-irqtype.h (100%)
 rename arch/arm/{mach-s3c24xx/regs-mem.h => mach-s3c/regs-mem-s3c24xx.h} (98%)
 rename arch/arm/{mach-s3c64xx/regs-modem.h => mach-s3c/regs-modem-s3c64xx.h} (100%)
 rename arch/arm/{mach-s3c24xx/include/mach => mach-s3c}/regs-s3c2443-clock.h (81%)
 rename arch/arm/{mach-s3c64xx/regs-srom.h => mach-s3c/regs-srom-s3c64xx.h} (100%)
 rename arch/arm/{mach-s3c64xx/regs-sys.h => mach-s3c/regs-sys-s3c64xx.h} (100%)
 rename arch/arm/{mach-s3c64xx/regs-syscon-power.h => mach-s3c/regs-syscon-power-s3c64xx.h} (100%)
 rename arch/arm/{mach-s3c64xx/regs-usb-hsotg-phy.h => mach-s3c/regs-usb-hsotg-phy-s3c64xx.h} (100%)
 rename arch/arm/{mach-s3c24xx/include/mach/rtc-core.h => mach-s3c/rtc-core-s3c24xx.h} (81%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/s3c2410.c (90%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/s3c2412-power.h (100%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/s3c2412.c (93%)
 rename arch/arm/{mach-s3c24xx/include/mach => mach-s3c}/s3c2412.h (96%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/s3c2416.c (86%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/s3c2440.c (85%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/s3c2442.c (82%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/s3c2443.c (86%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/s3c244x.c (91%)
 rename arch/arm/{mach-s3c24xx/common.c => mach-s3c/s3c24xx.c} (98%)
 rename arch/arm/{mach-s3c24xx/common.h => mach-s3c/s3c24xx.h} (99%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/s3c6400.c (88%)
 rename arch/arm/{mach-s3c64xx => mach-s3c}/s3c6410.c (87%)
 rename arch/arm/{mach-s3c64xx/common.c => mach-s3c/s3c64xx.c} (97%)
 rename arch/arm/{mach-s3c64xx/common.h => mach-s3c/s3c64xx.h} (100%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/sdhci.h (99%)
 rename arch/arm/{mach-s3c24xx/setup-camif.c => mach-s3c/setup-camif-s3c24xx.c} (96%)
 rename arch/arm/{mach-s3c64xx/setup-fb-24bpp.c => mach-s3c/setup-fb-24bpp-s3c64xx.c} (86%)
 rename arch/arm/{mach-s3c24xx/setup-i2c.c => mach-s3c/setup-i2c-s3c24xx.c} (79%)
 rename arch/arm/{mach-s3c64xx/setup-i2c0.c => mach-s3c/setup-i2c0-s3c64xx.c} (90%)
 rename arch/arm/{mach-s3c64xx/setup-i2c1.c => mach-s3c/setup-i2c1-s3c64xx.c} (90%)
 rename arch/arm/{mach-s3c64xx/setup-ide.c => mach-s3c/setup-ide-s3c64xx.c} (89%)
 rename arch/arm/{mach-s3c64xx/setup-keypad.c => mach-s3c/setup-keypad-s3c64xx.c} (86%)
 rename arch/arm/{mach-s3c24xx/setup-sdhci-gpio.c => mach-s3c/setup-sdhci-gpio-s3c24xx.c} (87%)
 rename arch/arm/{mach-s3c64xx/setup-sdhci-gpio.c => mach-s3c/setup-sdhci-gpio-s3c64xx.c} (95%)
 rename arch/arm/{mach-s3c24xx/setup-spi.c => mach-s3c/setup-spi-s3c24xx.c} (85%)
 rename arch/arm/{mach-s3c64xx/setup-spi.c => mach-s3c/setup-spi-s3c64xx.c} (89%)
 rename arch/arm/{mach-s3c24xx/setup-ts.c => mach-s3c/setup-ts-s3c24xx.c} (89%)
 rename arch/arm/{mach-s3c64xx/setup-usb-phy.c => mach-s3c/setup-usb-phy-s3c64xx.c} (93%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/simtec-audio.c (86%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/simtec-nor.c (98%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/simtec-pm.c (91%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/simtec-usb.c (96%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/simtec.h (100%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/sleep-s3c2410.S (90%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/sleep-s3c2412.S (93%)
 rename arch/arm/{mach-s3c24xx/sleep.S => mach-s3c/sleep-s3c24xx.S} (92%)
 rename arch/arm/{mach-s3c64xx/sleep.S => mach-s3c/sleep-s3c64xx.S} (97%)
 rename arch/arm/{mach-s3c24xx/spi-core.h => mach-s3c/spi-core-s3c24xx.h} (81%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/usb-phy.h (100%)
 rename arch/arm/{mach-s3c24xx => mach-s3c}/vr1000.h (100%)
 rename arch/arm/{plat-samsung => mach-s3c}/wakeup-mask.c (94%)
 rename arch/arm/{plat-samsung/include/plat => mach-s3c}/wakeup-mask.h (100%)
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/fb.h
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/io.h
 delete mode 100644 arch/arm/mach-s3c64xx/include/mach/hardware.h
 rename arch/arm/plat-samsung/pm-check.c => drivers/soc/samsung/s3c-pm-check.c (99%)
 rename arch/arm/plat-samsung/pm-debug.c => drivers/soc/samsung/s3c-pm-debug.c (78%)
 rename arch/arm/plat-samsung/include/plat/regs-spi.h => drivers/spi/spi-s3c24xx-regs.h (89%)
 rename arch/arm/plat-samsung/include/plat/regs-udc.h => drivers/usb/gadget/udc/s3c2410_udc_regs.h (100%)
 rename arch/arm/mach-s3c24xx/include/mach/regs-lcd.h => drivers/video/fbdev/s3c2410fb-regs-lcd.h (84%)
 create mode 100644 include/linux/platform_data/clk-s3c2410.h
 rename {arch/arm/plat-samsung/include/plat => include/linux/platform_data}/fb-s3c2410.h (57%)
 rename arch/arm/plat-samsung/include/plat/adc.h => include/linux/soc/samsung/s3c-adc.h (85%)
 rename arch/arm/plat-samsung/include/plat/cpu-freq.h => include/linux/soc/samsung/s3c-cpu-freq.h (97%)
 rename arch/arm/plat-samsung/include/plat/cpu-freq-core.h => include/linux/soc/samsung/s3c-cpufreq-core.h (95%)
 rename arch/arm/plat-samsung/include/plat/pm-common.h => include/linux/soc/samsung/s3c-pm.h (55%)
 rename drivers/spi/spi-s3c24xx-fiq.h => include/linux/spi/s3c24xx-fiq.h (66%)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
