Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2712F3B2A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 20:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B494589B8F;
	Tue, 12 Jan 2021 19:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B9A89B8F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 19:53:34 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kzPjQ-0002Op-GH; Tue, 12 Jan 2021 20:53:32 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kzPjP-0003s3-68; Tue, 12 Jan 2021 20:53:31 +0100
Date: Tue, 12 Jan 2021 20:53:30 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: rename GPIO register bits
Message-ID: <20210112195330.yye2rbn6y4zydpay@pengutronix.de>
References: <20201210081853.17060-1-shawnguo@kernel.org>
 <CAD=FV=WZQAaF1SXSP-co_O8=pYepzMHz5FjUfnbRJY_VH0AFpA@mail.gmail.com>
 <CAD=FV=Xu+KjGDKPi6x8spf5OWBUohTQeM37B41Y-qihKd4Z4-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Xu+KjGDKPi6x8spf5OWBUohTQeM37B41Y-qihKd4Z4-A@mail.gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: multipart/mixed; boundary="===============1833525527=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1833525527==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zhwsoj6neqbff4z6"
Content-Disposition: inline


--zhwsoj6neqbff4z6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 02:25:37PM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Mon, Jan 11, 2021 at 2:16 PM Doug Anderson <dianders@chromium.org> wro=
te:
> >
> > Hi,
> >
> > On Thu, Dec 10, 2020 at 12:19 AM Shawn Guo <shawnguo@kernel.org> wrote:
> > >
> > > From: Shawn Guo <shawn.guo@linaro.org>
> > >
> > > It renames GPIO register bits to drop 'SN_' prefix, so that they are
> > > consistent to other definitions - prefixing register name with 'SN_' =
but
> > > not for bit fields.
> > >
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 +++++++++++++-------------
> > >  1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > Sorry for taking so long to get back to this.  I think it came into my
> > inbox at the same time as a pile of other things and then got lost.
> > Your change looks good to me.  Sorry for being inconsistent when
> > adding those defines and thanks for fixing them!
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>=20
> Hrm, I just caught up on more email and found that in:
>=20
> https://lore.kernel.org/r/20201210174338.kecryijwptzc2mi7@pengutronix.de
>=20
> ...that Uwe would prefer to keep these bits what I have and change all
> the others.  ;-)  I don't have a strong opinion either way, but I
> definitely agree that it'd be better for all the defines to be
> consistent.  If I had to arbitrarily make the decision one way or the
> other I'd probably land Shawn's patch but I certainly wouldn't object
> if we went Uwe's way either.  :-P

For the the relevant argument for prefixes is that tools like ctags and
cscope work more reliable. Take for example the name TX_TIMEOUT. There
are around 60 symbols with that name in the kernel tree. This is quite
annoying if you want to jump from a certain use to its definition.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zhwsoj6neqbff4z6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/9/jgACgkQwfwUeK3K
7AkTjgf/cdCZysOs/5E5rJ4qIq18G8H3lZlyWVDEx0m4hnuKIOMyiyE+tOjHt6XC
9QbYM3x+dKyUJ9yHVmPbt4vI+StHxPVMZBsGWbnWHbDAWKFeM50WFHkNUU6iwyZT
mS93KHAafZu639GF1TjhWN68UCeDb/JX8ITxpit+0cUXXav5kv49iCr7ob4TBUVQ
8hbf51NpP3FAXuXTJ4eThlJI0GJfiPKmZ/cVHbElx5VIjvGBmGpgqIH3ii1bwxMc
64/AD9XjG3kCRxVZzrCu5Q+mSezp9XyX4tbKKMeeSj2YStA9m+q4MXSFWgqQoGYY
aLNmLZ6WMdKHSXIcfZm96IEsucizdw==
=Fx4Z
-----END PGP SIGNATURE-----

--zhwsoj6neqbff4z6--

--===============1833525527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1833525527==--
