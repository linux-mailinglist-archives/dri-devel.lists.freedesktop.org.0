Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096646A413
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 10:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4AA6E0CB;
	Tue, 16 Jul 2019 08:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA1A6E0CB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 08:43:35 +0000 (UTC)
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5A1CF100017;
 Tue, 16 Jul 2019 08:42:25 +0000 (UTC)
Date: Tue, 16 Jul 2019 10:42:25 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/modes: Don't apply cmdline's rotation if it
 wasn't specified
Message-ID: <20190716084225.6wf5lsdzukyb6cz5@flea>
References: <20190711021313.29445-1-digetx@gmail.com>
 <20190712195429.dlz5ofwoafciedcq@flea>
 <11723cfd-12d2-5810-70df-0e053352d648@gmail.com>
MIME-Version: 1.0
In-Reply-To: <11723cfd-12d2-5810-70df-0e053352d648@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1047263403=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1047263403==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="octe5474vzs7zgnm"
Content-Disposition: inline


--octe5474vzs7zgnm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 13, 2019 at 09:57:32PM +0300, Dmitry Osipenko wrote:
> 12.07.2019 22:54, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Jul 11, 2019 at 05:13:13AM +0300, Dmitry Osipenko wrote:
> >> The rotation mode from cmdline shouldn't be taken into account if it
> >> wasn't specified in the cmdline. This fixes ignored default display
> >> orientation when display mode is given using cmdline without the
> >> rotation being specified.
> >>
> >> Fixes: 1bf4e09227c3 ("drm/modes: Allow to specify rotation and reflect=
ion on the commandline")
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >
> > Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > Thanks!
> > Maxime
>
> Thank you. Please note that I'm not a DRM maintainer, hence either you
> should pick up and apply the patch by yourself or somebody else who has
> the commit rights will have do that. I guess Thierry could also pick up
> the patch into the Tegra's tree, but this patch is more DRM-generic.

Right, I've applied it now

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--octe5474vzs7zgnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXS2N8QAKCRDj7w1vZxhR
xZU/APwMSaCF6bmFUXlM1KJUOeNWQxXyRsoece/0gjVsiShCfAD+INMwbkotiFNg
3y6stSLHSrLJF4aCkziA0WYN6xwACQ4=
=/jaE
-----END PGP SIGNATURE-----

--octe5474vzs7zgnm--

--===============1047263403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1047263403==--
