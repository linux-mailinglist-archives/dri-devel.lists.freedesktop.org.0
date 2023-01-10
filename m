Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D187664724
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 18:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADE810E62E;
	Tue, 10 Jan 2023 17:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1E910E62E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 17:17:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pFIFU-0004lj-Os; Tue, 10 Jan 2023 18:17:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pFIFT-0057pq-Gg; Tue, 10 Jan 2023 18:17:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pFIFS-00BlHu-O4; Tue, 10 Jan 2023 18:17:18 +0100
Date: Tue, 10 Jan 2023 18:17:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 1/2] backlight: pwm_bl: configure pwm only once per
 backlight toggle
Message-ID: <20230110171718.w7ay7gd3nivprzrb@pengutronix.de>
References: <20230109204758.610400-1-u.kleine-koenig@pengutronix.de>
 <Y72PjEh8QuLdw1hw@aspen.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xxgulczgcvq2jgvs"
Content-Disposition: inline
In-Reply-To: <Y72PjEh8QuLdw1hw@aspen.lan>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xxgulczgcvq2jgvs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Daniel,

On Tue, Jan 10, 2023 at 04:17:16PM +0000, Daniel Thompson wrote:
> On Mon, Jan 09, 2023 at 09:47:57PM +0100, Uwe Kleine-K=F6nig wrote:
> > When the function pwm_backlight_update_status() was called with
> > brightness > 0, pwm_get_state() was called twice (once directly and once
> > in compute_duty_cycle). Also pwm_apply_state() was called twice (once in
> > pwm_backlight_power_on() and once directly).
> >
> > Optimize this to do both calls only once.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> This will reverse the order in which the regulator is toggled versus the
> PWM starting/stopping. It would be nice to that in the description.

Oh, that wasn't a concious choice. I agree this should be noted. The
current state is also a bit confused because the duty cycle is setup
before the regulator but the PWM only gets enabled afterwards.

Expect a v2 with an updated commit log.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xxgulczgcvq2jgvs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO9nZkACgkQwfwUeK3K
7AkQ4wgAl7ijOwjOlTvwIq/BaEuRvNSEKmzbya0rwCm24A2WzblV0fAoAccbT3u1
A8wGB3yxdu4VjAOJT/Wh5d8fbQYfnqYEuLrN9afMOGZaSh5IZUW3p30Sk/jHmA23
lJFMGNgycHQnTvJJ038I0zND3lnIsouoQhubHyIYfvaL3ODCalP4HTb6l+SAozc+
UkIiO10cnUVs7wixb2vRls8MICKASpVMAiqDupcFggZiK/5PQ3EEq3u704DnrLbk
EvzYggXV9ePrGAkgNfpdYZLiVevrkaSAu1mdNsMEk9Pv65A+nzEglhETNGkpOlpS
2IxCChH+r1cF7FT4mzp1Qzo/0xX7Jg==
=ZaRD
-----END PGP SIGNATURE-----

--xxgulczgcvq2jgvs--
