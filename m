Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053694B60B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D376E354;
	Wed, 19 Jun 2019 10:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614166E354
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:16:49 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 287CB240010;
 Wed, 19 Jun 2019 10:16:41 +0000 (UTC)
Date: Wed, 19 Jun 2019 12:16:41 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v5 07/12] drm/modes: Allow to specify rotation and
 reflection on the commandline
Message-ID: <20190619101641.5wimygyv7uoorylw@flea>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <777da16e42db757c1f5b414b5ca34507097fed5c.1560783090.git-series.maxime.ripard@bootlin.com>
 <a106a40f-4918-e9b6-2d58-f7ad9d7b191d@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <a106a40f-4918-e9b6-2d58-f7ad9d7b191d@tronnes.org>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1050780690=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1050780690==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ooppuouaxuwtdyr6"
Content-Disposition: inline


--ooppuouaxuwtdyr6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 07:47:04PM +0200, Noralf Tr=F8nnes wrote:
> > diff --git a/Documentation/fb/modedb.rst b/Documentation/fb/modedb.rst
> > index 3c2397293977..3e8a6f79dcd7 100644
> > --- a/Documentation/fb/modedb.rst
> > +++ b/Documentation/fb/modedb.rst
> > @@ -53,6 +53,17 @@ Specifying the option multiple times for different p=
orts is possible, e.g.::
> >
> >      video=3DLVDS-1:d video=3DHDMI-1:D
> >
> > +Options can also be passed after the mode, using commas as separator.
> > +
> > +       Sample usage: 720x480,rotate=3D180 - 720x480 mode, rotated by 1=
80 degrees
> > +
> > +Valid options are:
> > +
> > +  - reflect_x (boolean): Perform an axial symetry on the X axis
> > +  - reflect_y (boolean): Perform an axial symetry on the Y axis
>
> 2x s/symetry/symmetry/
>
> Reviewed-by: Noralf Tr=F8nnes <noralf@tronnes.org>

I've fixed it and applied, thanks for your reviews!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ooppuouaxuwtdyr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQoLiQAKCRDj7w1vZxhR
xevQAP4oliKdO/dVf2wqkYiOCk1yfQAhaUSoOLmGztmMGEjb4AD/Zr2FZZ5eP3ET
0J1ZV2aXZiVrrgLgXVqKIsVUPwxKlwE=
=8ysB
-----END PGP SIGNATURE-----

--ooppuouaxuwtdyr6--

--===============1050780690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1050780690==--
