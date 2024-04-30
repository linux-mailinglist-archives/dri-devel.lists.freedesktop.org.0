Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0508B6C17
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 09:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CAD10E20B;
	Tue, 30 Apr 2024 07:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X3j4NGN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6DA10E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 07:48:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E3669CE0D6B;
 Tue, 30 Apr 2024 07:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01D8C2BBFC;
 Tue, 30 Apr 2024 07:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714463288;
 bh=9IhoDrLW5nla3PkdfiFXqy+CBqAGV0puxz21Q1cMMhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X3j4NGN90P1GmyQQZcPK/CCn5HXBpRxqpfpBMjPyL6V+WuLs+vRwa9bhCkFvf2Ypk
 CzCK8BwSeEyDG9CfSTutylcTBbnnjDCw7jayRL3BEadM690pBlnxcWNQhadXREO1aE
 zZpOSJPJXmSPNPYodAUpTnSOSlha4iWzZ0v95ipKKTh6HmWO6jfvRVo/AteUos0gyM
 pmTPyaOSoJIlZX7sGBY8NkLvjZ4tsnbk9zPVvNzoah5m0mZl66RKHgPosxZw7oYPNJ
 ODdcC8hGQWGlb/xKfwCZCaFGey6QzbRahjO0nE2fP6aahKt3yMu1HSE3M4TXw0NWkQ
 boFt3JByVTJBw==
Date: Tue, 30 Apr 2024 09:48:05 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Robert Foss <rfoss@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>, 
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/stm: dsi: relax mode_valid clock tolerance
Message-ID: <20240430-exuberant-ludicrous-caiman-bc7dac@houat>
References: <20240322104732.2327060-1-sean@geanix.com>
 <20240424-famous-fascinating-hyena-8fb3a7@houat>
 <cvzecixldubeq7pwn77cggs7tcwc5on3arlnboj4fbpqgdygtu@hat3r6afzu7y>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3ku2wna3thhbsakw"
Content-Disposition: inline
In-Reply-To: <cvzecixldubeq7pwn77cggs7tcwc5on3arlnboj4fbpqgdygtu@hat3r6afzu7y>
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


--3ku2wna3thhbsakw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 29, 2024 at 10:17:45AM +0200, Sean Nyekjaer wrote:
> On Wed, Apr 24, 2024 at 09:21:17AM UTC, Maxime Ripard wrote:
> > Hi,
> >=20
> > Sorry, my previous review didn't go through.
> >=20
> > On Fri, Mar 22, 2024 at 11:47:31AM +0100, Sean Nyekjaer wrote:
> > > When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> > > to reguire the requested and the actual px clock to be within
> > > 50Hz. A typical LVDS display requires the px clock to be within +-10%.
> > >=20
> > > In case for HDMI .5% tolerance is required.
> > >=20
> > > Fixes: e01356d18273 ("drm/stm: dsi: provide the implementation of mod=
e_valid()")
> > > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > > ---
> > >  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/=
stm/dw_mipi_dsi-stm.c
> > > index d5f8c923d7bc..97936b0ef702 100644
> > > --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> > > +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> > > @@ -322,8 +322,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsig=
ned int lane_mbps,
> > >  	return 0;
> > >  }
> > > =20
> > > -#define CLK_TOLERANCE_HZ 50
> > > -
> > >  static enum drm_mode_status
> > >  dw_mipi_dsi_stm_mode_valid(void *priv_data,
> > >  			   const struct drm_display_mode *mode,
> > > @@ -375,9 +373,10 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
> > >  		/*
> > >  		 * Filter modes according to the clock value, particularly useful =
for
> > >  		 * hdmi modes that require precise pixel clocks.
> > > +		 * Check that px_clock is within .5% tolerance.
> > >  		 */
> > > -		if (px_clock_hz < target_px_clock_hz - CLK_TOLERANCE_HZ ||
> > > -		    px_clock_hz > target_px_clock_hz + CLK_TOLERANCE_HZ)
> > > +		if (px_clock_hz < mult_frac(target_px_clock_hz, 995, 1000) ||
> > > +		    px_clock_hz > mult_frac(target_px_clock_hz, 1005, 1000))
> > >  			return MODE_CLOCK_RANGE;
> >=20
> > I wonder if it's not something that should be made into a helper. We
> > have a couple of drivers doing it already, so it might be worth creating
> > a function that checks for a given struct clk pointer and pixel clock if
> > it's within parameters.
> >=20
> > Maxime
>=20
> Yes agree, if the same calculation is happening other places.
> I can't identify where it happens though.

sun4i has one:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/sun4i_=
rgb.c#L123

> Would that helper function exist in drivers/gpu/drm/drm_hdmi_helper.c ?

There's nothing related to HDMI per se, so in drm_modes is probably
better.

Maxime


--3ku2wna3thhbsakw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZjCiLQAKCRAnX84Zoj2+
ds5wAYDHGuIdIPY8LGE5jCxGK/zlexyRCxqHgMO/chCJQKe8587hAVvgA6kCEjOG
8wElsZsBgOUQR5Rq+np631HT2l10Ql64rLGh4vOK+pluY8lwaT5XM5UI5MXsn+dH
OEGAeKFVbw==
=xyGn
-----END PGP SIGNATURE-----

--3ku2wna3thhbsakw--
