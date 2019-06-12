Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EDE43677
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F59289A1A;
	Thu, 13 Jun 2019 13:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E3089A1A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:26:19 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr
 [90.88.159.246]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 88D46240015;
 Thu, 13 Jun 2019 13:26:09 +0000 (UTC)
Date: Wed, 12 Jun 2019 17:54:06 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 3/6] drm/modes: Allow to specify rotation and
 reflection on the commandline
Message-ID: <20190612155406.kjv6z7jk74bblfts@flea>
References: <cover.87b91639451f23d4ab68a7c9812f2dd158869025.1555591281.git-series.maxime.ripard@bootlin.com>
 <ba320b3a13c4444102b77c4d00f7c1dc810adc3c.1555591281.git-series.maxime.ripard@bootlin.com>
 <9ccb7573-d46e-4b90-7caa-7b8cd7b8e7a2@tronnes.org>
 <20190611124933.2g6l3d7nx6lqft6k@flea>
 <1d0d6259-54cb-9a26-003d-2a35b8a40f3f@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <1d0d6259-54cb-9a26-003d-2a35b8a40f3f@tronnes.org>
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
Content-Type: multipart/mixed; boundary="===============0400506826=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0400506826==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3wxmvvtbskp5zcmd"
Content-Disposition: inline


--3wxmvvtbskp5zcmd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2019 at 02:43:44PM +0200, Noralf Tr=F8nnes wrote:
> Den 11.06.2019 14.49, skrev Maxime Ripard:
> >>> +		} else if (!strncmp(option, "reflect_x", delim - option)) {
> >>> +			rotation |=3D DRM_MODE_REFLECT_X;
> >>> +			sep =3D delim;
> >>> +		} else if (!strncmp(option, "reflect_y", delim - option)) {
> >>
> >> I think you should drop reflect_x and _y for now since they're not
> >> supported. People like me that only reads code and not documentation
> >> (ahem..) will get the impression that this should work.
> >
> > I'm not sure what you mean here, this is definitely supposed to
> > work. Is there a limitation you're thinking of?
> >
>
> It's this one in drm_client_panel_rotation() which limits rotation to
> DRM_MODE_ROTATE_180:
>
> 	/*
> 	 * TODO: support 90 / 270 degree hardware rotation,
> 	 * depending on the hardware this may require the framebuffer
> 	 * to be in a specific tiling format.
> 	 */
> 	if (*rotation !=3D DRM_MODE_ROTATE_180 || !plane->rotation_property)
> 		return false;

Indeed, it doesn't work anymore since I rebased on your work. I'll fix
this, thanks!

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--3wxmvvtbskp5zcmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQEgHgAKCRDj7w1vZxhR
xVtoAP4s4HFc5+Xz+AXPD/wlio4qU+eBrbfl4+JEmTmEajYFegD/ZE7kOWnv9p2h
CSwUuDXLN0UExixZ6eKQuhZLzV4pdAg=
=axG9
-----END PGP SIGNATURE-----

--3wxmvvtbskp5zcmd--

--===============0400506826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0400506826==--
