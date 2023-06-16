Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72820732BF2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 11:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB92310E58B;
	Fri, 16 Jun 2023 09:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206D310E58B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1686908245; x=1718444245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SyS7X+zCaZvSEhEwk9BWC/gopZ0qkwxTKeMY9FGhWt4=;
 b=ZTqmMxhDTDjtisdboY2XMYKmMX02dXIyIevRlxcEmlK7faP8AU9WtNvy
 /DqGw5qzeNUJ3Iqa10Mr62QdifBfX6o9+FZ3EbadFvSi0IIaRQdjJN+tZ
 QHuxMJvaOjFBALfRbeCEY4G5D9E3pcThREijDDs2p0pPh+7J7g1CZCOoK
 Wks4ibqpg2qheRd3MkKL2CX5Umv+X9Tc5j8TVw36Ma+jpCX6OU8dJCEmE
 InivA2+yTwrYuXmyenV0HGs0OVbojc/xVsMrTCEAfkdPUxDkfbAb7EvTi
 f7+ZnWJJqjEkKO02JjXY15uzHPWLmR6ZJIfy+zWmcDs68+OXX6LZLxBVZ w==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681164000"; d="scan'208";a="31462715"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 Jun 2023 11:37:23 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C211D280082;
 Fri, 16 Jun 2023 11:37:22 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 0/8] Initial support for Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
Date: Fri, 16 Jun 2023 11:37:24 +0200
Message-ID: <4674185.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <cover.1686729444.git.Sandor.yu@nxp.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: oliver.brown@nxp.com, Sandor Yu <Sandor.yu@nxp.com>, linux-imx@nxp.com,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

thanks for sending a new version of this driver.

Am Donnerstag, 15. Juni 2023, 03:38:10 CEST schrieb Sandor Yu:
> The patch set initial support for Cadence MHDP8501(HDMI/DP) DRM bridge
> drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for Freescale i.MX8MQ.
>=20
> The patch set compose of DRM bridge drivers and PHY drivers.

Using quick and dirty DT changes I was able to enable HDMI on imx8mq=20
(TQMa8MQ).

Best regards,
Alexander

> Both of them need the followed two patches to pass build.
>   drm: bridge: Cadence: convert mailbox functions to macro functions
>   phy: Add HDMI configuration options
>=20
> DRM bridges driver patches:
>   dt-bindings: display: bridge: Add Cadence MHDP8501 HDMI and DP
>   drm: bridge: Cadence: Add MHDP8501 DP driver
>   drm: bridge: Cadence: Add MHDP8501 HDMI driver
>=20
> PHY driver patches:
>   dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
>   phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
>   phy: freescale: Add HDMI PHY driver for i.MX8MQ
>=20
> v5->v6:
> HDMI/DP bridge driver
> - 8501 is the part number of Cadence MHDP on i.MX8MQ.
>   Use MHDP8501 to name hdmi/dp drivers and files.
> - Add compatible "fsl,imx8mq-mhdp8501-dp" for i.MX8MQ DP driver
> - Add compatible "fsl,imx8mq-mhdp8501-hdmi" for i.MX8MQ HDMI driver
> - Combine HDMI and DP dt-bindings into one file cdns,mhdp8501.yaml
> - Fix HDMI scrambling is not enable issue when driver working in 4Kp60
>   mode.
> - Add HDMI/DP PHY API mailbox protect.
>=20
> HDMI/DP PHY driver:
> - Rename DP and HDMI PHY files and move to folder phy/freescale/
> - Remove properties num_lanes and link_rate from DP PHY driver.
> - Combine HDMI and DP dt-bindings into one file fsl,imx8mq-dp-hdmi-phy.ya=
ml
> - Update compatible string to "fsl,imx8mq-dp-phy".
> - Update compatible string to "fsl,imx8mq-hdmi-phy".
>=20
> v4->v5:
> - Drop "clk" suffix in clock name.
> - Add output port property in the example of hdmi/dp.
>=20
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
>=20
> v2->v3:
> Address comments for dt-bindings files.
> - Correct dts-bindings file names
>   Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
>   Rename phy-cadence-hdptx-hdmi.yaml to cdns,mhdp-imx8mq-hdmi.yaml
> - Drop redundant words and descriptions.
> - Correct hdmi/dp node name.
>=20
> v2 is a completely different version compared to v1.
> Previous v1 can be available here [1].
>=20
> v1->v2:
> - Reuse Cadence mailbox access functions from mhdp8546 instead of
>   rockchip DP.
> - Mailbox access functions be convert to marco functions
>   that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
> - Plain bridge instead of component driver.
> - Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
> - Audio driver are removed from the patch set, it will be add in another
>   patch set later.
>=20
> [1]
> https://patchwork.kernel.org/project/linux-rockchip/cover/cover.159098288=
1.
> git.Sandor.yu@nxp.com/
>=20
> Sandor Yu (8):
>   drm: bridge: Cadence: convert mailbox functions to macro functions
>   dt-bindings: display: bridge: Add Cadence MHDP8501 HDMI and DP
>   drm: bridge: Cadence: Add MHDP8501 DP driver
>   phy: Add HDMI configuration options
>   drm: bridge: Cadence: Add MHDP8501 HDMI driver
>   dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
>   phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
>   phy: freescale: Add HDMI PHY driver for i.MX8MQ
>=20
>  .../display/bridge/cdns,mhdp8501.yaml         |  105 ++
>  .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |   53 +
>  drivers/gpu/drm/bridge/cadence/Kconfig        |   25 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |    3 +
>  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 1078 +++++++++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 1024 ++++++++++++++++
>  .../gpu/drm/bridge/cadence/cdns-mhdp8501.h    |  399 ++++++
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  195 +--
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |    1 -
>  drivers/phy/freescale/Kconfig                 |   18 +
>  drivers/phy/freescale/Makefile                |    2 +
>  drivers/phy/freescale/phy-fsl-imx8mq-dp.c     |  697 +++++++++++
>  drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   |  889 ++++++++++++++
>  include/drm/bridge/cdns-mhdp-mailbox.h        |  240 ++++
>  include/linux/phy/phy-hdmi.h                  |   38 +
>  include/linux/phy/phy.h                       |    7 +-
>  16 files changed, 4578 insertions(+), 196 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml create
> mode 100644
> Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml create
> mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c create mode
> 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c create mode
> 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501.h create mode 100644
> drivers/phy/freescale/phy-fsl-imx8mq-dp.c
>  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
>  create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
>  create mode 100644 include/linux/phy/phy-hdmi.h


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


