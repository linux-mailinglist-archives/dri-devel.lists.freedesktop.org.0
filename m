Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 529D42030DF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBDD6E109;
	Mon, 22 Jun 2020 07:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4408E6E109
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 07:55:16 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jnHIN-0001K2-Ul; Mon, 22 Jun 2020 09:55:11 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jnHIL-0002Ni-O7; Mon, 22 Jun 2020 09:55:09 +0200
Date: Mon, 22 Jun 2020 09:55:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 09/15] pwm: crc: Enable/disable PWM output on
 enable/disable
Message-ID: <20200622075509.v4jlvqeyjip6wr6c@taurus.defre.kleine-koenig.org>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-10-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200620121758.14836-10-hdegoede@redhat.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
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
Cc: linux-pwm@vger.kernel.org, Shobhit Kumar <shobhit.kumar@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============0766412318=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0766412318==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ypxyr4o4mparzkst"
Content-Disposition: inline


--ypxyr4o4mparzkst
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[adding Shobhit Kumar <shobhit.kumar@intel.com> to Cc who is the author
of this driver according to the comment on the top of the driver]

On Sat, Jun 20, 2020 at 02:17:52PM +0200, Hans de Goede wrote:
> The pwm-crc code is using 2 different enable bits:
> 1. bit 7 of the PWM0_CLK_DIV (PWM_OUTPUT_ENABLE)
> 2. bit 0 of the BACKLIGHT_EN register
>=20
> So far we've kept the PWM_OUTPUT_ENABLE bit set when disabling the PWM,
> this commit makes crc_pwm_disable() clear it on disable and makes
> crc_pwm_enable() set it again on re-enable.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Remove paragraph about tri-stating the output from the commit message,
>   we don't have a datasheet so this was just an unfounded guess

I have the impression you spend quite some time with this driver trying
to understand it. What I still think is a bit unfortunate is that there
is quite some guesswork involved. I wonder if it would be possible to
get the manual of that PWM. Do I understand correctly that this is IP
=66rom Intel? There are quite some Intel people on Cc; maybe someone can
help/put in a good word/check and ack the changes?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ypxyr4o4mparzkst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl7wY9oACgkQwfwUeK3K
7AkBmgf/URbPK5r1qmeNU0sD1f40ci/9rHAXc+ZNpi4zW8VvyuyQj2u5/EdJYhgf
fwkjwPzjlecESF9XX+5WWa8ohURIuJa7HdUIEdo2nEd8Z8aSlVIEXCyDOAxhguQB
P1qCZ4yliJyxKzRcfVisrYm4Io6w58KwViYxE3ugpGj3qLNGD3IPlsH0g0ZRmy3q
Ky8iwMTz55C6DBNipijnVWPxzJZspMY8z5EVQvlrG1fh2JNyTNn591T0VY4chvXY
+TYaKr8uL8Pl7vTXtiaYt21dUklwrRqMHkHtXlkMYMO0g+k6kjNOuD101q8RE/uS
pcqP7McwMxOwfxdclHZc1e4LdzPcQg==
=UqkS
-----END PGP SIGNATURE-----

--ypxyr4o4mparzkst--

--===============0766412318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0766412318==--
