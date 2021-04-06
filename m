Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D043E355582
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 15:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2BB6E084;
	Tue,  6 Apr 2021 13:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD0C6E084
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 13:44:06 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lTlzt-0004HM-FT; Tue, 06 Apr 2021 15:44:01 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lTlzo-00033c-7n; Tue, 06 Apr 2021 15:43:56 +0200
Date: Tue, 6 Apr 2021 15:43:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] pwm: Rename pwm_get_state() to better reflect its semantic
Message-ID: <20210406134356.dda74heeshkwdarw@pengutronix.de>
References: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
 <YGxDD4jVZx/H/Zdr@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YGxDD4jVZx/H/Zdr@orome.fritz.box>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-input@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-pwm@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, intel-gfx@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Stephen Boyd <sboyd@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: multipart/mixed; boundary="===============1244726964=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1244726964==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6hkzfhuwxujjtpy"
Content-Disposition: inline


--t6hkzfhuwxujjtpy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Tue, Apr 06, 2021 at 01:16:31PM +0200, Thierry Reding wrote:
> On Tue, Apr 06, 2021 at 09:30:36AM +0200, Uwe Kleine-K=F6nig wrote:
> > Given that lowlevel drivers usually cannot implement exactly what a
> > consumer requests with pwm_apply_state() there is some rounding involve=
d.
> >=20
> > pwm_get_state() traditionally returned the setting that was requested m=
ost
> > recently by the consumer (opposed to what was actually implemented in
> > hardware in reply to the last request). To make this semantic obvious
> > rename the function.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  Documentation/driver-api/pwm.rst           |  6 +++-
> >  drivers/clk/clk-pwm.c                      |  2 +-
> >  drivers/gpu/drm/i915/display/intel_panel.c |  4 +--
> >  drivers/input/misc/da7280.c                |  2 +-
> >  drivers/input/misc/pwm-beeper.c            |  2 +-
> >  drivers/input/misc/pwm-vibra.c             |  4 +--
> >  drivers/pwm/core.c                         |  4 +--
> >  drivers/pwm/pwm-atmel-hlcdc.c              |  2 +-
> >  drivers/pwm/pwm-atmel.c                    |  2 +-
> >  drivers/pwm/pwm-imx27.c                    |  2 +-
> >  drivers/pwm/pwm-rockchip.c                 |  2 +-
> >  drivers/pwm/pwm-stm32-lp.c                 |  4 +--
> >  drivers/pwm/pwm-sun4i.c                    |  2 +-
> >  drivers/pwm/sysfs.c                        | 18 ++++++------
> >  drivers/regulator/pwm-regulator.c          |  4 +--
> >  drivers/video/backlight/pwm_bl.c           | 10 +++----
> >  include/linux/pwm.h                        | 34 ++++++++++++++--------
> >  17 files changed, 59 insertions(+), 45 deletions(-)
>=20
> Honestly, I don't think this is worth the churn. If you think people
> will easily get confused by this then a better solution might be to more
> explicitly document the pwm_get_state() function to say exactly what it
> returns.

I'm not so optimistic that people become aware of the semantic just
because there is documentation describing it and I strongly believe that
a good name for functions is more important than accurate documentation.

If you don't agree, what do you think about the updated wording in
Documentation/driver-api/pwm.rst?

> But there's no need to make life difficult for everyone by
> renaming this to something as cumbersome as this.

I don't expect any merge conflicts (and if still a problem occurs
resolving should be trivial enough). So I obviously don't agree to your
weighing.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t6hkzfhuwxujjtpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmBsZZkACgkQwfwUeK3K
7AnKfQf8CsJvMKdyRy2ch/MNcEI+IBzOnV6nRAbwkLN/G3pbTRHLCtd8Zg/Iobf1
P7ADJlOPATvorbWWUoagJrzcsXswh3ctV5aSWs0Ax1GJQ+PxNtz20n+MtsiTq2gZ
flPfVN0AurTPqh+oGXK+f9C9N0ASjR7i2qjuUoub37yQ/abR5exNOpaM8FEnIbcF
OHcBHOokDL0GpBDir8M9UyfrsPt8TfVD5fk5hXr7hmBhY/iuGQynYDRMQ11/zkvM
lqdH7zPujy5oNqA/+6OSE8vbqoyTRoSqFHuyPRirxDrO14Yu2U570iUznQfg2O/t
3egDaTaqSuaJjxZHzKE4dbx3R/z8wQ==
=ePEJ
-----END PGP SIGNATURE-----

--t6hkzfhuwxujjtpy--

--===============1244726964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1244726964==--
