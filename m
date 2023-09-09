Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25959799B32
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 22:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E33110E14B;
	Sat,  9 Sep 2023 20:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1084 seconds by postgrey-1.36 at gabe;
 Sat, 09 Sep 2023 20:39:34 UTC
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6750510E14B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 20:39:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qf4SA-0000Iw-Ci; Sat, 09 Sep 2023 22:21:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qf4S7-005Ann-7d; Sat, 09 Sep 2023 22:21:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qf4S6-000E4T-GZ; Sat, 09 Sep 2023 22:21:10 +0200
Date: Sat, 9 Sep 2023 22:21:10 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 2/3] video: fbdev: ssd1307fb: Print the PWM's label
 instead of its number
Message-ID: <20230909202110.bcz5qvb7bfrzco73@pengutronix.de>
References: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
 <20230728145824.616687-3-u.kleine-koenig@pengutronix.de>
 <87lef0xcw4.fsf@minerva.mail-host-address-is-not-set>
 <87zg1vif8b.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fur7e2akxpm43452"
Content-Disposition: inline
In-Reply-To: <87zg1vif8b.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Jilin Yuan <yuanjilin@cdjrlc.com>, kernel@pengutronix.de,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fur7e2akxpm43452
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Sep 09, 2023 at 04:38:28PM +0200, Javier Martinez Canillas wrote:
> Javier Martinez Canillas <javierm@redhat.com> writes:
>=20
> > Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> writes:
> >
> >> struct pwm_device::pwm is a write-only variable in the pwm core and us=
ed
> >> nowhere apart from this and another dev_dbg. So it isn't useful to
> >> identify the used PWM. Emit the PWM's label instead in the debug
> >> message.
> >>
> >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >> ---
> >
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> >
>=20
> Pushed to drm-misc (drm-misc-next). Thanks!

JFTR: This patch is already in linus/master. And Javier pushed
"drm/ssd130x: Print the PWM's label instead of its number" to
drm-misc-next which is great. So the "Pushed to ..." mail is just in
reply to the wrong patch in this thread and in git everything is fine.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fur7e2akxpm43452
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmT807UACgkQj4D7WH0S
/k5gEAgApJDMf6qFSjEhYdieBJ4vC6YIQlzyH4Ro807Y/FwmsB/0Vt2x6N3Mx4TF
kVgD5VDwiYViHskX9/UK7iqa7K2dkLExcIK7hLL5PZRhf2BGEOk/JapbypBHNm9m
cT4h1m3DnThc4av2TbnfKg6SlhwYTb++RDjOSc3kzqVegwQEThB1OvTKXzrawKXz
hYJDn/iwa7k5aD/nviy1yhqyQROqeNrtEMswo+I2T887iRIM/h/mKg78J7Rr98FT
bigt5kxPEhoLCRb3pB+bXe6NIFF1uiG0qmGtu+Zad9/Onm4fbMg1xNSJX+nMY8hO
nd1Jl1ph/9uYigX4HJCUX/DSHXSiGA==
=F+dV
-----END PGP SIGNATURE-----

--fur7e2akxpm43452--
