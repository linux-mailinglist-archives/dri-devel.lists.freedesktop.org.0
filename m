Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F1BC4238C
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D52510E1E5;
	Sat,  8 Nov 2025 01:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="sF6AQfFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF4B10E13C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:10:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20251108010452euoutp029fbdff3d4156603bf43adf6f4f066c9a~14oWreyyy2548125481euoutp02G;
 Sat,  8 Nov 2025 01:04:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20251108010452euoutp029fbdff3d4156603bf43adf6f4f066c9a~14oWreyyy2548125481euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762563892;
 bh=vNRWflACSt/TGijhYcNBfeBbUUpxzkp2rju7QvuWPLw=;
 h=From:Subject:Date:To:Cc:References:From;
 b=sF6AQfFgkEosuyqO75LUfUFcRORuCmtawXN0NE8YZ1Eriu4lGl7UNLh2OzOF7qzb3
 zalukkthOw2ocnMRfHx/hBUSmi48ReWPsuyulux+Lkg9j1Ow7EktIZNY7NtlU/wRFP
 VvuZvtqqdKwjCQR2HAjLNqQdHNfe34ugf3N7QqIQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e~14oVjG-iM2253622536eucas1p1r;
 Sat,  8 Nov 2025 01:04:51 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010450eusmtip29f2f8b20301dd57342fa5fc2c2450545~14oUF8r5G0912409124eusmtip2Q;
 Sat,  8 Nov 2025 01:04:50 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH RFC 00/13] drm: starfive: jh7110: Enable display subsystem
Date: Sat, 08 Nov 2025 02:04:34 +0100
Message-Id: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOXDmkC/23NwW7DIAyA4VeJOA+EgUISTVOkSXuAXaceWPAau
 gVaSNplVd99LN2xR9v6fl9IxuQxk7a6kIQnn30MZYCHivSDDTuk3pWZCC42wCXQ/WAAOO2/0Aa
 aMThqnBBKANRcaFLcIeGH/16bb+T15Zlsb8uEx7n0p//LiDnbtd9Wj7c8KJDliWCq0aAp0B+/2
 Ng5n1OME4tp9/T34J7UvJa1ksxobTZF2uCWPKTPDrRkfRzvQ94IKFApzUzDpVFFzue58z2GeF7
 YiKt7txlpiYx+aquTZmBo6jXZXq+/1af5HkABAAA=
X-Change-ID: 20251031-jh7110-clean-send-7d2242118026
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Conor Dooley
 <conor@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
 <hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Xingyu
 Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,  Kishon
 Vijay Abraham I <kishon@kernel.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Icenowy Zheng <uwu@icenowy.me>,  Maud Spierings
 <maudspierings@gocontroll.com>, Andy Yan <andyshrk@163.com>,  Heiko Stuebner
 <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e
X-EPHeader: CA
X-CMS-RootMailID: 20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e
References: <CGME20251108010451eucas1p1c7bf340dbd2b1b7cbfb53d6debce7a2e@eucas1p1.samsung.com>
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

This series enables the display subsystem on the StarFive JH7110 SoC.
This hardware has a complex set of dependencies that this series aims to
solve.

The dom_vout (Video Output) block is a wrapper containing the display
controller (dc8200), the clock generator (voutcrg), and the HDMI IP, all
of which are managed by a single power domain (PD_VOUT).

More importantly, the HDMI IP is a monolithic block (controller and PHY
in one register space) that has a circular dependency with voutcrg:
1. The HDMI Controller needs clocks (like sysclk, mclk) from voutcrg to
   function.
2. The voutcrg (for its pixel MUXes) needs the variable pixel clock,
   which is generated by the HDMI PHY.

This series breaks this dependency loop by modeling the hardware
correctly:
1. A new vout-subsystem wrapper driver is added. It manages the shared
   PD_VOUT power domain and top level bus clocks. It uses
   of_platform_populate() to ensure its children (hdmi_mfd, voutcrg,
   dc8200) are probed only after power is on.
2. The monolithic hdmi node is refactored into an MFD. A new hdmi-mfd
   parent driver is added, which maps the shared register space and
   creates a regmap.
3. The MFD populates two children:
   - hdmi-phy: A new PHY driver that binds to the MFD. Its only
     dependency is the xin24m reference clock. It acts as the clock
     provider for the variable pixel clock (hdmi_pclk).
   - hdmi-controller: A new DRM bridge driver. It consumes clocks from
     voutcrg and the hdmi_pclk/PHY from its sibling hdmi-phy driver.
4. The generic inno-hdmi bridge library is refactored to accept a regmap
   from a parent MFD, making this model possible.

This MFD split breaks the circular dependency, as the kernel's deferred
probe can now find a correct, linear probe order: hdmi-phy (probes
first) -> voutcrg (probes second) -> hdmi-controller (probes third).

This series provides all the necessary dt-bindings, the new drivers, the
modification to inno-hdmi, and the final device tree changes to enable
the display.

Series depends on patchsets that are not merged yet:
 - dc8200 driver [1]
 - th1520 reset (dependency of dc8200 series) [2]
 - inno-hdmi bridge [3]

Testing:
I've tested on my monitor using `modetest` for following modes:
  #0 2560x1440 59.95 2560 2608 2640 2720 1440 1443 1448 1481 241500
     flags: phsync, nvsync; type: preferred, driver [DOESN"T WORK]
  #1 2048x1080 60.00 2048 2096 2128 2208 1080 1083 1093 1111 147180
     flags: phsync, nvsync; type: driver    [DOESN"T WORK]
  #2 2048x1080 24.00 2048 2096 2128 2208 1080 1083 1093 1099 58230
     flags: phsync, nvsync; type: driver     [DOESN'T WORK]
  #3 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500
     flags: phsync, pvsync; type: driver    [WORKS]
  #4 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352
     flags: phsync, pvsync; type: driver    [WORKS]
  #5 1920x1080 50.00 1920 2448 2492 2640 1080 1084 1089 1125 148500
     flags: phsync, pvsync; type: driver    [WORKS]
  #6 1600x1200 60.00 1600 1664 1856 2160 1200 1201 1204 1250 162000
     flags: phsync, pvsync; type: driver    [WORKS]
  #7 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000
     flags: phsync, pvsync; type: driver    [WORKS]
  #8 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000
     flags: phsync, pvsync; type: driver    [WORKS]
  #9 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 flags:
     phsync, pvsync; type: driver   [WORKS]
  #10 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags:
      phsync, pvsync; type: driver   [WORKS]
  #11 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags:
      phsync, pvsync; type: driver   [WORKS]
  #12 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags:
      phsync, pvsync; type: driver   [WORKS]
  #13 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 flags:
      phsync, pvsync; type: driver   [WORKS]
  #14 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags:
      nhsync, nvsync; type: driver   [WORKS]
  #15 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags:
      phsync, pvsync; type: driver  [WORKS]
  #16 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags:
      phsync, pvsync; type: driver  [WORKS]
  #17 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags: nhsync,
      nvsync; type: driver   [WORKS]
  #18 720x480 60.00 720 736 798 858 480 489 495 525 27027 flags: nhsync,
      nvsync; type: driver   [WORKS]
  #19 720x480 59.94 720 736 798 858 480 489 495 525 27000 flags: nhsync,
      nvsync; type: driver   [WORKS]
  #20 640x480 75.00 640 656 720 840 480 481 484 500 31500 flags: nhsync,
      nvsync; type: driver   [WORKS]
  #21 640x480 60.00 640 656 752 800 480 490 492 525 25200 flags: nhsync,
      nvsync; type: driver   [WORKS]
  #22 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags: nhsync,
      nvsync; type: driver   [WORKS]
  #23 720x400 70.08 720 738 846 900 400 412 414 449 28320 flags: nhsync,
      pvsync; type: driver   [DOESN'T WORK]

I believe this is a PHY tuning issue that can be fixed in the new
phy-jh7110-inno-hdmi.c driver without changing the overall architecture.
I plan to continue debugging these modes and will submit follow up fixes
as needed.

The core architectural plumbing is sound and ready for review.

Notes:
- The JH7110 does not have a centralized MAINTAINERS entry like the
  TH1520, and driver maintainership seems fragmented. I have therefore
  added a MAINTAINERS entry for the display subsystem and am willing to
  help with its maintenance.
- I am aware that the new phy-jh7110-inno-hdmi.c driver (patch 12) is a
  near duplicate of the existing phy-rockchip-inno-hdmi.c. This
  duplication is intentional and temporary for this RFC series.  My goal
  is to first get feedback on the overall architecture (the vout-subsystem
  wrapper, the hdmi-mfd split, and the dual-function PHY/CLK driver).

  If this architectural approach is acceptable, I will rework the PHY
  driver for a formal v1 submission. This will involve refactoring the
  common logic from the Rockchip PHY into a generic core driver that both
  the Rockchip and this new StarFive PHY driver will use. 

Many thanks to the Icenowy Zheng who developed a dc8200 driver, as well
as helped me understand how the SoC and the display pipeline works.

[1] - https://lore.kernel.org/all/20250921083446.790374-1-uwu@icenowy.me/
[2] - https://lore.kernel.org/all/20251014131032.49616-1-ziyao@disroot.org/
[3] - https://lore.kernel.org/all/20251016083843.76675-1-andyshrk@163.com/

---
Michal Wilczynski (13):
      dt-bindings: soc: starfive: Add vout-subsystem IP block
      dt-bindings: clock: jh7110: Make power-domain optional
      dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
      dt-bindings: display: bridge: Add starfive,jh7110-hdmi-controller
      dt-bindings: mfd: Add starfive,jh7110-hdmi-mfd
      drm: bridge: inno_hdmi: Refactor to support regmap and probe
      drm: bridge: inno_hdmi: Add .disable platform operation
      soc: starfive: Add jh7110-vout-subsystem driver
      soc: starfive: Add jh7110-hdmi-mfd driver
      clk: starfive: voutcrg: Update the voutcrg
      drm: bridge: starfive: Add hdmi-controller driver
      phy: starfive: Add jh7110-inno-hdmi-phy driver
      riscv: dts: starfive: jh7110: Update DT for display subsystem

 .../bindings/clock/starfive,jh7110-voutcrg.yaml    |   1 -
 .../starfive,jh7110-inno-hdmi-controller.yaml      | 123 ++++
 .../bindings/mfd/starfive,jh7110-hdmi-mfd.yaml     |  93 +++
 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  65 ++
 .../starfive/starfive,jh7110-vout-subsystem.yaml   | 156 +++++
 MAINTAINERS                                        |  12 +
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 119 +++-
 arch/riscv/boot/dts/starfive/jh7110.dtsi           | 111 ++-
 drivers/clk/starfive/clk-starfive-jh7110-vout.c    |  20 +-
 drivers/gpu/drm/bridge/Kconfig                     |  11 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/inno-hdmi.c                 | 103 ++-
 drivers/gpu/drm/bridge/jh7110-inno-hdmi.c          | 190 +++++
 drivers/phy/starfive/Kconfig                       |  19 +
 drivers/phy/starfive/Makefile                      |   1 +
 drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 762 +++++++++++++++++++++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/starfive/Kconfig                       |  42 ++
 drivers/soc/starfive/Makefile                      |   3 +
 drivers/soc/starfive/jh7110-hdmi-mfd.c             |  67 ++
 drivers/soc/starfive/jh7110-vout-subsystem.c       | 117 ++++
 include/drm/bridge/inno_hdmi.h                     |  26 +-
 23 files changed, 1974 insertions(+), 70 deletions(-)
---
base-commit: 0124ee3e78e4adb40db91280f3e468373e48928e
change-id: 20251031-jh7110-clean-send-7d2242118026
prerequisite-message-id: <20251014131032.49616-1-ziyao@disroot.org>
prerequisite-patch-id: eece7563aeac9481fcfbfe431944006a5106820a
prerequisite-patch-id: 24ed71d6319e801eb0155e577e078bfbf9253d30
prerequisite-patch-id: 2d301a1dcaf58d01a78c0aac618a2754639898ba
prerequisite-patch-id: 216741772e16b2ce583edd515bc8fba5d6470dc1
prerequisite-patch-id: 9d34dd523d55d473a6de065142f3a7498f9e8db5
prerequisite-message-id: <20251016083843.76675-1-andyshrk@163.com>
prerequisite-patch-id: 63253dcea8b1bfbde34e453562ac81e9868148d1
prerequisite-patch-id: adc84c1e4a7d682989d857b5c112845e699037c6
prerequisite-message-id: <20250921083446.790374-1-uwu@icenowy.me>
prerequisite-patch-id: 3d309e1448fd7debfbc014acbddf0dfef9205100
prerequisite-patch-id: 8307dd02eb848faa843468b8c2242e8cb9c39347
prerequisite-patch-id: 46e851ad42f8ec46284423c666f0ec44bd947005
prerequisite-patch-id: 1621e926bea2ff1d4ed54df7812a83b8462ba322
prerequisite-patch-id: c06c3b7fdded45495ba6b14c4f03fdab7c30aec3
prerequisite-patch-id: ae59787188ca928a4832dfe268ccfeb87252e6dd
prerequisite-patch-id: 10d8aaec692a647dc1e0e5d6c73c3969df30d78f
prerequisite-patch-id: c483ea581aac29d035a0b84124685e17510b4cf5

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

