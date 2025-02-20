Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79B5A3D719
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C7A10E92E;
	Thu, 20 Feb 2025 10:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lD4PLTS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AEA10E935
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:44:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B15865C5E2A;
 Thu, 20 Feb 2025 10:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7011DC4CED1;
 Thu, 20 Feb 2025 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740048280;
 bh=QdnLOdbwze+Z7nnS8Qtd6HFKQsNPKg5feItWdZjhzQA=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=lD4PLTS6TudaxomaNN8h8s3GiOhqP866T58KA3NBmnusi3JHYJaPw+7rYilrrUm92
 Pxi8qN2d+vNtBLsS89hhAqtKIlq5gwdvjNMkqXeUgelIvdNOCXodBFf9AcHBglowPe
 +YZUlBU95iY1bKHNRnBo0KcOm68zWO27s8TV5DdvmN1R1GlB+finU8rMsECM0NVoWC
 4YVnTADNfRQAzDx32cdbvDM6NJB9HHNlHIL/abGCGUc0Lf1cE5vjBqiulXQ+5k4UMa
 zK5sYVEvRxO2pJIqRBhcTgNNxHe/JMgPC+7zWRiFEaN/PCDG5Z+kkLaNKw0aeEBzS2
 5frI9Tj9VoR3Q==
Date: Thu, 20 Feb 2025 11:44:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/atomic-helper: Introduce
 drm_atomic_helper_reset_crtc()
Message-ID: <20250220-wooden-robin-of-discussion-6a36f1@houat>
References: <20250203145824.155869-1-herve.codina@bootlin.com>
 <20250203145824.155869-3-herve.codina@bootlin.com>
 <Z7XfnPGDYspwG42y@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="sazin6zoxnxaivny"
Content-Disposition: inline
In-Reply-To: <Z7XfnPGDYspwG42y@phenom.ffwll.local>
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


--sazin6zoxnxaivny
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/atomic-helper: Introduce
 drm_atomic_helper_reset_crtc()
MIME-Version: 1.0

On Wed, Feb 19, 2025 at 02:41:48PM +0100, Simona Vetter wrote:
> On Mon, Feb 03, 2025 at 03:58:21PM +0100, Herve Codina wrote:
> > drm_atomic_helper_reset_crtc() allows to reset the CRTC active outputs.
> >=20
> > This resets all active components available between the CRTC and
> > connectors.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
> >  include/drm/drm_atomic_helper.h     |  2 ++
> >  2 files changed, 43 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index 8ed186ddaeaf..cac807df8a86 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -3363,6 +3363,47 @@ int drm_atomic_helper_disable_all(struct drm_dev=
ice *dev,
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_disable_all);
> > =20
> > +/**
> > + * drm_atomic_helper_reset_crtc - reset the active outputs of a CRTC
> > + * @crtc: DRM CRTC
> > + * @ctx: lock acquisition context
> > + *
> > + * Reset the active outputs by indicating that connectors have changed.
> > + * This implies a reset of all active components available between the=
 CRTC and
> > + * connectors.
>=20
> I think you definitely want a
>=20
> 	Note: This relies on resetting &drm_crtc_state.connectors_changed.
> 	For drivers which optimize out unnecessary modesets this will
> 	result in a no-op commit, achieving nothing.
>=20
> > + *
> > + * Returns:
> > + * 0 on success or a negative error code on failure.
> > + */
> > +int drm_atomic_helper_reset_crtc(struct drm_crtc *crtc,
> > +				 struct drm_modeset_acquire_ctx *ctx)
>=20
> So this is pretty close to DP drivers doing link-retraining when
> reconnecting a cable. Would be really nice if that could also be rolled
> out there where it fits, and maybe augment the documentation accordingly
> so that dp helpers point at this?

Given that the patch is already merged, Herve, could you send a
subsequent patch fixing up the doc at least?

Thanks,
Maxime

--sazin6zoxnxaivny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7cHkQAKCRAnX84Zoj2+
ds+MAYC/BR2Vx1K17429juM8mK9tjDBY052YeH/htYIsXGKrjlYjXJQltCijsjUy
8UXjzd4Bf0fCEBXGfd5yCPGkDfvBf+HeZb6Ea5OLwgJv0KXBLfAONIF8FT8gojhx
0PoxTPpBUw==
=iyS/
-----END PGP SIGNATURE-----

--sazin6zoxnxaivny--
