Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F7280F8DB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 22:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66CE10E6B8;
	Tue, 12 Dec 2023 21:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD79E10E6B8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 21:05:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD9wF-0001Oy-5K; Tue, 12 Dec 2023 22:05:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD9wE-00FQEY-2C; Tue, 12 Dec 2023 22:05:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD9wD-001snP-Ol; Tue, 12 Dec 2023 22:05:09 +0100
Date: Tue, 12 Dec 2023 22:05:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 000/115] pwm: Fix lifetime issues for pwm_chips
Message-ID: <20231212210509.focpb63fbmahqij3@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <ZXM4CdJxg-XrYhkn@orome.fritz.box>
 <20231208185033.e6ty2cajcfle6dgk@pengutronix.de>
 <ZXbzcFTnDTKoZAta@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gyt34nc3mm25zmmf"
Content-Disposition: inline
In-Reply-To: <ZXbzcFTnDTKoZAta@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gyt34nc3mm25zmmf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Mon, Dec 11, 2023 at 12:33:04PM +0100, Thierry Reding wrote:
> On Fri, Dec 08, 2023 at 07:50:33PM +0100, Uwe Kleine-K=F6nig wrote:
> > You don't need to touch all drivers because you didn't change struct
> > pwm_chip::dev yet. (If you really want, you don't need to change that,
> > but then you have some duplication as chip->dev holds the same value as
> > priv->dev.parent in the end.)
>=20
> I don't think that's a problem. These are for two logically separate
> things, after all.

How are they different? I'd say one is the initializer for the other and
(ideally) unused after that. With that interpretation they are indeed
different, but then it's ugly that the initializer keeps staying around.

> Duplication can also sometimes be useful to simplify
> things. There are plently of cases where we use local variables for the
> same reason.

local variables go away though after the respective function is left.
chip->dev and its copy priv->dev.parent stay around for the full
lifetime of the chip.

> > > @@ -58,23 +60,24 @@ static struct pwm_chip *pwmchip_find_by_name(cons=
t char *name)
> > > =20
> > >  static int pwm_device_request(struct pwm_device *pwm, const char *la=
bel)
> > >  {
> > > +	struct pwm_chip *chip =3D pwm->priv->chip;
> >=20
> > With my approach getting the chip of a struct pwm_device is only one
> > pointer dereference away. You need two.
>=20
> None of the functions here are called very often, so even if this isn't
> optimized away it would hardly matter.

I'd say pwm_apply_state() at least matters. Also I think that making a
slow path quicker is a good thing.=20

I wonder how we'll converge to an approach that can go into the
mainline given that we both have our strong opinions.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gyt34nc3mm25zmmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV4ywQACgkQj4D7WH0S
/k4AOQf/Rn+1it6Pa2jcb+shcSHEefw76NASZ1jTJwzdnczaZca+4/TdY0/HLE/V
27TLO93Qd9e4o0E4uFjg/T9KbZy+cu9WxiCJ9LgBEhgPaLIWe9opiDarsy2BNLJi
e6lERFOmyBoG3USP7t/iEQn5C+0+gC6/pcPVWk8TJO/mc2kr8ioQRsaHtaE0AsX0
hpZS0GH+ypW5d1saF+TMkSDV4QUzmTaXxsSDqG9/vnXhjln6wlriyIo2gJI2qQ6R
gBrGVWoz8SnG3OjfGZwo9KhL+KPTbjIba4erb1KbE9j9Ul7c3xF/nA6GcTwU/IcQ
6WQMUp7Ez5oG8txpknnsR9R2Iimimw==
=APXJ
-----END PGP SIGNATURE-----

--gyt34nc3mm25zmmf--
