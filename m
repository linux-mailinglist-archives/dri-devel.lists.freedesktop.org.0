Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F3CB8752
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 10:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA8E10E2DA;
	Fri, 12 Dec 2025 09:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ss+nqYHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B0610E06D;
 Fri, 12 Dec 2025 09:29:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AFB60600C3;
 Fri, 12 Dec 2025 09:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8672AC113D0;
 Fri, 12 Dec 2025 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765531750;
 bh=4Y0trWSA6DHGVRE3ed/sRuLAw25mc+/m3MPtCTNukkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ss+nqYHYWLULiU+mF9HBLe5548wyj9h1aqYN2/wE9/0FLrw1EGMVQPang29tVIhMY
 Bpkaat0mHjrFT4oFmcBT3VwizPbx1fp61AxFavwiaa9NIHjrC3HxAkkOqnG8PwxMBv
 NCm0c2NZ4Q+nNyhOugao+yfoOCFZXXAx/Whyfp8PS0SKN7uFq/cWLEEofRHWu7KCzK
 z6QHUjBQ7zwfLdJYcr1BBZcMjl+ghYhLVuOdCEsd3V3Wcw1VXeJEWLmsWXgahb9+Bz
 KEpuaZj49+q2Oqk9Z/JKz4z9Y8VGy/s8iOQUN0T1dggi90R7WEOND/pyi9MpB8Fenn
 Bx0IvBLEK9lRg==
Date: Fri, 12 Dec 2025 10:29:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 06/17] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
Message-ID: <20251212-simple-beneficial-koel-daaeb7@penduick>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-6-63e82f1db1e1@collabora.com>
 <20251209-dramatic-caiman-of-luck-db9d0f@houat>
 <9409315.NyiUUSuA9g@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bcme7bdjsb25nb7q"
Content-Disposition: inline
In-Reply-To: <9409315.NyiUUSuA9g@workhorse>
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


--bcme7bdjsb25nb7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 06/17] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
MIME-Version: 1.0

On Thu, Dec 11, 2025 at 08:59:14PM +0100, Nicolas Frattaroli wrote:
> On Tuesday, 9 December 2025 15:18:25 Central European Standard Time Maxim=
e Ripard wrote:
> > On Fri, Nov 28, 2025 at 10:05:42PM +0100, Nicolas Frattaroli wrote:
> > > drm_hdmi_connector_mode_valid assumes modes are only valid if they wo=
rk
> > > with RGB. The reality is more complex however: YCbCr 4:2:0
> > > chroma-subsampled modes only require half the pixel clock that the sa=
me
> > > mode would require in RGB.
> > >=20
> > > This leads to drm_hdmi_connector_mode_valid rejecting perfectly valid
> > > 420-only modes.
> > >=20
> > > Fix this by checking whether the mode is 420-only first. If so, then
> > > proceed by checking it with HDMI_COLORSPACE_YUV420 so long as the
> > > connector has legalized 420, otherwise error out. If the mode is not
> > > 420-only, check with RGB as was previously always the case.
> > >=20
> > > Fixes: 47368ab437fd ("drm/display: hdmi: add generic mode_valid helpe=
r")
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/driver=
s/gpu/drm/display/drm_hdmi_state_helper.c
> > > index 5da956bdd68c..1800e00b30c5 100644
> > > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > @@ -892,8 +892,18 @@ drm_hdmi_connector_mode_valid(struct drm_connect=
or *connector,
> > >  			      const struct drm_display_mode *mode)
> > >  {
> > >  	unsigned long long clock;
> > > +	enum hdmi_colorspace fmt;
> > > +
> > > +	if (drm_mode_is_420_only(&connector->display_info, mode)) {
> > > +		if (connector->ycbcr_420_allowed)
> > > +			fmt =3D HDMI_COLORSPACE_YUV420;
> > > +		else
> > > +			return MODE_NO_420;
> > > +	} else {
> > > +		fmt =3D HDMI_COLORSPACE_RGB;
> > > +	}
> > > =20
> > > -	clock =3D drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> > > +	clock =3D drm_hdmi_compute_mode_clock(mode, 8, fmt);
> >=20
> > I agree on principle, but we need to have a test for this.
>=20
> I'd like to change `drm_mode_is_420_only` to `drm_mode_is_420` in
> the next revision, and modify the control flow to work correctly
> in this case, because rejecting 420-also modes on the basis that
> we can't do them in RGB isn't correct either.
>=20
> But my concern with adding yet more tests is that I found this bug
> in a function unrelated to the series while adding tests you asked
> for, because the tests relied on this function to not be broken as
> part of the test setup. Yes, I was not be able to get any 4:2:0
> modes on the test connector in the kunit tests because
> drm_hdmi_connector_mode_valid helpfully discarded all of them.
>=20
> So now I am wondering whether adding yet more tests will uncover
> more bugs in functions unrelated to implementing the "color format"
> property, that were only called because the new test required them
> to set up some test fixture. And then I have to add another fix and
> another test to this series, rinse and repeat.
>
> Can we just agree that I am not going to expand the scope of this
> series any further? If you want me to send a follow-up series that
> adds tests to some of the hdmi state helper functions, then I can
> do that, but I don't want to do it as a precondition for the 17
> other patches in this series to get merged.

But it is a precondition. See

https://docs.kernel.org/gpu/drm-internals.html#kunit-coverage-rules

You're adding code to a port of DRM that is covered by tests already,
and are fixing a hole in that test coverage. We must add a test to close
that hole too.

Now, if you want to take that fix out of your series and work on those
tests, fine, but we'll still need them.

Maxime

--bcme7bdjsb25nb7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTvgYgAKCRAnX84Zoj2+
dhPlAYCpdm2NyG+oIaav75cv25jBzfvF31Ii9Fszuau4fA+z5B/Y+wBjKbc7J/i6
qR6j7NcBgPEVjG+vtRLMFETHKH3AMrGsJiVT0rP+vftHCKTFx9Pynxz6wMwPZrVH
CLCYx1nNFg==
=cyOY
-----END PGP SIGNATURE-----

--bcme7bdjsb25nb7q--
