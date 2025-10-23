Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9FC018AC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 15:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C2C10E0EA;
	Thu, 23 Oct 2025 13:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hcs0H9U+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC0910E04F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 13:52:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D69304ADE8;
 Thu, 23 Oct 2025 13:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F27C4CEE7;
 Thu, 23 Oct 2025 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761227521;
 bh=TWwofATN6dvQVTmREPrumFtc6Yhov/qqrLEWPdQ7VWE=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=hcs0H9U+drZ+VNqvF8U2Kwq99Ui2p5nNjKuA91WsZov1i+kBVl15EzTLyENXbDfpA
 56XoQ1X/1q03SzYaSQiYpOwwZvjFOoZAzE6FSZnLcc6db2TSHgvBGK6QtRgt8H8EcE
 tuuGj5sgNBdB5BmEyS1B6Zqop51UlsuJ8CMLAeD7eJvVELWZ+iKHvvwbmVyOI7THOK
 K0Fzt4YWNJC/T/oD4fe8Z23CrrXGLdAfwIp0Nxou9fKSNavi4eY28G3iKbmzqVqBPR
 o1lrvAKsHFctSr6lXXhtW/RhGaNy4jIQ6mqQMe6y+LO9L2nuIZ4DXl1y8j7JvToFgj
 PeTB9MTrUNjHA==
Date: Thu, 23 Oct 2025 08:52:00 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Peter Robinson <pbrobinson@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Diederik de Haas <didi.debian@cknow.org>, David Airlie <airlied@gmail.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Johan Jonker <jbx6244@gmail.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 linux-arm-kernel@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>, 
 linux-rockchip@lists.infradead.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, 
 Frank Wang <frank.wang@rock-chips.com>, linux-phy@lists.infradead.org, 
 Vinod Koul <vkoul@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
 linux-usb@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Dragan Simic <dsimic@manjaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
Message-Id: <176122700874.2723312.9950829312401281316.robh@kernel.org>
Subject: Re: [PATCH v7 0/9] Add Type-C DP support for RK3399 EVB IND board
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


On Thu, 23 Oct 2025 11:30:00 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This series focuses on adding Type-C DP support for USBDP PHY and DP
> driver. The USBDP PHY and DP will perceive the changes in cable status
> based on the USB PD and Type-C state machines provided by TCPM. Before
> this, the USBDP PHY and DP controller of RK3399 sensed cable state
> changes through extcon, and devices such as the RK3399 Gru-Chromebook
> rely on them. This series should not break them.
> 
> ====
> 1. DisplayPort HPD status notify
> 
> Before v7, I implemented a variety of DP HPD status notify. However,
> they all had various problems and it was difficult to become a generic
> solution.
> 
> Under the guidance of Heikki and Dmitry, a decoupled notification
> method between the TypeC and DRM subsystems was introduced in v7.
> First, a notification is sent when TypeC registers a new altmode.
> Then, a generic DP AUX HPD bridge is implemented on the DRM side.
> 
> That makes it redundant for each Type-C controller driver to implement
> a similar DP AUX HPD bridge in embedded scenarios.
> 
> ====
> 2. Altmode switching and orientation switching for USBDP PHY
> 
> For USB Type-C interfaces, an external Type-C controller chip assists
> by detecting cable attachment, determining plug orientation, and
> reporting USB PD message. The USB/DP combo PHY supports software
> configurable pin mapping and DisplayPort lane assignment. Based on
> these message, the combo PHY can perform both altmode switching and
> orientation switching via software.
> 
> The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
> fusb302 chip as Type-C controller. The connection diagram is shown below:
> 
> fusb302 chip +---> USB2.0 PHY ----> DWC3 USB controller
>              |
>              +---> USB/DP PHY0 +--> CDN-DP controller
>                                |
>                                +--> DWC3 USB controller
> 
> ====
> 3. Multiple bridge model for RK3399 CDN-DP
> 
> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> the CDN-DP can be switched to output to one of the PHYs.
> 
> USB/DP PHY0 ---+
>                | <----> CDN-DP controller
> USB/DP PHY1 ---+
> 
> In previous versions, if both PHY ports were connected to DP,
> the CDN-DP driver would select the first PHY port for output.
> 
> On Dmitry's suggestion, we introduced a multi-bridge model to support
> flexible selection of the output PHY port. For each PHY port, a
> separate encoder and bridge are registered.
> 
> The change is based on the DRM AUX HPD bridge, rather than the
> extcon approach. This requires the DT to correctly describe the
> connections between the first bridge in bridge chain and DP
> controller. And Once the first bridge is obtained, we can get the
> last bridge corresponding to the USB-C connector, and then set the
> DRM connector's fwnode to the corresponding one to enable HPD
> notification.
> 
> ====
> Patch1 add notifier functions for Type-C core.
> Patch2 add generic USB Type-C DP HPD bridge.
> Patch3 add new Type-C mode switch for RK3399 USBDP phy binding.
> Patch4 add typec_mux and typec_switch for RK3399 USBDP PHY.
> Patch5 add DRM AUX bridge support for RK3399 USBDP PHY.
> Patch6 drops CDN-DP's extcon dependency when Type-C is present.
> Patch7 add multiple bridges to support PHY port selection.
> Patch8 add missing dp_out port for RK3399 CDN-DP.
> Patch9 add Type-C DP support for RK3399 EVB IND board.
> 
> Changes in v7:
> - Link to V6: https://lore.kernel.org/all/20251016022741.91-1-kernel@airkyi.com/
> - Add notifier functions for Type-C core.
> - Add generic USB Type-C DP HPD bridge.
> 
> Changes in v6:
> - Link to V5: https://lore.kernel.org/all/20251011033233.97-1-kernel@airkyi.com/
> - Fix depend in Kconfig.
> - Check DP svid in tcphy_typec_mux_set().
> - Remove mode setting in tcphy_orien_sw_set().
> - Rename some variable names.
> - Attach the DP bridge to the next bridge.
> 
> Changes in v5:
> - Link to V4: https://lore.kernel.org/all/20250922012039.323-1-kernel@airkyi.com/
> - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
> - Place the helper functions in the same compilation unit.
> - Add more comments about parent device.
> - Add DRM AUX bridge support for RK3399 USBDP PHY
> - By parsing the HPD bridge chain, set the connector's of_node to the
> of_node corresponding to the USB-C connector.
> - Return EDID cache when other port is already enabled.
> 
> Changes in v4:
> - Link to V3: https://lore.kernel.org/all/20250729090032.97-1-kernel@airkyi.com/
> - Add default HPD device for DisplayPort altmode.
> - Introduce multiple bridges for CDN-DP.
> - ...
> 
> Changes in v3:
> - Link to V2: https://lore.kernel.org/all/20250718062619.99-1-kernel@airkyi.com/
> - Add more descriptions to clarify the role of the PHY in switching.
> - Fix wrong vdo value.
> - Fix port node in usb-c-connector.
> 
> Changes in v2:
> - Link to V1: https://lore.kernel.org/all/20250715112456.101-1-kernel@airkyi.com/
> - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> - Fix compile error when CONFIG_TYPEC is not enabled.
> - Notify DP HPD state by USB/DP PHY.
> - Ignore duplicate HPD events.
> - Add endpoint to link DP PHY and DP controller.
> - Fix devicetree coding style.
> 
> Chaoyi Chen (9):
>   usb: typec: Add notifier functions
>   drm/bridge: Implement generic USB Type-C DP HPD bridge
>   dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
>   phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
>   phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
>   drm/rockchip: cdn-dp: Support handle lane info without extcon
>   drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
>     selection
>   arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
>   arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort
> 
>  .../phy/rockchip,rk3399-typec-phy.yaml        |   6 +
>  arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
>  .../boot/dts/rockchip/rk3399-evb-ind.dts      | 146 ++++++
>  drivers/gpu/drm/bridge/Kconfig                |  11 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  51 +++
>  drivers/gpu/drm/rockchip/cdn-dp-core.c        | 354 ++++++++++++---
>  drivers/gpu/drm/rockchip/cdn-dp-core.h        |  24 +-
>  drivers/phy/rockchip/Kconfig                  |   3 +
>  drivers/phy/rockchip/phy-rockchip-typec.c     | 420 +++++++++++++++++-
>  drivers/usb/typec/Makefile                    |   2 +-
>  drivers/usb/typec/class.c                     |   3 +
>  drivers/usb/typec/notify.c                    |  22 +
>  include/linux/usb/typec_notify.h              |  17 +
>  14 files changed, 987 insertions(+), 83 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
>  create mode 100644 drivers/usb/typec/notify.c
>  create mode 100644 include/linux/usb/typec_notify.h
> 
> --
> 2.49.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.18-rc1-18-g924aa1d9e0ae (best guess, 9/11 blobs matched)
 Base: tags/v6.18-rc1-18-g924aa1d9e0ae (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20251023033009.90-1-kernel@airkyi.com:

arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']





