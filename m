Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32E9A5BA76
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 09:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F2410E522;
	Tue, 11 Mar 2025 08:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U/h7PXgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD32410E521;
 Tue, 11 Mar 2025 08:07:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74BF45C41E3;
 Tue, 11 Mar 2025 08:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951E6C4CEE9;
 Tue, 11 Mar 2025 08:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741680432;
 bh=ZtI3BPfxkUxUFIHbmyl6XFRwlrtyk7qksexHnsdaz0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U/h7PXgMOSAGbndHGkKUKiEIJoiOTC00zUrB+InlOsaKJ9us1tQK8WaTVTYTX6/31
 rvpED6HJyNuGG1rl9XU0wQy0IalgnzmWgqSRL3jDkJnA7nRTUAah3ImRMrh8aVUYuI
 ZHDm5qFuFV85SFttR4Sxg82jSO18jmLS2XGUpP6lDWMfcsvpaN23VWwQ4rltpydqBZ
 R3WBSwkOGmMBQvBUx5PjSIbTIPo7UZogIzN9tmEHX2Tl0FDnHvZFNugr3Oinv/IHXJ
 r7zY67ZQrzN4yQZ6YvgEZg+GZ6EXm3JjtnoSGPg1my692rl9GFkVE/VWJBnPNIRCyP
 6clygOGhD9QZw==
Date: Tue, 11 Mar 2025 09:07:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
Message-ID: <20250311-intrepid-obedient-lizard-64ad2c@houat>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
 <20250310-invisible-married-firefly-945c84@houat>
 <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dyye5w7y4dznz4ng"
Content-Disposition: inline
In-Reply-To: <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>
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


--dyye5w7y4dznz4ng
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
MIME-Version: 1.0

On Mon, Mar 10, 2025 at 10:18:04PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 10, 2025 at 03:51:53PM +0100, Maxime Ripard wrote:
> > On Sun, Mar 09, 2025 at 10:13:58AM +0200, Dmitry Baryshkov wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >=20
> > > Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
> > > values in the VC4 driver.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
> > >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> > >  2 files changed, 10 insertions(+), 7 deletions(-)
> > >=20
>=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4=
_hdmi.h
> > > index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0=
a2016555aefa81d7934 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > @@ -211,6 +211,13 @@ struct vc4_hdmi {
> > >  	 * KMS hooks. Protected by @mutex.
> > >  	 */
> > >  	enum hdmi_colorspace output_format;
> > > +
> > > +	/**
> > > +	 * @tmds_char_rate: Copy of
> > > +	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
> > > +	 * KMS hooks. Protected by @mutex.
> > > +	 */
> > > +	unsigned long long tmds_char_rate;
> > >  };
> >=20
> > This should be in drm_connector_hdmi if it's useful
>=20
> That would mean bringing the state to a non-state structure on the
> framework level. Is it fine from your POV?

Sorry, I'm changing my mind a little bit, but it's pretty much the same
case than for accessing the infoframes from debugfs: we want to get some
information stored in the state from outside of KMS.

What we did for the infoframes is that we're actually just taking the
connection_mutex from the DRM device and access the drm_connector->state
pointer.

I guess it would also work for ALSA?

Maxime

--dyye5w7y4dznz4ng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ8/vLQAKCRDj7w1vZxhR
xUTYAQDyuqn5t5cMpn/5BQvLfTTmRbB8sQbVEyGnQO76VRXLEgD8DIkV+06Aq3Wk
upcHhxdxp69/BSRmI5L12OmC4dqEywU=
=V2Cq
-----END PGP SIGNATURE-----

--dyye5w7y4dznz4ng--
