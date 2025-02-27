Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F91FA47C05
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 12:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2EE10EABA;
	Thu, 27 Feb 2025 11:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="BdEckSY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Thu, 27 Feb 2025 11:24:29 UTC
Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com
 [45.254.49.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BAE10EABA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:24:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id c65f97bb;
 Thu, 27 Feb 2025 19:19:17 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>,
 Simon Xue <xxm@rock-chips.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-usb@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 Frank Wang <frank.wang@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Johan Jonker <jbx6244@gmail.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Simona Vetter <simona@ffwll.ch>, Elaine Zhang <zhangqing@rock-chips.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 FUKAUMI Naoki <naoki@radxa.com>, linux-pwm@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-serial@vger.kernel.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ulf.hansson@linaro.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>, linux-watchdog@vger.kernel.org,
 Rob Herring <robh@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Shresth Prasad <shresthprasad7@gmail.com>, Tim Lunn <tim@feathertop.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>,
 Dragan Simic <dsimic@manjaro.org>, Mark Brown <broonie@kernel.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v3 00/15] rockchip: Add rk3562 SoC and evb support
Date: Thu, 27 Feb 2025 19:18:58 +0800
Message-Id: <20250227111913.2344207-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR1PTlZMGkxLSB9PSx1JGEtWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
X-HM-Tid: 0a954721e05903afkunmc65f97bb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NVE6Fjo6FzIUDQ00OEwOHgEc
 HTRPCgFVSlVKTE9LTU5OSk1LQkNPVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISE5NNwY+
DKIM-Signature: a=rsa-sha256;
 b=BdEckSY+wUbbiwIXz/tXIGngsjrJJtvnCGpRhJcumqcHi5a1XPphTYrKpF94mYf7sCVfc6bQU1p5Cmc1EaBUKYWwF0mwJiQPRXlVKuIn9V8U6IxtcGYA6jHfymHzjLQcqsPMufF1tOa4OESA6cy9nsLx1fDpDccQcBS3fazdRyg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=N8gEIfVArZNEctX9d5QVCtuV3cHJHJINt6Qku/Lq5OM=;
 h=date:mime-version:subject:message-id:from;
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


This patch set adds rk3562 SoC and its evb support.

I have split out patches need driver change for different subsystem.
And all the modules with dt-binding document update in this patch set
do not need any driver change. I put them together to make it clear we
have a new SoC and board to use the new compatible. Please pick up the
patch for your subsystem, or please let me know if the patch has to
send separate.

Test with GMAC, USB, PCIe, EMMC, SD Card.

This patch set is base on the patch set for rk3576 evb1 support.

V2:
https://lore.kernel.org/linux-rockchip/b4df8a73-58a2-4765-a9e4-3513cb2bc720@rock-chips.com/T/


Changes in v3:
- Rebase the change base on rk3576 pcie patches
- Updae to fix dt_binding_check fail
- update commit msg
- Collect review tag
- Update the commit message,
- remove the change for clock maxItems
- Collect reveiw tag
- Collect review tag
- Update the commit message
- Update commit message and add per device schema for clock name change
- Update the commit message and collect the Acked-by tag.
- Collect the Acked-by tag
- remove i2c/serial/spi alias
- add soc node

Changes in v2:
- Update in sort order
- remove grf in cru
- Update some properties order

Finley Xiao (2):
  arm64: dts: rockchip: add core dtsi for RK3562 Soc
  arm64: dts: rockchip: Add RK3562 evb2 devicetree

Kever Yang (13):
  dt-bindings: PCI: dwc: rockchip: Add rk3562 support
  dt-bindings: mmc: Add support for rk3562 eMMC
  dt-bindings: mmc: rockchip-dw-mshc: Add support for rk3562
  dt-bindings: i2c: i2c-rk3x: Add rk3562 support
  dt-bindings: gpu: Add rockchip,rk3562-mali compatible
  dt-bindings: watchdog: Add rk3562 compatible
  dt-bindings: spi: Add rk3562 support
  dt-bindings: serial: snps-dw-apb-uart: Add support for rk3562
  dt-bindings: usb: dwc3: Add support for rk3562
  dt-bindings: pwm: rockchip: Add rockchip,rk3562-pwm
  dt-bindings: rockchip: pmu: Add rk3562 compatible
  dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
  dt-bindings: arm: rockchip: Add rk3562 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
 .../bindings/gpu/arm,mali-bifrost.yaml        |    1 +
 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |    1 +
 .../bindings/mmc/rockchip-dw-mshc.yaml        |    1 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    4 +-
 .../bindings/pci/rockchip-dw-pcie.yaml        |    9 +-
 .../devicetree/bindings/pwm/pwm-rockchip.yaml |    1 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
 .../devicetree/bindings/spi/spi-rockchip.yaml |    1 +
 .../bindings/usb/rockchip,dwc3.yaml           |   19 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  520 ++++
 .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1374 ++++++++++
 17 files changed, 4297 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi

-- 
2.25.1

