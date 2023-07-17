Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01121755F45
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E4D10E0B9;
	Mon, 17 Jul 2023 09:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECD210E0B9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1689586334; x=1721122334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LFS6LLLj+IF5o3ypMHoQlPtEJ6gln3IM45y+5jIYUmM=;
 b=fAWJmwkv4h1ioJnOafi8s4omw+wTc/0C5frqBVGUsD9BkDvZeaooMRW7
 D65z1Vp/nBNdcp/psCh9RyopG06cAte1jpVzS9T2HjvOtdqKA3FHTGpx7
 F6ivrnIo/6VnUkg7hRqPD/W3PidlRtjWRrfGpwCAxW4iK1bvONKeKmXWq
 dLJONPr8HbNm1I+SYgIav2spDGD0krAew8MagPi83yypgQcJdK8d5VOvA
 MZNdLwh1VWS5ZORwkWZP95PZcFspWJVSa17+z0HO129JZjKl7bbud0GcR
 d1flBgI5KU2EwgXEbTHW45xE6gtDwPmIALSIaOuWtZZcsiBwU2FIiPRU0 w==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684792800"; d="scan'208";a="31959527"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Jul 2023 11:32:12 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5EA1A280078;
 Mon, 17 Jul 2023 11:32:12 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v7 0/7] Initial support Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
Date: Mon, 17 Jul 2023 11:32:12 +0200
Message-ID: <2690465.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <cover.1689580812.git.Sandor.yu@nxp.com>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, sam@ravnborg.org,
 linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

Am Montag, 17. Juli 2023, 10:03:46 CEST schrieb Sandor Yu:
> The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for Freescale i.MX8MQ.
>=20
> The patch set compose of DRM bridge drivers and PHY drivers.
>=20
> Both of them need the followed two patches to pass build.
>   drm: bridge: Cadence: convert mailbox functions to macro functions
>   phy: Add HDMI configuration options
>=20
> DRM bridges driver patches:
>   dt-bindings: display: bridge: Add Cadence MHDP850
>   drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
>=20
> PHY driver patches:
>   dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
>   phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
>   phy: freescale: Add HDMI PHY driver for i.MX8MQ
>=20
> v6->v7:
> MHDP8501 HDMI/DP:
> - Combine HDMI and DP driver into one mhdp8501 driver.
>   Use the connector type to load the corresponding functions.
> - Remove connector init functions.
> - Add <linux/hdmi.h> in phy_hdmi.h to reuse =E2=80=98enum hdmi_colorspace=
=E2=80=99.

Thanks for the update. This still works as before on my TQMa8Mx/MBa8Mx=20
platform using HDMI output. I only had to address the compatible for the=20
combined driver.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> HDMI/DP PHY:
> - Lowercase hex values
> - Fix parameters indent issue on some functions
> - Replace =E2=80=98udelay=E2=80=99 with =E2=80=98usleep_range=E2=80=99
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
> Sandor Yu (7):
>   drm: bridge: Cadence: convert mailbox functions to macro functions
>   phy: Add HDMI configuration options
>   dt-bindings: display: bridge: Add Cadence MHDP850
>   drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
>   dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
>   phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
>   phy: freescale: Add HDMI PHY driver for i.MX8MQ
>=20
>  .../display/bridge/cdns,mhdp8501.yaml         | 105 ++
>  .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |  53 +
>  drivers/gpu/drm/bridge/cadence/Kconfig        |  15 +
>  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
>  .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 313 ++++++
>  .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 410 ++++++++
>  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 780 +++++++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 674 +++++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 195 +---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   1 -
>  drivers/phy/freescale/Kconfig                 |  18 +
>  drivers/phy/freescale/Makefile                |   2 +
>  drivers/phy/freescale/phy-fsl-imx8mq-dp.c     | 698 ++++++++++++++
>  drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   | 907 ++++++++++++++++++
>  include/drm/bridge/cdns-mhdp-mailbox.h        | 240 +++++
>  include/linux/phy/phy-hdmi.h                  |  24 +
>  include/linux/phy/phy.h                       |   7 +-
>  17 files changed, 4248 insertions(+), 196 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml create
> mode 100644
> Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml create
> mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c create mo=
de
> 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h create mode
> 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c create mode 1006=
44
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c create mode 100644
> drivers/phy/freescale/phy-fsl-imx8mq-dp.c
>  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
>  create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
>  create mode 100644 include/linux/phy/phy-hdmi.h


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


