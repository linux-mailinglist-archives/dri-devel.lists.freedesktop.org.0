Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C783EC6F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 10:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B35E112339;
	Sat, 27 Jan 2024 09:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (mecka.net [159.69.159.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id 12BE111233B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 09:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1706348923; bh=00DmZqyEpDXJ+Q5kUCHk3ZsWcoc+Ik/n4Bym0Re+KiE=;
 h=From:Subject:Date:To:Cc:From;
 b=jBbfztp9ORHzMWR37x+KZLSzE6IQPCI62bPLbEfC5YovcUzUucgqmpX8Sae7TprVb
 F+YIGFsP1r2+SlUOmK9RzDDQvrHW01tC25Cw0F8+Jxv864v/MMNHzA8kmCIg4oz0ea
 ygnPjnEXmdP0/mnq6z9vLwJBFaPdz6KDfaLUlQowGExsNUbzeDCSEviJE8zLo1VTrt
 J9EtSk5kyzbGGBa8QcMMKRKfGv/lie4dPxhlpWo/QLs6AKBlsk/dTjlrePhUHQ6PWf
 j5UEFRA0g6uEZ+Z1rmbZIjmd277ouDcyDP2XqjR0Vf5K98gmz+mJefOMGV721QwfuD
 SALZ4IPR7beeA==
Received: from arthur.fritz.box (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id DCDF53BF7A4;
 Sat, 27 Jan 2024 10:48:42 +0100 (CET)
From: Manuel Traut <manut@mecka.net>
Subject: [PATCH v4 0/4] arm64: rockchip: Pine64 PineTab2 support
Date: Sat, 27 Jan 2024 10:48:41 +0100
Message-Id: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHnRtGUC/22NSwrCMBBAryJZG5lJaltdeQ9xkc/EBrEtSQlK6
 d1NC0IQl29m3puZRQqeIjvvZhYo+eiHPkO13zHTqf5O3NvMTICQKITgo+9pUlpwp1TTEKDVtWP
 5fAzk/GtLXW+ZOx+nIby3csJ1+ieSkAMnrFrVuBq1xcuTzEMd8pqtkSRKURaiWEWD7bG2ABLoV
 5RfsQKE8qPMotGoVH1yrZFQisuyfACGowGHEgEAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>, 
 Danct12 <danct12@riseup.net>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.12.4
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
Cc: devicetree@vger.kernel.org, Manuel Traut <manut@mecka.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for the BOE TH101MB31IG002 LCD Panel used in PineTab2 [1] and
PineTab-V [2] as well as the devictrees for the PineTab2 v0.1 and v2.0.

The BOE LCD Panel patch was retrieved from [3]. The function-name prefix has
been adapted and the LCD init section was simplified.

The PineTab2 devicetree patch was retrieved from [4]. Some renaming was needed
to pass the dtb-checks, the brightness-levels are specified as range and steps
instead of a list of values.

[5] and [6] was also used as source for this queue.

[1] https://wiki.pine64.org/wiki/PineTab2
[2] https://wiki.pine64.org/wiki/PineTab-V
[3] https://salsa.debian.org/Mobian-team/devices/kernels/rockchip-linux/-/blob/mobian-6.6/debian/patches/display/0018-drm-panel-add-BOE-TH101MB31IG002-28A-driver.patch?ref_type=heads
[4] https://salsa.debian.org/Mobian-team/devices/kernels/rockchip-linux/-/blob/mobian-6.6/debian/patches/device-tree/0134-arch-arm64-add-Pine64-PineTab2-device-trees.patch?ref_type=heads
[5] https://github.com/dreemurrs-embedded/linux-pinetab2/tree/v6.6.7-danctnix1
[6] https://xff.cz/git/linux?h=pt2-6.7

Signed-off-by: Manuel Traut <manut@mecka.net>
---
Changes in v4:
- Rebased on v6.8-rc1
- BOE TH101MB31IG002 LCD Panel:
  * Picked patches from https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
- PineTab2 dts:
  * Make flash-led a regulator-led and control the regulator by GPIO and set
    V5_MIDU as vin-supply to ensure that LED is working even if all other
    drivers using V5 MIDU are unloaded.
  * Add -regulator suffix to nodes, replace -con suffix by -connector
  * Set lcd pinctrl in .dts instead of .dtsi so it is more clear that this is
    different between pinetab v0.1 and v2.0
  * Remove unused bluetooth uart configuration and pinctrl
  * Increase spi-nor max-speed from 24 to 100 MHz
- Link to v3: https://lore.kernel.org/r/20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net

Changes in v3:
- PineTab2 dts:
    * Remove useless regulator-state-mem nodes for fixed regulators
    * Swap mmc0 and mmc1, so mmc0 is now the internal eMMC
- BOE TH101MB31IG002 LCD Panel:
    * Remove enabled/prepared checks since they are done in core.
- Use consistent naming (PineTab2 and PineTab-V) in commit messages.
- Link to v2: https://lore.kernel.org/r/20231223-pinetab2-v2-0-ec1856d0030e@mecka.net

Changes in v2:
- Removed dtb-checker fixups, cause I am not sure if they are correct
- Applied review comments for dt bindings
- pinetab2 dts:
    * Remove unverified WLAN entries, as in [5]
    * Simplify flash LED definition, as in [5]
    * Fix headphone detection and sound routing, as in [5]
    * Fix CRU clock configuration
- BOE TH101MB31IG002 LCD Panel:
    * Reworked prepare/enable unprepare/disable, as in [5]
- Replaced nicknames by realnames in author and signed-offs

- Link to v1: https://lore.kernel.org/r/20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net

---
Alexander Warnecke (1):
      drm/panel: Add driver for BOE TH101MB31IG002-28A panel

Manuel Traut (3):
      dt-bindings: display: panel: Add BOE TH101MB31IG002-28A panel
      dt-bindings: arm64: rockchip: Add Pine64 PineTab2
      arm64: dts: rockchip: Add devicetree for Pine64 PineTab2

 .../devicetree/bindings/arm/rockchip.yaml          |   8 +
 .../display/panel/boe,th101mb31ig002-28a.yaml      |  58 ++
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 .../boot/dts/rockchip/rk3566-pinetab2-v0.1.dts     |  28 +
 .../boot/dts/rockchip/rk3566-pinetab2-v2.0.dts     |  48 ++
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  | 943 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c   | 322 +++++++
 9 files changed, 1421 insertions(+)
---
base-commit: 3a5879d495b226d0404098e3564462d5f1daa33b
change-id: 20231222-pinetab2-faa77e01db6f

Best regards,
-- 
Manuel Traut <manut@mecka.net>

