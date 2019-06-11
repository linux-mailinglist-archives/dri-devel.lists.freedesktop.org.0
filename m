Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A5F3CC1F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 14:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9357C8916D;
	Tue, 11 Jun 2019 12:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55C58916D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 12:49:42 +0000 (UTC)
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr
 [90.88.159.246]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6E576E000B;
 Tue, 11 Jun 2019 12:49:33 +0000 (UTC)
Date: Tue, 11 Jun 2019 14:49:33 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 3/6] drm/modes: Allow to specify rotation and
 reflection on the commandline
Message-ID: <20190611124933.2g6l3d7nx6lqft6k@flea>
References: <cover.87b91639451f23d4ab68a7c9812f2dd158869025.1555591281.git-series.maxime.ripard@bootlin.com>
 <ba320b3a13c4444102b77c4d00f7c1dc810adc3c.1555591281.git-series.maxime.ripard@bootlin.com>
 <9ccb7573-d46e-4b90-7caa-7b8cd7b8e7a2@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <9ccb7573-d46e-4b90-7caa-7b8cd7b8e7a2@tronnes.org>
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
Content-Type: multipart/mixed; boundary="===============2144273989=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2144273989==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qcampvemx35tqlo2"
Content-Disposition: inline


--qcampvemx35tqlo2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Noralf,

On Thu, Apr 18, 2019 at 06:40:42PM +0200, Noralf Tr=F8nnes wrote:
> Den 18.04.2019 14.41, skrev Maxime Ripard:
> > +	/**
> > +	 * We want the rotation on the command line to overwrite
> > +	 * whatever comes from the panel.
> > +	 */
> > +	cmdline =3D &connector->cmdline_mode;
> > +	if (cmdline->specified &&
> > +	    cmdline->rotation !=3D DRM_MODE_ROTATE_0)
>
> I believe you need to drop that second check, otherwise rotate=3D0 will
> not overwrite panel rotation.

Good catch :)

> > +		} else if (!strncmp(option, "reflect_x", delim - option)) {
> > +			rotation |=3D DRM_MODE_REFLECT_X;
> > +			sep =3D delim;
> > +		} else if (!strncmp(option, "reflect_y", delim - option)) {
>
> I think you should drop reflect_x and _y for now since they're not
> supported. People like me that only reads code and not documentation
> (ahem..) will get the impression that this should work.

I'm not sure what you mean here, this is definitely supposed to
work. Is there a limitation you're thinking of?

> Documentation/fb/modedb.txt needs to be updated with this new video=3D op=
tion.

Will do, thanks!

maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qcampvemx35tqlo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP+jXQAKCRDj7w1vZxhR
xfvrAP9E0DKrTicqOvNTKzLaonrYJBPMZrJqQy+sMFs5mjktOQEAt/lC2+QSLYLS
AvMY9R0PCv5cW1OINZYN9NIDKX6x/wM=
=SS1e
-----END PGP SIGNATURE-----

--qcampvemx35tqlo2--

--===============2144273989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2144273989==--
