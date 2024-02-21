Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F085DE7F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 15:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79C10E757;
	Wed, 21 Feb 2024 14:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="pYY2Qujq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAE510E757
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 14:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1708525141; x=1740061141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4tGYCuZ8S9Z/8bIyUQU7cinajEjRFCnLFwqKv4o4HsY=;
 b=pYY2QujqnPZvSIvjaMm2slU+9jzP1PBCvjY1mzqiY6/6Zq2zy8zC/to8
 bX4tgWjrrynII/WzwByomiEG6mmUQ+ofk9DF6gHz9OZoP7WIvFy0fozV+
 EIlVVWVnArpChnxqjG0AqjbljF3fdtohzQ9W2bPm5/EM0ZKd32MJxGRmE
 yB1Zq+nbGTAxtMCTWCfmtZ+CQg+NysIseM6r4wRmpcK1+IIkdk0LH/B7j
 xXdA1Q4LzrrktxdzlZMFvsFQZYinPIVDUgSWqHK/yuSt3JIDbY4sl3uhP
 3YXqeaEj3ieC1hVg5kBuYL8lgRaZfnxGIqoiUdZGqRap25BA8by6QRGBY A==;
X-IronPort-AV: E=Sophos;i="6.06,175,1705359600"; d="scan'208";a="35525266"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Feb 2024 15:18:58 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 603C7280075;
 Wed, 21 Feb 2024 15:18:58 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <li
 nux-phy@lists.infradead.org>, Sandor Yu <sandor.yu@nxp.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v14 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and
 HDMI PHY
Date: Wed, 21 Feb 2024 15:18:58 +0100
Message-ID: <12385213.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB9448F3065AE9F838C4553CB1F4572@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1708395604.git.Sandor.yu@nxp.com>
 <10421561.nUPlyArG6x@steina-w>
 <PAXPR04MB9448F3065AE9F838C4553CB1F4572@PAXPR04MB9448.eurprd04.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Mittwoch, 21. Februar 2024, 08:46:46 CET schrieb Sandor Yu:
> Hi Alexander,
>=20
> Thanks for your comments,
>=20
> >
> >
> > Hi,
> >
> > thanks for the update.
> >
> > Am Dienstag, 20. Februar 2024, 04:23:53 CET schrieb Sandor Yu:
> > > Add bindings for Freescale iMX8MQ DP and HDMI PHY.
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > > v9->v14:
> > >  *No change.
> > >
> > >  .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 53
> > > +++++++++++++++++++
> > >  1 file changed, 53 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
> > > b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
> > > new file mode 100644
> > > index 0000000000000..917f113503dca
> > > --- /dev/null
> > > +++
> > b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yam
> > > +++ l
> > > @@ -0,0 +1,53 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +http://devi/
> > >
> > +cetree.org%2Fschemas%2Fphy%2Ffsl%2Cimx8mq-dp-hdmi-phy.yaml%23&da
> > ta=3D05
> > >
> > +%7C02%7CSandor.yu%40nxp.com%7Ce79b4d15c204494963c508dc31fbab5d
> > %7C686e
> > >
> > +a1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638440204190687801%7C
> > Unknown%7
> > >
> > +CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw
> > iLCJX
> > >
> > +VCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DrKWiYc1wbOvKMO%2BWnvT6agxo
> > 9V%2B1ndZVTxh
> > > +gLT0g7h8%3D&reserved=3D0
> > > +$schema:
> > > +http://devi/
> > >
> > +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C02%7CSandor.y
> > u%40n
> > >
> > +xp.com%7Ce79b4d15c204494963c508dc31fbab5d%7C686ea1d3bc2b4c6fa9
> > 2cd99c5
> > >
> > +c301635%7C0%7C0%7C638440204190709341%7CUnknown%7CTWFpbGZsb
> > 3d8eyJWIjoi
> > >
> > +MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0
> > %7C%7C%
> > >
> > +7C&sdata=3D%2FuCSz0aVVsRLorOqrorbZIyT7iU5BavPKCbA9qL9qDI%3D&reserv
> > ed=3D0
> > > +
> > > +title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
> > > +
> > > +maintainers:
> > > +  - Sandor Yu <sandor.yu@nxp.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - fsl,imx8mq-dp-phy
> > > +      - fsl,imx8mq-hdmi-phy
> >
> > While reading cdns-mhdp8501-core.c I'm not so sure about this. There is=
 only
> > a single PHY which can be configured for either DP or HDMI.
> > Using separate compatibles for that somehow bugs me.
> > Maybe the DT maintainers can add some input if this should be single or
> > double compatibles.
> >
> When user enable MHDP8501 HDMI or DP, he should clearly know which type h=
e want to enable,
> From board type, flash.bin(firmware) to dts(connector and phy type), they=
 are all need align to HDMI or DP.

I understand your concerns. On the other hand cdns_mhdp8501_dt_parse() from
patch 4 already parses DT setup to decide whether the output is DP or HDMI.
mhdp->connector_type can be used to configure the PHY accordingly.

Best regards,
Alexander

> B.R
> Sandor
>=20
> > Thanks and best regards,
> > Alexander
> >
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: PHY reference clock.
> > > +      - description: APB clock.
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: ref
> > > +      - const: apb
> > > +
> > > +  "#phy-cells":
> > > +    const: 0
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - "#phy-cells"
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/imx8mq-clock.h>
> > > +    #include <dt-bindings/phy/phy.h>
> > > +    dp_phy: phy@32c00000 {
> > > +        compatible =3D "fsl,imx8mq-dp-phy";
> > > +        reg =3D <0x32c00000 0x100000>;
> > > +        #phy-cells =3D <0>;
> > > +        clocks =3D <&hdmi_phy_27m>, <&clk
> > IMX8MQ_CLK_DISP_APB_ROOT>;
> > > +        clock-names =3D "ref", "apb";
> > > +    };
> > >
> >
> >
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-/
> > group.com%2F&data=3D05%7C02%7CSandor.yu%40nxp.com%7Ce79b4d15c2044
> > 94963c508dc31fbab5d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> > %7C638440204190726471%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> > wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7
> > C&sdata=3D7xs1%2FC%2BK1cSFDc3rlBEZdNBsYw6Gc8AR6CWr2Djz4s0%3D&res
> > erved=3D0
> >
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


