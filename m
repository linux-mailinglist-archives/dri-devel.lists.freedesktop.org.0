Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F099B11FE1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 16:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A0810E00F;
	Fri, 25 Jul 2025 14:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jmtd1oVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE28610E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:15:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E67E7A5659F;
 Fri, 25 Jul 2025 14:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086CEC4CEE7;
 Fri, 25 Jul 2025 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753452926;
 bh=klj31ndNyAWRbK84pKxL4JoG8gx4CjB4V3j2sfODoUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jmtd1oVzWi1NM63TDozl7apju5daWm6U3OWjyBWY29WQR6kAljjan0nSZI+9J3mIh
 XekGDZvq8Rl3GzVNxEseDghIuBpxtvatGakpY0BIThktlCaQZx8l1CUBYttjp/YRUr
 0DPuB3mfNOJ504RorGftZcbTTiT/nifETC+S/G1BUwZhzUQ/85Rw6KIqYx43X/5Q+K
 BaoelOTWIX/M4gZQJJtF8OuSDsLtdTxugSCyEbV6IXkmVaG5AfH2b9SG0iI6CWsO4v
 gDBG/ZaqBK7mxij7XPn1LTzEPd1HjM0fhWHuTnVhXZ/GvCclzVDa4/NQS01oxbpFEV
 5J+CNfLss2LVg==
Date: Fri, 25 Jul 2025 16:15:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] drm/omapdrm: use drm_bridge_chain_get_last_bridge()
Message-ID: <20250725-holistic-ambrosial-jellyfish-f41f6b@houat>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
 <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-4-48920b9cf369@bootlin.com>
 <20250710-daffy-mini-booby-574fca@houat>
 <20250714123240.16d8dcb1@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ujxl4547qfzdg32k"
Content-Disposition: inline
In-Reply-To: <20250714123240.16d8dcb1@booty>
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


--ujxl4547qfzdg32k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] drm/omapdrm: use drm_bridge_chain_get_last_bridge()
MIME-Version: 1.0

On Mon, Jul 14, 2025 at 12:32:40PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Thu, 10 Jul 2025 09:13:46 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Wed, Jul 09, 2025 at 06:48:03PM +0200, Luca Ceresoli wrote:
> > > Use drm_bridge_chain_get_last_bridge() instead of open coding a loop =
with
> > > two invocations of drm_bridge_get_next_bridge() per iteration.
> > >=20
> > > Besides being cleaner and more efficient, this change is necessary in
> > > preparation for drm_bridge_get_next_bridge() to get a reference to the
> > > returned bridge.
> > >=20
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > ---
> > >  drivers/gpu/drm/omapdrm/omap_drv.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/oma=
pdrm/omap_drv.c
> > > index 054b71dba6a75b8c42198c4b102a093f43a675a2..3bbcec01428a6f290afdf=
a40ef6f79629539a584 100644
> > > --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> > > +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> > > @@ -378,12 +378,12 @@ static int omap_display_id(struct omap_dss_devi=
ce *output)
> > >  	struct device_node *node =3D NULL;
> > > =20
> > >  	if (output->bridge) {
> > > -		struct drm_bridge *bridge =3D output->bridge;
> > > -
> > > -		while (drm_bridge_get_next_bridge(bridge))
> > > -			bridge =3D drm_bridge_get_next_bridge(bridge);
> > > +		struct drm_bridge *bridge =3D
> > > +			drm_bridge_chain_get_last_bridge(output->bridge->encoder);
> > > =20
> > >  		node =3D bridge->of_node;
> > > +
> > > +		drm_bridge_put(bridge); =20
> >=20
> > Any reason you're not using __free(drm_bridge_put) here?
>=20
> Just because the code is simple enough that an explicit
> drm_bridge_put() is clearly sufficient.
>=20
> Do you think __free() should be used even in such trivial cases?

It's a matter of opinion at this point :)

It' makes it a bit easier and consistent so that's why I raised it, but
if you feel like it's too much, that's fine by me as well.

Maxime

--ujxl4547qfzdg32k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIORdwAKCRAnX84Zoj2+
dkjMAX9SOg3FKwN1N8vMVORyYMoULmzu5wxDDXKKuSFHlgdamHXhi0r6BnbBR3mn
Sr9UCrgBgJp8VMm91YNpmrlTp7YUpyrHZ7jGDOzb9ZihsYt9H+HB4JkLsHM6RPAL
oj/UGiAoCw==
=jgOt
-----END PGP SIGNATURE-----

--ujxl4547qfzdg32k--
