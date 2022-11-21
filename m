Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31638631B92
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 09:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAA510E16B;
	Mon, 21 Nov 2022 08:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E0410E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1669019781; x=1700555781;
 h=subject:from:to:cc:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cojv73ncYBlTMqJr0ZxMpVAT6qQR4qxJuKojHO4kyGg=;
 b=Exlgj+r+BXDuwctnlu9S/VF+ruM2BM7AvUPEvXnBD7usrSYU8GY4Saqc
 agERQz7w8chwPQIM10L8Qa2lvl3mwFlzaKWIdGVv5ba1kAPSHrfaIdbDK
 l2pC4fKsB0U5CDbFDqcxDb5lG610celxYs7ImZlQJJdjzGMdzuX+/gKPA
 xFZt+0yEpeCloY2rz581w+htA4pTL1NSoB3tI4MmVr/CLtHf8DZofXiWK
 9Z0NxQaqddiXsoLcQw1l9cL/hbd5N1Y9WI9mdcp4cYUgSemXNM4yFzeAA
 fXhdAtc7B24OycV1yV8n5BxohvdCgNS10OWIuIIpKkgKjMyvDhBAc6Hfl w==;
X-IronPort-AV: E=Sophos;i="5.96,180,1665439200"; d="scan'208";a="27473758"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 21 Nov 2022 09:36:19 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 21 Nov 2022 09:36:19 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 21 Nov 2022 09:36:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1669019779; x=1700555779;
 h=from:to:cc:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:subject;
 bh=Cojv73ncYBlTMqJr0ZxMpVAT6qQR4qxJuKojHO4kyGg=;
 b=JAK/K/vsqDV3DaE+TvrLpDD4sYQ1RNgeYU/pWK1K0/MKvMtjHobrVnWv
 YhCuwwD4Rer2Rm9nLlRsN/dMVUFo3t+pbNJ8ic4JSfSnIcT4OQo0wWo7Y
 d9nPsp5fJa8jzrB/w7Y76IUeZ/3uyzQDdQbhaJ11QgWGSyEzwjASaAO3C
 15Jq0/oJsD/C8YgTk72V9chmfe/He8kZA2QY+netMkQQw6ENDXapWXZ2g
 tRs1r87jbQb51Is3+bfRC+Mok3pQzOmtRLaeDepQlGwFnAYHI5xn2P4v8
 x//277kZ6aotT6G9tlt9PcuYMuTgqPOICaATUV/jqgEDR/IL7vLDj1IVf Q==;
X-IronPort-AV: E=Sophos;i="5.96,180,1665439200"; d="scan'208";a="27473757"
Subject: Re: [PATCH v4 00/10] Initial support for Cadence MHDP(HDMI/DP) for
 i.MX8MQ
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Nov 2022 09:36:18 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 93D74280056;
 Mon, 21 Nov 2022 09:36:17 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sandor Yu <Sandor.yu@nxp.com>
Date: Mon, 21 Nov 2022 09:36:16 +0100
Message-ID: <4760535.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <cover.1669013346.git.Sandor.yu@nxp.com>
References: <cover.1669013346.git.Sandor.yu@nxp.com>
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, jernej.skrabec@gmail.com, kishon@ti.com,
 linux-imx@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, oliver.brown@nxp.com,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, vkoul@kernel.org, Sandor.yu@nxp.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sandor,

thanks for the updated series.

Am Montag, 21. November 2022, 08:23:50 CET schrieb Sandor Yu:
> The patch set initial support for Cadence MHDP(HDMI/DP) DRM bridge
> drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for iMX8MQ.
> 
> The patch set compose of DRM bridge drivers and PHY drivers.
> Both of them need the followed two patches to pass build.
>   drm: bridge: cadence: convert mailbox functions to macro functions
>   phy: Add HDMI configuration options
> 
> DRM bridges driver patches:
>   dts-bingings: display: bridge: Add MHDP HDMI bindings for i.MX8MQ
>   drm: bridge: cadence: Add MHDP DP driver for i.MX8MQ
>   dts-bindings: display: bridge: Add MHDP DP bindings for i.MX8MQ
>   drm: bridge: cadence: Add MHDP HDMI driver for i.MX8MQ
> 
> PHY driver patches:
>   dts-bindings: phy: Add Cadence HDP-TX DP PHY bindings
>   phy: cadence: Add driver for HDP-TX DisplyPort PHY
>   dts-bindings: phy: Add Cadence HDP-TX HDMI PHY bindings
>   phy: cadence: Add driver for HDP-TX HDMI PHY
> 
> v3->v4:
> dt-bindings:
> - Correct dt-bindings coding style and address review comments.
> - Add apb_clk description.
> - Add output port for HDMI/DP connector
> PHY:
> - Alphabetically sorted in Kconfig and Makefile for DP and HDMI PHY
> - Remove unused registers define from HDMI and DP PHY drivers.
> - More description in phy_hdmi.h.
> - Add apb_clk to HDMI and DP phy driver.
> HDMI/DP:
> - Use get_unaligned_le32() to replace hardcode type conversion
>   in HDMI AVI infoframe data fill function.
> - Add mailbox mutex lock in HDMI/DP driver for phy functions
>   to reslove race conditions between HDMI/DP and PHY drivers.
> - Add apb_clk to both HDMI and DP driver.
> - Rename some function names and add prefix with "cdns_hdmi/cdns_dp".
> - Remove bpc 12 and 16 optional that not supported.

With the apb_clk enabled now, I can use both HDMI and PHY driver as modules 
now. Thanks!

Best regards,
Alexander

> v2->v3:
> Address comments for dt-bindings files.
> - Correct dts-bindings file names
>   Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
>   Rename phy-cadence-hdptx-hdmi.yaml to cdns,mhdp-imx8mq-hdmi.yaml
> - Drop redundant words and descriptions.
> - Correct hdmi/dp node name.
> 
> v2 is a completely different version compared to v1.
> Previous v1 can be available here [1].
> 
> v1->v2:
> - Reuse Cadence mailbox access functions from mhdp8546 instead of
>   rockchip DP.
> - Mailbox access functions be convert to marco functions
>   that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
> - Plain bridge instead of component driver.
> - Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
> - Audio driver are removed from the patch set, it will be add in another
>   patch set later.
> 
> [1]
> https://patchwork.kernel.org/project/linux-rockchip/cover/cover.1590982881.
> git.Sandor.yu@nxp.com/
> 
> Sandor Yu (10):
>   drm: bridge: cadence: convert mailbox functions to macro functions
>   dt-bindings: display: bridge: Add MHDP DP for i.MX8MQ
>   drm: bridge: cadence: Add MHDP DP driver for i.MX8MQ
>   phy: Add HDMI configuration options
>   dt-bindings: display: bridge: Add MHDP HDMI for i.MX8MQ
>   drm: bridge: cadence: Add MHDP HDMI driver for i.MX8MQ
>   dt-bindings: phy: Add Cadence HDP-TX DP PHY
>   phy: cadence: Add driver for HDP-TX DisplyPort PHY
>   dt-bindings: phy: Add Cadence HDP-TX HDMI PHY
>   phy: cadence: Add driver for HDP-TX HDMI PHY
> 
>  .../display/bridge/cdns,mhdp-imx8mq-dp.yaml   |   93 ++
>  .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml |   93 ++
>  .../bindings/phy/cdns,hdptx-dp-phy.yaml       |   68 ++
>  .../bindings/phy/cdns,hdptx-hdmi-phy.yaml     |   52 +
>  drivers/gpu/drm/bridge/cadence/Kconfig        |   25 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |    3 +
>  drivers/gpu/drm/bridge/cadence/cdns-dp-core.c | 1071 +++++++++++++++++
>  .../gpu/drm/bridge/cadence/cdns-hdmi-core.c   | 1018 ++++++++++++++++
>  .../gpu/drm/bridge/cadence/cdns-mhdp-common.h |  400 ++++++
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  197 +--
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |    1 -
>  drivers/phy/cadence/Kconfig                   |   16 +
>  drivers/phy/cadence/Makefile                  |    2 +
>  drivers/phy/cadence/phy-cadence-hdptx-dp.c    |  737 ++++++++++++
>  drivers/phy/cadence/phy-cadence-hdptx-hdmi.c  |  891 ++++++++++++++
>  include/drm/bridge/cdns-mhdp-mailbox.h        |  240 ++++
>  include/linux/phy/phy-hdmi.h                  |   38 +
>  include/linux/phy/phy.h                       |    7 +-
>  18 files changed, 4755 insertions(+), 197 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
> create mode 100644
> Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> create mode 100644
> Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml create mode
> 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
> create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dp-core.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
>  create mode 100644 drivers/phy/cadence/phy-cadence-hdptx-dp.c
>  create mode 100644 drivers/phy/cadence/phy-cadence-hdptx-hdmi.c
>  create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
>  create mode 100644 include/linux/phy/phy-hdmi.h




