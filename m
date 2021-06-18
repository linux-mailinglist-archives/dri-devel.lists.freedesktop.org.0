Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0480A3AC533
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 09:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F656E97B;
	Fri, 18 Jun 2021 07:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6502F6E95F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 07:46:45 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lu9D4-0006eM-Pr; Fri, 18 Jun 2021 09:46:38 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lu9Cy-0000ol-Ff; Fri, 18 Jun 2021 09:46:32 +0200
Date: Fri, 18 Jun 2021 09:46:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20210618074625.rvw3xe7k2zqeo77z@pengutronix.de>
References: <20210615231828.835164-1-bjorn.andersson@linaro.org>
 <20210615231828.835164-2-bjorn.andersson@linaro.org>
 <20210616075637.jtoa25uyhnqkctlu@pengutronix.de>
 <YMq/6VhXrYJoTVnj@yoga>
 <20210617062449.qwsjcpkyiwzdyfi3@pengutronix.de>
 <YMt6gvXQKijtPOql@yoga>
 <20210617165433.ltugrrj6ntmc6j57@pengutronix.de>
 <YMuPO3iKRSFNLbNZ@yoga>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v2mxeqjbbvr4gdw3"
Content-Disposition: inline
In-Reply-To: <YMuPO3iKRSFNLbNZ@yoga>
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
Cc: linux-pwm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v2mxeqjbbvr4gdw3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bjorn,

On Thu, Jun 17, 2021 at 01:06:51PM -0500, Bjorn Andersson wrote:
> On Thu 17 Jun 11:54 CDT 2021, Uwe Kleine-K?nig wrote:
> > On Thu, Jun 17, 2021 at 11:38:26AM -0500, Bjorn Andersson wrote:
> > > On Thu 17 Jun 01:24 CDT 2021, Uwe Kleine-K?nig wrote:
> > > > On Wed, Jun 16, 2021 at 10:22:17PM -0500, Bjorn Andersson wrote:
> > > > > > > +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm=
_device *pwm,
> > > > > > > +			   const struct pwm_state *state)
> > > > > > > +{
> > > > > > > +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chi=
p);
> > > > > > > +	unsigned int pwm_en_inv;
> > > > > > > +	unsigned int backlight;
> > > > > > > +	unsigned int pre_div;
> > > > > > > +	unsigned int scale;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	if (!pdata->pwm_enabled) {
> > > > > > > +		ret =3D pm_runtime_get_sync(pdata->dev);
> > > > > > > +		if (ret < 0)
> > > > > > > +			return ret;
> > > > > > > +
> > > > > > > +		ret =3D regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> > > > > > > +				SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
> > > > > > > +				SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
> > > > > > > +		if (ret) {
> > > > > > > +			dev_err(pdata->dev, "failed to mux in PWM function\n");
> > > > > > > +			goto out;
> > > > > > > +		}
> > > > > >=20
> > > > > > Do you need to do this even if state->enabled is false?
> > > > >=20
> > > > > I presume I should be able to explicitly mux in the GPIO function=
 and
> > > > > configure that to output low. But I am not able to find anything =
in the
> > > > > data sheet that would indicate this to be preferred.
> > > >=20
> > > > My question targetted a different case. If the PWM is off
> > > > (!pdata->pwm_enabled) and should remain off (state->enabled is fals=
e)
> > > > you can shortcut here, can you not?
> > >=20
> > > Right, if we're going off->off then we don't need to touch the hardwa=
re.
> > >=20
> > > But am I expected to -EINVAL improper period and duty cycle even thou=
gh
> > > enabled is false?
> > >=20
> > > And also, what is the supposed behavior of enabled =3D false? Is it
> > > supposedly equivalent of asking for a duty_cycle of 0?
> >=20
> > In my book enabled =3D false is just syntactic sugar to say:
> > "duty_cycle=3D0, period=3Dsomething small". So to answer your questions=
: if
> > enabled =3D false, the consumer doesn't really care about period and
> > duty_cycle. Some care that the output becomes inactive, some others
> > don't, so from my POV just emit the inactive level on the output and
> > ignore period and duty_cycle.
>=20
> Giving this some further thought.

Very appreciated, still more as you come to the same conclusions as I do
:-)

> In order to have a known state of the PWM signal we need the sn65dsi86
> to be powered. The documentation describes a "suspend mode", but this is
> currently not implemented in the driver, so there's a large power cost
> coming from just keeping the pin low when disabled.

In the past I already promoted the idea that a disabled PWM should give
no guarantees about the output level. In fact there are several
offenders, the ones I know off-hand are:

 - pwm-imx27 emits a low level independent of the programmed polarity
 - pwm-iqs620a makes the output tristated and so relies on an external
   pull to give the inactive level.
 - pwm-sl28cpld switches to a GPIO mode on disable which isn't
   controlled by the driver

and I assume there are more because before no one actively asked for
and tracked this kind of information.

IMHO a consumer who wants the output to stay inactive should configure

	.enabled =3D true
	.period =3D DC (or something low to allow quick reprogramming)
	.duty_cycle =3D 0

, so there is no loss of functionality and enabled=3Dfalse should mean the
consumer doesn't care about the output which would allow some lowlevel
drivers to save some more energy. So this makes the API more expressive
because after dropping "disabled results in an inactive output"
consumers can differentiate between "I care about the output staying
inactive" and "I don't care". This in turn allows lowlevel drivers to
better know when they can more aggressively save power and when they
don't.

Back then Thierry didn't like that approach though. (The thread started
with a mail having Message-Id
20180820144357.7206-1-u.kleine-koenig@pengutronix.de, this is missing on
lore.kernel.org however and I didn't find it on another mirror.)

Thierry's arguments were:

 - "An API whose result is an undefined state is useless in my opinion."
   (from Message-Id: 20181009073407.GA5565@ulmo)
   Yes, this is a drawback for some consumers, but it matches reality
   that disabling the PWM counter on some PWM implementations doesn't
   result in an inactive level. And if they care about the output, they
   just use .duty_cycle =3D 0 + .enabled =3D true instead.
   In my book changing the semantic fixes a bug because the API promises
   more than some drivers are capable to do (with reasonable effort).

 - "[Emitting the inactive level] also matches what all other drivers,
   and users, assume." (also from Message-Id: 20181009073407.GA5565@ulmo)
   For the drivers this was an assumption, today we know it's wrong.
   Users can be fixed.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--v2mxeqjbbvr4gdw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDMT04ACgkQwfwUeK3K
7Amh1AgAn6mO1LK9QNIF7tma6jy27ModENVOazMzlhODRmU/4d8vMESJr7igZ+5D
w5KftNey5LFHJEvC/qGedlraY6w87XDGW9j8FgATFB8ChpRDupQi9J2Ql+QzBwGW
rk1KGA2fWmG465rjgg71n13TYmeuUepBW7sSMAdArEV519/l+leUosAJEhwycu8D
WvUBGTOVyTS8I3E+vCutJ5L7E1PNqbd9ZRPUL/e57aPWeY26EhvkYfg4w9sTwwQA
wgkQQPkE+46EYNSZT3mLMghswm7P6DJb3K6KGfYn2kr/PAE++pZCPd7ELpt+QX1A
MPxtxS3M/K9xQjFAm/rr93QGlXuaLA==
=aXyd
-----END PGP SIGNATURE-----

--v2mxeqjbbvr4gdw3--
