Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D7470699F
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 15:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685B710E41B;
	Wed, 17 May 2023 13:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DC110E41B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 13:20:37 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pzH51-0005lI-B6; Wed, 17 May 2023 15:20:35 +0200
Message-ID: <eeffc9d6ff1b5db2b096f4cde5f88c65d2258b9d.camel@pengutronix.de>
Subject: Re: [PATCH V6 4/6] drm: bridge: samsung-dsim: Select
 GENERIC_PHY_MIPI_DPHY
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Date: Wed, 17 May 2023 15:20:32 +0200
In-Reply-To: <CAHCN7xJZMu2u2gydmL9gF16Sd6wVX62kJRpzvZnhQLCtRm-zrQ@mail.gmail.com>
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-5-aford173@gmail.com>
 <a0debcb9251aa99326aec44235d39f84c6086096.camel@pengutronix.de>
 <CAHCN7xJZMu2u2gydmL9gF16Sd6wVX62kJRpzvZnhQLCtRm-zrQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 17.05.2023 um 08:02 -0500 schrieb Adam Ford:
> On Wed, May 17, 2023 at 7:58=E2=80=AFAM Lucas Stach <l.stach@pengutronix.=
de> wrote:
> >=20
> > Am Montag, dem 15.05.2023 um 18:57 -0500 schrieb Adam Ford:
> > > In order to support variable DPHY timings, it's necessary
> > > to enable GENERIC_PHY_MIPI_DPHY so phy_mipi_dphy_get_default_config
> > > can be used to determine the nominal values for a given resolution
> > > and refresh rate.
> > >=20
> > I would just squash this one into the patch introducing the dependency.
>=20
> I thought Kconfig updates were supposed to be on their own.  Is that
> not correct?
>=20
I'm not aware of a general rule for this, but maybe I just missed it.
Personally I would have added this to the patch introducing the
dependency, but I'm also fine with keeping it as a separate patch.

Regards,
Lucas


> adam
> >=20
> > Regards,
> > Lucas
> >=20
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > > Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  drivers/gpu/drm/bridge/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/=
Kconfig
> > > index f076a09afac0..82c68b042444 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -227,6 +227,7 @@ config DRM_SAMSUNG_DSIM
> > >       select DRM_KMS_HELPER
> > >       select DRM_MIPI_DSI
> > >       select DRM_PANEL_BRIDGE
> > > +     select GENERIC_PHY_MIPI_DPHY
> > >       help
> > >         The Samsung MIPI DSIM bridge controller driver.
> > >         This MIPI DSIM bridge can be found it on Exynos SoCs and
> >=20

