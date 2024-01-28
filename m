Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0583F7FE
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 17:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C036E112746;
	Sun, 28 Jan 2024 16:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938E8112746
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 16:45:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rU8Fv-0002V2-20; Sun, 28 Jan 2024 17:43:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rU8Ft-002z8T-Uv; Sun, 28 Jan 2024 17:43:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rU8Ft-00AGqM-2m;
 Sun, 28 Jan 2024 17:43:37 +0100
Date: Sun, 28 Jan 2024 17:43:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>
Subject: Re: [PATCH] backlight: mp3309c: Use pwm_apply_might_sleep()
Message-ID: <apuuk7hi5233xi2ujou4ndovlkq5qr5rgbkoij2jsfi7rwxgbi@2nie6c53ru3z>
References: <20240128154905.407302-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kvi2qh5kgw6q2equ"
Content-Disposition: inline
In-Reply-To: <20240128154905.407302-1-sean@mess.org>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Flavio Suligoi <f.suligoi@asem.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kvi2qh5kgw6q2equ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sean,

On Sun, Jan 28, 2024 at 03:49:04PM +0000, Sean Young wrote:
> pwm_apply_state() is deprecated since commit c748a6d77c06a ("pwm: Rename
> pwm_apply_state() to pwm_apply_might_sleep()"). This is the final user
> in the tree.
>=20
> Signed-off-by: Sean Young <sean@mess.org>

The "problem" here is that the mp3309c driver didn't exist yet in commit
c748a6d77c06a, so it relies on the pwm_apply_state compatibility stub.

I would mention that in the commit log.

Otherwise the change looks fine.

thanks for catching and addressing this issue
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kvi2qh5kgw6q2equ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmW2hDMACgkQj4D7WH0S
/k769AgAuhICKH8tjWxmVW/U6B4fj9zEKtlPa3ebg5wrtKvlXBuwKhif676Epb1q
OCvuQNg5wsJ5MSngBPzpoGK+AL9Ew4oRzlNl+AUCpJUw/6IlhZXw/Ga0TLCdVuig
a6kz+rAq4/NDOck8BAhOqBjoo6xM4/4GDQaV3E39lJPQfZrtXWpJ407w6HvXor//
x9+7x7oIL3bLkBboHzkRFChlRvqsj6HIYLI9RNpBlJiu2MymHIOgN0SyyFILIA4Y
fv2DNlEZjceu6ubg+JdHd9nUFUDftD+bt979N6q8BXv9oz1nq/qTIpELI/f2UotK
NogEFu3nSIG56vcJAJZIimQ9qxbYtw==
=nndy
-----END PGP SIGNATURE-----

--kvi2qh5kgw6q2equ--
