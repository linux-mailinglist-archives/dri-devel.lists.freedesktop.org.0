Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3875C826D1B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 12:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B7910E1F5;
	Mon,  8 Jan 2024 11:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F216210E1F5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 11:46:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rMo5P-0002a4-7b; Mon, 08 Jan 2024 12:46:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rMo5N-001ErC-IJ; Mon, 08 Jan 2024 12:46:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rMo5N-004rXs-1T;
 Mon, 08 Jan 2024 12:46:29 +0100
Date: Mon, 8 Jan 2024 12:46:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v2 1/2] platform_device: add devres function region-reqs
Message-ID: <ixywpvuwlhdpv6szvssipy2ygjhzdvt6nrbcppy4yx5ix5b3is@pq7s6hpse2ni>
References: <20240108092042.16949-2-pstanner@redhat.com>
 <20240108092042.16949-3-pstanner@redhat.com>
 <hywkbwwwkddbd5vye366bhz64dlpet4chv3kzwfu5dx6rvvix6@2jnk3xx6vfiy>
 <404aea6b7bb7874064153044f04f3b8f6fccb97b.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4r5afev3r6p7skdi"
Content-Disposition: inline
In-Reply-To: <404aea6b7bb7874064153044f04f3b8f6fccb97b.camel@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, David Gow <davidgow@google.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4r5afev3r6p7skdi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2024 at 10:45:31AM +0100, Philipp Stanner wrote:
> On Mon, 2024-01-08 at 10:37 +0100, Uwe Kleine-K=F6nig wrote:
> > Other than that I indifferent if this is a good idea. There are so many
> > helpers around these functions ...
>=20
> Around which, the devres functions in general? There are, but that's
> kind of the point, unless we'd want everyone to call into the lowest
> level region-request functions with their own devres callbacks.
>=20
> In any case: What would your suggestion be, should parties who can't
> (without restructuring very large parts of their code) ioremap() and
> request() simultaneously just not use devres? See my patch #2
> Or is there another way to reach that goal that I'm not aware of?

This wasn't a constructive feedback unfortunately and more a feeling
than a measurable criticism. To actually improve the state, maybe first
check what helpers are actually there, how they are used and if they are
suitable to what they are used for.

Having many helpers is a hint that the usage is complicated. Is that
because the situation is complicated, or is this just a big pile of
inconsistency that can be simplified and consolidated?

Also I think there are helpers that take a resource type parameter (as
your function) and others hard code it in the function name. Maybe
unifying that would be nice, too.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4r5afev3r6p7skdi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWb4I8ACgkQj4D7WH0S
/k6x9wf/RNngXMX4s0qPs1qC/g9icFOmmH2DMWt97cJ3/OzyVs7x1qTteymH2ANR
NGt8HE68vKkFyM6QoZz1z/1qAcMZLHWSO44ok7+cYVXfROHiVKe5/13ofkObfyMh
8aUYI/XXd/PXmXrWuxiCyCH8IdWoiBryBqd9DOWrssjqOb/QZyC0y4Mj34gDGWF2
dC/M0HByG8TnH/KPydYys5sHf68xdVTsDhABJtxNo/vDMc0yBdB8dzmb02GjM8Qy
kC6odjtco3TBr5tPAJENW1F2pn7Rm3bMBeLEjwo68oAHTKrqpzkUo/v2rbo11MOf
+NFUHJXT9gfOOY1B6rdzcT2WPmu+TQ==
=38uX
-----END PGP SIGNATURE-----

--4r5afev3r6p7skdi--
