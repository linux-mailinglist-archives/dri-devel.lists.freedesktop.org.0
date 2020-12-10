Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D272D63D7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 18:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10DF6EAB4;
	Thu, 10 Dec 2020 17:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330536E435
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 17:43:51 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1knPyh-0001XP-Vu; Thu, 10 Dec 2020 18:43:43 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1knPyg-0007GO-0n; Thu, 10 Dec 2020 18:43:42 +0100
Date: Thu, 10 Dec 2020 18:43:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20201210174338.kecryijwptzc2mi7@pengutronix.de>
References: <20201208044022.972872-1-bjorn.andersson@linaro.org>
 <20201210015136.GA18407@dragon>
 <20201210130453.regjkemfneqbelsi@pengutronix.de>
 <CAAQ0ZWQEhitxNCKBjTNGcv5E+yqwjfbb5GCLoctpJM7u4Zpp=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQ0ZWQEhitxNCKBjTNGcv5E+yqwjfbb5GCLoctpJM7u4Zpp=A@mail.gmail.com>
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
Cc: linux-pwm@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1492337511=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1492337511==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ps2gwrvyhmcv56vu"
Content-Disposition: inline


--ps2gwrvyhmcv56vu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 10:40:36PM +0800, Shawn Guo wrote:
> Hi Uwe,
>=20
> On Thu, Dec 10, 2020 at 9:05 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > > > @@ -111,6 +118,8 @@
> > > >
> > > >  #define SN_LINK_TRAINING_TRIES             10
> > > >
> > > > +#define SN_PWM_GPIO                        3
> > >
> > > So this maps to the GPIO4 described in sn65dsi86 datasheet.  I'm
> > > wondering if it's more readable to define the following SHIFT constan=
ts
> > > (your code), and use GPIO_MUX_GPIO4_SHIFT >> 2 where you need GPIO
> > > offset?
> > >
> > > #define  GPIO_MUX_GPIO1_SHIFT 0
> > > #define  GPIO_MUX_GPIO2_SHIFT 2
> > > #define  GPIO_MUX_GPIO3_SHIFT 4
> > > #define  GPIO_MUX_GPIO4_SHIFT 6
> > >
> > > If you agree, you may consider to integrate this patch beforehand:
> > >
> > > https://github.com/shawnguo2/linux/commit/7cde887ffb3b27a36e77a08bee3=
666d14968b586
> >
> > My preferred way here would be to add a prefix for the other constants.
> > It (IMHO) looks nicer and
> >
> >         GPIO_INPUT_SHIFT
> >
> > looks like a quite generic name for a hardware specific definition.
>=20
> While this looks like a reasonable argument, I also like the naming
> choice for these constants in the beginning for that distinction
> between registers and bits.  And changing the names the other way
> around means there will be a much bigger diffstat, which I would like
> to avoid.  I suggest let's just focus on what really matters here -
> keep the naming consistent, so that people do not get confused when
> they want to add more constants in there.

In my eyes the bigger diffstat is justified. As I wrote,
GPIO_INPUT_SHIFT isn't used in other files, but please look how many
definitions there are for RESET. The usefulness of ctags/cscope is quite
reduced if generic terms are used this way.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ps2gwrvyhmcv56vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/SXkcACgkQwfwUeK3K
7AmI/Qf+O2t7kLzcKzhBBKQiEXpzva2VVJ1Sdqx+3IFglDVCks7FCR5ezU0dO09T
72uH2a7cWTHDIo1DcVVCtefbVVClwIeXYdGbDr4FKRzkGjf54Veao3Ow+bRIS5DM
6R+6d3oUuXHt+Ta51eGT/BoSL81iHQuyFhxUPGXlKBnPMdEy3/ZNa7jRj3LDgP0+
/InQbERlpSTU2x5OAgXbczDYsH/ZnzrTorCVdpmRSOYMci5HU/o8DU7Lu3YR8PJp
0QUai3CczxpUi0ZYF5dvPF9ED1Hctn0AeNuMM4hnErSg3EN6TrZsblLPnxSEh5bd
ZgcHNcVUveLXFUdAcMmzB5YercKscg==
=EgCO
-----END PGP SIGNATURE-----

--ps2gwrvyhmcv56vu--

--===============1492337511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1492337511==--
