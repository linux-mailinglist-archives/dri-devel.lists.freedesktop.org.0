Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C9734B5F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 07:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2614810E099;
	Mon, 19 Jun 2023 05:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A7610E099
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 05:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1687152941; x=1718688941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mYA1EuGe/J05gnoC+NV7CFMwGzxknODHfy9o+vF7QBI=;
 b=fewt2qmsg3h18kdd9sAax6dkz8h0TENgZmwQSHd+TBtR7c0oXWoSQ4tC
 rxIhpCM6ywW/kSMWsoP401FiIg2Spiv9Rma0Frk/yWm26osn3M1N46dl6
 YPOPMV28CvutsimkjsD5BJ+WJkeASzx46JYgnzIbhP3fVWAXkE62LimUC
 90NHzertB8Wn1jh7jksAGDQLgEY5metG/x6Zn5B1B79XxzJfCnBMypiW1
 ipZ5516SPAzw2eWd/s0gBvts0CTxUgMVpIrzB+PCgWci0+Nbdr7xiKHvd
 uCSklpktbjdgb4NgPpaw9imuifIKQgWXXTABY9RR24ynavR9QCTNGiCsQ w==;
X-IronPort-AV: E=Sophos;i="6.00,254,1681164000"; d="scan'208";a="31479630"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 19 Jun 2023 07:35:37 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C9D5B28007C;
 Mon, 19 Jun 2023 07:35:36 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
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
 "linux-phy@lists.infradead
 .org" <linux-phy@lists.infradead.org>, Sandor Yu <sandor.yu@nxp.com>
Subject: RE: [EXT] Re: [PATCH v6 5/8] drm: bridge: Cadence: Add MHDP8501 HDMI
 driver
Date: Mon, 19 Jun 2023 07:35:36 +0200
Message-ID: <5686988.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB94485237A1921466463DD691F45FA@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <11795277.nUPlyArG6x@steina-w>
 <PAXPR04MB94485237A1921466463DD691F45FA@PAXPR04MB9448.eurprd04.prod.outlook.com>
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
Cc: Oliver Brown <oliver.brown@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandor,

Am Montag, 19. Juni 2023, 05:11:02 CEST schrieb Sandor Yu:
> Hi Alexander,
>=20
> Thanks for your comments,
>=20
>=20
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: 2023=E5=B9=B46=E6=9C=8816=E6=97=A5 17:30
> > To: andrzej.hajda@intel.com; neil.armstrong@linaro.org;
> > robert.foss@linaro.org; Laurent.pinchart@ideasonboard.com;
> > jonas@kwiboo.se; jernej.skrabec@gmail.com; airlied@gmail.com;
> > daniel@ffwll.ch; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> > vkoul@kernel.org; dri-devel@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org
> > Cc: Oliver Brown <oliver.brown@nxp.com>; Sandor Yu <sandor.yu@nxp.com>;
> > dl-linux-imx <linux-imx@nxp.com>; kernel@pengutronix.de; Sandor Yu
> > <sandor.yu@nxp.com>
> > Subject: [EXT] Re: [PATCH v6 5/8] drm: bridge: Cadence: Add MHDP8501
> > HDMI driver
> >
> >
> >
> > Caution: This is an external email. Please take care when clicking links
> > or
 opening attachments. When in doubt, report the message using the
> > 'Report this email' button
> >
> >
> >
> >
> > Hi Sandor,
> >
> >
> >
> > thanks for sending a new version.
> >
> >
> >
> > Am Donnerstag, 15. Juni 2023, 03:38:15 CEST schrieb Sandor Yu:
> >=20
> > > Add a new DRM HDMI bridge driver for Cadence MHDP8501 that used in
> > > Freescale i.MX8MQ SoC.
> > > MHDP8501 could support HDMI or DisplayPort standards according
> > > embedded Firmware running in the uCPU.
> > >
> > >
> > >
> > > For iMX8MQ SoC, the HDMI FW was loaded and activated by SOC ROM
> >=20
> > code.
> >=20
> > > Bootload binary included HDMI FW was required for the driver.
> > >
> > >
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > ---
> > >=20
> > >  drivers/gpu/drm/bridge/cadence/Kconfig        |   12 +
> > >  drivers/gpu/drm/bridge/cadence/Makefile       |    1 +
> > >  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 1024
> >=20
> > +++++++++++++++++
> >=20
> > >  3 files changed, 1037 insertions(+)
> > >  create mode 100644
> > >=20
> > > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > >
> > >
> > >
> > > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > b/drivers/gpu/drm/bridge/cadence/Kconfig index
> > > 5b7ec4e49aa1..bee05e834055
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > > @@ -59,3 +59,15 @@ config DRM_CDNS_MHDP8501_DP
> > >=20
> > >         Support Cadence MHDP8501 DisplayPort driver.
> > >         Cadence MHDP8501 Controller support one or more protocols,
> > >         DisplayPort firmware is required for this driver.
> > >=20
> > > +
> > > +config DRM_CDNS_MHDP8501_HDMI
> > > +     tristate "Cadence MHDP8501 HDMI DRM driver"
> > > +     select DRM_KMS_HELPER
> > > +     select DRM_PANEL_BRIDGE
> > > +     select DRM_DISPLAY_HELPER
> > > +     select DRM_CDNS_AUDIO
> > > +     depends on OF
> > > +     help
> > > +       Support Cadence MHDP8501 HDMI driver.
> > > +       Cadence MHDP8501 Controller support one or more protocols,
> > > +       HDMI firmware is required for this driver.
> > > diff --git a/drivers/gpu/drm/bridge/cadence/Makefile
> > > b/drivers/gpu/drm/bridge/cadence/Makefile index
> > > 5842e4540c62..8a129c14ac14
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > > @@ -7,3 +7,4 @@ cdns-mhdp8546-y :=3D cdns-mhdp8546-core.o
> > > cdns-mhdp8546-hdcp.o
> > > cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D
> > > cdns-mhdp8546-j721e.o
> > >
> > >
> > >
> > >  obj-$(CONFIG_DRM_CDNS_MHDP8501_DP) +=3D cdns-mhdp8501-dp.o
> > >=20
> > > +obj-$(CONFIG_DRM_CDNS_MHDP8501_HDMI) +=3D cdns-mhdp8501-hdmi.o
> > > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c new file mode
> > > 100644 index 000000000000..43673f1b50f6
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> >=20
> > [...]
> >=20
> > > +static int cdns_hdmi_bridge_attach(struct drm_bridge *bridge,
> > > +                              enum drm_bridge_attach_flags flags)
> >=20
> > {
> >=20
> > > +     struct cdns_mhdp_device *mhdp =3D bridge->driver_private;
> > > +     struct drm_mode_config *config =3D &bridge->dev->mode_config;
> > > +     struct drm_encoder *encoder =3D bridge->encoder;
> > > +     struct drm_connector *connector =3D &mhdp->connector;
> > > +
> > > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > +             connector->interlace_allowed =3D 0;
> > > +             connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> > > +
> > > +             drm_connector_helper_add(connector,
> >=20
> > &cdns_hdmi_connector_helper_funcs);
> >=20
> > > +
> > > +             drm_connector_init(bridge->dev, connector,
> >=20
> > &cdns_hdmi_connector_funcs,
> >=20
> > > +
> >=20
> > DRM_MODE_CONNECTOR_HDMIA);
> >=20
> > > +
> > > +             drm_object_attach_property(&connector->base,
> > > +                                        config-
> > >
> > >hdr_output_metadata_property, 0);
> > >
> > > +
> > > +             if
> > > + (!drm_mode_create_hdmi_colorspace_property(connector))
> >
> >
> >
> > This is missing a 2nd parameter.
>=20
> I have not found function drm_mode_create_hdmi_colorspace_property need 2=
nd
> parameter in L6.1.

Ah, I see. The new parameter is/will be part of v6.3.

> And those connector init functions will be remove in
> the next version according Sam's comments, because they are not really
> needed.=20

Okay, nice. Please put me on cc as well. Thanks.

Best regards,
Alexander

> B.R
> Sandor
>=20
> >
> >
> > > +
> >=20
> > drm_object_attach_property(&connector->base,
> >=20
> > > +                                             connector-
> > >
> > >colorspace_property, 0);
> > >
> > > +
> > > +             drm_connector_attach_encoder(connector, encoder);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> >=20
> > [...]
> >
> >
> >
> > Best regards,
> > Alexander
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > http://www.tq/
> > -group.com%2F&data=3D05%7C01%7CSandor.yu%40nxp.com%7C77fbaace052c
> > 4ccf338c08db6e4c40cb%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C
> > 0%7C638225046010817530%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
> > LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C
> > %7C%7C&sdata=3DJJjeV2InXzHyefL4uiK9%2BRtSVjoBYd%2FwIqSbIQhDH90%3D
> > &reserved=3D0
> >
> >
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


