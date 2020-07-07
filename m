Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF55216754
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8162A6E509;
	Tue,  7 Jul 2020 07:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5D36E50C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 07:25:04 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jshyN-00071J-9e; Tue, 07 Jul 2020 09:24:59 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jshyM-0007cr-07; Tue, 07 Jul 2020 09:24:58 +0200
Date: Tue, 7 Jul 2020 09:24:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 11/15] pwm: crc: Implement get_state() method
Message-ID: <20200707072457.6bb6vqif355fbs26@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-12-hdegoede@redhat.com>
 <20200622075730.lenaflptqnemagff@taurus.defre.kleine-koenig.org>
 <59babd32-9421-0b31-187f-ceff7c003f54@redhat.com>
MIME-Version: 1.0
In-Reply-To: <59babd32-9421-0b31-187f-ceff7c003f54@redhat.com>
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
 kernel@pengutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1146560629=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1146560629==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5o57lf2673xp25na"
Content-Disposition: inline


--5o57lf2673xp25na
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Hans,

On Mon, Jul 06, 2020 at 11:05:20PM +0200, Hans de Goede wrote:
> Before I post a new version of this patch-set, you have only responded
> to some of the PWM patches in this set. Do you have any remarks on the
> other PWM patches ?

I stopped looking at them as I hoped someone would appear with a
datasheet. Given that this probably won't happen I can take a look at
the remaining patches.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5o57lf2673xp25na
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8EI0YACgkQwfwUeK3K
7Al5ygf/Vo2MCrxebQA7I8RHxSI5JD/fpUazpfqXoJruzxMkaR87VXdj0S1+ayNc
mtVoPaEadgJc3Gwt7jEAqod7zUQA1lABJS47piDlaDE7v9Dq+ZBMp6KIqGTxKa4C
i4XFpjD5ktWpuWU6c34yYkDDmyYUyzWZe1SxYcjWpfK6TnGAuJe78RmTyNcEnE61
9cGSYyki+SQfIrQtbjQJIMi6Nhmt6c+yT7FgnbDAoJoGBsLY+UShQgSfWfxVre/r
VUArL2ALscRIielEbRjKYg3Kx83TkfzRUdaonnLlmSw15x7cTjXEXQNBZXf7WG3a
YXACfmrQaGmlrRETxX5y/PB1jbzrEQ==
=8rxl
-----END PGP SIGNATURE-----

--5o57lf2673xp25na--

--===============1146560629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1146560629==--
