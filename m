Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC763620
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 14:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2148969E;
	Tue,  9 Jul 2019 12:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11F58969E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 12:45:32 +0000 (UTC)
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 152E7200004;
 Tue,  9 Jul 2019 12:45:26 +0000 (UTC)
Date: Tue, 9 Jul 2019 14:45:26 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
Message-ID: <20190709124526.36szuriteq3jumhr@flea>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
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
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1893474156=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1893474156==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vcujhgabco7cibei"
Content-Disposition: inline


--vcujhgabco7cibei
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 05, 2019 at 07:54:47PM +0300, Dmitry Osipenko wrote:
> 17.06.2019 17:51, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Maxime Ripard <maxime.ripard@free-electrons.com>
> >
> > Rewrite the command line parser in order to get away from the state mac=
hine
> > parsing the video mode lines.
> >
> > Hopefully, this will allow to extend it more easily to support named mo=
des
> > and / or properties set directly on the command line.
> >
> > Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/drm_modes.c | 325 +++++++++++++++++++++++--------------
> >  1 file changed, 210 insertions(+), 115 deletions(-)
>
> I have a Tegra device that uses a stock android bootloader which
> passes "video=3Dtegrafb" in the kernels cmdline. That wasn't a problem
> before this patch, but now Tegra DRM driver fails to probe because
> the mode is 0x0:0 and hence framebuffer allocation fails. Is it a
> legit regression that should be fixed in upstream?

Thierry indeed reported that issue, but the discussion pretty much
stalled since then.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vcujhgabco7cibei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXSSMYQAKCRDj7w1vZxhR
xakIAP4+CIpP0/uIjF6b/BDiYxakJHM0UScucoPgY1Mh8fCrpwD/SLOeZeYOzZ3R
g10KDEYVYh0DflC+UIvy2n8COGx6YAw=
=FVma
-----END PGP SIGNATURE-----

--vcujhgabco7cibei--

--===============1893474156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1893474156==--
