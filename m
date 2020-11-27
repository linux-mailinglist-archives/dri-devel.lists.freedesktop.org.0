Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC9F2C6228
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 10:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789376EB72;
	Fri, 27 Nov 2020 09:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9986EB72
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 09:47:08 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kiaKC-0005UC-C7; Fri, 27 Nov 2020 10:45:56 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kiaK4-0002Ad-OH; Fri, 27 Nov 2020 10:45:48 +0100
Date: Fri, 27 Nov 2020 10:45:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] ALSA: ppc: drop if block with always false condition
Message-ID: <20201127094547.4zcyeycfrriitkqx@pengutronix.de>
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
 <CAMuHMdUbfT7ax4BhjMT_DBweab8TDm5e=xMv5f61t9QpQJt1mw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUbfT7ax4BhjMT_DBweab8TDm5e=xMv5f61t9QpQJt1mw@mail.gmail.com>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>, Paul Mackerras <paulus@samba.org>,
 scsi <linux-scsi@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Alan Stern <stern@rowland.harvard.edu>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>, netdev <netdev@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jim Paris <jim@jtan.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: multipart/mixed; boundary="===============1878314926=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1878314926==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="taccm5e5wyznne4d"
Content-Disposition: inline


--taccm5e5wyznne4d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 09:35:39AM +0100, Geert Uytterhoeven wrote:
> Hi Uwe,
>=20
> On Thu, Nov 26, 2020 at 6:03 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > The remove callback is only called for devices that were probed
> > successfully before. As the matching probe function cannot complete
> > without error if dev->match_id !=3D PS3_MATCH_ID_SOUND, we don't have to
> > check this here.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Thanks for your patch!
>=20
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> Note that there are similar checks in snd_ps3_driver_probe(), which
> can be removed, too:
>=20
>         if (WARN_ON(!firmware_has_feature(FW_FEATURE_PS3_LV1)))
>                 return -ENODEV;
>         if (WARN_ON(dev->match_id !=3D PS3_MATCH_ID_SOUND))
>                 return -ENODEV;

I had to invest some brain cycles here. For the first:

Assuming firmware_has_feature(FW_FEATURE_PS3_LV1) always returns the
same value, snd_ps3_driver_probe is only used after this check succeeds
because the driver is registered only after this check in
snd_ps3_init().

The second is superflous because ps3_system_bus_match() yields false if
this doesn't match the driver's match_id.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--taccm5e5wyznne4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/AyscACgkQwfwUeK3K
7AmVbAf/fRHKZiIEMqPckqCjNor4UCILZvO1NJYHzctpPGBT8dETRjBW1ZmWu6MS
qxv4y7aGSfc8pP5G0LU1rJJYOf7x8PpHEbm5uNM1UOIxzSIniALG7VIeoFIBrGoQ
QuMcTv73n6ypzsNu87ynqrILEVYNrubD+Sb6B2xZEfPbIcvvwKfUvr8+lBEkabHX
LbBbYbLL/ivRvUFm/YKvY3vcnTTAj88lURLp6V8EPT+8/TDr7Bfuy5LyjFsKAYsq
QXNTBRLT8unlG99XvN4urWFVs9NMPKKWgV/e14LGumeL+mM8EQi+UPCnMTPOErWb
F4a+SZgp6g00Syvd8mJVlWUKEkQUOg==
=P7Le
-----END PGP SIGNATURE-----

--taccm5e5wyznne4d--

--===============1878314926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1878314926==--
