Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D3B751F1D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE79188EFF;
	Thu, 13 Jul 2023 10:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9A788EFF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 10:40:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJtjb-0003Ca-Tt; Thu, 13 Jul 2023 12:39:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJtjZ-00E5zW-AT; Thu, 13 Jul 2023 12:39:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJtjY-004X1v-Bd; Thu, 13 Jul 2023 12:39:40 +0200
Date: Thu, 13 Jul 2023 12:39:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Message-ID: <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2qsf4jtfkz27ewzi"
Content-Disposition: inline
In-Reply-To: <874jm8go61.fsf@intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>, Julia Lawall <julia.lawall@inria.fr>,
 kernel@pengutronix.de, Sui Jingfeng <suijingfeng@loongson.cn>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2qsf4jtfkz27ewzi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jani,

On Thu, Jul 13, 2023 at 12:23:50PM +0300, Jani Nikula wrote:
> On Thu, 13 Jul 2023, Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> =
wrote:
> > after most feedback for my series "drm/crtc: Rename struct drm_crtc::dev
> > to drm_dev"[1] was positive in principle, here comes a new series.
>=20
> I find it obnoxious to send a new series within 24 hours of the first,
> while the discussion is still in progress, and it's a misrepresentation
> of the in-progress dicussion to say most of the feedback was positive.
>=20
> This is not the way to reach consensus.

Let me tell you I didn't had any obnoxious intentions when sending this
new series. I honestly still think that the feedback was mostly positive
to the idea to get rid of struct drm_device *dev. Most discussion was
about splitting the series and the right name to use instead of "dev".

The intention was more to signal: OK, I do it in one patch per rename
and OK I'll use "drm" and not "drm_dev".

> > I didn't call it v2 as it is different enough to stand on its own.
> >
> > The motivation is that "dev" (at least in my bubble) usually is a struct
> > device *, and it's irritating to see things like drm->dev->dev where drm
> > is a struct nouveau_drm *, drm->dev is a a struct drm_device * and
> > drm->dev->dev is a struct device *. (Obviously this series doesn't fix
> > this particular instance, but this is the intrusive part affecting
> > several drivers, the remainder is driver specific.)
>=20
> As I just replied in the first series [1], this is also a
> misrepresentation of the common practise in the kernel. It might just be
> your bubble, as you point out. There are tons of struct
> something_or_other *dev in kernel, which also have a dev member.

If I see something that I consider worth improving, I don't spend much
thought about what else is equally bad (or even worse) in other places.
And still less this should stop anyone to improve things. I tackled drm
because that was the subsystem that annoyed me yesterday.

If you say you consider the idea bad or too costly to implement, that's
fine. But pointing to other areas that are bad shouldn't be a relevant
reason to shoot down this effort.

> Is it just drm that annoys you, or are you planning on changing all of
> the others too?

I plan to complete the drm one, the others should not matter here. (But
see my longer reply to that in the previous thread.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2qsf4jtfkz27ewzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSv1GsACgkQj4D7WH0S
/k6cuggAq1pjcq1CrMHP6147P2HJI3nCIYCMZMG+TudlynDmeVcKMeCiYA8Gy+Sh
iopLhAsUUhUs5un0f0k+anxnYHr/sL8si67V+AXx41YQh1YJ8Noid0JjKWe2iWNR
E9530dNs8URffPNagso9mJahLtL7J8Di793oBnsZmQGh2XT6+J1N4DBovCqcZbg7
uUVtaUcE1IdZBJNlHWiRoPO6jpQUDb1AdbJJZmoQuTnOqmiY1V1o+FNr8FRQPzPM
fpfgpUmsd6HPCiDD8728A8XSWPx01OnP4dAaqsnjSijmP7qGgkwU0bMWTG9DVX1i
iL+TGGjJN1CIBktB8FckCMyF5e34eA==
=wJ++
-----END PGP SIGNATURE-----

--2qsf4jtfkz27ewzi--
