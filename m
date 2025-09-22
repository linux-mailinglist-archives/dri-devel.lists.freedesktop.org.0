Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C100B8EB13
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 03:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542E110E36F;
	Mon, 22 Sep 2025 01:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="h5DoXAle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Mon, 22 Sep 2025 01:30:21 UTC
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6479910E36F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 01:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1758504619;
 bh=nXCBtUA+m9scr2xmpRaIuBuOlGHEVWl3gOWkOzJl1I0=;
 h=From:To:Subject:Date:Message-Id;
 b=h5DoXAleLXBQ4uyjH9g+5r1NorQ5SNwah398u2m75y9wxu1zXhqeljylZQ2OpQfbD
 sVVkiUJBFYeAZd5juVLpjn5G91r5ZB8oSeRSThvnG+ygAydF2vaG6bvqVPUarA/To7
 hnPrsvTDIYwL9ekkrBnR8PUXjYwZivEwg+1fLBrs=
X-QQ-mid: zesmtpgz1t1758504048tb13996bb
X-QQ-Originating-IP: zyZxvz1kW6DoY+Ykz8VGYNjxDxOh/OBcK7J8ECz/sP0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 22 Sep 2025 09:20:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2099483455769991136
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
Subject: [PATCH v4 0/7] Add Type-C DP support for RK3399 EVB IND board
Date: Mon, 22 Sep 2025 09:20:32 +0800
Message-Id: <20250922012039.323-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NbLMjDNEDlGte7MF1grJAi5GK4VZ2IHX8I8qJoAC8obTVnX4VR9aL429
 SwhG0Bw3Q8ldzJ945qc3Pjy7SOjO/EncrxR7pqmeBJhWCU6QYQmtAicANT8mEEEvkYslGGD
 gF1HbCsAKvo8ua17BBaKKiPM92D7uBkY5t7mXavFLIXRzqJRkmkl49LaUaSDeLzqF4wCcwd
 hSvcz0c1qVgFP4fl3qmq1IiNmlk0V8SxSQkAr0l3ftmQiMDLodNV6pb4MWNzg8/3cIymW0E
 eWIHNnJ5KwmN/h7oafEKjhHUVbssbK+Q8NQLvdUFKCD/Qp2DULPxk44rgGgm7pPEnXRSo0m
 nBzfN631zwjPkyxogDkrO4dbx6W/9tRAnuPoBvu/9eGrNg6UQ9oeeZNpn89bEBLT4OYip1B
 burjGdwkWBkghe4BAqCQ+j2SZ+9dhF4iYv6ywkDlHKWRjJsGxhI5vo/aHo78LRhS5B4B4Ty
 i/GCV5V3qeAArXsi1dE3hU5/5fAjqJf2Fncs+TBx7BP+TzJaRf1j5eXopz2cyjKwruNiLqu
 xRlLx5QMIGTel1IYo9h0D2a72tiLAyzgSy2ayrzdgIzsPOT4WmhRBz4i/N9Qr7ZfHNRDl2Z
 bBBdv0BjbamAYV6OMvFfpYmI0N7OmjeD6/PtaBThqMLi2D2N9Ig8jvlEWFotEVNX9148hw2
 XwiepIMNb5U7gBsPNbVfJLEBzbHIiLYDOiRMxJrcKx+VSOdMQuz1xXeCPGcGLwG8t2d6Fje
 SpfsheFxFa7N/52llDoQG7kVhGThds5GjxtPOB9mpQLCzxGeH8LaPLsBSDA2tca0V7NhNoD
 Bt+9lTBz5/489tr/Hr9rV09+DojFcfckBGQ/E2B3aKuyhh1PpzZzwUWkIBGNDuy5XN9FVTS
 55STH/U4ML+TGoLW1ptjjA2JXZTVtc7wiJPmiFTK49QoWV4iB8+4XZ8W3jFtsejVHdPCIPZ
 lVmlBTWhvDj+9EsOozljaVNe6oS3JyfkjkCSE1dON8HERQp5DITrODWeZpgwcIP++gBg=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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

I'm not certain if the current implementation is appropriate.
Please let me know if there's a better way.
 
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
connections between the PHY, USB connector, and DP controller.
And cdn_dp_parse_hpd_bridge_dt() will parses it and determines
whether to register one or two bridges.

====
Patch1 add default HPD device when register Displayport altmode.
Patch2 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch3 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch4 drops CDN-DP's extcon dependency when Type-C is present.
Patch5 add multiple bridges to support PHY port selection. 
Patch6 add missing dp_out port for RK3399 CDN-DP.
Patch7 add Type-C DP support for RK3399 EVB IND board.

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

Chaoyi Chen (7):
  usb: typec: Add default HPD device when register DisplayPort altmode
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
  phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
  drm/rockchip: cdn-dp: Support handle lane info without extcon
  drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
    selection
  arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

 .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 146 ++++++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 423 +++++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  23 +-
 drivers/phy/rockchip/phy-rockchip-typec.c     | 365 ++++++++++++++-
 drivers/usb/typec/altmodes/displayport.c      |  27 ++
 drivers/usb/typec/altmodes/displayport.h      |   2 +
 drivers/usb/typec/class.c                     |   8 +
 include/linux/usb/typec_altmode.h             |   2 +
 11 files changed, 932 insertions(+), 81 deletions(-)

-- 
2.49.0

