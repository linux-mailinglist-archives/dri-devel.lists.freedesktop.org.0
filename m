Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE36A612F3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 14:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F6910E262;
	Fri, 14 Mar 2025 13:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="clTra7lE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180E810E262;
 Fri, 14 Mar 2025 13:46:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C3EF0A473F8;
 Fri, 14 Mar 2025 13:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92F0C4CEE3;
 Fri, 14 Mar 2025 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741959972;
 bh=kG9YcXXe1cbZbLfupzKYTp2A/y7Gzkui3p5zYGJuj/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=clTra7lE6wkQUDWb7IgD0FI+2bC1kVpCOXyRWrvDRVdu1ZpdiMN6wQvlHOrfLtWLa
 oKkLgIYZy+oG3NnKNxkwNpb+q+7Hpe+zIqbhnGQE+ZnuIwoUrUbmZpZXslFW4IGagR
 7DQE0HDChV9e78blBxxgIjPAG/Qay+5y6mlqisMfFt0lgCmltx9wpDkJCBJHmegnEm
 3rnofCBm1K2nYs0Osxgl4uL9UD863H/VZz8aIAL4h5vr4gcD621NxHemtmTsdWSWg4
 sqQkI+YvVmiBUzTfnwmYQmG0cdJFP/ztKF/gsgCpG4RpMghFoJXAW1xZcjbRcQKE+m
 cbPBVROEY8Uvw==
Date: Fri, 14 Mar 2025 14:46:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
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
Message-ID: <20250314-sassy-illustrious-koala-3ad3dd@houat>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
 <20250310-invisible-married-firefly-945c84@houat>
 <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>
 <20250311-intrepid-obedient-lizard-64ad2c@houat>
 <wass63nz24l4h3umszsyptb5bnkny4h2wmnbeunjrdfhyacl4l@w6emq2ipt552>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lgxefnuq2liy2pgd"
Content-Disposition: inline
In-Reply-To: <wass63nz24l4h3umszsyptb5bnkny4h2wmnbeunjrdfhyacl4l@w6emq2ipt552>
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


--lgxefnuq2liy2pgd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
MIME-Version: 1.0

On Tue, Mar 11, 2025 at 06:28:50PM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 11, 2025 at 09:07:10AM +0100, Maxime Ripard wrote:
> > On Mon, Mar 10, 2025 at 10:18:04PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Mar 10, 2025 at 03:51:53PM +0100, Maxime Ripard wrote:
> > > > On Sun, Mar 09, 2025 at 10:13:58AM +0200, Dmitry Baryshkov wrote:
> > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > >=20
> > > > > Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and =
CTS
> > > > > values in the VC4 driver.
> > > > >=20
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
> > > > >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> > > > >  2 files changed, 10 insertions(+), 7 deletions(-)
> > > > >=20
> > >=20
> > > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4=
/vc4_hdmi.h
> > > > > index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521=
f3d0a2016555aefa81d7934 100644
> > > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > > > > @@ -211,6 +211,13 @@ struct vc4_hdmi {
> > > > >  	 * KMS hooks. Protected by @mutex.
> > > > >  	 */
> > > > >  	enum hdmi_colorspace output_format;
> > > > > +
> > > > > +	/**
> > > > > +	 * @tmds_char_rate: Copy of
> > > > > +	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
> > > > > +	 * KMS hooks. Protected by @mutex.
> > > > > +	 */
> > > > > +	unsigned long long tmds_char_rate;
> > > > >  };
> > > >=20
> > > > This should be in drm_connector_hdmi if it's useful
> > >=20
> > > That would mean bringing the state to a non-state structure on the
> > > framework level. Is it fine from your POV?
> >=20
> > Sorry, I'm changing my mind a little bit, but it's pretty much the same
> > case than for accessing the infoframes from debugfs: we want to get some
> > information stored in the state from outside of KMS.
> >=20
> > What we did for the infoframes is that we're actually just taking the
> > connection_mutex from the DRM device and access the drm_connector->state
> > pointer.
> >=20
> > I guess it would also work for ALSA?
>=20
> I'd really prefer to follow the drm_connector.infoframes.audio. It makes
> sense to group all ALSA-related functionality together. Maybe I should
> refactor it to:

That's the thing though: the tmds_char_rate has nothing to do with ALSA.
It's useful to derive the parameters, but KMS controls it, it's part of
its state, and that's where it belongs.

Just like any infoframe but the audio one.

Maxime

--lgxefnuq2liy2pgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QzIAAKCRAnX84Zoj2+
dplpAX4zyoXGmt8L6EuI420GBkb+XOKVXcGS+egSQKo+S1OfWJHG6HZW38GqbssP
fjmkKF8BgNpvt+tdJXXUBwFvJQW1RruCsBC1C2+GIsa8kKs7sNwGUIavPY8bga0M
xdIf4IgtJg==
=L//b
-----END PGP SIGNATURE-----

--lgxefnuq2liy2pgd--
