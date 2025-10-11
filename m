Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD8BCEF3F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 05:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D22610E2D0;
	Sat, 11 Oct 2025 03:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="qr6jH453";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 351 seconds by postgrey-1.36 at gabe;
 Sat, 11 Oct 2025 03:39:37 UTC
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5CF10E2CE
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 03:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1760153973;
 bh=1ifJLk8873eX1hlHsp6hKpNT8S+IOtOqXiAmk6qv8rw=;
 h=From:To:Subject:Date:Message-Id;
 b=qr6jH453OlUMFfcTPpD4aXh5nxyyWS8jdaTuBZV2etQ950lnh0Eas4GyHgQOpqRpK
 ThnowTQU7lj29LwDL42/ZfuJsbEHCrepwhgyk6mmFOPaesF0TdfNBOMyILpcrg7+VF
 18TZiL70AI5lQBA00ZLco0hsKhkcV5nkTzdToJUs=
X-QQ-mid: zesmtpgz4t1760153563t46dff691
X-QQ-Originating-IP: vSCtcccqW2noE7PwTMsxNxd6jA273YQLY2Nnsk4ppuI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 11 Oct 2025 11:32:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11891270749055428238
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/8] Add Type-C DP support for RK3399 EVB IND board
Date: Sat, 11 Oct 2025 11:32:25 +0800
Message-Id: <20251011033233.97-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MX2TrL0qDY4jf57SwMknBNBS0cnZ9NLpTHlWKZy63+3wpB6lRJEDYCeh
 wvla4hGqHIHxVl2qvg2UUHpleuOBB3gGXu2hLANng8WrKFGIrI+fDY+rHIfxJusXVkwU4bT
 TnjeB2nnDMbWgxUj9heB2V1cIZ0okZ43nKfnXMTFDEBqa/KIz52EZ4VP9eGt9VkcASMBqpi
 pKB5ji2h6KgvTTmxQTRLzPDI1d5Ia1/31/xGN9/sEyfuWifAsnfZTj933zlz5BGyJVEr48C
 hrLwNO3kFbvLDaK5rKmBMmuDdv86BRbTrmtqs3ms4v1IRIJ9oS4vk3RuSM773YOj6w5AJru
 5BggkBvVKeeEgvIlKT1KLRc9gGzwb0QEtbiwtzuf5nbg5iBn0HbgCryfYAibQReo/xw7SqO
 XbfO/LhlZy8cuhks83vrGl4Z1UPOdr6CDmQGtrXM7X4kNsoDnj3iCJMqh3n1kztFYx6qFGE
 An4Bu8WJlMYJKgzYQ7gLUOL7w5Q3M4LUieC4ufKabIfdb2+Zsslhw4YqbqCTFFzAyhnlshe
 nS1zTLIPtqW6Judqm0qhC6kCOcvR0ru13YvrKmnuIob+3lIf0HmTH+1CGo8QAHOz5Hyk7cH
 WnHC59jTIFmEDADkNeCQi2SOZpxaxHAqVGZiEgxKFRmrDf3Q5MnbZJT0/yAf3IEDaphLH/z
 ZCdbMGFXsnE038iI7PK/OhCaVDM91HgQ8tZ8rGy5lTjCIzur3BuO1DfJgsMCzi0RjNobFJU
 lsa70rGPYVrCFcdJ+cl6LLGKZzJnIJ4L5bBsqNWyGLZPDo7czuchA0KiFxyyS3UOTLLL9aA
 mOigku4cvhm/rHBb+v4QQkEHiXx/CJNMscF4qmovBI4Ig6A925CL0wb1F56CXWQ/fHEwqjW
 04enNOqbjSkU1N3VIV6qgzBJZ7qt8NUs9F5fPRm8+ha4TD83zL9jCa3yyj8eslj7aSLCOaX
 9qJlQaChowsc8KSexOhbEr6hezh9FwjxvxbS8Bz0lelwuHiFoQhCvtgh0Y/yQP9BZcqETu0
 hZVw7QIw==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series focuses on adding Type-C DP support for USBDP PHY and DP
driver. The USBDP PHY and DP will perceive the changes in cable status
based on the USB PD and Type-C state machines provided by TCPM. Before
this, the USBDP PHY and DP controller of RK3399 sensed cable state
changes through extcon, and devices such as the RK3399 Gru-Chromebook
rely on them. This series should not break them.

====
1. DisplayPort HPD status notify

Before v4, I implemented a variety of DP HPD status notify. However,
they all had various problems and it was difficult to become a common
solution.

Under Dmitry's guidance, I try to add default DRM AUX HPD device when
register DisplayPort altmode in patch 1. That makes it redundant for
each Type-C chip driver to implement a similar registration process
in embedded scenarios.

====
2. Altmode switching and orientation switching for USBDP PHY

For USB Type-C interfaces, an external Type-C controller chip assists
by detecting cable attachment, determining plug orientation, and
reporting USB PD message. The USB/DP combo PHY supports software
configurable pin mapping and DisplayPort lane assignment. Based on
these message, the combo PHY can perform both altmode switching and
orientation switching via software.

The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
fusb302 chip as Type-C controller. The connection diagram is shown below:

fusb302 chip +---> USB2.0 PHY ----> DWC3 USB controller
             |
             +---> USB/DP PHY0 +--> CDN-DP controller
                               |
                               +--> DWC3 USB controller

====
3. Multiple bridge model for RK3399 CDN-DP

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
the CDN-DP can be switched to output to one of the PHYs.

USB/DP PHY0 ---+
               | <----> CDN-DP controller
USB/DP PHY1 ---+

In previous versions, if both PHY ports were connected to DP,
the CDN-DP driver would select the first PHY port for output.

On Dmitry's suggestion, we introduced a multi-bridge model to support
flexible selection of the output PHY port. For each PHY port, a
separate encoder and bridge are registered.

The change is based on the DRM AUX HPD bridge, rather than the
extcon approach. This requires the DT to correctly describe the
connections between the first bridge in bridge chain and DP
controller. And Once the first bridge is obtained, we can get the
last bridge corresponding to the USB-C connector, and then set the
DRM connector's fwnode to the corresponding one to enable HPD
notification.

====
Patch1 add default HPD device when register Displayport altmode.
Patch2 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch3 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch4 add DRM AUX bridge support for RK3399 USBDP PHY.
Patch5 drops CDN-DP's extcon dependency when Type-C is present.
Patch6 add multiple bridges to support PHY port selection. 
Patch7 add missing dp_out port for RK3399 CDN-DP.
Patch8 add Type-C DP support for RK3399 EVB IND board.

Changes in v5:
- Link to V4: https://lore.kernel.org/all/20250922012039.323-1-kernel@airkyi.com/
- Remove the calls related to `drm_aux_hpd_bridge_notify()`.
- Place the helper functions in the same compilation unit.
- Add more comments about parent device.
- Add DRM AUX bridge support for RK3399 USBDP PHY
- By parsing the HPD bridge chain, set the connector's of_node to the
of_node corresponding to the USB-C connector.
- Return EDID cache when other port is already enabled. 

Changes in v4:
- Link to V3: https://lore.kernel.org/all/20250729090032.97-1-kernel@airkyi.com/
- Add default HPD device for DisplayPort altmode.
- Introduce multiple bridges for CDN-DP.
- ...

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250718062619.99-1-kernel@airkyi.com/
- Add more descriptions to clarify the role of the PHY in switching.
- Fix wrong vdo value.
- Fix port node in usb-c-connector.

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250715112456.101-1-kernel@airkyi.com/
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.
- Fix compile error when CONFIG_TYPEC is not enabled.
- Notify DP HPD state by USB/DP PHY.
- Ignore duplicate HPD events.
- Add endpoint to link DP PHY and DP controller.
- Fix devicetree coding style.

Chaoyi Chen (8):
  usb: typec: Add default HPD device when register DisplayPort altmode
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
  phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
  phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
  drm/rockchip: cdn-dp: Support handle lane info without extcon
  drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
    selection
  arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

 .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 146 ++++++
 drivers/gpu/drm/rockchip/Kconfig              |   2 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 380 +++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  24 +-
 drivers/phy/rockchip/phy-rockchip-typec.c     | 417 +++++++++++++++++-
 drivers/usb/typec/class.c                     |  26 ++
 include/linux/usb/typec_altmode.h             |   2 +
 9 files changed, 931 insertions(+), 82 deletions(-)

-- 
2.49.0

