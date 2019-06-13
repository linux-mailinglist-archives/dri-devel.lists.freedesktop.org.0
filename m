Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924543679
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA5F89A16;
	Thu, 13 Jun 2019 13:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E2389A16
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:26:27 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr
 [90.88.159.246]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 465A424000D;
 Thu, 13 Jun 2019 13:26:24 +0000 (UTC)
Date: Thu, 13 Jun 2019 14:50:24 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 3/6] drm/modes: Allow to specify rotation and
 reflection on the commandline
Message-ID: <20190613125024.46yiiy6zrrqojajy@flea>
References: <cover.87b91639451f23d4ab68a7c9812f2dd158869025.1555591281.git-series.maxime.ripard@bootlin.com>
 <ba320b3a13c4444102b77c4d00f7c1dc810adc3c.1555591281.git-series.maxime.ripard@bootlin.com>
 <9ccb7573-d46e-4b90-7caa-7b8cd7b8e7a2@tronnes.org>
 <e2edb1dc-f719-93f0-5205-ecb7b44b057e@tronnes.org>
 <20190611132049.njlrgbtobzgyzyzh@flea>
 <c73e9c29-e20b-65e0-553c-67b9c2cd349a@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <c73e9c29-e20b-65e0-553c-67b9c2cd349a@tronnes.org>
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
Content-Type: multipart/mixed; boundary="===============0208933294=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0208933294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ydwumpiccsdbmew2"
Content-Disposition: inline


--ydwumpiccsdbmew2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2019 at 03:21:19PM +0200, Noralf Tr=F8nnes wrote:
> >> The only way I see for that to happen, is to set
> >> ->panel_orientation. And to repeat myself, imo that makes
> >> 'orientation' a better name for this video=3D option.
> >
> > orientation and rotation are two different things to me. The
> > orientation of a panel for example is absolute, while the rotation is
> > a transformation. In this particular case, I think that both the
> > orientation and the rotation should be taken into account, with the
> > orientation being the default state, and the hardware / panel will
> > tell us that, while the rotation would be a transformation from that
> > default to whatever the user wants.
> >
> > More importantly, the orientation is a property of the hardware (ie,
> > how the display has been assembled), while the rotation is a software
> > construct.
> >
> > And if the property being used to expose that is the rotation, I guess
> > it would make sense to just use the same name and remain consistent.
>
> Ok, I see. Based on this, I would assume that rotation would be relative
> to the orientation, but I see that in this patch rotation doesn't take
> orintation into account, it just overwrites it.

Yeah, that's a good point. I've updated the next version to add the
rotation on the command line to the orientation.

> I don't how userspace deals with rotation on top of orientation.

The orientation is exposed through the property, and the result is
available through the plane's rotation, so I guess that it's enough?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ydwumpiccsdbmew2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQJGkAAKCRDj7w1vZxhR
xSzYAP461yNEAGBB4hTUD6C0V9uVqt4QG/X4SknIL59OkTehOgD+I38CsWEUTkXK
TCnMtoCnqwx3576oXEw162ikosk6ow4=
=MGnC
-----END PGP SIGNATURE-----

--ydwumpiccsdbmew2--

--===============0208933294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0208933294==--
