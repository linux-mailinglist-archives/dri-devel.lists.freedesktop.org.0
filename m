Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70D8BFEFD5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 05:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7254010E02A;
	Thu, 23 Oct 2025 03:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="N4TYT6P6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A48A10E02A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 03:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1761190221;
 bh=Dtbx3rarF8kn4YpxAC+Adtk+rXiU66ifgaq+doAFZE4=;
 h=From:To:Subject:Date:Message-Id;
 b=N4TYT6P63Fn4nXj18V7fIIarwP8elNvCqhAvKaMDF+l5jQ/vot8Pv2EN6UsChWM3z
 uG9lVi9aZQJImHsxZN/cIC0o16GeSpShiUheEcbiQz0HzIFWg7u8FEI/JvqMdRuTvN
 yXL0oZUac5apDgQ7WEt5DBdXW+qPZ/5ynuiZOnEk=
X-QQ-mid: esmtpsz16t1761190219t69ad2cef
X-QQ-Originating-IP: o1+oH0WirnlwNNXKtoiqaKBE7L2lbT1X+eJ6n8Rf5ME=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Oct 2025 11:30:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11365234591125768724
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/9] Add Type-C DP support for RK3399 EVB IND board
Date: Thu, 23 Oct 2025 11:30:00 +0800
Message-Id: <20251023033009.90-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MMKcwIwa79XOAwiWHb/ZtDJyZTY3DvJHMSkX5tY++55NIyw5LItVD1wG
 BLanQ7rDPIkX28Y/CtKig5ZA29YFSlLX+ZRHnMrRl44dEkI0aHCxt35OQiRq2CLO3wCykKm
 n5wVrFhfmo39JushRPJP9xZPPuJgt1+qMoMR8UyhfpEhUnHJEzDvdDIufq67godRmHTKkiQ
 ibnvjOddEoV6+hTQ1t5fIeobaC1sZi6c9i2EsrYBkeAftKr6ecxiNdyH5kn+zBDoC6R2cej
 XXKwjF4wGt/OFzUz3Fkj5O1oBirQm3R8Y/2y2bHbWvPsd/M9aapHBxQd5Lsexu+hByhQPe7
 Y4qSjHRW/dAhxqfgpFSlo/kDSeWf0t4/jpz8pc65yae6jFTRBs8cxWa9dblFU5QjHntFX1l
 s+eICAoEAacMU5VfDIsFK7VkXlx3yBPt4VQrqcPBFspbw0K6FViduQIWNEIY0r1JJhM60jv
 Uv/8ikMI7usLtG1OhuP30FrKswmxqI9U6DTAmQKVHNmuBshvCxvHKJOmF5Nv2LzNJI1gXO6
 vLIyRRVG3XivJq6tqKDGVaVySPx4HB/bfW9rPjcbcEQoyUfmyEOsDwRg+pM4CSJlhuRgeUC
 bV2Z2pgI8UB1FDlaVEUVN9lBAXppfe8XSj2tEDGA/outu+gt5/S5+U+gVpDIE5RT1JB3WHa
 gYc6XzVuMpm6iUlK0mS0Fx4pvBi+3OYtEz3IgooxSWbiemWfYPKnHE9dkJ2x6HRS0uv1iua
 5qKB1YWz0V/RBy5EIXUdeG39zRGFIrBld2C35wRPZEO5iTHnVM71qouGHiKsFftbbEcvohp
 e94eTFBEDDK1YDosnruRqJ1b4S//XXzN43YlV6UoHG3UYqH7uHz89yLJK86NGfXqRLxP17N
 lV9iGF+ZxQHTD/32v5ATsCsaiAPQIfnCLDmToLIEBoPxcgv0v9BJgni/0yfr7j2qav3cuD6
 u98mOqJaZFd49yvjK5nnsbwxg/1lVKdd8r8wx5eBjPyGfUv2eM/YwYM5rPfbsXFNGLROjLd
 DS+kAQH7usnsmIghh0
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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

Before v7, I implemented a variety of DP HPD status notify. However,
they all had various problems and it was difficult to become a generic
solution.

Under the guidance of Heikki and Dmitry, a decoupled notification
method between the TypeC and DRM subsystems was introduced in v7.
First, a notification is sent when TypeC registers a new altmode.
Then, a generic DP AUX HPD bridge is implemented on the DRM side.

That makes it redundant for each Type-C controller driver to implement
a similar DP AUX HPD bridge in embedded scenarios.

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
Patch1 add notifier functions for Type-C core.
Patch2 add generic USB Type-C DP HPD bridge.
Patch3 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch4 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch5 add DRM AUX bridge support for RK3399 USBDP PHY.
Patch6 drops CDN-DP's extcon dependency when Type-C is present.
Patch7 add multiple bridges to support PHY port selection.
Patch8 add missing dp_out port for RK3399 CDN-DP.
Patch9 add Type-C DP support for RK3399 EVB IND board.

Changes in v7:
- Link to V6: https://lore.kernel.org/all/20251016022741.91-1-kernel@airkyi.com/
- Add notifier functions for Type-C core.
- Add generic USB Type-C DP HPD bridge.

Changes in v6:
- Link to V5: https://lore.kernel.org/all/20251011033233.97-1-kernel@airkyi.com/
- Fix depend in Kconfig.
- Check DP svid in tcphy_typec_mux_set().
- Remove mode setting in tcphy_orien_sw_set().
- Rename some variable names.
- Attach the DP bridge to the next bridge.

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

Chaoyi Chen (9):
  usb: typec: Add notifier functions
  drm/bridge: Implement generic USB Type-C DP HPD bridge
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
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  51 +++
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 354 ++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  24 +-
 drivers/phy/rockchip/Kconfig                  |   3 +
 drivers/phy/rockchip/phy-rockchip-typec.c     | 420 +++++++++++++++++-
 drivers/usb/typec/Makefile                    |   2 +-
 drivers/usb/typec/class.c                     |   3 +
 drivers/usb/typec/notify.c                    |  22 +
 include/linux/usb/typec_notify.h              |  17 +
 14 files changed, 987 insertions(+), 83 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
 create mode 100644 drivers/usb/typec/notify.c
 create mode 100644 include/linux/usb/typec_notify.h

--
2.49.0

