Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F712FB29
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 18:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1366E1F9;
	Fri,  3 Jan 2020 17:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436FB6E1F9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 17:11:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5341120866;
 Fri,  3 Jan 2020 17:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578071510;
 bh=TkCyTXSej2jF3YkVJR+FosrszYQgZzEVh8tdf+gPDXU=;
 h=From:To:Cc:Subject:Date:From;
 b=X6SMKWvhCdtdVjBpnZTwyc5Nb4X9Qdyxe/jHoZwFxVCKi1ZxWK3O8dC/+ZitNntjn
 BwSlobbnTV39bTKIDJMR7u5H7rFObvsJg87q2Yq7nSI++V3/qf5/KErNkeSdINc4Ih
 Mub3xv22cxOsp50xa2SZHpdtUQT/vOIA8NMOqcNo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/19] Rename Samsung and Exynos to lowercase
Date: Fri,  3 Jan 2020 18:11:12 +0100
Message-Id: <20200103171131.9900-1-krzk@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Kamil Debski <kamil@wypas.org>,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>,
 Vipul Pandya <vipul.pandya@samsung.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Byungho An <bh74.an@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Girish K S <ks.giri@samsung.com>, linux-crypto@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mark Brown <broonie@kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Murray <andrew.murray@arm.com>, "David S. Miller" <davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The "Samsung" and "Exynos" names are written inconsistently in Linux
kernel sources. Sometimes all uppercase (as SAMSUNG), sometimes
lowercase with capital letter (as Samsung).

This patchset tries to unify this towards "Samsung" and "Exynos"
versions because:

1. "SAMSUNG" and "EXYNOS" are not abbreviations but regular trademarked
    names.  Therefore they should be written with lowercase letters starting
    with capital letter.

2. The lowercase "Exynos" name is promoted by its manufacturer Samsung
   Electronics Co., Ltd., in advertisement materials and on website [1].

3. Although advertisement materials usually use uppercase "SAMSUNG", the
   lowercase version is used in all legal aspects (e.g. on Wikipedia [2]
   and in privacy/legal statements on Samsung site [3]).

Patches are independent of each other so I expect they will go through
each maintainer's tree. Optionally let me know - I'll take it then
through samsung-soc tree.

[1] https://www.samsung.com/semiconductor/minisite/exynos/
[2] https://en.wikipedia.org/wiki/Samsung
[3] https://www.samsung.com/semiconductor/privacy-global/

Best regards,
Krzysztof

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kamil Debski <kamil@wypas.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Byungho An <bh74.an@samsung.com>
Cc: Girish K S <ks.giri@samsung.com>
Cc: Vipul Pandya <vipul.pandya@samsung.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Andrew Murray <andrew.murray@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Amit Kucheria <amit.kucheria@verdurent.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: netdev@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org

Krzysztof Kozlowski (19):
  arm64: dts: exynos: Rename Samsung and Exynos to lowercase
  ARM: dts: samsung: Rename Samsung and Exynos to lowercase
  ARM: samsung: Rename Samsung and Exynos to lowercase
  soc: samsung: Rename Samsung and Exynos to lowercase
  thermal: exynos: Rename Samsung and Exynos to lowercase
  media: samsung: Rename Samsung and Exynos to lowercase
  usb: exynos: Rename Samsung and Exynos to lowercase
  memory: samsung: Rename Exynos to lowercase
  phy: exynos: Rename Exynos to lowercase
  clocksource/drivers/exynos_mct: Rename Exynos to lowercase
  crypto: exynos-rng - Rename Exynos to lowercase
  devfreq: exynos: Rename Exynos to lowercase
  drm/exynos: Rename Exynos to lowercase
  video: exynos: Rename Exynos to lowercase
  pci: exynos: Rename Exynos to lowercase
  serial: samsung: Rename Exynos to lowercase
  mfd: samsung: Rename Samsung to lowercase
  net: ethernet: sxgbe: Rename Samsung to lowercase
  regulator: samsung: Rename Samsung to lowercase

 .../bindings/media/exynos-jpeg-codec.txt      |  2 +-
 .../devicetree/bindings/media/exynos5-gsc.txt |  2 +-
 .../bindings/media/samsung-fimc.txt           |  2 +-
 .../bindings/media/samsung-mipi-csis.txt      |  2 +-
 .../devicetree/bindings/phy/samsung-phy.txt   |  6 ++--
 .../driver-api/thermal/exynos_thermal.rst     |  6 ++--
 Documentation/media/v4l-drivers/fimc.rst      |  6 ++--
 Documentation/media/v4l-drivers/tuners.rst    |  2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts      |  2 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts     |  4 +--
 arch/arm/boot/dts/exynos5250.dtsi             |  8 ++---
 arch/arm/boot/dts/exynos5260-xyref5260.dts    |  4 +--
 arch/arm/boot/dts/exynos5260.dtsi             |  2 +-
 arch/arm/boot/dts/exynos5410-smdk5410.dts     |  4 +--
 arch/arm/boot/dts/exynos5410.dtsi             |  6 ++--
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |  2 +-
 arch/arm/boot/dts/exynos5420-cpus.dtsi        |  2 +-
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |  4 +--
 arch/arm/boot/dts/exynos5420.dtsi             |  6 ++--
 arch/arm/boot/dts/exynos5422-cpus.dtsi        |  2 +-
 arch/arm/boot/dts/exynos5800.dtsi             |  6 ++--
 arch/arm/boot/dts/s3c2416-smdk2416.dts        |  2 +-
 arch/arm/boot/dts/s3c6410-smdk6410.dts        |  4 +--
 arch/arm/mach-exynos/Kconfig                  | 36 +++++++++----------
 arch/arm/mach-exynos/common.h                 |  2 +-
 arch/arm/mach-exynos/exynos.c                 |  4 +--
 arch/arm/mach-exynos/include/mach/map.h       |  2 +-
 arch/arm/mach-exynos/pm.c                     |  2 +-
 arch/arm/mach-exynos/smc.h                    |  2 +-
 arch/arm/mach-exynos/suspend.c                |  2 +-
 arch/arm/mach-s3c24xx/Kconfig                 | 16 ++++-----
 arch/arm/plat-samsung/adc.c                   |  2 +-
 arch/arm/plat-samsung/devs.c                  |  2 +-
 arch/arm/plat-samsung/gpio-samsung.c          |  2 +-
 .../plat-samsung/include/plat/samsung-time.h  |  2 +-
 .../dts/exynos/exynos5433-tm2-common.dtsi     |  2 +-
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts |  2 +-
 .../arm64/boot/dts/exynos/exynos5433-tm2e.dts |  2 +-
 .../boot/dts/exynos/exynos7-espresso.dts      |  4 +--
 arch/arm64/boot/dts/exynos/exynos7.dtsi       |  2 +-
 drivers/clocksource/exynos_mct.c              |  2 +-
 drivers/crypto/Kconfig                        |  2 +-
 drivers/devfreq/Kconfig                       |  2 +-
 drivers/devfreq/event/Kconfig                 |  4 +--
 drivers/devfreq/event/exynos-nocp.c           |  2 +-
 drivers/devfreq/event/exynos-nocp.h           |  2 +-
 drivers/devfreq/event/exynos-ppmu.c           |  2 +-
 drivers/devfreq/event/exynos-ppmu.h           |  2 +-
 drivers/gpu/drm/exynos/Kconfig                |  6 ++--
 drivers/media/platform/exynos4-is/media-dev.c |  2 +-
 drivers/media/platform/s3c-camif/camif-core.c |  2 +-
 drivers/memory/samsung/Kconfig                |  2 +-
 drivers/memory/samsung/exynos-srom.c          |  2 +-
 drivers/mfd/Kconfig                           |  2 +-
 .../net/ethernet/samsung/sxgbe/sxgbe_main.c   |  2 +-
 drivers/pci/controller/dwc/pci-exynos.c       |  2 +-
 drivers/phy/allwinner/phy-sun4i-usb.c         |  2 +-
 drivers/phy/samsung/Kconfig                   |  8 ++---
 drivers/phy/samsung/phy-exynos-dp-video.c     |  4 +--
 drivers/phy/samsung/phy-exynos-mipi-video.c   |  4 +--
 drivers/phy/samsung/phy-exynos-pcie.c         |  2 +-
 drivers/phy/samsung/phy-exynos5-usbdrd.c      |  6 ++--
 drivers/phy/samsung/phy-samsung-usb2.c        |  2 +-
 drivers/regulator/s2mpa01.c                   |  2 +-
 drivers/regulator/s2mps11.c                   |  2 +-
 drivers/regulator/s5m8767.c                   |  2 +-
 drivers/soc/samsung/Kconfig                   |  2 +-
 drivers/soc/samsung/exynos-chipid.c           |  2 +-
 drivers/soc/samsung/exynos-pmu.c              |  2 +-
 drivers/soc/samsung/exynos-pmu.h              |  2 +-
 drivers/soc/samsung/exynos3250-pmu.c          |  2 +-
 drivers/soc/samsung/exynos4-pmu.c             |  2 +-
 drivers/soc/samsung/exynos5250-pmu.c          |  2 +-
 drivers/soc/samsung/exynos5420-pmu.c          |  2 +-
 drivers/thermal/samsung/Kconfig               |  2 +-
 drivers/thermal/samsung/exynos_tmu.c          |  4 +--
 drivers/tty/serial/samsung_tty.c              |  2 +-
 drivers/usb/dwc3/dwc3-exynos.c                |  4 +--
 drivers/usb/host/Kconfig                      |  4 +--
 drivers/usb/host/ehci-exynos.c                |  4 +--
 drivers/usb/host/ohci-exynos.c                |  2 +-
 include/dt-bindings/thermal/thermal_exynos.h  |  2 +-
 include/linux/soc/samsung/exynos-pmu.h        |  2 +-
 include/linux/soc/samsung/exynos-regs-pmu.h   | 16 ++++-----
 include/linux/sxgbe_platform.h                |  2 +-
 include/uapi/drm/exynos_drm.h                 |  2 +-
 include/video/samsung_fimd.h                  |  2 +-
 87 files changed, 154 insertions(+), 154 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
