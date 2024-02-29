Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C078C86C34E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D74C10E270;
	Thu, 29 Feb 2024 08:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QczWfHG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2454F10E270
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:21:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5DC1E61AA9;
 Thu, 29 Feb 2024 08:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8947EC433C7;
 Thu, 29 Feb 2024 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709194870;
 bh=rKNBuW8y42BsiMkdbpdNnHpLhtnB04eGCNz7vyIXnxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QczWfHG9UEVVneRoWGMmkbXgEyytmMYUnY0vq0Xqa8LEOaqYopuX3t2SOmx7tPnDi
 5ErLtcwULad5ImD9cSc4VNAJzeV3kNE8fII3cTAArBCbP36gk/RxzeSFDG2afemaNA
 ljXEtuBQ4OWfw0NLheod+v/Ji13oBMpOGFCuzPyl7JBbST1xFwYtWpADLaW5H+LP1v
 9fIrYihed70QhFj1yY+USRvi7MnuZG+nDGlJSKqu74xfZWMilc1RZpZojpMF0DTRaj
 iwIEP/We2Cz54zhMj2sBh6YU1/UtQwwVjM418FIOd3qck6jUe2XsGzb7wb673WJGt7
 9BtH7SEABSIpg==
Date: Thu, 29 Feb 2024 09:21:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "Simek, Michal" <michal.simek@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] drm/atomic-helper: Add select_output_bus_format
 callback
Message-ID: <20240229-crane-of-eternal-joy-f675d7@houat>
References: <20240226-dp-live-fmt-v1-0-b78c3f69c9d8@amd.com>
 <20240226-dp-live-fmt-v1-4-b78c3f69c9d8@amd.com>
 <20240228-nifty-flashy-shrew-905edc@houat>
 <PH7PR12MB7163136599B97B071979E72EE6582@PH7PR12MB7163.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rs5ri76nt4anyhzn"
Content-Disposition: inline
In-Reply-To: <PH7PR12MB7163136599B97B071979E72EE6582@PH7PR12MB7163.namprd12.prod.outlook.com>
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


--rs5ri76nt4anyhzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 28, 2024 at 10:00:19PM +0000, Klymenko, Anatoliy wrote:
> > > diff --git a/include/drm/drm_modeset_helper_vtables.h
> > > b/include/drm/drm_modeset_helper_vtables.h
> > > index 881b03e4dc28..7c21ae1fe3ad 100644
> > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > @@ -489,6 +489,37 @@ struct drm_crtc_helper_funcs {
> > >  				     bool in_vblank_irq, int *vpos, int *hpos,
> > >  				     ktime_t *stime, ktime_t *etime,
> > >  				     const struct drm_display_mode *mode);
> > > +
> > > +	/**
> > > +	 * @select_output_bus_format
> > > +	 *
> > > +	 * Called by the first connected DRM bridge to negotiate input media
> > > +	 * bus format. CRTC is expected to pick preferable media formats fr=
om
> > > +	 * the list supported by the DRM bridge chain.
> >=20
> > There's nothing restricting it to bridges here. Please rephrase this to=
 remove the
> > bridge mention. The user is typically going to be the encoder, and brid=
ges are just
> > an automagic implementation of an encoder.
> >=20
>=20
> OK. I'll fix than in the next version.
>=20
> > And generally speaking, I'd really like to have an implementation avail=
able before
> > merging this.
> >
>=20
> Well, 2 instances of this callback implementations exist as drafts, as
> this is the new API. A little bit of a chicken and egg problem. I'll
> try to groom at least one of them into upstreamable shape and attach
> it to the patch set.

That's totally what I meant :)

I basically don't want to have an interface that isn't used. If you
provide an implementation in the same series, it's totally reasonable

Maxime

--rs5ri76nt4anyhzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeA+cgAKCRDj7w1vZxhR
xQLtAP9/fGoxq0DXjo7CwyIuSIvVRUO1zC+/mQvsS2T+X6Z0gQD/aTj1xrt+ImK+
u6CAeB4rSGry8XnZlOByE/CzK+HDXwM=
=dkG1
-----END PGP SIGNATURE-----

--rs5ri76nt4anyhzn--
