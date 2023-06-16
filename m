Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E210E7326EE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 07:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE8910E07B;
	Fri, 16 Jun 2023 05:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F7110E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:58:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qA2Tu-0003N8-B4; Fri, 16 Jun 2023 07:58:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qA2Tt-007kRp-0r; Fri, 16 Jun 2023 07:58:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qA2Ts-00Eetj-4V; Fri, 16 Jun 2023 07:58:44 +0200
Date: Fri, 16 Jun 2023 07:58:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i2c: Switch i2c drivers back to use .probe()
Message-ID: <20230616055844.rgmi5hu6sghgttil@pengutronix.de>
References: <20230611202740.826120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q5q2doqv4uqwuhsz"
Content-Disposition: inline
In-Reply-To: <20230611202740.826120-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
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
Cc: Wolfram Sang <wsa@kernel.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--q5q2doqv4uqwuhsz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Jun 11, 2023 at 10:27:40PM +0200, Uwe Kleine-K=F6nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.

It would be great if this patch made it into 6.5-rc1, as I intend to
send a patch series to Wolfram after the upcoming merge window to drop
=2Eprobe_new to go in via the i2c tree. There are a few remaining
driver instances that I will have to fix in this series, but I'm happy
about every patch that goes in via its designated tree beforehand.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--q5q2doqv4uqwuhsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSL+hMACgkQj4D7WH0S
/k4OWggAoY3h301SPDQlsWVxP6+fG33PCufuzxkatkthzNpKGSD7iOpokvlEjwQ8
x4QpRRDM91omgnJOZZfYJ4BGDFQhuuSCxHI5x2bfLljjf/I7x+E47pQFOqatZm8H
Un0wEy0wnHFHFSx9BZ2DAW2x8YNavKzc3JMTyywxgerOrvcOU/6ch6tniIg8pbh/
NffGkDqAjl7t7k3r3wit1+fOdj88ntweRXrBFg0AG0KG/8kmjS3hI3yXBkGjX2Yd
B75JfHZVZPZ1i+QUUahO1uDL+zZnHAkawbroEju8SyRPV4z7G+MHDVltuAnGFKdR
7iBb1rEL9+KkbBZ3s9IRHY6Y4WmWAg==
=bYzH
-----END PGP SIGNATURE-----

--q5q2doqv4uqwuhsz--
