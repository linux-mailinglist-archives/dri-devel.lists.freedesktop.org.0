Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3DB87BB9A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 11:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEE310FA51;
	Thu, 14 Mar 2024 10:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2D210FA51
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 10:56:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rkil9-0003Sm-F8; Thu, 14 Mar 2024 11:56:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rkil8-006IHm-3C; Thu, 14 Mar 2024 11:56:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rkil8-005zWW-00;
 Thu, 14 Mar 2024 11:56:26 +0100
Date: Thu, 14 Mar 2024 11:56:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: linux-pwm@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Subject: Re: [PATCH] backlight: lp8788: Drop support for platform data
Message-ID: <ccvjubtxqqd445yb6g5smjko6p3d3ss337waqeoaray2imogyx@zo5hhnbipokv>
References: <20240313124828.861731-2-u.kleine-koenig@pengutronix.de>
 <7nvqboywxhviyuzkiesy4qfqybxx7vc5sw2seluc3dwnhk3q5h@hlzwxhnm2q6r>
 <20240314102035.GI1522089@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ozpx575aexkagfrb"
Content-Disposition: inline
In-Reply-To: <20240314102035.GI1522089@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ozpx575aexkagfrb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Lee,

On Thu, Mar 14, 2024 at 10:20:35AM +0000, Lee Jones wrote:
> On Wed, 13 Mar 2024, Uwe Kleine-K=F6nig wrote:
> > On Wed, Mar 13, 2024 at 01:48:27PM +0100, Uwe Kleine-K=F6nig wrote:
> > >  struct lp8788_bl {
> > >  	struct lp8788 *lp;
> > >  	struct backlight_device *bl_dev;
> > > -	struct lp8788_backlight_platform_data *pdata;
> > > -	enum lp8788_bl_ctrl_mode mode;
> > >  	struct pwm_device *pwm;
> >=20
> > Actually this pwm_device member should be dropped, too. I wonder why
> > this even passes a W=3D1 build without a warning ...
> >=20
> > @Lee: Feel free to fix this up while applying, or tell me if you prefer
> > an incremental fixup or a complete v2.
>=20
> Either of the last 2 options would be fine.

I'd prefert a v2 then. Added to my today's todo list.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ozpx575aexkagfrb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXy19kACgkQj4D7WH0S
/k4nfAf+OQrf3llV5RSiTXvYqQ5I+p8EfNgaMwsW7vdlhFNXtVZRVorG1ikkWhSD
xa+tG8NM7HdSqfd+wtGF13UVzsXtQXgn7ILWePxen58V/rHq3VVYFn+wk7o2ciJB
B5Z9mZKLN2VSHR9AbJiOXCF8Ij0ROr83wqtkkH6Ahv/cWRbN6oyXMU3ECmQIBaFB
P8777pkXgGBslkn0YfIBQwrWT+gTXC9Yr+ptH1rr/B0VoPvhtB03epw5698eUk4h
ppoBrpQegRwd+MFwVMb+36wFx1LPpMK432J1uNe7OPbX6QC7Fzq6+p8tDJckUX2L
/mVGM3JtStRsgL9hY8kZNSaVeIgCoQ==
=rMia
-----END PGP SIGNATURE-----

--ozpx575aexkagfrb--
