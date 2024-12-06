Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E679E701B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 15:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8730010F10E;
	Fri,  6 Dec 2024 14:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="zGqZu5nm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7114310F11A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXAYhpdfsf+gOIdq60uXPUI1h1U4aSY+52/5Tzkwy3o=; b=zGqZu5nmmiMR40kS1ag20bkZPn
 34/WeQB+p3pPf5pLsBw3pnqEJbt/Oo/WuvhzsETmFIx3NcWETcipC+hKsTXGu93XASq00fG7IiRhY
 ugoku54YtHBQCHd2dIrEF8RZto8uUUd2BPnAXualbTHQyzVf/HDdnXKEVNswMpIhJlD2+8YJWA/ZR
 w2AR0CD0BSddg0M0kJN9aiTdyRi/PwU/fPifztlnuqZVfCvzMjPIi26kxT2H2TsWf1LAD9tDN28/1
 0Kl1t9kLx7MQzvLaV4zLiQkE/kJ9RIFCW6VuRaphGb3r2RZvay3zfzCXbuZXcCfwy8zIPWpCN5DDT
 U5xMwHLA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tJZQW-00011Y-Hy; Fri, 06 Dec 2024 15:35:28 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v1 00/10] Add eDP support for RK3588
Date: Fri, 06 Dec 2024 15:35:27 +0100
Message-ID: <5939852.zQ0Gbyo6oJ@diego>
In-Reply-To: <20241127075157.856029-1-damon.ding@rock-chips.com>
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Daemon,

Am Mittwoch, 27. November 2024, 08:51:47 CET schrieb Damon Ding:
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board.
> 
> Patch 1~3 are the RK3588 eDP support of Rockchip analogix_dp driver.
> Patch 4   is the eDP mode support of samsung hdptx phy driver.
> Patch 5~6 are the Rk3588 eDP support of Aanalogix DP driver. Add phy
>           interfaces is to configure the HDMI/eDP TX Combo PHY.
> Patch 7~8 are the renaming of hdptxphy node. It is not only used by
>           HDMI display but also for the eDP display.
> Patch 9   is the addition of RK3588 eDP0 node.
> Patch 10  is to enable the eDP0 display on RK3588S EVB1 board.

Could you maybe also bring over functionality for real bridge-handling?
That way we'd have support for things like the dp-connector bridge.

In the 6.1 vendor-tree I've found commits
94e598190128 ("drm/rockchip: analogix_dp: Add support for external bridge")
437e0a901b14 ("drm/bridge: analogix_dp: Support split mode for bridge chain")

needing a bit of cleanup of course, but that would get rid of the driver
not handling the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag too.

With a bit of streamlining, we could maybe even get rid of the panel-part
completely, similar to how the dw-dsi controllers do it [0]


Thanks
Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#n335
devm_drm_of_get_bridge() combines drm_of_find_panel_or_bridge()
with devm_drm_panel_bridge_add(), so indepent of it being either a
panel or other bridge, the driver below only needs to handle bridges.

> Damon Ding (10):
>   drm/rockchip: analogix_dp: Use formalized struct definition for grf
>     field
>   dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
>   drm/rockchip: analogix_dp: Add support for RK3588
>   phy: phy-rockchip-samsung-hdptx: Add support for eDP mode
>   drm/bridge: analogix_dp: add support for RK3588
>   drm/bridge: analogix_dp: Add support for phy configuration.
>   dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
>     HDMI TX Controller
>   arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
>   arm64: dts: rockchip: Add eDP0 node for RK3588
>   arch64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
> 
>  .../rockchip/rockchip,analogix-dp.yaml        |   1 +
>  .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  33 +-
>  .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
>  .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
>  .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
>  .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
>  .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
>  .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
>  .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
>  .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  84 ++
>  .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
>  .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
>  .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
>  .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
>  .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
>  .../drm/bridge/analogix/analogix_dp_core.c    |   8 +-
>  .../drm/bridge/analogix/analogix_dp_core.h    |   2 +
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  90 ++
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 112 ++-
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 936 +++++++++++++++++-
>  include/drm/bridge/analogix_dp.h              |   3 +-
>  26 files changed, 1206 insertions(+), 97 deletions(-)
> 
> 




