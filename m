Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAED821F4F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 17:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E8910E1F2;
	Tue,  2 Jan 2024 16:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (unknown [IPv6:2a01:4f8:1c1c:934f::1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B94710E1EB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1704212151; bh=/yn+BnszyZ+KRHVcYDAKoJNyr3kCxWnTqCINmt8R93U=;
 h=From:Subject:Date:To:Cc:From;
 b=Wf2zKLMsn4n0KvBqpBNjqoFONc95QW5n6P8pkUnUfJyBoDgdy3x0bc737NqQHZMz4
 K+bYV2R4xA4XmDF/mILdboHU5RMASwJGvDOZGyRs1Kgd5f2c1/6p9h0+i9kAR7A/e6
 TbHI6JxjB5M7Ob1BT2dD1+6jrQ9I6o2m92qtlJE2KZwR15kvDOqKmwxOaAdR8QWAFo
 9DAZWeE9FtGOHkDGT1hO4KmwpuYeYIF3Dj+qQmcVa4tpcUW0+TjtfbDrhlGECMi3a2
 NinS2pGGaclfiZeg7QkmbkMw4kxZ+Nr974Ul63QWbm6Uc396Yw2ZgVS4OqWMUH6dlH
 nPq32xyOlE/lQ==
Received: from arthur.fritz.box (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id 5904A377C52;
 Tue,  2 Jan 2024 17:15:51 +0100 (CET)
From: Manuel Traut <manut@mecka.net>
Subject: [PATCH v3 0/4] arm64: rockchip: Pine64 PineTab2 support
Date: Tue, 02 Jan 2024 17:15:43 +0100
Message-Id: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK82lGUC/22MQQ6CMBBFr0JmbU1nqkBccQ/jotCpTIxAWtJoC
 He3sGLh8s389xaIHIQj3IoFAieJMg4ZzKmArrfDk5W4zECaDBKRmmTg2bakvLVVxRpdW3rI8ym
 wl8+euj8y9xLnMXz3csLt+ieSUGnFeKlt5UtsHTZv7l72nN+wRRIdRXMQaRM7rK+l09poPorru
 v4AlRdRPdkAAAA=
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
Alexander Warnecke (2):
      drm/panel: Add driver for BOE TH101MB31IG002-28A panel
      arm64: dts: rockchip: Add devicetree for Pine64 PineTab2

Manuel Traut (2):
      dt-bindings: display: panel: Add BOE TH101MB31IG002-28A panel
      dt-bindings: arm64: rockchip: Add Pine64 PineTab2

 .../devicetree/bindings/arm/rockchip.yaml          |   8 +
 .../display/panel/boe,th101mb31ig002-28a.yaml      |  58 ++
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 .../boot/dts/rockchip/rk3566-pinetab2-v0.1.dts     |  26 +
 .../boot/dts/rockchip/rk3566-pinetab2-v2.0.dts     |  46 +
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  | 959 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c   | 322 +++++++
 9 files changed, 1433 insertions(+)
---
base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
change-id: 20231222-pinetab2-faa77e01db6f

Best regards,
-- 
Manuel Traut <manut@mecka.net>

