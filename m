Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C148C87C3
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 16:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E4210EEE9;
	Fri, 17 May 2024 14:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=scrumplex.net header.i=@scrumplex.net header.b="f1wruILn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF70910EEE9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:14:21 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4VgpqZ0JgMz9slm;
 Fri, 17 May 2024 16:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scrumplex.net;
 s=MBO0001; t=1715955258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Krj7syU7x2ImtItEp9UbLWBRW19wRb6qinxU3qC3s44=;
 b=f1wruILn0hYACOjbwTh5K4Dqulo6rJkkslcBjPXYBVRl8j2MuhagfCCYt7M42LpzCal0+r
 a70Bwm8aZkAn6vLWCYCdBm+02Z54+SJG35S34ZCyGXRLzS4Vd4n3sz8kn+O4NMZJnCDsS8
 JsCOPU0n7JGibYDjNLAc495bVnIAZIwDec/EZ8DyW/ZY1WPipV/8j59IpXyO1//Yeu0pOC
 /3GaqiUMK/kLuYmB1mGaS6gjAo8FouEBi4WbmDB8Jj9pN6dTgEkU0PG3ROe6Hog6BcUJ/M
 mOaV0Slm6YHAOC82oYSd72slwlpuAyNfUzyHDA63rz6vExacVCYYWy6gaB3nwA==
Message-ID: <f79b97e99f70ffcc99942df25c1c92267baef68f.camel@scrumplex.net>
Subject: Re: [PATCH] drm/edid: add non-desktop quirk to Bigscreen Beyond HMD
From: Sefa Eyeoglu <contact@scrumplex.net>
To: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Date: Fri, 17 May 2024 16:14:16 +0200
In-Reply-To: <874jawbnut.fsf@intel.com>
References: <20240517105555.654262-1-contact@scrumplex.net>
 <874jawbnut.fsf@intel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-owcFmrIUIDwaBWkK5/wN"
MIME-Version: 1.0
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


--=-owcFmrIUIDwaBWkK5/wN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

I have just just posted a modified patch with a link to the issue.

Best,
Sefa

On Fri, 2024-05-17 at 15:54 +0300, Jani Nikula wrote:
> On Fri, 17 May 2024, Sefa Eyeoglu <contact@scrumplex.net> wrote:
> > The Bigscreen Beyond VR headset is a non-desktop output and should
> > be
> > marked as such using an EDID quirk.
>=20
> I'd appreciate a bug being filed at [1], attaching the EDID of the
> panel
> there, maybe dmesg with drm.debug=3D14 enabled too, and referencing the
> bug in the commit message. It gets terribly hard to figure anything
> out
> about the quirks afterwards when some time has passed.
>=20
> Thanks,
> Jani.
>=20
>=20
>=20
> [1] https://gitlab.freedesktop.org/drm/misc/kernel/-/issues
>=20
> >=20
> > Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
> > ---
> > =C2=A0drivers/gpu/drm/drm_edid.c | 3 +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_edid.c
> > b/drivers/gpu/drm/drm_edid.c
> > index 4f54c91b31b2..d407efc0fb55 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -200,6 +200,9 @@ static const struct edid_quirk {
> > =C2=A0	/* Rotel RSX-1058 forwards sink's EDID but only does HDMI
> > 1.1*/
> > =C2=A0	EDID_QUIRK('E', 'T', 'R', 13896, EDID_QUIRK_FORCE_8BPC),
> > =C2=A0
> > +	/* Bigscreen Beyond Headset */
> > +	EDID_QUIRK('B', 'I', 'G', 0x1234, EDID_QUIRK_NON_DESKTOP),
> > +
> > =C2=A0	/* Valve Index Headset */
> > =C2=A0	EDID_QUIRK('V', 'L', 'V', 0x91a8, EDID_QUIRK_NON_DESKTOP),
> > =C2=A0	EDID_QUIRK('V', 'L', 'V', 0x91b0, EDID_QUIRK_NON_DESKTOP),
>=20


--=-owcFmrIUIDwaBWkK5/wN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQThcyN6x4IpbZj1razhPf1LRxJ5UQUCZkdmOAAKCRDhPf1LRxJ5
UW1rAQDUykP8xn+t+IV6blWA+OA83fznke2xeVHtr+Bz5JFtogD+IlpWdX/ginpu
ljMhc4D0JCTkOdAFdUfTOW0sqBkB2Qk=
=X/M1
-----END PGP SIGNATURE-----

--=-owcFmrIUIDwaBWkK5/wN--
