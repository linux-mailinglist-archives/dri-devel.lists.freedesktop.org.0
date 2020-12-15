Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E422DA92B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14222893C0;
	Tue, 15 Dec 2020 08:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D93F893C0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 08:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D41F5FB03;
 Tue, 15 Dec 2020 09:30:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7tRuB2LkNIs; Tue, 15 Dec 2020 09:30:19 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 5ECA443FDC; Tue, 15 Dec 2020 09:30:19 +0100 (CET)
Date: Tue, 15 Dec 2020 09:30:19 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 1/4] drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_enable()
Message-ID: <20201215083019.GA11854@bogon.m.sigxcpu.org>
References: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
 <1607067224-15616-2-git-send-email-victor.liu@nxp.com>
 <20201208090457.GB20575@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208090457.GB20575@bogon.m.sigxcpu.org>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, robert.chiras@nxp.com,
 martin.kepplinger@puri.sm, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Tue, Dec 08, 2020 at 10:04:57AM +0100, Guido G=FCnther wrote:
> Hi,
> On Fri, Dec 04, 2020 at 03:33:41PM +0800, Liu Ying wrote:
> > The Northwest Logic MIPI DSI host controller embedded in i.MX8qxp
> > works with a Mixel MIPI DPHY + LVDS PHY combo to support either
> > a MIPI DSI display or a LVDS display.  So, this patch calls
> > phy_set_mode() from nwl_dsi_enable() to set PHY mode to MIPI DPHY
> > explicitly.

Should i pull this patch in via drm-misc-next or is the whole series
supposed to go via the phy tree?
Cheers,
 -- Guido


> > =

> > Cc: Guido G=FCnther <agx@sigxcpu.org>
> > Cc: Robert Chiras <robert.chiras@nxp.com>
> > Cc: Martin Kepplinger <martin.kepplinger@puri.sm>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/nwl-dsi.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/=
nwl-dsi.c
> > index 66b6740..be6bfc5 100644
> > --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> > +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> > @@ -678,6 +678,12 @@ static int nwl_dsi_enable(struct nwl_dsi *dsi)
> >  		return ret;
> >  	}
> >  =

> > +	ret =3D phy_set_mode(dsi->phy, PHY_MODE_MIPI_DPHY);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(dev, "Failed to set DSI phy mode: %d\n", ret);
> > +		goto uninit_phy;
> > +	}
> > +
> >  	ret =3D phy_configure(dsi->phy, phy_cfg);
> >  	if (ret < 0) {
> >  		DRM_DEV_ERROR(dev, "Failed to configure DSI phy: %d\n", ret);
> =

> Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =

>  -- Guido
> =

> > -- =

> > 2.7.4
> > =

> =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
