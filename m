Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC860CA2849
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B03410E122;
	Thu,  4 Dec 2025 06:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="r1+ljvgF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF38F10E122
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764829882;
 bh=it53BCZJStH8fYbwTXji7TtB2zvtLMGxhs6oJ8nM3RY=;
 h=From:To:Subject:Date:Message-Id;
 b=r1+ljvgFGXF4mJ5R2oGN2fXS6zixrlZHGz1aJhQK05J2gkTL9gCeS7vQV2bvuBpOc
 Wcl+ahe/VqhzsJ9tjz/VsU1FsugEuM6Mt3Ow0GbO7d7Salpi8cIgyli1P7YyNcqhwx
 B4o6BLZzUFmwwIsSR5ODRt8b6Kg2bLwsB1wwAW5g=
X-QQ-mid: esmtpsz21t1764829879tf3965c9c
X-QQ-Originating-IP: pMCOv/rwYUB+VI7ynKqogDzdQD4aiuIsNEbIPfnwejM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 04 Dec 2025 14:31:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12444338636289438817
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [RESEND PATCH v11 00/11] Add Type-C DP support for RK3399 EVB IND
 board
Date: Thu,  4 Dec 2025 14:30:58 +0800
Message-Id: <20251204063109.104-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NrJHW3hvBPkCd8eNwlVPnw44lUybrLP5RS1c5BOGQa698DJXWpcrXNBn
 rBisqPBnQcGQve76lrAZVLV2bEyoz9c3fiUgJRQPW2V6TTa1xa2ca6jHh7gUH8mmg77uEgB
 ZNQchQWp6jwJI2PZKmB0sQXyDDkOEzPj7msa6tREpiO5Ts/pV+tY7AXfBXYUoJeVMfMTrlv
 cKBI2EaBrc5p9HiqdX+DTEEh6Z5YY1arkessLF4aNzd/Wp6jxleGeMzR3US/XbDPHrD/qrj
 KpXEZ/0TEa3sTT8GI8LlqoSh5rnMuEIs0GfcRKZKOE1oHDwtUmFNvkKh8xCNWoKmPy+T/2K
 jpP3pXY5/PC97m0kOEnFMJ//dvb09MP65YqueGyCj3OMJD5Ffh8/qHe7btAAlyyvZ+2TziN
 NxEeKZGwaLA5qgE9Omseo9/UouU1EoEB507szZys/drhEAbZu18uDqaYpE8FUFvGynUjkn2
 cSy9UkaziZzF7eaGuUFOdQkrRXZnd/EXW0GhXR6HN6vz5B/DCnBhjieDO7yFTIdHllFo/ky
 9+CkuWXKoHTvi8QY3yQ2ns8kJmJn8mj9yQ/Xx0YF42i/muaU5PbAavsCxA+FtG0b2GeGiEI
 v4qcc4DjhmQPyppNvyRO4oyBfCSg5OLKsWw9S0/w0kPVKfN5Vo8jV+B4sy3v9yK+xAs7ipl
 g0IobT1Rk1KBjyTFLC+cogd2ZhLzG+e/Kzbc2nh8v9sFtFcx9rAT+ucHxr3sQQ3Q00+YaWE
 z/pNSTAhveJIK0a/HYBdLcSbKo1dXHaJgfHdnC0Dd2DzmaP3caBoNSeHKw9zvTEl3b622yr
 HN/lIqOQCpOhO7l3l+ed/uu+jNjXXa6PCCh8H8vJawtCupRb6xu84U4vjx15N1MIlkUDeec
 W/kpshlTXvRpq8fEi9AOZoZyQDkskQZBEhB34yrpe62B6qo5T6OqDgBo4dWWF8w1I3yRPXU
 vyWs8xOM4OldR4wMDSZIHT29ULyyHaF4ubohlE2XbBL5uhKdSPZWFCoEOL5iMiudjIL8=
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

Before v7, I implemented a variety of DP HPD status notify. However,
they all had various problems and it was difficult to become a generic
solution.

Under the guidance of Heikki and Dmitry, a decoupled notification
method between the TypeC and DRM subsystems was introduced in v7.
First, a notification is sent when TypeC registers a new altmode.
Then, a generic DP AUX HPD bridge is implemented on the DRM side.

During v7-v10, we added a new notifier in typec to notify the altmode
device register event. With the help of Greg and Heikki, we implemented
the reuse of notifiers for the type bus itself in patch1 of v11.

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
Patch1 set the bus also for the port and plug altmodes.
Patch2 export typec bus and typec altmode device types.
Patch3 add generic USB Type-C DP HPD bridge.
Patch4 add new API drm_aux_bridge_register_from_node().
Patch5 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch6 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch7 add DRM AUX bridge support for RK3399 USBDP PHY.
Patch8 drops CDN-DP's extcon dependency when Type-C is present.
Patch9 add multiple bridges to support PHY port selection.
Patch10 add missing dp_out port for RK3399 CDN-DP.
Patch11 add Type-C DP support for RK3399 EVB IND board.

Changes in v11:
- Link to V10: https://lore.kernel.org/all/20251120022343.250-1-kernel@airkyi.com/
- Switch to using typec bus notifiers.

Changes in v10:
- Link to V9: https://lore.kernel.org/all/20251111105040.94-1-kernel@airkyi.com/
- Notify TYPEC_ALTMODE_UNREGISTERED when altmode removed. 
- Add drm_aux_bridge_register_from_node().
- Fix refcount usage of drm_bridge.

Changes in v9:
- Link to V8: https://lore.kernel.org/all/20251029071435.88-1-kernel@airkyi.com/
- Remove the exposed DRM_AUX_HPD_BRIDGE option, and select
DRM_AUX_HPD_TYPEC_BRIDGE when it is available.
- Add usb role switch for Type-C.
- Remove USB2 PHY in Type-C connection.
- ...

Changes in v8:
- Link to V7: https://lore.kernel.org/all/20251023033009.90-1-kernel@airkyi.com/
- Export all typec device types for identification.
- Merge generic DP HPD bridge into one module.
- Fix coding style.

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

Chaoyi Chen (10):
  usb: typec: Export typec bus and typec altmode device type
  drm/bridge: Implement generic USB Type-C DP HPD bridge
  drm/bridge: aux: Add drm_aux_bridge_register_from_node()
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
  phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
  phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
  drm/rockchip: cdn-dp: Support handle lane info without extcon
  drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
    selection
  arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

Heikki Krogerus (1):
  usb: typec: Set the bus also for the port and plug altmodes

 .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 147 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c           |  24 +-
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  51 +++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 350 +++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
 drivers/phy/rockchip/Kconfig                  |   3 +
 drivers/phy/rockchip/phy-rockchip-typec.c     | 373 +++++++++++++++++-
 drivers/usb/typec/bus.c                       |  25 +-
 drivers/usb/typec/bus.h                       |   6 -
 drivers/usb/typec/class.c                     |  36 +-
 include/drm/bridge/aux-bridge.h               |   6 +
 include/linux/usb/typec.h                     |   3 +
 include/linux/usb/typec_altmode.h             |   8 +
 18 files changed, 976 insertions(+), 102 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

-- 
2.51.1

