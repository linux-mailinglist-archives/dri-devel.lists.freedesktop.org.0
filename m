Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC431807244
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 15:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B9110E028;
	Wed,  6 Dec 2023 14:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E76B10E028
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 14:23:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAso7-00055u-4j; Wed, 06 Dec 2023 15:23:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAso5-00Dyyj-9z; Wed, 06 Dec 2023 15:23:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAso5-00FWd8-0W; Wed, 06 Dec 2023 15:23:21 +0100
Date: Wed, 6 Dec 2023 15:23:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 101/108] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
Message-ID: <20231206142302.veoybwpvt77rskd6@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-102-u.kleine-koenig@pengutronix.de>
 <20231123094652.GH15697@pendragon.ideasonboard.com>
 <20231123101018.u6c6nymmkam5ltir@pengutronix.de>
 <20231206120611.GI22607@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zs6l5avnfu4nmnmv"
Content-Disposition: inline
In-Reply-To: <20231206120611.GI22607@pendragon.ideasonboard.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zs6l5avnfu4nmnmv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 02:06:11PM +0200, Laurent Pinchart wrote:
> On Thu, Nov 23, 2023 at 11:10:18AM +0100, Uwe Kleine-K=F6nig wrote:
> > Once the series is completely applied, the pwm_chip isn't allocated
> > using devm_kzalloc any more. You're only looking at an intermediate
> > state where I push the broken lifetime tracking from all drivers into a
> > single function in the core that is then fixed after all drivers are
> > converted to it.
>=20
> Indeed, I missed that devm_pwm_alloc() got changed later in the series
> to not call devm_kzalloc(). The naming is quite unfortunate, a
> devm_*_alloc() function really gives a strong hint that the
> corresponding cleanup at device remove time will be a free(), not a
> put() :-S That's pretty confusing for the readers.

Note there is a v4 in the meantime. My suggestion to rename
pwmchip_alloc() to pwmchip_get_new() could address this concern. Would
you like that? I didn't get any feedback about it when I suggested it
somewhere in the v3 thread. (I'm not sure I like it, given that
foo_alloc() is quite usual for other subsystems.)

> > If you find issues with the complete series applied, please tell me.
>=20
> One thing I still dislike is forcing drivers to dynamically allocate the
> pwm_chip series.

A struct pwm_chip must be allocated dynamically as it's reference
counted by a struct device. Given that nearly all drivers allocate their
driver data dynamically, too, this isn't a big issue IMO.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zs6l5avnfu4nmnmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVwg8UACgkQj4D7WH0S
/k6RXQf9GpPx1PyMC+wRqQElqp1h9M+WmZC5EuUi6xZIAp2iIlJGQ+uxsTsL9pg5
zEppRD5r/7aFOeHZjMNmSkEmIIDXAwPmDrOovlJDQyoFDKdUnW9UBwkUgYucaP9v
0tZ4QqiTXEjLEzA2Pd12xx9JPwSNDp6T69bqtpedUeqlUclzPKPs1SqKw8b8JibE
kZBYTunkkti0pt2TZrilPMQVeZqY8O5f4senU7cY5iARzbaYzLWRxlRylSnTxE5J
Mwm5H4TH7E17wQ9709Qd2EvxGFWR8afdMCJwILu3zDvyw5FwjbcB9JrOzjdwOhUN
EaH2KQqLWC/eMf7jH7xJsqwj61zhpw==
=ql0j
-----END PGP SIGNATURE-----

--zs6l5avnfu4nmnmv--
