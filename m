Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C41F6FCC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 00:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC626E1EC;
	Thu, 11 Jun 2020 22:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12456E1EC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 22:20:36 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jjVYm-0001X4-La; Fri, 12 Jun 2020 00:20:32 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jjVYl-0007bu-V1; Fri, 12 Jun 2020 00:20:31 +0200
Date: Fri, 12 Jun 2020 00:20:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 09/15] pwm: crc: Enable/disable PWM output on
 enable/disable
Message-ID: <20200611222029.csyo2wxof7nuhjws@taurus.defre.kleine-koenig.org>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-10-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200607181840.13536-10-hdegoede@redhat.com>
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============0831400731=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0831400731==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cab7bvsyn2ss63v7"
Content-Disposition: inline


--cab7bvsyn2ss63v7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 07, 2020 at 08:18:34PM +0200, Hans de Goede wrote:
> The pwm-crc code is using 2 different enable bits:
> 1. bit 7 of the PWM0_CLK_DIV (PWM_OUTPUT_ENABLE)
> 2. bit 0 of the BACKLIGHT_EN register
>=20
> So far we've kept the PWM_OUTPUT_ENABLE bit set when disabling the PWM,
> this commit makes crc_pwm_disable() clear it on disable and makes
> crc_pwm_enable() set it again on re-enable.
>=20
> This should disable the internal (divided) PWM clock and tri-state the
> PWM output pin when disabled, saving some power.

It would be great if you could also document that disabling the PWM
makes the output tri-state. There are a few drivers that have a
"Limitations" section at their top. Describing that there (in the same
format) would be the right place.

Also note that according to Thierry's conception getting a (driven)
inactive output is the right thing for a disabled PWM.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cab7bvsyn2ss63v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl7irigACgkQwfwUeK3K
7Am/ugf/dDb23XNKHboy/tUBXfvicttKMcJeA2J2xQLa2smBZBSW6Rf227uTjwYi
LO+Kf0upcb1HCGqkE0t2BcTL6JwuMF6bIT8SONUYeHul6CyAYZTrberZhj/C6aoq
ea1xFjJr8WyAPUhXl4ZbTLfWyiNb2VeTdtF9FkB2FTarSuWTZR543f5Jk0mt6Xey
tMfjpCLepNvwDqYvfoqFgbhjzrSmIH8voI8IFGIOecEVpbc63L74FsNKQ3JNg8Ze
teRAOKKFK1VFYCrmBis286R9boQH2C5kkwC3raILdtXaJvPtFBJ9CKjITH/hTDzi
+YDSdup1pgUjtnMrUlmULfHAisd2sQ==
=JBUs
-----END PGP SIGNATURE-----

--cab7bvsyn2ss63v7--

--===============0831400731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0831400731==--
